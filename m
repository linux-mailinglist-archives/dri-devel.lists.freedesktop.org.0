Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B355C409F30
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20E6E288;
	Mon, 13 Sep 2021 21:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293D6E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 21:33:52 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d18so6734982pll.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItVSwaBU9j7WOMmhz7M7pgG0qPUuUtaN0y+GWX1Cl30=;
 b=UJibp9FqgBbXPukfT9QTdkPqGCMTnjkMLM/u+7ZUP1/tjtdTr8OMDMD3axrOH7TJRZ
 pCqseLL7RndnV4fH7x9y7XgaBbbTE6q7ZDm15WnhOjAkB+/+5HOTQ7+7fohQ8j/DEerT
 GjEJWAfBpfPhP1XFsCLHcQX01Ut1XaApcRV7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItVSwaBU9j7WOMmhz7M7pgG0qPUuUtaN0y+GWX1Cl30=;
 b=bQr2lxEEnRQchZZPZS19rdIgcFodsf2JgJn+t8AkTpabgqzH8+c02l4b66XMqpEiBX
 jUNV3sqN8Cw6gp8NiIGy7b0Lj/dk+r7RgLe1ILHMQFt5VAheHL1Sw1lnOdKmMKXKgxnl
 0MMAcy5oAKWAanmcK8C78Ij5oDSyn5Ym2+GoJHfC4Rj0txqKlFViskJAA16GW3G3NfXC
 LEOu5qW6/+efV+Q8rv38SmU6iOwRJyIYvfbsRGMoQlNfmtQzwf0WCtzULuQZTVJuWbvP
 bGY1jxcczLkHzM+01x49VX4D8E5WySIcdoLSzTbW1XOsrSMBCyptEcTHUeaD8asN3dW+
 ghYA==
X-Gm-Message-State: AOAM533OfTYSLso50qXUJanOn10y+w/HYGv3q8d6z26Omc3Xwy/ME7If
 hDbqV0MA2r7jlKDVimvyCSxpyA==
X-Google-Smtp-Source: ABdhPJzes781BlCohh/n/k6Xwv0NpNF85JtwlraVjSXKu7FddWsSl/kD2h76BbH0+6LOI5v5bY+0Cw==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr1821529pjb.78.1631568832318; 
 Mon, 13 Sep 2021 14:33:52 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:b3b2:2a45:e533:cf25])
 by smtp.gmail.com with ESMTPSA id b20sm7859907pfl.9.2021.09.13.14.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 14:33:52 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
Date: Mon, 13 Sep 2021 14:33:44 -0700
Message-Id: <20210913143255.RFC.v2.2.I2f55fee564b0008908d8a25a8825117119c80c4a@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
References: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
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

WARNING: This patch is not fully verified by hardware. But as AUX CH
is not implemented for ps8640 driver until now, the patch shouldn't
cause any functional regression in practice.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v2:
- Handle the case where an AUX transaction has no payload
- Add a reg polling for p0.0x83 to confirm AUX cmd is issued and
  read data is returned
- Replace regmap_noinc_read/write with looped regmap_read/write,
  as regmap_noinc_read/write doesn't read one byte at a time unless
  max_raw_read/write is set to 1.
- Register/Unregister the AUX device explicitly when the bridge is
  attached/detached
- Remove the use of runtime PM
- Program AUX addr/cmd/len in a single regmap_bulk_write()
- Add newlines for DRM_ERROR mesages

 drivers/gpu/drm/bridge/parade-ps8640.c | 156 ++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 1b2414601538..3b28e992bb3e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -13,11 +13,32 @@
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
+#define  AUX_NO_PAYLOAD		BIT(7)
+#define PAGE0_AUX_WDATA		0x81
+#define PAGE0_AUX_RDATA		0x82
+#define PAGE0_AUX_CTRL		0x83
+#define  AUX_SEND		BIT(0)
+#define PAGE0_AUX_STATUS	0x84
+#define  AUX_STATUS_MASK	GENMASK(7, 5)
+#define  AUX_STATUS_TIMEOUT	(0x7 << 5)
+#define  AUX_STATUS_DEFER	(0x2 << 5)
+#define  AUX_STATUS_NACK	(0x1 << 5)
+
 #define PAGE2_GPIO_H		0xa7
 #define  PS_GPIO9		BIT(1)
 #define PAGE2_I2C_BYPASS	0xea
