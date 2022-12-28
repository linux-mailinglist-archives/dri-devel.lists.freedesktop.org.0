Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F4A6571C0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D76C10E36F;
	Wed, 28 Dec 2022 01:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145E10E177
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hx2zdSTlHmxb+hbHjQrVPjtZGZHukfcKpLvqATtqWSw=;
 b=OYftnWezzKGybBlpnzlOPscUrntDvVPf2IWJywAbhGcpjPDQ9KmlHfwibqGU0zOXVqq6vc
 2QLLDX9IrqPKJ4C6wbBQAGnJIeAUqNGDbtAyt7oNgJhe79WA87kb1ltKYFwfqPYqGHbBM2
 OnjNT403hfdCWdgrT6i0VJ4MwgA/3CQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-HiZzTcGVOVusFPkpNvCTYg-1; Tue, 27 Dec 2022 20:48:10 -0500
X-MC-Unique: HiZzTcGVOVusFPkpNvCTYg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so10363305wmq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hx2zdSTlHmxb+hbHjQrVPjtZGZHukfcKpLvqATtqWSw=;
 b=PCxXp+S5Xgetu7H/TYzPLTmV00lKB1nQArB9MzFFvSZqjtrZpD8SymTfQ5uQO+y02w
 aC0VBH5mozqiPoDS8imw/1vBBJtooo/2e4wKTj4Ovyr+RmBH1wMdXpSbQqFlZlics/Ca
 jltQLFLKVykJ/ftsy9cvC7b6mS2/UNt8tB13Y13Tq49gG+GpVzgi371oK2qpXCbqUToc
 +AW5xig1wuMse+HwMIP0yCcsVKCojT5Y7aDVRsVIuz616l6MrtUJrlUezRV4h21Xh5/C
 IEGY+EXUBycC5kHtWMzSFaiCdyoNyDlU9XEtdetGGsNteQOHURqsVInNpJORoZdd+htZ
 WOcg==
X-Gm-Message-State: AFqh2kqWXudwIngC4CKPkfPqgmpbHXzEBYfJoye0vpX8GlOTEywXLji9
 KFDToNRuNGBcAaZ7Cd4K2Y1s56+gQ13rzROeQi7bvMXjDzZfRhu3h3w2DNHzY+wubAB8TxNPo7K
 Or2ZhY0nM1PNTB0JEw0E9VUsE4mgM
X-Received: by 2002:a05:600c:a51:b0:3d3:513c:240b with SMTP id
 c17-20020a05600c0a5100b003d3513c240bmr16354525wmq.7.1672192089298; 
 Tue, 27 Dec 2022 17:48:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTlRSdaGC3QhI/Azugg4WEuCuUG6bFFOv0Xr58DZtcrjSJCaH8fun4gBbvPnjQqnosKq5JBA==
X-Received: by 2002:a05:600c:a51:b0:3d3:513c:240b with SMTP id
 c17-20020a05600c0a5100b003d3513c240bmr16354518wmq.7.1672192089015; 
 Tue, 27 Dec 2022 17:48:09 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:08 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] drm/panel-sitronix-st7703: Drop custom DSI write macros
Date: Wed, 28 Dec 2022 02:47:46 +0100
Message-Id: <20221228014757.3170486-4-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228014757.3170486-1-javierm@redhat.com>
References: <20221228014757.3170486-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are macros for these already in the <drm/drm_mipi_dsi.h> header, use
that instead and delete the custom DSI write macros defined in the driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 83 ++++++++-----------
 1 file changed, 33 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 86a472b01360..3e6655c2727e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -73,14 +73,6 @@ static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
 	return container_of(panel, struct st7703, panel);
 }
 
-#define dsi_generic_write_seq(dsi, seq...) do {				\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
 static int jh057n_init_sequence(struct st7703 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -90,27 +82,27 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 	 * resemble the ST7703 but the number of parameters often don't match
 	 * so it's likely a clone.
 	 */
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETEXTC,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETEXTC,
 			      0xF1, 0x12, 0x83);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETRGBIF,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETRGBIF,
 			      0x10, 0x10, 0x05, 0x05, 0x03, 0xFF, 0x00, 0x00,
 			      0x00, 0x00);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETSCR,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETSCR,
 			      0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
 			      0x00);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETDISP, 0xF0, 0x12, 0x30);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETEQ,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETDISP, 0xF0, 0x12, 0x30);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETEQ,
 			      0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
 			      0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETBGP, 0x08, 0x08);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETBGP, 0x08, 0x08);
 	msleep(20);
 
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETVCOM, 0x3F, 0x3F);
-	dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP1,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETVCOM, 0x3F, 0x3F);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP1,
 			      0x82, 0x10, 0x06, 0x05, 0x9E, 0x0A, 0xA5, 0x12,
 			      0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
 			      0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
