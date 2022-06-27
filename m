Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27F55BB51
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899241133D5;
	Mon, 27 Jun 2022 17:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992FE11334C;
 Mon, 27 Jun 2022 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656350733; x=1687886733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pvzrDVWLrpM1nHinbsu9uh3F+RiEqIRxxgHGHRWgSQQ=;
 b=AB3VhFeD29duSMl87WaPM6E4R6YZPmZG+K6QOcFFNdEGi6q2OEYs0KDA
 z8MB806NkOasd03fLe9oOezDqtqmhtQ2Ma81FK+KtwM+zghpwrXKTrRR+
 hjpVNqNNOusEhKqTzmaAc9o2a5kA53sIl1qHjwsZShnjduM3w7TyfV1vi
 bStQ/mBVEzq9C3eYSWfWAFDNbn/O2oEPgVF3vGrtqy5rqfWC4gJG3H7Nb
 mFNFVL6bvJsYaEq31QMagB9tPomlvWZ0uB4KPChy3ODZr9b+/9wDUD30K
 I2EPeAEZypdH2Tvpr/SVpPZKfA5nOWze/zj0bCjo5PEdgecAGbWLdsCx5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="280274969"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="280274969"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:25:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="646522820"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:25:33 -0700
Date: Mon, 27 Jun 2022 10:18:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Do not use reserved requests for virtual
 engines
Message-ID: <20220627171859.GA23032@jons-linux-dev-box>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
 <20220614184348.23746-4-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614184348.23746-4-ramalingam.c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 12:13:48AM +0530, Ramalingam C wrote:
> Do not use reserved requests for virtual engines as this is only
> needed for kernel contexts.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

With the patch squashed into the previous patch:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_request.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index c71905d8e154..f0392b053bca 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -135,6 +135,8 @@ static void i915_fence_release(struct dma_fence *fence)
>  
>  	/*
>  	 * Keep one request on each engine for reserved use under mempressure
> +	 * do not use with virtual engines as this really is only needed for
> +	 * kernel contexts.
>  	 *
>  	 * We do not hold a reference to the engine here and so have to be
>  	 * very careful in what rq->engine we poke. The virtual engine is
> @@ -164,7 +166,8 @@ static void i915_fence_release(struct dma_fence *fence)
>  	 * know that if the rq->execution_mask is a single bit, rq->engine
>  	 * can be a physical engine with the exact corresponding mask.
>  	 */
> -	if (is_power_of_2(rq->execution_mask) &&
> +	if (!intel_engine_is_virtual(rq->engine) &&
> +	    is_power_of_2(rq->execution_mask) &&
>  	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
>  		return;
>  
> -- 
> 2.20.1
> 
