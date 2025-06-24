Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FAAE5BA2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 06:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B5F10E0A5;
	Tue, 24 Jun 2025 04:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Vktm4Kuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848110E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 04:48:57 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O4mbP01756212;
 Mon, 23 Jun 2025 23:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1750740517;
 bh=Oj2e0pXWIhj5xoztBSm2OUcXpx47+MZE5jj3YvU3crQ=;
 h=From:To:CC:Subject:Date;
 b=Vktm4Kuu6LDb4WzcBWQqFR5wAWs3LMA8pC13N8pTvj6iwxJ/MIzJuVGWxLeK3lvGq
 BOsW5ZY9Jy30L8kjzV4J4Zi5nx6Bb/Y+MOz/pDdSDzwRjNxa2F1/lKVcWP5lCd0aGs
 TnEe16aA9rwrikXm7cphIsyUEgk6zP11biHo0c3M=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O4mbk01401712
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 23 Jun 2025 23:48:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 23:48:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 23:48:36 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.214])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O4mZ991147923;
 Mon, 23 Jun 2025 23:48:36 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <devarsht@ti.com>, <tomi.valkeinen@ideasonboard.com>,
 <kieran.bingham+renesas@ideasonboard.com>, <ernest.vanhoecke@toradex.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <geert@linux-m68k.org>, <j-choudhary@ti.com>
Subject: [PATCH v6] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Date: Tue, 24 Jun 2025 10:18:35 +0530
Message-ID: <20250624044835.165708-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

By default, HPD was disabled on SN65DSI86 bridge. When the driver was
added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
call which was moved to other function calls subsequently.
Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
state always return 1 (always connected state).

Set HPD_DISABLE bit conditionally based on display sink's connector type.
Since the HPD_STATE is reflected correctly only after waiting for debounce
time (~100-400ms) and adding this delay in detect() is not feasible
owing to the performace impact (glitches and frame drop), remove runtime
calls in detect() and add hpd_enable()/disable() bridge hooks with runtime
calls, to detect hpd properly without any delay.

[0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)

Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v5->v6:
- Drop pm_runtime_mark_last_busy()
- Pick up tags

v5 patch link:
<https://lore.kernel.org/all/20250616093240.499094-1-j-choudhary@ti.com/>

Changelog v4->v5:
- Make suspend asynchronous in hpd_disable()
- Update HPD_DISABLE in probe function to address the case for when
  comms are already enabled. Comments taken verbatim from [2]
- Update comments

v4 patch link:
<https://lore.kernel.org/all/20250611052947.5776-1-j-choudhary@ti.com/>

Changelog v3->v4:
- Remove "no-hpd" support due to backward compatibility issues
- Change the conditional from "no-hpd" back to connector type
  but still address [1]

v3 patch link:
<https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Change conditional based on no-hpd property to address [1]
- Remove runtime calls in detect() with appropriate comments
- Add hpd_enable() and hpd_disable() in drm_bridge_funcs

v2 patch link:
<https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Drop additional property in bindings and use conditional.
- Instead of register read for HPD state, use dpcd read which returns 0
  for success and error codes for no connection
- Add relevant history for the required change in commit message
- Drop RFC subject-prefix in v2
- Add "Cc:" tag

v1 patch link:
<https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com/>

[1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq/>
[2]: <https://lore.kernel.org/all/CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com/>

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 78a50b947a08..45381c868c30 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -348,12 +348,18 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
 	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
 	 * delay in its prepare and always disable HPD.
 	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
+	 * For DisplayPort bridge type, we need HPD. So we use the bridge type
+	 * to conditionally disable HPD.
+	 * NOTE: The bridge type is set in ti_sn_bridge_probe() but enable_comms()
+	 * can be called before. So for DisplayPort, HPD will be enabled once
+	 * bridge type is set. We are using bridge type instead of "no-hpd"
+	 * property because it is not used properly in devicetree description
+	 * and hence is unreliable.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+
+	if (pdata->bridge.type != DRM_MODE_CONNECTOR_DisplayPort)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+				   HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -1160,9 +1166,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int val = 0;
 
-	pm_runtime_get_sync(pdata->dev);
+	/*
+	 * Runtime reference is grabbed in ti_sn_bridge_hpd_enable()
+	 * as the chip won't report HPD just after being powered on.
+	 * HPD_DEBOUNCED_STATE reflects correct state only after the
+	 * debounce time (~100-400 ms).
+	 */
+
 	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
 
 	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
 					 : connector_status_disconnected;
@@ -1185,6 +1196,26 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
+static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	/*
+	 * Device needs to be powered on before reading the HPD state
+	 * for reliable hpd detection in ti_sn_bridge_detect() due to
+	 * the high debounce time.
+	 */
+
+	pm_runtime_get_sync(pdata->dev);
+}
+
+static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	pm_runtime_put_autosuspend(pdata->dev);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
@@ -1199,6 +1230,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.debugfs_init = ti_sn65dsi86_debugfs_init,
+	.hpd_enable = ti_sn_bridge_hpd_enable,
+	.hpd_disable = ti_sn_bridge_hpd_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1286,8 +1319,26 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
-	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
+				    DRM_BRIDGE_OP_HPD;
+		/*
+		 * If comms were already enabled they would have been enabled
+		 * with the wrong value of HPD_DISABLE. Update it now. Comms
+		 * could be enabled if anyone is holding a pm_runtime reference
+		 * (like if a GPIO is in use). Note that in most cases nobody
+		 * is doing AUX channel xfers before the bridge is added so
+		 * HPD doesn't _really_ matter then. The only exception is in
+		 * the eDP case where the panel wants to read the EDID before
+		 * the bridge is added. We always consistently have HPD disabled
+		 * for eDP.
+		 */
+		mutex_lock(&pdata->comms_mutex);
+		if (pdata->comms_enabled)
+			regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+					   HPD_DISABLE, 0);
+		mutex_unlock(&pdata->comms_mutex);
+	};
 
 	drm_bridge_add(&pdata->bridge);
 
-- 
2.34.1

