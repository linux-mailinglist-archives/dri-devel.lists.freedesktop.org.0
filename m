Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3F5B56CC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 10:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0710E32F;
	Mon, 12 Sep 2022 08:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15110E32B;
 Mon, 12 Sep 2022 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662972981; x=1694508981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KuLMlfahpqxXoet0LppzwtQdbJi0csyp8T2bvaYtJdk=;
 b=WdlCKGKu+dTxjA4MpuFly/QZmWmt6TZhoF3Y89QyE7pFNuwwQumv7S40
 rNncKMaWzxvNFBJ8Ho7wP1ZSWQu09bOi5DZNkchlEA5/Zm+mc+ImolsJf
 rJjJs/DMNR/cho7KZXDTIOE4y1YMmxLa4MFcUPgEM9Iyl1eepwsHWp5kg
 Qem6aaICxnaeCjxOawTG2hA+gtiyzQr3053oe+uwsQjcbrTRSA78Cccao
 YOO8eYZv/q/bmqBbvzS6I71N5zz78DnDthJmBsFwWp3V7VxyqRIwaONOJ
 kLFWDteCkse5bShsSHjIgImH2aNlBgueRAAdVL8oe9YPHZQoXKB5HS6av w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="324047193"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="324047193"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:56:19 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="678002808"
Received: from mwojtowi-mobl.ger.corp.intel.com (HELO [10.213.24.87])
 ([10.213.24.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 01:56:18 -0700
Message-ID: <afe54574-6d28-9915-c673-bf925ce994f3@intel.com>
Date: Mon, 12 Sep 2022 10:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/gt: Extract function to apply
 media fuses
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
 <20220909-media-v2-2-6f20f322b4ef@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220909-media-v2-2-6f20f322b4ef@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.09.2022 01:18, Lucas De Marchi wrote:
> Just like is done for compute and copy engines, extract a function to
> handle media engines. While at it, be consistent on using or not the
> uncore/gt/info variable aliases.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index b6602439224d..814f83b5fe59 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -663,6 +663,74 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>   	return false;
>   }
>   
> +static void engine_mask_apply_media_fuses(struct intel_gt *gt)
> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	unsigned int logical_vdbox = 0;
> +	unsigned int i;
> +	u32 media_fuse, fuse1;
> +	u16 vdbox_mask;
> +	u16 vebox_mask;
> +
> +	if (MEDIA_VER(gt->i915) < 11)
> +		return;
> +
> +	/*
> +	 * On newer platforms the fusing register is called 'enable' and has
> +	 * enable semantics, while on older platforms it is called 'disable'
> +	 * and bits have disable semantices.
> +	 */
> +	media_fuse = intel_uncore_read(gt->uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> +	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
> +		media_fuse = ~media_fuse;
> +
> +	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> +	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
> +		      GEN11_GT_VEBOX_DISABLE_SHIFT;
> +
> +	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
> +		fuse1 = intel_uncore_read(gt->uncore, HSW_PAVP_FUSE1);
> +		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
> +	} else {
> +		gt->info.sfc_mask = ~0;
> +	}
> +
> +	for (i = 0; i < I915_MAX_VCS; i++) {
> +		if (!HAS_ENGINE(gt, _VCS(i))) {
> +			vdbox_mask &= ~BIT(i);
> +			continue;
> +		}
> +
> +		if (!(BIT(i) & vdbox_mask)) {
> +			gt->info.engine_mask &= ~BIT(_VCS(i));
> +			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
> +			continue;
> +		}
> +
> +		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
> +			gt->info.vdbox_sfc_access |= BIT(i);
> +		logical_vdbox++;
> +	}
> +	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
> +		vdbox_mask, VDBOX_MASK(gt));
> +	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
> +
> +	for (i = 0; i < I915_MAX_VECS; i++) {
> +		if (!HAS_ENGINE(gt, _VECS(i))) {
> +			vebox_mask &= ~BIT(i);
> +			continue;
> +		}
> +
> +		if (!(BIT(i) & vebox_mask)) {
> +			gt->info.engine_mask &= ~BIT(_VECS(i));
> +			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
> +		}
> +	}
> +	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
> +		vebox_mask, VEBOX_MASK(gt));
> +	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
> +}
> +
>   static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -671,6 +739,9 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
>   	unsigned long ccs_mask;
>   	unsigned int i;
>   
> +	if (GRAPHICS_VER(i915) < 11)
> +		return;
> +

Why there is no similar sentinel in case of engine_mask_apply_copy_fuses?
Beside this:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej



>   	if (hweight32(CCS_MASK(gt)) <= 1)
>   		return;
>   
> @@ -726,75 +797,11 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>    */
>   static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>   {
> -	struct drm_i915_private *i915 = gt->i915;
>   	struct intel_gt_info *info = &gt->info;
> -	struct intel_uncore *uncore = gt->uncore;
> -	unsigned int logical_vdbox = 0;
> -	unsigned int i;
> -	u32 media_fuse, fuse1;
> -	u16 vdbox_mask;
> -	u16 vebox_mask;
>   
>   	GEM_BUG_ON(!info->engine_mask);
>   
> -	if (GRAPHICS_VER(i915) < 11)
> -		return info->engine_mask;
> -
> -	/*
> -	 * On newer platforms the fusing register is called 'enable' and has
> -	 * enable semantics, while on older platforms it is called 'disable'
> -	 * and bits have disable semantices.
> -	 */
> -	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
> -	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
> -		media_fuse = ~media_fuse;
> -
> -	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> -	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
> -		      GEN11_GT_VEBOX_DISABLE_SHIFT;
> -
> -	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
> -		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
> -		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
> -	} else {
> -		gt->info.sfc_mask = ~0;
> -	}
> -
> -	for (i = 0; i < I915_MAX_VCS; i++) {
> -		if (!HAS_ENGINE(gt, _VCS(i))) {
> -			vdbox_mask &= ~BIT(i);
> -			continue;
> -		}
> -
> -		if (!(BIT(i) & vdbox_mask)) {
> -			info->engine_mask &= ~BIT(_VCS(i));
> -			drm_dbg(&i915->drm, "vcs%u fused off\n", i);
> -			continue;
> -		}
> -
> -		if (gen11_vdbox_has_sfc(gt, i, logical_vdbox, vdbox_mask))
> -			gt->info.vdbox_sfc_access |= BIT(i);
> -		logical_vdbox++;
> -	}
> -	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
> -		vdbox_mask, VDBOX_MASK(gt));
> -	GEM_BUG_ON(vdbox_mask != VDBOX_MASK(gt));
> -
> -	for (i = 0; i < I915_MAX_VECS; i++) {
> -		if (!HAS_ENGINE(gt, _VECS(i))) {
> -			vebox_mask &= ~BIT(i);
> -			continue;
> -		}
> -
> -		if (!(BIT(i) & vebox_mask)) {
> -			info->engine_mask &= ~BIT(_VECS(i));
> -			drm_dbg(&i915->drm, "vecs%u fused off\n", i);
> -		}
> -	}
> -	drm_dbg(&i915->drm, "vebox enable: %04x, instances: %04lx\n",
> -		vebox_mask, VEBOX_MASK(gt));
> -	GEM_BUG_ON(vebox_mask != VEBOX_MASK(gt));
> -
> +	engine_mask_apply_media_fuses(gt);
>   	engine_mask_apply_compute_fuses(gt);
>   	engine_mask_apply_copy_fuses(gt);
>   
> 

