Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75E39F07F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEDF6EB26;
	Tue,  8 Jun 2021 08:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F746EB23;
 Tue,  8 Jun 2021 08:13:57 +0000 (UTC)
IronPort-SDR: kkXA409QNNd+tWNNnhsKZp2tQPQ9hmQOUphr5UhNi9W/Nzkydk3LZCQk5FTwKvnFfnba9mLNyd
 Ab23ZKgmo/Kw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192121531"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="192121531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:13:55 -0700
IronPort-SDR: liBxa8jaN66qQD8lIj0GattY9dd/+/vuQMLMiRNEVf9NdwGJEPuP93faIy/kcLMZ7jgl65Y92j
 JTD/Cp0abBFg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="485127102"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO [10.215.170.251])
 ([10.215.170.251])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:13:53 -0700
Subject: Re: [PATCH 5/6] drm/i915/ttm: switch over to ttm_buddy_man
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-6-matthew.auld@intel.com>
 <b741db2d0b50b634a995d6f7bbfbf70b35818850.camel@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <53aa14b3-87b5-65e9-42e3-198dc55c0a51@intel.com>
Date: Tue, 8 Jun 2021 09:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b741db2d0b50b634a995d6f7bbfbf70b35818850.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2021 08:39, Thomas Hellström wrote:
> On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
>> Move back to the buddy allocator for managing device local memory,
>> and
>> restore the lost mock selftests. Keep around the range manager
>> related
>> bits, since we likely need this for managing stolen at some point.
>> For
>> stolen we also don't need to reserve anything so no need to support a
>> generic reserve interface.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  26 +--
>>   drivers/gpu/drm/i915/intel_memory_region.c    |  55 +-----
>>   drivers/gpu/drm/i915/intel_memory_region.h    |  17 --
>>   drivers/gpu/drm/i915/intel_region_ttm.c       | 100 +++--------
>>   .../drm/i915/selftests/intel_memory_region.c  | 170 ++++++++++++----
>> --
>>
> 
> ...
> 
>>   
>>   static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>> @@ -661,20 +661,8 @@ int __i915_gem_ttm_object_init(struct
>> intel_memory_region *mem,
>>          static struct lock_class_key lock_class;
>>          struct drm_i915_private *i915 = mem->i915;
>>          enum ttm_bo_type bo_type;
>> -       size_t alignment = 0;
>>          int ret;
>>   
>> -       /* Adjust alignment to GPU- and CPU huge page sizes. */
>> -
>> -       if (mem->is_range_manager) {
>> -               if (size >= SZ_1G)
>> -                       alignment = SZ_1G >> PAGE_SHIFT;
>> -               else if (size >= SZ_2M)
>> -                       alignment = SZ_2M >> PAGE_SHIFT;
>> -               else if (size >= SZ_64K)
>> -                       alignment = SZ_64K >> PAGE_SHIFT;
>> -       }
>> -
>>          drm_gem_private_object_init(&i915->drm, &obj->base, size);
>>          i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
>> flags);
>>          i915_gem_object_init_memory_region(obj, mem);
>> @@ -696,7 +684,7 @@ int __i915_gem_ttm_object_init(struct
>> intel_memory_region *mem,
>>           */
>>          obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>>          ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>> -                         bo_type, &i915_sys_placement, alignment,
>> +                         bo_type, &i915_sys_placement, PAGE_SIZE,
> 
> Actually just realized that the alignment is specified in PAGE_SIZE
> units, so above should be s/PAGE_SIZE/1/. Might need to check that the
> buddy TTM interface gets this right as well.

Oops, and yes it looks like the buddy is also confused here.

> 
> 
