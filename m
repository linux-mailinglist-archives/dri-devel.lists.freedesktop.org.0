Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F4756BCF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE6E10E2A1;
	Mon, 17 Jul 2023 18:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002F810E2A1;
 Mon, 17 Jul 2023 18:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689618186; x=1721154186;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Tr99F48zan845+HokQR/cz95BdWpXXi56Vs7fgqztG4=;
 b=nFguEJCpMtFXJrA6k6a1llobLsfQqIt4U5kic6nDNRPdMVDlWXbTWIzg
 5M82CP5wBDPdn6jlfKEN04XzeNx2OHaLFAMhK0E0NWLadfWx+Yn/qgkGB
 fEhkYZbl2iQORuy5tOsI3+HBaS0HgoCaNSOSJFmLNImM9Dg5asoFOrfeN
 smAZdxdGp0uAumXKNOHvqiyb93CH/kAc7r+0YyBwkI4UPn3cosoWS6n1n
 h3ACybBgLVMrl2MSX32ZcqB2IOPT5WXEA9MYxDin+5LRmtNQa5zKcKHNQ
 oH+LSn1qUkoHI9bcjs0Q90Y/oULA2ZKmgT1rcu6mvFSjuF3sGcY/31Ev5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396834564"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396834564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726649536"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="726649536"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:23:02 -0700
Message-ID: <79b92652-c63f-36fd-fd2a-835c25dc61ae@intel.com>
Date: Mon, 17 Jul 2023 20:23:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v4 4/6] drm/i915/gt: Enable the CCS_FLUSH bit
 in the pipe control
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-5-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717173059.422892-5-andi.shyti@linux.intel.com>
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

On 17.07.2023 19:30, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 10 +++++++++-
>   drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 3c935d6b68bf0..aa2fb9d72745a 100644
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
>   		u32 bit_group_0 = 0;
> @@ -221,6 +221,14 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> +		/*
> +		 * When required, in MTL+ platforms we need to
> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (mode & EMIT_CCS_FLUSH &&
> +		    GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
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

