Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157034DEA56
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615F310E2E4;
	Sat, 19 Mar 2022 19:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BC710F05C
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 15:10:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id a17so12312083edm.9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5GV8Sqa9HxG9jNF600oPxEBUAnTnn/ZeyJz7jRUQIQ=;
 b=SHTVXk9wr6d7wqUrX0FDI5UpwdkcTkwfUASd1NtVoF5T7XFjZN8PyDQ/nPxI+Blm28
 wY7yn5pybqjy+55htDInP51kX0EXqsuA1DtMzoKHa8n7vm5krmKMGMLLl7egVBWJWR+L
 DYil3Kjjprho1ulnX6PZtISdszq9LpwMeQffo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5GV8Sqa9HxG9jNF600oPxEBUAnTnn/ZeyJz7jRUQIQ=;
 b=TdJncs5omMWxdS2TjHkHkxaP7dePUQ21Vvc54pLiA3MzwiSoZB7c6/x3eTTSYZ72DA
 aiVEcw0k4WZujEIUZrXNC5U72EXakcVT6EdY/X/ofeHbzEoouyTtvMeyrcw/4OTAh95l
 Rk+aamPwRjATpiSM+97Mt6fwasuflZE8x/omAQIEUK5D2Pb65g/sbJwUujUjQHjhAd2D
 bMQN2fESxWTyHV0ueTCTc4hova/4RZ2ycYoH6bffat3X7pUJE8by18hYGXygsW1qpjox
 xEJduAylGSOAj0/MOnUWYZbEvnYp3sGGzzsv047bQWct9SlYuwmStS4aCSb6vvoWrf7X
 E6uA==
X-Gm-Message-State: AOAM530Rt5gB6AAEPeh8Bdnm79LBxePJn9VAzCy9SImvKc8nRY3t2KxW
 adSvHdYGW7QzpoZRxETdBhBXlUDxq/UFDRDV
X-Google-Smtp-Source: ABdhPJzsezxQxWdDTkbcj8Yehhry13s97rbvKlWNQegZwhRfy56Vf0B/ayrWU6fxH7pkYVmjtqnrAA==
X-Received: by 2002:a05:6402:5304:b0:413:8a0c:c54a with SMTP id
 eo4-20020a056402530400b004138a0cc54amr14653104edb.172.1647702645508; 
 Sat, 19 Mar 2022 08:10:45 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170906728b00b006df8494d384sm4573778ejl.122.2022.03.19.08.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 08:10:45 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm: bridge: adv7511: enable CEC support for ADV7535
Date: Sat, 19 Mar 2022 16:10:14 +0100
Message-Id: <20220319151016.983348-2-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319151016.983348-1-alvin@pqrs.dk>
References: <20220319151016.983348-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Like the ADV7533, the ADV7535 has an offset for the CEC register map,
and it is the same value (ADV7533_REG_CEC_OFFSET = 0x70).

Rather than testing for numerous chip types in the offset calculations
throughout the driver, just compute it during driver probe and put it in
the private adv7511 data structure.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 18 ++++++------------
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  5 +++--
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 6a882891d91c..da6d8ee2cd84 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -335,6 +335,7 @@ struct adv7511 {
 
 	struct regmap *regmap;
 	struct regmap *regmap_cec;
+	unsigned int reg_cec_offset;
 	enum drm_connector_status status;
 	bool powered;
 
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
index 28d9becc939c..1f619389e201 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -21,8 +21,7 @@
 
 static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 {
-	unsigned int offset = adv7511->type == ADV7533 ?
-					ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 	unsigned int val;
 
 	if (regmap_read(adv7511->regmap_cec,
@@ -73,8 +72,7 @@ static void adv_cec_tx_raw_status(struct adv7511 *adv7511, u8 tx_raw_status)
 
 void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 {
-	unsigned int offset = adv7511->type == ADV7533 ?
-					ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 	const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
 				ADV7511_INT1_CEC_TX_ARBIT_LOST |
 				ADV7511_INT1_CEC_TX_RETRY_TIMEOUT;
@@ -118,8 +116,7 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
 static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->type == ADV7533 ?
-					ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 
 	if (adv7511->i2c_cec == NULL)
 		return -EIO;
@@ -165,8 +162,7 @@ static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
 static int adv7511_cec_adap_log_addr(struct cec_adapter *adap, u8 addr)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->type == ADV7533 ?
-					ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 	unsigned int i, free_idx = ADV7511_MAX_ADDRS;
 
 	if (!adv7511->cec_enabled_adap)
@@ -235,8 +231,7 @@ static int adv7511_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				     u32 signal_free_time, struct cec_msg *msg)
 {
 	struct adv7511 *adv7511 = cec_get_drvdata(adap);
-	unsigned int offset = adv7511->type == ADV7533 ?
-					ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 	u8 len = msg->len;
 	unsigned int i;
 
@@ -289,8 +284,7 @@ static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
 
 int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
 {
-	unsigned int offset = adv7511->type == ADV7533 ?
-						ADV7533_REG_CEC_OFFSET : 0;
+	unsigned int offset = adv7511->reg_cec_offset;
 	int ret = adv7511_cec_parse_dt(dev, adv7511);
 
 	if (ret)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 005bf18682ff..0be65a1ffc47 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1027,8 +1027,7 @@ static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
-	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
-		reg -= ADV7533_REG_CEC_OFFSET;
+	reg -= adv7511->reg_cec_offset;
 
 	switch (reg) {
 	case ADV7511_REG_CEC_RX_FRAME_HDR:
@@ -1073,6 +1072,8 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
 		ret = adv7533_patch_cec_registers(adv);
 		if (ret)
 			goto err;
+
+		adv->reg_cec_offset = ADV7533_REG_CEC_OFFSET;
 	}
 
 	return 0;
-- 
2.35.1

