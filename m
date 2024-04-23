Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6268AF53B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 19:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC711350F;
	Tue, 23 Apr 2024 17:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Q12g97x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5A711350D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 17:19:27 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713892766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRHDl/2NRMsvzZcnj8mBRhamDpfWjNRCDAYgtTP5Mzo=;
 b=Q12g97x98tthHcw/RhZur4pXjT5bsr5iiJb1zViF7Xch5EvaBTFN9jj46ufwg8V6b8GTKo
 XEUyw38tUMkwFuqTFPH1ArbnhLHwLeFcSKwEC9sp4VhLEHtXHgtVfLSMJssSn5J4gfWOD4
 //ZQPsBw7RzOkPcFS0tcoyOBzorHyuo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v4 08/13] drm: zynqmp_dp: Don't retrain the link in our IRQ
Date: Tue, 23 Apr 2024 13:18:54 -0400
Message-Id: <20240423171859.3953024-9-sean.anderson@linux.dev>
In-Reply-To: <20240423171859.3953024-1-sean.anderson@linux.dev>
References: <20240423171859.3953024-1-sean.anderson@linux.dev>
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

Retraining the link can take a while, and might involve waiting for
DPCD reads/writes to complete. In preparation for unthreading the IRQ
handler, move this into its own work function.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v2)

Changes in v2:
- Document hpd_irq_work
- Split this off from the locking changes

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 45 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index d0168004dc22..26034672964a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -288,6 +288,7 @@ struct zynqmp_dp_config {
  * @phy: PHY handles for DP lanes
  * @num_lanes: number of enabled phy lanes
  * @hpd_work: hot plug detection worker
+ * @hpd_irq_work: hot plug detection IRQ worker
  * @status: connection status
  * @enabled: flag to indicate if the device is enabled
  * @dpcd: DP configuration data from currently connected sink device
@@ -303,6 +304,7 @@ struct zynqmp_dp {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
 	struct work_struct hpd_work;
+	struct work_struct hpd_irq_work;
 	struct mutex lock;
 
 	struct drm_bridge *next_bridge;
@@ -1626,6 +1628,29 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 	drm_bridge_hpd_notify(&dp->bridge, status);
 }
 
+static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
+{
+	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
+					    hpd_irq_work);
+	u8 status[DP_LINK_STATUS_SIZE + 2];
+	int err;
+
+	mutex_lock(&dp->lock);
+	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
+			       DP_LINK_STATUS_SIZE + 2);
+	if (err < 0) {
+		dev_dbg_ratelimited(dp->dev,
+				    "could not read sink status: %d\n", err);
+	} else {
+		if (status[4] & DP_LINK_STATUS_UPDATED ||
+		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
+		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
+			zynqmp_dp_train_loop(dp);
+		}
+	}
+	mutex_unlock(&dp->lock);
+}
+
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 {
 	struct zynqmp_dp *dp = (struct zynqmp_dp *)data;
@@ -1657,23 +1682,9 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
 		schedule_work(&dp->hpd_work);
 
-	if (status & ZYNQMP_DP_INT_HPD_IRQ) {
-		int ret;
-		u8 status[DP_LINK_STATUS_SIZE + 2];
+	if (status & ZYNQMP_DP_INT_HPD_IRQ)
+		schedule_work(&dp->hpd_irq_work);
 
-		ret = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
-				       DP_LINK_STATUS_SIZE + 2);
-		if (ret < 0)
-			goto handled;
-
-		if (status[4] & DP_LINK_STATUS_UPDATED ||
-		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
-		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
-			zynqmp_dp_train_loop(dp);
-		}
-	}
-
-handled:
 	return IRQ_HANDLED;
 }
 
@@ -1699,6 +1710,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	mutex_init(&dp->lock);
 
 	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
+	INIT_WORK(&dp->hpd_irq_work, zynqmp_dp_hpd_irq_work_func);
 
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
@@ -1803,6 +1815,7 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
 	disable_irq(dp->irq);
 
+	cancel_work_sync(&dp->hpd_irq_work);
 	cancel_work_sync(&dp->hpd_work);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
-- 
2.35.1.1320.gc452695387.dirty

