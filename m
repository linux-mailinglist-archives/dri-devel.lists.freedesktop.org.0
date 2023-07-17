Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB14756C80
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E6710E2AC;
	Mon, 17 Jul 2023 18:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869E910E2A6;
 Mon, 17 Jul 2023 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689619906; x=1721155906;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qORMWj6FNlEJtehXgnXKx4L/cdcSjrNP9LYhEioUns0=;
 b=bOrF4RcZGh2Jt+0RbuBU+aZ1fb19doEYcMQaYj/tHeUFpS87fnTxR7Qt
 JxBvSImw0db2lMis7Fp4ypXGO2HOOEyZbTfHFRbqrHMHaLjUhNHGm0Gkk
 KETTI2TtKzcZ6vfF5adw3QcC/EHoVgLjvqN1P6Zg/gCu9GFfg6zCdLE+Y
 KZksgvtWdJy1aOmRo/+XEYi3EKLRQaSdCaoHpV4sRm4Vm6Vdr7pCPM7BA
 ZDqs706wvY4JRJKAJdemuCmaNZEc0Mw0ZjnOPOk5/sZv1z0akgkglxhmo
 2+SexdqyWRP8SA6YKE8m84jMVB89EIhgPUeU4P9P9Cgg8nsuXUKoQN90G g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="346313569"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="346313569"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:51:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788755064"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="788755064"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:51:41 -0700
Message-ID: <201e4dc5-da64-857f-d018-a289232e47b0@intel.com>
Date: Mon, 17 Jul 2023 20:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v4 5/6] drm/i915/gt: Poll aux invalidation
 register bit on invalidation
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-6-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717173059.422892-6-andi.shyti@linux.intel.com>
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
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> For platforms that use Aux CCS, wait for aux invalidation to
> complete by checking the aux invalidation register bit is
> cleared.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 17 +++++++++++++----
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index aa2fb9d72745a..fbc70f3b7f2fd 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -174,6 +174,16 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>   	*cs++ = AUX_INV;
>   	*cs++ = MI_NOOP;
>   
> +	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
> +		MI_SEMAPHORE_REGISTER_POLL |
> +		MI_SEMAPHORE_POLL |
> +		MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cs++ = 0;
> +	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
> +	*cs++ = 0;
> +	*cs++ = 0;
> +	*cs++ = MI_NOOP;
> +
>   	return cs;
>   }
>   
> @@ -284,10 +294,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   		else if (engine->class == COMPUTE_CLASS)
>   			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>   
> +		count = 8;
>   		if (!HAS_FLAT_CCS(rq->engine->i915))
> -			count = 8 + 4;
> -		else
> -			count = 8;
> +			count += 10;
>   
>   		cs = intel_ring_begin(rq, count);
>   		if (IS_ERR(cs))
> @@ -330,7 +339,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   			aux_inv = rq->engine->mask &
>   				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
>   			if (aux_inv)
> -				cmd += 4;
> +				cmd += 10;
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5df7cce23197c..2bd8d98d21102 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -121,6 +121,7 @@
>   #define   MI_SEMAPHORE_TARGET(engine)	((engine)<<15)
>   #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
>   #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
> +#define   MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
>   #define   MI_SEMAPHORE_POLL		(1 << 15)
>   #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
>   #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)

