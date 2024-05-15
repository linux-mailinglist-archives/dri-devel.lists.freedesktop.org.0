Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38288C6136
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100C10E435;
	Wed, 15 May 2024 07:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="JI12SAiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC2210E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=us5RfwBMD+CDH7HC2UwnNPbHR+DDewbd7U6DdyQOfJs=;
 b=JI12SAiUaSggaHBNib4QEnYncrZ3OoELkHQWX4B0xx2J5T1cnHB7Vgks
 /L6YDJjEGXPBYbVo+hpvsT+/sD+533HcqXgXSsu3uIVhNWoDPDMTN6oyP
 GmsJdJEekThc47li3u2Pfay41eKN2gFLpKWcAwsuIatiKuBkecyQUUbsN
 O1EcQ9MozMqkjeht9a4qDmyURbKbNLfd+TwzZ0HGtGmlkkHOCykCc5gS/
 nCcd8UySShFO+7tqRd0nQ/mcxOhlDGzymTcjzUyPh7ciPnWKqHVhSCcx4
 B9AgANiUpY3VJK0Sff+/VsH5U5v6EdDnkJ8YDOpyDYTelWxe7hj8ScyUJ w==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 May 2024 15:12:47 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 44F7CiDd099690;
 Wed, 15 May 2024 15:12:44 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 15:12:44 +0800
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
Subject: [PATCH v8 1/1] drm/bridge: it6505: fix hibernate to resume no display
 issue
Date: Wed, 15 May 2024 15:23:28 +0800
Message-ID: <20240515072328.1010920-2-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515072328.1010920-1-kuro.chung@ite.com.tw>
References: <20240515072328.1010920-1-kuro.chung@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 8B05755E347742B737493F0CB1D1E69386D87DA17A7BA5EA3429C7B7311FB3B72002:8
X-MAIL: mse.ite.com.tw 44F7CiDd099690
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
 drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 469157341f3ab..5703fcf4b7b00 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1307,9 +1307,15 @@ static void it6505_video_reset(struct it6505 *it6505)
 	it6505_link_reset_step_train(it6505);
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_MUTE);
 	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00);
-	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
+
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, TX_FIFO_RESET);
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
+
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_FIFO);
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
+
+	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
+	usleep_range(1000, 2000);
 	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
 }
 
@@ -2245,12 +2251,11 @@ static void it6505_link_training_work(struct work_struct *work)
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
@@ -2471,31 +2476,53 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
 	schedule_work(&it6505->link_works);
 }
 
-static void it6505_irq_video_fifo_error(struct it6505 *it6505)
+static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
 {
-	struct device *dev = it6505->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
+	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
 }
 
-static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
+static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
 {
 	struct device *dev = it6505->dev;
+	int reg_0d, reg_int03;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
-}
+	/*
+	 * When video SCDT change with video not stable,
+	 * Or video FIFO error, need video reset
+	 */
 
-static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
-{
-	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
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
@@ -2508,15 +2535,12 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	} irq_vec[] = {
 		{ BIT_INT_HPD, it6505_irq_hpd },
 		{ BIT_INT_HPD_IRQ, it6505_irq_hpd_irq },
-		{ BIT_INT_SCDT, it6505_irq_scdt },
 		{ BIT_INT_HDCP_FAIL, it6505_irq_hdcp_fail },
 		{ BIT_INT_HDCP_DONE, it6505_irq_hdcp_done },
 		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
 		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
 		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
-		{ BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
-		{ BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_overflow },
 	};
 	int int_status[3], i;
 
@@ -2546,6 +2570,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
 				irq_vec[i].handler(it6505);
 		}
+		it6505_irq_video_handler(it6505, (unsigned int *) int_status);
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.25.1

