Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627A9BBEE8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D3E10E055;
	Mon,  4 Nov 2024 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Kyxy9M5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB110E055
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 20:41:19 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-7f3da2c2cb5so1050232a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1730752878; x=1731357678;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NOl/rBsA1iTUyLMtNioPuDmzcogz2TcBiRUfqenoAiI=;
 b=Kyxy9M5IsVtikHCJTzTzNROVHv2DtBUGBk+rALNN7G3mP9lL6ydnP9Q1Apif/LL9wn
 +msIPbEIBG3TPI7rcOXQNOa6BfiqK6CvtCSHo+3ApCcRlrq0GYBDAaXwkeDdAfZe/kJf
 BJN9OHkR3gq6x54TgZevK5nVbZW6M/luGvm3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730752878; x=1731357678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOl/rBsA1iTUyLMtNioPuDmzcogz2TcBiRUfqenoAiI=;
 b=HYxbxX9AEyiM+uTuJBLvG4C3DVo0Jejd2Xv1oSwn71pIkEEOxG8QGpJuPzTP3HjFql
 q1plsOEiRNUgj9rUcKm/FC/9Le8UKsRMrTZgSoyEJ69WV3eVJBxue/Ed2ODe2HRzgE5u
 H7igbvrzJHrSLM2Ep95eOOIGHKqoEbWYsriBmTQZdNXs3Bucyrwb6GwrfPLO2I8r6xZn
 83xtz6lDIVpIVFq4xkeql3s4i7KA+ybAZK80x6tkwjNt7OrGP/DStU1iWWP/wSy+Rc5E
 sjqyq6DfNTanef/a226NcwrwXlg7leiDTR9aEnz3/n45i2AEDhOXeiSINJv3Wel5KiSF
 r+HA==
X-Gm-Message-State: AOJu0YwEvCBgqu2nWgh8Qvya1FOH9f1ujDle62Ii6B5eQO1UJlVfYH29
 pIHaE6NHlGvXXnA8l78X04uiJUR5wAHXHFgAZxAnGVnNRgC5xFPwkYdcJujxm5j1NGNnqxt6PmX
 ylJYbgkaiMiOnen4XBKPz0JXQ9cDV/YCvo1JUvjtAkhZj2Bgbva3B9jn0w+MqBTCojLZ5ENroJf
 XLJ1LErLGRzNKC0Z3dzU9Xe9HeYgPRAJiSqKN06DJhwsQRlMl/bA==
X-Google-Smtp-Source: AGHT+IHNgvNfZo5H4bYmFiy4QjdHEseHvvsJJQvB/1kmZzTNKbZR3UMuNztfU+C5zZ6jeXBIHo2hXg==
X-Received: by 2002:a05:6a20:e687:b0:1d9:975e:2bb9 with SMTP id
 adf61e73a8af0-1d9a851d437mr43140160637.31.1730752878080; 
 Mon, 04 Nov 2024 12:41:18 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa44a34sm10443538a91.26.2024.11.04.12.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 12:41:17 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH v2] drm/vmwgfx: Add common resolutions to the connector mode
 list
Date: Mon,  4 Nov 2024 14:41:09 -0600
Message-Id: <20241104204109.1107067-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

We replaced our custom list of resolutions with the noedid list, which is
based on the VESA DMT standard, in the referenced fixes commit. The reason
for this was that the user can technically set any resolution they want by
using Autofit or the vmwgfxctl utility.

Unfortunately the Autofit feature is a global setting that is applied to
all VMs running in Workstation and some users preferred to set the mode
manually on certain VMs. Additionally the DMT standard does not include a
number of modern resolutions as it was last updated in 2013 and has since
been superseded.

This commit adds back some of the removed modes and adds some additional
common ones.

Fixes: 935f795045a6 ("drm/vmwgfx: Refactor drm connector probing for display modes")
Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2081803
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---

 v2: Rename modes array and make it const.
     Replace vmw_guess_mode_timing with drm_cvt_mode.

 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 67 ++++++++++++++---------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |  1 -
 2 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f39bf992364d..05d35b8a3c40 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2150,27 +2150,6 @@ vmw_du_connector_detect(struct drm_connector *connector, bool force)
 		connector_status_connected : connector_status_disconnected);
 }
 
