Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF8A44636
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89E10E161;
	Tue, 25 Feb 2025 16:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eKvv1cIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EC410E161
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740501411; x=1772037411;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ajMeBsRypk2qfz3LU0HDlFR+UI4BN17crahO5/D0Ljk=;
 b=eKvv1cIfMQOVj8glYKxpyak818vSnxmYSZcLnzSPQk0Y5PNCoe42v7Va
 cjyGzwM7maykbMUWFgOlkImhD4pCPqSuzb1SLtS2OTHBu2qYOJpYyZ8/r
 RmVEd2S3BgEn8iqU5KNbSsDCLmmvmnozHgJEfTwPEvAEre3qbNjDIPLGR
 GMtA0js3Q2J6bena8ifGmfAX8uAEPCHrQo+5NqIzbZKaqalk/g/nTlYmE
 sG9D5BEt8puPnWYWjwwlL27kZan44kP9dgDVOgfSMtz/Pl41DK4mAZElw
 UfSB2dM5CUxGuML1snoVy/Bor4NrHrG4AsH3WMH/CWsGzQqFv31qUBr8x A==;
X-CSE-ConnectionGUID: wrcMuESUS8ablTrCDmLlcg==
X-CSE-MsgGUID: myQlaSN9SbG98HmIfQYdfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52740033"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52740033"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 08:36:50 -0800
X-CSE-ConnectionGUID: 0XPBIbJkTqmi19/ZfbCgsQ==
X-CSE-MsgGUID: UMXQ0kGKTbCvktN37fhdaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121688693"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 08:36:44 -0800
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
Subject: Re: [PATCH v7 1/2] drm/bridge: move bridges_show logic from
 drm_debugfs.c
In-Reply-To: <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250225-drm-debugfs-show-all-bridges-v7-0-8826037ada37@bootlin.com>
 <20250225-drm-debugfs-show-all-bridges-v7-1-8826037ada37@bootlin.com>
Date: Tue, 25 Feb 2025 18:36:41 +0200
Message-ID: <878qpu56cm.fsf@intel.com>
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

On Tue, 25 Feb 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> In preparation to expose more info about bridges in debugfs, which will
> require more insight into drm_bridge data structures, move the bridges_show
> code to drm_bridge.c.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I hate myself for doing this on a patch that's at v7... but here goes.

Perhaps consider moving the bridges debugfs creation and fops to
drm_bridge.c instead of just adding
drm_bridge_debugfs_show_encoder_bridges().

For example, add drm_bridge_debugfs_add(struct drm_encoder *encoder),
which then contains the debugfs_create_file() call.

Interestingly, this lets you drop a lot of #ifdef CONFIG_DEBUG_FS. The
compiler optimizes the fops struct and the functions away when
debugfs_create_file() becomes a stub for CONFIG_DEBUG_FS=n. It becomes
all around cleaner.


BR,
Jani.


>
> ---
>
> This patch was added in v7.
> ---
>  drivers/gpu/drm/drm_bridge.c  | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_debugfs.c | 27 ++-------------------------
>  include/drm/drm_bridge.h      |  8 ++++++++
>  3 files changed, 43 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 241a384ebce39b4a3db58c208af27960904fc662..6e1e02c1cf443fbaa764765ad369b7a34cc03f2d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1335,6 +1335,39 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>  
> +#ifdef CONFIG_DEBUG_FS
> +void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
> +					     struct drm_encoder *encoder)
> +{
> +	struct drm_bridge *bridge;
> +	unsigned int idx = 0;
> +
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		drm_printf(p, "bridge[%u]: %ps\n", idx++, bridge->funcs);
> +		drm_printf(p, "\ttype: [%d] %s\n",
> +			   bridge->type,
> +			   drm_get_connector_type_name(bridge->type));
> +
> +		if (bridge->of_node)
> +			drm_printf(p, "\tOF: %pOFfc\n", bridge->of_node);
> +
> +		drm_printf(p, "\tops: [0x%x]", bridge->ops);
> +		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +			drm_puts(p, " detect");
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +			drm_puts(p, " edid");
> +		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +			drm_puts(p, " hpd");
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +			drm_puts(p, " modes");
> +		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> +			drm_puts(p, " hdmi");
> +		drm_puts(p, "\n");
> +	}
> +}
> +EXPORT_SYMBOL(drm_bridge_debugfs_show_encoder_bridges);
> +#endif
> +
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>  MODULE_DESCRIPTION("DRM bridge infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 6b2178864c7ee12db9aa1f562e106b2f604439f8..a625c0c9a9aa076af19c8ba47564dbb24ba71c9a 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -744,31 +744,8 @@ static int bridges_show(struct seq_file *m, void *data)
>  {
>  	struct drm_encoder *encoder = m->private;
>  	struct drm_printer p = drm_seq_file_printer(m);
> -	struct drm_bridge *bridge;
> -	unsigned int idx = 0;
> -
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
> +
> +	drm_bridge_debugfs_show_encoder_bridges(&p, encoder);
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..23c062853e7bb42d8d73af35ef7f16fb37345a37 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1108,4 +1108,12 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  }
>  #endif
>  
> +#ifdef CONFIG_DEBUG_FS
> +void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
> +					     struct drm_encoder *encoder);
> +#else
> +static inline void drm_bridge_debugfs_show_encoder_bridges(struct drm_printer *p,
> +							   struct drm_encoder *encoder) {}
> +#endif
> +
>  #endif

-- 
Jani Nikula, Intel
