Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72147A0FE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 15:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05AB12A1DE;
	Sun, 19 Dec 2021 14:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1351 seconds by postgrey-1.36 at gabe;
 Sat, 18 Dec 2021 18:51:19 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1F112B2F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 18:51:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BIHkXCg006115;
 Sat, 18 Dec 2021 19:28:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=GljNz8SkdRMIPtXOeeLR4thwjr9SnWsELYQJQuX0dtQ=;
 b=WX3tnHlBYvfz4t24dhg662/05NEUMOW5ui4i0UndQgDQTJV0f3weBtT+Tsc+ghBmi0yn
 3AfA/BYDj7OyOGhXJiE2Co7O3XYNlkJs1Uu5Vb8AhKnnQxHUPTNvyXI7V3X8Mu9VP0oK
 ARMdugN5CJw/AeNK/fWLG2ZPxamyOlmml77i859pv3Ua8xdI0NHiBXyo6blxU1ID3Ntc
 y0bs3fNRiMQLVfrxC8AOp5bXS6KAwe4dNHfXlytABeUS7RJ7LTvVU6R5SJm0BAdsIa8B
 LYpQOpgnj3baIrQU9kIzQN9SAfNQFcG3inHrk96ynabVUPRKikaREhgffbyPD/BvDv0r eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d15natqcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 18 Dec 2021 19:28:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF5D910002A;
 Sat, 18 Dec 2021 19:28:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7B4B241DCD;
 Sat, 18 Dec 2021 19:28:25 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Sat, 18 Dec 2021 19:28:25
 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: adv7511: override i2c address of cec before accessing it
Date: Sat, 18 Dec 2021 19:28:04 +0100
Message-ID: <20211218182804.208906-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-18_08,2021-12-16_01,2021-12-02_01
X-Mailman-Approved-At: Sun, 19 Dec 2021 14:38:10 +0000
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 680532c50bca ("drm: adv7511: Add support for
i2c_new_secondary_device") allows a device tree node to override
the default addresses of the secondary i2c devices. This is useful
for solving address conflicts on the i2c bus.

In adv7511_init_cec_regmap() the new i2c address of cec device is
read from device tree and immediately accessed, well before it is
written in the proper register to override the default address.
This can cause an i2c error during probe and a consequent probe
failure.

Once the new i2c address is read from the device tree, override
the default address before any attempt to access the cec.

Tested with adv7533 and stm32mp157f.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Fixes: 680532c50bca ("drm: adv7511: Add support for i2c_new_secondary_device")
---
To: Andrzej Hajda <a.hajda@samsung.com>
To: Neil Armstrong <narmstrong@baylibre.com>
To: Robert Foss <robert.foss@linaro.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: David Airlie <airlied@linux.ie>
To: Daniel Vetter <daniel@ffwll.ch>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..629e05286fd9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1048,6 +1048,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 						ADV7511_CEC_I2C_ADDR_DEFAULT);
 	if (IS_ERR(adv->i2c_cec))
 		return PTR_ERR(adv->i2c_cec);
+
+	regmap_write(adv->regmap, ADV7511_REG_CEC_I2C_ADDR,
+		     adv->i2c_cec->addr << 1);
+
 	i2c_set_clientdata(adv->i2c_cec, adv);
 
 	adv->regmap_cec = devm_regmap_init_i2c(adv->i2c_cec,
@@ -1252,9 +1256,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret)
 		goto err_i2c_unregister_packet;
 
-	regmap_write(adv7511->regmap, ADV7511_REG_CEC_I2C_ADDR,
-		     adv7511->i2c_cec->addr << 1);
-
 	INIT_WORK(&adv7511->hpd_work, adv7511_hpd_work);
 
 	if (i2c->irq) {

base-commit: fc74881c28d314b10efac016ef49df4ff40b8b97
-- 
2.34.1

