Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2CE54E35F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C074113394;
	Thu, 16 Jun 2022 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0381138B1;
 Thu, 16 Jun 2022 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655389706; x=1686925706;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HZ0/nwgilSFRfdxCWum9PEcybBk2PqNuyIc2YGAP9N4=;
 b=KCpOlIdSX9uuE5KWTMNXuM5oIN3BBA4kTUl4jUYP0bRr3C3LNF66HINz
 lR+V+Csnw38CFNNZFPj+CzjfNYHqo8EUOwguMaJHJfxXuXxpXRRTgQg41
 okZdAlbeYYBv7GUDtN/bCtP0DjjKoaApTSBeEFc0dU9EvvGygyv/2anvU
 1cXP/CyAp5doJII6skP7k240gL1Re9JItBJYdHhjucaok7JQ9jv7EpEPX
 9vkY2IS95phd2acRHq8qfBaHoIs1x4c4uGf+xhcIfYa6YJGCfT226j/3f
 8MGv/NTtmIUUiNXoSIFEOs6xiIVeS4pdTGQ4zAoGeGPM71uIPv1sJIDOI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259113150"
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="259113150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:28:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="641565632"
Received: from aamendol-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.35])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:28:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 9/9] drm/i915/rpm: d3cold Policy
In-Reply-To: <20220616120106.24353-10-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-10-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 17:28:22 +0300
Message-ID: <871qvowum1.fsf@intel.com>
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
Cc: rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> Add d3cold_sr_lmem_threshold modparam to choose between
> d3cold-off zero watt and d3cold-VRAM Self Refresh.
> i915 requires to evict the lmem objects to smem in order to
> support d3cold-Off.
>
> If gfx root port is not capable of sending PME from d3cold
> then i915 don't need to program d3cold-off/d3cold-vram_sr
> sequence.
>
> FIXME: Eviction of lmem objects in case of D3Cold off is wip.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 27 ++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/i915_params.c |  4 ++++
>  drivers/gpu/drm/i915/i915_params.h |  3 ++-
>  3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index fcff5f3fe05e..aef4b17efdbe 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1560,15 +1560,36 @@ static int i915_pm_restore(struct device *kdev)
>  static int intel_runtime_idle(struct device *kdev)
>  {
>  	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
> +	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> +	u64 lmem_total = to_gt(dev_priv)->lmem->total;
> +	u64 lmem_avail = to_gt(dev_priv)->lmem->avail;
> +	u64 lmem_used = lmem_total - lmem_avail;
> +	struct pci_dev *root_pdev;
>  	int ret = 1;
>  
> -	if (!HAS_LMEM_SR(dev_priv)) {
> -		/*TODO: Prepare for D3Cold-Off */
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		goto out;
> +
> +	if (!pci_pme_capable(root_pdev, PCI_D3cold))
>  		goto out;
> -	}
>  
>  	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
> +	if (lmem_used < dev_priv->params.d3cold_sr_lmem_threshold  * 1024 * 1024) {
> +		drm_dbg(&dev_priv->drm, "Prepare for D3Cold off\n");
> +		pci_d3cold_enable(root_pdev);
> +		/* FIXME: Eviction of lmem objects and guc reset is wip */
> +		intel_pm_vram_sr(dev_priv, false);
> +		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> +		goto out;
> +	} else if (!HAS_LMEM_SR(dev_priv)) {
> +		/* Disable D3Cold to reduce the eviction latency */
> +		pci_d3cold_disable(root_pdev);
> +		enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
> +		goto out;
> +	}

This is *way* too low level code for such high level function. This
needs to be abstracted better.

> +
>  	ret = intel_pm_vram_sr(dev_priv, true);
>  	if (!ret)
>  		drm_dbg(&dev_priv->drm, "VRAM Self Refresh enabled\n");
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 701fbc98afa0..6c6b3c372d4d 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -197,6 +197,10 @@ i915_param_named(enable_gvt, bool, 0400,
>  	"Enable support for Intel GVT-g graphics virtualization host support(default:false)");
>  #endif
>  
> +i915_param_named_unsafe(d3cold_sr_lmem_threshold, int, 0400,
> +	"Enable Vidoe RAM Self refresh when size of lmem is greater to this threshold. "
> +	"It helps to optimize the suspend/resume latecy. (default: 300mb)");
> +
>  #if CONFIG_DRM_I915_REQUEST_TIMEOUT
>  i915_param_named_unsafe(request_timeout_ms, uint, 0600,
>  			"Default request/fence/batch buffer expiration timeout.");
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index b5e7ea45d191..28f20ebaf41f 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -83,7 +83,8 @@ struct drm_printer;
>  	param(bool, verbose_state_checks, true, 0) \
>  	param(bool, nuclear_pageflip, false, 0400) \
>  	param(bool, enable_dp_mst, true, 0600) \
> -	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0) \
> +	param(int, d3cold_sr_lmem_threshold, 300, 0600) \

What's the point of the parameter?

Also, please read the comment /* leave bools at the end to not create
holes */ above.


BR,
Jani.


>  
>  #define MEMBER(T, member, ...) T member;
>  struct i915_params {

-- 
Jani Nikula, Intel Open Source Graphics Center