@@ -68,6 +89,7 @@ enum ps8640_vdo_control {
 struct ps8640 {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_dp_aux aux;
 	struct mipi_dsi_device *dsi;
 	struct i2c_client *page[MAX_DEVS];
 	struct regmap	*regmap[MAX_DEVS];
@@ -117,6 +139,114 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
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
+	struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
+	unsigned int len = msg->size;
+	unsigned int data;
+	int ret;
+	u8 request = msg->request &
+		     ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
+	u8 *buf = msg->buffer;
+	u8 addr_len[PAGE0_AUX_LENGTH + 1 - PAGE0_AUX_ADDR_7_0];
+	u8 i;
+	bool is_native_aux = false;
+
+	if (len > DP_AUX_MAX_PAYLOAD_BYTES)
+		return -EINVAL;
+
+	switch (request) {
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_NATIVE_READ:
+		is_native_aux = true;
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_I2C_READ:
+		ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
+		break;
+	default:
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* Assume it's good */
+	msg->reply = 0;
+
+	addr_len[0] = msg->address & 0xff;
+	addr_len[1] = (msg->address >> 8) & 0xff;
+	addr_len[2] = ((request << 4) & AUX_CMD_MASK) |
+		((msg->address >> 16) & AUX_ADDR_19_16_MASK);
+	addr_len[3] = (len == 0) ? AUX_NO_PAYLOAD :
+			((len - 1) & AUX_LENGTH_MASK);
+
+	regmap_bulk_write(map, PAGE0_AUX_ADDR_7_0, addr_len,
+			  ARRAY_SIZE(addr_len));
+
+	if (len && (request == DP_AUX_NATIVE_WRITE ||
+		    request == DP_AUX_I2C_WRITE)) {
+		/* Write to the internal FIFO buffer */
+		for (i = 0; i < len; i++) {
+			ret = regmap_write(map, PAGE0_AUX_WDATA, buf[i]);
+			if (ret < 0) {
+				DRM_ERROR("failed to write PAGE0_AUX_WDATA\n");
+				goto exit;
+			}
+		}
+	}
+
+	regmap_write(map, PAGE0_AUX_CTRL, AUX_SEND);
+
+	/* Zero delay loop because i2c transactions are slow already */
+	ret = regmap_read_poll_timeout(map, PAGE0_AUX_CTRL, data,
+				       !(data & AUX_SEND), 0, 50 * 1000);
+	if (ret)
+		goto exit;
+
+	regmap_read(map, PAGE0_AUX_STATUS, &data);
+	switch (data & AUX_STATUS_MASK) {
+	case AUX_STATUS_DEFER:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_DEFER;
+		ret = -EBUSY;
+		goto exit;
+	case AUX_STATUS_NACK:
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_NACK;
+		ret = -EBUSY;
+		goto exit;
+	case AUX_STATUS_TIMEOUT:
+		ret = -ETIMEDOUT;
+		goto exit;
+	}
+
+	if (len && (request == DP_AUX_NATIVE_READ ||
+		    request == DP_AUX_I2C_READ)) {
+		/* Read from the internal FIFO buffer */
+		for (i = 0; i < len; i++) {
+			ret = regmap_read(map, PAGE0_AUX_WDATA, &data);
+			buf[i] = data;
+			if (ret < 0)
+				DRM_ERROR("failed to read PAGE0_AUX_RDATA\n");
+		}
+	}
+
+exit:
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 				     const enum ps8640_vdo_control ctrl)
 {
@@ -286,18 +416,32 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 	ret = mipi_dsi_attach(dsi);
-	if (ret)
-		goto err_dsi_attach;
+	if (ret) {
+		dev_err(dev, "failed to attach dsi device: %d\n", ret);
+		goto exit;
+	}
+
+	ret = drm_dp_aux_register(&ps_bridge->aux);
+	if (ret) {
+		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
+		goto exit;
+	}
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
 
-err_dsi_attach:
+exit:
 	mipi_dsi_device_unregister(dsi);
 	return ret;
 }
 
+
+static void ps8640_bridge_detach(struct drm_bridge *bridge)
+{
+	drm_dp_aux_unregister(&bridge_to_ps8640(bridge)->aux);
+}
+
 static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
@@ -334,6 +478,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
+	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
 	.post_disable = ps8640_post_disable,
 	.pre_enable = ps8640_pre_enable,
@@ -412,6 +557,11 @@ static int ps8640_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ps_bridge);
 
+	ps_bridge->aux.name = "parade-ps8640-aux";
+	ps_bridge->aux.dev = dev;
+	ps_bridge->aux.transfer = ps8640_aux_transfer;
+	drm_dp_aux_init(&ps_bridge->aux);
+
 	drm_bridge_add(&ps_bridge->bridge);
 
 	return 0;
-- 
2.33.0.309.g3052b89438-goog

