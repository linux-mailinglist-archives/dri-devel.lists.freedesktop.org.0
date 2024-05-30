Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 967268D48BA
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2811B504;
	Thu, 30 May 2024 09:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="WOGRVM/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DE11B412
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:36:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U9aZ7I128557;
 Thu, 30 May 2024 04:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717061795;
 bh=o7FPsMUosCJlq8x5azKA7fpUh+z4uIS9lv2AcdMHgGY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=WOGRVM/8krM24LO/DjAU/KQ4QdT7nnQleRGuydKgs7Jr4wk7x3rAHfvARLEuNL82e
 Djm2kgBKpb/VKHA2G3n4w9A7wBLhtVGWm2xOFYav2UmnVUNROYwFCo+NKBz7pWOrGG
 5k3OYG2wn0f4OtxL3O6jVSlDOS5y/AHHkoBi67+0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U9aZ5F055322
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 04:36:35 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:36:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:36:35 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U9aYpP000634;
 Thu, 30 May 2024 04:36:34 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v2 7/9] drm/bridge: cdns-dsi: Support atomic bridge APIs
Date: Thu, 30 May 2024 15:06:19 +0530
Message-ID: <20240530093621.1925863-8-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530093621.1925863-1-a-bhatia1@ti.com>
References: <20240530093621.1925863-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Change the existing (and deprecated) bridge hooks, to the bridge
atomic APIs.

Add drm helpers for duplicate_state, destroy_state, and bridge_reset
bridge hooks.

Further add support for the input format negotiation hook.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 70 ++++++++++++++++---
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 87fdd07ca0bc..6a2223ecff7d 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -655,7 +656,8 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
+static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -675,7 +677,8 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put(dsi->base.dev);
 }
 
-static void cdns_dsi_bridge_post_disable(struct drm_bridge *bridge)
+static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -752,7 +755,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 	dsi->link_initialized = true;
 }
 
-static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
+static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -903,7 +907,8 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
 }
 
-static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
+static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -915,13 +920,62 @@ static void cdns_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 	cdns_dsi_hs_init(dsi);
 }
 
+static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
+					       struct drm_bridge_state *bridge_state,
+					       struct drm_crtc_state *crtc_state,
+					       struct drm_connector_state *conn_state,
+					       u32 output_fmt,
+					       unsigned int *num_input_fmts)
+{
+	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
+	struct cdns_dsi *dsi = input_to_dsi(input);
+	struct cdns_dsi_output *output = &dsi->output;
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	switch (output->dev->format) {
+	case MIPI_DSI_FMT_RGB888:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+
+	case MIPI_DSI_FMT_RGB666:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
+		break;
+
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+
+	case MIPI_DSI_FMT_RGB565:
+		input_fmts[0] = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+
+	default:
+		/* Unsupported DSI Format */
+		return NULL;
+	}
+
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
-	.disable = cdns_dsi_bridge_disable,
-	.pre_enable = cdns_dsi_bridge_pre_enable,
-	.enable = cdns_dsi_bridge_enable,
-	.post_disable = cdns_dsi_bridge_post_disable,
+	.atomic_disable = cdns_dsi_bridge_atomic_disable,
+	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
+	.atomic_enable = cdns_dsi_bridge_atomic_enable,
+	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = cdns_dsi_bridge_get_input_bus_fmts,
 };
 
 static int cdns_dsi_attach(struct mipi_dsi_host *host,
-- 
2.34.1

