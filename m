Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E341500E60
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFF210FBA3;
	Thu, 14 Apr 2022 13:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E589B10FCAC;
 Thu, 14 Apr 2022 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649941821; x=1681477821;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KXLioFjW33NWAoRC99EnMDMmJdPNNIhMoNP2ckhD2qI=;
 b=h11aFwx3smiSwJ/UlwTQ60ryWR6rEKDmvlsUVpebb61TeMf6yICc6Ipk
 D29+2FAm3U2x4ApBD+jewWIRaleFtYrJDOW+pk4eYL9QefItX1VWjVasy
 eEdWkpdXoY66LptHbqL6kazIjFfEThCQBjg5czzSsNqfFOWToFzFR4ElP
 zL9T7sF6kT1fjqgfdhxt3t9LemmrTE6pgcIogFkH/JkZytEfxIEgN/Xh0
 toiovondR3jlqTtUnKqBABgN9RrOwG1o9zlO7aw3ZbIqbnyYClkE9NWqL
 jKx92aF5ygNriLZEiYkqTPvtJbka0auqCGe3iE8hiW5wacpjgczjx9OPG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="287980716"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="287980716"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:10:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="552676115"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:10:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, wayland
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
In-Reply-To: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
Date: Thu, 14 Apr 2022 16:10:17 +0300
Message-ID: <87pmljerpi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> As discussed already several times in the past:
>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>
> The current userspace API for brightness control offered by
> /sys/class/backlight devices has various issues, the biggest 2 being:
>
> 1. There is no way to map the backlight device to a specific
>    display-output / panel (1)
> 2. Controlling the brightness requires root-rights requiring
>    desktop-environments to use suid-root helpers for this.
>
> As already discussed on various conference's hallway tracks
> and as has been proposed on the dri-devel list once before (2),
> it seems that there is consensus that the best way to to solve these
> 2 issues is to add support for controlling a video-output's brightness
> through properties on the drm_connector.
>
> This RFC outlines my plan to try and actually implement this,
> which has 3 phases:
>
>
> Phase 1: Stop registering multiple /sys/class/backlight devs for a single display
> =================================================================================
>
> On x86 there can be multiple firmware + direct-hw-access methods
> for controlling the backlight and in some cases the kernel registers
> multiple backlight-devices for a single internal laptop LCD panel:
>
> a) i915 and nouveau unconditionally register their "native" backlight dev
>    even on devices where /sys/class/backlight/acpi_video0 must be used
>    to control the backlight, relying on userspace to prefer the "firmware"
>    acpi_video0 device over "native" devices.
> b) amdgpu and nouveau rely on the acpi_video driver initializing before
>    them, which currently causes /sys/class/backlight/acpi_video0 to usually
>    show up and then they register their own native backlight driver after
>    which the drivers/acpi/video_detect.c code unregisters the acpi_video0
>    device. This means that userspace briefly sees 2 devices and the
>    disappearing of acpi_video0 after a brief time confuses the systemd
>    backlight level save/restore code, see e.g.:
>    https://bbs.archlinux.org/viewtopic.php?id=269920
>
> I already have a pretty detailed plan to tackle this, which I will
> post in a separate RFC email. I plan to start working on this right
> away, as it will be good to have this fixed regardless.
>
>
> Phase 2: Add drm_connector properties mirroring the matching backlight device
> =============================================================================
>
> The plan is to add a drm_connector helper function, which optionally takes
> a pointer to the backlight device for the GPU's native backlight device,
> which will then mirror the backlight settings from the backlight device
> in a set of read/write brightness* properties on the connector.
>
> This function can then be called by GPU drivers for the drm_connector for
> the internal panel and it will then take care of everything. When there
> is no native GPU backlight device, or when it should not be used then
> (on x86) the helper will use the acpi_video_get_backlight_type() to
> determine which backlight-device should be used instead and it will find
> + mirror that one.
>
>
> Phase 3: Deprecate /sys/class/backlight uAPI
> ============================================
>
> Once most userspace has moved over to using the new drm_connector
> brightness props, a Kconfig option can be added to stop exporting
> the backlight-devices under /sys/class/backlight. The plan is to
> just disable the sysfs interface and keep the existing backlight-device
> internal kernel abstraction as is, since some abstraction for (non GPU
> native) backlight devices will be necessary regardless.
>
> An alternative to disabling the sysfs class entirely, would be
> to allow setting it to read-only through Kconfig.
>
>
> What scale to use for the drm_connector bl_brightness property?
> ===============================================================
>
> The tricky part of this plan is phase 2 and then esp. defining what the
> new brightness properties will look like and how they will work.
>
> The biggest challenge here is to decide on a fixed scale for the main
> brightness property, say 0-65535, using scaling where the actual hw scale
> is different, or if this should simply be a 1:1 mirror of the current
> backlight interface, with the actual hw scale / brightness_max value
> exposed as a drm_connector property.
>
> 1:1 advantages / 0-65535 disadvantages
> - Userspace will likely move over to the connector-props quite slowly and
>   we can expect various userspace bits, esp. also custom user scripts, to
>   keep using the old uAPI for a long time. Using the 2 APIs are intermixed
>   is fine when using a 1:1 brightness scale mapping. But if we end up doing
>   a scaling round-trip all the time then eventually the brightness is going
>   do drift. This can even happen if the user never changes the brightness
>   when userspace saves it over suspend/resume or reboots.
> - Almost all laptops have brightness up/down hotkeys. E.g GNOME decides
>   on a step size for the hotkeys by doing min(brightness_max/20, 1).
>   Some of the vendor specific backlight fw APIs (e.g. dell-laptop) have
>   only 8 steps. When giving userspace the actual max_brightness value, then
>   this will all work just fine. When hardcode brightness_max to 65535 OTOH
>   then in this case GNOME will still give the user 20 steps where only 1
>   in every 2-3 steps actually changes the brightness which IMHO is
>   an unacceptably bad user experience.
>
> 0-65535 advantages / 1:1 disadvantages
> - Without a fixed scale for the brightness property the brightness_max
>   value may change after an userspace application's initial enumeration
>   of the drm_connector. This can happen when neither the native GPU nor
>   the acpi_video backlight devices are present/usable in this case
>   acpi_video_get_backlight_type() will _assume_ a vendor specific fw API
>   will be used for backlight control and the driver proving the "vendor"
>   backlight device will show up much later and may even never show-up,
>   so waiting for it is not an option. With a fixed 0-65535 scale userspace
>   can just always assume this and the drm_connector backlight props helper
>   code can even cache writes and send it to the actual backlight device
>   when it shows up. With a 1:1 mapping userspace needs to listen for
>   a uevent and then update the brightness range on such an event.
>
> I believe that the 1:1 mapping advantages out way the disadvantages
> here. Also note that current userspace already blindly assumes that
> all relevant drivers are loaded before the graphical-environment
> starts and all the desktop environments as such already only do
> a single scan of /sys/class/backlight when they start. So when
> userspace forgets to add code to listen for the uevent when switching
> to the new API nothing changes; and with the uevent userspace actually
> gets a good mechanism to detect backlight drivers loading after
> the graphical-environment has already started.
>
> So based on this here is my proposal for a set of new brightness
> properties on the drm_connector object. Note these are all prefixed with
> bl which stands for backlight, which is technically not correct for OLED.
> But we need a prefix to avoid a name collision with the "brightness"
> attribute which is part of the existing TV specific properties and IMHO
> it is good to have a common prefix to make it clear that these all
> belong together.
>
>
> The drm_connector brightness properties
> =======================================
>
> bl_brightness: rw 0-int32_max property controlling the brightness setting
> of the connected display. The actual maximum of this will be less then
> int32_max and is given in bl_brightness_max.
>
> bl_brightness_max: ro 0-int32_max property giving the actual maximum
> of the display's brightness setting. This will report 0 when brightness
> control is not available (yet).
>
> bl_brightness_0_is_min_brightness: ro, boolean
> When this is set to true then it is safe to set brightness to 0
> without worrying that this completely turns the backlight off causing
> the screen to become unreadable. When this is false setting brightness
> to 0 may turn the backlight off, but this is _not_ guaranteed.
> This will e.g. be true when directly driving a PWM and the video-BIOS
> has provided a minimum (non 0) duty-cycle below which the driver will
> never go.
>
> bl_brightness_control_method: ro, enum, possible values:
> none:     The GPU driver expects brightness control to be provided by another
>           driver and that driver has not loaded yet.
> unknown:  The underlying control mechanism is unknown.
> pwm:      The brightness property directly controls the duty-cycle of a PWM
>           output.
> firmware: The brightness is controlled through firmware calls.
> DDC/CI:   The brightness is controlled through the DDC/CI protocol.
> gmux:     The brightness is controlled by the GMUX.
> Note this enum may be extended in the future, so other values may
> be read, these should be treated as "unknown".

