Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485F345200
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 22:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5A26E5D2;
	Mon, 22 Mar 2021 21:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FE66E5C5;
 Mon, 22 Mar 2021 21:47:58 +0000 (UTC)
IronPort-SDR: gNLy2OR0jfRqH89oPqz37pLv6lp1gyWBU+4xXPckZQvftRQTwJ7cR6MSs0r3jTWgRyJ0xxWypy
 k/tPDipP2+sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="169685853"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="169685853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 14:47:57 -0700
IronPort-SDR: 8sdzsjxt01fD4ce3aD5dANoMhnFI75F3I5cumEYgBAHTYyaqIYNNSez8bhJ9ORz/VaK6us3Tkx
 iTpV7eJiINVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407995682"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 22 Mar 2021 14:47:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Mar 2021 23:47:54 +0200
Date: Mon, 22 Mar 2021 23:47:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
Message-ID: <YFkQigJmpLRJWxzb@intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
 <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 10:28:06PM +0100, Hans de Goede wrote:
> Hi,
> =

> On 3/22/21 9:59 PM, Ville Syrj=E4l=E4 wrote:
> > On Mon, Mar 22, 2021 at 04:51:47PM -0400, Rodrigo Vivi wrote:
> >> On Fri, Mar 19, 2021 at 04:45:32PM +0100, Hans de Goede wrote:
> >>> Hi,
> >>>
> >>> On 3/1/21 4:43 PM, Hans de Goede wrote:
> >>>> After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> >>>> displays gracefully on reboot"), the DSI panel on a Cherry Trail bas=
ed
> >>>> Predia Basic tablet would no longer properly light up after reboot.
> >>>>
> >>>> The backlight still turns back on after reboot, but the LCD shows an
> >>>> all black display. The display is also all black during the time that
> >>>> EFI / the GOP is managing it, so e.g. the grub menu also is not visi=
ble.
> >>>>
> >>>> In this scenario the panel is initialized so that it appears to be w=
orking
> >>>> and the fastboot code skips doing a modeset. Forcing a modeset by do=
ing a
> >>>> chvt to a text-console over ssh followed by echo-ing 1 and then 0 to
> >>>> /sys/class/graphics/fb0/blank causes the panel to work again.
> >>>>
> >>>> Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown() i=
nto
> >>>> a no-op when set; and set this on vlv/chv devices when a DSI panel is
> >>>> detected, to work around this.
> >>>>
> >>>> Admittedly this is a bit of a big hammer, but these platforms have b=
een
> >>>> around for quite some time now and they have always worked fine with=
out
> >>>> the new behavior to shutdown everything on shutdown/reboot. This app=
roach
> >>>> simply disables the recently introduced new shutdown behavior in this
> >>>> specific case where it is known to cause problems. Which is a nice a=
nd
> >>>> simple way to deal with this.
> >>>>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>
> >>> Ping? Since sending this patch I've been seeing the issue addressed by
> >>> this on variour other CHT based devices too.
> >>>
> >>> So we have various devices suffering from a black screen after reboot
> >>> now. This is pretty serious usability regression.
> >>>
> >>> As such it would be good to get this reviewed, or another fix propose=
d.
> >>
> >> For the quirks we try to limit them to very specific vendor and model =
ids,
> >> so I wonder if it would be possible to get this information in here in=
stead
> >> to all the vlv with dsi...
> >>
> >> Or avoid the quirk "infra" and skip to all vlv with active dsi?!
> >>
> >> Jani?
> >> Ville?
> > =

> > We need to figure out why the panel doesn't start up again.
> =

> Note it is the GOP which fails to light it up again. I think we turn some=
thing
> off, which after a power-on-reset is on, so the GOP expects it to be on.

Hmm. Do any of the reboot=3Dwarm|cold|whatever knobs make a difference?
Are there any fast vs. slow boot settings in the BIOS setup?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
