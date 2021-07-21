Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E7C3D0B3F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85E6E8D8;
	Wed, 21 Jul 2021 09:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF846E81C;
 Wed, 21 Jul 2021 09:20:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296962630"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="296962630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:20:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="496548286"
Received: from jcornall-mobl.ger.corp.intel.com (HELO [10.213.197.250])
 ([10.213.197.250])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:20:38 -0700
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/gt: rename legacy engine->hw_id
 to engine->gen6_hw_id
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-4-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e88027b5-849d-ecd8-9c37-2bf563617fd5@linux.intel.com>
Date: Wed, 21 Jul 2021 10:20:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720232014.3302645-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2021 00:20, Lucas De Marchi wrote:
> We kept adding new engines and for that increasing hw_id unnecessarily:
> it's not used since GRAPHICS_VER == 8. Prepend "gen6" to the field and
> try to pack it in the structs to give a hint this field is actually not
> used in recent platforms.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 12 ++++++------
>   drivers/gpu/drm/i915/gt/intel_engine_types.h |  2 +-
>   drivers/gpu/drm/i915/i915_reg.h              |  2 +-
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index a11f69f2e46e..508221de411c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -42,7 +42,7 @@
>   
>   #define MAX_MMIO_BASES 3
>   struct engine_info {
> -	unsigned int hw_id;
> +	u8 gen6_hw_id;
>   	u8 class;
>   	u8 instance;
>   	/* mmio bases table *must* be sorted in reverse graphics_ver order */
> @@ -54,7 +54,7 @@ struct engine_info {
>   
>   static const struct engine_info intel_engines[] = {
>   	[RCS0] = {
> -		.hw_id = RCS0_HW,
> +		.gen6_hw_id = RCS0_HW,
>   		.class = RENDER_CLASS,
>   		.instance = 0,
>   		.mmio_bases = {
> @@ -62,7 +62,7 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[BCS0] = {
> -		.hw_id = BCS0_HW,
> +		.gen6_hw_id = BCS0_HW,
>   		.class = COPY_ENGINE_CLASS,
>   		.instance = 0,
>   		.mmio_bases = {
> @@ -70,7 +70,7 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VCS0] = {
> -		.hw_id = VCS0_HW,
> +		.gen6_hw_id = VCS0_HW,
>   		.class = VIDEO_DECODE_CLASS,
>   		.instance = 0,
>   		.mmio_bases = {
> @@ -102,7 +102,7 @@ static const struct engine_info intel_engines[] = {
>   		},
>   	},
>   	[VECS0] = {
> -		.hw_id = VECS0_HW,
> +		.gen6_hw_id = VECS0_HW,
>   		.class = VIDEO_ENHANCEMENT_CLASS,
>   		.instance = 0,
>   		.mmio_bases = {
> @@ -290,7 +290,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
>   	engine->i915 = i915;
>   	engine->gt = gt;
>   	engine->uncore = gt->uncore;
> -	engine->hw_id = info->hw_id;
> +	engine->gen6_hw_id = info->gen6_hw_id;
>   	guc_class = engine_class_to_guc_class(info->class);
>   	engine->guc_id = MAKE_GUC_ID(guc_class, info->instance);
>   	engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index a107eb58ffa2..266422d8d1b1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -264,11 +264,11 @@ struct intel_engine_cs {
>   	enum intel_engine_id id;
>   	enum intel_engine_id legacy_idx;
>   
> -	unsigned int hw_id;
>   	unsigned int guc_id;
>   
>   	intel_engine_mask_t mask;
>   
> +	u8 gen6_hw_id;
>   	u8 class;
>   	u8 instance;
>   
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 943fe485c662..8750ffce9d61 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2572,7 +2572,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>   #define   ARB_MODE_BWGTLB_DISABLE (1 << 9)
>   #define   ARB_MODE_SWIZZLE_BDW	(1 << 1)
>   #define RENDER_HWS_PGA_GEN7	_MMIO(0x04080)
> -#define RING_FAULT_REG(engine)	_MMIO(0x4094 + 0x100 * (engine)->hw_id)
> +#define RING_FAULT_REG(engine)	_MMIO(0x4094 + 0x100 * (engine)->gen6_hw_id)
>   #define GEN8_RING_FAULT_REG	_MMIO(0x4094)
>   #define GEN12_RING_FAULT_REG	_MMIO(0xcec4)
>   #define   GEN8_RING_FAULT_ENGINE_ID(x)	(((x) >> 12) & 0x7)
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
