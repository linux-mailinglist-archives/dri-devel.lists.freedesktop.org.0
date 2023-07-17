Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCD756AE2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB6610E294;
	Mon, 17 Jul 2023 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665210E294;
 Mon, 17 Jul 2023 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615789; x=1721151789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OdJv8tC5HiweFNru6+xoz4JYVN00ahUWpL2ngP6p91Y=;
 b=XdJLuOd/6Z+54kNtVss+vPUoSa5/Sgq83zjzZLtglQajzlMoAKMFXOAv
 qJiYa5zLQfwMd295iNs34tBWsNDRmXsm612D4eOQh3O4hfCij9repXzFk
 oviIjnTvTdFaPJ4gNzpXaJa9e9y99l/PAZVv13RnaC61yBWr9Rv9b6aFm
 hJ13kmNBEqZtMO3r36dYVNtIncNrQqxtQkF8pi0s9Sl9baDsbZpdVt3Tz
 Mb0eeFSUU7V3EQKnlnLh+kpjVkEubJTAGf9xs+mPRVFOLodDxMOY/Xvsq
 whTj1AUBmt0Cj36ekRlZV8DGfBjN2minQN4rpQKo4n6ZR/8MHsj/bAQPS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429757104"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="429757104"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700569835"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="700569835"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:42:47 -0700
Message-ID: <d720078f-f829-c95f-28fc-c60d9a06ac25@intel.com>
Date: Mon, 17 Jul 2023 19:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v3 2/5] drm/i915/gt: Ensure memory quiesced
 before invalidation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
 <20230717125134.399115-3-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717125134.399115-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.07.2023 14:51, Andi Shyti wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> All memory traffic must be quiesced before requesting
> an aux invalidation on platforms that use Aux CCS.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 563efee055602..bee3b7dc595cf 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   {
>   	struct intel_engine_cs *engine = rq->engine;
>   
> +	/*
> +	 * Aux invalidations on Aux CCS platforms require
> +	 * memory traffic is quiesced prior.
> +	 */
> +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> +		mode |= EMIT_FLUSH;
> +
>   	if (mode & EMIT_FLUSH) {
>   		u32 flags = 0;
>   		int err;

