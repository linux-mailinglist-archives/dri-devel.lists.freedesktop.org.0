Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4297565F5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C1010E25D;
	Mon, 17 Jul 2023 14:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074BF10E25D;
 Mon, 17 Jul 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689603160; x=1721139160;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4Fbik1afGskZtquUWxQzT0wobM7YKuLbsx/AgcbbdhI=;
 b=RaBqDFrBC3ENx3n7PlJzNhV7S4UD2+6suBpv0bnw+bKqFSbt8bYa2YaH
 3XSh1K+GKURQrGYlBalbSmopahmmztlC8MdfjuCiSZPe0PxmuYzA3wSdw
 sv23MU58ygWLHhSYkYAo44j1DEGqR0NaKFfQPd1ctfISNlrYi7YQQJ9NN
 mqoE5Q7BjddfdJzW9AfRvLkXgaeAQq3wouCwYiEojM4XVW+PLQpWOVpxE
 p98ppMFlDHt8zSgFoispiaVAkVj9JByXjEeNQ4UQTziSeGyRSGXbEe/B5
 Irke496EkoHePVl0eLNsylSj9ZBMNE7ywWp9iwDlLW5+WS6Asx4XZlBFC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355876775"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355876775"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="673548262"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="673548262"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.36.7])
 ([10.249.36.7])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:12:20 -0700
Message-ID: <19e253d7-7291-78f9-bd54-e02ea6fa92fc@linux.intel.com>
Date: Mon, 17 Jul 2023 16:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/i915/gt: Enable the CCS_FLUSH bit
 in the pipe control
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
 <20230717125134.399115-4-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230717125134.399115-4-andi.shyti@linux.intel.com>
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


On 7/17/2023 2:51 PM, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
>
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 12 +++++++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>   3 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index bee3b7dc595cf..04484385189ad 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -207,7 +207,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   	 * memory traffic is quiesced prior.
>   	 */
>   	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> -		mode |= EMIT_FLUSH;
> +		mode |= EMIT_FLUSH | EMIT_CCS_FLUSH;
>   
>   	if (mode & EMIT_FLUSH) {
>   		u32 flags = 0;
> @@ -232,6 +232,16 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		flags |= PIPE_CONTROL_CS_STALL;
>   
> +		/*
> +		 * When required, in MTL+ platforms, in the render and compute
> +		 * engines we need to set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (mode & EMIT_CCS_FLUSH &&
> +		    GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70) &&
> +		    (engine->class == RENDER_CLASS ||
> +		     engine->class == COMPUTE_CLASS))
PIPE_CONTROL is only available for render and compute so we can skip 
this engine check.
> +			flags |= PIPE_CONTROL_CCS_FLUSH;

This "flags" is applied to DWORD 1 of PIPE_CONTROL but we need this for 
DWORD 0


Regards,

Nirmoy

> +
>   		if (!HAS_3D_PIPELINE(engine->i915))
>   			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>   		else if (engine->class == COMPUTE_CLASS)
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index e99a6fa03d453..e2cae9d02bd62 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -514,6 +514,7 @@ struct intel_engine_cs {
>   	int		(*emit_flush)(struct i915_request *request, u32 mode);
>   #define EMIT_INVALIDATE	BIT(0)
>   #define EMIT_FLUSH	BIT(1)
> +#define EMIT_CCS_FLUSH	BIT(2) /* MTL+ */
>   #define EMIT_BARRIER	(EMIT_INVALIDATE | EMIT_FLUSH)
>   	int		(*emit_bb_start)(struct i915_request *rq,
>   					 u64 offset, u32 length,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>   #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>   #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>   #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
