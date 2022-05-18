Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBC52B70C
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960910EB98;
	Wed, 18 May 2022 10:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9A510F8DA;
 Wed, 18 May 2022 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652868765; x=1684404765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=44H2RKOVvKLIP2tGa0I9hHC2mQIuuan1x5+PNtxV9K8=;
 b=d67TUg7y015J1OpiKDbfqx7DrZv8vco9sVHduZQISOc5hFsDnd14l8Gk
 2RteknGhmDDwvtlf9xiXV3dFCEz/sv3Colr00WPrptG3Krz06lDLDzHpc
 kBZW4CGEC1omMJr8Z4OtUX3N5pmqkNJvuVkFk5IxPScCBy89ggqwYITKJ
 hbHCgyW4V3Xf0enjziqgF4EpstTOQv3woaUTloaPH70FH/CrCopSsFJZy
 URDZJHIJn31O5xFIN5YSydCVNIi86xi1D7Ja7PAlh/7uUGkp3Z6xhqJHW
 6gaAXM8aAcbW6VQJtQsI/uxmGGMl7djVYBg7VwfTDRr2A1yfLmwnyE/4s Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="358005832"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="358005832"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 03:12:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="569385910"
Received: from jwasiuki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.47])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 03:12:35 -0700
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
In-Reply-To: <614a7cef-bfe6-c631-dc4c-d9e99a0b0937@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <871qwrfcwr.fsf@intel.com>
 <614a7cef-bfe6-c631-dc4c-d9e99a0b0937@redhat.com>
