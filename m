Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6E8D7031
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 15:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0E610E17B;
	Sat,  1 Jun 2024 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e+NGwSt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440C610E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 13:25:08 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7e201ab539eso123903039f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717248306; x=1717853106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w09m5vTOKIMdkXnAvM1fYzDWbROmAa/NqAt2dfCY8Wo=;
 b=e+NGwSt5r98uWF7Nngyzr2gvaakfzuvZYK7WZBsc6vWILcTrXLwoY9yKXAqfm04tgH
 QOsuOyuauTiI1Ss3J6Sq3Q4z7YhjSjkdNA/7MC4AbgTxnLCfclLLC0Uhq04uMgQLtLZC
 w5FzhKRDobRHtqd+XIJ/gyaKiKuznLiEnr2j7xs2FuPXRxQ6jbjd2h8BYPvD2CvO2v9m
 DTlpNsVP7Nbmwk44CuaLu5eq5PHyYTTi4XHk+0BHWDYcjwnjxcTYDUS+4YsPw9zaP8x9
 4dI4t4DSHWYc2o9UmcMS5/+YNPMQZz7hjsLUy7JTKze62V9Tt69KsRR4N2zAnJEJROmQ
 Bl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717248306; x=1717853106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w09m5vTOKIMdkXnAvM1fYzDWbROmAa/NqAt2dfCY8Wo=;
 b=suBS6RoA0IzgF/PQuzwLXMNs77RPVVlKv8kmrELsTIhUUhks292YonEihPO2IADeFH
 B23KETY/vcodkIU6PgsIVneYvT4fXLVDitUM7fxXecqvJpzDYRS4NFfXN84PLWHUV8cO
 /UOIiI4dtK8/1DSHZ+rYEpfGunXkIa14VDmJYHmtwe4JcerjvIGH3NC+XwZk35sQUfgV
 5w7TsFT3qBf/86rKxpRwxdTwWqgx1AesfGTPIGVIoDrgr4U8Hzt4Rlvt8fu47+cpp/nq
 LY7dWumqCY4WnHW1IyLkMUs+0YAA2ywfMvlv7NbiuJ16qPV1fKy07P+1QVtxpnp5kLTo
 UYfg==
X-Gm-Message-State: AOJu0YzrmQ0amG+5ZF0zdh3xiShOxphXB23+PWYJQ4h4I3w+KD7Ql5GO
 J0tM7jYnHugjonp3DL83MUXn7Mnvfw8CKPc0ZApCL8cKtsoIbm7OkRUfiw==
X-Google-Smtp-Source: AGHT+IFjuqDklUTdiBuZvD8uaoR3QaDup8xZ+XUePhALHNSRX19pnPobhKPmrqYcHcfILKL94r+bJw==
X-Received: by 2002:a05:6602:6d16:b0:7ea:fdc9:ba61 with SMTP id
 ca18e2360f4ac-7eaffe96fb0mr533246239f.1.1717248306196; 
 Sat, 01 Jun 2024 06:25:06 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:e0b7:c613:ee:e8f3])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b48764e0ccsm1014646173.13.2024.06.01.06.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 06:25:05 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, victor.liu@nxp.com, sui.jingfeng@linux.dev,
 aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm/bridge: adv7511:  Fix Intermittent EDID failures
Date: Sat,  1 Jun 2024 08:24:59 -0500
Message-ID: <20240601132459.81123-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In the process of adding support for shared IRQ pins, a scenario
was accidentally created where adv7511_irq_process returned
prematurely causing the EDID to fail randomly.

Since the interrupt handler is broken up into two main helper functions,
update both of them to treat the helper functions as IRQ handlers. These
IRQ routines process their respective tasks as before, but if they
determine that actual work was done, mark the respective IRQ status
accordingly, and delay the check until everything has been processed.

This should guarantee the helper functions don't return prematurely
while still returning proper values of either IRQ_HANDLED or IRQ_NONE.

Reported-by: Liu Ying <victor.liu@nxp.com>
Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ
---
V2:  Fix uninitialized cec_status
     Cut back a little on error handling to return either IRQ_NONE or
     IRQ_HANDLED.

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index ea271f62b214..ec0b7f3d889c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -401,7 +401,7 @@ struct adv7511 {
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
-void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
+int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
 #else
 static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 44451a9658a3..651fb1dde780 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
 	cec_received_msg(adv7511->cec_adap, &msg);
 }
 
-void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
+int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 {
 	unsigned int offset = adv7511->info->reg_cec_offset;
 	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
@@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 				ADV7511_INT1_CEC_RX_READY3;
 	unsigned int rx_status;
 	int rx_order[3] = { -1, -1, -1 };
-	int i;
+	int i, ret = 0;
+	int irq_status = IRQ_NONE;
 
-	if (irq1 & irq_tx_mask)
+	if (irq1 & irq_tx_mask) {
 		adv_cec_tx_raw_status(adv7511, irq1);
+		irq_status = IRQ_HANDLED;
+	}
 
 	if (!(irq1 & irq_rx_mask))
-		return;
+		return irq_status;
 
-	if (regmap_read(adv7511->regmap_cec,
-			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
-		return;
+	ret = regmap_read(adv7511->regmap_cec,
+			ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
+	if (ret < 0)
+		return irq_status;
 
 	/*
 	 * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX
@@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 
 		adv7511_cec_rx(adv7511, rx_buf);
 	}
+
+	return IRQ_HANDLED;
 }
 
 static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 66ccb61e2a66..c8d2c4a157b2 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 {
 	unsigned int irq0, irq1;
 	int ret;
+	int cec_status = IRQ_NONE;
+	int irq_status = IRQ_NONE;
 
 	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
 	if (ret < 0)
@@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 	if (ret < 0)
 		return ret;
 
-	/* If there is no IRQ to handle, exit indicating no IRQ data */
-	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
-	    !(irq1 & ADV7511_INT1_DDC_ERROR))
-		return -ENODATA;
-
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
 	regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
 
-	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder)
+	if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder) {
 		schedule_work(&adv7511->hpd_work);
+		irq_status = IRQ_HANDLED;
+	}
 
 	if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
 		adv7511->edid_read = true;
 
 		if (adv7511->i2c_main->irq)
 			wake_up_all(&adv7511->wq);
+		irq_status = IRQ_HANDLED;
 	}
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
-	adv7511_cec_irq_process(adv7511, irq1);
+	cec_status = adv7511_cec_irq_process(adv7511, irq1);
 #endif
 
-	return 0;
+	/* If there is no IRQ to handle, exit indicating no IRQ data */
+	if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
 }
 
 static irqreturn_t adv7511_irq_handler(int irq, void *devid)
@@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, void *devid)
 	int ret;
 
 	ret = adv7511_irq_process(adv7511, true);
-	return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
+	return ret < 0 ? IRQ_NONE : ret;
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.43.0

