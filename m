Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99632C07E4A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 21:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD0010EB31;
	Fri, 24 Oct 2025 19:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="isgLzgOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC16A10EB31
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:22:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1761333453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0z3O6ev8VvLV+n/JL2vBaug2Aj5dwpRTQ3NzZgJTeg=;
 b=isgLzgOPZw23bh+e7CsK4Y8IdxoSe8JftRfIsPhd0qXRUqChwmNYo0Ch42pl3KDRJqZNUt
 UAe1suW8wK58TGwh6cwGdPWlvEpkLL2k9bZNTq3SpSLwaEkbB20mFZ4YTrpZb05VjYrt30
 m/yXFUwy+WLf+ABKLELglMkYxuaWEH4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/3] drm: zynqmp_dp: Retrain link after HPD if necessary
Date: Fri, 24 Oct 2025 15:17:07 -0400
Message-Id: <20251024191707.2310589-4-sean.anderson@linux.dev>
In-Reply-To: <20251024191707.2310589-1-sean.anderson@linux.dev>
References: <20251024191707.2310589-1-sean.anderson@linux.dev>
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

The section 5.1.4 of the v1.2 DisplayPort standard says

> The Source device shall respond to Hot Plug event/Hot Re-plug event by
> first reading DPCD Link/Sink Device Status registers at DPCD 00200h
> through 00205h.... If the link is unstable or lost, the Source device
> then reads the DPCD Receiver Capabilities registers at DPCD 00000h
> through 0000Fh to determine the appropriate information needed to
> train the link. The Source device shall then initiate link training.

However, zynqmp_dp_hpd_work_func does not check the link status. This
may prevent the sink from detecting the source if, for example, the user
disconnects the cable and then reconnects it. I encountered this problem
when testing a mini DP connector (although I had no problem when using a
full-size connector with the existing driver).

Follow the spec by checking the link status after a HPD event and
retraining if necessary.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 37 ++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index caf2e0ce3644..a90bc0e406f6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1677,6 +1677,24 @@ static int zynqmp_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static bool zynqmp_hpd_needs_retain(struct zynqmp_dp *dp)
+{
+	u8 status[DP_LINK_STATUS_SIZE + 2];
+	int err;
+
+	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
+			       DP_LINK_STATUS_SIZE + 2);
+	if (err < 0) {
+		dev_dbg_ratelimited(dp->dev,
+				    "could not read sink status: %d\n", err);
+		return false;
+	}
+
+	return status[4] & DP_LINK_STATUS_UPDATED ||
+	       !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
+	       !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt);
+}
+
 static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 {
 	struct zynqmp_dp_link_config *link_config = &dp->link_config;
@@ -1698,6 +1716,9 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
 		WRITE_ONCE(dp->status, connector_status_connected);
+		if (!zynqmp_hpd_needs_retain(dp))
+			return connector_status_connected;
+
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -2335,25 +2356,13 @@ static void zynqmp_dp_hpd_irq_work_func(struct work_struct *work)
 {
 	struct zynqmp_dp *dp = container_of(work, struct zynqmp_dp,
 					    hpd_irq_work);
-	u8 status[DP_LINK_STATUS_SIZE + 2];
-	int err;
 
 	guard(mutex)(&dp->lock);
 	if (dp->ignore_hpd)
 		return;
 
-	err = drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
-			       DP_LINK_STATUS_SIZE + 2);
-	if (err < 0) {
-		dev_dbg_ratelimited(dp->dev,
-				    "could not read sink status: %d\n", err);
-	} else {
-		if (status[4] & DP_LINK_STATUS_UPDATED ||
-		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
-		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
-			zynqmp_dp_train_loop(dp);
-		}
-	}
+	if (zynqmp_hpd_needs_retain(dp))
+		zynqmp_dp_train_loop(dp);
 }
 
 static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
-- 
2.35.1.1320.gc452695387.dirty

