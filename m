Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303F87CC2D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8611010FC01;
	Fri, 15 Mar 2024 11:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="wOCFsgeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE710FC01
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710501509;
 bh=3jAxlkMS2UWb35oBck4irZ8AXTG1g/crD+E/7tbIdFo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wOCFsgeAbfgoyN81XVt5eyBvSartapUpl06usVO450bohkUaTdtmLXLk7GR9J3LrI
 WRhvtfnUACBEHFVwT/lFW33jWeZO5ZojLljvka9yzUm+0YhQhfUQHRYVyAbQpjNr9U
 4kCNVfXgl8w4sAey6ccVW3MfW8IssAm0jOX2rTVJPKfpiXviwOF44tK5+rQnnKht7J
 DvgYsGrGwRvyUu6wI3ZHh6kGLBAWVPRcgXmZZJwHs2f8nvS/4GjavdtnP+Jt0KpF7U
 4rg7xGBGAyPaRFiLpMbg7vEoPFqmYwCm/FiSqKtzC1qXETkIZcEct2wgbKIWXmxJ10
 vOsWbaMwSqihA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D762378105A;
 Fri, 15 Mar 2024 11:18:24 +0000 (UTC)
Message-ID: <f53c716d-6d11-13f6-0ecf-ec02f4debcfa@collabora.com>
Date: Fri, 15 Mar 2024 16:48:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 09/11] drm/ci: rockchip: Refactor existing rockchip jobs
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-10-vignesh.raman@collabora.com>
 <098d2345-df99-4ad2-bc1c-9641662ed9bd@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <098d2345-df99-4ad2-bc1c-9641662ed9bd@collabora.com>
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

Hi Helen,

On 07/03/24 19:32, Helen Koike wrote:
> 
> 
> On 06/03/2024 00:06, Vignesh Raman wrote:
>> For rockchip rk3288 and rk3399, the display driver is rockchip.
>> Currently, in drm-ci for rockchip, only the display driver is
>> tested. Refactor the existing rockchip jobs so that gpu driver
>> testing jobs can be added later and update xfails accordingly.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Refactor the patch to rename job to indicate display driver testing,
>>      rename the existing xfail files.
>>
>> v3:
>>    - Add the job name in GPU_VERSION and use it for xfail file names
>>      instead of using DRIVER_NAME. Also update xfails.
>>
>> v4:
>>    - Remove the display suffix in job and rename xfails accordingly.
>>      Remove the change adding job name in GPU_VERSION.
>>
>> ---
>>   drivers/gpu/drm/ci/test.yml                   | 36 ++++++++----
>>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 58 ++++++-------------
>>   .../drm/ci/xfails/rockchip-rk3288-flakes.txt  | 20 +++++++
>>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   | 54 ++---------------
>>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 38 ++++++------
>>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  | 28 +++++++--
>>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  5 +-
>>   7 files changed, 110 insertions(+), 129 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 6ae6398b3d88..831e580e6dfd 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -153,33 +153,45 @@ msm:sdm845:
>>     script:
>>       - ./install/bare-metal/cros-servo.sh
>> -rockchip:rk3288:
>> -  extends:
>> -    - .lava-igt:arm32
>> +.rockchip:
>>     stage: rockchip
>>     variables:
>> -    DRIVER_NAME: rockchip
> 
> Looks like it make sense to keep DRIVER_NAME here, no?
> 
>> -    DEVICE_TYPE: rk3288-veyron-jaq
>>       DTB: ${DEVICE_TYPE}
>>       BOOT_METHOD: depthcharge
>> +
>> +.rk3288:
>> +  extends:
>> +    - .lava-igt:arm32
>> +    - .rockchip
> 
> Maybe, instead of extending .rockchip here, make .rockchip tied to the 
> DRIVER_NAME and .rk3288 tied to the GPU_VERSION, and on rockchip:rk3288 
> you can extend both .rockchip and .rk3288, what do you think?
> So rockchip:rk3399 you can extend .rockchip and .rk3399.
> 
> and in the panfrost one you can have a .panfrost (that can extend 
> .rockchip if they are the same definition).
> 
> I feel it becomes less confusing, what do you think?
> 
> I would even add some prefix or suffix to make it less confusing, like 
> .driver-rockchip and .gpu-rk3288 for instance, making it a bit more 
> intuitive and helping our future selves :)

Thanks for the suggestion. This can be done. Should we do it only
for rockchip jobs or others also (meson, mediatek) ?

> 
>> +  variables:
>> +    DEVICE_TYPE: rk3288-veyron-jaq
>>       KERNEL_IMAGE_TYPE: "zimage"
>> -    GPU_VERSION: rk3288
> 
> Looks like it make sense to keep GPU_VERSION here, no? Same comment for 
> .rk3399.
Yes, will fix this.

Regards,
Vignesh
