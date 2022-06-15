Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E254CB07
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F354C10FD38;
	Wed, 15 Jun 2022 14:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96F110FD18
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 14:17:15 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-fe15832ce5so16638806fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHVTFEOci2eUcOzV7CwWvOhg3Cpxw3vHk3+96vsZXxo=;
 b=LUkMJGRtVXbuTvn/KXWZGOUpvpVYrbjYD2T0PKoU23d+JoFr5tvdHckCAOd2qs1w5z
 jzN2OW+atXPRf2C4rlvFc/+95uHdt6XXMgAqMdDZLQO/w9GFksvjDnTQHn2pjs28eIWU
 Rc2qIhj5DXyn1gIaFMomI5Sw00FhOVfcE0kACqe3eofn1wPFfbZlAY2NW0vlx6coTq5R
 Nr1BfHoyV8o5SI3DGRNoeajta5calJ++/jhO30JRgNsYQtcXl3sd+PNbxYJyyQTHiApV
 R9yYGRj6lksXlXRGqwcZx6Nx6sf9rPn1NoPkziGIgWqllfr5n6A0jVTApcRdic6Kk7y5
 kxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHVTFEOci2eUcOzV7CwWvOhg3Cpxw3vHk3+96vsZXxo=;
 b=t9j/IJj2AnrIvFGc/UfRMQ0O/PwW3QRGPOnWmGFeDYZ+iJc7OWB1HVT9NlAxQ8pd45
 fCDNTMKOkIsTOvq1KIgJQQNZvJywVQu0y3Xala1MWl6UcyU0IIJ/5t50jg3Nl9oFEKdZ
 PXCnZoV3WwvhZCYwledml0+37JjI8qSf1G/GlrKpeRKn4Czf0wVGt27KM6uzhekEfbm3
 UOX4gV7T26Mct/AxVpT6i70o069TtrJN+xM+yppip9X8R1MGX9Cily45q+7NIxY/Bwyp
 YBNONyDueGTHFhbKgYIBXBRFjClXjTpoEBPagwV1PVCeP50qQkJt9oNpYZvWurHh4nCF
 jxZQ==
X-Gm-Message-State: AJIora8aynUxnuVgVG4R41ErutFFH7ISJZVbVne/K6GLqm1QmibAjS/R
 j3KxCfz9n4cS8wWGP/Nq2gniJnA/aQ6J0/bu
X-Google-Smtp-Source: AGRyM1vkGlNqdHUCCUITFoQjnSiltmhymDMXhlS3esol+CSnOTj2jkyVaFbx9cDagsfRAAgC64QiUg==
X-Received: by 2002:a05:6870:796:b0:da:3d6a:101d with SMTP id
 en22-20020a056870079600b000da3d6a101dmr5488414oab.20.1655302634439; 
 Wed, 15 Jun 2022 07:17:14 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a9d7f03000000b0060b069325f2sm6091798otq.63.2022.06.15.07.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 07:17:13 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm: selftest: refactor drm_cmdline_parser
Date: Wed, 15 Jun 2022 11:16:44 -0300
Message-Id: <20220615141644.19076-1-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615135824.15522-2-maira.canal@usp.br>
References: <20220615135824.15522-2-maira.canal@usp.br>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 Arthur Grillo <arthur.grillo@usp.br>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arthur Grillo <arthur.grillo@usp.br>

Refactor the tests by modularizing the functions to avoid code repetition.

Co-developed-by: Maíra Canal <maira.canal@usp.br>
Signed-off-by: Arthur Grillo <arthur.grillo@usp.br>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 .../drm/selftests/test-drm_cmdline_parser.c   | 579 +++++-------------
 1 file changed, 156 insertions(+), 423 deletions(-)

diff --git a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
index d96cd890def6..57a229c5fc35 100644
--- a/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
+++ b/drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2019 Bootlin
+ * Copyright (c) 2021 Ma�ra Canal <maira.canal@usp.br>,
+ * Copyright (c) 2021 Arthur Grillo <arthur.grillo@usp.br>
  */
 
 #define pr_fmt(fmt) "drm_cmdline: " fmt
