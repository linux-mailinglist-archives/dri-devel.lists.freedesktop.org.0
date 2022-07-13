Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A306572BC9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 05:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892EA10F99D;
	Wed, 13 Jul 2022 03:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88EF10F99D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 03:16:07 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 13 Jul 2022 11:16:06 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26D3G1r5010517;
 Wed, 13 Jul 2022 11:16:01 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Wed, 13 Jul 2022 11:16:00 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v2] drm/bridge: it6505: Add i2c api power on check
Date: Wed, 13 Jul 2022 11:15:47 +0800
Message-ID: <20220713031547.11641-1-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 24D321129413D9267E4F3E545413DC97FAB72075DC9AC9B6D9DBCF0786A3E6E42002:8
X-MAIL: mse.ite.com.tw 26D3G1r5010517
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Pin-yen Lin <treapking@google.com>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

Use i2c bus to read/write when it6505 power off will occur i2c error.
Add this check will prevent i2c error when it6505 power off.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
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

