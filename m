Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7D5514A4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21D113088;
	Mon, 20 Jun 2022 09:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE215113098
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655718235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eb24tbtfVgrs8K5keyt5OKP5NTF5xSiS6WRwZ2GcOhw=;
 b=D5fsoWevWSLf3aEfVomFdyz/eOy71tm21DRGFPrEt4+KyG4ZEGoNFz9ANoOHvi/H0TRLCU
 tPRhYBHriY1KLOm7XIcgGpGTtWcQKTVOOlBQtEAfafZgtzXqV+/XINiKdlWENn4p5TMhec
 I3ErV6k7porOE0Oado6l2yEI3qgeHbE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-dOrAHEknP0Cx06BD40nXCA-1; Mon, 20 Jun 2022 05:43:52 -0400
X-MC-Unique: dOrAHEknP0Cx06BD40nXCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45F33185A79C;
 Mon, 20 Jun 2022 09:43:52 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B805D4619F5;
 Mon, 20 Jun 2022 09:43:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH 2/2] drm/radeon: Drop CONFIG_BACKLIGHT_CLASS_DEVICE ifdefs
Date: Mon, 20 Jun 2022 11:43:36 +0200
Message-Id: <20220620094336.9633-2-hdegoede@redhat.com>
In-Reply-To: <20220620094336.9633-1-hdegoede@redhat.com>
References: <20220620094336.9633-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_RADEON Kconfig code contains:

	select BACKLIGHT_CLASS_DEVICE

So the condition these ifdefs test for is always true, drop them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/radeon/atombios_encoders.c      | 14 --------------
 drivers/gpu/drm/radeon/radeon_acpi.c            |  2 --
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c | 15 ---------------
 drivers/gpu/drm/radeon/radeon_mode.h            |  4 ----
 4 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index f82577dc25e8..160a309e1048 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -143,8 +143,6 @@ atombios_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 level)
 	}
 }
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 static u8 radeon_atom_bl_level(struct backlight_device *bd)
 {
 	u8 level;
@@ -293,18 +291,6 @@ static void radeon_atom_backlight_exit(struct radeon_encoder *radeon_encoder)
 	}
 }
 
-#else /* !CONFIG_BACKLIGHT_CLASS_DEVICE */
-
-void radeon_atom_backlight_init(struct radeon_encoder *encoder)
-{
-}
-
-static void radeon_atom_backlight_exit(struct radeon_encoder *encoder)
-{
-}
-
-#endif
-
 static bool radeon_atom_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
 				   struct drm_display_mode *adjusted_mode)
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 1baef7b493de..b603c0b77075 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -391,7 +391,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 
 			radeon_set_backlight_level(rdev, enc, req.backlight_level);
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
 			if (rdev->is_atom_bios) {
 				struct radeon_encoder_atom_dig *dig = enc->enc_priv;
 				backlight_force_update(dig->bl_dev,
@@ -401,7 +400,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 				backlight_force_update(dig->bl_dev,
 						       BACKLIGHT_UPDATE_HOTKEY);
 			}
-#endif
 		}
 	}
 	if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index d2180f5c80fa..1d207c76f53e 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -320,8 +320,6 @@ radeon_legacy_set_backlight_level(struct radeon_encoder *radeon_encoder, u8 leve
 	radeon_legacy_lvds_update(&radeon_encoder->base, dpms_mode);
 }
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 static uint8_t radeon_legacy_lvds_level(struct backlight_device *bd)
 {
 	struct radeon_backlight_privdata *pdata = bl_get_data(bd);
@@ -495,19 +493,6 @@ static void radeon_legacy_backlight_exit(struct radeon_encoder *radeon_encoder)
 	}
 }
 
-#else /* !CONFIG_BACKLIGHT_CLASS_DEVICE */
-
-void radeon_legacy_backlight_init(struct radeon_encoder *encoder)
-{
-}
-
-static void radeon_legacy_backlight_exit(struct radeon_encoder *encoder)
-{
-}
-
-#endif
-
-
 static void radeon_lvds_enc_destroy(struct drm_encoder *encoder)
 {
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 3485e7f142e9..b34cffc162e2 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -281,15 +281,11 @@ struct radeon_mode_info {
 
 #define RADEON_MAX_BL_LEVEL 0xFF
 
-#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) || defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
-
 struct radeon_backlight_privdata {
 	struct radeon_encoder *encoder;
 	uint8_t negative;
 };
 
-#endif
-
 #define MAX_H_CODE_TIMING_LEN 32
 #define MAX_V_CODE_TIMING_LEN 32
 
-- 
2.36.0

