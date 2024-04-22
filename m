Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED38AD43D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEC0112CE8;
	Mon, 22 Apr 2024 18:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="servLFDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E4F112CDC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:46:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713811571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NI0m4lC2BWpjmQO+TPEk0xEnUCWor0+eWEstT4DfQ4=;
 b=servLFDUgpS8K+61Q7er51bw7Gt6zK/MywpeArZwTkgFtb1joNWycGQl/toNdKfuaa9OWH
 Yecup2QdU4+h6VRqTn29rmn8Y4tspyyI/aSkkeQMJek2YyYfEaHiCflLEbtnxMp9kyQIiY
 bkSSPRsiSkZJroLnnRwFasqDoSrJvF4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v3 06/13] drm: zynqmp_dp: Don't delay work
Date: Mon, 22 Apr 2024 14:45:46 -0400
Message-Id: <20240422184553.3573009-7-sean.anderson@linux.dev>
In-Reply-To: <20240422184553.3573009-1-sean.anderson@linux.dev>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
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

We always call scheduled_delayed_work with no delay, so just use a
non-delayed work_struct instead.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index f1834c8e3c02..59fed00a8f89 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -297,7 +297,7 @@ struct zynqmp_dp_config {
 struct zynqmp_dp {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
-	struct delayed_work hpd_work;
+	struct work_struct hpd_work;
 
 	struct drm_bridge *next_bridge;
 	struct device *dev;
@@ -1467,7 +1467,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
 	dp->enabled = false;
-	cancel_delayed_work(&dp->hpd_work);
+	cancel_work(&dp->hpd_work);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
 	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
@@ -1603,8 +1603,7 @@ void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp)
 
 static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 {
-	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
-					    hpd_work.work);
+	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp, hpd_work);
 	enum drm_connector_status status;
 
 	status = zynqmp_dp_bridge_detect(&dp->bridge);
@@ -1633,7 +1632,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
 
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
-		schedule_delayed_work(&dp->hpd_work, 0);
+		schedule_work(&dp->hpd_work);
 
 	if (status & ZYNQMP_DP_INT_HPD_IRQ) {
 		int ret;
@@ -1675,7 +1674,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
 
-	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
+	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
@@ -1775,7 +1774,7 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
 	disable_irq(dp->irq);
 
-	cancel_delayed_work_sync(&dp->hpd_work);
+	cancel_work_sync(&dp->hpd_work);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
-- 
2.35.1.1320.gc452695387.dirty

