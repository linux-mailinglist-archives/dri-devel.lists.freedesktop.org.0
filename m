Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409043B1B4B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAEF6E8E1;
	Wed, 23 Jun 2021 13:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97986E0FD;
 Wed, 23 Jun 2021 13:38:18 +0000 (UTC)
IronPort-SDR: tmNkx8BjDvNMerOLYD1oRQB8j8reDMLR9dnM8dbIP8cpvYa09oz3tnOIjU5zz3OHoDGbL5HCSq
 K21yoWUphH5A==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207303759"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207303759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:38:18 -0700
IronPort-SDR: 67FtzThmrc+WMNzI657Eo3Qoz/sEqioLFx5yLJT6Hhj++h4QktoEpdOYtLFr18BhpfqHIinPvw
 JGAdhvnmFMzg==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="556146595"
Received: from dconnon-mobl.ger.corp.intel.com (HELO [10.252.14.111])
 ([10.252.14.111])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:38:17 -0700
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
 <62c8a7a3-dcdd-ec6d-a976-7203e406d364@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <fbb13fc4-18bb-8e92-71b6-7a4a7d84b633@intel.com>
Date: Wed, 23 Jun 2021 14:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <62c8a7a3-dcdd-ec6d-a976-7203e406d364@linux.intel.com>
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

On 23/06/2021 14:32, Thomas Hellström wrote:
> 
> On 6/23/21 1:26 PM, Matthew Auld wrote:
>> The min_page_size is only needed for pages inserted into the GTT, and
>> for our paging structures we only need at most 4K bytes, so simply
>> ignore the min_page_size restrictions here, otherwise we might see some
>> severe overallocation on some devices.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> index 084ea65d59c0..61e8a8c25374 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>> @@ -16,7 +16,7 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct 
>> i915_address_space *vm, int sz)
>>   {
>>       struct drm_i915_gem_object *obj;
>> -    obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
>> +    obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
> 
> So is this memory always required to be size aligned? or should it say 
> sz, PAGE_SIZE?

The scratch page also hits this path, which is another can of worms. In 
terms of size it might need to be 64K(with proper physical alignment), 
which is why we can't force 4K here, and instead need to use the passed 
in size, where the returned page will have the same alignment.

> 
> /Thomas
> 
> 
