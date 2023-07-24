Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A975ED44
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038B10E280;
	Mon, 24 Jul 2023 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B9C10E27C;
 Mon, 24 Jul 2023 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690186796; x=1721722796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vW4ze8oZKFb995ZUmc4ozXg5zKX+vuA/U5BVP8f2dbk=;
 b=A5rdMeMgrQLxiHjqGFa67I8DZk9xvuO6x+MvFHya6McKWTEKuFCwCDTY
 xwNea5UKCC/SExijRuTMyBSv74t21rHYGNZFHHq5JYcdfI+u3E7Cd9SOR
 u67XoFi10eY9u8P/aqKZNsL9hBFecMPse5R2890uiPtJKsUJfATGttJQg
 /KpD3ccmTIaO9oqqoQd0yf6ueciC3Di9rTxlwom3YARh9lTEflI9qtEBQ
 7BIiIDUfo4YSsvhx97Mc/zlOCwi6itJG1cUkNVKXraYkg/MeRlxLC2lr7
 oUMNZWg6K48GDNAegvRh7rx9pKtq6Dqk7iZUbVqVQMAsxpW58de3wmb5J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367404734"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="367404734"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="675742972"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="675742972"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.14.115])
 ([10.213.14.115])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:19:50 -0700
Message-ID: <3b7e1781-ca2b-44b3-846d-89e42f24106e@intel.com>
Date: Mon, 24 Jul 2023 10:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v8 7/9] drm/i915/gt: Ensure memory quiesced before
 invalidation for all engines
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-8-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230721161514.818895-8-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.07.2023 18:15, Andi Shyti wrote:
> Commit af9e423a8aae ("drm/i915/gt: Ensure memory quiesced before
> invalidation") has made sure that the memory is quiesced before
> invalidating the AUX CCS table. Do it for all the other engines
> and not just RCS.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 36 ++++++++++++++++--------
>   1 file changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 5e19b45a5cabe..646151e1b5deb 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -331,26 +331,40 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   {
>   	intel_engine_mask_t aux_inv = 0;
> -	u32 cmd, *cs;
> +	u32 cmd_flush = 0;
> +	u32 cmd = 4;
> +	u32 *cs;
>   
> -	cmd = 4;
> -	if (mode & EMIT_INVALIDATE) {
> +	if (mode & EMIT_INVALIDATE)
>   		cmd += 2;
>   
> -		if (gen12_needs_ccs_aux_inv(rq->engine) &&
> -		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> -		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
> -			aux_inv = rq->engine->mask &
> -				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
> -			if (aux_inv)
> -				cmd += 4;
> -		}
> +	if (gen12_needs_ccs_aux_inv(rq->engine))
> +		aux_inv = rq->engine->mask &
> +			  ~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);

Shouldn't we remove BCS check for MTL? And move it inside 
gen12_needs_ccs_aux_inv?
Btw aux_inv is used as bool, make better is to make it bool.

Regards
Andrzej
> +
> +	/*
> +	 * On Aux CCS platforms the invalidation of the Aux
> +	 * table requires quiescing memory traffic beforehand
> +	 */
> +	if (aux_inv) {
> +		cmd += 4; /* for the AUX invalidation */
> +		cmd += 2; /* for the engine quiescing */
> +
> +		cmd_flush = MI_FLUSH_DW;
> +
> +		if (rq->engine->class == COPY_ENGINE_CLASS)
> +			cmd_flush |= MI_FLUSH_DW_CCS;
>   	}
>   
>   	cs = intel_ring_begin(rq, cmd);
>   	if (IS_ERR(cs))
>   		return PTR_ERR(cs);
>   
> +	if (cmd_flush) {
> +		*cs++ = cmd_flush;
> +		*cs++ = 0;
> +	}
> +
>   	if (mode & EMIT_INVALIDATE)
>   		*cs++ = preparser_disable(true);
>   

