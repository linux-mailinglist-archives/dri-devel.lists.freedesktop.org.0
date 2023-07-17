Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E78756AAF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C244310E295;
	Mon, 17 Jul 2023 17:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F6C10E294;
 Mon, 17 Jul 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689615218; x=1721151218;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ESWJYQ7+CqU/IHwCyOuCTobAxZD6h3pTkC8ehU0W3aA=;
 b=CjX7dZnf54CO7QWINCEch0+8ngIlcjnI12nBAAhBeae46WOeZ0Q/kpPP
 viNI8oQel1rXMHSbis/OFEgbGe8khFR0Nv8dxoLTm6M/QamcEcNzz8R+8
 lZlaGqAlfYhBT5CNzVL2bPSYzWi0rrZXbRQUQwakASQN0RBvdHCYFzJHr
 1Vf8EqTAKxXT9W3EPEzwWPPOwjsAAwuBrq1yaeuFGREeP6pFNlCAGWiMt
 J2+4wLZmQN8Um/I8uF42KX+YV8wdDxkF/nN8bAuJtyisrMnpNINLXO1+k
 fUNEqJNWFvw4wLElHDsXhxxhVniehY73qKesGnf2bk7QvIN5ZDDKcPCFc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345587019"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="345587019"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:33:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="897283369"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897283369"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 10:33:15 -0700
Message-ID: <8e6ffe7b-1a0a-39b4-ef91-6167f326ec4d@intel.com>
Date: Mon, 17 Jul 2023 19:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v3 1/5] drm/i915/gt: Cleanup aux invalidation
 registers
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
 <20230717125134.399115-2-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717125134.399115-2-andi.shyti@linux.intel.com>
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
> Fix the 'NV' definition postfix that is supposed to be INV.
> 
> Take the chance to also order properly the registers based on
> their address and call the GEN12_GFX_CCS_AUX_INV address as
> GEN12_CCS_AUX_INV like all the other similar registers.
> 
> Remove also VD1, VD3 and VE1 registers that don't exist.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c |  8 ++++----
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h  | 14 ++++++--------
>   drivers/gpu/drm/i915/gt/intel_lrc.c      |  6 +++---
>   3 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 23857cc08eca1..563efee055602 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -287,8 +287,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		if (!HAS_FLAT_CCS(rq->engine->i915)) {
>   			/* hsdes: 1809175790 */
> -			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_GFX_CCS_AUX_NV);
> +			cs = gen12_emit_aux_table_inv(rq->engine->gt, cs,
> +						      GEN12_CCS_AUX_INV);
>   		}
>   
>   		*cs++ = preparser_disable(false);
> @@ -348,10 +348,10 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	if (aux_inv) { /* hsdes: 1809175790 */
>   		if (rq->engine->class == VIDEO_DECODE_CLASS)
>   			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VD0_AUX_NV);
> +						      cs, GEN12_VD0_AUX_INV);
>   		else
>   			cs = gen12_emit_aux_table_inv(rq->engine->gt,
> -						      cs, GEN12_VE0_AUX_NV);
> +						      cs, GEN12_VE0_AUX_INV);
>   	}
>   
>   	if (mode & EMIT_INVALIDATE)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 718cb2c80f79e..78b67a5336afc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -332,9 +332,10 @@
>   #define GEN8_PRIVATE_PAT_HI			_MMIO(0x40e0 + 4)
>   #define GEN10_PAT_INDEX(index)			_MMIO(0x40e0 + (index) * 4)
>   #define BSD_HWS_PGA_GEN7			_MMIO(0x4180)
> -#define GEN12_GFX_CCS_AUX_NV			_MMIO(0x4208)
> -#define GEN12_VD0_AUX_NV			_MMIO(0x4218)
> -#define GEN12_VD1_AUX_NV			_MMIO(0x4228)
> +
> +#define GEN12_CCS_AUX_INV			_MMIO(0x4208)
> +#define GEN12_VD0_AUX_INV			_MMIO(0x4218)
> +#define GEN12_VE0_AUX_INV			_MMIO(0x4238)
>   
>   #define GEN8_RTCR				_MMIO(0x4260)
>   #define GEN8_M1TCR				_MMIO(0x4264)
> @@ -342,14 +343,11 @@
>   #define GEN8_BTCR				_MMIO(0x426c)
>   #define GEN8_VTCR				_MMIO(0x4270)
>   
> -#define GEN12_VD2_AUX_NV			_MMIO(0x4298)
> -#define GEN12_VD3_AUX_NV			_MMIO(0x42a8)
> -#define GEN12_VE0_AUX_NV			_MMIO(0x4238)
> -
>   #define BLT_HWS_PGA_GEN7			_MMIO(0x4280)
>   
> -#define GEN12_VE1_AUX_NV			_MMIO(0x42b8)
> +#define GEN12_VD2_AUX_INV			_MMIO(0x4298)
>   #define   AUX_INV				REG_BIT(0)
> +
>   #define VEBOX_HWS_PGA_GEN7			_MMIO(0x4380)
>   
>   #define GEN12_AUX_ERR_DBG			_MMIO(0x43f4)
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 1b710102390bf..235f3fab60a98 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1374,7 +1374,7 @@ gen12_emit_indirect_ctx_rcs(const struct intel_context *ce, u32 *cs)
>   	/* hsdes: 1809175790 */
>   	if (!HAS_FLAT_CCS(ce->engine->i915))
>   		cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -					      cs, GEN12_GFX_CCS_AUX_NV);
> +					      cs, GEN12_CCS_AUX_INV);
>   
>   	/* Wa_16014892111 */
>   	if (IS_MTL_GRAPHICS_STEP(ce->engine->i915, M, STEP_A0, STEP_B0) ||
> @@ -1403,10 +1403,10 @@ gen12_emit_indirect_ctx_xcs(const struct intel_context *ce, u32 *cs)
>   	if (!HAS_FLAT_CCS(ce->engine->i915)) {
>   		if (ce->engine->class == VIDEO_DECODE_CLASS)
>   			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VD0_AUX_NV);
> +						      cs, GEN12_VD0_AUX_INV);
>   		else if (ce->engine->class == VIDEO_ENHANCEMENT_CLASS)
>   			cs = gen12_emit_aux_table_inv(ce->engine->gt,
> -						      cs, GEN12_VE0_AUX_NV);
> +						      cs, GEN12_VE0_AUX_INV);
>   	}
>   
>   	return cs;

