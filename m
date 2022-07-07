Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5785569C6D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F19610FB14;
	Thu,  7 Jul 2022 08:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED1F10F8A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:06:25 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 07 Jul 2022 16:06:21 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26786HON042518;
 Thu, 7 Jul 2022 16:06:17 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 7 Jul 2022 16:06:17 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH 1/3] drm/bridge: it6505: Modified power sequence
Date: Thu, 7 Jul 2022 16:05:57 +0800
Message-ID: <20220707080600.49041-2-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707080600.49041-1-allen.chen@ite.com.tw>
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 62D7BFC71D8ADDF058FEDEB0032B7AECC9BD0AD3984CCDAB6D8C57BDE32F25432002:8
X-MAIL: mse.ite.com.tw 26786HON042518
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

Change power sequence to meet it6505 data sheet requirement when boot on.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>

---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 2d119e3016b3..aa5e0aa1af85 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3029,7 +3029,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
 		return PTR_ERR(pdata->ovdd);
 	}
 
-	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->gpiod_reset)) {
 		dev_err(dev, "gpiod_reset gpio not found");
 		return PTR_ERR(pdata->gpiod_reset);
-- 
2.25.1