@@ -17,13 +19,25 @@
 
 static const struct drm_connector no_connector = {};
 
-static int drm_cmdline_test_force_e_only(void *ignored)
+static int drm_cmdline_test_properties(void *ignored,
+		struct drm_cmdline_mode *mode, enum drm_connector_force force)
+{
+	FAIL_ON(mode->rb);
+	FAIL_ON(mode->cvt);
+	FAIL_ON(mode->interlace);
+	FAIL_ON(mode->margins);
+	FAIL_ON(mode->force != force);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_only(void *ignored, char *cmdline,
+		const struct drm_connector *connector, enum drm_connector_force force)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("e",
-							   &no_connector,
-							   &mode));
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   connector, &mode));
 	FAIL_ON(mode.specified);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
@@ -32,95 +46,101 @@ static int drm_cmdline_test_force_e_only(void *ignored)
 	FAIL_ON(mode.cvt);
 	FAIL_ON(mode.interlace);
 	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	FAIL_ON(mode.force != force);
 
 	return 0;
 }
 
-static int drm_cmdline_test_force_D_only_not_digital(void *ignored)
+static int drm_cmdline_test_freestanding(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline,
+		const struct drm_connector *connector)
 {
-	struct drm_cmdline_mode mode = { };
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   connector, mode));
+	FAIL_ON(mode->specified);
+	FAIL_ON(mode->refresh_specified);
+	FAIL_ON(mode->bpp_specified);
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	FAIL_ON(mode->tv_margins.right != 14);
+	FAIL_ON(mode->tv_margins.left != 24);
+	FAIL_ON(mode->tv_margins.bottom != 36);
+	FAIL_ON(mode->tv_margins.top != 42);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	return 0;
+}
+
+static int drm_cmdline_test_res_init(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline)
+{
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   &no_connector, mode));
+	FAIL_ON(!mode->specified);
+	FAIL_ON(mode->xres != 720);
+	FAIL_ON(mode->yres != 480);
+
+	return 0;
+}
+
+static int drm_cmdline_test_res_bpp_init(void *ignored,
+		struct drm_cmdline_mode *mode, char *cmdline)
+{
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(cmdline,
+							   &no_connector, mode));
+	FAIL_ON(!mode->specified);
+	FAIL_ON(mode->xres != 720);
+	FAIL_ON(mode->yres != 480);
+
+	FAIL_ON(!mode->refresh_specified);
+	FAIL_ON(mode->refresh != 60);
+	FAIL_ON(!mode->bpp_specified);
+	FAIL_ON(mode->bpp != 24);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_e_only(void *ignored)
+{
+	drm_cmdline_test_force_only(ignored, "e", &no_connector, DRM_FORCE_ON);
+
+	return 0;
+}
+
+static int drm_cmdline_test_force_D_only_not_digital(void *ignored)
+{
+	drm_cmdline_test_force_only(ignored, "D", &no_connector, DRM_FORCE_ON);
 
 	return 0;
 }
 
 static const struct drm_connector connector_hdmi = {
 	.connector_type	= DRM_MODE_CONNECTOR_HDMIB,
+
 };
 
 static int drm_cmdline_test_force_D_only_hdmi(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &connector_hdmi,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_force_only(ignored, "D", &connector_hdmi,
+			DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
 
 static const struct drm_connector connector_dvi = {
 	.connector_type	= DRM_MODE_CONNECTOR_DVII,
+
 };
 
 static int drm_cmdline_test_force_D_only_dvi(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("D",
-							   &connector_dvi,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_force_only(ignored, "D", &connector_dvi,
+			DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
 
 static int drm_cmdline_test_force_d_only(void *ignored)
 {
-	struct drm_cmdline_mode mode = { };
-
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("d",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_OFF);
+	drm_cmdline_test_force_only(ignored, "d", &no_connector, DRM_FORCE_OFF);
 
 	return 0;
 }
@@ -151,15 +171,9 @@ static int drm_cmdline_test_res(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -219,15 +233,9 @@ static int drm_cmdline_test_res_vesa(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480M",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480M");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -243,15 +251,9 @@ static int drm_cmdline_test_res_vesa_rblank(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480MR",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480MR");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(!mode.rb);
@@ -267,15 +269,9 @@ static int drm_cmdline_test_res_rblank(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480R",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480R");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(!mode.rb);
@@ -291,23 +287,13 @@ static int drm_cmdline_test_res_bpp(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480-24");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -327,23 +313,13 @@ static int drm_cmdline_test_res_refresh(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480@60",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480@60");
 
 	FAIL_ON(!mode.refresh_specified);
 	FAIL_ON(mode.refresh != 60);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -363,24 +339,8 @@ static int drm_cmdline_test_res_bpp_refresh(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -389,18 +349,7 @@ static int drm_cmdline_test_res_bpp_refresh_interlaced(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60i",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60i");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -415,18 +364,7 @@ static int drm_cmdline_test_res_bpp_refresh_margins(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60m",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60m");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -441,24 +379,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_off(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60d",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_OFF);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60d");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_OFF);
 
 	return 0;
 }
@@ -478,24 +400,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_on(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60e",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60e");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -504,24 +410,8 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_analog(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60D",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60D");
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -534,8 +424,7 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_digital(void *ignored)
 	};
 
 	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60D",
-							   &connector,
-							   &mode));
+							   &connector, &mode));
 	FAIL_ON(!mode.specified);
 	FAIL_ON(mode.xres != 720);
 	FAIL_ON(mode.yres != 480);
@@ -546,11 +435,7 @@ static int drm_cmdline_test_res_bpp_refresh_force_on_digital(void *ignored)
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON_DIGITAL);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON_DIGITAL);
 
 	return 0;
 }
