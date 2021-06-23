Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC23B1B54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F3E6E0FD;
	Wed, 23 Jun 2021 13:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA536E0FD;
 Wed, 23 Jun 2021 13:39:49 +0000 (UTC)
IronPort-SDR: To1PRn6e3nfvbhR4gsCYjW0EKGm1yPJkjNfmISGTPClMRg89EzjOTWny6FchvCucgHF5CL3bFQ
 25PYgs0bD6IA==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207079119"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207079119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:39:49 -0700
IronPort-SDR: NWu3WrtkcX/QcWVFULjOqZtpp3hP2On52So8K+zEupHyrHkn5WO7/f5SxSaCVCvx30HpVXk00P
 bIQ1OAFkFt3g==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="639454086"
Received: from bkuncer-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:39:48 -0700
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
 <62c8a7a3-dcdd-ec6d-a976-7203e406d364@linux.intel.com>
 <fbb13fc4-18bb-8e92-71b6-7a4a7d84b633@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <3612201f-27e0-b6e1-09f3-347b284fea4a@linux.intel.com>
Date: Wed, 23 Jun 2021 15:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fbb13fc4-18bb-8e92-71b6-7a4a7d84b633@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/23/21 3:38 PM, Matthew Auld wrote:
> On 23/06/2021 14:32, Thomas Hellström wrote:
>>
>> On 6/23/21 1:26 PM, Matthew Auld wrote:
>>> The min_page_size is only needed for pages inserted into the GTT, and
>>> for our paging structures we only need at most 4K bytes, so simply
>>> ignore the min_page_size restrictions here, otherwise we might see some
>>> severe overallocation on some devices.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> index 084ea65d59c0..61e8a8c25374 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> @@ -16,7 +16,7 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct 
>>> i915_address_space *vm, int sz)
>>>   {
>>>       struct drm_i915_gem_object *obj;
>>> -    obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
>>> +    obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
>>
>> So is this memory always required to be size aligned? or should it 
>> say sz, PAGE_SIZE?
>
> The scratch page also hits this path, which is another can of worms. 
> In terms of size it might need to be 64K(with proper physical 
> alignment), which is why we can't force 4K here, and instead need to 
> use the passed in size, where the returned page will have the same 
> alignment.

OK. Perhaps a comment to explain that?

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



>
>>
>> /Thomas
>>
>>
