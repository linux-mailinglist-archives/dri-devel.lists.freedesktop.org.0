Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3D6EF67C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2683D10E4D8;
	Wed, 26 Apr 2023 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668B510E4BD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:32:28 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6a5ebf9f432so5460551a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682519547; x=1685111547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7dKTPslkvbl866yacFnONC6ojn4tHVdQfSmUuNN064=;
 b=F28ElpvA3YlFibOSpSjJ9TBv7Jk0qAzep5kNk0L+2/h8pnW4HlkwvjR0p4VQEm/dki
 Qd0wnycEgJAMl3rz7o57L/lkyvPJ4TwqkEhgt6HQMkUEjn0r+k65AMKgv6lrV1rlLCAy
 SD03GPu6lLs1Da56HHterPmooA1f1K88jBMopNVNJEOxef0JbsfwkDlDkrcDQOLFnshm
 mNZSRKlY6IN0pOnayD8SYZzrGUiShDf5Z/NI5AIVVrDaGEZT6pl4/MWGyPTGE54hbNrZ
 R/9Wb/Q9N1zBihpZ2CjJ3z4Hki+7x0CW1wOTSOPsso/5cvNp2y7x++L1imyxsUAs8XV+
 shuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682519547; x=1685111547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7dKTPslkvbl866yacFnONC6ojn4tHVdQfSmUuNN064=;
 b=HFqJsediNTZ/iSjSy0FwVQ+tycA8trOmTmzeSX1ix5F4pZp1P47gShO1qmlqZL1xu1
 p10G67wWF+QTkMQeJUTRmvfy37zbZJUOVOsHwy0hm1l8MpKgH+wVSIi0LP9MIcCFyp32
 uWKLy4z9Ng1UJn6syrw5xmLV7qexIvYKDXAYqUUzG3seYUjZqf4r0K5TX9e1T31KZNLA
 vAEoMb4wPS7ZNG0iopfVjskQHCKp7WqRjXfU3KquI6bf6GY6Cppo4XdvX8jPWPaIN1u5
 BzCd+C4wjOGfblPkDrJ9iQSUuWkZkGnA2b2YFSjighZeYXFfrmTuwjkuPIIQPS48wSdq
 /sbw==
X-Gm-Message-State: AAQBX9fjs6F2UvvV+5GXcaXrvZcsR7sJ6bQGJ8GydGssel2azHClj5wu
 5MOro0gLI0VhpetNLqx8B3eJLlZu7LM=
X-Google-Smtp-Source: AKy350aaiQaxCUglw1O/q7pw5yp/5p/sPIhFie8GpiXhAaKPO6H2xp7/yOEBT8TAY7AfQfa8Y6FVHg==
X-Received: by 2002:a05:6830:1d49:b0:6a6:3e09:4ddd with SMTP id
 p9-20020a0568301d4900b006a63e094dddmr8867523oth.2.1682519546826; 
 Wed, 26 Apr 2023 07:32:26 -0700 (PDT)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05683010d200b006a32ba92994sm2613502oto.23.2023.04.26.07.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:32:26 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 3/3] drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support
Date: Wed, 26 Apr 2023 09:32:13 -0500
Message-Id: <20230426143213.4178586-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426143213.4178586-1-macroalpha82@gmail.com>
References: <20230426143213.4178586-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org, sam@ravnborg.org,
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG353V-V2 is a 5 inch panel used in a new revision of the
Anbernic RG353V handheld gaming device. Add support for it.

Unfortunately it appears this controller is not able to support 120hz
or 100hz mode like the first revision panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index fc55b5fbb67f..3aa31f3d6157 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -28,6 +28,7 @@
 /* Manufacturer specific Commands send via DSI */
 #define ST7703_CMD_ALL_PIXEL_OFF 0x22
 #define ST7703_CMD_ALL_PIXEL_ON	 0x23
+#define ST7703_CMD_SETAPID	 0xB1
 #define ST7703_CMD_SETDISP	 0xB2
 #define ST7703_CMD_SETRGBIF	 0xB3
 #define ST7703_CMD_SETCYC	 0xB4
@@ -42,11 +43,14 @@
 #define ST7703_CMD_SETSCR	 0xC0
 #define ST7703_CMD_SETPOWER	 0xC1
 #define ST7703_CMD_SETECO	 0xC6
