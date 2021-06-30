Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1C3B8AEE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 01:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAE96EA04;
	Wed, 30 Jun 2021 23:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD66EA04;
 Wed, 30 Jun 2021 23:23:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="294078272"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="294078272"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 16:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="447661658"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga007.jf.intel.com with ESMTP; 30 Jun 2021 16:23:38 -0700
Received: from [10.249.131.154] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.131.154])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15UNNbiW029801; Thu, 1 Jul 2021 00:23:37 +0100
Subject: Re: [PATCH 5/7] drm/i915/guc: Add stall timer to non blocking CTB
 send function
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210627231439.138612-1-matthew.brost@intel.com>
 <20210627231439.138612-6-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <288500ea-3be3-7499-8a33-0d36d10cb76a@intel.com>
Date: Thu, 1 Jul 2021 01:23:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627231439.138612-6-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28.06.2021 01:14, Matthew Brost wrote:
> Implement a stall timer which fails H2G CTBs once a period of time
> with no forward progress is reached to prevent deadlock.
> 
> v2:
>  (Michal)
>   - Improve error message in ct_deadlock()
>   - Set broken when ct_deadlock() returns true
>   - Return -EPIPE on ct_deadlock()
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 62 ++++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  4 ++
>  2 files changed, 59 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 90ee95a240e8..8f553f7f9619 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -319,6 +319,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  		goto err_deregister;
>  
>  	ct->enabled = true;
> +	ct->stall_time = KTIME_MAX;
>  
>  	return 0;
>  
> @@ -391,9 +392,6 @@ static int ct_write(struct intel_guc_ct *ct,
>  	u32 *cmds = ctb->cmds;
>  	unsigned int i;
>  
> -	if (unlikely(ctb->broken))
> -		return -EPIPE;
> -
>  	if (unlikely(desc->status))
>  		goto corrupted;
>  
> @@ -509,6 +507,25 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	return err;
>  }
>  
> +#define GUC_CTB_TIMEOUT_MS	1500
> +static inline bool ct_deadlocked(struct intel_guc_ct *ct)
> +{
> +	long timeout = GUC_CTB_TIMEOUT_MS;
> +	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
> +
> +	if (unlikely(ret)) {
> +		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
> +		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
> +
> +		CT_ERROR(ct, "Communication stalled for %lld, desc status=%#x,%#x\n",

nit: missing unit in "stalled for ... ms"
                                     ^^^^

> +			 ktime_ms_delta(ktime_get(), ct->stall_time),
> +			 send->status, recv->status);
> +		ct->ctbs.send.broken = true;
> +	}
> +
> +	return ret;
> +}
> +
>  static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
>  {
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> @@ -520,6 +537,26 @@ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
>  	return space >= len_dw;
>  }
>  
> +static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
> +{
> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> +
> +	lockdep_assert_held(&ct->ctbs.send.lock);
> +
> +	if (unlikely(!h2g_has_room(ctb, len_dw))) {
> +		if (ct->stall_time == KTIME_MAX)
> +			ct->stall_time = ktime_get();
> +
> +		if (unlikely(ct_deadlocked(ct)))
> +			return -EPIPE;
> +		else
> +			return -EBUSY;
> +	}
> +
> +	ct->stall_time = KTIME_MAX;
> +	return 0;
> +}
> +
>  static int ct_send_nb(struct intel_guc_ct *ct,
>  		      const u32 *action,
>  		      u32 len,
> @@ -530,13 +567,14 @@ static int ct_send_nb(struct intel_guc_ct *ct,
>  	u32 fence;
>  	int ret;
>  
> +	if (unlikely(ctb->broken))
> +		return -EPIPE;
> +
>  	spin_lock_irqsave(&ctb->lock, spin_flags);
>  
> -	ret = h2g_has_room(ctb, len + GUC_CTB_HDR_LEN);
> -	if (unlikely(!ret)) {
> -		ret = -EBUSY;
> +	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN);
> +	if (unlikely(ret))
>  		goto out;
> -	}
>  
>  	fence = ct_get_next_fence(ct);
>  	ret = ct_write(ct, action, len, fence, flags);
> @@ -571,6 +609,9 @@ static int ct_send(struct intel_guc_ct *ct,
>  	GEM_BUG_ON(!response_buf && response_buf_size);
>  	might_sleep();
>  
> +	if (unlikely(ctb->broken))
> +		return -EPIPE;

ok, but likely could be part of ct_can_send/has_room

> +
>  	/*
>  	 * We use a lazy spin wait loop here as we believe that if the CT
>  	 * buffers are sized correctly the flow control condition should be
> @@ -579,8 +620,13 @@ static int ct_send(struct intel_guc_ct *ct,
>  retry:
>  	spin_lock_irqsave(&ctb->lock, flags);
>  	if (unlikely(!h2g_has_room(ctb, len + GUC_CTB_HDR_LEN))) {
> +		if (ct->stall_time == KTIME_MAX)
> +			ct->stall_time = ktime_get();
>  		spin_unlock_irqrestore(&ctb->lock, flags);
>  
> +		if (unlikely(ct_deadlocked(ct)))
> +			return -EPIPE;
> +

can't we really put all this into one place?

static int ct_can_send(struct intel_guc_ct *ct, u32 len_dw, bool wait)
{
	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;

	lockdep_assert_held(&ct->ctbs.send.lock);

retry:
	if (ct->broken)
		return -EPIPE;

	if (unlikely(!ctb_has_room(ctb, len_dw + GUC_CTB_HDR_LEN))) {
		if (ct->stall_time == KTIME_MAX)
			ct->stall_time = ktime_get();

		if (unlikely(ct_deadlocked(ct)))
			return -EPIPE;
		if (!wait)
			return -EBUSY;

		spin_unlock_irqrestore(&ctb->lock, flags);
		...
		spin_lock_irqrestore(&ctb->lock, flags);

		goto retry;
	}

	ct->stall_time = KTIME_MAX;
	return 0;
}

Michal

>  		if (msleep_interruptible(sleep_period_ms))
>  			return -EINTR;
>  		sleep_period_ms = sleep_period_ms << 1;
> @@ -588,6 +634,8 @@ static int ct_send(struct intel_guc_ct *ct,
>  		goto retry;
>  	}
>  
> +	ct->stall_time = KTIME_MAX;
> +
>  	fence = ct_get_next_fence(ct);
>  	request.fence = fence;
>  	request.status = 0;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index f6a4d5b33467..c9d6ae7848a7 100644
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
> @@ -68,6 +69,9 @@ struct intel_guc_ct {
>  		struct list_head incoming; /* incoming requests */
>  		struct work_struct worker; /* handler for incoming requests */
>  	} requests;
> +
> +	/** @stall_time: time of first time a CTB submission is stalled */
> +	ktime_t stall_time;
>  };
>  
>  void intel_guc_ct_init_early(struct intel_guc_ct *ct);
> 
