Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FF38E67D
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508BF6E21C;
	Mon, 24 May 2021 12:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511E36E21C;
 Mon, 24 May 2021 12:21:50 +0000 (UTC)
IronPort-SDR: o4L019CndSD1JxKkxEdFEhdi3r18d+qimbUfXOK9+JZ4e3/YRK4UjG0pkMV/sxC82sjm/cqtRz
 YQ2O/KYyCWBQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="263129898"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="263129898"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 05:21:47 -0700
IronPort-SDR: d5n9ZJSgrsXeBubS3mJ+LP/dTShVdoY7Ju9rYXS7GDjSdhsVp5id1KtsG+ia/MQbH5G2i9u1dV
 0oQaMpi+kd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="545922794"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 24 May 2021 05:21:44 -0700
Received: from [10.249.134.123] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.123])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14OCLgrD029093; Mon, 24 May 2021 13:21:43 +0100
Subject: Re: [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB send function
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-37-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <fdf70ecc-cb7e-a0ad-d91e-534d32b1e256@intel.com>
Date: Mon, 24 May 2021 14:21:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-37-matthew.brost@intel.com>
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.2021 21:13, Matthew Brost wrote:
> Add non blocking CTB send function, intel_guc_send_nb. In order to
> support a non blocking CTB send function a spin lock is needed to

spin lock was added in 16/97

> protect the CTB descriptors fields. Also the non blocking call must not
> update the fence value as this value is owned by the blocking call
> (intel_guc_send).

all H2G messages are using "fence", nb variant also needs to update it

> 
> The blocking CTB now must have a flow control mechanism to ensure the

s/blocking/non-blocking

> buffer isn't overrun. A lazy spin wait is used as we believe the flow
> control condition should be rare with properly sized buffer.

as this new nb function is still not used in this patch, then maybe
better to move flow control to separate patch for easier review ?

> 
> The function, intel_guc_send_nb, is exported in this patch but unused.
> Several patches later in the series make use of this function.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h    | 12 ++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 96 +++++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  7 +-
>  3 files changed, 105 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index c20f3839de12..4c0a367e41d8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -75,7 +75,15 @@ static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
>  static
>  inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
>  {
> -	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0);
> +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
> +}
> +
> +#define INTEL_GUC_SEND_NB		BIT(31)
> +static
> +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
> +{
> +	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
> +				 INTEL_GUC_SEND_NB);
>  }
>  
>  static inline int
> @@ -83,7 +91,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
>  			   u32 *response_buf, u32 response_buf_size)
>  {
>  	return intel_guc_ct_send(&guc->ct, action, len,
> -				 response_buf, response_buf_size);
> +				 response_buf, response_buf_size, 0);
>  }
>  
>  static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index a76603537fa8..af7314d45a78 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -3,6 +3,11 @@
>   * Copyright © 2016-2019 Intel Corporation
>   */
>  
> +#include <linux/circ_buf.h>
> +#include <linux/ktime.h>
> +#include <linux/time64.h>
> +#include <linux/timekeeping.h>
> +
>  #include "i915_drv.h"
>  #include "intel_guc_ct.h"
>  #include "gt/intel_gt.h"
> @@ -308,6 +313,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  	if (unlikely(err))
>  		goto err_deregister;
>  
> +	ct->requests.last_fence = 1;

not needed

>  	ct->enabled = true;
>  
>  	return 0;
> @@ -343,10 +349,22 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>  	return ++ct->requests.last_fence;
>  }
>  
> +static void write_barrier(struct intel_guc_ct *ct) {
> +	struct intel_guc *guc = ct_to_guc(ct);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> +		GEM_BUG_ON(guc->send_regs.fw_domains);
> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> +	} else {
> +		wmb();
> +	}
> +}

this chunk seems to be good candidate for separate patch that could be
introduced earlier

