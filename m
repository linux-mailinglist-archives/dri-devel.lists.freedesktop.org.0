Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC49BBDF7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 20:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A0D10E4BA;
	Mon,  4 Nov 2024 19:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B1UHLEx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CCA10E4B9;
 Mon,  4 Nov 2024 19:28:39 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d4d1b48f3so2679628f8f.1; 
 Mon, 04 Nov 2024 11:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730748517; x=1731353317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gCbVXlOJCb+y4TQzL70f4UC+Z8hogxj0jY9//1oOTxs=;
 b=B1UHLEx4hDYBo1U5ZiaYXpqnHbe14qGl+yodLQlN5SFd1oSeT3Rrd3VZ6bjDWCZHIx
 XaH17V3vKnB+dWbSwpvaA3aw4BsxS57MChyq94jS1lxrDAUQzu9cFHrs9P0R5P0Yi9b0
 m8LRt/dWwEJLVY6X4W/VflX4t2mBvVku1cEBvkSjxhcYsCOJdyy0aeH1YAtIZB1Had7L
 Ndwn3eFsLjqvk3AJg/YO8VOi8SlZ/YjTcmJYqJjyuqpn7gRrsLyhsC5Yw48wBnsvxnND
 yrRN2PmyWd4n1ImT1hmElZomb9v2nqa4y6+T/5lIut3dDqXU4Gh0p/D0sukrVALV39ND
 6jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730748517; x=1731353317;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gCbVXlOJCb+y4TQzL70f4UC+Z8hogxj0jY9//1oOTxs=;
 b=ivZLAP0IbhaNvkf58BpXbifIDTIsIZxaW339J+XE+9RmGVfQxwjXk5HMhJbVjvkjKw
 0Ax7gKzaozZDKu4ZIlhdLqr9axZTiPhW5sDnWMqXxqc1Wfj3kq3HtOEb6y8iqTomG5c2
 HfB+fyxjPFcubsCku9E12CPABJ1B2QR4X4UwA0vEN/qlSnlRq05Z4qRvuRRUKNKBx40z
 tb5NJoHF8of9D81n6paIsPWqdrwCUuh8Xo+g0/oyilCX4qVU+WdlU/Cdpsz9qN1oK/fT
 D98Ki41J/eB4sSti05jnpahxaxsfX+7Fc4+9id1zNiGcp71yosafnRkdjYdy+BX5m+mE
 aDrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdO6QYTCOxM2Cveq6Gf8o52MmZpLN6WZlwitvdCvavy1WwRSQX8812e+49/PdJuGo5gOS2ZcHFyEw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa1hoJUTmXUi79LmzYK7wjjjBR3m4bJHc6BD5YlnmWB+WKoqZV
 AoUkORvV8XxwMcRgUojP3xDH426zwlLVjbGV6G2B7NFt2i1bz3dA
X-Google-Smtp-Source: AGHT+IEzS4l2D8VRRPfjugt9GrLrCrtIR4gSGroTjrmqTrJUoxBA6WDUjL/TUNKZcH9Ed877yDyBHw==
X-Received: by 2002:a5d:4d82:0:b0:371:8319:4dcc with SMTP id
 ffacd0b85a97d-381b705764fmr16103217f8f.2.1730748517054; 
 Mon, 04 Nov 2024 11:28:37 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e725dsm13991818f8f.56.2024.11.04.11.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 11:28:36 -0800 (PST)
Message-ID: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
Date: Mon, 4 Nov 2024 20:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com> <ZykFrJIx9M204Weg@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZykFrJIx9M204Weg@intel.com>
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

Am 04.11.24 um 18:34 schrieb Rodrigo Vivi:
> On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
>> On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
>>> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
>>> VRAM easily be accessed. Add ttm_bo_access, which is similar to
>>> ttm_bo_vm_access, to access such memory.
>>>
>>> v4:
>>>   - Fix checkpatch warnings (CI)
>>> v5:
>>>   - Fix checkpatch warnings (CI)
>>> v6:
>>>   - Fix kernel doc (Auld)
>>>
>> Christian - Do you mind if I merge patch along with the rest of the
>> series to drm-xe-next?
> Ray, Christian,
>
> ack on getting this patch to drm-xe-next?

No, we actually spend quite some time removing the single page mapping 
functionality for BOs.

You need a really good justification to bring that back.

Regards,
Christian.

