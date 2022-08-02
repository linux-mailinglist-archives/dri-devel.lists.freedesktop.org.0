Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D55587BA5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 13:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3310EC5C;
	Tue,  2 Aug 2022 11:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5718E10F292
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659439905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxqPiRlh1yMkKL/E8jj94PNhXHLVuyAe9c6skMkF0Wc=;
 b=RJvZ8ZYLK/nE0NFxFyz8saYNBzmPHZA4R6AFhZrjWRGqxXxtbIGtDvGMuIM1gxjigtGF7l
 IBrnGUVUf4GM7yIwG/BEwjtXixsgYvD584FhfaJDddKc5TPoXrHTd/7VwS+erNYbUByVye
 8L4lrSYE98oxjHRNzBZXnRFJ736Z+b8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-LVbAj6bONCioN-C_Jr8m0w-1; Tue, 02 Aug 2022 07:31:44 -0400
X-MC-Unique: LVbAj6bONCioN-C_Jr8m0w-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso4048678ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 04:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FxqPiRlh1yMkKL/E8jj94PNhXHLVuyAe9c6skMkF0Wc=;
 b=GMp5hB/8yT15TWHXrw4SLbtBAtAMKgSUp+RiUuqLA9af7gy7Vc6meWWQOgkJ53q+qC
 0H0ARTbhSfYY1Kyy2RSJXDZ9l1nfESIr+t4qIpg44bPWw2jMuWkBdR+VJOgFFdkYitCH
 x+r8sRth7y90oiSSPf+dCmukg/NMgofuEdheQwrI5jG5+XW6scxDDpvmWDM/O1L6iVma
 0rsB8c/v6jHwWpR18Z2ozk+M/Nu7YAw2dkPs8NLWwFdoO2MItIMC8PJmHYNeZpYNNGbg
 Z1qGUeWIDMReykWxsJaCf1Rk8PFzV0rxVmfzHacM3HzdYjSI4i+VkURzwBDFKF6xxEbM
 zX8A==
X-Gm-Message-State: AJIora8O48eugou2NwQqq3DULucojYNptL/vAV4h/7G/sdkiv9WepFYT
 nm4BbpH+uTSRvk4wtQjEuu+3RlEOXKY8RV775LdAsxgjhg6fJ4GgIuuEveGuSIAOMGYvqpUHNJy
 EiYb/KhH3UA+4uiV9Gw6sRO2oiXan
X-Received: by 2002:a05:6402:3693:b0:43d:1a40:21fd with SMTP id
 ej19-20020a056402369300b0043d1a4021fdmr19623022edb.206.1659439902829; 
 Tue, 02 Aug 2022 04:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNxpGaKCMx+igbAw2yE0EpAVqV6AkR7oivw+9P3IiykmsJcYsdcyEeEWSy1/fVO3/cp3fmOg==
X-Received: by 2002:a05:6402:3693:b0:43d:1a40:21fd with SMTP id
 ej19-20020a056402369300b0043d1a4021fdmr19622969edb.206.1659439902460; 
 Tue, 02 Aug 2022 04:31:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056402036400b0043cbdb16fbbsm8116245edw.24.2022.08.02.04.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 04:31:41 -0700 (PDT)
Message-ID: <331ebd23-d2a4-bb33-5462-b9bd3284ab69@redhat.com>
Date: Tue, 2 Aug 2022 13:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
To: Daniel Dadap <ddadap@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-2-hdegoede@redhat.com>
 <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
 <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20e4ffcf-2a3a-e671-5f98-1602b78df3cb@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Daniel,