Some eDP panels support brightness control via DPCD, in complex
ways. Some of them support mixed modes via both DPCD and PWM
simultaneously. Some of them support luminance based control.

DSI command mode panels support brightness control via DCS commands.

> When brightness control becomes available after being reported
> as not available before (bl_brightness_control_method=="none")
> a uevent with CONNECTOR=<connector-id> and
> PROPERTY=<bl_brightness_control_method-id> will be generated
> at this point all the properties must be re-read.
>
> When/once brightness control is available then all the read-only
> properties are fixed and will never change.
>
> Besides the "none" value for no driver having loaded yet,
> the different bl_brightness_control_method values are intended for
> (userspace) heuristics for such things as the brightness setting
> linearly controlling electrical power or setting perceived brightness.

I'm not sure if it's a good idea to expose this with the goal that it's
to be used for heuristics. We usually don't even know if we're
controlling actual backlight brightness or just the OLED
brightness. Basically any of the methods could be used to control OLED,
or some HDR display with luminance based controls, and the heuristics
would be off.

There are some cases where we can actually get a rough PWM/luminance
curve from i915 opregion. I think maybe 16 data points. We've never
exposed that. My idea was that you'd have a property where you could add
data points for the curve, it could get pre-populated by the kernel if
the kernel knows how to do it, defaulting to linear, but it could also
be set or adjusted by userspace. The point would be that the userspace
adjusts brightness linearly, and the kernel would use the curve data
points to adjust it non-linearly. The userspace could have completely
separated brightness adjustment and curve adjustment, and the brightness
adjustment would be dead simple.

Finally, I'd drop "backlight" as a term throughout. It's brightness
we're setting, and backlight is just a panel implementation detail.


BR,
Jani.

>
> Regards,
>
> Hans
>
>
> 1) The need to be able to map the backlight device to a specific display
> has become clear once more with the recent proposal to add DDCDI support:
> https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/
>
> 2) https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
> Note this proposal included a method for userspace to be able to tell the
> kernel if the native/acpi_video/vendor backlight device should be used,
> but this has been solved in the kernel for years now:
>  https://www.spinics.net/lists/linux-acpi/msg50526.html
> An initial implementation of this proposal is available here:
>  https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight
>

-- 
Jani Nikula, Intel Open Source Graphics Center
