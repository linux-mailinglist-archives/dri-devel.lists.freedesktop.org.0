Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B5A7339B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E886310E8DD;
	Thu, 27 Mar 2025 13:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F1ZLME6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7890010E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wM4oVcwxrWlVGmyeT76cBxZCuG1OHMlHbi5XRiXUE3g=; b=F1ZLME6IBFhaWhNOqrnCIpeuWQ
 gzS1smS8aYoHNOOODtVPT7oyzhs5YSOttJMd2TnrW0Cn/Jenw0Krgq+m6TzpeCduWk77MEwXEnwyi
 blRikOCyYUc88/gZ+cT2ztCRH4/K4kBer/CDLP55jefU5/YF5fwLaClVYb1reRVgUui1KtOakyZre
 Q3UDUad4GWhdngdTn95GRpep36R3r6D5x3nJPrfpDTY3POp3v8clWup6dx9sEZz6VI0UjzWjs3XhP
 YOboGAyVgo/D2/2dmPKx27M2iTcHs8/xgCTyy4zDerK7IbDN50sJYi4+xRkDrKSwFvfybvhO225BB
 hNYH353A==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1txnf1-007FSA-L2; Thu, 27 Mar 2025 14:52:43 +0100
Message-ID: <f85dc2d3-a601-4caf-9ddb-c3256423f001@igalia.com>
Date: Thu, 27 Mar 2025 10:52:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/v3d: Use V3D_SMS registers for power on/off
 and reset on V3D 7.x
To: Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
 <20250317-v3d-gpu-reset-fixes-v6-5-f3ee7717ed17@igalia.com>
 <bffb4df1-1171-4a9b-9b73-af33136c620a@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <bffb4df1-1171-4a9b-9b73-af33136c620a@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On 27/03/25 07:57, Stefan Wahren wrote:
> Hi Maíra,
> 
> Am 18.03.25 um 02:01 schrieb Maíra Canal:
>> In addition to the standard reset controller, V3D 7.x requires 
>> configuring
>> the V3D_SMS registers for proper power on/off and reset. Add the new
>> registers to `v3d_regs.h` and ensure they are properly configured during
>> device probing, removal, and reset.
>>
>> This change fixes GPU reset issues on the Raspberry Pi 5 (BCM2712).
>> Without exposing these registers, a GPU reset causes the GPU to hang,
>> stopping any further job execution and freezing the desktop GUI. The same
>> issue occurs when unloading and loading the v3d driver.
>>
>> Link: https://github.com/raspberrypi/linux/issues/6660
>> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.c  | 40 ++++++++++++++++++++++++++++++++ 
>> ++++++++
>>   drivers/gpu/drm/v3d/v3d_drv.h  | 11 +++++++++++
>>   drivers/gpu/drm/v3d/v3d_gem.c  | 17 +++++++++++++++++
>>   drivers/gpu/drm/v3d/v3d_regs.h | 26 ++++++++++++++++++++++++++
>>   4 files changed, 94 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/ 
>> v3d_drv.c
>> index 
>> c63f0ed1bd8a3d5511085e76ed2fbd6ee7df6f80..122848cdccc4a02039d9ea2e77aa2f377886b5d6 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -263,6 +263,36 @@ static const struct of_device_id v3d_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, v3d_of_match);
>>
>> +static void
>> +v3d_idle_sms(struct v3d_dev *v3d)
>> +{
>> +    if (v3d->ver < V3D_GEN_71)
>> +        return;
>> +
>> +    V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
>> +
>> +    if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
>> +                    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
>> +        DRM_ERROR("Failed to power up SMS\n");
>> +    }
>> +
>> +    v3d_reset_sms(v3d);
>> +}
>> +
>> +static void
>> +v3d_power_off_sms(struct v3d_dev *v3d)
>> +{
>> +    if (v3d->ver < V3D_GEN_71)
>> +        return;
>> +
>> +    V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
>> +
>> +    if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
>> +                    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
>> +        DRM_ERROR("Failed to power off SMS\n");
>> +    }
>> +}
>> +
>>   static int
>>   map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
>>   {
>> @@ -300,6 +330,12 @@ static int v3d_platform_drm_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>           return ret;
>>
>> +    if (v3d->ver >= V3D_GEN_71) {
>> +        ret = map_regs(v3d, &v3d->sms_regs, "sms");
>> +        if (ret)
>> +            return ret;
> Is it correct, that BCM2712 now requires the SMS register and otherwise
> the driver doesn't probe?

Hum, yeah, it is correct, but I can send a patch to ensure backwards
compatibility. But keep in mind that you won't be able to reset the GPU
or unload/load (power on/off).

> 
> Just a note for the future: the devicetree is considered as an ABI [1],
> so new kernels should still work with old DTB (no regression). For
> Raspberry Pi OS, the kernel and DTB are always updated, but this doesn't
> apply for Linux Mainline. AFAIK V3D doesn't work with Linux Mainline on
> Raspberry Pi 5 yet, so this is just a theoretical problem.

Yeah, I had that in mind, but due to the reason pointed in the end of
your comment, it was okay to do so and ensure that reset and power on/
off will work when RPi 5 reach upstream support.

But, I'm open to send a patch removing the requirement.

Best Regards,
- Maíra

> 
> Best regards
> 
> [1] - https://docs.kernel.org/devicetree/bindings/ABI.html