On 7/21/22 23:30, Daniel Dadap wrote:
> 
> On 7/21/22 16:24, Daniel Dadap wrote:
>>
>> On 7/12/22 14:38, Hans de Goede wrote:
>>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>>> device we often register both the GPU's native backlight device and
>>> acpi_video's firmware acpi_video# backlight device. This relies on
>>> userspace preferring firmware type backlight devices over native ones, but
>>> registering 2 backlight devices for a single display really is undesirable.
>>>
>>> On x86 laptops where the native GPU backlight device should be used,
>>> the registering of other backlight devices is avoided by their drivers
>>> using acpi_video_get_backlight_type() and only registering their backlight
>>> if the return value matches their type.
>>>
>>> acpi_video_get_backlight_type() uses
>>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>>> driver is available and will never return native if this returns
>>> false. This means that the GPU's native backlight registering code
>>> cannot just call acpi_video_get_backlight_type() to determine if it
>>> should register its backlight, since acpi_video_get_backlight_type() will
>>> never return native until the native backlight has already registered.
>>>
>>> To fix this add a new internal native function parameter to
>>> acpi_video_get_backlight_type(), which when set to true will make
>>> acpi_video_get_backlight_type() behave as if a native backlight has
>>> already been registered.
>>>
>>> And add a new acpi_video_backlight_use_native() helper, which sets this
>>> to true, for use in native GPU backlight code.
>>>
>>> Changes in v2:
>>> - Replace adding a native parameter to acpi_video_get_backlight_type() with
>>>    adding a new acpi_video_backlight_use_native() helper.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   drivers/acpi/video_detect.c | 24 ++++++++++++++++++++----
>>>   include/acpi/video.h        |  5 +++++
>>>   2 files changed, 25 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>> index becc198e4c22..4346c990022d 100644
>>> --- a/drivers/acpi/video_detect.c
>>> +++ b/drivers/acpi/video_detect.c
>>> @@ -17,8 +17,9 @@
>>>    * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>>    * sony_acpi,... can take care about backlight brightness.
>>>    *
>>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>>> - * which driver should handle the backlight.
>>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>>> + * use the acpi_video_backlight_use_native() helper for this.
>>>    *
>>>    * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>>    * this file will not be compiled and acpi_video_get_backlight_type() will
>>> @@ -548,9 +549,10 @@ static int acpi_video_backlight_notify(struct notifier_block *nb,
>>>    * Arguably the native on win8 check should be done first, but that would
>>>    * be a behavior change, which may causes issues.
>>>    */
>>> -enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>> +static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>   {
>>>       static DEFINE_MUTEX(init_mutex);
>>> +    static bool native_available;
>>>       static bool init_done;
>>>       static long video_caps;
>>>   @@ -570,6 +572,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>               backlight_notifier_registered = true;
>>>           init_done = true;
>>>       }
>>> +    if (native)
>>> +        native_available = true;
>>>       mutex_unlock(&init_mutex);
>>>         if (acpi_backlight_cmdline != acpi_backlight_undef)
>>> @@ -581,13 +585,25 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>       if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
>>>           return acpi_backlight_vendor;
>>>   -    if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RAW))
>>> +    if (acpi_osi_is_win8() &&
>>> +        (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
>>>           return acpi_backlight_native;
>>>         return acpi_backlight_video;
>>
>>
>> So I ran into a minor problem when testing the NVIDIA proprietary driver against this change set, after checking acpi_video_backlight_use_native() before registering the NVIDIA proprietary driver's backlight handler. Namely, for the case where a user installs the NVIDIA proprietary driver after the video.ko has already registered its backlight handler, we end up with both the firmware and native handlers registered simultaneously, since the ACPI video driver no longer unregisters its backlight handler. In this state, desktop environments end up preferring the registered but non-functional firmware handler from video.ko. (Manually twiddling the sysfs interface for the native NVIDIA handler works fine.) When rebooting the system after installing the NVIDIA proprietary driver, it is able to register its native handler before the delayed work to register the ACPI video backlight handler fires, so we end up with only one (native) handler, and userspace is happy.
>>
>> Maybe this will be moot later on, when the existing sysfs interface is deprecated, and it probably isn't a huge deal, since a reboot fixes things (I imagine installing an in-tree DRM/KMS driver on an already running kernel isn't really a thing, which is why this isn't a problem with the in-tree drivers), but would it make sense to unregister the ACPI video backlight handler here before returning acpi_backlight_native? That way, we'll briefly end up with zero backlight handlers rather than briefly ending up with two of them. Not sure if that's really any better, though.
>>
> 
> Thinking about this a little more, maybe it's better not to overly complicate things, and just assert that users of the NVIDIA proprietary driver will need to reboot after installation in order to get the backlight working, at least until we get further along in this effort and the backlight interface transitions to the DRM connector property you have proposed.

Right, this series stops unregistering the acpi_video# /sys/class/backlight
devices because the idea is to never register them in the first place.

Registering them in the first place causes 2 problems:

1. It causes userspace to see udev events for the register + unregister
and by the time the systemd backlight level save/restore helper runs
from udev the unregister has already happened and it logs ugly errors.
More in general this kinda racy behavior just is ugly.

2. On some hw merely registering the backlight device, which I think
at least tries to retrieve the current level through ACPI, is causing
issues. So now we have DMI quirks to force the native backlight on
some devices, even though the heuristics also say native eventually,
just to avoid the race. Avoiding the add + remove dance allows
us to drop a bunch of quirks and likely also fixes issues on other
devices which we don't yet know need the quirk.


So this patch-set changes the acpi_video.c code to no longer register
the acpi_video# backlight devices at init time *at all*. Instead native
drivers are supposed to now call acpi_video_register_backlight()
when they have found an internal panel. But to avoid this causing
the acpi_video# backlight devices to not show up at all in some
cases (e.g. native kms drivers blacklisted) the acpi_video code
also calls acpi_video_register_backlight() itself after 8 seconds.

I believe this is what you are hitting, the 8 seconds have passed
before the nvidia driver calls acpi_video_backlight_use_native(),
so the acpi_video# backlight devices have registered (and no longer
go away).

This is not only a problem when installing the nvidia binary driver
for the first time. It can also be a problem if the binary driver
is not in the initrd and leaving the initrd takes longer then
8 seconds, say because of a diskcrypt password. So I believe that
this really can be a problem with the nvidia binary driver.

But I think this is easy to fix. We could make the 8 second
delay configurable by replacing the ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY
define with a module-parameter; and we could make "0" as value mean
that acpi_video.c will never call acpi_video_register_backlight()
itself.

Since the various (also counting distor packaging) nvidia binary
driver installers already all modify the kernel commandline to
blacklist nouveau, then the installers can just also pass this
parameter and then acpi_video.c will never register the acpi_video#.

This does mean that the nvidia binary driver then must call
acpi_video_register_backlight() when an internal panel is found.

Note the current patches to amdgpu/nouveau skip the calling of
acpi_video_register_backlight() when
the acpi_video_backlight_use_native() call returns true and they
have registered their own backlight. But calling it always is ok
*as long as the driver is driving the laptops internal panel* !

acpi_video_register_backlight() contains:

       if (acpi_video_get_backlight_type() != acpi_backlight_video)
                return 0;

So calling it when a native backlight has already been registered
is a no-op.

Please let me know if the proposed solution works for you and
if you want me to make ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY a
module-option for the next version.

Regards,

Hans


p.s.

I think that eventually I might even try to make the new
module-param default to 0 / default to not having acpi_video.c
do the registering itself ever and see how that goes...




>>>   }
>>> +
>>> +enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>> +{
>>> +    return __acpi_video_get_backlight_type(false);
>>> +}
>>>   EXPORT_SYMBOL(acpi_video_get_backlight_type);
>>>   +bool acpi_video_backlight_use_native(void)
>>> +{
>>> +    return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
>>> +}
>>> +EXPORT_SYMBOL(acpi_video_backlight_use_native);
>>> +
>>>   /*
>>>    * Set the preferred backlight interface type based on DMI info.
>>>    * This function allows DMI blacklists to be implemented by external
>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>> index db8548ff03ce..4705e339c252 100644
>>> --- a/include/acpi/video.h
>>> +++ b/include/acpi/video.h
>>> @@ -56,6 +56,7 @@ extern void acpi_video_unregister(void);
>>>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>>                      int device_id, void **edid);
>>>   extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
>>> +extern bool acpi_video_backlight_use_native(void);
>>>   extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
>>>   /*
>>>    * Note: The value returned by acpi_video_handles_brightness_key_presses()
>>> @@ -77,6 +78,10 @@ static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
>>>   {
>>>       return acpi_backlight_vendor;
>>>   }
>>> +static inline bool acpi_video_backlight_use_native(void)
>>> +{
>>> +    return true;
>>> +}
>>>   static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
>>>   {
>>>   }
> 

