Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C457BB1386
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D8E10E706;
	Wed,  1 Oct 2025 16:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rv7pdWQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AC910E706
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 16:09:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3A8AC1A1075;
 Wed,  1 Oct 2025 16:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 093A5606BF;
 Wed,  1 Oct 2025 16:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E7266102F1A3E; 
 Wed,  1 Oct 2025 18:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759334993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9CvJDGBSoVXbt+J412aK4yig9hsCig6aqy7YzBwhW2U=;
 b=rv7pdWQxzoqrjN3bhcDG6IeHqv9N+XFI6QwkO+p2auYuGPT6LdtWBCRBaL+JXAoVwiZp3M
 GCz4Tg3Kp9FHaQ9ya4b1XoJUTf6IrVRO2rb9kWsrBaj8QlhrQSzkcUKcKaIjBJevIfdKML
 Wq9Hw3uoV22IEeAse398wh3dpFWcPNP4997mm0bXmVga+Na0ZqDBIom3Xkc/v8U54fbN0P
 dUv7sLcbxNiQ6FHk4AuZ6ks4JvbyqGVlVceYlp2gOFBy2i4u7ZoQOFNKAjjRBjtVSLzzx1
 IWzQUOqHYmLJoe+mlbvD6F85QWGNZgLSYs8vBFGYgIlNgCS9dU1HYJqlbZYC9A==
Date: Wed, 1 Oct 2025 18:09:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
Message-ID: <20251001180922.6bbe42ac@booty>
In-Reply-To: <20250930090920.131094-12-damon.ding@rock-chips.com>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-12-damon.ding@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Damon,

On Tue, 30 Sep 2025 17:09:13 +0800
Damon Ding <damon.ding@rock-chips.com> wrote:

> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
> 
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
> 
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
> 
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.

I think the whole explanation can be more concisely rewritten as:

If the later bridge declares OP_EDID, OP_MODES or both, then both
.bridge_modes and .bridge_edid should be set to NULL (if any was set
from a previous bridge), and then .bridge_modes and/or .bridge_edid be
set to the later bridge as is done already.

Does this look correct (i.e. does it convey the same meaning)?

> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct drm_connector *connector;
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *bridge, *panel_bridge = NULL;
> +	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
>  	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>  	unsigned int max_bpc = 8;
>  	bool support_hdcp = false;
> @@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	 */
>  	connector_type = DRM_MODE_CONNECTOR_Unknown;
>  	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		pre_bridge_edid = bridge_connector->bridge_edid;
> +		pre_bridge_modes = bridge_connector->bridge_modes;
> +
>  		if (!bridge->interlace_allowed)
>  			connector->interlace_allowed = false;
>  		if (!bridge->ycbcr_420_allowed)
> @@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  			bridge_connector->bridge_detect = bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
>  			bridge_connector->bridge_modes = bridge;
> +
> +		/*
> +		 * When multiple bridges are present, EDID detection capability
> +		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> +		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
> +		 * are determined by the last bridge in the chain, we handle
> +		 * three cases:
> +		 *
> +		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
> +		 *    &drm_bridge_connector.bridge_edid to NULL and set
> +		 *    &drm_bridge_connector.bridge_modes to the later bridge.
> +		 *  - Ensure modes detection capability of the later bridge
> +		 *    will not be ignored.
> +		 *
> +		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
> +		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
> +		 *    &drm_bridge_connector.bridge_modes to NULL and set
> +		 *    &drm_bridge_connector.bridge_edid to the later bridge.
> +		 *  - Although EDID detection capability has higher priority,
> +		 *    this operation is for balance and makes sense.
> +		 *
> +		 * Case 3: the later bridge declares both of them
> +		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
> +		 *    and &drm_bridge_connector.bridge_modes to this bridge.
> +		 *  - Just leave transfer of these two capabilities as before.
> +		 */
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
> +		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
> +			if (pre_bridge_modes)
> +				bridge_connector->bridge_modes = NULL;
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
> +		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
> +			if (pre_bridge_edid)
> +				bridge_connector->bridge_edid = NULL;
> +		}
> +

If the above rewrite is correct, then I think this patch can be
rewritten in a simple way (build tested only):

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a5bdd6c10643..bd5dbafe88bc 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -672,14 +672,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
                if (!bridge->ycbcr_420_allowed)
                        connector->ycbcr_420_allowed = false;
 
-               if (bridge->ops & DRM_BRIDGE_OP_EDID)
-                       bridge_connector->bridge_edid = bridge;
+               if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
+                       bridge_connector->bridge_edid = NULL;
+                       bridge_connector->bridge_modes = NULL;
+                       if (bridge->ops & DRM_BRIDGE_OP_EDID)
+                               bridge_connector->bridge_edid = bridge;
+                       if (bridge->ops & DRM_BRIDGE_OP_MODES)
+                               bridge_connector->bridge_modes = bridge;
+               }
                if (bridge->ops & DRM_BRIDGE_OP_HPD)
                        bridge_connector->bridge_hpd = bridge;
                if (bridge->ops & DRM_BRIDGE_OP_DETECT)
                        bridge_connector->bridge_detect = bridge;
-               if (bridge->ops & DRM_BRIDGE_OP_MODES)
-                       bridge_connector->bridge_modes = bridge;
                if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
                        if (bridge_connector->bridge_hdmi)
                                return ERR_PTR(-EBUSY);

Another thing to note is that this patch conflicts with [0], which I
plan to apply in the next few days. The two patches are orthogonal but
they insist on the same lines (those assigning
bridge_connector->bridge_* = bridge). Not a big deal, whichever patch
comes later will be easily adapted. Just wanted to ensure you are aware.

[0] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
