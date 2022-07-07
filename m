Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA71569C6E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346E811242B;
	Thu,  7 Jul 2022 08:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA907112123
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:06:27 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 07 Jul 2022 16:06:27 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26786Klf042546;
 Thu, 7 Jul 2022 16:06:20 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 7 Jul 2022 16:06:20 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH 2/3] drm/bridge: it6505: Add i2c api power on check
Date: Thu, 7 Jul 2022 16:05:58 +0800
Message-ID: <20220707080600.49041-3-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707080600.49041-1-allen.chen@ite.com.tw>
References: <20220707080600.49041-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 65C89C8E9758456EEA011C9066CF6AC2432360222AE917257AC02F0206FA3DCD2002:8
X-MAIL: mse.ite.com.tw 26786Klf042546
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

Use i2c bus to read/write when it6505 power off will occure i2c error.
Add this check will prevent i2c error when it6505 power off.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>

---
 drivers/gpu/drm/bridge/ite-it6505.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index aa5e0aa1af85..cfd2c3275dc5 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -518,6 +518,9 @@ static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
 	int err;
 	struct device *dev = &it6505->client->dev;
 
+	if (!it6505->powered)
+		return -ENODEV;
+
 	err = regmap_read(it6505->regmap, reg_addr, &value);
 	if (err < 0) {
 		dev_err(dev, "read failed reg[0x%x] err: %d", reg_addr, err);
@@ -533,6 +536,9 @@ static int it6505_write(struct it6505 *it6505, unsigned int reg_addr,
 	int err;
 	struct device *dev = &it6505->client->dev;
 
+	if (!it6505->powered)
+		return -ENODEV;
+
 	err = regmap_write(it6505->regmap, reg_addr, reg_val);
 
 	if (err < 0) {
@@ -550,6 +556,9 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
 	int err;
 	struct device *dev = &it6505->client->dev;
 
+	if (!it6505->powered)
+		return -ENODEV;
+
 	err = regmap_update_bits(it6505->regmap, reg, mask, value);
 	if (err < 0) {
 		dev_err(dev, "write reg[0x%x] = 0x%x mask = 0x%x failed err %d",
@@ -2553,13 +2562,12 @@ static int it6505_poweron(struct it6505 *it6505)
 		usleep_range(10000, 20000);
 	}
 
+	it6505->powered = true;
 	it6505_reset_logic(it6505);
 	it6505_int_mask_enable(it6505);
 	it6505_init(it6505);
 	it6505_lane_off(it6505);
 
-	it6505->powered = true;
-
 	return 0;
 }
 
-- 
2.25.1

