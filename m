Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD098C01756
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 15:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CE210E8FE;
	Thu, 23 Oct 2025 13:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LLAQVP0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B97D10E0EA;
 Thu, 23 Oct 2025 13:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CM1/Eg996Dg8uoLqBE1Cayys0igXdz4f1uBhliRHr7A=; b=LLAQVP0PHuNsqp9EfEMG0PzLUr
 ZzSB87SZQOE0zy53N+kp3Ygd3FvmSozSQGT3DT24/e1lucG/XKAf+IH6tuBVvpLZud06zGNqHZrpO
 IjH+/paCO17L+OSdlWu/PIlQosEk788A34QXk0Mnt6/lcu+SQ5zNfNHIpiNZBF9a8VXyd7youEVhM
 v89GcVhpTJ/M0abxTMl37WS+PukRR14xB5fysM49RRo/MVuvobdfuH2hLw/6YkgKzVNLC+3He29/Q
 /SPwcFTqExAMNrOfAeEEvjFZE0lek+ir8hXVDEmnztcZncUPAzpjk1KRDG15NwhD8GXnirt5iP1Y4
 CABMXSfw==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBvV6-00DdRI-L6; Thu, 23 Oct 2025 15:37:08 +0200
Message-ID: <abd08302-3972-41ce-9799-7d55fff48d3b@igalia.com>
Date: Thu, 23 Oct 2025 14:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/ttm: Add an allocation flag to propagate
 -ENOSPC on OOM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
 <20251020115411.36818-7-tvrtko.ursulin@igalia.com>
 <1ddcf0013b858e3bad20de420632259ad4d8a616.camel@linux.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <1ddcf0013b858e3bad20de420632259ad4d8a616.camel@linux.intel.com>
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


On 21/10/2025 15:11, Thomas Hellström wrote:
> On Mon, 2025-10-20 at 12:54 +0100, Tvrtko Ursulin wrote:
>> Some graphics APIs differentiate between out-of-graphics-memory and
>> out-of-host-memory (system memory). Add a device init flag to have -
>> ENOSPC
>> propagated from the resource managers instead of being converted to
>> -ENOMEM, to aid driver stacks in determining what error code to
>> return or
>> whether corrective action can be taken at the driver level.
>>
>> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>> Thomas, feel free to take the ownership if you end up liking this
>> version.
>> As you can see I lifted your commit text as is and the implementation
>> is
>> the same on the high level.
> 
> Let's keep it like this. Thanks for doing this. I'll follow up with
> xeKMD change once this gets backmerged.
> 
> FWIW:
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thanks!

Before being able to merge I will however need:

  * Someone to r-b patch 2/6.
  * Christian to check if I can upgrade his r-b to v2 on patches 2, 4 and 6.
  * Maybe not strictly required since all go via drm-misc, but 3/6 could 
use acks from more driver owners.

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 4 +++-
>>   drivers/gpu/drm/ttm/ttm_device.c | 1 +
>>   include/drm/ttm/ttm_allocation.h | 1 +
>>   include/drm/ttm/ttm_device.h     | 5 +++++
>>   4 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>> b/drivers/gpu/drm/ttm/ttm_bo.c
>> index fba2a68a556e..15b3cb199d45 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -31,6 +31,7 @@
>>   
>>   #define pr_fmt(fmt) "[TTM] " fmt
>>   
>> +#include <drm/ttm/ttm_allocation.h>
>>   #include <drm/ttm/ttm_bo.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/ttm/ttm_tt.h>
>> @@ -877,7 +878,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>   
>>   	/* For backward compatibility with userspace */
>>   	if (ret == -ENOSPC)
>> -		return -ENOMEM;
>> +		return bo->bdev->alloc_flags &
>> TTM_ALLOCATION_PROPAGATE_ENOSPC ?
>> +		       ret : -ENOMEM;
>>   
>>   	/*
>>   	 * We might need to add a TTM.
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index 87c85ccb21ac..5c10e5fbf43b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -227,6 +227,7 @@ int ttm_device_init(struct ttm_device *bdev,
>> const struct ttm_device_funcs *func
>>   		return -ENOMEM;
>>   	}
>>   
>> +	bdev->alloc_flags = alloc_flags;
>>   	bdev->funcs = funcs;
>>   
>>   	ttm_sys_man_init(bdev);
>> diff --git a/include/drm/ttm/ttm_allocation.h
>> b/include/drm/ttm/ttm_allocation.h
>> index 8f8544760306..655d1e44aba7 100644
>> --- a/include/drm/ttm/ttm_allocation.h
>> +++ b/include/drm/ttm/ttm_allocation.h
>> @@ -7,5 +7,6 @@
>>   #define TTM_ALLOCATION_POOL_BENEFICIAL_ORDER(n)	((n) & 0xff)
>> /* Max order which caller can benefit from */
>>   #define TTM_ALLOCATION_POOL_USE_DMA_ALLOC 	BIT(8) /* Use
>> coherent DMA allocations. */
>>   #define TTM_ALLOCATION_POOL_USE_DMA32		BIT(9) /* Use
>> GFP_DMA32 allocations. */
>> +#define TTM_ALLOCATION_PROPAGATE_ENOSPC		BIT(10) /*
>> Do not convert ENOSPC from resource managers to ENOMEM. */
>>   
>>   #endif
>> diff --git a/include/drm/ttm/ttm_device.h
>> b/include/drm/ttm/ttm_device.h
>> index 074b98572275..d016360e5ceb 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -220,6 +220,11 @@ struct ttm_device {
>>   	 */
>>   	struct list_head device_list;
>>   
>> +	/**
>> +	 * @alloc_flags: TTM_ALLOCATION_ flags.
>> +	 */
>> +	unsigned int alloc_flags;
>> +
>>   	/**
>>   	 * @funcs: Function table for the device.
>>   	 * Constant after bo device init
> 

