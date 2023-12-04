Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC794803DD0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4A10E3D5;
	Mon,  4 Dec 2023 18:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94D710E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:31 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-58d956c8c38so3271364eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716251; x=1702321051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svxrBUYgJ0pWsSlZKx2SnLjAB73oIJwHn31LgzYgCrU=;
 b=gI7YXjhB6NISopuBuDJ68ELauSIto3JtchtHr2CeYefhGaqP656T+vD5k0Br8jwXGX
 3o6tgtCFM2PVSaTqlRAZgRGX6GzTNhw4pHIzLzfgMRwdGvb4jzZiTqLrygbAHtDhURtv
 GaCuRYD42LkwDtt/4MQJk+TMY70cVL9X8aY0RMh9juquB3umX6WRKKclISo8S3tndLZY
 +eXK4P8dRR26fGCQzkXj08TOR+5bKQkyTBlvYmWte5RC3XGxhpoQx/4KmWHqyvx4tp2f
 gnXcWSm/LbuOck/VOkA/iQYnMg7iWPkKGDtmV+HIGLPMLUhsOAqdF24+SQl7Z9pvaIvr
 9FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716251; x=1702321051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svxrBUYgJ0pWsSlZKx2SnLjAB73oIJwHn31LgzYgCrU=;
 b=E1mO3C5MQXKgcjo+ZkO/37GF7RjX9eRZPaaLkHA5pXLVGct62S/9nHjkr1x4dLI7I1
 EM3OjN3f4nkBxIR0WnMx2B6Swsxiq6dF+5/MqYt8W+V86hF8JgtKYY1oSl9FPxzP2S40
 z35MKQKSltN3zZLdii+IryEaA0utMKkGsFOXhgvpV6cxp1tkYrsLjV4owjzThu1QUY2V
 Lr1yoyrQ1eBeaj4XrOMiml/L4Nwvmcy2eAUYCxd806dM821kEQEDyzJPQkhzvW1XhV0X
 jR4Ef/ZB7ZkkVnnuV4hXOc2pgCKFHdtlLo+4c8eddZCh+hlOx3jAQCv5pQQE+iugsU9n
 FhJQ==
X-Gm-Message-State: AOJu0Yy1fIkvcd+ZKYYHAtxbW9dmAJkY+bQKfanLAPA5RuHqQrEcI7Wi
 2y6owfnnVbBLlsYikscwjic=
X-Google-Smtp-Source: AGHT+IGEIhJblF/brPZ4laIvhQPmmJRnzMkfdI0n/UWt0O+eSC78Ck45Zi7/3yCHiuh0410fNF7X8A==
X-Received: by 2002:a05:6820:2208:b0:58e:2e05:d99e with SMTP id
 cj8-20020a056820220800b0058e2e05d99emr3148579oob.9.1701716250869; 
 Mon, 04 Dec 2023 10:57:30 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:30 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 06/10] drm/panel: himax-hx8394: Add Support for Powkiddy
 X55 panel
Date: Mon,  4 Dec 2023 12:57:15 -0600
Message-Id: <20231204185719.569021-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy X55 panel as used on the Powkiddy X55
handheld gaming console. This panel uses a Himax HX8394 display
controller and requires a vendor provided init sequence. The display
resolution is 720x1280 and is 67mm by 121mm as measured with calipers.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index b68ea09f4725..ff0dc08b9829 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -38,6 +38,7 @@
 #define HX8394_CMD_SETMIPI	  0xba
 #define HX8394_CMD_SETOTP	  0xbb
 #define HX8394_CMD_SETREGBANK	  0xbd
+#define HX8394_CMD_UNKNOWN5	  0xbf
 #define HX8394_CMD_UNKNOWN1	  0xc0
 #define HX8394_CMD_SETDGCLUT	  0xc1
 #define HX8394_CMD_SETID	  0xc3
@@ -52,6 +53,7 @@
 #define HX8394_CMD_SETGIP1	  0xd5
 #define HX8394_CMD_SETGIP2	  0xd6
 #define HX8394_CMD_SETGPO	  0xd6
+#define HX8394_CMD_UNKNOWN4	  0xd8
 #define HX8394_CMD_SETSCALING	  0xdd
 #define HX8394_CMD_SETIDLE	  0xdf
 #define HX8394_CMD_SETGAMMA	  0xe0
@@ -203,6 +205,140 @@ static const struct hx8394_panel_desc hsd060bhw4_desc = {
 	.init_sequence = hsd060bhw4_init_sequence,
 };
 
+static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
+			       0xff, 0x83, 0x94);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
+			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
+			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
+			       0x00, 0x80, 0x64, 0x2c, 0x16, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
+			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
+			       0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
+			       0x86);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
+			       0x6e, 0x6e);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
+			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
+			       0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
+			       0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+			       0x07, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
+			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+			       0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
+			       0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
+			       0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
+			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
+			       0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
+			       0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
+			       0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
+			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
+			       0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
+			       0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
+			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
+			       0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
+			       0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
+			       0x1f, 0x31);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
+			       0x0b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
+			       0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x02);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
+			       0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
+			       0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
+			       0xed);
+
+	return 0;
+}
+
+static const struct drm_display_mode powkiddy_x55_mode = {
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 44,
+	.hsync_end	= 720 + 44 + 20,
+	.htotal		= 720 + 44 + 20 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 12,
+	.vsync_end	= 1280 + 12 + 10,
+	.vtotal		= 1280 + 12 + 10 + 10,
+	.clock		= 63290,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 67,
+	.height_mm	= 121,
+};
+
+static const struct hx8394_panel_desc powkiddy_x55_desc = {
+	.mode = &powkiddy_x55_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = powkiddy_x55_init_sequence,
+};
+
 static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
@@ -419,6 +555,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id hx8394_of_match[] = {
 	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
+	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx8394_of_match);
-- 
2.34.1

