Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6D4B3ADB
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 11:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1510F555;
	Sun, 13 Feb 2022 10:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A83510F555
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 10:34:43 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x4so8304417plb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 02:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/hJYfcKldb+BryXl3uVpvv9WjCLYVWvsGgc4Bs5pbE=;
 b=jKVkOfAuMk6waiV+V6SYdNdZrHvYTISZZUZjD0isg9cKQ1q5XPAjxyusb1doY6cl3e
 9RFAPCmmq4I2C7Ehwsk969Cl2dfz3J9nS6Lphx7FVGcVOdq4BI5xIpBwMJd3Kza1Z61s
 YZtcMRCmIMpMvOLzvIGEMP3LcdLlAxdprsNn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/hJYfcKldb+BryXl3uVpvv9WjCLYVWvsGgc4Bs5pbE=;
 b=bSToNgXgMjNc+FoH70xpojSwpf2rMlEXG/hOimzZP+zlywj5UVtc5b6wlwxLme0SEF
 t16ze3ZWML0D5LfKVWh5U/wQ1vVxvmEVyEbwapVPDjlsAV6R80M4bcFRSgCauZ37Wkhe
 G2aXkZSKH4wjwfZISDUyMq7P6v0JQiON0625WC2uWQ7quPhvonE6lWmz6+DjMBOXA8ZW
 ku4eTvSUQlBeYMepuP5CjktquinKCmoVU5Fw3klkG7F/Irdkbh5OM8bhiW1Rr+YUycxT
 ciIsKGsB1IOeHt5uDujErQzd6h5twoMJtf4x6WM+Dg1v5472snJ6l2tYa/1YIrXYe2lE
 SzSQ==
X-Gm-Message-State: AOAM531QlNnpe2zTyrH/Nr2pd8ozL6bx8J0/xfR92DVJB4slpzBQtQo8
 UvyvN6w3nG8MUD1DyAF7FiDPxA==
X-Google-Smtp-Source: ABdhPJwjQ+FRxQ8lDQ2PQXz09+nxCf+KNGQm9yKKam6j6dof3uJeaiKbx/K+CvK9gV2xldV3lz7ePg==
X-Received: by 2002:a17:90b:1b0e:: with SMTP id
 nu14mr9017838pjb.44.1644748482473; 
 Sun, 13 Feb 2022 02:34:42 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3653:bf18:8571:5f26])
 by smtp.gmail.com with ESMTPSA id n85sm1589407pfd.142.2022.02.13.02.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 02:34:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v7 1/4] drm/bridge: anx7625: send DPCD command to downstream
Date: Sun, 13 Feb 2022 18:34:34 +0800
Message-Id: <20220213103437.3363848-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xin Ji <xji@analogixsemi.com>

Send DPCD command to downstream before anx7625 power down,
let downstream monitor enter into standby mode.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v3->v4:
Use common DP_AUX_NATIVE_READ/WRITE

Previously in:
https://patchwork.kernel.org/project/dri-devel/patch/1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com/
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 42 +++++++++++++++++++----
 drivers/gpu/drm/bridge/analogix/anx7625.h |  2 --
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 76662fce4ce61d..17b23940549a42 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -129,6 +129,23 @@ static int anx7625_reg_write(struct anx7625_data *ctx,
 	return ret;
 }
 
+static int anx7625_reg_block_write(struct anx7625_data *ctx,
+				   struct i2c_client *client,
+				   u8 reg_addr, u8 len, u8 *buf)
+{
+	int ret;
+	struct device *dev = &client->dev;
+
+	i2c_access_workaround(ctx, client);
+
+	ret = i2c_smbus_write_i2c_block_data(client, reg_addr, len, buf);
+	if (ret < 0)
+		dev_err(dev, "write i2c block failed id=%x\n:%x",
+			client->addr, reg_addr);
+
+	return ret;
+}
+
 static int anx7625_write_or(struct anx7625_data *ctx,
 			    struct i2c_client *client,
 			    u8 offset, u8 mask)
@@ -214,8 +231,8 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return 0;
 }
 
-static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
-				 u32 address, u8 len, u8 *buf)
+static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
+				  u32 address, u8 len, u8 *buf)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
@@ -231,8 +248,7 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 	addrm = (address >> 8) & 0xFF;
 	addrh = (address >> 16) & 0xFF;
 
-	cmd = DPCD_CMD(len, DPCD_READ);
-	cmd = ((len - 1) << 4) | 0x09;
+	cmd = DPCD_CMD(len, op);
 
 	/* Set command and length */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -246,6 +262,9 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
 				 AP_AUX_ADDR_19_16, addrh);
 
+	if (op == DP_AUX_NATIVE_WRITE)
+		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
+					       AP_AUX_BUFF_START, len, buf);
 	/* Enable aux access */
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
 				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
@@ -255,14 +274,17 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 		return -EIO;
 	}
 
-	usleep_range(2000, 2100);
-
 	ret = wait_aux_op_finish(ctx);
 	if (ret) {
 		dev_err(dev, "aux IO error: wait aux op finish.\n");
 		return ret;
 	}
 
+	/* Write done */
+	if (op == DP_AUX_NATIVE_WRITE)
+		return 0;
+
+	/* Read done, read out dpcd data */
 	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
 				     AP_AUX_BUFF_START, len, buf);
 	if (ret < 0) {
@@ -845,7 +867,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	anx7625_aux_dpcd_read(ctx, 0x68028, 1, &bcap);
+	anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_READ, 0x68028, 1, &bcap);
 	if (!(bcap & 0x01)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
@@ -918,6 +940,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
+	u8 data;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
 
@@ -929,6 +952,11 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
 
 	ret |= anx7625_video_mute_control(ctx, 1);
+
+	dev_dbg(dev, "notify downstream enter into standby\n");
+	/* Downstream monitor enter into standby mode */
+	data = 2;
+	ret |= anx7625_aux_dpcd_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 56165f5b254c14..64a8ab56529404 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -242,8 +242,6 @@
 
 #define AP_AUX_COMMAND	0x27  /* com+len */
 #define LENGTH_SHIFT	4
-#define DPCD_READ	0x09
-#define DPCD_WRITE	0x08
 #define DPCD_CMD(len, cmd)	((((len) - 1) << LENGTH_SHIFT) | (cmd))
 
 /* Bit 0&1: 3D video structure */
-- 
2.35.1.265.g69c8d7142f-goog

