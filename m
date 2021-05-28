Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D05393D5C
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 08:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E726F57C;
	Fri, 28 May 2021 06:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A336F57B;
 Fri, 28 May 2021 06:52:07 +0000 (UTC)
IronPort-SDR: cI4Zg07bXoSPrR/Q0Zd523hq/22dIprM2JAS3m1iKdBPFGnMxGYiADXys4Hq6a7ha4u5NAp7Vp
 gB51np2WxiOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="190022170"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="190022170"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 23:52:04 -0700
IronPort-SDR: CiwW5Lp2FP9F6zbVskbeG4WuIrIjifEmWZG6hslaJqGgAkqwcjIjK3/d5IALhcov4RN8/xnC+c
 +wJq/6yGOwFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="615661689"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga005.jf.intel.com with ESMTP; 27 May 2021 23:52:03 -0700
Received: from [10.249.150.132] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.132])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14S6q2lX009395; Fri, 28 May 2021 07:52:02 +0100
Subject: Re: [Intel-gfx] [PATCH 15/18] drm/i915/guc: Ensure H2G buffer updates
 visible before tail update
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-16-matthew.brost@intel.com>
 <3d18d63d-8359-5ce0-0320-104436d57198@intel.com>
 <20210526175818.GB31459@sdutt-i7>
 <7b59483a-83ed-8857-ad8f-e2df7bb94cb6@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <51b9bd05-7d6f-29f1-de0f-3a14bade6c9c@intel.com>
Date: Fri, 28 May 2021 08:52:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <7b59483a-83ed-8857-ad8f-e2df7bb94cb6@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28.05.2021 03:13, John Harrison wrote:
> On 5/26/2021 10:58, Matthew Brost wrote:
>> On Wed, May 26, 2021 at 02:36:18PM +0200, Michal Wajdeczko wrote:
>>> On 26.05.2021 08:42, Matthew Brost wrote:
>>>> Ensure H2G buffer updates are visible before descriptor tail updates by
>>>> inserting a barrier between the H2G buffer update and the tail. The
>>>> barrier is simple wmb() for SMEM and is register write for LMEM.
>>>> This is
>>>> needed if more than 1 H2G can be inflight at once.
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 18 ++++++++++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> index fb875d257536..42063e1c355d 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> @@ -328,6 +328,18 @@ static u32 ct_get_next_fence(struct
>>>> intel_guc_ct *ct)
>>>>       return ++ct->requests.last_fence;
>>>>   }
>>>>   +static void write_barrier(struct intel_guc_ct *ct) {
>>>> +    struct intel_guc *guc = ct_to_guc(ct);
>>>> +    struct intel_gt *gt = guc_to_gt(guc);
>>>> +
>>>> +    if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
>>>> +        GEM_BUG_ON(guc->send_regs.fw_domains);
>>>> +        intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
>>> hmm, as this is one of the GuC scratch registers used for H2G MMIO
>>> communication, writing 0 there might be interpreted by the GuC as new
>>> request with action=0 and might results in extra processing/logging on
>>> GuC side, and, since from here we don't protect access to this register
>>> by send_mutex, we can corrupt other MMIO message being prepared from
>>> different thread, ... can't we use other register ?
>>>
>> Hmm, this code has been internal for a long time and we haven't seen an
>> issues. MMIOs are always attempted to be processed each interrupt and
>> then CTBs are processed next. A value a 0 in scratch0 results in no MMIOs
>> being processed as a value of 0 is a reserved action which translates to
>> a NOP.
>>
>> Also in the current i915 once CTBs are enabled MMIOs are never used.
>> That being said, I think once we transition to the new interface +
>> enable suspend on a VF MMIOs might be used.
>>
>> With that I purpose that we merge this as is with a comment saying if we
>> ever mix CTBs and MMIOs we need to find another MMIO register. I don't
>> changing this now is worth delaying upstreaming this and also any change
>> we make now will make us lose confidence in code that has been
>> thoroughly tested.
>>
>> Matt
> This was discussed in chat while inspecting the GuC firmware code.
> Writing zero to the scratch does indeed not trigger any extra processing
> of spurious MMIO H2Gs. The register is indeed always checked when the
> host triggers a CTB H2G, but zero counts as invalid and thus will be
> skipped.
> 
> So with a comment about not mixing CTB and MMIOs, I think we are good
> for now. It seems unlikely that MMIOs & CTB would be mixed. MMIOs are
> only used for initialisation operations and should not be necessary once
> the CTBs are up and running. If mixing does occur in the future, it
> sounds like something that should be addressed at the GuC architecture
> level!

well, unlikely is not the same as not possible...

especially that on MMIO path we are protecting access to this register,
so maybe, to try capture any unexpected scenarios, we should at least
add something like:

	GEM_WARN_ON(mutex_is_locked(&guc->send_mutex))

and since you already check for send_regs.fw_domains actual register
offset should be taken from send_regs.base ?

alternatively, since I doubt that we have to use this specific send
register, we could define i915 level function for the purpose of
triggering write barrier (or maybe we already have one?) that is using
register that is not conflicting with guc MMIO communication...

note, in case you can't find any other safe register to write, maybe
better option to use is SOFT_SCRATCH(0xc180) that is still available on
Gen11, but it is not used by GuC any more for MMIO communication, and on
Gen9 we don't have lmem so no conflict at all, which we can check with:

	GEM_BUG_ON(send_regs.base == SOFT_SCRATCH)

and then we should be safe for sure, not just "unlikely"

Michal

> 
> With the comment added:
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> 
> 
>>  
>>>> +    } else {
>>>> +        wmb();
>>>> +    }
>>>> +}
>>>> +
>>>>   /**
>>>>    * DOC: CTB Host to GuC request
>>>>    *
>>>> @@ -411,6 +423,12 @@ static int ct_write(struct intel_guc_ct *ct,
>>>>       }
>>>>       GEM_BUG_ON(tail > size);
>>>>   +    /*
>>>> +     * make sure H2G buffer update and LRC tail update (if this
>>>> triggering a
>>>> +     * submission) are visible before updating the descriptor tail
>>>> +     */
>>>> +    write_barrier(ct);
>>>> +
>>>>       /* now update desc tail (back in bytes) */
>>>>       desc->tail = tail * 4;
>>>>       return 0;
>>>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
