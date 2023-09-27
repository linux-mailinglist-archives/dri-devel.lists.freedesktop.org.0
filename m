Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943737B04E3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40DA10E50C;
	Wed, 27 Sep 2023 13:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C95910E50C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695819875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEJmDoqilpfailDPhLu8gdHLBSybSMtbE9uHTda0p00=;
 b=IphazonFwCSty8lHXIojclzyTtCX3WM/grmcPZI6yYmQIyotGENrJTh+PiJ8Bcw2wRW+x8
 G1AsYok8SZsh3CWY9EKDy1wrgWltlTF+A8/qkplYKVWq9eGfjCfYptVOM8qLEJuKFNE0XI
 fB8kTmNtayGZc3UdXpG3tgsZ+G6qtAg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-PFqhPQvMNayXPdoBFrpMDw-1; Wed, 27 Sep 2023 09:04:33 -0400
X-MC-Unique: PFqhPQvMNayXPdoBFrpMDw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c135cf1316so155664221fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695819871; x=1696424671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lEJmDoqilpfailDPhLu8gdHLBSybSMtbE9uHTda0p00=;
 b=EzvoVibcSfyHhJMkrMWQblCQWkUAqNZE04YxJ5G4Y9JIRGcSOwF/OQ5OC8MRblR2/+
 a01M2S/Fbp9U4R4POq7nQJdsY5wpMdOykGSHmSNZYt6xxGCtf8W29FPNGahOzOa+7xL4
 oUp9BGhRehE+sLNpH2CMsp8DyQKr1q6rz8iBovGxwD3fRvGGYQNoLbpaUxG+gxG+KNV3
 JBkkECOMs9ZLaVs7VzkS7EUhJKmnVUKt0pXbU525xtUbaiRvq7gojaJa3aOGhrmbHcW0
 gBswhfmPQXOpH6g3HLHNQtGdMK81N3WoYJyxVly4HXNlvBDcctV9TJyBav9QLtNerPVT
 dECQ==
X-Gm-Message-State: AOJu0Yx6jEOB+PdLJJGR9DE8d+A5we9Otus1rziT3h53Vm0VKqlnpy4T
 Q+Q+n1n/8c6k7myLhZSyx7GAl5GSYslHcjK8w7ioelsqEcjxbqWnz9QVX/f5nVN2uUuE8AcLfxo
 JhIftgyYnIM1yxavQl5er8Tm9xuO1
X-Received: by 2002:a2e:808c:0:b0:2c0:ff6:984f with SMTP id
 i12-20020a2e808c000000b002c00ff6984fmr1840580ljg.49.1695819871407; 
 Wed, 27 Sep 2023 06:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgrWTc1uEZWs0S50u15OrcUTMlN06IqObURZUtSe55BFL3PNrwfzxc97XMvVm/a3mhgZABPg==
X-Received: by 2002:a2e:808c:0:b0:2c0:ff6:984f with SMTP id
 i12-20020a2e808c000000b002c00ff6984fmr1840547ljg.49.1695819870947; 
 Wed, 27 Sep 2023 06:04:30 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.155.235])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a170906370400b0099bd8c1f67esm9301994ejc.109.2023.09.27.06.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 06:04:30 -0700 (PDT)
Message-ID: <72f7d962-e6ee-274a-74ba-aa68adf5806a@redhat.com>
Date: Wed, 27 Sep 2023 15:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
 <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
 <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI,