-/**
- * vmw_guess_mode_timing - Provide fake timings for a
- * 60Hz vrefresh mode.
- *
- * @mode: Pointer to a struct drm_display_mode with hdisplay and vdisplay
- * members filled in.
- */
-void vmw_guess_mode_timing(struct drm_display_mode *mode)
-{
-	mode->hsync_start = mode->hdisplay + 50;
-	mode->hsync_end = mode->hsync_start + 50;
-	mode->htotal = mode->hsync_end + 50;
-
-	mode->vsync_start = mode->vdisplay + 50;
-	mode->vsync_end = mode->vsync_start + 50;
-	mode->vtotal = mode->vsync_end + 50;
-
-	mode->clock = (u32)mode->htotal * (u32)mode->vtotal / 100 * 6;
-}
-
-
 /**
  * vmw_kms_update_layout_ioctl - Handler for DRM_VMW_UPDATE_LAYOUT ioctl
  * @dev: drm device for the ioctl
@@ -2681,6 +2660,16 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+/*
+ * Common modes not present in the VESA DMT standard or assigned a VIC.
+ */
+static const struct {
+	int width;
+	int height;
+} vmw_extra_modes[] = { {2560, 1440}, // QHD
+			{3440, 1440}, // UWQHD
+			{3840, 2400}}; // WQUXGA
+
 /**
  * vmw_connector_get_modes - implements drm_connector_helper_funcs.get_modes callback
  *
@@ -2694,26 +2683,19 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	struct drm_display_mode *mode = NULL;
-	struct drm_display_mode prefmode = { DRM_MODE("preferred",
-		DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC)
-	};
 	u32 max_width;
 	u32 max_height;
-	u32 num_modes;
+	u32 num_modes = 0;
 
 	/* Add preferred mode */
-	mode = drm_mode_duplicate(dev, &prefmode);
+	mode = drm_cvt_mode(dev, du->pref_width, du->pref_height,
+			    60, true, false, false);
 	if (!mode)
 		return 0;
 
-	mode->hdisplay = du->pref_width;
-	mode->vdisplay = du->pref_height;
-	vmw_guess_mode_timing(mode);
-	drm_mode_set_name(mode);
-
+	mode->type |= DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 	drm_mode_probed_add(connector, mode);
+	num_modes++;
 	drm_dbg_kms(dev, "preferred mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
 	/* Probe connector for all modes not exceeding our geom limits */
@@ -2725,7 +2707,24 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 		max_height = min(dev_priv->stdu_max_height, max_height);
 	}
 
-	num_modes = 1 + drm_add_modes_noedid(connector, max_width, max_height);
+	mode = drm_display_mode_from_cea_vic(dev, 97); // 4K UHD 16:9
+	if (mode) {
+		drm_mode_probed_add(connector, mode);
+		num_modes++;
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(vmw_extra_modes); i++) {
+		mode = drm_cvt_mode(dev, vmw_extra_modes[i].width,
+				    vmw_extra_modes[i].height,
+				    60, true, false, false);
+		if (mode) {
+			mode->type |= DRM_MODE_TYPE_DRIVER;
+			drm_mode_probed_add(connector, mode);
+			num_modes++;
+		}
+	}
+
+	num_modes += drm_add_modes_noedid(connector, max_width, max_height);
 
 	return num_modes;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 2a6c6d6581e0..6a8bb60c507d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -454,7 +454,6 @@ struct vmw_framebuffer *
 vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 			struct vmw_user_object *uo,
 			const struct drm_mode_fb_cmd2 *mode_cmd);
-void vmw_guess_mode_timing(struct drm_display_mode *mode);
 void vmw_kms_update_implicit_fb(struct vmw_private *dev_priv);
 void vmw_kms_create_implicit_placement_property(struct vmw_private *dev_priv);
 
-- 
2.34.1

