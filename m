Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9B6A1C9E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 14:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8073F10E109;
	Fri, 24 Feb 2023 13:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DD110E0E5;
 Fri, 24 Feb 2023 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677243819; x=1708779819;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F3NacRine9jv7nP3PKbhthTDgIOniNBxiN82bZ889yo=;
 b=hJAgrR00AmcVXLyZWQQwcLB+6Hwffw2VJRo7ShgUqs7xR60P2XWV5SR/
 LULlvGGr+723S1/wNuCi2Gjtioo6vUagdv+XXLT44/9Zred3kdBx8tfz9
 8mK2fVDzdRMVl4Wsyr1RNXgQKz37OsX6GUUESrZUL/BCf4We5FtMXL5au
 4NyokkMcc7XXCbFlsqZAwPg+XxEYWYHT2SaMIYGYTt8X6f1/XDtFbjIHa
 RLwqbXXdo6BIatdW/DKqDYSyZQ8CuiaNTziLv9hEXV3CPPSyjgMoR2lft
 Quu6LnuNuEAT2nAa0R6eFDuJ4rR1CqPKxRzqcqbu8/fxWIIfUK24G+y0i Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="313104874"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="313104874"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 05:03:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741664780"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="741664780"
Received: from pkacprza-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.149])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 05:03:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL
 SoC Step
In-Reply-To: <20230223184140.3452853-1-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
Date: Fri, 24 Feb 2023 15:03:25 +0200
Message-ID: <87lekn2p2a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Feb 2023, Badal Nilawar <badal.nilawar@intel.com> wrote:
> Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
> To get the SoC die stepping there is no direct interface so using
> revid as revid 0 aligns with SoC die A step.
>
> Bspec: 55420
>
> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..4ba3c8c97ccc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -29,7 +29,7 @@
>  static void mtl_media_busy(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&

Using INTEL_REVID() directly is almost certainly the wrong thing to do.

BR,
Jani.

>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
>  static void mtl_media_idle(struct intel_gt *gt)
>  {
>  	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>  	    gt->type == GT_MEDIA)
>  		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>  				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index fcf51614f9a4..7429c233ad45 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>  	 * Do not enable gucrc to avoid additional interrupts which
>  	 * may disrupt pcode wa.
>  	 */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>  	    gt->type == GT_MEDIA)
>  		return false;

-- 
Jani Nikula, Intel Open Source Graphics Center
