Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10863B890F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 21:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99276EA74;
	Wed, 30 Jun 2021 19:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347FF6EA74
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:15:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k10so7018286lfv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QYI5A0skr22d5go9+HHsA0HqVGR/kglHeH98H25Pj5I=;
 b=XE+kPrt7rTO8F6nwJMeZKr3YoB8daJDt3v5qD6s9e43ucOutWIx7o/pQEYTxd/0RUG
 Yl7OExFsdI0bzgsj/YzQm509Y5dDBcbylTQ5NQyAeL6ctC/AjGF7r13h1cJc0rHcEb2c
 zjye9VWSen8i/ulHiv1cxA7XrwnOwawPFuKdua4e9PPW13/gGqBtFsZ7mcGiakjkJC7D
 aOnGNSyCV0UyP7m7HtE4R4XJ8by3gHtW1uAVi7PaSAF5Y73SEaVRIRU/IJcFXhwcNBOO
 jElDbVLZ4wvMSRxszMkiun6WhqgtD0/PyVgazNEYkd46cs3A5G7SwI2/NXAW2OcEEu7u
 CgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QYI5A0skr22d5go9+HHsA0HqVGR/kglHeH98H25Pj5I=;
 b=pUTR4JMAZV07LETWL2E5dlgFF/oCv5MWZxxAvlcL6k9Zwsv8Qu3xZzVPW4msPpabSV
 i6p3SPQ7dCQqWYZXBhdnM225aIzh7vz8QaQjznsuEF7404psqT+lICiiLRfWFpZYpsdr
 NBC1/p8lCx8UXPWLTVXYaK7Q36D2XhJemlR+4YTokax9nwU3Kve03nYkM91y6II4Ifvf
 slG+M4xM8rwVopHJms9F/sfKbgcK6+CRqP8ic81AzXMLps0MdJXF8M7zKWCeGev4QUu/
 LtTAvF2YovZb7NDvkTwTItP1BXvlZgYRGfGdadAJVeFBearC8MuHUsKgds48VwVuuKvV
 bLxQ==
X-Gm-Message-State: AOAM530g9qQwTFepm4rLYsuI/V5qo8OkaFI/795a2GuahlLs32qxtC/3
 Mg8+63k0/olBTy4bYsUkIKK04Q==
X-Google-Smtp-Source: ABdhPJyV5syzNLDoJvoJy8Ah6mfBp/nfL0U2mTrqw3btkwmh8WfCDrUHgV0ji3cJpSW0qogPr5Wmlg==
X-Received: by 2002:a05:6512:2294:: with SMTP id
 f20mr27503582lfu.120.1625080506470; 
 Wed, 30 Jun 2021 12:15:06 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id n6sm2003985lfi.2.2021.06.30.12.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 12:15:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: db7430: Improve error reporting
Date: Wed, 30 Jun 2021 21:13:01 +0200
Message-Id: <20210630191301.3664478-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This creates a macro wrapping mipi_dbi_command() such that we get
some explicit error reporting if something goes wrong.

Cc: Noralf Trønnes <noralf@tronnes.org>
Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 66 +++++++++++---------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index fe58263bd9cd..c42d43ab6a4f 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -90,9 +90,17 @@ static inline struct db7430 *to_db7430(struct drm_panel *panel)
 	return container_of(panel, struct db7430, panel);
 }
 
