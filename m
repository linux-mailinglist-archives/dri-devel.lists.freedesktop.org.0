Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13DA2DD90
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 13:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB59310E316;
	Sun,  9 Feb 2025 12:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="hbUz4SEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9323410E316
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 12:16:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1739103409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdo12l96WYHSP8NB0D3m4EhwENc4d3VYk/G2ELB65u8=;
 b=hbUz4SEi6xB481zRhiuA/zfvfIpMZlAl2mm9PiVvhG+keZmVjewIolj3Mlzkn97TcdqqXR
 2hHa53JDtaCVfNhwxCgMi7O78HpMnIAqz92f7NWTXhIb7EGh5+dkNsmT21P2JgCN9XGRX6
 JHVs4o7J85Pupb3FIqcEqcO9yKiJzKA=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v9 13/13] drm/bridge: cdns-dsi: Use pre_enable/post_disable to
 enable/disable
Date: Sun,  9 Feb 2025 17:46:21 +0530
Message-Id: <20250209121621.34677-6-aradhya.bhatia@linux.dev>
In-Reply-To: <20250209121621.34677-1-aradhya.bhatia@linux.dev>
References: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
 <20250209121621.34677-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The cdns-dsi controller requires that it be turned on completely before
the input DPI's source has begun streaming[0]. Not having that, allows
for a small window before cdns-dsi enable and after cdns-dsi disable
where the previous entity (in this case tidss's videoport) to continue
streaming DPI video signals. This small window where cdns-dsi is
disabled but is still receiving signals causes the input FIFO of
cdns-dsi to get corrupted. This causes the colors to shift on the output
display. The colors can either shift by one color component (R->G, G->B,
B->R), or by two color components (R->B, G->R, B->G).

Since tidss's videoport starts streaming via crtc enable hooks, we need
cdns-dsi to be up and running before that. Now that the bridges are
pre_enabled before crtc is enabled, and post_disabled after crtc is
disabled, use the pre_enable and post_disable hooks to get cdns-dsi
ready and running before the tidss videoport to get pass the color shift
issues.

[0]: See section 12.6.5.7.3 "Start-up Procedure" in J721E SoC TRM
     TRM Link: http://www.ti.com/lit/pdf/spruil1

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 64 ++++++++++---------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 12457f712c94..4fb4e5bd17f0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -669,13 +669,28 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
 	u32 val;
 
+	/*
+	 * The cdns-dsi controller needs to be disabled after it's DPI source
+	 * has stopped streaming. If this is not followed, there is a brief
+	 * window before DPI source is disabled and after cdns-dsi controller
+	 * has been disabled where the DPI stream is still on, but the cdns-dsi
+	 * controller is not ready anymore to accept the incoming signals. This
+	 * is one of the reasons why a shift in pixel colors is observed on
+	 * displays that have cdns-dsi as one of the bridges.
+	 *
+	 * To mitigate this, disable this bridge from the bridge post_disable()
+	 * hook, instead of the bridge _disable() hook. The bridge post_disable()
+	 * hook gets called after the CRTC disable, where often many DPI sources
+	 * disable their streams.
+	 */
+
 	val = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
 	val &= ~(IF_VID_SELECT_MASK | IF_VID_MODE | VID_EN | HOST_EOT_GEN |
 		 DISP_EOT_GEN);
@@ -687,15 +702,6 @@ static void cdns_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (dsi->platform_ops && dsi->platform_ops->disable)
 		dsi->platform_ops->disable(dsi);
 
-	pm_runtime_put(dsi->base.dev);
-}
-
-static void cdns_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
-						struct drm_bridge_state *old_bridge_state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
 	dsi->phy_initialized = false;
 	dsi->link_initialized = false;
 	phy_power_off(dsi->dphy);
@@ -773,8 +779,8 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 	dsi->link_initialized = true;
 }
 
-static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
+static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
 	struct cdns_dsi *dsi = input_to_dsi(input);
@@ -789,6 +795,21 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	u32 tmp, reg_wakeup, div, status;
 	int nlanes;
 
+	/*
+	 * The cdns-dsi controller needs to be enabled before it's DPI source
+	 * has begun streaming. If this is not followed, there is a brief window
+	 * after DPI source enable and before cdns-dsi controller enable where
+	 * the DPI stream is on, but the cdns-dsi controller is not ready to
+	 * accept the incoming signals. This is one of the reasons why a shift
+	 * in pixel colors is observed on displays that have cdns-dsi as one of
+	 * the bridges.
+	 *
+	 * To mitigate this, enable this bridge from the bridge pre_enable()
+	 * hook, instead of the bridge _enable() hook. The bridge pre_enable()
+	 * hook gets called before the CRTC enable, where often many DPI sources
+	 * enable their streams.
+	 */
+
 	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
 		return;
 
@@ -805,8 +826,8 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 	nlanes = output->dev->lanes;
 
-	cdns_dsi_hs_init(dsi);
 	cdns_dsi_init_link(dsi);
+	cdns_dsi_hs_init(dsi);
 
 	/*
 	 * Now that the DSI Link and DSI Phy are initialized,
@@ -935,19 +956,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	writel(tmp, dsi->regs + MCTL_MAIN_EN);
 }
 
-static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_bridge_state)
-{
-	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
-	struct cdns_dsi *dsi = input_to_dsi(input);
-
-	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
-		return;
-
-	cdns_dsi_init_link(dsi);
-	cdns_dsi_hs_init(dsi);
-}
-
 static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					       struct drm_bridge_state *bridge_state,
 					       struct drm_crtc_state *crtc_state,
@@ -1042,9 +1050,7 @@ cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
-	.atomic_disable = cdns_dsi_bridge_atomic_disable,
 	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
-	.atomic_enable = cdns_dsi_bridge_atomic_enable,
 	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
 	.atomic_check = cdns_dsi_bridge_atomic_check,
 	.atomic_duplicate_state = cdns_dsi_bridge_atomic_duplicate_state,
-- 
2.34.1

