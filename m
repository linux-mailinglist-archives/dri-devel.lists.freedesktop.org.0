Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F6B595A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5B10E7C1;
	Tue, 16 Sep 2025 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="wJMwRSgH";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="4/0x/5Gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554F610E7C2;
 Tue, 16 Sep 2025 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758023885;
 bh=Vt5D5ja1ArnEts1Avrr6X5v
 /PXe6QruSoOeAgliPLpU=; b=wJMwRSgHL4zMOrkNn1U0JE1dhtYXuIy3dnqnvhIr+tm6vbdde5
 4xBskxixrjONjcM9yePUW1LSp9meSFH4oyP/fo+noExysUyMpiNuO2HxTK0R9DEMNrp0zDPTwwL
 WpX+KzcyqiPB6rEJTSD48UB9TvpteJMuWHXAz+GP82GjKfE2hDChxBd1W3N0VJNMexEUbaSVDjp
 Db+8g2EKmUal8KFLdJ9SiFN8LO4ijAEXmjp8Ln6H1OkFFzOOmPqL1E72DdKkdrEoIF+glTu9i3I
 BzRKtGrgPP5CzFc6QPdHqarPA1W+baIXT0auGlSSylUfC9ePvxGmmU+G5Jjt5aYaH/A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1758023885; bh=Vt5D5ja1ArnEts1Avrr6X5v
 /PXe6QruSoOeAgliPLpU=; b=4/0x/5GramnDSOzKXdsGKhZX/dKTSZ1R/R3zQcfE2p9/l82Z9M
 mCNnTuQ4azA49T5jf3nO0UVO/H+8At/i8FCA==;
Message-ID: <3b4f8837-e0a8-4e8c-9d33-5f107e41c55d@damsy.net>
Date: Tue, 16 Sep 2025 13:58:04 +0200
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
 <9e1964bf-7748-4e41-9048-b1a5ad63a8c9@damsy.net>
 <8a5f0bc8-4d3a-4e47-902e-7527759d1494@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <8a5f0bc8-4d3a-4e47-902e-7527759d1494@amd.com>
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



Le 16/09/2025 à 12:52, Christian König a écrit :
> On 16.09.25 11:46, Pierre-Eric Pelloux-Prayer wrote:
>>
>>
>> Le 16/09/2025 à 11:25, Christian König a écrit :
>>> On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
>>>> amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
>>>> fence is non-NULL to simplify the code.
>>>> Since none of the pointers should be NULL, we can enable
>>>> __attribute__((nonnull))__.
>>>>
>>>> While at it make the function static since it's only used from
>>>> amdgpuu_ttm.c.
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>>>>    2 files changed, 8 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> index 27ab4e754b2a..70b817b5578d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>> @@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>>>>     * move and different for a BO to BO copy.
>>>>     *
>>>>     */
>>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>> -                   const struct amdgpu_copy_mem *src,
>>>> -                   const struct amdgpu_copy_mem *dst,
>>>> -                   uint64_t size, bool tmz,
>>>> -                   struct dma_resv *resv,
>>>> -                   struct dma_fence **f)
>>>> +__attribute__((nonnull))
>>>
>>> That looks fishy.
>>>
>>>> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>> +                      const struct amdgpu_copy_mem *src,
>>>> +                      const struct amdgpu_copy_mem *dst,
>>>> +                      uint64_t size, bool tmz,
>>>> +                      struct dma_resv *resv,
>>>> +                      struct dma_fence **f)
>>>
>>> I'm not an expert for those, but looking at other examples that should be here and look something like:
>>>
>>> __attribute__((nonnull(7)))
>>
>> Both syntax are valid. The GCC docs says:
>>
>>     If no arg-index is given to the nonnull attribute, all pointer arguments are marked as non-null
> 
> Never seen that before. Is that gcc specifc or standardized?

clang supports it:

https://clang.llvm.org/docs/AttributeReference.html#id10

And both syntaxes are already used in the drm subtree by i915.

Pierre-Eric

> 
>>
>>
>>>
>>> But I think for this case here it is also not a must have to have that.
>>
>> I can remove it if you prefer, but it doesn't hurt to have the compiler validate usage of the functions.
> 
> Yeah it's clearly useful, but I'm worried that clang won't like it.
> 
> Christian.
> 
>>
>> Pierre-Eric
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>    {
>>>>        struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>>        struct amdgpu_res_cursor src_mm, dst_mm;
>>>> @@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>>        }
>>>>    error:
>>>>        mutex_unlock(&adev->mman.gtt_window_lock);
>>>> -    if (f)
>>>> -        *f = dma_fence_get(fence);
>>>> -    dma_fence_put(fence);
>>>> +    *f = fence;
>>>>        return r;
>>>>    }
>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> index bb17987f0447..07ae2853c77c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>>> @@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>>>>                   struct dma_resv *resv,
>>>>                   struct dma_fence **fence, bool direct_submit,
>>>>                   bool vm_needs_flush, uint32_t copy_flags);
>>>> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>> -                   const struct amdgpu_copy_mem *src,
>>>> -                   const struct amdgpu_copy_mem *dst,
>>>> -                   uint64_t size, bool tmz,
>>>> -                   struct dma_resv *resv,
>>>> -                   struct dma_fence **f);
>>>>    int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>>                    struct dma_resv *resv,
>>>>                    struct dma_fence **fence);
> 