@@ -559,18 +444,7 @@ static int drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on(void *ig
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24@60ime",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-
-	FAIL_ON(!mode.refresh_specified);
-	FAIL_ON(mode.refresh != 60);
-
-	FAIL_ON(!mode.bpp_specified);
-	FAIL_ON(mode.bpp != 24);
+	drm_cmdline_test_res_bpp_init(ignored, &mode, "720x480-24@60ime");
 
 	FAIL_ON(mode.rb);
 	FAIL_ON(mode.cvt);
@@ -585,15 +459,9 @@ static int drm_cmdline_test_res_margins_force_on(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480me",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480me");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -609,15 +477,9 @@ static int drm_cmdline_test_res_vesa_margins(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480Mm",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480Mm");
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
 	FAIL_ON(mode.rb);
@@ -673,10 +535,9 @@ static int drm_cmdline_test_name_bpp(void *ignored)
 							   &no_connector,
 							   &mode));
 	FAIL_ON(strcmp(mode.name, "NTSC"));
-
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
+
 	FAIL_ON(mode.bpp != 24);
 
 	return 0;
@@ -760,23 +621,13 @@ static int drm_cmdline_test_rotate_0(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=0",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_0);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=0");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_0);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -785,23 +636,13 @@ static int drm_cmdline_test_rotate_90(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=90",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_90);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=90");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_90);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -810,23 +651,13 @@ static int drm_cmdline_test_rotate_180(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -835,23 +666,13 @@ static int drm_cmdline_test_rotate_270(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=270",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_270);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=270");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_270);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -860,9 +681,8 @@ static int drm_cmdline_test_rotate_multiple(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=0,rotate=90",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=0,rotate=90", &no_connector, &mode));
 
 	return 0;
 }
@@ -871,9 +691,8 @@ static int drm_cmdline_test_rotate_invalid_val(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=42",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=42", &no_connector, &mode));
 
 	return 0;
 }
@@ -882,9 +701,8 @@ static int drm_cmdline_test_rotate_truncated(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,rotate=",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,rotate=", &no_connector, &mode));
 
 	return 0;
 }
