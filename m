Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA973C1438
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 15:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D9E6E241;
	Thu,  8 Jul 2021 13:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB6E6E241;
 Thu,  8 Jul 2021 13:23:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="207679768"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="207679768"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 06:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="457882778"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2021 06:23:34 -0700
Received: from [10.249.150.204] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.204])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 168DNXf0008381; Thu, 8 Jul 2021 14:23:33 +0100
Subject: Re: [PATCH 06/7] drm/i915/guc: Optimize CTB writes and reads
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210706222010.101522-1-matthew.brost@intel.com>
 <20210707232543.14088-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <54d1f671-2afa-e48d-aa17-e1fa8869dc68@intel.com>
Date: Thu, 8 Jul 2021 15:23:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707232543.14088-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08.07.2021 01:25, Matthew Brost wrote:
> CTB writes are now in the path of command submission and should be
> optimized for performance. Rather than reading CTB descriptor values
> (e.g. head, tail) which could result in accesses across the PCIe bus,
> store shadow local copies and only read/write the descriptor values when
> absolutely necessary. Also store the current space in the each channel
> locally.
> 
> v2:
>  (Michal)
>   - Add additional sanity checks for head / tail pointers
>   - Use GUC_CTB_HDR_LEN rather than magic 1
> v3:
>  (Michal / John H)
>   - Drop redundant check of head value
> v4:
>  (John H)
>   - Drop redundant checks of tail / head values
> v5:
>  (Michal)
>   - Address more nits
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 92 +++++++++++++++--------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  6 ++
>  2 files changed, 66 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index db3e85b89573..d552d3016779 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -130,6 +130,10 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
>  static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
>  {
>  	ctb->broken = false;
> +	ctb->tail = 0;
> +	ctb->head = 0;
> +	ctb->space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size);
> +
>  	guc_ct_buffer_desc_init(ctb->desc);
>  }
>  
> @@ -383,10 +387,8 @@ static int ct_write(struct intel_guc_ct *ct,
>  {
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> -	u32 head = desc->head;
> -	u32 tail = desc->tail;
> +	u32 tail = ctb->tail;
>  	u32 size = ctb->size;
> -	u32 used;
>  	u32 header;
>  	u32 hxg;
>  	u32 type;
> @@ -396,25 +398,22 @@ static int ct_write(struct intel_guc_ct *ct,
>  	if (unlikely(desc->status))
>  		goto corrupted;
>  
> -	if (unlikely((tail | head) >= size)) {
> -		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
> -			 head, tail, size);
> +	GEM_BUG_ON(tail > size);
> +
> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
> +	if (unlikely(tail != READ_ONCE(desc->tail))) {
> +		CT_ERROR(ct, "Tail was modified %u != %u\n",
> +			 desc->tail, tail);
> +		desc->status |= GUC_CTB_STATUS_MISMATCH;
> +		goto corrupted;
> +	}
> +	if (unlikely(desc->head >= size)) {

READ_ONCE wouldn't hurt

> +		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
> +			 desc->head, size);
>  		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>  		goto corrupted;
>  	}
> -
> -	/*
> -	 * tail == head condition indicates empty. GuC FW does not support
> -	 * using up the entire buffer to get tail == head meaning full.
> -	 */
> -	if (tail < head)
> -		used = (size - head) + tail;
> -	else
> -		used = tail - head;
> -
> -	/* make sure there is a space including extra dw for the header */
> -	if (unlikely(used + len + GUC_CTB_HDR_LEN >= size))
> -		return -ENOSPC;
> +#endif
>  
>  	/*
>  	 * dw0: CT header (including fence)
> @@ -452,6 +451,10 @@ static int ct_write(struct intel_guc_ct *ct,
>  	 */
>  	write_barrier(ct);
>  
> +	/* update local copies */
> +	ctb->tail = tail;
> +	ctb->space -= len + GUC_CTB_HDR_LEN;

it looks that we rely on previous call to h2g_has_room(), but maybe for
completeness we should have sanity check in this function as well:

	GEM_BUG_ON(ctb->space < len + HDR_LEN);

not a blocker, other LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Michal

> +
>  	/* now update descriptor */
>  	WRITE_ONCE(desc->tail, tail);
>  
> @@ -469,7 +472,7 @@ static int ct_write(struct intel_guc_ct *ct,
>   * @req:	pointer to pending request
>   * @status:	placeholder for status
>   *
> - * For each sent request, Guc shall send bac CT response message.
> + * For each sent request, GuC shall send back CT response message.
>   * Our message handler will update status of tracked request once
>   * response message with given fence is received. Wait here and
>   * check for valid response status value.
> @@ -525,24 +528,36 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
>  	return ret;
>  }
>  
> -static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> +static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>  {
> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> -	u32 head = READ_ONCE(desc->head);
> +	u32 head;
>  	u32 space;
>  
> -	space = CIRC_SPACE(desc->tail, head, ctb->size);
> +	if (ctb->space >= len_dw)
> +		return true;
> +
> +	head = READ_ONCE(desc->head);
> +	if (unlikely(head > ctb->size)) {
> +		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
> +			 head, ctb->size);
> +		desc->status |= GUC_CTB_STATUS_OVERFLOW;
> +		ctb->broken = true;
> +		return false;
> +	}
> +
> +	space = CIRC_SPACE(ctb->tail, head, ctb->size);
> +	ctb->space = space;
>  
>  	return space >= len_dw;
>  }
>  
>  static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
>  {
> -	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> -
>  	lockdep_assert_held(&ct->ctbs.send.lock);
>  
> -	if (unlikely(!h2g_has_room(ctb, len_dw))) {
> +	if (unlikely(!h2g_has_room(ct, len_dw))) {
>  		if (ct->stall_time == KTIME_MAX)
>  			ct->stall_time = ktime_get();
>  
> @@ -612,7 +627,7 @@ static int ct_send(struct intel_guc_ct *ct,
>  	 */
>  retry:
>  	spin_lock_irqsave(&ctb->lock, flags);
> -	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
> +	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
>  		if (ct->stall_time == KTIME_MAX)
>  			ct->stall_time = ktime_get();
>  		spin_unlock_irqrestore(&ctb->lock, flags);
> @@ -732,8 +747,8 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  {
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> -	u32 head = desc->head;
> -	u32 tail = desc->tail;
> +	u32 head = ctb->head;
> +	u32 tail = READ_ONCE(desc->tail);
>  	u32 size = ctb->size;
>  	u32 *cmds = ctb->cmds;
>  	s32 available;
> @@ -747,9 +762,19 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	if (unlikely(desc->status))
>  		goto corrupted;
>  
> -	if (unlikely((tail | head) >= size)) {
> -		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
> -			 head, tail, size);
> +	GEM_BUG_ON(head > size);
> +
> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
> +	if (unlikely(head != READ_ONCE(desc->head))) {
> +		CT_ERROR(ct, "Head was modified %u != %u\n",
> +			 desc->head, head);
> +		desc->status |= GUC_CTB_STATUS_MISMATCH;
> +		goto corrupted;
> +	}
> +#endif
> +	if (unlikely(tail >= size)) {
> +		CT_ERROR(ct, "Invalid tail offset %u >= %u)\n",
> +			 tail, size);
>  		desc->status |= GUC_CTB_STATUS_OVERFLOW;
>  		goto corrupted;
>  	}
> @@ -802,6 +827,9 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	}
>  	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
>  
> +	/* update local copies */
> +	ctb->head = head;
> +
>  	/* now update descriptor */
>  	WRITE_ONCE(desc->head, head);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index bee03794c1eb..edd1bba0445d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -33,6 +33,9 @@ struct intel_guc;
>   * @desc: pointer to the buffer descriptor
>   * @cmds: pointer to the commands buffer
>   * @size: size of the commands buffer in dwords
> + * @head: local shadow copy of head in dwords
> + * @tail: local shadow copy of tail in dwords
> + * @space: local shadow copy of space in dwords
>   * @broken: flag to indicate if descriptor data is broken
>   */
>  struct intel_guc_ct_buffer {
> @@ -40,6 +43,9 @@ struct intel_guc_ct_buffer {
>  	struct guc_ct_buffer_desc *desc;
>  	u32 *cmds;
>  	u32 size;
> +	u32 tail;
> +	u32 head;
> +	u32 space;
>  	bool broken;
>  };
>  
> 
