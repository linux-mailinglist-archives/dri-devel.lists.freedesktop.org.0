Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8D399DFD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDA36E103;
	Thu,  3 Jun 2021 09:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDE56E0EB;
 Thu,  3 Jun 2021 09:45:05 +0000 (UTC)
IronPort-SDR: kVub9A2X9AdEVQ6MKkyczbuL+KzRx0Ha70cqsiVTjApIAZbT+2+SQ0byP8RrURAm0Ed1BX1KOC
 ITy/OsIuc45g==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="183688912"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="183688912"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:45:00 -0700
IronPort-SDR: +MLnEqQ22aneiTIVDwrWYYE9rRGCn6xWyzCf/fHC7/iDWyK2xNeG8CELTZJsn3Ve3SUZdn5bD+
 lsN9WK6yBm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="447790162"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 03 Jun 2021 02:44:57 -0700
Received: from [10.249.138.11] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.138.11])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1539ivWw004939; Thu, 3 Jun 2021 10:44:57 +0100
Subject: Re: [Intel-gfx] [PATCH 15/20] drm/i915/guc: Ensure H2G buffer updates
 visible before tail update
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210603051630.2635-1-matthew.brost@intel.com>
 <20210603051630.2635-16-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <454067aa-cb2b-541d-21a7-84706a2d93a6@intel.com>
Date: Thu, 3 Jun 2021 11:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603051630.2635-16-matthew.brost@intel.com>
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
Cc: daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03.06.2021 07:16, Matthew Brost wrote:
> Ensure H2G buffer updates are visible before descriptor tail updates by
> inserting a barrier between the H2G buffer update and the tail. The
> barrier is simple wmb() for SMEM and is register write for LMEM. This is
> needed if more than 1 H2G can be inflight at once.
> 
> If this barrier is not inserted it is possible the descriptor tail
> update is scene by the GuC before H2G buffer update which results in the
> GuC reading a corrupt H2G value. This can bring down the H2G channel
> among other bad things.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 80976fe40fbf..31f83956bfc3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -328,6 +328,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
>  	return ++ct->requests.last_fence;
>  }
>  
> +static void write_barrier(struct intel_guc_ct *ct)
> +{
> +	struct intel_guc *guc = ct_to_guc(ct);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> +		GEM_BUG_ON(guc->send_regs.fw_domains);
> +		/*
> +		 * This register is used by the i915 and GuC for MMIO based
> +		 * communication. Once we are in this code CTBs are the only
> +		 * method the i915 uses to communicate with the GuC so it is
> +		 * safe to write to this register (a value of 0 is NOP for MMIO
> +		 * communication). If we ever start mixing CTBs and MMIOs a new
> +		 * register will have to be chosen.
> +		 */
> +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);

can't we at least start with SOFT_SCRATCH register that is not used for
GuC MMIO based communication on Gen12 LMEM platforms? see [1]

I really don't feel comfortable that we are touching a register that
elsewhere is protected with the mutex. And mixing CTBs and MMIO is not
far away.

Michal

[1]
https://lore.kernel.org/intel-gfx/51b9bd05-7d6f-29f1-de0f-3a14bade6c9c@intel.com/

> +	} else {
> +		/* wmb() sufficient for a barrier if in smem */
> +		wmb();
> +	}
> +}
> +
>  /**
>   * DOC: CTB Host to GuC request
>   *
> @@ -411,6 +433,12 @@ static int ct_write(struct intel_guc_ct *ct,
>  	}
>  	GEM_BUG_ON(tail > size);
>  
> +	/*
> +	 * make sure H2G buffer update and LRC tail update (if this triggering a
> +	 * submission) are visible before updating the descriptor tail
> +	 */
> +	write_barrier(ct);
> +
>  	/* now update desc tail (back in bytes) */
>  	desc->tail = tail * 4;
>  	return 0;
> 
