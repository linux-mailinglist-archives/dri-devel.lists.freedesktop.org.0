Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C525759AD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 04:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A8910E0F2;
	Fri, 15 Jul 2022 02:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB0610E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 02:49:32 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 Jul 2022 10:49:32 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26F2nROC032809;
 Fri, 15 Jul 2022 10:49:27 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Fri, 15 Jul 2022 10:49:27 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v2 3/3] drm/bridge: it6505: Modified video clock calculation
 and video debug message
Date: Fri, 15 Jul 2022 10:49:07 +0800
Message-ID: <20220715024910.12578-4-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715024910.12578-1-allen.chen@ite.com.tw>
References: <20220715024910.12578-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: C683FC109254C350E8EFF1190E6F06B80D9AB9AE3EC860B92C3341F2BFA201452002:8
X-MAIL: mse.ite.com.tw 26F2nROC032809
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Pin-Yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

Speed up video clock calculation and remove redundant video debug message.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cfd2c3275dc5..11a34ddb60a1 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -703,7 +703,7 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "hactive_start:%d, vactive_start:%d",
 			     hdes, vdes);
 
-	for (i = 0; i < 10; i++) {
+	for (i = 0; i < 3; i++) {
 		it6505_set_bits(it6505, REG_DATA_CTRL0, ENABLE_PCLK_COUNTER,
 				ENABLE_PCLK_COUNTER);
 		usleep_range(10000, 15000);
@@ -720,7 +720,7 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 		return;
 	}
 
-	sum /= 10;
+	sum /= 3;
 	pclk = 13500 * 2048 / sum;
 	it6505->video_info.clock = pclk;
 	it6505->video_info.hdisplay = hdew;
@@ -2344,8 +2344,6 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 
 		if (!it6505_get_video_status(it6505))
 			it6505_video_reset(it6505);
-
-		it6505_calc_video_info(it6505);
 	} else {
 		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
 
-- 
2.25.1