>
>> Matt
>>
>>> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>>>   include/drm/ttm/ttm_bo.h          |  2 +
>>>   3 files changed, 89 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index d939925efa81..77e760ea7193 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>>   
>>>   	return progress;
>>>   }
>>> +
>>> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>>> +			      unsigned long offset,
>>> +			      void *buf, int len, int write)
>>> +{
>>> +	unsigned long page = offset >> PAGE_SHIFT;
>>> +	unsigned long bytes_left = len;
>>> +	int ret;
>>> +
>>> +	/* Copy a page at a time, that way no extra virtual address
>>> +	 * mapping is needed
>>> +	 */
>>> +	offset -= page << PAGE_SHIFT;
>>> +	do {
>>> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>> +		struct ttm_bo_kmap_obj map;
>>> +		void *ptr;
>>> +		bool is_iomem;
>>> +
>>> +		ret = ttm_bo_kmap(bo, page, 1, &map);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>> +		WARN_ON_ONCE(is_iomem);
>>> +		if (write)
>>> +			memcpy(ptr, buf, bytes);
>>> +		else
>>> +			memcpy(buf, ptr, bytes);
>>> +		ttm_bo_kunmap(&map);
>>> +
>>> +		page++;
>>> +		buf += bytes;
>>> +		bytes_left -= bytes;
>>> +		offset = 0;
>>> +	} while (bytes_left);
>>> +
>>> +	return len;
>>> +}
>>> +
>>> +/**
>>> + * ttm_bo_access - Helper to access a buffer object
>>> + *
>>> + * @bo: ttm buffer object
>>> + * @offset: access offset into buffer object
>>> + * @buf: pointer to caller memory to read into or write from
>>> + * @len: length of access
>>> + * @write: write access
>>> + *
>>> + * Utility function to access a buffer object. Useful when buffer object cannot
>>> + * be easily mapped (non-contiguous, non-visible, etc...).
>>> + *
>>> + * Returns:
>>> + * @len if successful, negative error code on failure.
>>> + */
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (len < 1 || (offset + len) > bo->base.size)
>>> +		return -EIO;
>>> +
>>> +	ret = ttm_bo_reserve(bo, true, false, NULL);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	switch (bo->resource->mem_type) {
>>> +	case TTM_PL_SYSTEM:
>>> +		fallthrough;
>>> +	case TTM_PL_TT:
>>> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
>>> +		break;
>>> +	default:
>>> +		if (bo->bdev->funcs->access_memory)
>>> +			ret = bo->bdev->funcs->access_memory
>>> +				(bo, offset, buf, len, write);
>>> +		else
>>> +			ret = -EIO;
>>> +	}
>>> +
>>> +	ttm_bo_unreserve(bo);
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_access);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 2c699ed1963a..20b1e5f78684 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_vm_close);
>>>   
>>> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>> -				 unsigned long offset,
>>> -				 uint8_t *buf, int len, int write)
>>> -{
>>> -	unsigned long page = offset >> PAGE_SHIFT;
>>> -	unsigned long bytes_left = len;
>>> -	int ret;
>>> -
>>> -	/* Copy a page at a time, that way no extra virtual address
>>> -	 * mapping is needed
>>> -	 */
>>> -	offset -= page << PAGE_SHIFT;
>>> -	do {
>>> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>> -		struct ttm_bo_kmap_obj map;
>>> -		void *ptr;
>>> -		bool is_iomem;
>>> -
>>> -		ret = ttm_bo_kmap(bo, page, 1, &map);
>>> -		if (ret)
>>> -			return ret;
>>> -
>>> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>> -		WARN_ON_ONCE(is_iomem);
>>> -		if (write)
>>> -			memcpy(ptr, buf, bytes);
>>> -		else
>>> -			memcpy(buf, ptr, bytes);
>>> -		ttm_bo_kunmap(&map);
>>> -
>>> -		page++;
>>> -		buf += bytes;
>>> -		bytes_left -= bytes;
>>> -		offset = 0;
>>> -	} while (bytes_left);
>>> -
>>> -	return len;
>>> -}
>>> -
>>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>   		     void *buf, int len, int write)
>>>   {
>>> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>   	unsigned long offset = (addr) - vma->vm_start +
>>>   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>>   		 << PAGE_SHIFT);
>>> -	int ret;
>>> -
>>> -	if (len < 1 || (offset + len) > bo->base.size)
>>> -		return -EIO;
>>>   
>>> -	ret = ttm_bo_reserve(bo, true, false, NULL);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	switch (bo->resource->mem_type) {
>>> -	case TTM_PL_SYSTEM:
>>> -		fallthrough;
>>> -	case TTM_PL_TT:
>>> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>> -		break;
>>> -	default:
>>> -		if (bo->bdev->funcs->access_memory)
>>> -			ret = bo->bdev->funcs->access_memory(
>>> -				bo, offset, buf, len, write);
>>> -		else
>>> -			ret = -EIO;
>>> -	}
>>> -
>>> -	ttm_bo_unreserve(bo);
>>> -
>>> -	return ret;
>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_vm_access);
>>>   
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 5804408815be..8ea11cd8df39 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>   int ttm_bo_evict_first(struct ttm_device *bdev,
>>>   		       struct ttm_resource_manager *man,
>>>   		       struct ttm_operation_ctx *ctx);
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write);
>>>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>   			     struct vm_fault *vmf);
>>>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>> -- 
>>> 2.34.1
>>>

