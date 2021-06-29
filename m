Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6213B79D1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 23:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F2D6E8FD;
	Tue, 29 Jun 2021 21:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF26E8FC;
 Tue, 29 Jun 2021 21:20:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="205233779"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="205233779"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 14:20:14 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="419747339"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.46.34])
 ([10.209.46.34])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 14:20:13 -0700
Subject: Re: [PATCH 10/47] drm/i915/guc: Add lrc descriptor context lookup
 array
To: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-11-matthew.brost@intel.com>
 <fa12d809-0b13-b816-d36d-d251b70918a6@intel.com>
 <20210625172659.GA11719@sdutt-i7>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <8b91c327-752f-4649-1aa3-d3c549e70eb4@intel.com>
Date: Tue, 29 Jun 2021 14:20:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625172659.GA11719@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/2021 10:26, Matthew Brost wrote:
> On Fri, Jun 25, 2021 at 03:17:51PM +0200, Michal Wajdeczko wrote:
>> On 24.06.2021 09:04, Matthew Brost wrote:
>>> Add lrc descriptor context lookup array which can resolve the
>>> intel_context from the lrc descriptor index. In addition to lookup, it
>>> can determine in the lrc descriptor context is currently registered with
>>> the GuC by checking if an entry for a descriptor index is present.
>>> Future patches in the series will make use of this array.
>> s/lrc/LRC
>>
> I guess? lrc and LRC are used interchangeably throughout the current
> code base.
It is an abbreviation so LRC is technically the correct version for a 
comment. The fact that other existing comments are incorrect is not a 
valid reason to perpetuate a mistake :). Might as well fix it if you are 
going to repost the patch anyway for any other reason, but I would not 
call it a blocking issue.

Also, 'can determine in the' should be 'can determine if the'. Again, 
not exactly a blocking issue but should be fixed.

>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
>>>   2 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index b28fa54214f2..2313d9fc087b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -6,6 +6,8 @@
>>>   #ifndef _INTEL_GUC_H_
>>>   #define _INTEL_GUC_H_
>>>   
>>> +#include "linux/xarray.h"
>> #include <linux/xarray.h>
>>
> Yep.
>
>>> +
>>>   #include "intel_uncore.h"
>>>   #include "intel_guc_fw.h"
>>>   #include "intel_guc_fwif.h"
>>> @@ -46,6 +48,9 @@ struct intel_guc {
>>>   	struct i915_vma *lrc_desc_pool;
>>>   	void *lrc_desc_pool_vaddr;
>>>   
>>> +	/* guc_id to intel_context lookup */
>>> +	struct xarray context_lookup;
>>> +
>>>   	/* Control params for fw initialization */
>>>   	u32 params[GUC_CTL_MAX_DWORDS];
>> btw, IIRC there was idea to move most struct definitions to
>> intel_guc_types.h, is this still a plan ?
>>
> I don't ever recall discussing this but we can certainly do this. For
> what it is worth we do introduce intel_guc_submission_types.h a bit
> later. I'll make a note about intel_guc_types.h though.
>
> Matt
Yeah, my only recollection was about the submission types header. Are 
there sufficient non-submission fields in the GuC structure to warrant a 
general GuC types header?

With the commit message tweaks and #include fix mentioned above, it 
looks good to me.
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>>>   
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index a366890fb840..23a94a896a0b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -65,8 +65,6 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>>>   	return rb_entry(rb, struct i915_priolist, node);
>>>   }
>>>   
>>> -/* Future patches will use this function */
>>> -__attribute__ ((unused))
>>>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>>>   {
>>>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>>> @@ -76,6 +74,15 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>>>   	return &base[index];
>>>   }
>>>   
>>> +static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>>> +{
>>> +	struct intel_context *ce = xa_load(&guc->context_lookup, id);
>>> +
>>> +	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
>>> +
>>> +	return ce;
>>> +}
>>> +
>>>   static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>>>   {
>>>   	u32 size;
>>> @@ -96,6 +103,25 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
>>>   	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
>>>   }
>>>   
>>> +static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
>>> +{
>>> +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>>> +
>>> +	memset(desc, 0, sizeof(*desc));
>>> +	xa_erase_irq(&guc->context_lookup, id);
>>> +}
>>> +
>>> +static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
>>> +{
>>> +	return __get_context(guc, id);
>>> +}
>>> +
>>> +static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
>>> +					   struct intel_context *ce)
>>> +{
>>> +	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
>>> +}
>>> +
>>>   static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>   {
>>>   	/* Leaving stub as this function will be used in future patches */
>>> @@ -400,6 +426,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>>>   	 */
>>>   	GEM_BUG_ON(!guc->lrc_desc_pool);
>>>   
>>> +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>>

