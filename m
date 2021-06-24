Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29A3B34E2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19B6EC6F;
	Thu, 24 Jun 2021 17:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928456EC6D;
 Thu, 24 Jun 2021 17:37:04 +0000 (UTC)
IronPort-SDR: eZJVyYsAqvqDklWS+i7woYyz1/Jf8wUSMexbcRxlZqhkAFbVNeQt/iFppRdTVaYbQeDmecB08/
 fcndOnuPD3VA==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="268657696"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="268657696"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 10:37:03 -0700
IronPort-SDR: tylIs0MlcI8V/0Tv8WKOcSK6wSzf51S7TSSEhK15J8woTUp1/aEvUuWagv2Qbgw5rCUlVoqpp2
 Z29IVQKSw8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="406717641"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 24 Jun 2021 10:37:02 -0700
Received: from [10.249.129.39] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.129.39])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15OHb1bO019127; Thu, 24 Jun 2021 18:37:01 +0100
Subject: Re: [Intel-gfx] [PATCH 05/47] drm/i915/guc: Add stall timer to non
 blocking CTB send function
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-6-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <d8454345-bba9-7173-4d03-83581c6ee583@intel.com>
Date: Thu, 24 Jun 2021 19:37:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-6-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.06.2021 09:04, Matthew Brost wrote:
> Implement a stall timer which fails H2G CTBs once a period of time
> with no forward progress is reached to prevent deadlock.
> 
> Also update to ct_write to return -EIO rather than -EPIPE on a
> corrupted descriptor.

by doing so you will have the same error code for two different problems:

a) corrupted CTB descriptor (definitely unrecoverable)
b) long stall in CTB processing (still recoverable)

while caller is explicitly instructed to retry only on:

c) temporary stall in CTB processing (likely recoverable)

so why do we want to limit our diagnostics?

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 47 +++++++++++++++++++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  4 ++
>  2 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index c9a65d05911f..27ec30b5ef47 100644
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
> @@ -392,7 +393,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	unsigned int i;
>  
>  	if (unlikely(ctb->broken))
> -		return -EPIPE;
> +		return -EIO;
>  
>  	if (unlikely(desc->status))
>  		goto corrupted;
> @@ -464,7 +465,7 @@ static int ct_write(struct intel_guc_ct *ct,
>  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>  		 desc->head, desc->tail, desc->status);
>  	ctb->broken = true;
> -	return -EPIPE;
> +	return -EIO;
>  }
>  
>  /**
> @@ -507,6 +508,18 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
>  	return err;
>  }
>  
> +#define GUC_CTB_TIMEOUT_MS	1500

it's 150% of core CTB timeout, maybe we should correlate them ?

> +static inline bool ct_deadlocked(struct intel_guc_ct *ct)
> +{
> +	long timeout = GUC_CTB_TIMEOUT_MS;
> +	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
> +
> +	if (unlikely(ret))
> +		CT_ERROR(ct, "CT deadlocked\n");

nit: in commit message you said all these changes are to "prevent
deadlock" so maybe this message should rather be:

	int delta = ktime_ms_delta(ktime_get(), ct->stall_time);

	CT_ERROR(ct, "Communication stalled for %dms\n", delta);

(note that CT_ERROR already adds "CT" prefix)

> +
> +	return ret;
> +}
> +
>  static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
>  {
>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> @@ -518,6 +531,26 @@ static inline bool h2g_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
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

and maybe above message should be printed somewhere around here when we
detect "deadlock" for the first time?

> +			return -EIO;
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
> @@ -530,7 +563,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
>  
>  	spin_lock_irqsave(&ctb->lock, spin_flags);
>  
> -	ret = h2g_has_room(ctb, len + 1);
> +	ret = has_room_nb(ct, len + 1);
>  	if (unlikely(ret))
>  		goto out;
>  
> @@ -574,11 +607,19 @@ static int ct_send(struct intel_guc_ct *ct,
>  retry:
>  	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
>  	if (unlikely(!h2g_has_room(ctb, len + 1))) {
> +		if (ct->stall_time == KTIME_MAX)
> +			ct->stall_time = ktime_get();

as this is a repeated pattern, maybe it should be moved to h2g_has_room
or other wrapper ?

>  		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> +
> +		if (unlikely(ct_deadlocked(ct)))
> +			return -EIO;
> +
>  		cond_resched();
>  		goto retry;
>  	}
>  
> +	ct->stall_time = KTIME_MAX;

this one too

> +
>  	fence = ct_get_next_fence(ct);
>  	request.fence = fence;
>  	request.status = 0;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
> index eb69263324ba..55ef7c52472f 100644
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
