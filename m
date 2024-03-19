Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D2288076E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC5110F859;
	Tue, 19 Mar 2024 22:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kwBXvRg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D941F10F6CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:51:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710888709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbbS0pBK3xdjrDUeEKHRjTqg7WQ0JcXZhe6RO8jCpjQ=;
 b=kwBXvRg9NKjKqGA50mh+d3boJd+N+HIZP68cCjfxTvzmaNUJMceErO5bKdkk29dLnY/IMt
 DYrpwTWnw40UhmUn2dSaJbAHKyLA4cmbNRvopQivX6t9EJbR+lzSfesphph/zsUt116ahq
 PswVZM/XsSsFpeVtWAY/cSu70Q5fnPo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 6/8] drm: zynqmp_dp: Add locking
Date: Tue, 19 Mar 2024 18:51:19 -0400
Message-Id: <20240319225122.3048400-7-sean.anderson@linux.dev>
In-Reply-To: <20240319225122.3048400-1-sean.anderson@linux.dev>
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
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

Add some locking to prevent the IRQ/workers/bridge API calls from stepping
on each other's toes. This lock protects:

- Non-atomic registers configuring the link. That is, everything but the
  IRQ registers (since these are accessed in an atomic fashion), and the DP
  AUX registers (since these don't affect the link). We also access AUX
  while holding this lock, so it would be very tricky to support.
- Link configuration. This is effectively everything in zynqmp_dp which
  isn't read-only after probe time. So from next_bridge onward.

This lock is designed to protect configuration changes so we don't have to
do anything tricky. Configuration should never be in the hot path, so I'm
not worried about performance.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- Split off the HPD IRQ work into another commit
- Expand the commit message

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index f3fcdbf662fa..a90ab5c0f5cf 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -279,6 +279,7 @@ struct zynqmp_dp_config {
  * @dpsub: Display subsystem
  * @iomem: device I/O memory for register access
  * @reset: reset controller
+ * @lock: Mutex protecting this struct and register access (but not AUX)
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
  * @next_bridge: The downstream bridge
@@ -294,12 +295,17 @@ struct zynqmp_dp_config {
  * @link_config: common link configuration between IP core and sink device
  * @mode: current mode between IP core and sink device
  * @train_set: set of training data
+ *
+ * @lock covers the link configuration in this struct and the device's
+ * registers. It does not cover @aux. It is not strictly required for any of
+ * the members which are only modified at probe/remove time (e.g. @dev).
  */
 struct zynqmp_dp {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
 	struct delayed_work hpd_work;
 	struct delayed_work hpd_irq_work;
+	struct mutex lock;
 
 	struct drm_bridge *next_bridge;
 	struct device *dev;
@@ -1373,8 +1379,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
 	}
 
 	/* Check with link rate and lane count */
+	mutex_lock(&dp->lock);
 	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
 				  dp->link_config.max_lanes, dp->config.bpp);
+	mutex_unlock(&dp->lock);
 	if (mode->clock > rate) {
 		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
 			mode->name);
@@ -1401,6 +1409,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dp->dev);
 
+	mutex_lock(&dp->lock);
 	zynqmp_dp_disp_enable(dp, old_bridge_state);
 
 	/*
@@ -1461,6 +1470,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
 			ZYNQMP_DP_SOFTWARE_RESET_ALL);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
+	mutex_unlock(&dp->lock);
 }
 
 static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -1468,6 +1478,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
+	mutex_lock(&dp->lock);
 	dp->enabled = false;
 	cancel_delayed_work(&dp->hpd_work);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
@@ -1478,6 +1489,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
 
 	zynqmp_dp_disp_disable(dp, old_bridge_state);
+	mutex_unlock(&dp->lock);
 
 	pm_runtime_put_sync(dp->dev);
 }
@@ -1520,6 +1532,8 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
 	u32 state, i;
 	int ret;
 
+	mutex_lock(&dp->lock);
+
 	/*
 	 * This is from heuristic. It takes some delay (ex, 100 ~ 500 msec) to
 	 * get the HPD signal with some monitors.
@@ -1547,11 +1561,13 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
 					       dp->num_lanes);
 
 		dp->status = connector_status_connected;
+		mutex_unlock(&dp->lock);
 		return connector_status_connected;
 	}
 
 disconnected:
 	dp->status = connector_status_disconnected;
+	mutex_unlock(&dp->lock);
 	return connector_status_disconnected;
 }
 
@@ -1620,6 +1636,7 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 	u8 status[DP_LINK_STATUS_SIZE + 2];
 	int err;
 
+	mutex_lock(&dp->lock);
 	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
 			       DP_LINK_STATUS_SIZE + 2);
 	if (err < 0) {
@@ -1632,6 +1649,7 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 			zynqmp_dp_train_loop(dp);
 		}
 	}
+	mutex_unlock(&dp->lock);
 }
 
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
@@ -1683,6 +1701,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
+	mutex_init(&dp->lock);
 
 	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 	INIT_DELAYED_WORK(&dp->hpd_irq_work, zynqmp_dp_hpd_irq_work_func);
@@ -1793,4 +1812,5 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 
 	zynqmp_dp_phy_exit(dp);
 	zynqmp_dp_reset(dp, true);
+	mutex_destroy(&dp->lock);
 }
-- 
2.35.1.1320.gc452695387.dirty

