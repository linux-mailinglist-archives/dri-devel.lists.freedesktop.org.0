Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB9391778
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE676ECD8;
	Wed, 26 May 2021 12:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434DF6ECD5;
 Wed, 26 May 2021 12:36:22 +0000 (UTC)
IronPort-SDR: tY7ZOC00lfBqP/EJ30AQeIypE1BpKY6ZAVoflyZ3NIiw6rvvKKOkRH31RZpXs9RiiSA/qJOsqn
 0+vn2ukTEULQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="288030014"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="288030014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 05:36:20 -0700
IronPort-SDR: EiHYUnhjQFVZunw5qg0vGNIhAv2cB4wXCSRiGa+8bYPa60i3aFQi29rLb15yQU6WHkzJNY5T9M
 TlQFH2SadMJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547175873"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 26 May 2021 05:36:19 -0700
Received: from [10.249.135.143] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.143])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14QCaIr4018884; Wed, 26 May 2021 13:36:18 +0100
Subject: Re: [PATCH 15/18] drm/i915/guc: Ensure H2G buffer updates visible
 before tail update
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210526064237.77853-1-matthew.brost@intel.com>
 <20210526064237.77853-16-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <3d18d63d-8359-5ce0-0320-104436d57198@intel.com>
Date: Wed, 26 May 2021 14:36:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526064237.77853-16-matthew.brost@intel.com>
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



On 26.05.2021 08:42, Matthew Brost wrote:
> Ensure H2G buffer updates are visible before descriptor tail updates by
> inserting a barrier between the H2G buffer update and the tail. The
> barrier is simple wmb() for SMEM and is register write for LMEM. This is
> needed if more than 1 H2G can be inflight at once.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index fb875d257536..42063e1c355d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -328,6 +328,18 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
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

hmm, as this is one of the GuC scratch registers used for H2G MMIO
communication, writing 0 there might be interpreted by the GuC as new
request with action=0 and might results in extra processing/logging on
GuC side, and, since from here we don't protect access to this register
by send_mutex, we can corrupt other MMIO message being prepared from
different thread, ... can't we use other register ?

> +	} else {
> +		wmb();
> +	}
> +}
> +
>  /**
>   * DOC: CTB Host to GuC request
>   *
> @@ -411,6 +423,12 @@ static int ct_write(struct intel_guc_ct *ct,
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
