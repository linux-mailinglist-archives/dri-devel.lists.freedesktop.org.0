Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009935ED9BC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 12:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C5910E3C6;
	Wed, 28 Sep 2022 10:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9410E3C6;
 Wed, 28 Sep 2022 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664359447; x=1695895447;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cfUdC/u8cD9k0udq0s/AJfjTO75Rid7k8jDZof1w8Vo=;
 b=Hux9jMRjYqmyX7x1U3OHbveXBKzeYpaM6uQrH6bg2ISvIyugyQJaaM/V
 yAcnoQ9AzR6mNbc8WVj1q+NcK3mF+7A8RIVu55o1AlqgiI8Ca7FZbMRIo
 GMMfirfCol0q/UaDukTKbmWzk6kWDMWtWjsaWVotOIu4K+2Yi5mo7Dlbo
 mpczxz/hIG57o6tWn3pZB3qhGhyPEPbfLZTTVm+KVCBOw2CpWtjNL8clk
 +iLUi4CuUfLpJWPCDFCP8j+euCpAAnUJTbMVSsTJ8KkDuvHWtkwAqIda3
 BJJCfLYPqyJwMZ6c+KlfFEFsDjyXLQMM0rUsE7ZwHFQh7BPJVN7ky36JR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281278277"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="281278277"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 03:04:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="624095796"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="624095796"
Received: from novermar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 03:04:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, wayland
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
In-Reply-To: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
Date: Wed, 28 Sep 2022 13:04:01 +0300
Message-ID: <878rm3zuge.fsf@intel.com>
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

On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi all,
>
> Here is v2 of my "drm/kms: control display brightness through drm_connector properties" RFC:
>
> Changes from version 1:
> - Drop bl_brightness_0_is_min_brightness from list of new connector
>   properties.
> - Clearly define that 0 is always min-brightness when setting the brightness
>   through the connector properties.
> - Drop bl_brightness_control_method from list of new connector
>   properties.
> - Phase 1 of the plan has been completed
>
> As discussed already several times in the past:
>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>
> The current userspace API for brightness control offered by
> /sys/class/backlight devices has various issues:
>
> 1. There is no way to map the backlight device to a specific
>    display-output / panel (1)
> 2. Controlling the brightness requires root-rights requiring
>    desktop-environments to use suid-root helpers for this.
> 3. The meaning of 0 is not clearly defined, it can be either off,
>    or minimum brightness at which the display is still readable
>    (in a low light environment)
> 4. It's not possible to change both the gamma and the brightness in the
>    same KMS atomic commit. You'd want to be able to reduce brightness to
>    conserve power, and counter the effects of that by changing gamma to
>    reach a visually similar image. And you'd want to have the changes take
>    effect at the same time instead of reducing brightness at some frame and
>    change gamma at some other frame. This is pretty much impossible to do
>    via the sysfs interface.
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
> multiple backlight-devices for a single internal laptop LCD panel.
>
> A plan to fix this was posted here:
> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
> And a pull-req actually implementing this plan has been send out this week:
> https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/
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
> It is unsure if we will ever be able to do this. For example people using
> non fully integrated desktop environments like e.g. sway often use custom
> scripts binded to hotkeys to get functionality like the brightness
> up/down keyboard hotkeys changing the brightness. This typically involves
> e.g. the xbacklight utility.
>
> Even if the xbacklight utility is ported to use kms with the new connector
> object brightness properties then this still will not work because
> changing the properties will require drm-master rights and e.g. sway will
> already hold those.
>
>
> The drm_connector brightness properties
> =======================================
>
> The new uAPI for this consists of 2 properties:
>
> 1. "display brightness": rw 0-int32_max property controlling the brightness setting
> of the connected display. The actual maximum of this will be less then
> int32_max and is given in "display brightness max".

This could use a few words explaining the choice of range and property
type. (I assume it's because you can't change a range property's max at
runtime. Which is also why you need a separate max property.)

> Unlike the /sys/class/backlight/foo/brightness this brightness property
> has a clear definition for the value 0. The kernel must ensure that 0
> means minimum brightness (so 0 should _never_ turn the backlight off).
> If necessary the kernel must enforce a minimum value by adding
> an offset to the value seen in the property to ensure this behavior.
>
> For example if necessary the driver must clamp 0-255 to 10-255, which then
> becomes 0-245 on the brightness property, adding 10 internally to writes
> done to the brightness property. This adding of an extra offset when
> necessary must only be done on the brightness property,
> the /sys/class/backlight interface should be left unchanged to not break
> userspace which may rely on 0 = off on some systems.
>
> Note amdgpu already does something like this even for /sys/class/backlight,
> see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>
> Also whenever possible the kernel must ensure that the brightness range
> is in perceived brightness, but this cannot always be guaranteed.

Do you mean every step should be a visible change?

> 2. "display brightness max": ro 0-int32_max property giving the actual maximum
> of the display's brightness setting. This will report 0 when brightness
> control is not available.
>
> The value of "display brightness max" may change at runtime, either by
> a legacy drivers/platform/x86 backlight driver loading after the drm
> driver has loaded; or when plugging in a monitor which allows brightness
> control over DDC/CI. In both these cases the max value will change from 0
> to the actual max value, indicating backlight control has become available
> on this connector.

I think this could be a bit more restrictive in stating the allowed
runtime changes. Is it only 0 -> actual max for non-hotpluggable
displays, nothing else, and additionally actual max -> 0 when unplugging
a display?

>
>
> Future extensions
> =================
>
> Some hardware do adaptive brightness in hardware, rather then providing
> an ALS sensor and letting userspace handle this.
>
> One example of this is the Steam deck, which currently uses some custom
> sysfs attributes to allow tweaking (and enable/disable?) the adaptive
> brightness. Adding standardized uAPI for this through new
> "display brightness *" properties seems like a natural extension of this
> proposal.

Another example is adjusting for non-linear luminance curve. It would be
nicer for equal steps in brightness value to have similar luminance
changes. I think sometimes we lose precision with the limited number of
steps in UIs. But this is thinking pretty far ahead. :)

Other than the minor clarifications, the plans sounds good to me.

Thanks again for doing all this, much appreciated!


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
>

-- 
Jani Nikula, Intel Open Source Graphics Center
