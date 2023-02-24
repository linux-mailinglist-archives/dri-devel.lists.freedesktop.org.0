Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73D6A18BB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A5610E0AE;
	Fri, 24 Feb 2023 09:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B9B10E0AE;
 Fri, 24 Feb 2023 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677230860; x=1708766860;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JuW7ijR/INO/aES2eJmXs7as+lY8eyaHJSu+e/d/ZLw=;
 b=ejroLFF6Ks8kJvL3T6oyOJBt20uXPOieZ82VGkSzCjvRDFR+4RYwXlxP
 Fq3+f98589jWLuc2d+hJCdib6zWSEZ38XaTbTWcoTH0Qku3nVwDKHSg2y
 9jTNQh1oyWjNWXbTdN+WeF7zNKl9iXAPqaLT9nq/on26EtCuENVNrTQHJ
 TDu20bUkbf0bS76EN2Qt6Aq/Quru4TkOUV0nfclYMlqgbFLgKmTOhfPoP
 myzoWP7Wl1v5pziN71dDmQvDOmfMDCn/kjZvJQxlmNrSm4qrgIoIMPoJG
 4P1g25sK8bgwj+ZJTAf8GT0NK/XfQugS0RrX1dsR3Qv/ofCaovl/ISsfR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="398169249"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="398169249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:27:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="815677351"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="815677351"
Received: from wmao-mobl.amr.corp.intel.com (HELO [10.212.63.133])
 ([10.212.63.133])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:27:37 -0800
Message-ID: <1a055641-3a7d-991f-7b73-04e56c20f6d0@linux.intel.com>
Date: Fri, 24 Feb 2023 09:27:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL
 SoC Step
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230223184140.3452853-1-badal.nilawar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230223184140.3452853-1-badal.nilawar@intel.com>
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
Cc: matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/02/2023 18:41, Badal Nilawar wrote:
> Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
> To get the SoC die stepping there is no direct interface so using
> revid as revid 0 aligns with SoC die A step.
> 
> Bspec: 55420
> 
> Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index cef3d6f5c34e..4ba3c8c97ccc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -29,7 +29,7 @@
>   static void mtl_media_busy(struct intel_gt *gt)
>   {
>   	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>   	    gt->type == GT_MEDIA)

Bonus points if you make gt->type == GT_MEDIA the first condition.

Regards,

Tvrtko

>   		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>   				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> @@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
>   static void mtl_media_idle(struct intel_gt *gt)
>   {
>   	/* Wa_14017073508: mtl */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>   	    gt->type == GT_MEDIA)
>   		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
>   				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index fcf51614f9a4..7429c233ad45 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>   	 * Do not enable gucrc to avoid additional interrupts which
>   	 * may disrupt pcode wa.
>   	 */
> -	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
>   	    gt->type == GT_MEDIA)
>   		return false;
>   
