Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB86834513E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 21:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7159C6E5A4;
	Mon, 22 Mar 2021 20:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5566E5A4;
 Mon, 22 Mar 2021 20:59:15 +0000 (UTC)
IronPort-SDR: 8R4Yv5k9gChAVKNmmBEML9xk400B8Mxz5NzFLeK1jh5i3yARTYKOgOVA0kuMMJQTB/GthFi+49
 unyKCmB22GFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275447506"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275447506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 13:59:15 -0700
IronPort-SDR: iSvqqlK7bTDq10uZDs28YbOaFnd3Ph27zFjcUT07eN21plPcb0J2d3/dEUOQPY61614R/lyHDf
 IJAysGUdvheQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="513444869"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 22 Mar 2021 13:59:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Mar 2021 22:59:11 +0200
Date: Mon, 22 Mar 2021 22:59:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
Message-ID: <YFkFH2uAR+6mNONZ@intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFkDYzN0NJ3Co8bT@intel.com>
X-Patchwork-Hint: comment
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 04:51:47PM -0400, Rodrigo Vivi wrote:
> On Fri, Mar 19, 2021 at 04:45:32PM +0100, Hans de Goede wrote:
> > Hi,
> > =

> > On 3/1/21 4:43 PM, Hans de Goede wrote:
> > > After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> > > displays gracefully on reboot"), the DSI panel on a Cherry Trail based
> > > Predia Basic tablet would no longer properly light up after reboot.
> > > =

> > > The backlight still turns back on after reboot, but the LCD shows an
> > > all black display. The display is also all black during the time that
> > > EFI / the GOP is managing it, so e.g. the grub menu also is not visib=
le.
> > > =

> > > In this scenario the panel is initialized so that it appears to be wo=
rking
> > > and the fastboot code skips doing a modeset. Forcing a modeset by doi=
ng a
> > > chvt to a text-console over ssh followed by echo-ing 1 and then 0 to
> > > /sys/class/graphics/fb0/blank causes the panel to work again.
> > > =

> > > Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown() in=
to
> > > a no-op when set; and set this on vlv/chv devices when a DSI panel is
> > > detected, to work around this.
> > > =

> > > Admittedly this is a bit of a big hammer, but these platforms have be=
en
> > > around for quite some time now and they have always worked fine witho=
ut
> > > the new behavior to shutdown everything on shutdown/reboot. This appr=
oach
> > > simply disables the recently introduced new shutdown behavior in this
> > > specific case where it is known to cause problems. Which is a nice and
> > > simple way to deal with this.
> > > =

> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > =

> > Ping? Since sending this patch I've been seeing the issue addressed by
> > this on variour other CHT based devices too.
> > =

> > So we have various devices suffering from a black screen after reboot
> > now. This is pretty serious usability regression.
> > =

> > As such it would be good to get this reviewed, or another fix proposed.
> =

> For the quirks we try to limit them to very specific vendor and model ids,
> so I wonder if it would be possible to get this information in here inste=
ad
> to all the vlv with dsi...
> =

> Or avoid the quirk "infra" and skip to all vlv with active dsi?!
> =

> Jani?
> Ville?

We need to figure out why the panel doesn't start up again. If it has
problems with this then surely it also fails if we just happen to reboot
with the panel already off?

Oh a modeset fixes it? Then I guess it's just fastboot fail due to DSI
code being crap? If no one is willing to fix it then I guess we just
need to disable fastboot for DSI somehow.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
