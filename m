Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82898C7A6FE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0DA10E8A1;
	Fri, 21 Nov 2025 15:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="o+lIEU87";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="wqEN6L/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB810E8A0;
 Fri, 21 Nov 2025 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763737958;
 bh=kPQXD4Dn338DYWCrtFF4wKM
 K1WIF/G0lO/tFedF0ItU=; b=o+lIEU87wIJmwS1sJpQnkVscTh1sXpi91y5U4D3sCQHCrFXsmO
 J200Uoj1Fwc3m52Jfj7c6f8m9zd72wuevhWSzPgCGqlUEC6Rbq1BGSBv1hJWryTOoD9eCnakaOU
 EVCtA2pLpa5w91Y+VJbR3kcGwkeY4UcgxrmV7kyxZelyAtkNh7kKjseKhx3BVbs9OGgvaBU1Upf
 JCvC2Q61NIO2EOc5Fie0SxVMmXzOmBPPELTQVeJguVZIaWjPiF85bUnZjW++D6bnQ9Zub4ZR4fy
 qykdAYLHwBJZCntgUVU50+sXqVifqC15SrGYZbcPC36l2Pjamn3/ANNkkUbaFzdSBFA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1763737958; bh=kPQXD4Dn338DYWCrtFF4wKM
 K1WIF/G0lO/tFedF0ItU=; b=wqEN6L/orkrf0QBkMZR1cLq4fRnT6IhpFt1Gb3sruUOlFI9zBj
 L1qamtiq9DrI0pdkgROEQ6iF+0eJP7oeCeDQ==;
Message-ID: <41ae6d5b-8b50-427b-a89e-d9c5df7779b8@damsy.net>
Date: Fri, 21 Nov 2025 16:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-19-pierre-eric.pelloux-prayer@amd.com>
 <1afb2956-af6c-4218-83b3-85f241332ec9@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <1afb2956-af6c-4218-83b3-85f241332ec9@amd.com>
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



Le 21/11/2025 à 16:08, Christian König a écrit :
> 
> 
> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>> It avoids duplicated code and allows to output a warning.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ++++++
>>   2 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 54f7c81f287b..7167db54d722 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>   	if (r)
>>   		goto init_failed;
>>   
>> -	if (adev->mman.buffer_funcs_ring &&
>> -	    adev->mman.buffer_funcs_ring->sched.ready)
>> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>   
>>   	/* Don't init kfd if whole hive need to be reset during init */
>>   	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
>> @@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>>   
>>   	r = amdgpu_device_ip_resume_phase2(adev);
>>   
>> -	if (adev->mman.buffer_funcs_ring->sched.ready)
>> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>   
>>   	if (r)
>>   		return r;
>> @@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>>   	return 0;
>>   
>>   unwind_evict:
>> -	if (adev->mman.buffer_funcs_ring->sched.ready)
>> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
>> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>   	amdgpu_fence_driver_hw_init(adev);
>>   
>>   unwind_userq:
>> @@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>>   				if (r)
>>   					goto out;
>>   
>> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
>> -					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>> +				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>>   
>>   				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>>   				if (r)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 489880b2fb8e..9024dde0c5a7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2233,6 +2233,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
>>   		return reserved_windows;
>>   
>> +	if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
>> +	    enable) {
>> +		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
>> +		return 0;
>> +	}
>> +
> 
> Only check that when enabling the functions. Could be that when disabling them we have sched.ready set to false already.

The check already has a "&& enable" condition. Are you suggesting something 
different?

PE


> 
> Apart from that looks good to me.
> 
> Regards,
> Christian.
> 
>>   	if (enable) {
>>   		struct amdgpu_ring *ring;
>>   		struct drm_gpu_scheduler *sched;
