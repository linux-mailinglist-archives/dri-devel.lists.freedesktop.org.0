Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B378C3511B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9010E6F6;
	Wed,  5 Nov 2025 10:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="u83Z4jjY";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="s9v+hOoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2710E2BE;
 Wed,  5 Nov 2025 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762337874;
 bh=nbyh8OpAclW849KgmgYxiFx
 Hidc6nJrx2ECn3zhzEIM=; b=u83Z4jjY55823A3aexf4xDWZ/52iZO6bX6WuF1VnWyH/vtdqkX
 g0ZLi+TwdykNf1BSoT35GDxnQ1aF3WHRjbi+JAhNcW+TDFHRNMOn3oxlcQP5wdA3toSfcA0omfq
 5ZQpN5E7r8BfAtp4prACivoMdkMA0km3IolZ/ZBUNGd8/i1ItpP8pCDnKwtlJJ51Sih6NxqtAOL
 nnCa7ea9ZKHYYwvanKSQuMZDG2yy8Q6c14Ex9R0MJmwLZKbYtcbc1Pk+P7vwkEXm4tQvIccLCiS
 3B4JQv0pk2fERFaFoPKkgiW4cNwYC/huBfXEu+WKbguD3qA5kNrwz8q3Gm5mJFiPddQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762337874; bh=nbyh8OpAclW849KgmgYxiFx
 Hidc6nJrx2ECn3zhzEIM=; b=s9v+hOoAV4lrBllmnqlUs8HhDJ7GkD4AoK2bVb5l2le+764Xz0
 lRsmSZ8n5MbmZ/Y+78/sjFCPtFiiAgDgaJBA==;
Message-ID: <180b5bcc-507b-4136-b56b-77553c898ce8@damsy.net>
Date: Wed, 5 Nov 2025 11:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/20] drm/amdgpu: give ttm entities access to all the
 sdma scheds
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-17-pierre-eric.pelloux-prayer@amd.com>
 <09081174-2bd0-461e-bae4-642b2cfa3c44@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <09081174-2bd0-461e-bae4-642b2cfa3c44@amd.com>
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



Le 05/11/2025 à 09:45, Christian König a écrit :
> 
> 
> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 23 ++++++++++-------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>>   2 files changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 47eaab9350ae..d88bdb2ac083 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -2187,8 +2187,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   	u32 num_clear_entities, num_move_entities;
>>   	u32 windows, w;
>>   
>> -	num_clear_entities = adev->sdma.num_instances;
>> -	num_move_entities = MIN(adev->sdma.num_instances, TTM_FENCES_MAX_SLOT_COUNT);
>> +	num_clear_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
>> +	num_move_entities = MIN(adev->mman.num_buffer_funcs_rings, TTM_FENCES_MAX_SLOT_COUNT);
>>   	man->pipelined_eviction.n_fences = num_move_entities;
>>   	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
>>   
>> @@ -2197,13 +2197,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   		return windows;
>>   
>>   	if (enable) {
>> -		struct amdgpu_ring *ring;
>> -		struct drm_gpu_scheduler *sched;
>> -
>> -		ring = adev->mman.buffer_funcs_rings[0];
>> -		sched = &ring->sched;
>>   		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>> -					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>> +					  DRM_SCHED_PRIORITY_KERNEL, adev->mman.scheds,
>>   					  1, NULL);
>>   		if (r) {
>>   			dev_err(adev->dev, "Failed setting up entity (%d)\n",
>> @@ -2215,8 +2210,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   		atomic_set(&adev->mman.next_move_entity, 0);
>>   		for (i = 0; i < num_move_entities; i++) {
>>   			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
>> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
>> -						  1, NULL);
>> +						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
>> +						  adev->mman.num_buffer_funcs_rings, NULL);
>>   			if (r) {
>>   				dev_err(adev->dev,
>>   					"Failed setting up TTM BO move entities (%d)\n",
>> @@ -2238,8 +2233,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>   
>>   		for (i = 0; i < num_clear_entities; i++) {
>>   			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
>> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
>> -						  1, NULL);
>> +						  DRM_SCHED_PRIORITY_NORMAL, adev->mman.scheds,
>> +						  adev->mman.num_buffer_funcs_rings, NULL);
>>   			if (r) {
>>   				for (j = 0; j < num_move_entities; j++)
>>   					drm_sched_entity_destroy(
>> @@ -2650,8 +2645,10 @@ void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev)
>>   	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
>>   	int i;
>>   
>> -	for (i = 0; i < adev->sdma.num_instances; i++)
>> +	for (i = 0; i < adev->sdma.num_instances; i++) {
>>   		adev->mman.buffer_funcs_rings[i] = &adev->sdma.instance[i].ring;
>> +		adev->mman.scheds[i] = &adev->sdma.instance[i].ring.sched;
>> +	}
>>   
>>   	adev->mman.num_buffer_funcs_rings = hub->sdma_invalidation_workaround ?
>>   		1 : adev->sdma.num_instances;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index d7fee371b814..c059a3d52b57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -68,6 +68,7 @@ struct amdgpu_mman {
>>   	const struct amdgpu_buffer_funcs	*buffer_funcs;
>>   	struct amdgpu_ring			*buffer_funcs_rings[AMDGPU_MAX_RINGS];
>>   	u32					num_buffer_funcs_rings;
>> +	struct drm_gpu_scheduler		*scheds[AMDGPU_MAX_RINGS];
> 
> That looks like you are duplicating the data of buffer_funcs_rings. Why?

I need a sched array to pass to drm_sched_entity_init.

That being said, I think buffer_funcs_rings could be dropped and its users be 
updated to use scheds.

Pierre-Eric
