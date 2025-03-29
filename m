Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA4A755F8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 12:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65110E23A;
	Sat, 29 Mar 2025 11:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kyYqHjrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BDB10E23A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 11:40:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743248425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxgtUtrtqq/8AD0qz+LAbN2burWE3n45NhMYcO+xhOw=;
 b=kyYqHjrt03pO2hGVnodsxc253clonURpEVvle7hDYZxWzrVFD7OfRy1cANfnFRMMPL6CR8
 pIH8s45w4Rx/84NS7i7IaLZB1AzqQMDs8rTvX+Q9QOGRIUb0NSfoWYN8O/e0u1tS09O1lS
 6R8X66pSYsBgJRzxf/mQrysTZVIv2kk=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Dominik Haller <d.haller@phytec.de>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v11 09/14] drm/bridge: cdns-dsi: Move DSI mode check to
 _atomic_check()
Date: Sat, 29 Mar 2025 17:09:20 +0530
Message-Id: <20250329113925.68204-10-aradhya.bhatia@linux.dev>
In-Reply-To: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
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

At present, the DSI mode configuration check happens during the
_atomic_enable() phase, which is not really the best place for this.
Moreover, if the mode is not valid, the driver gives a warning and
continues the hardware configuration.

Move the DSI mode configuration check to _atomic_check() instead, which
can properly report back any invalid mode, before the _enable phase even
begins.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 93 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index c333b5c025d9..b022dd6e6b6e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -425,6 +425,17 @@
 #define DSI_NULL_FRAME_OVERHEAD		6
 #define DSI_EOT_PKT_SIZE		4
 
+struct cdns_dsi_bridge_state {
+	struct drm_bridge_state base;
+	struct cdns_dsi_cfg dsi_cfg;
+};
+
+static inline struct cdns_dsi_bridge_state *
+to_cdns_dsi_bridge_state(struct drm_bridge_state *bridge_state)
+{
+	return container_of(bridge_state, struct cdns_dsi_bridge_state, base);
+}
+
 static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
 {
 	return container_of(input, struct cdns_dsi, input);
@@ -771,6 +782,8 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	struct cdns_dsi_bridge_state *dsi_state;
+	struct drm_bridge_state *new_bridge_state;
 	struct drm_display_mode *mode;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
 	struct drm_connector *connector;
@@ -782,6 +795,13 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
 		return;
 
+	new_bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!new_bridge_state))
+		return;
+
+	dsi_state = to_cdns_dsi_bridge_state(new_bridge_state);
+	dsi_cfg = dsi_state->dsi_cfg;
+
 	if (dsi->platform_ops && dsi->platform_ops->enable)
 		dsi->platform_ops->enable(dsi);
 
@@ -791,8 +811,6 @@ static void cdns_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mode = &crtc_state->adjusted_mode;
 	nlanes = output->dev->lanes;
 
-	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
-
 	cdns_dsi_hs_init(dsi);
 	cdns_dsi_init_link(dsi);
 
@@ -963,6 +981,70 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int cdns_dsi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct cdns_dsi_input *input = bridge_to_cdns_dsi_input(bridge);
+	struct cdns_dsi *dsi = input_to_dsi(input);
+	struct cdns_dsi_bridge_state *dsi_state = to_cdns_dsi_bridge_state(bridge_state);
+	const struct drm_display_mode *mode = &crtc_state->mode;
+	struct cdns_dsi_cfg *dsi_cfg = &dsi_state->dsi_cfg;
+
+	return cdns_dsi_check_conf(dsi, mode, dsi_cfg, false);
+}
+
+static struct drm_bridge_state *
+cdns_dsi_bridge_atomic_duplicate_state(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_bridge_state *dsi_state, *old_dsi_state;
+	struct drm_bridge_state *bridge_state;
+
+	if (WARN_ON(!bridge->base.state))
+		return NULL;
+
+	bridge_state = drm_priv_to_bridge_state(bridge->base.state);
+	old_dsi_state = to_cdns_dsi_bridge_state(bridge_state);
+
+	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
+	if (!dsi_state)
+		return NULL;
+
+	__drm_atomic_helper_bridge_duplicate_state(bridge, &dsi_state->base);
+
+	memcpy(&dsi_state->dsi_cfg, &old_dsi_state->dsi_cfg,
+	       sizeof(dsi_state->dsi_cfg));
+
+	return &dsi_state->base;
+}
+
+static void
+cdns_dsi_bridge_atomic_destroy_state(struct drm_bridge *bridge,
+				     struct drm_bridge_state *state)
+{
+	struct cdns_dsi_bridge_state *dsi_state;
+
+	dsi_state = to_cdns_dsi_bridge_state(state);
+
+	kfree(dsi_state);
+}
+
+static struct drm_bridge_state *
+cdns_dsi_bridge_atomic_reset(struct drm_bridge *bridge)
+{
+	struct cdns_dsi_bridge_state *dsi_state;
+
+	dsi_state = kzalloc(sizeof(*dsi_state), GFP_KERNEL);
+	if (!dsi_state)
+		return NULL;
+
+	memset(dsi_state, 0, sizeof(*dsi_state));
+	dsi_state->base.bridge = bridge;
+
+	return &dsi_state->base;
+}
+
 static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.attach = cdns_dsi_bridge_attach,
 	.mode_valid = cdns_dsi_bridge_mode_valid,
@@ -970,9 +1052,10 @@ static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 	.atomic_pre_enable = cdns_dsi_bridge_atomic_pre_enable,
 	.atomic_enable = cdns_dsi_bridge_atomic_enable,
 	.atomic_post_disable = cdns_dsi_bridge_atomic_post_disable,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check = cdns_dsi_bridge_atomic_check,
+	.atomic_reset = cdns_dsi_bridge_atomic_reset,
+	.atomic_duplicate_state = cdns_dsi_bridge_atomic_duplicate_state,
+	.atomic_destroy_state = cdns_dsi_bridge_atomic_destroy_state,
 	.atomic_get_input_bus_fmts = cdns_dsi_bridge_get_input_bus_fmts,
 };
 
-- 
2.34.1

