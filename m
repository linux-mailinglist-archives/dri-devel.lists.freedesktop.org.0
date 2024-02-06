Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A684B03A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 09:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA491122DC;
	Tue,  6 Feb 2024 08:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="BDbJ1R4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 483 seconds by postgrey-1.36 at gabe;
 Tue, 06 Feb 2024 03:23:08 UTC
Received: from ironport.ite.com.tw
 (HC210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043311218E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7tmSjkwrVr8zUOPxhU4enES8UFyMmKuA21mbRMPz74g=;
 b=BDbJ1R4cM6dM3lJoGr9MmkAOQCudKKJ9CKYDqfeRNpmjB0bX4fPeN9k8
 KODPtQYgBaa6NYDmnDSzfC/ByLPCTj/XmAtOJYCgqi8pisCRXxP+ME9sV
 Ik+wiPkwAfBh7sFRI7PAVUnEGzz/YHwbswNoqj1S0r/K+xyC/8hK8ezJA
 fP1bxNWyRn0zMJW7OK0analZmJUf8XR3LwG1ctMuQYWdfvaP0P8MmDiS5
 yNkojV6Q8HKdSlwh6DKmTEmc73WudYWxMrqfL7DESmjaLQDlHfOhHgnS6
 odZoMzEiTlZ9kw4O2jMM0l2IuLLuMjTkJjaIJqGk/+MEaL2AXbyeInmAR A==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 06 Feb 2024 11:07:36 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 41637V9E034664;
 Tue, 6 Feb 2024 11:07:31 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 11:07:30 +0800
From: kuro chung <kuro.chung@ite.com.tw>
To: 
CC: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kuro Chung <kuro.chung@ite.com.tw>, Kenneth Hung <kenneth.hung@ite.com.tw>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] UPSTREAM: drm/bridge: it6505: fix hibernate to resume no
 display issue
Date: Tue, 6 Feb 2024 11:18:56 +0800
Message-ID: <20240206031857.113981-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: BD80BFB8E28ADDF3C9AEF3A6238B167A1C670D025098CD54108C5F832151605E2002:8
X-MAIL: mse.ite.com.tw 41637V9E034664
X-Mailman-Approved-At: Tue, 06 Feb 2024 08:46:32 +0000
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

From: allen chen <allen.chen@ite.com.tw>

Change-Id: Iaa3cd9da92a625496f579d87d0ab74ca9c4937c4
---
 drivers/gpu/drm/bridge/ite-it6505.c | 42 ++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b53da9bb65a1..07883001e6ca 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1318,6 +1318,8 @@ static void it6505_video_reset(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_MUTE);
 	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00);
 	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
+	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_FIFO);
 	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
 	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
@@ -2480,10 +2482,6 @@ static void it6505_irq_video_fifo_error(struct it6505 *it6505)
 	struct device *dev = &it6505->client->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
 }
 
 static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
@@ -2491,10 +2489,6 @@ static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
 	struct device *dev = &it6505->client->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-	flush_work(&it6505->link_works);
-	it6505_stop_hdcp(it6505);
-	it6505_video_reset(it6505);
 }
 
 static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
@@ -2522,7 +2516,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		{ BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
 		{ BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_overflow },
 	};
-	int int_status[3], i;
+	int int_status[3], i, reg_0d;
 
 	if (it6505->enable_drv_hold || !it6505->powered)
 		return IRQ_HANDLED;
@@ -2550,6 +2544,36 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
 				irq_vec[i].handler(it6505);
 		}
+
+		if ((it6505_test_bit(irq_vec[9].bit, (unsigned int *)int_status)) ||
+			(it6505_test_bit(irq_vec[10].bit, (unsigned int *)int_status))) {
+			it6505->auto_train_retry = AUTO_TRAIN_RETRY;
+			flush_work(&it6505->link_works);
+			it6505_stop_hdcp(it6505);
+			it6505_video_reset(it6505);
+
+			DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait video...");
+
+			for (i = 0; i < 10; i++) {
+				usleep_range(10000, 11000);
+				int_status[2] = it6505_read(it6505, INT_STATUS_03);
+				reg_0d = it6505_read(it6505, REG_SYSTEM_STS);
+				it6505_write(it6505, INT_STATUS_03, int_status[2]);
+
+				DRM_DEV_DEBUG_DRIVER(dev, "reg08 = 0x%02x", int_status[2]);
+				DRM_DEV_DEBUG_DRIVER(dev, "reg0D = 0x%02x", reg_0d);
+				if ((reg_0d & VIDEO_STB) && (reg_0d >= 0))
+					break;
+
+				if ((it6505_test_bit(irq_vec[9].bit, (unsigned int *)int_status)) || (it6505_test_bit(irq_vec[10].bit, (unsigned int *)int_status))) {
+					it6505_video_reset(it6505);
+					DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait video (%d)", i);
+				}
+
+			}
+
+		}
+
 	}
 
 	pm_runtime_put_sync(dev);
-- 
2.25.1

