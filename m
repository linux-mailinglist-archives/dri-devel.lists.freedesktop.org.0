Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C88BB3FC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D279010F2D6;
	Fri,  3 May 2024 19:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="CjRpE+HV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168C10F2D6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:29:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714764575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lY0dS1dQWmU5ByfM7oUy9R/EqObXbNIdMhGhis7Pbh4=;
 b=CjRpE+HVJPfp20haZ74fqVaOKqvUaSIUdwegTHaZ8aDutuiBV8xfdv2srHqcCzIeMJnCRK
 66l1wbxw1/fCN7uZVpy6PnAc4+ZR2aKEdh/55DhNIesz1+UwTLieENjXA9YdTypPK/m3NW
 azzWMPRVDY8YrwR2pcYlQScuQr7DYK8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 03/10] drm: zynqmp_dp: Don't delay work
Date: Fri,  3 May 2024 15:29:15 -0400
Message-Id: <20240503192922.2172314-4-sean.anderson@linux.dev>
In-Reply-To: <20240503192922.2172314-1-sean.anderson@linux.dev>
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 12a8248ed125..129beac4c073 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -298,7 +298,7 @@ struct zynqmp_dp_config {
 struct zynqmp_dp {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
-	struct delayed_work hpd_work;
+	struct work_struct hpd_work;
 
 	struct drm_bridge *next_bridge;
 	struct device *dev;
@@ -1482,7 +1482,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
 	dp->enabled = false;
-	cancel_delayed_work(&dp->hpd_work);
+	cancel_work(&dp->hpd_work);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
 	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
@@ -1648,8 +1648,7 @@ void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp)
 
 static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 {
-	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
-					    hpd_work.work);
+	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp, hpd_work);
 	enum drm_connector_status status;
 
 	status = zynqmp_dp_bridge_detect(&dp->bridge);
@@ -1685,7 +1684,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
 
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
-		schedule_delayed_work(&dp->hpd_work, 0);
+		schedule_work(&dp->hpd_work);
 
 	if (status & ZYNQMP_DP_INT_HPD_IRQ) {
 		int ret;
@@ -1727,7 +1726,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
 
-	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
+	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 
 	/* Acquire all resources (IOMEM, IRQ and PHYs). */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
@@ -1832,7 +1831,7 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
 	disable_irq(dp->irq);
 
-	cancel_delayed_work_sync(&dp->hpd_work);
+	cancel_work_sync(&dp->hpd_work);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
-- 
2.35.1.1320.gc452695387.dirty

