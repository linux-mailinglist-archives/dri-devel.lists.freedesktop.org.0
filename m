Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29225DC17
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287736EC1D;
	Fri,  4 Sep 2020 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D76EC33
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:16 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so6333868wmm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HkbO6RAlG2KMefF78tNGo81vvHiUlFF8htcX5tdovHk=;
 b=b16qzKpn5vrZpj8rcVYrKtzRVO6xXfvXxkYnWBnrwXXxtfUMnyyYdCs0arqB4czEQN
 6PbbsNop3t2iuVHzOp6sIbXWNBs7bVJ+Pyn/HMWyKZD5IJ8cevzcp3RVXN+RRes+AIwX
 AydH8a0g1lQowGHSmzsOgqsMdJhGM/m+xB8gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HkbO6RAlG2KMefF78tNGo81vvHiUlFF8htcX5tdovHk=;
 b=Hq3zZ+5V67guvEVoM46jJuQgwFVe9hJesI9JOY8gy8K/jjVARYyL7zSB1p0rBvVtqN
 1uEc5Uxb2cBwfHAYD+J20ncIJiGYOIickyFWB/+hG05Jls7ZrjRgVQmX6FXmkjb/+mxW
 PjOBqYforlw+mrjqcKGc2+nmT40Kg7T0Ht+hWCfr+mO3/Le6+kWIQffzdMfTTOcOgHlZ
 Ew8MDuyefnpx5QOwPhqSNolTyoE10G7eYpHfTC1V0BXQ6ai4XjgVNglQjjGvCaCWnJi9
 1Mp3GilIc4OARXazjb1gHAWqH+HEQmSADzr3M/QTlLoon69RlAOv8i21z+DA9M1JlUAu
 Dcvw==
X-Gm-Message-State: AOAM530Pai7LURDyPgz9AuNSWmB9Ci07aOAoe7HJA1aGqQxi8BrZRnfO
 KY2NCu8b7bYoxmkBuTIjvvObKZuNfYOQgPjV
X-Google-Smtp-Source: ABdhPJxhOTkslMSJ+z6a4k2254iNc0nd7oUDwvT/cOpoZJq4LuzRQnI0WJrrDoqPXW8J2DY4la6PIQ==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr7865840wmj.158.1599230415124; 
 Fri, 04 Sep 2020 07:40:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/24] drm/arc: Initialize sim connector before display pipe
Date: Fri,  4 Sep 2020 16:39:40 +0200
Message-Id: <20200904143941.110665-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That way we can get rid of this final piece of init code, and use the
simple pipe helpers as intended.

v2: Fix indent (Sam)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 53 ++++++++++----------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 0a0b54993773..8edfe6601151 100644
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
-			DRM_MODE_CONNECTOR_VIRTUAL);
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
+	return drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL);
 }
 
 #define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
@@ -267,6 +246,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
 	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
+	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
 	struct resource *res;
 	int ret;
@@ -301,13 +281,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
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
@@ -316,8 +289,21 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
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
 
@@ -329,11 +315,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