@@ -119,7 +111,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 			      0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
 			      0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP2,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP2,
 			      0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
 			      0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
@@ -128,7 +120,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x0A,
 			      0xA5, 0x00, 0x00, 0x00, 0x00);
-	dsi_generic_write_seq(dsi, ST7703_CMD_SETGAMMA,
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_SETGAMMA,
 			      0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41, 0x37,
 			      0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10, 0x11,
 			      0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
@@ -162,15 +154,6 @@ static const struct st7703_panel_desc jh057n00900_panel_desc = {
 	.init_sequence = jh057n_init_sequence,
 };
 
-#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
-		static const u8 d[] = { seq };				\
-		int ret;						\
-		ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
-		if (ret < 0)						\
-			return ret;					\
-	} while (0)
-
-
 static int xbd599_init_sequence(struct st7703 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
@@ -180,9 +163,9 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 	 */
 
 	/* Magic sequence to unlock user commands below. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xF1, 0x12, 0x83);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xF1, 0x12, 0x83);
 
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
 			  0x33, /* VC_main = 0, Lane_Number = 3 (4 lanes) */
 			  0x81, /* DSI_LDO_SEL = 1.7V, RTERM = 90 Ohm */
 			  0x05, /* IHSRX = x6 (Low High Speed driving ability) */
@@ -194,14 +177,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0x44, 0x25, 0x00, 0x91, 0x0a, 0x00, 0x00, 0x02,
 			  0x4F, 0x11, 0x00, 0x00, 0x37);
 
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
 			  0x25, /* PCCS = 2, ECP_DC_DIV = 1/4 HSYNC */
 			  0x22, /* DT = 15ms XDK_ECP = x2 */
 			  0x20, /* PFM_DC_DIV = /1 */
 			  0x03  /* ECP_SYNC_EN = 1, VGX_SYNC_EN = 1 */);
 
 	/* RGB I/F porch timing */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
 			  0x10, /* VBP_RGB_GEN */
 			  0x10, /* VFP_RGB_GEN */
 			  0x05, /* DE_BP_RGB_GEN */
@@ -212,7 +195,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0x00, 0x00);
 
 	/* Source driving settings. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
 			  0x73, /* N_POPON */
 			  0x73, /* N_NOPON */
 			  0x50, /* I_POPON */
@@ -224,19 +207,19 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0x00  /* Undocumented */);
 
 	/* NVDDD_SEL = -1.8V, VDDD_SEL = out of range (possibly 1.9V?) */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
 
 	/*
 	 * SS_PANEL = 1 (reverse scan), GS_PANEL = 0 (normal scan)
 	 * REV_PANEL = 1 (normally black panel), BGR_PANEL = 1 (BGR)
 	 */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
 
 	/* Zig-Zag Type C column inversion. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
 
 	/* Set display resolution. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP,
 			  0xF0, /* NL = 240 */
 			  0x12, /* RES_V_LSB = 0, BLK_CON = VSSD,
 				 * RESO_SEL = 720RGB
@@ -246,7 +229,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 				 * ISC = 0 frames
 				 */);
 
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
 			  0x00, /* PNOEQ */
 			  0x00, /* NNOEQ */
 			  0x0B, /* PEQGND */
@@ -267,9 +250,9 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 				 */);
 
 	/* Undocumented command. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
 
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
 			  0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
 			  0x00, /* FBOFF_VGH = 0, FBOFF_VGL = 0 */
 			  0x32, /* VRP  */
@@ -287,20 +270,20 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0x77  /* VGH3_R_DIV, VGL3_R_DIV (4.5MHz) */);
 
 	/* Reference voltage. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
 			  0x07, /* VREF_SEL = 4.2V */
 			  0x07  /* NVREF_SEL = 4.2V */);
 	msleep(20);
 
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
 			  0x2C, /* VCOMDC_F = -0.67V */
 			  0x2C  /* VCOMDC_B = -0.67V */);
 
 	/* Undocumented command. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
 
 	/* This command is to set forward GIP timing. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
 			  0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
 			  0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
 			  0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
@@ -311,7 +294,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
 
 	/* This command is to set backward GIP timing. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
 			  0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			  0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
 			  0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
@@ -322,7 +305,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 			  0xA5, 0x00, 0x00, 0x00, 0x00);
 
 	/* Adjust the gamma characteristics of the panel. */
-	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
 			  0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
 			  0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
 			  0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
@@ -499,7 +482,7 @@ static int allpixelson_set(void *data, u64 val)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 
 	dev_dbg(ctx->dev, "Setting all pixels on\n");
-	dsi_generic_write_seq(dsi, ST7703_CMD_ALL_PIXEL_ON);
+	mipi_dsi_generic_write_seq(dsi, ST7703_CMD_ALL_PIXEL_ON);
 	msleep(val * 1000);
 	/* Reset the panel to get video back */
 	drm_panel_disable(&ctx->panel);
-- 
2.38.1

