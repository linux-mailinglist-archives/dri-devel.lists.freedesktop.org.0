Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8176C854BB2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 15:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B8F10E190;
	Wed, 14 Feb 2024 14:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hoeqEQIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3725410E1F4;
 Wed, 14 Feb 2024 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707921696;
 bh=Ocfp1vuV0hUuPSty8ZYkGXTPlL3oc2sSfjxCcl/aI1A=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=hoeqEQIw8SUOo0Gn2BN46rR1Ii0EoznEFldQrYi8vYtnw2WKNGHm92g1qzuoC3Wny
 inJcZM/feEceQRzFbz9jtNf1xSF7lJxljMTw3wAj8oa8qXS9zv63/1ugdH/78L/RoA
 pcnkbGWYxy5a5CYIchVXd9j0uVbgsiFT0UQKo8pU3Is0V/aoo+4flbB+3evE9fI03b
 OCpJVa42i/ZG0K4r8TMlab879c659fDOYHAfcDZWKl3RvNOsSBHpfLnP4i74/KqlOn
 gG3QQg7fgmA67ub1snQOW/5LKwAoJivJsveGBN96JOUJfxHCtK4mFqbxcxQ25qBX6C
 bOP2E8kzKYZaw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA6E03782081;
 Wed, 14 Feb 2024 14:41:32 +0000 (UTC)
Message-ID: <7aa0bdd0-ae2d-4e0d-b3f3-7cb0880061d8@collabora.com>
Date: Wed, 14 Feb 2024 11:41:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: ci: use clk_ignore_unused for apq8016
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20240214083708.2323967-1-dmitry.baryshkov@linaro.org>
 <c1078d13-5375-4c3f-93b7-40a1ea22f0dc@collabora.com>
In-Reply-To: <c1078d13-5375-4c3f-93b7-40a1ea22f0dc@collabora.com>
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



On 14/02/2024 10:30, Helen Koike wrote:
> 
> 
> On 14/02/2024 05:37, Dmitry Baryshkov wrote:
>> If the ADV7511 bridge driver is compiled as a module, while DRM_MSM is
>> built-in, the clk_disable_unused congests with the runtime PM handling
>> of the DSI PHY for the clk_prepare_lock(). This causes apq8016 runner to
>> fail without completing any jobs ([1]). Drop the BM_CMDLINE which
>> duplicate the command line from the .baremetal-igt-arm64 clause and
>> enforce the clk_ignore_unused kernelarg instead to make apq8016 runner
>> work.
>>
>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/54990475
>>
>> Fixes: 0119c894ab0d ("drm: Add initial ci/ subdirectory")
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>

Applied to drm-misc-next.

Regards,
Helen

> 
> Thanks
> Helen
> 
>> ---
>>
>> Changes in v2:
>> - Added a comment, describing the issue and a way to reproduce it
>>    (Javier)
>>
>> ---
>>   drivers/gpu/drm/ci/test.yml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 7ffb620d7398..e64205286a27 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -119,7 +119,10 @@ msm:apq8016:
>>       DRIVER_NAME: msm
>>       BM_DTB: 
>> https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
>>       GPU_VERSION: apq8016
>> -    BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 
>> $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug 
>> nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
>> +    # disabling unused clocks congests with the MDSS runtime PM 
>> trying to
>> +    # disable those clocks and causes boot to fail.
>> +    # Reproducer: DRM_MSM=y, DRM_I2C_ADV7511=m
>> +    BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>>       RUNNER_TAG: google-freedreno-db410c
>>     script:
>>       - ./install/bare-metal/fastboot.sh