+#define db7430_command(db, cmd, seq...) \
+({ \
+	struct mipi_dbi *dbi = &db->dbi;	\
+	int ret;				\
+	ret = mipi_dbi_command(dbi, cmd, seq);  \
+	if (ret)							\
+		dev_err(db->dev, "failure in writing command %#02x\n", cmd); \
+})
+
 static int db7430_power_on(struct db7430 *db)
 {
-	struct mipi_dbi *dbi = &db->dbi;
 	int ret;
 
 	/* Power up */
@@ -119,48 +127,48 @@ static int db7430_power_on(struct db7430 *db)
 	 * normal output behaviour is horizontally flipped and BGR ordered. Do
 	 * it twice because the first message doesn't always "take".
 	 */
-	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
-	mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
-	mipi_dbi_command(dbi, DB7430_ACCESS_PROT_OFF, 0x00);
-	mipi_dbi_command(dbi, DB7430_PANEL_DRIVING, 0x28, 0x08);
-	mipi_dbi_command(dbi, DB7430_SOURCE_CONTROL,
+	db7430_command(db, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	db7430_command(db, MIPI_DCS_SET_ADDRESS_MODE, 0x0a);
+	db7430_command(db, DB7430_ACCESS_PROT_OFF, 0x00);
+	db7430_command(db, DB7430_PANEL_DRIVING, 0x28, 0x08);
+	db7430_command(db, DB7430_SOURCE_CONTROL,
 			 0x01, 0x30, 0x15, 0x05, 0x22);
-	mipi_dbi_command(dbi, DB7430_GATE_INTERFACE,
+	db7430_command(db, DB7430_GATE_INTERFACE,
 			 0x10, 0x01, 0x00);
-	mipi_dbi_command(dbi, DB7430_DISPLAY_H_TIMING,
+	db7430_command(db, DB7430_DISPLAY_H_TIMING,
 			 0x06, 0x55, 0x03, 0x07, 0x0b,
 			 0x33, 0x00, 0x01, 0x03);
 	/*
 	 * 0x00 in datasheet 0x01 in vendor code 0x00, it seems 0x01 means
 	 * DE active high and 0x00 means DE active low.
 	 */
-	mipi_dbi_command(dbi, DB7430_RGB_SYNC_OPTION, 0x01);
-	mipi_dbi_command(dbi, DB7430_GAMMA_SET_RED,
+	db7430_command(db, DB7430_RGB_SYNC_OPTION, 0x01);
+	db7430_command(db, DB7430_GAMMA_SET_RED,
 		/* R positive gamma */ 0x00,
 		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
 		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08,
 		/* R negative gamma */ 0x00,
 		0x0A, 0x31, 0x3B, 0x4E, 0x58, 0x59, 0x5B, 0x58, 0x5E, 0x62,
 		0x60, 0x61, 0x5E, 0x62, 0x55, 0x55, 0x7F, 0x08);
-	mipi_dbi_command(dbi, DB7430_GAMMA_SET_GREEN,
+	db7430_command(db, DB7430_GAMMA_SET_GREEN,
 		/* G positive gamma */ 0x00,
 		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
 		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A,
 		/* G negative gamma */ 0x00,
 		0x25, 0x15, 0x28, 0x3D, 0x4A, 0x48, 0x4C, 0x4A, 0x52, 0x59,
 		0x59, 0x5B, 0x56, 0x60, 0x5D, 0x55, 0x7F, 0x0A);
-	mipi_dbi_command(dbi, DB7430_GAMMA_SET_BLUE,
+	db7430_command(db, DB7430_GAMMA_SET_BLUE,
 		/* B positive gamma */ 0x00,
 		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
 		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C,
 		/* B negative gamma */ 0x00,
 		0x48, 0x10, 0x1F, 0x2F, 0x35, 0x38, 0x3D, 0x3C, 0x45, 0x4D,
 		0x4E, 0x52, 0x51, 0x60, 0x7F, 0x7E, 0x7F, 0x0C);
-	mipi_dbi_command(dbi, DB7430_BIAS_CURRENT_CTRL, 0x33, 0x13);
-	mipi_dbi_command(dbi, DB7430_DDV_CTRL, 0x11, 0x00, 0x00);
-	mipi_dbi_command(dbi, DB7430_GAMMA_CTRL_REF, 0x50, 0x50);
-	mipi_dbi_command(dbi, DB7430_DCDC_CTRL, 0x2f, 0x11, 0x1e, 0x46);
-	mipi_dbi_command(dbi, DB7430_VCL_CTRL, 0x11, 0x0a);
+	db7430_command(db, DB7430_BIAS_CURRENT_CTRL, 0x33, 0x13);
+	db7430_command(db, DB7430_DDV_CTRL, 0x11, 0x00, 0x00);
+	db7430_command(db, DB7430_GAMMA_CTRL_REF, 0x50, 0x50);
+	db7430_command(db, DB7430_DCDC_CTRL, 0x2f, 0x11, 0x1e, 0x46);
+	db7430_command(db, DB7430_VCL_CTRL, 0x11, 0x0a);
 
 	return 0;
 }
@@ -181,11 +189,10 @@ static int db7430_unprepare(struct drm_panel *panel)
 static int db7430_disable(struct drm_panel *panel)
 {
 	struct db7430 *db = to_db7430(panel);
-	struct mipi_dbi *dbi = &db->dbi;
 
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_OFF);
+	db7430_command(db, MIPI_DCS_SET_DISPLAY_OFF);
 	msleep(25);
-	mipi_dbi_command(dbi, MIPI_DCS_ENTER_SLEEP_MODE);
+	db7430_command(db, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(120);
 
 	return 0;
@@ -199,26 +206,25 @@ static int db7430_prepare(struct drm_panel *panel)
 static int db7430_enable(struct drm_panel *panel)
 {
 	struct db7430 *db = to_db7430(panel);
-	struct mipi_dbi *dbi = &db->dbi;
 
 	/* Exit sleep mode */
-	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	db7430_command(db, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(20);
 
 	/* NVM (non-volatile memory) load sequence */
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_D4, 0x52, 0x5e);
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_F8, 0x01, 0xf5, 0xf2, 0x71, 0x44);
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_FC, 0x00, 0x08);
+	db7430_command(db, DB7430_UNKNOWN_D4, 0x52, 0x5e);
+	db7430_command(db, DB7430_UNKNOWN_F8, 0x01, 0xf5, 0xf2, 0x71, 0x44);
+	db7430_command(db, DB7430_UNKNOWN_FC, 0x00, 0x08);
 	msleep(150);
 
 	/* CABC turn on sequence (BC = backlight control) */
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_B4, 0x0f, 0x00, 0x50);
-	mipi_dbi_command(dbi, DB7430_USER_SELECT, 0x80);
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_B7, 0x24);
-	mipi_dbi_command(dbi, DB7430_UNKNOWN_B8, 0x01);
+	db7430_command(db, DB7430_UNKNOWN_B4, 0x0f, 0x00, 0x50);
+	db7430_command(db, DB7430_USER_SELECT, 0x80);
+	db7430_command(db, DB7430_UNKNOWN_B7, 0x24);
+	db7430_command(db, DB7430_UNKNOWN_B8, 0x01);
 
 	/* Turn on display */
-	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+	db7430_command(db, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
 }
-- 
2.31.1

