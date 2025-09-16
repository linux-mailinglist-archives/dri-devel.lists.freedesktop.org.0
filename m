Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00402B592A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC75E10E06D;
	Tue, 16 Sep 2025 09:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="Skod6a4S";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="vZfv9NrG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B1B10E06D;
 Tue, 16 Sep 2025 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758016016;
 bh=Lw5b7TXcMg3JXhTW21quZEg
 f6zfs+5Zv5AvVuEz3Cus=; b=Skod6a4SqRLCa3zqXz79atqi7zz6Wlq+/OKp6Vyo+Qat2w/EDX
 hfaU8yo+KkFpDTR6uVV4Cx+ehWFTaEfX9TratMUR5HxQu6mtVYBWz81CIwjiZvg2iSk5Os3qFyz
 00vWHYcBiLZ5WeT+vCtYBI8YPk2dEJL6D29kLNi4Mkmx7FBCdaz98LQBaNMySYbn26N2Cpt2+fH
 pMMNZMDAB+qsF9nvqqMT6N4IpdarrKbMiDF0OblJYxQFtpOSjH2JNbox2O15QgtL5+j1hBaEwDe
 ESbBe/qMOEEg/RDypkHf90nnSd6OOF6Zkf4uxCVTM1UDPIhpTa2UMVzFEojDAvixl9Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758016016; bh=Lw5b7TXcMg3JXhTW21quZEg
 f6zfs+5Zv5AvVuEz3Cus=; b=vZfv9NrGoTKXlQ8fPArS/FZ8QOCXV1+JJrONHcftRjpLK2PEnY
 fs/cgDH2X7eIUw1OEJQ/1pcoAgKPhyYuaVCA==;
Message-ID: <9e1964bf-7748-4e41-9048-b1a5ad63a8c9@damsy.net>
Date: Tue, 16 Sep 2025 11:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: make non-NULL out fence mandatory
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
 <f66cc34f-b54b-4f91-a6fe-11a146c516b2@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <f66cc34f-b54b-4f91-a6fe-11a146c516b2@amd.com>
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



Le 16/09/2025 à 11:25, Christian König a écrit :
> On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
>> amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
>> fence is non-NULL to simplify the code.
>> Since none of the pointers should be NULL, we can enable
>> __attribute__((nonnull))__.
>>
>> While at it make the function static since it's only used from
>> amdgpuu_ttm.c.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>>   2 files changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 27ab4e754b2a..70b817b5578d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>    * move and different for a BO to BO copy.
>>    *
>>    */
>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>> -			       const struct amdgpu_copy_mem *src,
>> -			       const struct amdgpu_copy_mem *dst,
>> -			       uint64_t size, bool tmz,
>> -			       struct dma_resv *resv,
>> -			       struct dma_fence **f)
>> +__attribute__((nonnull))
> 
> That looks fishy.
> 
>> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>> +				      const struct amdgpu_copy_mem *src,
>> +				      const struct amdgpu_copy_mem *dst,
>> +				      uint64_t size, bool tmz,
>> +				      struct dma_resv *resv,
>> +				      struct dma_fence **f)
> 
> I'm not an expert for those, but looking at other examples that should be here and look something like:
> 
> __attribute__((nonnull(7)))

Both syntax are valid. The GCC docs says:

    If no arg-index is given to the nonnull attribute, all pointer arguments are 
marked as non-null


> 
> But I think for this case here it is also not a must have to have that.

I can remove it if you prefer, but it doesn't hurt to have the compiler validate 
usage of the functions.

Pierre-Eric


> 
> Regards,
> Christian.
> 
>>   {
>>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>   	struct amdgpu_res_cursor src_mm, dst_mm;
>> @@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>   	}
>>   error:
>>   	mutex_unlock(&adev->mman.gtt_window_lock);
>> -	if (f)
>> -		*f = dma_fence_get(fence);
>> -	dma_fence_put(fence);
>> +	*f = fence;
>>   	return r;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index bb17987f0447..07ae2853c77c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>   		       struct dma_resv *resv,
>>   		       struct dma_fence **fence, bool direct_submit,
>>   		       bool vm_needs_flush, uint32_t copy_flags);
>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>> -			       const struct amdgpu_copy_mem *src,
>> -			       const struct amdgpu_copy_mem *dst,
>> -			       uint64_t size, bool tmz,
>> -			       struct dma_resv *resv,
>> -			       struct dma_fence **f);
>>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   			    struct dma_resv *resv,
>>   			    struct dma_fence **fence);
