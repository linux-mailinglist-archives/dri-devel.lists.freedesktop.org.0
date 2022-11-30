Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03F363DB91
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 18:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC2A10E107;
	Wed, 30 Nov 2022 17:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DC610E107
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 17:08:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 6so16641417pgm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BtB22ckpAeQTvW+2h2vhfpvkHho96FIUyOTjkXi8z4s=;
 b=mNLuBvJPsaKHf2okXvPTyzE7P7jC2dz2zM38h0ssXWF93vRO18bNkEgbK4pb6Q/aRY
 0Cf/H2DxiDMJOrq55Ea28d+DlkItHPqnRNPZdyVpcUgghgc7omeVnNNiQfj3HIkv5CeH
 ZZUZl9K0SrMLiAxNYuLTKm8KFjJOI/ZWfW25Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtB22ckpAeQTvW+2h2vhfpvkHho96FIUyOTjkXi8z4s=;
 b=PyAl5EnVtXiiVsad94UVmkLEz+Xu9LZ1Vp0mwvwJKGgQr6ByCqqtS/bsEZ8VWfJ95n
 z4V7sSxKkx7nhmCoyGgHoDitOITvRbXqu4QuoDDstsoxN7vPqe6PUGfNBw4qt9AGcuaE
 vTkSD3yZFP/sjFFb4Riq2vMyNBr8CXpeLE8JaQyx9RWGlmZIoIF8xgLhHTz7FifGR0tI
 7BncvhsehicV07f3lPOSEIlYLd7RLGXyjlCfeto8QMkTS7tubzK8wd8CgJDn52W/qc1r
 kyhcwh2ixN6wZnrWwHgkFiR2jy5Ic4JHfotigGV2fBPMuxY4FjcXt/mPzOGGZzv1YNlQ
 K2CQ==
X-Gm-Message-State: ANoB5pn+gqxNNjtrVx8Nsa07rg7Rj7U76Dko6tTx/DsMOjCyRKUPzPQe
 S4oMursAMJ0R8sAk62eKN9ALUA==
X-Google-Smtp-Source: AA0mqf49/qbqY4E3emNHvIlO5NfDZ4wHtB9xsvfwRSDeKFr5GX5Fz6byZzDmZIolP1Xj+B0TybrVsg==
X-Received: by 2002:a63:1464:0:b0:46a:f665:ed96 with SMTP id
 36-20020a631464000000b0046af665ed96mr37677681pgu.486.1669828123067; 
 Wed, 30 Nov 2022 09:08:43 -0800 (PST)
Received: from ballway1.c.googlers.com.com
 (97.173.125.34.bc.googleusercontent.com. [34.125.173.97])
 by smtp.gmail.com with ESMTPSA id
 x28-20020aa79a5c000000b0056b8181861esm1707154pfj.19.2022.11.30.09.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 09:08:42 -0800 (PST)
From: Allen Ballway <ballway@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Add orientation quirk for DynaBook K50
Date: Wed, 30 Nov 2022 17:08:22 +0000
Message-Id: <20221130170811.1.Iee9a494547541dade9eeee9521cc8b811e76a8a0@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like the ASUS T100HAN for which there is already a quirk,
the DynaBook K50 has a 800x1280 portrait screen mounted
in the tablet part of a landscape oriented 2-in-1.
Update the quirk to be more generic and apply to this device.

Signed-off-by: Allen Ballway <ballway@chromium.org>
---

 .../gpu/drm/drm_panel_orientation_quirks.c    | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 52d8800a8ab86..14f870fb2db04 100644
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
@@ -121,6 +115,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
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
@@ -151,7 +151,7 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
 		},
-		.driver_data = (void *)&asus_t100ha,
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* Asus T101HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
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
2.38.1.584.g0f3c55d4c2-goog

