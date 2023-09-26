Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498A7AED5B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 14:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3EC10E3D2;
	Tue, 26 Sep 2023 12:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9510E3D2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695732993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkUBWVUpOckdloB7nvyn6S4lYeiAg6HkW3tcCGhfEaA=;
 b=XFjE5YXHN05yxYvTH+oo/ucBO+4uHoy07u6dexMRAnQnXSMMfEIZzFkGG02sLk/qPLteR5
 mT3tjUtmsM84RmB3mNQS9RFDOGZyUWsqMIhesHPBxUV9EHgjUmRhty5O2dMjJ8VQZHZZQZ
 Qajy5EGlKkWF5YOSsk0uKAi+Ev5/a2U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-nIL8zyNCOwqAscN4y-MIBg-1; Tue, 26 Sep 2023 08:56:32 -0400
X-MC-Unique: nIL8zyNCOwqAscN4y-MIBg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso727407266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 05:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695732991; x=1696337791;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UkUBWVUpOckdloB7nvyn6S4lYeiAg6HkW3tcCGhfEaA=;
 b=KTSS0uHhteCrKJ53aVXYBFQ+aiI6FwUnL17Nb2vikXXHgFW9N2sEdrSxU/z6qG3ZPL
 WiEOovZLYRbzo4TU/Fk9s+RTZnDCKhA21eFC2+gmrtqICvi5KL8U5AqV0mwkorAuTdna
 UHb+AqVbOk78ALgN+oCOEgrWqoSWFSGZdzP+O8Q3PIH82YOFVbicph5/+GSo85fR9iE2
 FCZjwlPGmc65IINmYoz4LQFgHS4dYAU/M1ATT9mISFMuOytZVS+LNO8Y2L+u+o7EH9km
 clHIMfO8SFJNOSr3aq37cAuo81eUj0Kx5zz/eX9DA+n9uPbQutIOK9sSD1V/D3Eyz8YL
 tU/Q==
X-Gm-Message-State: AOJu0YxOi6DF+KtNbSto3WtH75iXRDjSIBz8Q7j68Z5l2IiQRA8hCUdV
 6aVFhSxdoEt9Yda7YCBH9URwqqAglDhrRyzqZCFeRCj0KwDSs6SgLEblqCg1TYCkj5kBhN+xMRh
 3lm1RLO176YWSec6Pb3raoONE626+
X-Received: by 2002:a17:906:5182:b0:9ae:7088:6e5d with SMTP id
 y2-20020a170906518200b009ae70886e5dmr8609851ejk.3.1695732991314; 
 Tue, 26 Sep 2023 05:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlKMkjWc/6E/rOck6ptJGST/s1rC6uMsZziOzioVqLhJ/fEha6iiUPqIHhbUDWGuzvICiu2w==
X-Received: by 2002:a17:906:5182:b0:9ae:7088:6e5d with SMTP id
 y2-20020a170906518200b009ae70886e5dmr8609829ejk.3.1695732990967; 
 Tue, 26 Sep 2023 05:56:30 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.247])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090616c200b0099d45ed589csm7672502ejd.125.2023.09.26.05.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 05:56:30 -0700 (PDT)
Message-ID: <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
Date: Tue, 26 Sep 2023 14:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
 linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/26/23 13:24, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>  include/linux/amd-pmf-io.h              |  1 +
>>>  4 files changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> index 232d11833ddc..5c567bff0548 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>  	return 0;
>>>  }
>>>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>> +
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>> +{
>>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (!(adev->flags & AMD_IS_APU)) {
>>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>
>> This assumes that the backlight is always controller by the amdgpu's
>> native backlight driver, but it might e.g. also be handled by
>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>> nvidia dgpu).
> 
> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
> should be safe, right?

Users can pass say acpi_backlight=video and use the acpi_video
driver for backlight control instead of the native GPU backlight
control.

> 
>>
>> For now what should be done here is to call acpi_video_get_backlight_type()
>> and then translate the return value from this into a backlight-type:
>>
>>         acpi_backlight_video		-> BACKLIGHT_FIRMWARE
>>         acpi_backlight_vendor,		-> BACKLIGHT_PLATFORM
>>         acpi_backlight_native,		-> BACKLIGHT_RAW
>>         acpi_backlight_nvidia_wmi_ec,	-> BACKLIGHT_FIRMWARE
>>         acpi_backlight_apple_gmux,	-> BACKLIGHT_PLATFORM
>>
> 
> I can add this change in the v2, do you insist on this?

Insist is a strong word, but I think that it is a good idea to have
this. Evenutally it looks like this code will need to either integrate with
the drm drivers lot more; or the drm core needs to export some special
hooks for this which the PMF code can then call.

Actually thinking more about this, I think that the right thing to do
here is make some code register brightness control as a cooling device
(which I think is already done in some cases) and then have the PMF
code use the cooling-device APIs for this.

IMHO that would be a much cleaner solution then this hack.

Regards,

Hans



> 
> Thanks,
> Shyam
> 
>> Also I'm worried about probe order here, this code currently assumes
>> that the GPU or other backlight driver has loaded before this runs,
>> which is not necessarily the case.
>>
>> I think that if the backlight_device_get_by_type() fails this
>> should be retried say every 10 seconds from some delayed workqueue
>> for at least a couple of minutes after boot.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> +
>>> +	backlight_device_set_brightness(bd, pmf->brightness);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -73,6 +73,7 @@
>>>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>>>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>>>  #define PMF_POLICY_SYSTEM_STATE					9
>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>>>  #define PMF_POLICY_P3T						38
>>>  
>>>  /* TA macros */
>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>  };
>>>  
>>>  struct pmf_action_table {
>>> +	unsigned long display_brightness;
>>>  	enum system_state system_state;
>>>  	unsigned long spl; /* in mW */
>>>  	unsigned long sppt; /* in mW */
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 1608996654e8..eefffff83a4c 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>  	return 0;
>>>  }
>>>  
>>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>  {
>>>  	u32 val, event = 0;
>>> -	int idx;
>>> +	int idx, ret;
>>>  
>>>  	for (idx = 0; idx < out->actions_count; idx++) {
>>>  		val = out->actions_list[idx].value;
>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>  				dev->prev_data->system_state = 0;
>>>  			}
>>>  			break;
>>> +
>>> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>> +			if (ret)
>>> +				return ret;
>>> +
>>> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>> +			if (dev->prev_data->display_brightness != val) {
>>> +				dev->gfx_data.brightness = val;
>>> +				amd_pmf_set_gfx_data(&dev->gfx_data);
>>> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>> +			}
>>> +			break;
>>>  		}
>>>  	}
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>> index a2d4af231362..ecae387ddaa6 100644
>>> --- a/include/linux/amd-pmf-io.h
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>  };
>>>  
>>>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>  #endif
>>
> 

