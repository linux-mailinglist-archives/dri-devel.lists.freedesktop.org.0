Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E587CC17
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC9F112183;
	Fri, 15 Mar 2024 11:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LZAY3hiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A271112183
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710501328;
 bh=dl7ZhBIyNJ+zkeATWSO3R1GGYspWpDZBRDyyr6jhFxI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LZAY3hiq1mwwA9m59SLy+T5ZuyG+SM7R9K57TZdw85wxld+66CUWGg0yvUtTXQO9D
 pKbyloDvRwGnDg1vBhSyXLJe6gJT0BNToA7zZaayOesHRR9Tpsf1391diB/dUnRHl0
 g2XY6gmD+97I6E7ftZRYWQX+1yu1aY4StsUWhGewTo0Dzhv+qWUIpdI2cLEuj77axT
 QzXGamsy7SRP5kXVa4v2eiO6L9jk0R7xrWxeiz01jTL1521s1ulgHBPOanmL0yqFAx
 MzP7PrH37lOM/mKdm+Od5RmybnW4NakayucXCBEoztypsIGWC+NoSszFhyfvNBx2ci
 9ZMN33QjAeDbQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B6FE37820D8;
 Fri, 15 Mar 2024 11:15:24 +0000 (UTC)
Message-ID: <4b88ae15-ac1c-c77f-69cf-26cd192ee908@collabora.com>
Date: Fri, 15 Mar 2024 16:45:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 05/11] drm/ci: mediatek: Refactor existing mediatek jobs
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
 <20240306030649.60269-6-vignesh.raman@collabora.com>
 <e53fd362-c2c2-4935-b6a3-c73decd23d10@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <e53fd362-c2c2-4935-b6a3-c73decd23d10@collabora.com>
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
>> For mediatek mt8173 and mt8183, the display driver is mediatek.
>> Currently, in drm-ci for mediatek, only the display driver is
>> tested. Refactor the existing mediatek jobs so that gpu driver
>> testing jobs can be added later and update xfails accordingly.
>> Since the correct driver name is passed from the job to test gpu
>> and display driver, remove the check to set IGT_FORCE_DRIVER
>> based on driver name.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Refactor the patch to rename job to indicate display driver testing,
>>      rename the existing xfail files, and remove IGT_FORCE_DRIVER from 
>> the
>>      script since it's now set by the job.
>>
>> v3:
>>    - Add the job name in GPU_VERSION and use it for xfail file names 
>> instead
>>      of using DRIVER_NAME. Also update xfails.
>>
>> v4:
>>    - Remove the display suffix in job and rename xfails accordingly.
>>      Remove the change adding job name in GPU_VERSION.
>>
>> ---
>>   drivers/gpu/drm/ci/igt_runner.sh              | 10 ---------
>>   drivers/gpu/drm/ci/test.yml                   | 21 ++++++++++++++-----
>>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 15 -------------
>>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 13 ++++++++++++
>>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 21 ++++++++++++-------
>>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  8 +++++++
>>   6 files changed, 50 insertions(+), 38 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>> b/drivers/gpu/drm/ci/igt_runner.sh
>> index 77cd81fe6d1a..711f32772e48 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
>>   set -e
>>   case "$DRIVER_NAME" in
>> -    rockchip|meson)
>> -        export IGT_FORCE_DRIVER="panfrost"
>> -        ;;
>> -    mediatek)
>> -        if [ "$GPU_VERSION" = "mt8173" ]; then
>> -            export IGT_FORCE_DRIVER=${DRIVER_NAME}
>> -        elif [ "$GPU_VERSION" = "mt8183" ]; then
>> -            export IGT_FORCE_DRIVER="panfrost"
>> -        fi
>> -        ;;
>>       amdgpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't 
>> have the module in /lib
>>           mv /install/modules/lib/modules/* /lib/modules/.
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 0857773e5c5f..f8f48523ada3 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -282,29 +282,40 @@ amdgpu:stoney:
>>       - .lava-igt:arm64
>>     stage: mediatek
>>     variables:
>> -    DRIVER_NAME: mediatek
>>       DTB: ${DEVICE_TYPE}
>>       BOOT_METHOD: depthcharge
>>       KERNEL_IMAGE_TYPE: ""
>> -mediatek:mt8173:
>> +.mt8173:
>>     extends:
>>       - .mediatek
>>     parallel: 4
>>     variables:
>>       DEVICE_TYPE: mt8173-elm-hana
>> -    GPU_VERSION: mt8173
> 
> Looks like it make sense to keep GPU_VERSION here, no?
> Same comment for .mt8183.

Yes, will keep the GPU_VERSION here for mediatek jobs and others also.

Regards,
Vignesh

