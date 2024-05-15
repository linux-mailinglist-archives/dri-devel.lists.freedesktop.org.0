Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617468C63DB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAB210E303;
	Wed, 15 May 2024 09:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDnMwim4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A510E303
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715765984; x=1747301984;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9uh3zKLDMxB2n7lOvq1zpArtcYEgDMl2J1QTDfbEfUo=;
 b=QDnMwim4bdeadtccnZ2fzZErf98fyKugCpGEJPutFssz4FDKphlIK7Yh
 DLALaoamIcSWgdLpGdeY3FHr3DFdiA1y2C6EJ7U32DZAVqUN9PpR7jion
 HY/wgNSMw7v8B+x8xul/lTI+ZNp5GOJ455QCQEhn/TDbB0BZJ0N5iA3Jb
 +J9/NaqQogcTPEao+Zf7VM8rkACaFLHNHaiAcdRhiG1LEe8t8CLqw1q80
 0rMYZOUcE5FTxa2qMI14u9bO5nB8NBXtoZrDCix4JeeL/oewTUq6fxelB
 8oJ/2LvbeyjHvfNBkGWmokJMcKva3JC5qZ8rJkFU9TokOBcdedxS4AYw9 g==;
X-CSE-ConnectionGUID: bkzfuZiJQVKS6OKGJ173vw==
X-CSE-MsgGUID: +H4fT6e2TeOQZ0p49Ieh8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11933989"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11933989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:39:44 -0700
X-CSE-ConnectionGUID: xDPFVd8oTUKsi3PxrpFcNQ==
X-CSE-MsgGUID: JXGHlvzkRhmuVWa9MkEVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35693516"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.141])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:39:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sui
 Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 1/2] drm/bridge: Support finding bridge with struct device
In-Reply-To: <20240514154045.309925-2-sui.jingfeng@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514154045.309925-2-sui.jingfeng@linux.dev>
Date: Wed, 15 May 2024 12:39:37 +0300
Message-ID: <87v83fct2e.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> The pointer of 'struct device' can also be used as a key to search drm
> bridge instance from the global bridge list, traditionally, fwnode and
> 'OF' based APIs requires the system has decent fwnode/OF Graph support.
> While the drm_find_bridge_by_dev() function introduced in this series
> don't has such a restriction. It only require you has a pointer to the
> backing device. Hence, it may suitable for some small and/or limited
> display subsystems.
>
> Also add the drm_bridge_add_with_dev() as a helper, which automatically
> set the .of_node field of drm_bridge instances if you call it. But it
> suitable for simple bridge drivers which one device backing one drm_bridge
> instance.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/drm_bridge.c | 39 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  5 +++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 584d109330ab..1928d9d0dd3c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -213,6 +213,23 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_bridge_add);
>  
> +/**
> + * drm_bridge_add_with_dev - add the given bridge to the global bridge list
> + *
> + * @bridge: bridge control structure
> + * @dev: pointer to the kernel device that this bridge is backed.
> + */
> +void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev)
> +{
> +	if (dev) {
> +		bridge->kdev = dev;
> +		bridge->of_node = dev->of_node;
> +	}
> +
> +	drm_bridge_add(bridge);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_add_with_dev);

I don't actually have an opinion on whether the dev parameter is useful
or not.

But please don't add a drm_bridge_add_with_dev() and then convert more
than half the drm_bridge_add() users to that. Please just add a struct
device *dev parameter to drm_bridge_add(), and pass NULL if it's not
relevant.

BR,
Jani.


> +
>  static void drm_bridge_remove_void(void *bridge)
>  {
>  	drm_bridge_remove(bridge);
> @@ -1334,6 +1351,27 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
>  
> +struct drm_bridge *drm_find_bridge_by_dev(struct device *kdev)
> +{
> +	struct drm_bridge *bridge;
> +
> +	if (!kdev)
> +		return NULL;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list) {
> +		if (bridge->kdev == kdev) {
> +			mutex_unlock(&bridge_lock);
> +			return bridge;
> +		}
> +	}
> +
> +	mutex_unlock(&bridge_lock);
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(drm_find_bridge_by_dev);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node in
> @@ -1361,6 +1399,7 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
>  #endif
>  
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..70d8393bbd9c 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -715,6 +715,8 @@ struct drm_bridge {
>  	struct drm_private_obj base;
>  	/** @dev: DRM device this bridge belongs to */
>  	struct drm_device *dev;
> +	/** @kdev: pointer to the kernel device backing this bridge */
> +	struct device *kdev;
>  	/** @encoder: encoder to which this bridge is connected */
>  	struct drm_encoder *encoder;
>  	/** @chain_node: used to form a bridge chain */
> @@ -782,12 +784,15 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
>  }
>  
>  void drm_bridge_add(struct drm_bridge *bridge);
> +void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev);
>  int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
>  void drm_bridge_remove(struct drm_bridge *bridge);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous,
>  		      enum drm_bridge_attach_flags flags);
>  
> +struct drm_bridge *drm_find_bridge_by_dev(struct device *kdev);
> +
>  #ifdef CONFIG_OF
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  #else

-- 
Jani Nikula, Intel
