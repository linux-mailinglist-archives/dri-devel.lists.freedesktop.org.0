Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DDF3B19DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB41F6E8D3;
	Wed, 23 Jun 2021 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11746E8D4;
 Wed, 23 Jun 2021 12:25:28 +0000 (UTC)
IronPort-SDR: N2nZnG09KaRZyYPOxOfCQpG64iUeXWqxPCZdpea3geRrW92q+go+4gTjN0l4A5GfIDuPVHfeW2
 6aR+eSPP1MYA==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207066044"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207066044"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:25:27 -0700
IronPort-SDR: DheJDumbH+dm8wOCtzxqpNWaWwp1ErVaALMWZ760nx6jeAzAUPwcKfoomp/D0frnExsEyn7SUQ
 4a99IKqnuY/g==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="556129300"
Received: from dconnon-mobl.ger.corp.intel.com (HELO [10.252.14.111])
 ([10.252.14.111])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:25:25 -0700
Subject: Re: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging
 structures
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210623112637.266855-1-matthew.auld@intel.com>
 <20210623112637.266855-3-matthew.auld@intel.com>
 <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <dcb9729d-fd1c-900e-bb6e-38eb2cf208d2@intel.com>
Date: Wed, 23 Jun 2021 13:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a5c0dca7-a586-15b6-6004-09d320b1159e@linux.intel.com>
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

On 23/06/2021 12:51, Thomas Hellström wrote:
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
>>       /*
>>        * Ensure all paging structures for this vm share the same dma-resv
>>        * object underneath, with the idea that one object_lock() will 
>> lock
> 
> I think for this one the new gt migration code might break, because 
> there we insert even PT pages into the GTT, so it might need a special 
> interface? Ram is looking at supporter larger GPU PTE sizes with that 
> code..

For DG1 at least we don't need this. But yeah we can always just pass 
along the page size when allocating the stash I guess, if we need 
something special for migration?

But when we need to support huge PTEs for stuff other than DG1, then 
it's still a pile of work I assume, since we still need all the special 
PTE insertion routines specifically for insert_pte() which will differ 
wildly between generations, also each has quite different restrictions 
wrt min physical alignment of lmem, whether you can mix 64K/4K PTEs in 
the same 2M va range, whether 4K PTEs are even supported for lmem etc.

Not sure if it's simpler to go with mapping all of lmem upfront with the 
flat-ppGTT? Maybe that sidesteps some of these issues? At least for the 
physical alignment of paging structures that would no longer be a concern.

> 
> /Thomas
> 
> 
> 
