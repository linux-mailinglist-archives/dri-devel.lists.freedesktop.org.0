Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3820F413982
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2566EA0B;
	Tue, 21 Sep 2021 18:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6596EA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 18:06:27 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id w19so218553pfn.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G0UwseQe0sSujWPNmw8aVG2fDl8Ezbjz8J7fpwT15wQ=;
 b=LKaP+7e5XRqPNOpyoduThckdVLAmnxZm6/f7hl86og/FFYzeoqEh3cWeGjiCjEqZNR
 gW2K2M9KA8whz9bG4ooaHslhNkzzPKQeyGUPSnpktyzbQCwl/kMVpXkIx/4wjQllMveh
 hNs3RI/HgNJpLbGNF87lgJPf+sOJifaVW+xU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G0UwseQe0sSujWPNmw8aVG2fDl8Ezbjz8J7fpwT15wQ=;
 b=tkFnkMrALw82fcsWOCQ4bkhQscuaHqFOxE333eE6rgF6F8+4nnshgbTRRip5+UIoB6
 sEyne/BfzMc06IcYpGnMkJLmtGTRgwKNDvW3z/B6wplpUqm9k4UmsqVaJBJv9GblpTFr
 0Wvl1+UCs/foUQQi8JJfYbb5e6QEUA3HPUH2/wU4g5LlfzfDq+uJQRIzpPzfXLDs/ojR
 NlvLFunPrQ19bXuHWyNwOOAvJJlFU29jtlFXXrjb5xgbgTfbDXj5oczojhiiDCXymoUm
 hc/ShEmepLrlcluCZNxxdKc71MD3fipTA+ezggkBYDU4cYz6/s6zd7Smc5FuxB5Nohrh
 BCwQ==
X-Gm-Message-State: AOAM532dMHwRfq43/YJ0Tg8ySQqvzmxAY2/24DfGcZjECO5KBwMmdt37
 OZ9uI+RjkHj1oce3RuGuT489+A==
X-Google-Smtp-Source: ABdhPJz9BVskq0haIvIxJ0AU8UZunZUVXryGDieNthisyUnFKm8bOFiUH0IGNUpBVz9hfwkr6srFGQ==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id
 b10-20020a056a000a8ab0290356be617f18mr31651376pfl.29.1632247586647; 
 Tue, 21 Sep 2021 11:06:26 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:c35f:d9dd:5de1:eb0c])
 by smtp.gmail.com with ESMTPSA id r13sm19771241pgl.90.2021.09.21.11.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 11:06:26 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
Date: Tue, 21 Sep 2021 11:06:17 -0700
Message-Id: <20210921110556.v6.2.I1d6ea362dc76efa77cca2b46253d31b7651eaf17@changeid>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
In-Reply-To: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
References: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
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

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v6:
- Error check the aux address is no greater than 20 bits
- Read RDATA into a u32 variable and then copy the byte to the u8 buf
- Fix a few nits from v5 review

Changes in v5:
- Add a couple of syntax fixes accidentally uncommited in v4

Changes in v4:
- Fix aux_transfer function:
  - Replace dev_err with DRM_DEV_ERROR
  - Reorg the bit manipulation around address/len/request registers
  - Make SWAUX_STATUS_I2C_NACK fall through to SWAUX_STATUS_ACKM and
    store the number of read bytes to `len` w/o returning immediately

Changes in v3:
- Verify with HW and thus remove WARNING from the patch description
- Fix the reg names to better match the manual
- Fix aux_transfer function:
  - Fix the switch statement which handles aux request
  - Write the original (unstripped) aux request code to the register
  - Replace DRM_ERROR with dev_err
  - Remove goto and just return ret
  - Fix the switch statement which handles aux status
  - When reading returned data, read from RDATA instead of WDATA
- Fix attach function:
  - Call mipi_dsi_detach() when aux_register fails

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
- Add newlines for DRM_ERROR messages

 drivers/gpu/drm/bridge/parade-ps8640.c | 181 ++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 18328e75bf90..56a206967e3d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -13,11 +13,36 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
+#define PAGE0_AUXCH_CFG3	0x76
+#define  AUXCH_CFG3_RESET	0xff
+#define PAGE0_SWAUX_ADDR_7_0	0x7d
+#define PAGE0_SWAUX_ADDR_15_8	0x7e
+#define PAGE0_SWAUX_ADDR_23_16	0x7f
+#define  SWAUX_ADDR_MASK	GENMASK(19, 0)
+#define PAGE0_SWAUX_LENGTH	0x80
+#define  SWAUX_LENGTH_MASK	GENMASK(3, 0)
+#define  SWAUX_NO_PAYLOAD	BIT(7)
+#define PAGE0_SWAUX_WDATA	0x81
+#define PAGE0_SWAUX_RDATA	0x82
+#define PAGE0_SWAUX_CTRL	0x83
+#define  SWAUX_SEND		BIT(0)
+#define PAGE0_SWAUX_STATUS	0x84
+#define  SWAUX_M_MASK		GENMASK(4, 0)
+#define  SWAUX_STATUS_MASK	GENMASK(7, 5)
+#define  SWAUX_STATUS_NACK	(0x1 << 5)
+#define  SWAUX_STATUS_DEFER	(0x2 << 5)
+#define  SWAUX_STATUS_ACKM	(0x3 << 5)
+#define  SWAUX_STATUS_INVALID	(0x4 << 5)
+#define  SWAUX_STATUS_I2C_NACK	(0x5 << 5)
+#define  SWAUX_STATUS_I2C_DEFER	(0x6 << 5)
+#define  SWAUX_STATUS_TIMEOUT	(0x7 << 5)
+
 #define PAGE2_GPIO_H		0xa7
 #define  PS_GPIO9		BIT(1)
 #define PAGE2_I2C_BYPASS	0xea
