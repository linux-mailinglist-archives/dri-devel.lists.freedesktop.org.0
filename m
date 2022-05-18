Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B752B520
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 10:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D53810EBCB;
	Wed, 18 May 2022 08:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1C010E372;
 Wed, 18 May 2022 08:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652863472; x=1684399472;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XWicXPx7qnhfFABNS1l5dl2VOO4pNX2GTW1hcTiZh/Y=;
 b=JzpGjGKHK8tQfWVepD0V2+50aPAgGU/xoRx/jihhSYtPtBc18ocXZmMp
 1XiCqpIiowbGXdu3y+WOYwX4OO2Y+B54ifxJp9UtFb4WUGwX3D7CDLgBW
 gFl2d/V2u60CfbNSrxC5/ribFzRFBMQgxjel6ykopYWZcnHorrJRky2DU
 wKb/7MOGIefohPVYkFPwee4xTOp5BBV4HQjwK8tY4TTwxav7xG2jISZgA
 3K21+QJ/j2komdi7iJ4cGJeyLGUTTXvNReehzqPTeHJ5jyOYIggPq2MRm
 wNoE2lNrh5cHH39cPP9QEFTXLtv1a4DfGdxNVZrXX3A1JU9WrKOz4QJkG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="269142376"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="269142376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:44:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="742221317"
Received: from ksobisz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:44:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH 00/14] drm/kms: Stop registering multiple
 /sys/class/backlight devs for a single display
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220517152331.16217-1-hdegoede@redhat.com>
Date: Wed, 18 May 2022 11:44:20 +0300
Message-ID: <871qwrfcwr.fsf@intel.com>
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
>
> As mentioned in my RFC titled "drm/kms: control display brightness through
> drm_connector properties":
> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>
> The first step towards this is to deal with some existing technical debt
> in backlight handling on x86/ACPI boards, specifically we need to stop
> registering multiple /sys/class/backlight devs for a single display.

I guess my question here is, how do you know it's for a *single*
display?

There are already designs out there with two flat panels, with
independent brightness controls. They're still rare and I don't think we
handle them very well. But we've got code to register multiple native
backlight interfaces, see e.g. commit 20f85ef89d94 ("drm/i915/backlight:
use unique backlight device names").

So imagine a design where one of the panels needs backlight control via
ACPI and the other via native backlight control. Granted, I don't know
if one exists, but I think it's very much in the realm of possible
things the OEMs might do. For example, have an EC PWM for primary panel
backlight, and use GPU PWM for secondary. How do you know you actually
do need to register two interfaces?

I'm fine with dealing with such cases as they arise to avoid
over-engineering up front, but I also don't want us to completely paint
ourselves in a corner either.

BR,
Jani.


>
> This series implements my RFC describing my plan for these cleanups:
> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>
> Specifically patches 1-6 implement the "Fixing kms driver unconditionally
> register their "native" backlight dev" part.
>
> And patches 7-14 implement the "Fixing acpi_video0 getting registered for
> a brief time" time.
>
> Note this series does not deal yet with the "Other issues" part, I plan
> to do a follow up series for that.
>
> The changes in this series are good to have regardless of the further
> "drm/kms: control display brightness through drm_connector properties"
> plans. So I plan to push these upstream once they are ready (once
> reviewed). Since this crosses various subsystems / touches multiple
> kms drivers my plan is to provide an immutable branch based on say
> 5.19-rc1 and then have that get merged into all the relevant trees.
>
> Please review.
>
> Regards,
>
> Hans
>
>
> Hans de Goede (14):
>   ACPI: video: Add a native function parameter to
>     acpi_video_get_backlight_type()
>   drm/i915: Don't register backlight when another backlight should be
>     used
>   drm/amdgpu: Don't register backlight when another backlight should be
>     used
>   drm/radeon: Don't register backlight when another backlight should be
>     used
>   drm/nouveau: Don't register backlight when another backlight should be
>     used
>   ACPI: video: Drop backlight_device_get_by_type() call from
>     acpi_video_get_backlight_type()
>   ACPI: video: Remove acpi_video_bus from list before tearing it down
>   ACPI: video: Simplify acpi_video_unregister_backlight()
>   ACPI: video: Make backlight class device registration a separate step
>   ACPI: video: Remove code to unregister acpi_video backlight when a
>     native backlight registers
>   drm/i915: Call acpi_video_register_backlight()
>   drm/nouveau: Register ACPI video backlight when nv_backlight
>     registration fails
>   drm/amdgpu: Register ACPI video backlight when skipping amdgpu
>     backlight registration
>   drm/radeon: Register ACPI video backlight when skipping radeon
>     backlight registration
>
>  drivers/acpi/acpi_video.c                     | 69 ++++++++++++++-----
>  drivers/acpi/video_detect.c                   | 53 +++-----------
>  drivers/gpu/drm/Kconfig                       |  2 +
>  .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 14 +++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++
>  .../gpu/drm/i915/display/intel_backlight.c    |  7 ++
>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_backlight.c   | 14 ++++
>  drivers/gpu/drm/radeon/atombios_encoders.c    |  7 ++
>  drivers/gpu/drm/radeon/radeon_encoders.c      | 11 ++-
>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  7 ++
>  drivers/platform/x86/acer-wmi.c               |  2 +-
>  drivers/platform/x86/asus-laptop.c            |  2 +-
>  drivers/platform/x86/asus-wmi.c               |  4 +-
>  drivers/platform/x86/compal-laptop.c          |  2 +-
>  drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>  drivers/platform/x86/eeepc-laptop.c           |  2 +-
>  drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>  drivers/platform/x86/ideapad-laptop.c         |  2 +-
>  drivers/platform/x86/intel/oaktrail.c         |  2 +-
>  drivers/platform/x86/msi-laptop.c             |  2 +-
>  drivers/platform/x86/msi-wmi.c                |  2 +-
>  drivers/platform/x86/samsung-laptop.c         |  2 +-
>  drivers/platform/x86/sony-laptop.c            |  2 +-
>  drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>  drivers/platform/x86/toshiba_acpi.c           |  2 +-
>  include/acpi/video.h                          |  8 ++-
>  28 files changed, 156 insertions(+), 84 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
