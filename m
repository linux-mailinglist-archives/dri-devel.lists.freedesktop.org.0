Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF499151AE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981AB10E2DE;
	Mon, 24 Jun 2024 15:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ixsOEK67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A6910E49C;
 Mon, 24 Jun 2024 15:13:03 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-795524bb6d9so283843985a.0; 
 Mon, 24 Jun 2024 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719241983; x=1719846783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMpMM3VMXw3Pt2FtK4Aaxt1tlk2OfNvq+GBMyg4jRHU=;
 b=ixsOEK67XijY1AZbHq8GTT1GaPdvU5zONNOii0O+uedJRgzmxhjaEcARaBlJaIAjp5
 LXQoTXZt9qrHYWqE14o7p6mQPxGXAtsTeWKf0LWaSLlKNCUWMv98FD6eG+hTmJanvqVO
 La1JlWzTSB1TyRiyxSJh/h99Op2iPu3rGrZr/QdcAa0gckx3Oe3YdTDkDXpQEQ+fATQU
 mmDqmP77KJO+D31m1FjaBiW+KSE8pj40QzJCma480Qk+ptywBetd61gnWz5CdR+0vPbk
 Npvfy6w1GZGcE+7Xp+etDECaap8XeW/l4gg/oqEN1kHaM6uf2DpcMBOChgjOfd3sQfjI
 4wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719241983; x=1719846783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMpMM3VMXw3Pt2FtK4Aaxt1tlk2OfNvq+GBMyg4jRHU=;
 b=U+UH3gxCatJsMjDA9s6FRPMqB21a1xwxhgD8uUwhskB+ddt4cc/BUdNUQ7dwatZwIc
 mnVhlZrf+1AfM/MMAvxkKAhJ3kAEWVkAz0VCi/5nsYEvkHV1Sn31IivhzjO51dnyi6K/
 XO2ECXzvcO0TCJZd3u0qLrsrX95NLg6WTyWORJse/vgBE4tvtA+zh2+I0XMFB53Tn6tn
 ujLARMB0fdZpAP7D/6XY2HfvhyV94NAfstCd63W7dlG9dF+AQukQZAsTelzlk7Dp+ecf
 9G2wsF56nmciH3eotOTsjcxHbAxaYDzTx336EJERrDoWZTRpH35SuwBNmfR9Px/puFGl
 9OMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX0ZQ+alF/RE7gI+Wowdd7dPmLP+wQRmkfrdD++DjfSV17n+xuHxMYvueOkTtf8LB/GLA1lziga/8dTz6Eic275HRAyyvzdmakGZ4Y+kPyRAnUJPezErI+0ihbSa9LXJm16JjNLgVFrrfya2gaLw==
X-Gm-Message-State: AOJu0Yxp37WaQG6CDAKQsBJKWfL0oZvAMNkI5CpdtU0+/hK6mzRk+slk
 hdXb/ZAG9KrLoFnXiJwJkdFO14oFZeOFnmAOrBy5KNgTCbvFLhRu
X-Google-Smtp-Source: AGHT+IFMVmdeX14jN4dWDHaBXFZ14U2ROwwMKJgHg1KAQgkmU+44jh2hW2HjmSWq5/Aio0upbqp3qg==
X-Received: by 2002:a0c:f013:0:b0:6b5:4fbc:4c4a with SMTP id
 6a1803df08f44-6b54fbc4edfmr32286396d6.2.1719241982809; 
 Mon, 24 Jun 2024 08:13:02 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b529eb3decsm27243976d6.12.2024.06.24.08.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:13:02 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 3
Date: Mon, 24 Jun 2024 11:10:48 -0400
Message-ID: <20240624151122.23724-5-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624151122.23724-1-wuhoipok@gmail.com>
References: <20240624151122.23724-1-wuhoipok@gmail.com>
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

