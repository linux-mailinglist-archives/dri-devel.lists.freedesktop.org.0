Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38E50D3BF
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEEA1124E1;
	Sun, 24 Apr 2022 16:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407710F86B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 12:09:21 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y20so21040351eju.7
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ul8xsTObKq7dxqXoQV8EI09Hux8ap60oboJuoV8LAW0=;
 b=LSUia2p58gc1dfhUGH1PJMFheVOjwroaUmlgzniFrkbYBhuGWBDk+B7Iv9WplY0336
 a0as++9UuzYctPIX3rhw7aIWxs2Xk3T9yRkpdil0rMMeWfSlO4PFREFoNIwXqw0XPAuJ
 q+xBynMJP6MZVlczjrhH+zWmpeNYKbpMcF7TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ul8xsTObKq7dxqXoQV8EI09Hux8ap60oboJuoV8LAW0=;
 b=h9otsA+qiOFk6VbBclfxQRZn9gpXVTurqwiOm/87HdRqf2NxkosYHmfcrZfB60R0Mv
 HpgTvLwY1cb2J+0y79+aRciTN17VFe/1ONuIFEOmvPGpHF7P+zgdokGZRA+LXA7ab51k
 VAkKdbiuKeyrQZvb/KB0qdLC/07JCOGDXGsweb9nVbo9/XwuGU06Q/8SNdNcgZa0HmmF
 pER+Kt/9qVkhxJHi9d0+ys1KqHnzvc0pe7j3lV+E4F9M42vn9MloftbNedcb0BkO2dsd
 CdBId47KKvxaxZI64gi+1rzacEah3vSK4DDLY2DpBFfiKJCZmEiIw1GadnQ+VlHra0La
 6bBg==
X-Gm-Message-State: AOAM530cf8RR2x16mWhmMuUauYFsCYV6v51cyuaJpjy9jYkNntT6G6D5
 eEehxAdYNgWP9/VbDOrnC9rFMw==
X-Google-Smtp-Source: ABdhPJxs/w+J//eja9Fb7hXl/nc1YqFmIlFoGP9adBbpZUPaD6iHXBPpaUOzLdBJMBPwFbyA3K8rEg==
X-Received: by 2002:a17:906:3919:b0:6e8:688d:5fd9 with SMTP id
 f25-20020a170906391900b006e8688d5fd9mr7961042eje.263.1650715760057; 
 Sat, 23 Apr 2022 05:09:20 -0700 (PDT)
Received: from capella.. (109.58.122.219.mobile.3.dk. [109.58.122.219])
 by smtp.gmail.com with ESMTPSA id
 hz24-20020a1709072cf800b006f383a4d56bsm24902ejc.4.2022.04.23.05.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:09:19 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm: bridge: adv7511: enable CEC support for ADV7535
Date: Sat, 23 Apr 2022 14:08:52 +0200
Message-Id: <20220423120854.1503163-2-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423120854.1503163-1-alvin@pqrs.dk>
References: <20220423120854.1503163-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Apr 2022 16:57:54 +0000
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
Reviewed-by: Robert Foss <robert.foss@linaro.org>
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
index b3f10c54e064..556ba1b447ba 100644
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

