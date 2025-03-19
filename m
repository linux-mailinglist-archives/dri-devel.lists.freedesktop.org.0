Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C00A68293
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 02:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B479710E4E1;
	Wed, 19 Mar 2025 01:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QohENSTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3478610E4E1;
 Wed, 19 Mar 2025 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742346123; x=1773882123;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yo9CtLdioezJyjxnIvNttkCYoIf1uc3KfXb2q3p+pd4=;
 b=QohENSTGzXNO5Wnfa/qcRMvOkCwG18IpKTkh/7XeoaipmCsqcVkulD6T
 gufxwYfU0MReyGVHifZ76koR06dNqmZUYkde5Ww83tZCkYDgF3oP+ilAB
 +LAGWdgcVgBK5wK+/gVs9TUXuO9x5VYX75tizvG0I4KtOn29G7ETP8wfP
 VQ02m/7tuoYWorEcSEbi3uPAxIYkUNo9avFquOemECkVRjsS8EzqSoEtt
 hcoePe7Bt7gH+6y6rV+nvvshRod0F278TUrt8MPOq1cS1ksmr6dLnmnQB
 59PZJoYRYQbu/eDlR2EycJSK/GTr6f1ak42mXtwCCnMPEHBEkfcZPJ2gT g==;
X-CSE-ConnectionGUID: fniHj63wQHK3JfjiBOOPNg==
X-CSE-MsgGUID: IX6/Q4EvT8C8IljRhacRFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43248784"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="43248784"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 18:02:03 -0700
X-CSE-ConnectionGUID: NB9/l59tRkyjcrLUOtLMjQ==
X-CSE-MsgGUID: 8Epu/KtbQtmTvou78+HyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="159575159"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 18:01:58 -0700
Date: Wed, 19 Mar 2025 02:01:54 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH v5 3/3] drm/i915: Fix harmful driver register/unregister
 asymmetry
Message-ID: <Z9oXgg2a61v_O9ka@ashyti-mobl2.lan>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-8-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-8-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

...

> @@ -634,10 +635,14 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>  	intel_vgpu_register(dev_priv);
>  
>  	/* Reveal our presence to userspace */
> -	if (drm_dev_register(&dev_priv->drm, 0)) {
> +	ret = drm_dev_register(&dev_priv->drm, 0);
> +	if (ret) {
>  		i915_probe_error(dev_priv,
>  				 "Failed to register driver for userspace access!\n");
> -		return;
> +		drm_dev_unregister(&dev_priv->drm);
> +		i915_pmu_unregister(dev_priv);
> +		i915_gem_driver_unregister(dev_priv);
> +		return ret;

I would have used a goto here, but it's just my preference.

>  	}
>  
>  	i915_debugfs_register(dev_priv);
> @@ -660,6 +665,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>  
>  	if (i915_switcheroo_register(dev_priv))
>  		drm_err(&dev_priv->drm, "Failed to register vga switcheroo!\n");
> +
> +	return 0;
>  }
>  
>  /**
> @@ -834,7 +841,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto out_cleanup_gem;
>  
> -	i915_driver_register(i915);
> +	ret = i915_driver_register(i915);
> +	if (ret)
> +		goto out_cleanup_gem;

looks good!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

...