@@ -68,6 +93,7 @@ enum ps8640_vdo_control {
 struct ps8640 {
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct drm_dp_aux aux;
 	struct mipi_dsi_device *dsi;
 	struct i2c_client *page[MAX_DEVS];
 	struct regmap	*regmap[MAX_DEVS];
@@ -117,6 +143,137 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
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
+	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
+	unsigned int len = msg->size;
+	unsigned int data;
+	unsigned int base;
+	int ret;
+	u8 request = msg->request &
+		     ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
+	u8 *buf = msg->buffer;
+	u8 addr_len[PAGE0_SWAUX_LENGTH + 1 - PAGE0_SWAUX_ADDR_7_0];
+	u8 i;
+	bool is_native_aux = false;
+
+	if (len > DP_AUX_MAX_PAYLOAD_BYTES)
+		return -EINVAL;
+
+	if (msg->address & ~SWAUX_ADDR_MASK)
+		return -EINVAL;
+
+	switch (request) {
+	case DP_AUX_NATIVE_WRITE:
+	case DP_AUX_NATIVE_READ:
+		is_native_aux = true;
+		fallthrough;
+	case DP_AUX_I2C_WRITE:
+	case DP_AUX_I2C_READ:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n",
+			      ret);
+		return ret;
+	}
+
+	/* Assume it's good */
+	msg->reply = 0;
+
+	base = PAGE0_SWAUX_ADDR_7_0;
+	addr_len[PAGE0_SWAUX_ADDR_7_0 - base] = msg->address;
+	addr_len[PAGE0_SWAUX_ADDR_15_8 - base] = msg->address >> 8;
+	addr_len[PAGE0_SWAUX_ADDR_23_16 - base] = (msg->address >> 16) |
+						  (msg->request << 4);
+	addr_len[PAGE0_SWAUX_LENGTH - base] = (len == 0) ? SWAUX_NO_PAYLOAD :
+					      ((len - 1) & SWAUX_LENGTH_MASK);
+
+	regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
+			  ARRAY_SIZE(addr_len));
+
+	if (len && (request == DP_AUX_NATIVE_WRITE ||
+		    request == DP_AUX_I2C_WRITE)) {
+		/* Write to the internal FIFO buffer */
+		for (i = 0; i < len; i++) {
+			ret = regmap_write(map, PAGE0_SWAUX_WDATA, buf[i]);
+			if (ret) {
+				DRM_DEV_ERROR(dev,
+					      "failed to write WDATA: %d\n",
+					      ret);
+				return ret;
+			}
+		}
+	}
+
+	regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
+
+	/* Zero delay loop because i2c transactions are slow already */
+	regmap_read_poll_timeout(map, PAGE0_SWAUX_CTRL, data,
+				 !(data & SWAUX_SEND), 0, 50 * 1000);
+
+	regmap_read(map, PAGE0_SWAUX_STATUS, &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n",
+			      ret);
+		return ret;
+	}
+
+	switch (data & SWAUX_STATUS_MASK) {
+	/* Ignore the DEFER cases as they are already handled in hardware */
+	case SWAUX_STATUS_NACK:
+	case SWAUX_STATUS_I2C_NACK:
+		/*
+		 * The programming guide is not clear about whether a I2C NACK
+		 * would trigger SWAUX_STATUS_NACK or SWAUX_STATUS_I2C_NACK. So
+		 * we handle both cases together.
+		 */
+		if (is_native_aux)
+			msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
+		else
+			msg->reply |= DP_AUX_I2C_REPLY_NACK;
+
+		fallthrough;
+	case SWAUX_STATUS_ACKM:
+		len = data & SWAUX_M_MASK;
+		break;
+	case SWAUX_STATUS_INVALID:
+		return -EOPNOTSUPP;
+	case SWAUX_STATUS_TIMEOUT:
+		return -ETIMEDOUT;
+	}
+
+	if (len && (request == DP_AUX_NATIVE_READ ||
+		    request == DP_AUX_I2C_READ)) {
+		/* Read from the internal FIFO buffer */
+		for (i = 0; i < len; i++) {
+			ret = regmap_read(map, PAGE0_SWAUX_RDATA, &data);
+			if (ret) {
+				DRM_DEV_ERROR(dev,
+					      "failed to read RDATA: %d\n",
+					      ret);
+				return ret;
+			}
+
+			buf[i] = data;
+		}
+	}
+
+	return len;
+}
+
 static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 				     const enum ps8640_vdo_control ctrl)
 {
@@ -286,18 +443,34 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 	ret = mipi_dsi_attach(dsi);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "failed to attach dsi device: %d\n", ret);
 		goto err_dsi_attach;
+	}
+
+	ret = drm_dp_aux_register(&ps_bridge->aux);
+	if (ret) {
+		dev_err(dev, "failed to register DP AUX channel: %d\n", ret);
+		goto err_aux_register;
+	}
 
 	/* Attach the panel-bridge to the dsi bridge */
 	return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
 				 &ps_bridge->bridge, flags);
 
+err_aux_register:
+	mipi_dsi_detach(dsi);
 err_dsi_attach:
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
@@ -334,6 +507,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
+	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
 	.post_disable = ps8640_post_disable,
 	.pre_enable = ps8640_pre_enable,
@@ -409,6 +583,11 @@ static int ps8640_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, ps_bridge);
 
+	ps_bridge->aux.name = "parade-ps8640-aux";
+	ps_bridge->aux.dev = dev;
+	ps_bridge->aux.transfer = ps8640_aux_transfer;
+	drm_dp_aux_init(&ps_bridge->aux);
+
 	drm_bridge_add(&ps_bridge->bridge);
 
 	return 0;
-- 
2.33.0.464.g1972c5931b-goog

