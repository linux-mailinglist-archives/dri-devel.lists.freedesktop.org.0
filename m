Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D562046C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2810E35C;
	Tue,  8 Nov 2022 00:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8110E514
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 18:21:18 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id k22so11408860pfd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FEQi0/+u8veZ/2x0qc40UHF2USFTrhR6G0DysBhXZXI=;
 b=LP8/2nP0rU35VDrVzIm8r3aawUgEGEjeds1NWZ3MKIAXwKbnfYaL61xaLw5DJUjSbP
 t35cImTYyrnWr+QQZzrsULG/iLZqJge9e6vvvQ2RWuTpoXfHUltTAwtQvUALvGiB6sK7
 B6PJ1tc9KlAxIzjLum0d1WdI9VRanVblWEsW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FEQi0/+u8veZ/2x0qc40UHF2USFTrhR6G0DysBhXZXI=;
 b=f3FzMWr//92fqxSpj08jr5m/xsk/OBDHShawTcazb076b6GVymAZW8el+c5w1dC2dq
 kV8lWfH7hz5rfbp/7MxwhPjFkETI1CNlN8c4QR46a1vW5vbLXES0YWfyz4v4wwmU5QI3
 RAOfw5pVOoDqLFT4ze2zPrBo6WjvgqVWYUE2pK2FputKsLwoN0fOsUgTD9cP1rndvTKu
 ptzF5mjjofIdwtv5POe9Nv7739ZWGVrnG5gKBJzKBnKfW8/vhwLE11YXL+aNvn2C3CR3
 h8n7w7KHfTAvSysbWFE6AdHxPiJydtD3xcN8PuT2dN7NBZitUQAu6QiQCLvDoeMn0ozh
 L60Q==
X-Gm-Message-State: ACrzQf0Rg37oEbwu+92Qb+q35DwigvLBddZ4fZ/qSjrGQdmBvtbwreNl
 JnLkD9ltIHoZGaMbYOj5a/qLwg==
X-Google-Smtp-Source: AMsMyM4Kx2Eg71jXuGHQSET20bNsEeHDP4AS5JSlnikAhQBj+uUCLRYCfKMosTwy3XPlQDDxtdB4ZA==
X-Received: by 2002:a05:6a00:234d:b0:561:f0c3:cde1 with SMTP id
 j13-20020a056a00234d00b00561f0c3cde1mr51847397pfj.34.1667845277663; 
 Mon, 07 Nov 2022 10:21:17 -0800 (PST)
Received: from ballway1.c.googlers.com.com
 (97.173.125.34.bc.googleusercontent.com. [34.125.173.97])
 by smtp.gmail.com with ESMTPSA id
 y1-20020aa78f21000000b005613220346asm4749132pfr.205.2022.11.07.10.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 10:21:17 -0800 (PST)
From: Allen Ballway <ballway@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Add orientation quirk for DynaBook K50
Date: Mon,  7 Nov 2022 18:21:06 +0000
Message-Id: <20221107182101.1.I8819de823145ea8234d19c526f933a7d16471835@changeid>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Nov 2022 00:03:28 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel is 800x1280 but mounted on a detachable form factor sidways.

Signed-off-by: Allen Ballway <ballway@chromium.org>
---

 .../gpu/drm/drm_panel_orientation_quirks.c    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index fc1728d46ac2a..8c4b007081730 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -30,12 +30,6 @@ struct drm_dmi_panel_orientation_data {
 	int orientation;
 };

-static const struct drm_dmi_panel_orientation_data asus_t100ha = {
-	.width = 800,
-	.height = 1280,
-	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
-};
-
 static const struct drm_dmi_panel_orientation_data gpd_micropc = {
 	.width = 720,
 	.height = 1280,
@@ -115,6 +109,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };

+static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
+	.width = 800,
+	.height = 1280,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
 	.width = 1600,
 	.height = 2560,
@@ -133,7 +133,7 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
 		},
-		.driver_data = (void *)&asus_t100ha,
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* Asus T101HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
@@ -172,6 +172,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Dynabook K50 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dynabook Inc."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "dynabook K50/FR"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
--
2.38.1.431.g37b22c650d-goog

