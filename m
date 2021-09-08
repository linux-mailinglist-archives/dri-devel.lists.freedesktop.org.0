Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E92403EF7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4156E250;
	Wed,  8 Sep 2021 18:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2716E241
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:18:23 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 17so3504020pgp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QH0RDVPeUL0uAEEBFwJbknOg+BdYfx7CH2ypXTwO2w=;
 b=giEp0q8J6UXeA/d1SLYcpRaU1ZjhSNWr6Zok/12qH11RdsMmboBwH+tnmog2G0hHbG
 ncWe0rPFBfyCAvfEBdz8r2AiKjfnQ0GkhQUdJf9wU030gaFI8ZnZ+brqRNC4qe4CxB5/
 Rlw0pSZMf8AvD4vn5NHOp0aK6yfn3D6dvsw2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QH0RDVPeUL0uAEEBFwJbknOg+BdYfx7CH2ypXTwO2w=;
 b=gu608u7MVZfc8+Ep0ZVNAqWQ38YBeoOOrIO/yvs4MzrHW3FW1z472u/VjVI04M/rKN
 dG6WETrf21LZEZjlJuV7yIRyT1Jg3CbUINu4N2j/8Z8WdQ0gAw0F2d2shV3qb2iCmwGA
 qtCiZK2Zy/yIMabTqXv1IWlyXqerO1gb8P6fBFDPFZZDUi1mLs+T2DUQXBs0WE09YvHZ
 u0+MXQN6shztiYMiPsrzt8spo0x921z4XZONTz0yIgxDegs3q4hEhf4QGPc7J0eYExgz
 lydL+RBpJ6ChdseGxyVIRAupBQRBkjbX+qYadkwzxkoXxer9SVyP8apfermM0yzDF0Lu
 1lUg==
X-Gm-Message-State: AOAM530sph718nAfVV3quTRX7PTJ9g2G6tPfuhMEzp1Yb87dUGE09MYf
 rIcDalB4HYfixq+zcCWuKzckog==
X-Google-Smtp-Source: ABdhPJzlngk5m6DfitZJu/F5uavnw6y2sXHYRt7J0/1hqNxGVrL/EMFn5/WRKrUXb7qoJ4oCus5XAg==
X-Received: by 2002:aa7:86cb:0:b0:412:448c:89c8 with SMTP id
 h11-20020aa786cb000000b00412448c89c8mr5015182pfo.84.1631125103206; 
 Wed, 08 Sep 2021 11:18:23 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:527e:e80d:8e14:9d07])
 by smtp.gmail.com with ESMTPSA id mq12sm2917584pjb.38.2021.09.08.11.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:18:22 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
Date: Wed,  8 Sep 2021 11:18:06 -0700
Message-Id: <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
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

Implement the first version of AUX support, which will be useful as
we expand the driver to support varied use cases.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 123 +++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index a16725dbf912..3f0241a60357 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -9,15 +9,36 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
+#define PAGE0_AUXCH_CFG3	0x76
+#define  AUXCH_CFG3_RESET	0xff
+#define PAGE0_AUX_ADDR_7_0	0x7d
+#define PAGE0_AUX_ADDR_15_8	0x7e
+#define PAGE0_AUX_ADDR_23_16	0x7f
+#define  AUX_ADDR_19_16_MASK	GENMASK(3, 0)
+#define  AUX_CMD_MASK		GENMASK(7, 4)
+#define PAGE0_AUX_LENGTH	0x80
+#define  AUX_LENGTH_MASK	GENMASK(3, 0)
+#define PAGE0_AUX_WDATA		0x81
+#define PAGE0_AUX_RDATA		0x82
+#define PAGE0_AUX_CTRL		0x83
+#define  AUX_START		0x01
+#define PAGE0_AUX_STATUS	0x84
+#define  AUX_STATUS_MASK	GENMASK(7, 5)
+#define  AUX_STATUS_TIMEOUT	(0x7 << 5)
+#define  AUX_STATUS_DEFER	(0x2 << 5)
+#define  AUX_STATUS_NACK	(0x1 << 5)
+
 #define PAGE2_GPIO_H		0xa7
 #define  PS_GPIO9		BIT(1)
 #define PAGE2_I2C_BYPASS	0xea
