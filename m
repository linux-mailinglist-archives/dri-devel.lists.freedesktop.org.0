Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281DEA47875
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 09:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DBF10EA6B;
	Thu, 27 Feb 2025 08:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bg3w/7sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5F10EA6B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740646791; x=1772182791;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+0w5pxZl6eu5LUe9m4QPfCY8rfPht4lXtsBkbK6WTpY=;
 b=Bg3w/7srKH/X9GcFh4uwV+Gi4uoN/CFGGVvvC8gbzYwJ3wjXJvsP7NbU
 B3kpaoFrijz2oPkXFFKrRi8qMSwFYalJ1egltwhvvedk2xyFYFxizgi+7
 40d1KMBs8Bp8lgigV/tRJHIRYq0QGpdkMe7lS81fxK672ksMeGNLvTIB5
 8F9Pirn4DAyXFPsZV0FadWvvGANcXLUmnjXk14DFpd8oc7qEDs6m9i4YW
 AddJ60sjudEDjxiHU7x5gemIRMy0vbFlADQso4aW1h4K2InU+Gs2SU3Hx
 VgdqagFtavUbU5P8Ll8IRgZVyHAqiwffwY9zwuwuPjlbQsZHJ7zx0j8sL w==;
X-CSE-ConnectionGUID: 0kan6iW3SwSK8n0UsCKFVA==
X-CSE-MsgGUID: imd4bsNbTt6UQPRCFsisWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52939401"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52939401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:59:51 -0800
X-CSE-ConnectionGUID: lue+0kPXQ+2uMDYapBVZqg==
X-CSE-MsgGUID: 7WfixO/GRYiG4T6NyakPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="147786129"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.181])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:59:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 2/2] drm/debugfs: add top-level 'bridges' file
 showing all added bridges
In-Reply-To: <20250226-drm-debugfs-show-all-bridges-v8-2-bb511cc49d83@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250226-drm-debugfs-show-all-bridges-v8-0-bb511cc49d83@bootlin.com>
 <20250226-drm-debugfs-show-all-bridges-v8-2-bb511cc49d83@bootlin.com>
Date: Thu, 27 Feb 2025 10:59:41 +0200
Message-ID: <877c5b4vb6.fsf@intel.com>
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

On Wed, 26 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> The global bridges_list holding all the bridges between drm_bridge_add()
> and drm_bridge_remove() cannot be inspected via debugfs. Add a file showing
> it.
>
> To avoid code duplication, move the code printing a bridge info to a common
> function.

Going forward, please separate refactoring (extracting the function)
from the functional changes (adding the new debugfs) to independent
patches. It's just easier to review.

Anyway, I reviewed this one, so no need to roll another version.

And thanks for doing this; I believe the end result is better.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Changed in v8:
> - add the file in drm_bridge.c, which avois the added #if CONFIG_DEBUG_FS
> - fix incorrect (but harmless) idx increment in
>   drm_bridge_debugfs_show_bridge()
>
> Changed in v7:
> - move implementation to drm_bridge.c to avoid exporting bridge_list and
>   bridge_mutex
>
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 72 ++++++++++++++++++++++++++++++--------------
>  drivers/gpu/drm/drm_drv.c    |  2 ++
>  include/drm/drm_bridge.h     |  1 +
>  3 files changed, 53 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a6bf1a565e3c3a8d24de60448972849f6d86ba72..9c6e35d41ed54a14d5745e684a341c907ed84d6b 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1336,6 +1336,49 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>  
> +static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
> +					   struct drm_bridge *bridge,
> +					   unsigned int idx)
> +{
> +	drm_printf(p, "bridge[%u]: %ps\n", idx, bridge->funcs);
> +	drm_printf(p, "\ttype: [%d] %s\n",
> +		   bridge->type,
> +		   drm_get_connector_type_name(bridge->type));
> +
> +	if (bridge->of_node)
> +		drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
> +
> +	drm_printf(p, "\tops: [0x%x]", bridge->ops);
> +	if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +		drm_puts(p, " detect");
> +	if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +		drm_puts(p, " edid");
> +	if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +		drm_puts(p, " hpd");
> +	if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +		drm_puts(p, " modes");
> +	if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +		drm_puts(p, " hdmi");
> +	drm_puts(p, "\n");
> +}
> +
> +static int allbridges_show(struct seq_file *m, void *data)
> +{
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list)
> +		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
> +
> +	mutex_unlock(&bridge_lock);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(allbridges);
> +
>  static int encoder_bridges_show(struct seq_file *m, void *data)
>  {
>  	struct drm_encoder *encoder = m->private;
> @@ -1343,33 +1386,18 @@ static int encoder_bridges_show(struct seq_file *m, void *data)
>  	struct drm_bridge *bridge;
>  	unsigned int idx = 0;
>  
> -	drm_for_each_bridge_in_chain(encoder, bridge) {
> -		drm_printf(&p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
> -		drm_printf(&p, "\ttype: [%d] %s\n",
> -			   bridge->type,
> -			   drm_get_connector_type_name(bridge->type));
> -
> -		if (bridge->of_node)
> -			drm_printf(&p, "\tOF: %pOFfc\n", bridge->of_node);
> -
> -		drm_printf(&p, "\tops: [0x%x]", bridge->ops);
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			drm_puts(&p, " detect");
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			drm_puts(&p, " edid");
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			drm_puts(&p, " hpd");
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			drm_puts(&p, " modes");
> -		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> -			drm_puts(&p, " hdmi");
> -		drm_puts(&p, "\n");
> -	}
> +	drm_for_each_bridge_in_chain(encoder, bridge)
> +		drm_bridge_debugfs_show_bridge(&p, bridge, idx++);
>  
>  	return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(encoder_bridges);
>  
> +void drm_bridge_debugfs_params(struct dentry *root)
> +{
> +	debugfs_create_file("bridges", 0444, root, NULL, &allbridges_fops);
> +}
> +
>  void drm_bridge_debugfs_encoder_params(struct dentry *root,
>  				       struct drm_encoder *encoder)
>  {
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3cf440eee8a2ab3de134d925db8f1d2ce68062b7..22e8cd0a6a37a0ac25535e9d570da25571b0b2bc 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -38,6 +38,7 @@
>  #include <linux/xarray.h>
>  
>  #include <drm/drm_accel.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_cache.h>
>  #include <drm/drm_client_event.h>
>  #include <drm/drm_color_mgmt.h>
> @@ -1120,6 +1121,7 @@ static int __init drm_core_init(void)
>  	}
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_bridge_debugfs_params(drm_debugfs_root);
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0890acfe04b99b1ccbbff10b507cb8c2b2705e06..2a99d70865571f24db0ca75c758cfd09d3a5d459 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1108,6 +1108,7 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  }
>  #endif
>  
> +void drm_bridge_debugfs_params(struct dentry *root);
>  void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
>  
>  #endif

-- 
Jani Nikula, Intel
