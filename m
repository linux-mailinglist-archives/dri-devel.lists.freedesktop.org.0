Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D73466CA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862BB6EC61;
	Tue, 23 Mar 2021 17:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F616EC5D;
 Tue, 23 Mar 2021 17:52:02 +0000 (UTC)
IronPort-SDR: 3NyOKkVJt5v2sZ+bE8pgbvjRkhHFTRtFLRpVfR4UGA9H/wz/OtRFCu7fQyyVmKx85sfaia2wbS
 lcCec8I5faLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190565499"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="190565499"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:52:01 -0700
IronPort-SDR: fCV+LqHVQxSGlXFWnzARSI3YmSpkhTRRYvZeENmPue7Dlir0yPG/x6guVG95mpcA2zEai8YvpF
 vyr0wzm4RBeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="376143115"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 23 Mar 2021 10:51:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 23 Mar 2021 19:51:56 +0200
Date: Tue, 23 Mar 2021 19:51:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display/vlv_dsi: Do no shut down
 displays on reboot if a DSI panel is used
Message-ID: <YFoqvIf3sU0CUe5X@intel.com>
References: <20210301154347.50052-1-hdegoede@redhat.com>
 <8d882647-bab3-dfc3-70ad-4f1910dcb5af@redhat.com>
 <YFkDYzN0NJ3Co8bT@intel.com> <YFkFH2uAR+6mNONZ@intel.com>
 <c1beb028-9f9d-ad3e-9a06-2685ca36a8d4@redhat.com>
 <YFkQigJmpLRJWxzb@intel.com>
 <8a127f0c-ba08-3471-88f4-ef0aa281cd7b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a127f0c-ba08-3471-88f4-ef0aa281cd7b@redhat.com>
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

On Tue, Mar 23, 2021 at 06:29:53PM +0100, Hans de Goede wrote:
> Hi,
> =

> On 3/22/21 10:47 PM, Ville Syrj=E4l=E4 wrote:
> > On Mon, Mar 22, 2021 at 10:28:06PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 3/22/21 9:59 PM, Ville Syrj=E4l=E4 wrote:
> >>> On Mon, Mar 22, 2021 at 04:51:47PM -0400, Rodrigo Vivi wrote:
> >>>> On Fri, Mar 19, 2021 at 04:45:32PM +0100, Hans de Goede wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 3/1/21 4:43 PM, Hans de Goede wrote:
> >>>>>> After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> >>>>>> displays gracefully on reboot"), the DSI panel on a Cherry Trail b=
ased
> >>>>>> Predia Basic tablet would no longer properly light up after reboot.
> >>>>>>
> >>>>>> The backlight still turns back on after reboot, but the LCD shows =
an
> >>>>>> all black display. The display is also all black during the time t=
hat
> >>>>>> EFI / the GOP is managing it, so e.g. the grub menu also is not vi=
sible.
> >>>>>>
> >>>>>> In this scenario the panel is initialized so that it appears to be=
 working
> >>>>>> and the fastboot code skips doing a modeset. Forcing a modeset by =
doing a
> >>>>>> chvt to a text-console over ssh followed by echo-ing 1 and then 0 =
to
> >>>>>> /sys/class/graphics/fb0/blank causes the panel to work again.
> >>>>>>
> >>>>>> Add a QUIRK_SKIP_SHUTDOWN quirk which turns i915_driver_shutdown()=
 into
> >>>>>> a no-op when set; and set this on vlv/chv devices when a DSI panel=
 is
> >>>>>> detected, to work around this.
> >>>>>>
> >>>>>> Admittedly this is a bit of a big hammer, but these platforms have=
 been
> >>>>>> around for quite some time now and they have always worked fine wi=
thout
> >>>>>> the new behavior to shutdown everything on shutdown/reboot. This a=
pproach
> >>>>>> simply disables the recently introduced new shutdown behavior in t=
his
> >>>>>> specific case where it is known to cause problems. Which is a nice=
 and
> >>>>>> simple way to deal with this.
> >>>>>>
> >>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>>
> >>>>> Ping? Since sending this patch I've been seeing the issue addressed=
 by
> >>>>> this on variour other CHT based devices too.
> >>>>>
> >>>>> So we have various devices suffering from a black screen after rebo=
ot
> >>>>> now. This is pretty serious usability regression.
> >>>>>
> >>>>> As such it would be good to get this reviewed, or another fix propo=
sed.
> >>>>
> >>>> For the quirks we try to limit them to very specific vendor and mode=
l ids,
> >>>> so I wonder if it would be possible to get this information in here =
instead
> >>>> to all the vlv with dsi...
> >>>>
> >>>> Or avoid the quirk "infra" and skip to all vlv with active dsi?!
> >>>>
> >>>> Jani?
> >>>> Ville?
> >>>
> >>> We need to figure out why the panel doesn't start up again.
> >>
> >> Note it is the GOP which fails to light it up again. I think we turn s=
omething
> >> off, which after a power-on-reset is on, so the GOP expects it to be o=
n.
> > =

> > Hmm. Do any of the reboot=3Dwarm|cold|whatever knobs make a difference?
> > Are there any fast vs. slow boot settings in the BIOS setup?
> =

> Ok, so I was running the tests which you requested and during this
> I managed to find the real problem.
> =

> What happens on reboot is a really quick panel off/on cycle and that is
> causing the issue.
> =

> I can reproduce this by doing:
> =

> chvt 3; echo 1 > /sys/class/graphics/fb0/blank; echo 0 > /sys/class/graph=
ics/fb0/blank
> =

> The problem is that we're not honoring panel_pwr_cycle_delay because
> intel_dsi_msleep() is a no-op on devices with a MIPI-sequences version >=
=3D 3,
> because those sequences already contain the necessary delays, at least
> for most of the steps during the on/off sequences. It seems that the
> pwr-cycle delay is not handled by those v3+ sequences.
> =

> So fixing this is as simple as switching to a regular msleep for the
> intel_dsi->panel_pwr_cycle_delay.
> =

> Once we do that it would be good (for e.g. suspend/resume speed) to fix:
> =

>         /*
>          * FIXME As we do with eDP, just make a note of the time here
>          * and perform the wait before the next panel power on.
>          */
> =

> Which sits right above that msleep. Since I have a reproducer now which
> shows when the sleep is too short, it should now be easy ti fix the FIXME
> and test that the fix works. I'll do this in a separate patch and send
> a patch-set with both patches replacing this patch.

Awesome. I'm really happy to avoid any quirks and whatnot since
they always come back to bite you later. Thanks for digging into it.

Speaking of DSI, you wouldn't happen to have one these machines:
https://gitlab.freedesktop.org/drm/intel/-/issues/2698 ? Haven't gotten
a response from the bug reporter so no idea if my quick patch helps or
not.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
