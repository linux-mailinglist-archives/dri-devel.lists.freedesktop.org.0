Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245489F0ED3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 15:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2410E1F1;
	Fri, 13 Dec 2024 14:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fizE5Mk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0E310E1B6;
 Fri, 13 Dec 2024 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=587hDqcnKGq/bywvORxhW/qrnyvDDPlNgcMgllHItw4=; b=fizE5Mk9MPAJ77lbIvT/XXy3s4
 +6dEhX43NYQHMpkr4d4naK7v5ufVEg512QX0on5IqJwUmlIpyVRBNwO+6X27PqcMIsog2AShcsUlG
 XgWgDI9hG2wYicxbDv+Dfv0Vgw9i4O1PGKDhHwo9v0UC9W0pfWstUGyfmt3N/kpVcVBGPYGGKbxiF
 sk0AHheO/nHgk6dvnTQi854TSMqHu6kdhZsa0bhUV7A8D3NiaHssPccPWWy//h8QDggio1uvSdrln
 0W1ktme8f8t9/L6xf7xu8v0PhBKaM2tjcmjVeHbA51e7hToaFJd+JJfs7fIpIvyTmy4sbc7++QU26
 o569INLw==;
Received: from [179.193.1.214] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tM6SA-002g5A-2u; Fri, 13 Dec 2024 15:15:38 +0100
Message-ID: <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
Date: Fri, 13 Dec 2024 11:15:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
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

Hi Christian,

Em 13/12/2024 04:34, Christian König escreveu:
> Am 12.12.24 um 20:09 schrieb André Almeida:
>> Use DRM's device wedged event to notify userspace that a reset had
>> happened. For now, only use `none` method meant for telemetry
>> capture.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_device.c
>> index 96316111300a..19e1a5493778 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>           dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>>       atomic_set(&adev->reset_domain->reset_res, r);
>> +
>> +    drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> 
> That looks really good in general. I would just make the 
> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
> 

Why depend or `r`? A reset was triggered anyway, regardless of the 
success of it, shouldn't we tell userspace?
