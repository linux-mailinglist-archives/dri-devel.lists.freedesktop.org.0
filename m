Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B4488B2E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793BB10E7CC;
	Sun,  9 Jan 2022 17:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2610E7C3
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:29:59 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id l8so7919276plt.6
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jan 2022 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrAbSJiFEPNWxZQr5pU93mRKFRXoQh8mvz4tdVB9MPE=;
 b=e9997IG3xaPFbDxgvtxy2QaqnfW+Pm8IH4dLu58WfHPJkPH2Zze7C+4db+a7vGYfcB
 4kbbq+pZtHJ/SCLAQUz0bajfR5m7wUAPS2GDH3BFnM45uUFVh/MRGWQUQ87BMLeQuVa3
 So9UVmZEWpHVb56eSKZYWK6jdYtXTfOLIQRmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrAbSJiFEPNWxZQr5pU93mRKFRXoQh8mvz4tdVB9MPE=;
 b=nxEWmOt9+sYqwBx8iy3MBuYgtYCOFN0qGaWyOU6hWSX1dmeQ6xabgCBh52W8M8QEcm
 Js2VflG/BKbWH5t/N5K5Y6fktL+iKvKT0H7k5SM1kKFYgW16/lBCczPdTO6B/PlT2SNO
 57qn0rvCF4SxAXsxesl6P3UOeowm0IxrDEFzTjJkiWaXnZ8u/iQpNCH2RwOLkeMGKWde
 mH1fy+Rbt/5GisnQPAlPsfAvsUO6+h1Z2DShzHShioRr1ADiuRUVsLgtHLH3jLrhWPxU
 rUfr/bI6cVOhY/uAXuDGfZOmBXHpv3BmcSfomBrZ4Ku/o2u9QJuVMZkaeflweKTgGIXU
 x/WA==
X-Gm-Message-State: AOAM533UOVmBm1IqtN5ynq2GSAzsf9CzeQJeVTrPGzTEf3rV6QJ9Dgal
 vVTsbursZD/slTOmqSDyf2cFOw==
X-Google-Smtp-Source: ABdhPJx3/0lnxeO1VyXy0zoZM5uHgt6KsNJMysIULLF+BLKYG/0NUsKoSJBSuIpx0o9rXsd+g5VMBw==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr25272609pjb.125.1641749398764; 
 Sun, 09 Jan 2022 09:29:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:2576:1414:50fa:2e4d])
 by smtp.gmail.com with ESMTPSA id hi3sm1519281pjb.52.2022.01.09.09.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:29:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm: bridge: adv7511: Fix ADV7535 HPD enablement
Date: Sun,  9 Jan 2022 22:59:49 +0530
Message-Id: <20220109172949.168167-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing HPD enablement logic is not compatible with ADV7535
bridge, thus any runtime plug-in of HDMI cable is not working
on these bridge designs.

Unlike other ADV7511 family of bridges, the ADV7535 require
HPD_OVERRIDE bit to set and reset for proper handling of HPD
functionality.

Fix it.

Fixes: 8501fe4b14a3 ("drm: bridge: adv7511: Add support for ADV7535")
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 29 +++++++++++++++-----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 592ecfcf00ca..6a882891d91c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -169,6 +169,7 @@
 #define ADV7511_PACKET_ENABLE_SPARE2		BIT(1)
 #define ADV7511_PACKET_ENABLE_SPARE1		BIT(0)
 
+#define ADV7535_REG_POWER2_HPD_OVERRIDE		BIT(6)
 #define ADV7511_REG_POWER2_HPD_SRC_MASK		0xc0
 #define ADV7511_REG_POWER2_HPD_SRC_BOTH		0x00
 #define ADV7511_REG_POWER2_HPD_SRC_HPD		0x40
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f8e5da148599..77118c3395bf 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -351,11 +351,17 @@ static void __adv7511_power_on(struct adv7511 *adv7511)
 	 * from standby or are enabled. When the HPD goes low the adv7511 is
 	 * reset and the outputs are disabled which might cause the monitor to
 	 * go to standby again. To avoid this we ignore the HPD pin for the
-	 * first few seconds after enabling the output.
+	 * first few seconds after enabling the output. On the other hand
+	 * adv7535 require to enable HPD Override bit for proper HPD.
 	 */
-	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
-			   ADV7511_REG_POWER2_HPD_SRC_MASK,
-			   ADV7511_REG_POWER2_HPD_SRC_NONE);
+	if (adv7511->type == ADV7535)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+				   ADV7535_REG_POWER2_HPD_OVERRIDE,
+				   ADV7535_REG_POWER2_HPD_OVERRIDE);
+	else
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+				   ADV7511_REG_POWER2_HPD_SRC_MASK,
+				   ADV7511_REG_POWER2_HPD_SRC_NONE);
 }
 
 static void adv7511_power_on(struct adv7511 *adv7511)
@@ -375,6 +381,10 @@ static void adv7511_power_on(struct adv7511 *adv7511)
 static void __adv7511_power_off(struct adv7511 *adv7511)
 {
 	/* TODO: setup additional power down modes */
+	if (adv7511->type == ADV7535)
+		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+				   ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
+
 	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
 			   ADV7511_POWER_POWER_DOWN,
 			   ADV7511_POWER_POWER_DOWN);
@@ -672,9 +682,14 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 			status = connector_status_disconnected;
 	} else {
 		/* Renable HPD sensing */
-		regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
-				   ADV7511_REG_POWER2_HPD_SRC_MASK,
-				   ADV7511_REG_POWER2_HPD_SRC_BOTH);
+		if (adv7511->type == ADV7535)
+			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+					   ADV7535_REG_POWER2_HPD_OVERRIDE,
+					   ADV7535_REG_POWER2_HPD_OVERRIDE);
+		else
+			regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
+					   ADV7511_REG_POWER2_HPD_SRC_MASK,
+					   ADV7511_REG_POWER2_HPD_SRC_BOTH);
 	}
 
 	adv7511->status = status;
-- 
2.25.1