@@ -63,6 +84,7 @@ enum ps8640_vdo_control {
 struct ps8640 {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_dp_aux aux;
 	struct mipi_dsi_device *dsi;
 	struct i2c_client *page[MAX_DEVS];
 	struct regmap	*regmap[MAX_DEVS];
@@ -93,6 +115,102 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
 	return container_of(e, struct ps8640, bridge);
 }
 
+static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
+{
+	return container_of(aux, struct ps8640, aux);
+}
+
+static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
+				   struct drm_dp_aux_msg *msg)
+{
+	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
+	struct i2c_client *client = ps_bridge->page[PAGE0_DP_CNTL];
+	struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
+	unsigned int len = msg->size;
+	unsigned int data;
+	int ret;
+	u8 request = msg->request &
+		     ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
+	u8 *buf = msg->buffer;
+	bool is_native_aux = false;
+
+	if (len > DP_AUX_MAX_PAYLOAD_BYTES)
+		return -EINVAL;
+
+	pm_runtime_get_sync(&client->dev);
+
+	switch (request) {
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_NATIVE_READ:
+		is_native_aux = true;
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_I2C_READ:
+		regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
+		break;
+	default:
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* Assume it's good */
+	msg->reply = 0;
+
+	data = ((request << 4) & AUX_CMD_MASK) |
+	       ((msg->address >> 16) & AUX_ADDR_19_16_MASK);
+	regmap_write(map, PAGE0_AUX_ADDR_23_16, data);
+	data = (msg->address >> 8) & 0xff;
+	regmap_write(map, PAGE0_AUX_ADDR_15_8, data);
+	data = msg->address & 0xff;
+	regmap_write(map, PAGE0_AUX_ADDR_7_0, msg->address & 0xff);
+
+	data = (len - 1) & AUX_LENGTH_MASK;
+	regmap_write(map, PAGE0_AUX_LENGTH, data);
+
+	if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
+		ret = regmap_noinc_write(map, PAGE0_AUX_WDATA, buf, len);
+		if (ret < 0) {
+			DRM_ERROR("failed to write PAGE0_AUX_WDATA");
+			goto exit;
+		}
+	}
+
+	regmap_write(map, PAGE0_AUX_CTRL, AUX_START);
+
+	regmap_read(map, PAGE0_AUX_STATUS, &data);
+	switch (data & AUX_STATUS_MASK) {
+	case AUX_STATUS_DEFER:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_DEFER;
+		goto exit;
+	case AUX_STATUS_NACK:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_NACK;
+		goto exit;
+	case AUX_STATUS_TIMEOUT:
+		ret = -ETIMEDOUT;
+		goto exit;
+	}
+
+	if (request == DP_AUX_NATIVE_READ || request == DP_AUX_I2C_READ) {
+		ret = regmap_noinc_read(map, PAGE0_AUX_RDATA, buf, len);
+		if (ret < 0)
+			DRM_ERROR("failed to read PAGE0_AUX_RDATA");
+	}
+
+exit:
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 				     const enum ps8640_vdo_control ctrl)
 {
@@ -387,6 +505,11 @@ static int ps8640_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ps_bridge);
 
+	ps_bridge->aux.name = "parade-ps8640-aux";
+	ps_bridge->aux.dev = dev;
+	ps_bridge->aux.transfer = ps8640_aux_transfer;
+	drm_dp_aux_init(&ps_bridge->aux);
+
 	drm_bridge_add(&ps_bridge->bridge);
 
 	return 0;
-- 
2.33.0.153.gba50c8fa24-goog

