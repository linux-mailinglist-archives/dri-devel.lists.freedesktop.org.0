Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07101BC8275
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 10:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA02B10E984;
	Thu,  9 Oct 2025 08:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nm+Chcyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB9510E983;
 Thu,  9 Oct 2025 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVPxHSD4tXRnns6Wf4cFigHIr+ypRZwxW9OZpBHx9Cw=; b=nm+ChcyoDeDLUYCFLRV8kFI9r3
 MswRySj48b66qCPy5DqT/f/i0I5fD5BkxvysDUgkBS4zTynbZI85zjt8q30/X7vIVhvJZPLMmUNWI
 ewj65cH1qLnFKP/iOKzDyILiLmlR5eLTHxDfDbUf7Po3Iv5fJogYLSsrDSRL8iBHWP4xSWD4bT4vn
 jrAKEpgsaVDz+/J1BazlFsEvJ05UKIcLh22+ou4rfPd29WLItCXFcsQ9mxVAddRFH7D8m58Ous3ti
 L8Nn5e6V8P13zraiq0ahKUSMR+FvVVtYapmCBi6hWQiCGq9ZlQG5ZAiUkdGRzbPZylhsqbwywTHjT
 E1UPkYAQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v6mTi-007NRp-An; Thu, 09 Oct 2025 10:58:26 +0200
Message-ID: <01bacdec-f1bd-4ddc-a537-6a091c1a1eb8@igalia.com>
Date: Thu, 9 Oct 2025 09:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: Configure max beneficial TTM pool
 allocation order
To: Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 thomas.hellstrom@linux.intel.com
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <20251008115314.55438-6-tvrtko.ursulin@igalia.com>
 <aObxU8vEbEQEf7QO@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aObxU8vEbEQEf7QO@lstrano-desk.jf.intel.com>
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


On 09/10/2025 00:18, Matthew Brost wrote:
> On Wed, Oct 08, 2025 at 12:53:14PM +0100, Tvrtko Ursulin wrote:
>> Let the TTM pool allocator know that we can afford for it to expend less
>> effort for satisfying contiguous allocations larger than 2MiB. The latter
>> is the maximum relevant PTE entry size and the driver and hardware are
>> happy to get larger blocks only opportunistically.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> +Thomas - Seems like we'd want to do this in Xe too?
> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 948c6d0a422b..723b885210a7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1837,7 +1837,7 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>>   	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>>   		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>>   			      adev->gmc.mem_partitions[i].numa.node,
>> -			      0);
>> +			      TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
> 
> SZ_2M btw.

I thought I grepped exactly to see if that existed but apparently I did 
not, thanks!

Regards,

Tvrtko

> 
> Matt
> 
>>   	}
>>   	return 0;
>>   }
>> @@ -1931,7 +1931,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>>   			       adev_to_drm(adev)->anon_inode->i_mapping,
>>   			       adev_to_drm(adev)->vma_offset_manager,
>>   			       (adev->need_swiotlb ? TTM_POOL_USE_DMA_ALLOC : 0) |
>> -			       (dma_addressing_limited(adev->dev) ? TTM_POOL_USE_DMA32 : 0));
>> +			       (dma_addressing_limited(adev->dev) ? TTM_POOL_USE_DMA32 : 0) |
>> +			       TTM_POOL_BENEFICIAL_ORDER(get_order(2 * SZ_1M)));
>>   	if (r) {
>>   		dev_err(adev->dev,
>>   			"failed initializing buffer object driver(%d).\n", r);
>> -- 
>> 2.48.0
>>

