Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2D9F34D1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A5110E6DC;
	Mon, 16 Dec 2024 15:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p31Y9KGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40D610E3F3;
 Mon, 16 Dec 2024 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NshrB6r3ZRNacQ8/Ihm6ny01LxTZ756F2VqKtAIFRf8=; b=p31Y9KGqEJ5D2EqBljznQG1QFh
 4Qeh1m/NDFW3PF6PzOM6xf2b1NMvxtI1meLMLUB/x0/0WQVl5pSZvBBN9vaYXr4076sVIMR8svoYw
 /RlefwXuJ/IoylcvACOCq5myXqO1A2X/Cx88WMq7Nyb/paaeBsDxiVoi5fqFGB/M0g2SuObfJrt1t
 Dr7nAxe8W506MHMppkIlVjAuXeua4k6Qf7hvF67atqB0CQKKRvB8R+xEpVyhYkJRdSJMBtJLY2e5X
 Ci2psxqcK2k3bgDdig3PxPSQDychc1OgL19he4f6LpPz5/sP4zjfz56ayeUXgRbr47eQJku2AElNp
 Ph5oSorg==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNDEd-003pln-Bh; Mon, 16 Dec 2024 16:42:15 +0100
Message-ID: <bbf965fd-5c3e-4c1b-9b1e-cd178aeb1038@igalia.com>
Date: Mon, 16 Dec 2024 12:42:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>
References: <20241216150250.38242-1-andrealmeid@igalia.com>
 <20241216150250.38242-2-andrealmeid@igalia.com>
 <127f135d-72f2-47bc-a8af-93add181e7b2@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <127f135d-72f2-47bc-a8af-93add181e7b2@amd.com>
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

Em 16/12/2024 12:27, Christian König escreveu:
> Am 16.12.24 um 16:02 schrieb André Almeida:
>> Use DRM's device wedged event to notify userspace that a reset had
>> happened. For now, only use `none` method meant for telemetry
>> capture.
>>
>> In the future we might want to report a recovery method if the reset 
>> didn't
>> succeed.
>>
>> Acked-by: Shashank Sharma <shashank.sharma@amd.com>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Only report reset if reset succeeded
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_device.c
>> index 96316111300a..b0079d66d9e6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -6057,6 +6057,10 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>           dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>>       atomic_set(&adev->reset_domain->reset_res, r);
>> +
>> +    if (r)
>> +        drm_dev_wedged_event(adev_to_drm(adev), 
>> DRM_WEDGE_RECOVERY_NONE);
> 
> 
> That was not what I meant. The idea was more like:
> 
> drm_dev_wedged_event(adev_to_drm(adev), r ? TBD : DRM_WEDGE_RECOVERY_NONE);
> 

Ops, I did it wrong indeed, I meant `if (!r)`. Sending a v3 now.

> Regards,
> Christian.
> 
> 
>> +
>>       return r;
>>   }
> 

