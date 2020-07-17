Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3E2237B4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 11:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE35D6ED76;
	Fri, 17 Jul 2020 09:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF736ED6A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 09:04:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o11so10188566wrv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G0zAY2PrfwIUmvif0VeV8OoxbY/ZKQMS2DyWIAYPMvc=;
 b=h+JL5956PvOCCsFj33TU9OTEZn8XBKwCqctMYLwiYyeiBoMeb9LwV21YMbhZoDt5kv
 Wr/J7AEdyTVc1AVnubRgdO9rYDSDJqnmHcthx9K6YpULrdXMbI8Yiw0MkGN0cbQqS+cm
 u0qmJcLeZzg3pkZIbGlLQ4Ql6p7SCG6YHiLHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G0zAY2PrfwIUmvif0VeV8OoxbY/ZKQMS2DyWIAYPMvc=;
 b=NPhIEp8ICSlg9JC2Y/dJ5QWykjRQzW/Be8e0t2ggYwqGkpZHDBnpIWSZrYpQoJxz7R
 GauEASDX5yYM+7cO6bmSFAobAjvFnV4xOI9Y3ly0rqzcFhefvYuarY4QNudq20qoPRNR
 N3+JF6iGW9KlMljB4S6GqITSpT9tMUScAYuZum0wXg15NXOMpXwinVQk5Dl0SKif8oQB
 SsKDBOwigfeejt2wkyM7L9oiElXY1rtqFA8Rota7kaXy23cTEolYkPrO2dVoJRGxBOMV
 C8c31cgGauIZZEpsK/9+aQaIT1gqUec3gLcr/fmraOh6sOGV/R/aeFqPCP5cJGEqvc27
 Hfbg==
X-Gm-Message-State: AOAM531loz16yLIXGu8QBbx6eVFPVakt5rdgaZO6XxeKX05X+LirW2wk
 71kLfQ+0G/6KvbtE2f/u0yo04S8TgGE=
X-Google-Smtp-Source: ABdhPJysc69jsJtnNWu4SjUtU1KRIsc72v9bs7lDww+QJoAUHQdWmwB0PpSFC7+rurXjE0dX8kmXEw==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr8869595wrp.427.1594976690139; 
 Fri, 17 Jul 2020 02:04:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l67sm14520833wml.13.2020.07.17.02.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 02:04:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/18] drm/arc: Initialize sim connector before display pipe
Date: Fri, 17 Jul 2020 11:04:28 +0200
Message-Id: <20200717090430.1146256-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
References: <20200717090430.1146256-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That way we can get rid of this final piece of init code, and use the
simple pipe helpers as intended.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 51 ++++++++++----------------------
 1 file changed, 16 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 3c44b9b4acec..788101401701 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -95,32 +95,11 @@ static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
+static int arcpgu_drm_sim_init(struct drm_device *drm, struct drm_connector *connector)
 {
-	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = &arcpgu->pipe.encoder;
-
-	connector = &arcpgu->sim_conn;
 	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
-
-	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
+	return drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
 			DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret < 0) {
-		dev_err(drm->dev, "failed to initialize drm connector\n");
-		return ret;
-	}
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0) {
-		dev_err(drm->dev, "could not attach connector to encoder\n");
-		return ret;
-	}
-
-	return 0;
 }
 
 #define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
@@ -276,6 +255,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
 	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
+	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
 	struct resource *res;
 	int ret;
@@ -310,13 +290,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
 		return -ENODEV;
 
-	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
-					   arc_pgu_supported_formats,
-					   ARRAY_SIZE(arc_pgu_supported_formats),
-					   NULL, NULL);
-	if (ret)
-		return ret;
-
 	/*
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
@@ -325,8 +298,21 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (endpoint_node) {
 		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
+	} else {
+		connector = &arcpgu->sim_conn;
+		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
+		ret = arcpgu_drm_sim_init(drm, connector);
+		if (ret < 0)
+			return ret;
 	}
 
+	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
+					   arc_pgu_supported_formats,
+					   ARRAY_SIZE(arc_pgu_supported_formats),
+					   NULL, connector);
+	if (ret)
+		return ret;
+
 	if (encoder_node) {
 		struct drm_bridge *bridge;
 
@@ -338,11 +324,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
 		if (ret)
 			return ret;
-	} else {
-		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
-		ret = arcpgu_drm_sim_init(drm, NULL);
-		if (ret < 0)
-			return ret;
 	}
 
 	drm_mode_config_reset(drm);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
