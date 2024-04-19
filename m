Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC78AA93E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D7B10E37D;
	Fri, 19 Apr 2024 07:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="duw6tpHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BE210E004
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v3ZErYEEfMN3IH6Es3mifPdQYY+Pin2akbtvRvXMPy8=;
 b=duw6tpHynVWotScWKt8uLA7kJIy69xNWn9+9N0wo1mN0IDPkfMmwnmBH
 zCL9eag6LVEudHZovr+iA0GcpwC/XKzr8TZ6gvZmsezdbW70zuiBKuN8H
 qKMqpitrBvLjvCkfCEyJNL+Iytq4ZdPAfsEqki3WVoM/9nQKnh8w//pyi
 SoAdiL4VHMsnmSR+o2Dy+lZmRomvqSILHE1nkqlGkFJ0FZj869hmyeni7
 1m+he4XuWYeXJk/szy64rcFO5/bv3qaTJz5GB42qPLSSyru777TihKuTx
 0kRo6owbnqX8HMMr7a2VVXDlUxYFKwl9PJxtYamuKpWHHjRkfGCvx0FwA w==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 19 Apr 2024 15:27:21 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 43J7RG7o012013;
 Fri, 19 Apr 2024 15:27:16 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 15:27:16 +0800
From: kuro <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 Kuro Chung <kuro.chung@ite.corp-partner.google.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/1] UPSTREAM: drm/bridge: it6505: fix hibernate to resume
 no display issue
Date: Fri, 19 Apr 2024 15:38:07 +0800
Message-ID: <20240419073809.706471-2-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419073809.706471-1-kuro.chung@ite.com.tw>
References: <20240419073809.706471-1-kuro.chung@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 20F9C9DA4FED8D82821F0635B4775A5550CACC70A49E410F1AFB323C18425EE12002:8
X-MAIL: mse.ite.com.tw 43J7RG7o012013
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

From: Kuro <kuro.chung@ite.com.tw>

ITE added a FIFO reset bit for input video. When system power resume,
the TTL input of it6505 may get some noise before video signal stable
and the hardware function reset is required.
But the input FIFO reset will also trigger error interrupts of output module rising.
Thus, it6505 have to wait a period can clear those expected error interrupts
caused by manual hardware reset in one interrupt handler calling to avoid interrupt looping.

Signed-off-by: Kuro Chung <kuro.chung@ite.corp-partner.google.com>

---
 drivers/gpu/drm/bridge/ite-it6505.c | 181 +++++++++++++++++++---------
 1 file changed, 124 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b53da9bb65a16..4fd693b4b68ca 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -802,8 +802,8 @@ static void it6505_int_mask_enable(struct it6505 *it6505)
 		     BIT(INT_RECEIVE_HPD_IRQ) | BIT(INT_SCDT_CHANGE) |
 		     BIT(INT_HDCP_FAIL) | BIT(INT_HDCP_DONE));
 
-	it6505_write(it6505, INT_MASK_02, BIT(INT_AUX_CMD_FAIL) |
-		     BIT(INT_HDCP_KSV_CHECK) | BIT(INT_AUDIO_FIFO_ERROR));
+	it6505_write(it6505, INT_MASK_02, BIT(INT_HDCP_KSV_CHECK) |
+			 BIT(INT_AUDIO_FIFO_ERROR));
 
 	it6505_write(it6505, INT_MASK_03, BIT(INT_LINK_TRAIN_FAIL) |
 		     BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
@@ -1317,10 +1317,17 @@ static void it6505_video_reset(struct it6505 *it6505)
 	it6505_link_reset_step_train(it6505);
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_MUTE);
 	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00);
-	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
+
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
+
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_FIFO);
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
+
+	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
+	usleep_range(1000, 2000);
 	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
+
 }
 
 static void it6505_update_video_parameter(struct it6505 *it6505,
@@ -1861,16 +1868,29 @@ static void it6505_reset_hdcp(struct it6505 *it6505)
 	/* Disable CP_Desired */
 	it6505_set_bits(it6505, REG_HDCP_CTRL1, HDCP_CP_ENABLE, 0x00);
 	it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, HDCP_RESET);
