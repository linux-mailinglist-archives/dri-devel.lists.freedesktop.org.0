Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDEA5BA258
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 23:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E17410E2CC;
	Thu, 15 Sep 2022 21:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F73810E2CC;
 Thu, 15 Sep 2022 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663277669; x=1694813669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p6iUoJ2ZKJUrNEFW+XGUXYeyqk6Jwj/tR2bgAm26YR4=;
 b=BfCXJe1AiL14paKSzgAqZmBEXIRb2E+V8fm447ISoAhGEQNIZVT1Ct7Z
 NEbyb+Oio/+9Ob2tvIj6O79wX4UF2YC6isWv3HOxmVH7ktVqxm2Pw6KF8
 J3MZPe6oFHdW8msUTLjPgCcOOi5hhkJvDrn4ArDeQib51gDQjCc/dL7wH
 KLJt3MhveswUlrYWmAvevxe3aEL/biaZQ+gJrcF/6fb0JhSHVEkb9a9cd
 4d8Lov4guk/7WCbhv2QRIINrY5d9xEUZ/D/LbphetxKRgWqr05X4zT5pL
 il6QPkpUEi5NZ4sLnrmiwuLEWiMQQbU6c5kKbxPjOma3mXJ6Q3lXXHRsS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299667910"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299667910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:34:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="594993804"
Received: from eramir3-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.27])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:34:27 -0700
Date: Thu, 15 Sep 2022 23:34:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Make GEM resume all engines
Message-ID: <YyOaTZdCkKTqniRR@alfio.lan>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <20220914220427.3091448-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914220427.3091448-3-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Wed, Sep 14, 2022 at 03:04:25PM -0700, Matt Roper wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Walk all GTs from i915_gem_resume when resuming engines.
> 
> Cc: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I had this (and others) in my multi-gt branch from a long time
but never had time to clean it up and send it. Thanks for taking
it.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 3428f735e786..2c80cc8362b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -212,7 +212,8 @@ int i915_gem_freeze_late(struct drm_i915_private *i915)
>  
>  void i915_gem_resume(struct drm_i915_private *i915)
>  {
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i, j;
>  
>  	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
>  
> @@ -224,8 +225,25 @@ void i915_gem_resume(struct drm_i915_private *i915)
>  	 * guarantee that the context image is complete. So let's just reset
>  	 * it and start again.
>  	 */
> -	intel_gt_resume(to_gt(i915));
> +	for_each_gt(gt, i915, i)
> +		if (intel_gt_resume(gt))
> +			goto err_wedged;
>  
>  	ret = lmem_restore(i915, I915_TTM_BACKUP_ALLOW_GPU);
>  	GEM_WARN_ON(ret);
> +
> +	return;
> +
> +err_wedged:
> +	for_each_gt(gt, i915, j) {
> +		if (!intel_gt_is_wedged(gt)) {
> +			dev_err(i915->drm.dev,
> +				"Failed to re-initialize GPU[%u], declaring it wedged!\n",
> +				j);
> +			intel_gt_set_wedged(gt);
> +		}
> +
> +		if (j == i)
> +			break;
> +	}
>  }
> -- 
> 2.37.3