> +
>  static int ct_write(struct intel_guc_ct *ct,
>  		    const u32 *action,
>  		    u32 len /* in dwords */,
> -		    u32 fence)
> +		    u32 fence, u32 flags)
>  {
>  	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> @@ -393,9 +411,13 @@ static int ct_write(struct intel_guc_ct *ct,
>  		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>  		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
>  
> -	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> -			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
> +	hxg = (flags & INTEL_GUC_SEND_NB) ?
> +		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
> +		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> +			    GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
> +		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
> +			    GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
>  
>  	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
>  		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
> @@ -412,6 +434,12 @@ static int ct_write(struct intel_guc_ct *ct,
>  	}
>  	GEM_BUG_ON(tail > size);
>  
> +	/*
> +	 * make sure H2G buffer update and LRC tail update (if this triggering a
> +	 * submission) are visable before updating the descriptor tail

typo

> +	 */
> +	write_barrier(ct);
> +
>  	/* now update descriptor */
>  	WRITE_ONCE(desc->tail, tail);
>  
> @@ -466,6 +494,46 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	return err;
>  }
>  
> +static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> +{
> +	struct guc_ct_buffer_desc *desc = ctb->desc;
> +	u32 head = READ_ONCE(desc->head);
> +	u32 space;
> +
> +	space = CIRC_SPACE(desc->tail, head, ctb->size);

shouldn't we use READ_ONCE for reading the tail?

> +
> +	return space >= len_dw;
> +}
> +
> +static int ct_send_nb(struct intel_guc_ct *ct,
> +		      const u32 *action,
> +		      u32 len,
> +		      u32 flags)
> +{
> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> +	unsigned long spin_flags;
> +	u32 fence;
> +	int ret;
> +
> +	spin_lock_irqsave(&ctb->lock, spin_flags);
> +
> +	ret = ctb_has_room(ctb, len + 1);

why +1 ?

> +	if (unlikely(ret))
> +		goto out;
> +
> +	fence = ct_get_next_fence(ct);
> +	ret = ct_write(ct, action, len, fence, flags);
> +	if (unlikely(ret))
> +		goto out;
> +
> +	intel_guc_notify(ct_to_guc(ct));
> +
> +out:
> +	spin_unlock_irqrestore(&ctb->lock, spin_flags);
> +
> +	return ret;
> +}
> +
>  static int ct_send(struct intel_guc_ct *ct,
>  		   const u32 *action,
>  		   u32 len,
> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>  		   u32 response_buf_size,
>  		   u32 *status)
>  {
> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>  	struct ct_request request;
>  	unsigned long flags;
>  	u32 fence;
> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>  	GEM_BUG_ON(!len);
>  	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>  	GEM_BUG_ON(!response_buf && response_buf_size);
> +	might_sleep();
>  
> +	/*
> +	 * We use a lazy spin wait loop here as we believe that if the CT
> +	 * buffers are sized correctly the flow control condition should be
> +	 * rare.
> +	 */
> +retry:
>  	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {

why +1 ?

> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> +		cond_resched();
> +		goto retry;
> +	}

hmm, full CTB can also be seen in case of nb, but it looks that only in
case of blocking call you want to use lazy spin, why ?

also, what if situation is not improving ?
will we be looping here forever ?

>  
>  	fence = ct_get_next_fence(ct);
>  	request.fence = fence;
> @@ -495,7 +576,7 @@ static int ct_send(struct intel_guc_ct *ct,
>  	list_add_tail(&request.link, &ct->requests.pending);
>  	spin_unlock(&ct->requests.lock);
>  
> -	err = ct_write(ct, action, len, fence);
> +	err = ct_write(ct, action, len, fence, 0);
>  
>  	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>  
> @@ -537,7 +618,7 @@ static int ct_send(struct intel_guc_ct *ct,
>   * Command Transport (CT) buffer based GuC send function.
>   */
>  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> -		      u32 *response_buf, u32 response_buf_size)
> +		      u32 *response_buf, u32 response_buf_size, u32 flags)
>  {
>  	u32 status = ~0; /* undefined */
>  	int ret;
> @@ -547,6 +628,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  		return -ENODEV;
>  	}
>  
> +	if (flags & INTEL_GUC_SEND_NB)
> +		return ct_send_nb(ct, action, len, flags);
> +
>  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>  	if (unlikely(ret < 0)) {
>  		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index 1ae2dde6db93..55ef7c52472f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> +#include <linux/ktime.h>
>  
>  #include "intel_guc_fwif.h"
>  
> @@ -42,7 +43,6 @@ struct intel_guc_ct_buffer {
>  	bool broken;
>  };
>  
> -
>  /** Top-level structure for Command Transport related data
>   *
>   * Includes a pair of CT buffers for bi-directional communication and tracking
> @@ -69,6 +69,9 @@ struct intel_guc_ct {
>  		struct list_head incoming; /* incoming requests */
>  		struct work_struct worker; /* handler for incoming requests */
>  	} requests;
> +
> +	/** @stall_time: time of first time a CTB submission is stalled */
> +	ktime_t stall_time;

this should be introduced in 37/97

>  };
>  
>  void intel_guc_ct_init_early(struct intel_guc_ct *ct);
> @@ -88,7 +91,7 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
>  }
>  
>  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
> -		      u32 *response_buf, u32 response_buf_size);
> +		      u32 *response_buf, u32 response_buf_size, u32 flags);
>  void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
>  
>  #endif /* _INTEL_GUC_CT_H_ */
> 