+#define ST7703_CMD_SETIO	 0xC7
+#define ST7703_CMD_SETCABC	 0xC8
 #define ST7703_CMD_SETPANEL	 0xCC
 #define ST7703_CMD_SETGAMMA	 0xE0
 #define ST7703_CMD_SETEQ	 0xE3
 #define ST7703_CMD_SETGIP1	 0xE9
 #define ST7703_CMD_SETGIP2	 0xEA
+#define ST7703_CMD_UNKNOWN_EF	 0xEF
 
 struct st7703 {
 	struct device *dev;
@@ -337,6 +341,98 @@ static const struct st7703_panel_desc xbd599_desc = {
 	.init_sequence = xbd599_init_sequence,
 };
 
+static int rg353v2_init_sequence(struct st7703 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/*
+	 * Init sequence was supplied by the panel vendor.
+	 */
+
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xf1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETAPID, 0x00, 0x00, 0x00,
+			       0xda, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP, 0x00, 0x13, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF, 0x10, 0x10, 0x28,
+			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
+			       0xf0, 0x63);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
+			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x44, 0x25, 0x00, 0x90, 0x0a,
+			       0x00, 0x00, 0x01, 0x4f, 0x01, 0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x47);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR, 0x73, 0x73, 0x50, 0x50,
+			       0x00, 0x00, 0x12, 0x50, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER, 0x53, 0xc0, 0x32,
+			       0x32, 0x77, 0xe1, 0xdd, 0xdd, 0x77, 0x77, 0x33,
+			       0x33);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x82, 0x00, 0xbf, 0xff,
+			       0x00, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETIO, 0xb8, 0x00, 0x0a, 0x00,
+			       0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCABC, 0x10, 0x40, 0x1e,
+			       0x02);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA, 0x00, 0x07, 0x0d,
+			       0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c, 0x0d,
+			       0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a, 0x00, 0x07,
+			       0x0d, 0x37, 0x35, 0x3f, 0x41, 0x44, 0x06, 0x0c,
+			       0x0d, 0x0f, 0x11, 0x10, 0x12, 0x14, 0x1a);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ, 0x07, 0x07, 0x0b, 0x0b,
+			       0x0b, 0x0b, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00,
+			       0xc0, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1, 0xc8, 0x10, 0x02, 0x00,
+			       0x00, 0xb0, 0xb1, 0x11, 0x31, 0x23, 0x28, 0x80,
+			       0xb0, 0xb1, 0x27, 0x08, 0x00, 0x04, 0x02, 0x00,
+			       0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x00,
+			       0x88, 0x88, 0xba, 0x60, 0x24, 0x08, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x88, 0x88, 0xba, 0x71, 0x35,
+			       0x18, 0x88, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00,
+			       0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2, 0x97, 0x0a, 0x82, 0x02,
+			       0x03, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x81, 0x88, 0xba, 0x17, 0x53, 0x88, 0x88, 0x88,
+			       0x88, 0x88, 0x88, 0x80, 0x88, 0xba, 0x06, 0x42,
+			       0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x23, 0x00,
+			       0x00, 0x02, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+			       0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_EF, 0xff, 0xff, 0x01);
+
+	return 0;
+}
+
+static const struct drm_display_mode rg353v2_mode = {
+	.hdisplay	= 640,
+	.hsync_start	= 640 + 40,
+	.hsync_end	= 640 + 40 + 2,
+	.htotal		= 640 + 40 + 2 + 80,
+	.vdisplay	= 480,
+	.vsync_start	= 480 + 18,
+	.vsync_end	= 480 + 18 + 2,
+	.vtotal		= 480 + 18 + 2 + 28,
+	.clock		= 24150,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 70,
+	.height_mm	= 57,
+};
+
+static const struct st7703_panel_desc rg353v2_desc = {
+	.mode = &rg353v2_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = rg353v2_init_sequence,
+};
+
 static int st7703_enable(struct drm_panel *panel)
 {
 	struct st7703 *ctx = panel_to_st7703(panel);
@@ -597,6 +693,7 @@ static void st7703_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id st7703_of_match[] = {
+	{ .compatible = "anbernic,rg353v-panel-v2", .data = &rg353v2_desc },
 	{ .compatible = "rocktech,jh057n00900", .data = &jh057n00900_panel_desc },
 	{ .compatible = "xingbangda,xbd599", .data = &xbd599_desc },
 	{ /* sentinel */ }
-- 
2.34.1