+	it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, 0x00);
 }
 
 static void it6505_start_hdcp(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "start");
-	it6505_reset_hdcp(it6505);
-	queue_delayed_work(system_wq, &it6505->hdcp_work,
-			   msecs_to_jiffies(2400));
+	/*
+	 * If video not stable, no need turn on HDCP
+	 * After video stable
+	 * SCDT IRQ ->Link Training-> HDCP
+	 */
+	if (it6505_get_video_status(it6505)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "start");
+		it6505_reset_hdcp(it6505);
+
+		queue_delayed_work(system_wq, &it6505->hdcp_work,
+				   msecs_to_jiffies(2400));
+
+			return;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Video not ready for HDCP");
 }
 
 static void it6505_stop_hdcp(struct it6505 *it6505)
@@ -2249,12 +2269,11 @@ static void it6505_link_training_work(struct work_struct *work)
 	if (ret) {
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		it6505_link_train_ok(it6505);
-		return;
 	} else {
 		it6505->auto_train_retry--;
+		it6505_dump(it6505);
 	}
 
-	it6505_dump(it6505);
 }
 
 static void it6505_plugged_status_to_codec(struct it6505 *it6505)
@@ -2309,14 +2328,24 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "dp_irq_vector = 0x%02x", dp_irq_vector);
 
 	if (dp_irq_vector & DP_CP_IRQ) {
-		it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
-				HDCP_TRIGGER_CPIRQ);
+
+		DRM_DEV_DEBUG_DRIVER(dev, "DP_CP_IRQ :hdcp_status = 0x%02x", it6505->hdcp_status);
+
+		/*
+		 * Some TYPE-C devces trigger CP_IRQ when system resume
+		 * And IT6505 HDCP is in idle state
+		 * No Need trigger 6505 HDCP control.
+		 */
+		if (it6505->hdcp_status == HDCP_AUTH_GOING)
+			it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
+					HDCP_TRIGGER_CPIRQ);
 
 		bstatus = it6505_dpcd_read(it6505, DP_AUX_HDCP_BSTATUS);
 		if (bstatus < 0)
 			return bstatus;
 
 		DRM_DEV_DEBUG_DRIVER(dev, "Bstatus = 0x%02x", bstatus);
+
 	}
 
 	ret = drm_dp_dpcd_read_link_status(&it6505->aux, link_status);
@@ -2328,9 +2357,24 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "link status = 0x%*ph",
 			     (int)ARRAY_SIZE(link_status), link_status);
 
-	if (!drm_dp_channel_eq_ok(link_status, it6505->lane_count)) {
+	/*
+	 * when recive HPD_IRQ signal from DP SINK
+	 * No need to process link status when DP link is not in ready state
+	 */
+	if ((it6505->link_state == LINK_OK) &&
+		(!drm_dp_channel_eq_ok(link_status, it6505->lane_count))) {
+
+		if (it6505->hdcp_desired)
+			it6505_stop_hdcp(it6505);
+
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-		it6505_video_reset(it6505);
+
+		/*
+		 * Link symble lost , need restart trainig
+		 * if no video, wait for video SCDT IRQ
+		 */
+		if (it6505_get_video_status(it6505))
+			schedule_work(&it6505->link_works);
 	}
 
 	return 0;
@@ -2408,21 +2452,6 @@ static void it6505_irq_hpd_irq(struct it6505 *it6505)
 		DRM_DEV_DEBUG_DRIVER(dev, "process hpd_irq fail!");
 }
 
