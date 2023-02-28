Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A126A53F2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 08:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370B410E49D;
	Tue, 28 Feb 2023 07:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 72617 seconds by postgrey-1.36 at gabe;
 Tue, 28 Feb 2023 03:52:34 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AECA10E471;
 Tue, 28 Feb 2023 03:52:34 +0000 (UTC)
X-QQ-mid: bizesmtp90t1677556219t5cbi1fe
Received: from [10.4.23.47] ( [58.240.82.166]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 28 Feb 2023 11:50:17 +0800 (CST)
X-QQ-SSF: 0040000000000080C000000A0000000
X-QQ-FEAT: wPivafIDGPOLoZ7sGjiViT3MF7HDsx5Ex2lIdhcFazYPn2DoqL8nk2h47Kh8H
 HuK5A27TvpblNbPcXZuIy50IeS+rYN7JWGtDUSPKWiqbI5w1qUBpMCp+RYIDouHOG47dkSF
 6bhY47wNNrWiVEfPXYxRPb0vqSw1uCHCMwHOczbhN2XQr33d6OOEQGF1QUM52AKJhl3epxA
 Lx7sKh7oqfyH+WctqkBwPWn2Wp44nh12u70V9HeE8RnyDgKabkXEQzjQ7JSOfkEJhZVlzqP
 3UeowqzqHtv4vS9BS43vPr66Tqaxx6/hbOJAro95v+95u57ZpS8NDUf1q+NHaY7Araf83jc
 s6RYWLdlH0mtzmMa9rgAnSCqamofiqWg1yr25XWu1EGeojoCDo3FQlT19iWvg==
X-QQ-GoodBg: 1
Message-ID: <DF39BAC8574CEA6C+21bfd215-457f-eed7-951c-bc13837dbac4@uniontech.com>
Date: Tue, 28 Feb 2023 11:50:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] amdgpu: add a filter condition when set brightness
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Bokun.Zhang@amd.com, tzimmermann@suse.de,
 hdegoede@redhat.com, jingyuwang_vip@163.com, rafael.j.wysocki@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230227073953.326-1-wangyuanzhi@uniontech.com>
 <2975957e-51a9-fc44-9157-f3c4dba3cd0a@amd.com>
From: wangyuanzhi <wangyuanzhi@uniontech.com>
In-Reply-To: <2975957e-51a9-fc44-9157-f3c4dba3cd0a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr2
X-Mailman-Approved-At: Tue, 28 Feb 2023 07:55:12 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, I have fixed compilation errors. The lenovo ThinkBook 14 G3 ACL 
notebook bios reports very small brightness value, 3 eg.

On 2023/2/27 22:20, Mario Limonciello wrote:
> On 2/27/23 01:39, Yuanzhi Wang wrote:
>> When the laptop is plugged into AC or DC power supply,
>> the brightness obtained ACPI may be smaller than current
>> brightness.As a result the screen becomes dark，this is
>> not what people want.
>>
> 
> Do you have a matching bug report with more information included?
> 
> Some relevant details I think we need:
> kernel version
> laptop model
> BIOS version
> if it's the latest BIOS
> some sample numbers that this new warning/behavior catches
> acpidump
> 
> At least as described this sounds like a BIOS bug.
> 
>> Signed-off-by: Yuanzhi Wang <wangyuanzhi@uniontech.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> index d4196fcb85a0..93f1567028c5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -406,6 +406,7 @@ static int amdgpu_atif_handler(struct 
>> amdgpu_device *adev,
>>   {
>>       struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
>>       int count;
>> +    int old_brightness;
>>       DRM_DEBUG_DRIVER("event, device_class = %s, type = %#x\n",
>>               event->device_class, event->type);
>> @@ -443,7 +444,13 @@ static int amdgpu_atif_handler(struct 
>> amdgpu_device *adev,
>>                    * hardwired to post BACKLIGHT_UPDATE_SYSFS.
>>                    * It probably should accept 'reason' parameter.
>>                    */
>> -                backlight_device_set_brightness(atif->bd, 
>> req.backlight_level);
>> +                old_brightness = backlight_get_brightness(atif->bd);
>> +                if (old_brightness > req.backlight_level)
>> +                    DRM_WARN("old brightness %d is greater than ACPI 
>> brightness
>> +                        %d\n", old_brightness, req.backlight_level);
>> +                else
>> +                    backlight_device_set_brightness(atif->bd,
>> +                        req.backlight_level);
>>               }
>>           }
> 
> 
