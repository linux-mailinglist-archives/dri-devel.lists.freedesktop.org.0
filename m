Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8494D760
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0FD10E9F2;
	Fri,  9 Aug 2024 19:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rk48672L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EE710E9F2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:36:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1723232189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/1fpZ1MDjJV5NAFHCktQ3DE7M2fl+H7jRHKmk5SH1w=;
 b=rk48672LdAlHsdDNaArDOsbGYWOC8O3aFLyhLbPYmL/e+q2+Th/BBBDIkYiaRblttnCuQR
 DZpp4jW87UT0RPSf5tMCmzE7XCa9dH5/cga8z4WpmsMi+6fcXngZA3+5YCNjXLgVwYkdad
 ytz4PFcM5wnlgKP6AknHBNxkh2NrDeo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v6 5/8] drm: zynqmp_dp: Use AUX IRQs instead of polling
Date: Fri,  9 Aug 2024 15:35:57 -0400
Message-Id: <20240809193600.3360015-6-sean.anderson@linux.dev>
In-Reply-To: <20240809193600.3360015-1-sean.anderson@linux.dev>
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
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

Instead of polling the status register for the AUX status, just enable
the IRQs and signal a completion.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 35 +++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 532e103713b3..babfa3581014 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -286,6 +286,7 @@ struct zynqmp_dp_config {
  * @next_bridge: The downstream bridge
  * @config: IP core configuration from DTS
  * @aux: aux channel
+ * @aux_done: Completed when we get an AUX reply or timeout
  * @phy: PHY handles for DP lanes
  * @num_lanes: number of enabled phy lanes
  * @hpd_work: hot plug detection worker
@@ -306,6 +307,7 @@ struct zynqmp_dp {
 	struct drm_bridge bridge;
 	struct work_struct hpd_work;
 	struct work_struct hpd_irq_work;
+	struct completion aux_done;
 	struct mutex lock;
 
 	struct drm_bridge *next_bridge;
@@ -942,12 +944,15 @@ static int zynqmp_dp_aux_cmd_submit(struct zynqmp_dp *dp, u32 cmd, u16 addr,
 				    u8 *buf, u8 bytes, u8 *reply)
 {
 	bool is_read = (cmd & AUX_READ_BIT) ? true : false;
+	unsigned long time_left;
 	u32 reg, i;
 
 	reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
 	if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
 		return -EBUSY;
 
+	reinit_completion(&dp->aux_done);
+
 	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_ADDRESS, addr);
 	if (!is_read)
 		for (i = 0; i < bytes; i++)
@@ -962,17 +967,14 @@ static int zynqmp_dp_aux_cmd_submit(struct zynqmp_dp *dp, u32 cmd, u16 addr,
 	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_COMMAND, reg);
 
 	/* Wait for reply to be delivered upto 2ms */
-	for (i = 0; ; i++) {
-		reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
-		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
-			break;
+	time_left = wait_for_completion_timeout(&dp->aux_done,
+						msecs_to_jiffies(2));
+	if (!time_left)
+		return -ETIMEDOUT;
 
-		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT ||
-		    i == 2)
-			return -ETIMEDOUT;
-
-		usleep_range(1000, 1100);
-	}
+	reg = zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
+	if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT)
+		return -ETIMEDOUT;
 
 	reg = zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPLY_CODE);
 	if (reply)
@@ -1056,6 +1058,9 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 			(w << ZYNQMP_DP_AUX_CLK_DIVIDER_AUX_FILTER_SHIFT) |
 			(rate / (1000 * 1000)));
 
+	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_REPLY_RECEIVED |
+					      ZYNQMP_DP_INT_REPLY_TIMEOUT);
+
 	dp->aux.name = "ZynqMP DP AUX";
 	dp->aux.dev = dp->dev;
 	dp->aux.drm_dev = dp->bridge.dev;
@@ -1073,6 +1078,9 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 static void zynqmp_dp_aux_cleanup(struct zynqmp_dp *dp)
 {
 	drm_dp_aux_unregister(&dp->aux);
+
+	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_REPLY_RECEIVED |
+					      ZYNQMP_DP_INT_REPLY_TIMEOUT);
 }
 
 /* -----------------------------------------------------------------------------
@@ -1730,6 +1738,12 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	if (status & ZYNQMP_DP_INT_HPD_IRQ)
 		schedule_work(&dp->hpd_irq_work);
 
+	if (status & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
+		complete(&dp->aux_done);
+
+	if (status & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT)
+		complete(&dp->aux_done);
+
 	return IRQ_HANDLED;
 }
 
@@ -1753,6 +1767,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
 	mutex_init(&dp->lock);
+	init_completion(&dp->aux_done);
 
 	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 	INIT_WORK(&dp->hpd_irq_work, zynqmp_dp_hpd_irq_work_func);
-- 
2.35.1.1320.gc452695387.dirty