-static void it6505_irq_scdt(struct it6505 *it6505)
-{
-	struct device *dev = &it6505->client->dev;
-	bool data;
-
-	data = it6505_get_video_status(it6505);
-	DRM_DEV_DEBUG_DRIVER(dev, "video stable change interrupt, %s",
-			     data ? "stable" : "unstable");
-	it6505_calc_video_info(it6505);
-	it6505_link_reset_step_train(it6505);
-
-	if (data)
-		schedule_work(&it6505->link_works);
-}
-
 static void it6505_irq_hdcp_done(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
@@ -2442,13 +2471,6 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 	it6505_start_hdcp(it6505);
 }
 
-static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)
-{
-	struct device *dev = &it6505->client->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "AUX PC Request Fail Interrupt");
-}
-
 static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
@@ -2475,31 +2497,69 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
 	schedule_work(&it6505->link_works);
 }
 
-static void it6505_irq_video_fifo_error(struct it6505 *it6505)
+static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
 {
-	struct device *dev = &it6505->client->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
+	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
 }
 
-static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
+static void it6505_irq_scdt(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
+	bool data;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
+	data = it6505_get_video_status(it6505);
+	DRM_DEV_DEBUG_DRIVER(dev, "video stable change interrupt, %s", data ? "stable" : "unstable");
+
+	it6505_calc_video_info(it6505);
+	it6505_link_reset_step_train(it6505);
+
+	if (data)
+		schedule_work(&it6505->link_works);
 }
 
-static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
+
+static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
 {
-	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
+	struct device *dev = &it6505->client->dev;
+	int reg_0d, reg_int03;
+
+	/*
+	 * When video SCDT change with video not stable,
+	 * Or video FIFO error, need video reset
+	 */
+
+	if ((!it6505_get_video_status(it6505) &&
+		(it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_status))) ||
+		(it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int *) int_status)) ||
+		(it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *) int_status))) {
+
+		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
+		flush_work(&it6505->link_works);
+		it6505_stop_hdcp(it6505);
+		it6505_video_reset(it6505);
+
+		usleep_range(10000, 11000);
+
+		/*
+		 * Clear FIFO error IRQ to prevent fifo error -> reset loop
+		 * HW will trigger SCDT change IRQ again when video stable
+		 */
+
+		reg_int03 = it6505_read(it6505, INT_STATUS_03);
+		reg_0d = it6505_read(it6505, REG_SYSTEM_STS);
+
+		reg_int03 &= (BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
+		it6505_write(it6505, INT_STATUS_03, reg_int03);
+
+		DRM_DEV_DEBUG_DRIVER(dev, "reg08 = 0x%02x", reg_int03);
+		DRM_DEV_DEBUG_DRIVER(dev, "reg0D = 0x%02x", reg_0d);
+
+		return;
+	}
+
+
+	if (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_status))
+		it6505_irq_scdt(it6505);
 }
 
 static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
@@ -2512,15 +2572,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	} irq_vec[] = {
 		{ BIT_INT_HPD, it6505_irq_hpd },
 		{ BIT_INT_HPD_IRQ, it6505_irq_hpd_irq },
-		{ BIT_INT_SCDT, it6505_irq_scdt },
 		{ BIT_INT_HDCP_FAIL, it6505_irq_hdcp_fail },
 		{ BIT_INT_HDCP_DONE, it6505_irq_hdcp_done },
-		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
 		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
 		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
-		{ BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
-		{ BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_overflow },
 	};
 	int int_status[3], i;
 
@@ -2546,10 +2602,13 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		irq_vec[0].handler(it6505);
 
 	if (it6505->hpd_state) {
+
 		for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
 			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
 				irq_vec[i].handler(it6505);
 		}
+
+		it6505_irq_video_handler(it6505, (unsigned int *) int_status);
 	}
 
 	pm_runtime_put_sync(dev);
@@ -3072,9 +3131,17 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
 	if (it6505->powered) {
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D3);
+
 		it6505_video_disable(it6505);
+
+		/*
+		 * After Set link video mute,
+		 * wait 20ms before send D3 to DP sink
+		 */
+		usleep_range(20000, 25000);
+
+		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+						DP_SET_POWER_D3);
 	}
 }
 
-- 
2.25.1