Please refer to patch 1.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/r600_hdmi.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c     | 10 +++++-----
 drivers/gpu/drm/radeon/radeon_agp.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c |  2 +-
 drivers/gpu/drm/radeon/radeon_audio.c    |  4 ++--
 drivers/gpu/drm/radeon/radeon_combios.c  | 12 ++++++------
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
index f3551ebaa2f0..661f374f5f27 100644
--- a/drivers/gpu/drm/radeon/r600_hdmi.c
+++ b/drivers/gpu/drm/radeon/r600_hdmi.c
@@ -116,7 +116,7 @@ void r600_audio_update_hdmi(struct work_struct *work)
 {
 	struct radeon_device *rdev = container_of(work, struct radeon_device,
 						  audio_work);
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct r600_audio_pin audio_status = r600_audio_status(rdev);
 	struct drm_encoder *encoder;
 	bool changed = false;
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 603a78e41ba5..22ce61bdfc06 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -405,11 +405,11 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 	if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
 		if ((rdev->flags & RADEON_IS_PX) &&
 		    radeon_atpx_dgpu_req_power_for_displays()) {
-			pm_runtime_get_sync(rdev->ddev->dev);
+			pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
 			/* Just fire off a uevent and let userspace tell us what to do */
-			drm_helper_hpd_irq_event(rdev->ddev);
-			pm_runtime_mark_last_busy(rdev->ddev->dev);
-			pm_runtime_put_autosuspend(rdev->ddev->dev);
+			drm_helper_hpd_irq_event(rdev_to_drm(rdev));
+			pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
+			pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 		}
 	}
 	/* TODO: check other events */
@@ -736,7 +736,7 @@ int radeon_acpi_init(struct radeon_device *rdev)
 		struct radeon_encoder *target = NULL;
 
 		/* Find the encoder controlling the brightness */
-		list_for_each_entry(tmp, &rdev->ddev->mode_config.encoder_list,
+		list_for_each_entry(tmp, &rdev_to_drm(rdev)->mode_config.encoder_list,
 				head) {
 			struct radeon_encoder *enc = to_radeon_encoder(tmp);
 
diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/radeon/radeon_agp.c
index a3d749e350f9..89d7b0e9e79f 100644
--- a/drivers/gpu/drm/radeon/radeon_agp.c
+++ b/drivers/gpu/drm/radeon/radeon_agp.c
@@ -161,7 +161,7 @@ struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
 
 static int radeon_agp_head_acquire(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	if (!rdev->agp)
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 10793a433bf5..97c4e10d0550 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -187,7 +187,7 @@ void radeon_atombios_i2c_init(struct radeon_device *rdev)
 
 			if (i2c.valid) {
 				sprintf(stmp, "0x%x", i2c.i2c_id);
-				rdev->i2c_bus[i] = radeon_i2c_create(rdev->ddev, &i2c, stmp);
+				rdev->i2c_bus[i] = radeon_i2c_create(rdev_to_drm(rdev), &i2c, stmp);
 			}
 			gpio = (ATOM_GPIO_I2C_ASSIGMENT *)
 				((u8 *)gpio + sizeof(ATOM_GPIO_I2C_ASSIGMENT));
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 0bcd767b9f47..47aa06a9a942 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -196,7 +196,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
 		return;
 
 	if (rdev->mode_info.mode_config_initialized) {
-		list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
+		list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
 			if (radeon_encoder_is_digital(encoder)) {
 				radeon_encoder = to_radeon_encoder(encoder);
 				dig = radeon_encoder->enc_priv;
@@ -760,7 +760,7 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
 	if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
 		return 0;
 
-	list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
+	list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
 		if (!radeon_encoder_is_digital(encoder))
 			continue;
 		radeon_encoder = to_radeon_encoder(encoder);
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 6952b1273b0f..41ddc576f8f8 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -372,7 +372,7 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
 	int edid_info, size;
 	struct edid *edid;
 	unsigned char *raw;
-	edid_info = combios_get_table_offset(rdev->ddev, COMBIOS_HARDCODED_EDID_TABLE);
+	edid_info = combios_get_table_offset(rdev_to_drm(rdev), COMBIOS_HARDCODED_EDID_TABLE);
 	if (!edid_info)
 		return false;
 
@@ -642,7 +642,7 @@ static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rde
 
 static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct radeon_i2c_bus_rec i2c;
 	u16 offset;
 	u8 id, blocks, clk, data;
@@ -670,7 +670,7 @@ static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct r
 
 void radeon_combios_i2c_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct radeon_i2c_bus_rec i2c;
 
 	/* actual hw pads
@@ -812,7 +812,7 @@ bool radeon_combios_get_clock_info(struct drm_device *dev)
 
 bool radeon_combios_sideport_present(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	u16 igp_info;
 
 	/* sideport is AMD only */
@@ -915,7 +915,7 @@ struct radeon_encoder_primary_dac *radeon_combios_get_primary_dac_info(struct
 enum radeon_tv_std
 radeon_combios_get_tv_info(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	uint16_t tv_info;
 	enum radeon_tv_std tv_std = TV_STD_NTSC;
 
@@ -2637,7 +2637,7 @@ static const char *thermal_controller_names[] = {
 
 void radeon_combios_get_power_modes(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	u16 offset, misc, misc2 = 0;
 	u8 rev, tmp;
 	int state_index = 0;
-- 
2.45.2