@@ -893,23 +711,13 @@ static int drm_cmdline_test_hmirror(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,reflect_x",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,reflect_x");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -918,23 +726,13 @@ static int drm_cmdline_test_vmirror(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,reflect_y",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,reflect_y");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -943,26 +741,18 @@ static int drm_cmdline_test_margin_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
+	drm_cmdline_test_res_init(ignored, &mode,
+			"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42");
+
 	FAIL_ON(mode.tv_margins.right != 14);
 	FAIL_ON(mode.tv_margins.left != 24);
 	FAIL_ON(mode.tv_margins.bottom != 36);
 	FAIL_ON(mode.tv_margins.top != 42);
 
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -971,23 +761,13 @@ static int drm_cmdline_test_multiple_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480,rotate=270,reflect_x",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X));
+	drm_cmdline_test_res_init(ignored, &mode, "720x480,rotate=270,reflect_x");
 
+	FAIL_ON(mode.rotation_reflection != (DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X));
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -996,9 +776,8 @@ static int drm_cmdline_test_invalid_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(drm_mode_parse_command_line_for_connector("720x480,test=42",
-							  &no_connector,
-							  &mode));
+	FAIL_ON(drm_mode_parse_command_line_for_connector(
+				"720x480,test=42", &no_connector, &mode));
 
 	return 0;
 }
@@ -1007,24 +786,14 @@ static int drm_cmdline_test_bpp_extra_and_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480-24e,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480-24e,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
-
 	FAIL_ON(!mode.bpp_specified);
 	FAIL_ON(mode.bpp != 24);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1033,22 +802,13 @@ static int drm_cmdline_test_extra_and_option(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("720x480e,rotate=180",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(!mode.specified);
-	FAIL_ON(mode.xres != 720);
-	FAIL_ON(mode.yres != 480);
-	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
+	drm_cmdline_test_res_init(ignored, &mode, "720x480e,rotate=180");
 
+	FAIL_ON(mode.rotation_reflection != DRM_MODE_ROTATE_180);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1057,23 +817,11 @@ static int drm_cmdline_test_freestanding_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	drm_cmdline_test_freestanding(ignored, &mode,
+			"margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
+			&no_connector);
 
-	FAIL_ON(mode.tv_margins.right != 14);
-	FAIL_ON(mode.tv_margins.left != 24);
-	FAIL_ON(mode.tv_margins.bottom != 36);
-	FAIL_ON(mode.tv_margins.top != 42);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
@@ -1082,23 +830,11 @@ static int drm_cmdline_test_freestanding_force_e_and_options(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
-							   &no_connector,
-							   &mode));
-	FAIL_ON(mode.specified);
-	FAIL_ON(mode.refresh_specified);
-	FAIL_ON(mode.bpp_specified);
+	drm_cmdline_test_freestanding(ignored, &mode,
+			"e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42",
+			&no_connector);
 
-	FAIL_ON(mode.tv_margins.right != 14);
-	FAIL_ON(mode.tv_margins.left != 24);
-	FAIL_ON(mode.tv_margins.bottom != 36);
-	FAIL_ON(mode.tv_margins.top != 42);
-
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_ON);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_ON);
 
 	return 0;
 }
@@ -1107,20 +843,17 @@ static int drm_cmdline_test_panel_orientation(void *ignored)
 {
 	struct drm_cmdline_mode mode = { };
 
-	FAIL_ON(!drm_mode_parse_command_line_for_connector("panel_orientation=upside_down",
-							   &no_connector,
-							   &mode));
+	FAIL_ON(!drm_mode_parse_command_line_for_connector(
+				"panel_orientation=upside_down", &no_connector, &mode));
+
 	FAIL_ON(mode.specified);
 	FAIL_ON(mode.refresh_specified);
 	FAIL_ON(mode.bpp_specified);
 
+
 	FAIL_ON(mode.panel_orientation != DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP);
 
-	FAIL_ON(mode.rb);
-	FAIL_ON(mode.cvt);
-	FAIL_ON(mode.interlace);
-	FAIL_ON(mode.margins);
-	FAIL_ON(mode.force != DRM_FORCE_UNSPECIFIED);
+	drm_cmdline_test_properties(ignored, &mode, DRM_FORCE_UNSPECIFIED);
 
 	return 0;
 }
-- 
2.36.1

