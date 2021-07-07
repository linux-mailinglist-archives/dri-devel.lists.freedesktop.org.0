Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93573BEE88
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 20:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B826E1A2;
	Wed,  7 Jul 2021 18:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF356E197;
 Wed,  7 Jul 2021 18:19:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="206345777"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="206345777"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:19:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="560351623"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.109.109])
 ([10.209.109.109])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:19:01 -0700
Subject: Re: [PATCH 6/7] drm/i915/guc: Optimize CTB writes and reads
To: Matthew Brost <matthew.brost@intel.com>
References: <20210706222010.101522-1-matthew.brost@intel.com>
 <20210706222010.101522-7-matthew.brost@intel.com>
 <9834f3c0-a1a3-9b1a-d291-732501b7a013@intel.com>
 <20210707175015.GA17157@DUT029-TGLY.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <9f72e74d-f2ae-65ba-cb0d-fc1a7b4df08c@intel.com>
Date: Wed, 7 Jul 2021 11:19:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707175015.GA17157@DUT029-TGLY.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/2021 10:50, Matthew Brost wrote:
> On Tue, Jul 06, 2021 at 03:51:00PM -0700, John Harrison wrote:
>> On 7/6/2021 15:20, Matthew Brost wrote:
>>> CTB writes are now in the path of command submission and should be
>>> optimized for performance. Rather than reading CTB descriptor values
>>> (e.g. head, tail) which could result in accesses across the PCIe bus,
>>> store shadow local copies and only read/write the descriptor values when
>>> absolutely necessary. Also store the current space in the each channel
>>> locally.
>>>
>>> v2:
>>>    (Michal)
>>>     - Add additional sanity checks for head / tail pointers
>>>     - Use GUC_CTB_HDR_LEN rather than magic 1
>>> v3:
>>>    (Michal / John H)
>>>     - Drop redundant check of head value
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 88 +++++++++++++++--------
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 ++
>>>    2 files changed, 65 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> index db3e85b89573..4a73a1f03a9b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> @@ -130,6 +130,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
>>>    static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
>>>    {
>>>    	ctb->broken = false;
>>> +	ctb->tail = 0;
>>> +	ctb->head = 0;
>>> +	ctb->space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size);
>>> +
>>>    	guc_ct_buffer_desc_init(ctb->desc);
>>>    }
>>> @@ -383,10 +387,8 @@ static int ct_write(struct intel_guc_ct *ct,
>>>    {
>>>    	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>    	struct guc_ct_buffer_desc *desc = ctb->desc;
>>> -	u32 head = desc->head;
>>> -	u32 tail = desc->tail;
>>> +	u32 tail = ctb->tail;
>>>    	u32 size = ctb->size;
>>> -	u32 used;
>>>    	u32 header;
>>>    	u32 hxg;
>>>    	u32 type;
>>> @@ -396,25 +398,22 @@ static int ct_write(struct intel_guc_ct *ct,
>>>    	if (unlikely(desc->status))
>>>    		goto corrupted;
>>> -	if (unlikely((tail | head) >= size)) {
>>> +	GEM_BUG_ON(tail > size);
>>> +
>>> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>>> +	if (unlikely(tail != READ_ONCE(desc->tail))) {
>>> +		CT_ERROR(ct, "Tail was modified %u != %u\n",
>>> +			 desc->tail, ctb->tail);
>>> +		desc->status |= GUC_CTB_STATUS_MISMATCH;
>>> +		goto corrupted;
>>> +	}
>>> +	if (unlikely((desc->tail | desc->head) >= size)) {
>> Same arguments below about head apply to tail here. Also, there is no #else
> Yes, desc->tail can be removed from this check. Same for head below. Can
> you fix this when merging?
>
>> check on ctb->head?
> ctb->head variable isn't used in this path nor is ctb->tail in the
> other. In the other path desc->tail is checked as it is read while
> desc->head isn't needed to be read here. The other path can also likely
> be reworked to pull the tail check outside of the if / else define
> block.
>
>>>    		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
>>> -			 head, tail, size);
>>> +			 desc->head, desc->tail, size);
>>>    		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>>    		goto corrupted;
>>>    	}
>>> -
>>> -	/*
>>> -	 * tail == head condition indicates empty. GuC FW does not support
>>> -	 * using up the entire buffer to get tail == head meaning full.
>>> -	 */
>>> -	if (tail < head)
>>> -		used = (size - head) + tail;
>>> -	else
>>> -		used = tail - head;
>>> -
>>> -	/* make sure there is a space including extra dw for the header */
>>> -	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
>>> -		return -ENOSPC;
>>> +#endif
>>>    	/*
>>>    	 * dw0: CT header (including fence)
>>> @@ -453,7 +452,9 @@ static int ct_write(struct intel_guc_ct *ct,
>>>    	write_barrier(ct);
>>>    	/* now update descriptor */
>>> +	ctb->tail = tail;
>>>    	WRITE_ONCE(desc->tail, tail);
>>> +	ctb->space -= len + GUC_CTB_HDR_LEN;
>>>    	return 0;
>>> @@ -469,7 +470,7 @@ static int ct_write(struct intel_guc_ct *ct,
>>>     * @req:	pointer to pending request
>>>     * @status:	placeholder for status
>>>     *
>>> - * For each sent request, Guc shall send bac CT response message.
>>> + * For each sent request, GuC shall send back CT response message.
>>>     * Our message handler will update status of tracked request once
>>>     * response message with given fence is received. Wait here and
>>>     * check for valid response status value.
>>> @@ -525,24 +526,35 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
>>>    	return ret;
>>>    }
>>> -static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
>>> +static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>>>    {
>>> -	struct guc_ct_buffer_desc *desc = ctb->desc;
>>> -	u32 head = READ_ONCE(desc->head);
>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>> +	u32 head;
>>>    	u32 space;
>>> -	space = CIRC_SPACE(desc->tail, head, ctb->size);
>>> +	if (ctb->space >= len_dw)
>>> +		return true;
>>> +
>>> +	head = READ_ONCE(ctb->desc->head);
>>> +	if (unlikely(head > ctb->size)) {
>>> +		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u size=%u\n",
>>> +			 ctb->desc->head, ctb->desc->tail, ctb->size);
>>> +		ctb->desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>> +		ctb->broken = true;
>>> +		return false;
>>> +	}
>>> +
>>> +	space = CIRC_SPACE(ctb->tail, head, ctb->size);
>>> +	ctb->space = space;
>>>    	return space >= len_dw;
>>>    }
>>>    static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
>>>    {
>>> -	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>> -
>>>    	lockdep_assert_held(&ct->ctbs.send.lock);
>>> -	if (unlikely(!h2g_has_room(ctb, len_dw))) {
>>> +	if (unlikely(!h2g_has_room(ct, len_dw))) {
>>>    		if (ct->stall_time == KTIME_MAX)
>>>    			ct->stall_time = ktime_get();
>>> @@ -612,7 +624,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>    	 */
>>>    retry:
>>>    	spin_lock_irqsave(&ctb->lock, flags);
>>> -	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
>>> +	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
>>>    		if (ct->stall_time == KTIME_MAX)
>>>    			ct->stall_time = ktime_get();
>>>    		spin_unlock_irqrestore(&ctb->lock, flags);
>>> @@ -732,7 +744,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>>>    {
>>>    	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
>>>    	struct guc_ct_buffer_desc *desc = ctb->desc;
>>> -	u32 head = desc->head;
>>> +	u32 head = ctb->head;
>>>    	u32 tail = desc->tail;
>>>    	u32 size = ctb->size;
>>>    	u32 *cmds = ctb->cmds;
>>> @@ -747,12 +759,29 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>>>    	if (unlikely(desc->status))
>>>    		goto corrupted;
>>> -	if (unlikely((tail | head) >= size)) {
>>> +	GEM_BUG_ON(head > size);
>>> +
>>> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>>> +	if (unlikely(head != READ_ONCE(desc->head))) {
>>> +		CT_ERROR(ct, "Head was modified %u != %u\n",
>>> +			 desc->head, ctb->head);
>>> +		desc->status |= GUC_CTB_STATUS_MISMATCH;
>>> +		goto corrupted;
>>> +	}
>>> +	if (unlikely((desc->tail | desc->head) >= size)) {
>> As per comment in other thread, the check on head here is redundant because
>> you have already hit a BUG_ON(ctb->head > size) followed by
>> CT_ERROR(ctb->head != desc->head). Therefore, you can't get here if
>> 'desc->head > size'.
>>
> Yep. See above we can likely just delete this.
>   
>>>    		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
>>>    			 head, tail, size);
>>>    		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>>    		goto corrupted;
>>>    	}
>>> +#else
>>> +	if (unlikely(tail >= size)) {
>>> +		CT_ERROR(ct, "Invalid offsets tail=%u (size=%u)\n",
>>> +			 tail, size);
>>> +		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>>> +		goto corrupted;
>>> +	}
> Now we can move this outside if/else define block as it is same check as
> above. Again can you do this when you merge this?
>
> Matt
Given that a) there are multiple changes which are not trivial one 
liners and b) I personally prefer keeping the CT_ERRORs and dropping the 
BUG_ON, I would recommend that you repost an updated patch how you want 
it changed. Shouldn't need to repost the whole set, just this one patch. 
And maybe get it reviewed by Michal as he seems to be in agreement with 
your preferred direction.

John.


>
>>> +#endif
>>>    	/* tail == head condition indicates empty */
>>>    	available = tail - head;
>>> @@ -802,6 +831,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>>>    	}
>>>    	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
>>> +	ctb->head = head;
>>>    	/* now update descriptor */
>>>    	WRITE_ONCE(desc->head, head);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> index bee03794c1eb..edd1bba0445d 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> @@ -33,6 +33,9 @@ struct intel_guc;
>>>     * @desc: pointer to the buffer descriptor
>>>     * @cmds: pointer to the commands buffer
>>>     * @size: size of the commands buffer in dwords
>>> + * @head: local shadow copy of head in dwords
>>> + * @tail: local shadow copy of tail in dwords
>>> + * @space: local shadow copy of space in dwords
>>>     * @broken: flag to indicate if descriptor data is broken
>>>     */
>>>    struct intel_guc_ct_buffer {
>>> @@ -40,6 +43,9 @@ struct intel_guc_ct_buffer {
>>>    	struct guc_ct_buffer_desc *desc;
>>>    	u32 *cmds;
>>>    	u32 size;
>>> +	u32 tail;
>>> +	u32 head;
>>> +	u32 space;
>>>    	bool broken;
>>>    };

