Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F16BBAC369
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 11:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6474A10E53A;
	Tue, 30 Sep 2025 09:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="A1qWc0i+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m21472.qiye.163.com (mail-m21472.qiye.163.com
 [117.135.214.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A6710E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 09:14:57 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 249404049;
 Tue, 30 Sep 2025 17:14:51 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 11/18] drm/display: bridge_connector: Ensure last bridge
 determines EDID/modes detection capabilities
Date: Tue, 30 Sep 2025 17:09:13 +0800
Message-Id: <20250930090920.131094-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9999e738b603a3kunmd96de74a43bdd1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRoYHVZLQktPGRhMS0sdQk1WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=A1qWc0i+xYTSki78pkGC4SDC/XRq+V6lvD4cpxcrT81OI8AogAcNVhY/y/eETl6by2m7B3p2M4D5gDioPBlNcqq3+diUWfM9uVQ82OXmIaWE7s1SR9uFk7rkoAzhr0Riw8YIEKhi3SpFRnLN6BRVG+sUTv+GqCb/60sQ/BakkZA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=cgZ8iYegH0RyoNGR+NMR1IvyawzYxfOsjdOYF5cuO9c=;
 h=date:mime-version:subject:message-id:from;
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

When multiple bridges are present, EDID detection capability
(DRM_BRIDGE_OP_EDID) takes precedence over modes detection
(DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
determined by the last bridge in the chain, we handle three cases:

Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
 - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
   &drm_bridge_connector.bridge_edid to NULL and set
   &drm_bridge_connector.bridge_modes to the later bridge.
 - Ensure modes detection capability of the later bridge will not
   be ignored.

Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
 - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
   &drm_bridge_connector.bridge_modes to NULL and set
   &drm_bridge_connector.bridge_edid to the later bridge.
 - Although EDID detection capability has higher priority, this
   operation is for balance and makes sense.

Case 3: the later bridge declares both of them
 - Assign later bridge as &drm_bridge_connector.bridge_edid and
   and &drm_bridge_connector.bridge_modes to this bridge.
 - Just leave transfer of these two capabilities as before.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/display/drm_bridge_connector.c    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index baacd21e7341..0ca6f140e85b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -640,6 +640,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	struct drm_bridge *pre_bridge_edid, *pre_bridge_modes;
 	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
 	unsigned int max_bpc = 8;
 	bool support_hdcp = false;
@@ -668,6 +669,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	 */
 	connector_type = DRM_MODE_CONNECTOR_Unknown;
 	drm_for_each_bridge_in_chain(encoder, bridge) {
+		pre_bridge_edid = bridge_connector->bridge_edid;
+		pre_bridge_modes = bridge_connector->bridge_modes;
+
 		if (!bridge->interlace_allowed)
 			connector->interlace_allowed = false;
 		if (!bridge->ycbcr_420_allowed)
@@ -681,6 +685,44 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_detect = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
+
+		/*
+		 * When multiple bridges are present, EDID detection capability
+		 * (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
+		 * (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities
+		 * are determined by the last bridge in the chain, we handle
+		 * three cases:
+		 *
+		 * Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
+		 *  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
+		 *    &drm_bridge_connector.bridge_edid to NULL and set
+		 *    &drm_bridge_connector.bridge_modes to the later bridge.
+		 *  - Ensure modes detection capability of the later bridge
+		 *    will not be ignored.
+		 *
+		 * Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
+		 *  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
+		 *    &drm_bridge_connector.bridge_modes to NULL and set
+		 *    &drm_bridge_connector.bridge_edid to the later bridge.
+		 *  - Although EDID detection capability has higher priority,
+		 *    this operation is for balance and makes sense.
+		 *
+		 * Case 3: the later bridge declares both of them
+		 *  - Assign later bridge as &drm_bridge_connector.bridge_edid
+		 *    and &drm_bridge_connector.bridge_modes to this bridge.
+		 *  - Just leave transfer of these two capabilities as before.
+		 */
+		if (bridge->ops & DRM_BRIDGE_OP_EDID &&
+		    !(bridge->ops & DRM_BRIDGE_OP_MODES)) {
+			if (pre_bridge_modes)
+				bridge_connector->bridge_modes = NULL;
+		}
+		if (bridge->ops & DRM_BRIDGE_OP_MODES &&
+		    !(bridge->ops & DRM_BRIDGE_OP_EDID)) {
+			if (pre_bridge_edid)
+				bridge_connector->bridge_edid = NULL;
+		}
+
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
-- 
2.34.1

