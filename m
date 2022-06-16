Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035954E375
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075701138B1;
	Thu, 16 Jun 2022 14:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471BD10E357;
 Thu, 16 Jun 2022 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655389944; x=1686925944;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DUXopvYubB3UbdCXV44+s1F+VXae50GnL7DHHVSs730=;
 b=lQTxRlTFjsE1AAt6nl6s4hRj6h31vey0sTmQsyZl/0Dlt+/kSIWdvakE
 mGZrdEM0Nt+1rTJHvCplW5qaRoGfQg7GnyL1pAmoooTSw2IdgvBV61qgI
 E64kZge/QDFkHBTNV62rjiyaLiSfUscWEhv7Bd1VFiBtC0auEzYKQZZ19
 qpbdFq+zPABQZ9MsKCk9DWIFdkHUMn2jD0yAUDXc80FUFrADfuNNwcywm
 +VBc+SRzbsrDa6rmzHGyv7IdHrTINEpdGhS0XusvkYHrU/gWPU4bZwSco
 r6afbxoeG2y0W30hjYfMjkPmDHGqAZrH6dlnDNL0BikRjHbd1u0G7ooM3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="267948644"
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="267948644"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:32:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="641567291"
Received: from aamendol-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.35])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:32:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 7/9] drm/i915/rpm: Enable D3Cold VRAM SR
 Support
In-Reply-To: <20220616120106.24353-8-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-8-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 17:32:18 +0300
Message-ID: <87v8t0vfv1.fsf@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Intel Client DGFX card supports D3Cold with two option.
> D3Cold-off zero watt, D3Cold-VRAM Self Refresh.
>
> i915 requires to evict the lmem objects to smem in order to
> support D3Cold-Off, which increases i915 the suspend/resume
> latency. Enabling VRAM Self Refresh feature optimize the
> latency with additional power cost which required to retain
> the lmem.
>
> Adding intel_runtime_idle (runtime_idle callback) to enable
> VRAM_SR, it will be used for policy to choose
> between D3Cold-off vs D3Cold-VRAM_SR.
>
> Since we have introduced i915 runtime_idle callback.
> It need to be warranted that Runtime PM Core invokes runtime_idle
> callback when runtime usages count becomes zero. That requires
> to use pm_runtime_put instead of pm_runtime_put_autosuspend.
>
> TODO: GuC interface state save/restore.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c      | 26 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_runtime_pm.c |  3 +--
>  2 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index aa1fb15b1f11..fcff5f3fe05e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1557,6 +1557,31 @@ static int i915_pm_restore(struct device *kdev)
>  	return i915_pm_resume(kdev);
>  }
>  
> +static int intel_runtime_idle(struct device *kdev)
> +{
> +	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
> +	int ret = 1;
> +
> +	if (!HAS_LMEM_SR(dev_priv)) {
> +		/*TODO: Prepare for D3Cold-Off */
> +		goto out;
> +	}
> +
> +	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> +
> +	ret = intel_pm_vram_sr(dev_priv, true);
> +	if (!ret)
> +		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n");

Please add the debug in the intel_pm_vram_sr() function instead.

BR,
Jani.

> +
> +	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> +
> +out:
> +	pm_runtime_mark_last_busy(kdev);
> +	pm_runtime_autosuspend(kdev);
> +
> +	return ret;
> +}
> +
>  static int intel_runtime_suspend(struct device *kdev)
>  {
>  	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
> @@ -1742,6 +1767,7 @@ const struct dev_pm_ops i915_pm_ops = {
>  	.restore = i915_pm_restore,
>  
>  	/* S0ix (via runtime suspend) event handlers */
> +	.runtime_idle = intel_runtime_idle,
>  	.runtime_suspend = intel_runtime_suspend,
>  	.runtime_resume = intel_runtime_resume,
>  };
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 6ed5786bcd29..4dade7e8a795 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -492,8 +492,7 @@ static void __intel_runtime_pm_put(struct intel_runtime_pm *rpm,
>  
>  	intel_runtime_pm_release(rpm, wakelock);
>  
> -	pm_runtime_mark_last_busy(kdev);
> -	pm_runtime_put_autosuspend(kdev);
> +	pm_runtime_put(kdev);
>  }
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