On 9/26/23 15:17, Christian König wrote:
> Am 26.09.23 um 14:56 schrieb Hans de Goede:
>> Hi,
>>
>> On 9/26/23 13:24, Shyam Sundar S K wrote:
>>> Hi Hans,
>>>
>>> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>>>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>>>   include/linux/amd-pmf-io.h              |  1 +
>>>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> index 232d11833ddc..5c567bff0548 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>       return 0;
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>> +
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>> This assumes that the backlight is always controller by the amdgpu's
>>>> native backlight driver, but it might e.g. also be handled by
>>>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>>>> nvidia dgpu).
>>> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
>>> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
>>> should be safe, right?
>> Users can pass say acpi_backlight=video and use the acpi_video
>> driver for backlight control instead of the native GPU backlight
>> control.
>>
>>>> For now what should be done here is to call acpi_video_get_backlight_type()
>>>> and then translate the return value from this into a backlight-type:
>>>>
>>>>          acpi_backlight_video        -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_vendor,        -> BACKLIGHT_PLATFORM
>>>>          acpi_backlight_native,        -> BACKLIGHT_RAW
>>>>          acpi_backlight_nvidia_wmi_ec,    -> BACKLIGHT_FIRMWARE
>>>>          acpi_backlight_apple_gmux,    -> BACKLIGHT_PLATFORM
>>>>
>>> I can add this change in the v2, do you insist on this?
>> Insist is a strong word, but I think that it is a good idea to have
>> this. Evenutally it looks like this code will need to either integrate with
>> the drm drivers lot more; or the drm core needs to export some special
>> hooks for this which the PMF code can then call.
>>
>> Actually thinking more about this, I think that the right thing to do
>> here is make some code register brightness control as a cooling device
>> (which I think is already done in some cases) and then have the PMF
>> code use the cooling-device APIs for this.
>>
>> IMHO that would be a much cleaner solution then this hack.
> 
> Yeah, fully agree with Hans. This looks like a rather extreme hack to me.

Shyam, the cooling device interface is defined in:

include/linux/thermal.h

And then look for cooling_device .

An example of code registering a cooling_device for backlight control is:

drivers/acpi/acpi_video.c

and then specifically the code starting around line 257 with:

video_get_max_state()

until

static const struct thermal_cooling_device_ops video_cooling_ops = {
...

And the code around line 1750 for actually registering the cooling-dev.

To use the cooling_device interface witt amdgpu's native backlight control
you will need to make the amdgpu backlight control register a cooling-device
for this in a similar manner.

Regards,

Hans




> 
> Apart from that what exactly is this thing supposed to do? Prevent overheating by reducing the brightness?
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> Thanks,
>>> Shyam
>>>
>>>> Also I'm worried about probe order here, this code currently assumes
>>>> that the GPU or other backlight driver has loaded before this runs,
>>>> which is not necessarily the case.
>>>>
>>>> I think that if the backlight_device_get_by_type() fails this
>>>> should be retried say every 10 seconds from some delayed workqueue
>>>> for at least a couple of minutes after boot.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>>>> +
>>>>> +    backlight_device_set_brightness(bd, pmf->brightness);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> @@ -73,6 +73,7 @@
>>>>>   #define PMF_POLICY_STT_SKINTEMP_APU                7
>>>>>   #define PMF_POLICY_STT_SKINTEMP_HS2                8
>>>>>   #define PMF_POLICY_SYSTEM_STATE                    9
>>>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                12
>>>>>   #define PMF_POLICY_P3T                        38
>>>>>     /* TA macros */
>>>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>>>   };
>>>>>     struct pmf_action_table {
>>>>> +    unsigned long display_brightness;
>>>>>       enum system_state system_state;
>>>>>       unsigned long spl; /* in mW */
>>>>>       unsigned long sppt; /* in mW */
>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> index 1608996654e8..eefffff83a4c 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>>>       return 0;
>>>>>   }
>>>>>   -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>>   {
>>>>>       u32 val, event = 0;
>>>>> -    int idx;
>>>>> +    int idx, ret;
>>>>>         for (idx = 0; idx < out->actions_count; idx++) {
>>>>>           val = out->actions_list[idx].value;
>>>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>                   dev->prev_data->system_state = 0;
>>>>>               }
>>>>>               break;
>>>>> +
>>>>> +        case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>>>> +            ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>> +            if (ret)
>>>>> +                return ret;
>>>>> +
>>>>> +            dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>>>> +            if (dev->prev_data->display_brightness != val) {
>>>>> +                dev->gfx_data.brightness = val;
>>>>> +                amd_pmf_set_gfx_data(&dev->gfx_data);
>>>>> +                dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>>>> +            }
>>>>> +            break;
>>>>>           }
>>>>>       }
>>>>> +
>>>>> +    return 0;
>>>>>   }
>>>>>     static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>>> index a2d4af231362..ecae387ddaa6 100644
>>>>> --- a/include/linux/amd-pmf-io.h
>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>>>   };
>>>>>     int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>   #endif
> 