Date: Wed, 18 May 2022 13:12:33 +0300
Message-ID: <87r14rdu9a.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 5/18/22 10:44, Jani Nikula wrote:
>> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>> Hi All,
>>>
>>> As mentioned in my RFC titled "drm/kms: control display brightness through
>>> drm_connector properties":
>>> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>>>
>>> The first step towards this is to deal with some existing technical debt
>>> in backlight handling on x86/ACPI boards, specifically we need to stop
>>> registering multiple /sys/class/backlight devs for a single display.
>> 
>> I guess my question here is, how do you know it's for a *single*
>> display?
>> 
>> There are already designs out there with two flat panels, with
>> independent brightness controls. They're still rare and I don't think we
>> handle them very well. But we've got code to register multiple native
>> backlight interfaces, see e.g. commit 20f85ef89d94 ("drm/i915/backlight:
>> use unique backlight device names").
>> 
>> So imagine a design where one of the panels needs backlight control via
>> ACPI and the other via native backlight control. Granted, I don't know
>> if one exists, but I think it's very much in the realm of possible
>> things the OEMs might do. For example, have an EC PWM for primary panel
>> backlight, and use GPU PWM for secondary. How do you know you actually
>> do need to register two interfaces?
>
> On x86/ACPI devices this is all driven by acpi_video_get_backlight_type() /
> by the drivers/acpi/video_detect.c code. That code already will break on
> systems where there are 2 backlight controls, with one being ACPI based
> and the other a native GPU PWM backlight device.
>
> In this scenario as soon as the native GPU PWM backlight device shows up
> then, if acpi_video_get_backlight_type()==native, video_detect.c will
> currently unregister the acpi_video# backlight device(s) since userspace
> prefers the firmware type over the native type, so for userspace to
> actually honor the acpi_video_get_backlight_type()==native we need to get
> the acpi_video# backlight device "out of the way" which is currently
> handled by unregistering it.
>
> Note in a way we already have a case where userspace sees 2 panels,
> in hybrid laptop setups with a mux and on those systems we may see
> either 2 native backlight devices; or 2 native backlight devices +
> 2 acpi_video backlight devices with userspace preferring the ACPI
> ones.
>
> Also note that userspace already has code to detect if the related
> panel is active (iow which way the mux between the GPU and the panels
> points) and then uses that backlight device. Userspace here very
> much assumes a single panel though.
>
>> I'm fine with dealing with such cases as they arise to avoid
>> over-engineering up front, but I also don't want us to completely paint
>> ourselves in a corner either.
>
> Right. Note that the current code (both with and without this patchset)
> already will work fine from a kernel pov as long as both panels
> are either using native GPU PWM or are both using ACPI. But if we
> ever get a mix then this will need special handling.
>
> Note that all userspace code I know is currently hardcoded
> to assume a single panel. Userspace already picks one preferred
> device under /sys/class/backlight and ignores the rest. Actually
> atm userspace must behave this way, because on x86/ACPI boards we
> do often register multiple backlight devices for a single panel.
>
> So in a way moving to registering only a single backlight device
> prepares for actually having multiple panels work.
>
> Also keep in mind that this is preparation work for making the
> panel brightness a drm_connector property. When the panel uses
> a backlight device other then the native GPU PWM to control the
> brightness then the helper code for this needs to have a way to
> select which backlight_device to use then and the non native
> types are not "linked" to a specific connector so in this case
> we really need there to be only 1 backlight device registered
> so that the code looking up the (non native) backlight device
> for the connector gets the right one and not merely the one
> which happened to get registered first.
>
> And I believe that having the panel brightness be a drm_connector
> property is the way to make it possible for userspace to deal
> with the multiple panels which each have a separate brightness
> control case.

Agreed.

Thanks for the explanations and recording them here.

BR,
Jani.

>
> Regards,
>
> Hans
>
>
>
>
>
>> 
>> BR,
>> Jani.
>> 
>> 
>>>
>>> This series implements my RFC describing my plan for these cleanups:
>>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>>>
>>> Specifically patches 1-6 implement the "Fixing kms driver unconditionally
>>> register their "native" backlight dev" part.
>>>
>>> And patches 7-14 implement the "Fixing acpi_video0 getting registered for
>>> a brief time" time.
>>>
>>> Note this series does not deal yet with the "Other issues" part, I plan
>>> to do a follow up series for that.
>>>
>>> The changes in this series are good to have regardless of the further
>>> "drm/kms: control display brightness through drm_connector properties"
>>> plans. So I plan to push these upstream once they are ready (once
>>> reviewed). Since this crosses various subsystems / touches multiple
>>> kms drivers my plan is to provide an immutable branch based on say
>>> 5.19-rc1 and then have that get merged into all the relevant trees.
>>>
>>> Please review.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> Hans de Goede (14):
>>>   ACPI: video: Add a native function parameter to
>>>     acpi_video_get_backlight_type()
>>>   drm/i915: Don't register backlight when another backlight should be
>>>     used
>>>   drm/amdgpu: Don't register backlight when another backlight should be
>>>     used
>>>   drm/radeon: Don't register backlight when another backlight should be
>>>     used
>>>   drm/nouveau: Don't register backlight when another backlight should be
>>>     used
>>>   ACPI: video: Drop backlight_device_get_by_type() call from
>>>     acpi_video_get_backlight_type()
>>>   ACPI: video: Remove acpi_video_bus from list before tearing it down
>>>   ACPI: video: Simplify acpi_video_unregister_backlight()
>>>   ACPI: video: Make backlight class device registration a separate step
>>>   ACPI: video: Remove code to unregister acpi_video backlight when a
>>>     native backlight registers
>>>   drm/i915: Call acpi_video_register_backlight()
>>>   drm/nouveau: Register ACPI video backlight when nv_backlight
>>>     registration fails
>>>   drm/amdgpu: Register ACPI video backlight when skipping amdgpu
>>>     backlight registration
>>>   drm/radeon: Register ACPI video backlight when skipping radeon
>>>     backlight registration
>>>
>>>  drivers/acpi/acpi_video.c                     | 69 ++++++++++++++-----
>>>  drivers/acpi/video_detect.c                   | 53 +++-----------
>>>  drivers/gpu/drm/Kconfig                       |  2 +
>>>  .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 14 +++-
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++
>>>  .../gpu/drm/i915/display/intel_backlight.c    |  7 ++
>>>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>>>  drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
>>>  drivers/gpu/drm/nouveau/nouveau_backlight.c   | 14 ++++
>>>  drivers/gpu/drm/radeon/atombios_encoders.c    |  7 ++
>>>  drivers/gpu/drm/radeon/radeon_encoders.c      | 11 ++-
>>>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  7 ++
>>>  drivers/platform/x86/acer-wmi.c               |  2 +-
>>>  drivers/platform/x86/asus-laptop.c            |  2 +-
>>>  drivers/platform/x86/asus-wmi.c               |  4 +-
>>>  drivers/platform/x86/compal-laptop.c          |  2 +-
>>>  drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>>  drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>>  drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>>  drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>>  drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>>  drivers/platform/x86/msi-laptop.c             |  2 +-
>>>  drivers/platform/x86/msi-wmi.c                |  2 +-
>>>  drivers/platform/x86/samsung-laptop.c         |  2 +-
>>>  drivers/platform/x86/sony-laptop.c            |  2 +-
>>>  drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>>  drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>>  include/acpi/video.h                          |  8 ++-
>>>  28 files changed, 156 insertions(+), 84 deletions(-)
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
