Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC4F83E31C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E3310FE26;
	Fri, 26 Jan 2024 20:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E31C10FE22
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:17 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5986d902ae6so460701eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299694; x=1706904494;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVDvtKfpncf0Nr9RLtXnd/K7bwQZ7lsVjFlwYveXUSY=;
 b=cUPCiWlUY/6mxyhDbE1yUBALAV7ciPGCQq6HEWNfH9OstYueD2axCGATdkQcQlcBEn
 c+Vm62iqriClM4fLoN3/PhO2lcZMbtf/122KW1GBMDqfMlPUZTrdPImfLqCuk8NXbjuc
 VrGuuJD0rRMcZPlKi1sQQZB46KaOAXWYYtKko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299694; x=1706904494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVDvtKfpncf0Nr9RLtXnd/K7bwQZ7lsVjFlwYveXUSY=;
 b=Sw7ZGGAoCbvsewwabZGFxI+G8UzaXF8rbailnFz3llBDhIu09CUEgTe9hwDSnHv1IR
 jqRy1DS4ssrY5PEpTuhtGhDrmhk3THIte1bF/wJA87tD0RlxNKzsc6nNrnDp4fSSoSHn
 3jS+cq9rJmbqo6saRKMdQISXlE4I9/vn5E/q1JImmaTTfZp6U7TvsmTS36AWngjI/AD+
 y5mz9lulrlGqOgbToP6lCAcOEmrX1YE/d99DziwbpimqzfkA0fHlJR6iD79sDqCN4kmS
 NDqnmR2QdsM6sAJlgX9Xp0W+nNeyWgccNE0xTozmSDirHNDQYUCyV98RH7/n05R2GFKk
 bMrg==
X-Gm-Message-State: AOJu0YwlaJidoHRwab6aPTmo34Av7KWGS8QHacvGbUxOoY2wLGX3w+5i
 IZ1AngLQL4YzICfUvg1b3wKpTM5wdfhXqZicaZ6NzRcrkgwLSpHA++seLBtWsr2eGV6ev+nMCbn
 N+xu5NCPQshAtr9Eu7NcPVORFvzNlFBnkxeWs0QT4yNgxy5u2+rWFugA5ZOhx4n/QP0ftfgZS+3
 gPPOBDVih0yneBeVLKJwZTIB12Pr/T9bU0f3AaosdVUK7FW4siyw==
X-Google-Smtp-Source: AGHT+IF/REY0OrAXjWogydfDxYu1rfzq8CxKtzr4lGtRD54nbUC9AcAAGXIBvA1HX5fvjwgvfHx/cQ==
X-Received: by 2002:a4a:dcc2:0:b0:59a:19e5:de18 with SMTP id
 h2-20020a4adcc2000000b0059a19e5de18mr224194oou.15.1706299693668; 
 Fri, 26 Jan 2024 12:08:13 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:13 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vmwgfx: Refactor drm connector probing for display
 modes
Date: Fri, 26 Jan 2024 15:08:00 -0500
Message-Id: <20240126200804.732454-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
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
Cc: Martin Krastev <martin.krastev@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <martin.krastev@broadcom.com>

Implement drm_connector_helper_funcs.mode_valid and .get_modes,
replacing custom drm_connector_funcs.fill_modes code with
drm_helper_probe_single_connector_modes; for STDU, LDU & SOU
display units.

Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 272 +++++++++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   4 +-
 5 files changed, 101 insertions(+), 191 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 8589a1c3cc36..2398041502c9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -35,6 +35,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
+#include <drm/drm_edid.h>
 
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
@@ -2282,107 +2283,6 @@ vmw_du_connector_detect(struct drm_connector *connector, bool force)
 		connector_status_connected : connector_status_disconnected);
 }
 
-static struct drm_display_mode vmw_kms_connector_builtin[] = {
-	/* 640x480@60Hz */
-	{ DRM_MODE("640x480", DRM_MODE_TYPE_DRIVER, 25175, 640, 656,
-		   752, 800, 0, 480, 489, 492, 525, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 800x600@60Hz */
-	{ DRM_MODE("800x600", DRM_MODE_TYPE_DRIVER, 40000, 800, 840,
-		   968, 1056, 0, 600, 601, 605, 628, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1024x768@60Hz */
-	{ DRM_MODE("1024x768", DRM_MODE_TYPE_DRIVER, 65000, 1024, 1048,
-		   1184, 1344, 0, 768, 771, 777, 806, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 1152x864@75Hz */
-	{ DRM_MODE("1152x864", DRM_MODE_TYPE_DRIVER, 108000, 1152, 1216,
-		   1344, 1600, 0, 864, 865, 868, 900, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1280x720@60Hz */
-	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74500, 1280, 1344,
-		   1472, 1664, 0, 720, 723, 728, 748, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1280x768@60Hz */
-	{ DRM_MODE("1280x768", DRM_MODE_TYPE_DRIVER, 79500, 1280, 1344,
-		   1472, 1664, 0, 768, 771, 778, 798, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1280x800@60Hz */
-	{ DRM_MODE("1280x800", DRM_MODE_TYPE_DRIVER, 83500, 1280, 1352,
-		   1480, 1680, 0, 800, 803, 809, 831, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 1280x960@60Hz */
-	{ DRM_MODE("1280x960", DRM_MODE_TYPE_DRIVER, 108000, 1280, 1376,
-		   1488, 1800, 0, 960, 961, 964, 1000, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1280x1024@60Hz */
-	{ DRM_MODE("1280x1024", DRM_MODE_TYPE_DRIVER, 108000, 1280, 1328,
-		   1440, 1688, 0, 1024, 1025, 1028, 1066, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1360x768@60Hz */
-	{ DRM_MODE("1360x768", DRM_MODE_TYPE_DRIVER, 85500, 1360, 1424,
-		   1536, 1792, 0, 768, 771, 777, 795, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1440x1050@60Hz */
-	{ DRM_MODE("1400x1050", DRM_MODE_TYPE_DRIVER, 121750, 1400, 1488,
-		   1632, 1864, 0, 1050, 1053, 1057, 1089, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1440x900@60Hz */
-	{ DRM_MODE("1440x900", DRM_MODE_TYPE_DRIVER, 106500, 1440, 1520,
-		   1672, 1904, 0, 900, 903, 909, 934, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1600x1200@60Hz */
-	{ DRM_MODE("1600x1200", DRM_MODE_TYPE_DRIVER, 162000, 1600, 1664,
-		   1856, 2160, 0, 1200, 1201, 1204, 1250, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1680x1050@60Hz */
-	{ DRM_MODE("1680x1050", DRM_MODE_TYPE_DRIVER, 146250, 1680, 1784,
-		   1960, 2240, 0, 1050, 1053, 1059, 1089, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1792x1344@60Hz */
-	{ DRM_MODE("1792x1344", DRM_MODE_TYPE_DRIVER, 204750, 1792, 1920,
-		   2120, 2448, 0, 1344, 1345, 1348, 1394, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1853x1392@60Hz */
-	{ DRM_MODE("1856x1392", DRM_MODE_TYPE_DRIVER, 218250, 1856, 1952,
-		   2176, 2528, 0, 1392, 1393, 1396, 1439, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1920x1080@60Hz */
-	{ DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 173000, 1920, 2048,
-		   2248, 2576, 0, 1080, 1083, 1088, 1120, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1920x1200@60Hz */
-	{ DRM_MODE("1920x1200", DRM_MODE_TYPE_DRIVER, 193250, 1920, 2056,
-		   2256, 2592, 0, 1200, 1203, 1209, 1245, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 1920x1440@60Hz */
-	{ DRM_MODE("1920x1440", DRM_MODE_TYPE_DRIVER, 234000, 1920, 2048,
-		   2256, 2600, 0, 1440, 1441, 1444, 1500, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 2560x1440@60Hz */
-	{ DRM_MODE("2560x1440", DRM_MODE_TYPE_DRIVER, 241500, 2560, 2608,
-		   2640, 2720, 0, 1440, 1443, 1448, 1481, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 2560x1600@60Hz */
-	{ DRM_MODE("2560x1600", DRM_MODE_TYPE_DRIVER, 348500, 2560, 2752,
-		   3032, 3504, 0, 1600, 1603, 1609, 1658, 0,
-		   DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC) },
-	/* 2880x1800@60Hz */
-	{ DRM_MODE("2880x1800", DRM_MODE_TYPE_DRIVER, 337500, 2880, 2928,
-		   2960, 3040, 0, 1800, 1803, 1809, 1852, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 3840x2160@60Hz */
-	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 533000, 3840, 3888,
-		   3920, 4000, 0, 2160, 2163, 2168, 2222, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* 3840x2400@60Hz */
-	{ DRM_MODE("3840x2400", DRM_MODE_TYPE_DRIVER, 592250, 3840, 3888,
-		   3920, 4000, 0, 2400, 2403, 2409, 2469, 0,
-		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC) },
-	/* Terminate */
-	{ DRM_MODE("", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) },
-};
-
 /**
  * vmw_guess_mode_timing - Provide fake timings for a
  * 60Hz vrefresh mode.
@@ -2404,88 +2304,6 @@ void vmw_guess_mode_timing(struct drm_display_mode *mode)
 }
 
 
-int vmw_du_connector_fill_modes(struct drm_connector *connector,
-				uint32_t max_width, uint32_t max_height)
-{
-	struct vmw_display_unit *du = vmw_connector_to_du(connector);
-	struct drm_device *dev = connector->dev;
-	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct drm_display_mode *mode = NULL;
-	struct drm_display_mode *bmode;
-	struct drm_display_mode prefmode = { DRM_MODE("preferred",
-		DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
-		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-		DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC)
-	};
-	int i;
-	u32 assumed_bpp = 4;
-
-	if (dev_priv->assume_16bpp)
-		assumed_bpp = 2;
-
-	max_width  = min(max_width,  dev_priv->texture_max_width);
-	max_height = min(max_height, dev_priv->texture_max_height);
-
-	/*
-	 * For STDU extra limit for a mode on SVGA_REG_SCREENTARGET_MAX_WIDTH/
-	 * HEIGHT registers.
-	 */
-	if (dev_priv->active_display_unit == vmw_du_screen_target) {
-		max_width  = min(max_width,  dev_priv->stdu_max_width);
-		max_height = min(max_height, dev_priv->stdu_max_height);
-	}
-
-	/* Add preferred mode */
-	mode = drm_mode_duplicate(dev, &prefmode);
-	if (!mode)
-		return 0;
-	mode->hdisplay = du->pref_width;
-	mode->vdisplay = du->pref_height;
-	vmw_guess_mode_timing(mode);
-	drm_mode_set_name(mode);
-
-	if (vmw_kms_validate_mode_vram(dev_priv,
-					mode->hdisplay * assumed_bpp,
-					mode->vdisplay)) {
-		drm_mode_probed_add(connector, mode);
-	} else {
-		drm_mode_destroy(dev, mode);
-		mode = NULL;
-	}
-
-	if (du->pref_mode) {
-		list_del_init(&du->pref_mode->head);
-		drm_mode_destroy(dev, du->pref_mode);
-	}
-
-	/* mode might be null here, this is intended */
-	du->pref_mode = mode;
-
-	for (i = 0; vmw_kms_connector_builtin[i].type != 0; i++) {
-		bmode = &vmw_kms_connector_builtin[i];
-		if (bmode->hdisplay > max_width ||
-		    bmode->vdisplay > max_height)
-			continue;
-
-		if (!vmw_kms_validate_mode_vram(dev_priv,
-						bmode->hdisplay * assumed_bpp,
-						bmode->vdisplay))
-			continue;
-
-		mode = drm_mode_duplicate(dev, bmode);
-		if (!mode)
-			return 0;
-
-		drm_mode_probed_add(connector, mode);
-	}
-
-	drm_connector_list_update(connector);
-	/* Move the prefered mode first, help apps pick the right mode. */
-	drm_mode_sort(&connector->modes);
-
-	return 1;
-}
-
 /**
  * vmw_kms_update_layout_ioctl - Handler for DRM_VMW_UPDATE_LAYOUT ioctl
  * @dev: drm device for the ioctl
@@ -3026,3 +2844,91 @@ int vmw_du_helper_plane_update(struct vmw_du_update_plane *update)
 	vmw_validation_unref_lists(&val_ctx);
 	return ret;
 }
+
+/**
+ * vmw_connector_mode_valid - implements drm_connector_helper_funcs.mode_valid callback
+ *
+ * @connector: the drm connector, part of a DU container
+ * @mode: drm mode to check
+ *
+ * Returns MODE_OK on success, or a drm_mode_status error code.
+ */
+enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
+					      struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	u32 max_width = dev_priv->texture_max_width;
+	u32 max_height = dev_priv->texture_max_height;
+	u32 assumed_cpp = 4;
+
+	if (dev_priv->assume_16bpp)
+		assumed_cpp = 2;
+
+	if (dev_priv->active_display_unit == vmw_du_screen_target) {
+		max_width  = min(dev_priv->stdu_max_width,  max_width);
+		max_height = min(dev_priv->stdu_max_height, max_height);
+	}
+
+	if (max_width < mode->hdisplay)
+		return MODE_BAD_HVALUE;
+
+	if (max_height < mode->vdisplay)
+		return MODE_BAD_VVALUE;
+
+	if (!vmw_kms_validate_mode_vram(dev_priv,
+					mode->hdisplay * assumed_cpp,
+					mode->vdisplay))
+		return MODE_MEM;
+
+	return MODE_OK;
+}
+
+/**
+ * vmw_connector_get_modes - implements drm_connector_helper_funcs.get_modes callback
+ *
+ * @connector: the drm connector, part of a DU container
+ *
+ * Returns the number of added modes.
+ */
+int vmw_connector_get_modes(struct drm_connector *connector)
+{
+	struct vmw_display_unit *du = vmw_connector_to_du(connector);
+	struct drm_device *dev = connector->dev;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	struct drm_display_mode *mode = NULL;
+	struct drm_display_mode prefmode = { DRM_MODE("preferred",
+		DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC)
+	};
+	u32 max_width;
+	u32 max_height;
+	u32 num_modes;
+
+	/* Add preferred mode */
+	mode = drm_mode_duplicate(dev, &prefmode);
+	if (!mode)
+		return 0;
+
+	mode->hdisplay = du->pref_width;
+	mode->vdisplay = du->pref_height;
+	vmw_guess_mode_timing(mode);
+	drm_mode_set_name(mode);
+
+	drm_mode_probed_add(connector, mode);
+	drm_dbg_kms(dev, "preferred mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+
+	/* Probe connector for all modes not exceeding our geom limits */
+	max_width  = dev_priv->texture_max_width;
+	max_height = dev_priv->texture_max_height;
+
+	if (dev_priv->active_display_unit == vmw_du_screen_target) {
+		max_width  = min(dev_priv->stdu_max_width,  max_width);
+		max_height = min(dev_priv->stdu_max_height, max_height);
+	}
+
+	num_modes = 1 + drm_add_modes_noedid(connector, max_width, max_height);
+
+	return num_modes;
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index db81e635dc06..a94947b588e8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -378,7 +378,6 @@ struct vmw_display_unit {
 	unsigned pref_width;
 	unsigned pref_height;
 	bool pref_active;
-	struct drm_display_mode *pref_mode;
 
 	/*
 	 * Gui positioning
@@ -428,8 +427,6 @@ void vmw_du_connector_save(struct drm_connector *connector);
 void vmw_du_connector_restore(struct drm_connector *connector);
 enum drm_connector_status
 vmw_du_connector_detect(struct drm_connector *connector, bool force);
-int vmw_du_connector_fill_modes(struct drm_connector *connector,
-				uint32_t max_width, uint32_t max_height);
 int vmw_kms_helper_dirty(struct vmw_private *dev_priv,
 			 struct vmw_framebuffer *framebuffer,
 			 const struct drm_clip_rect *clips,
@@ -438,6 +435,9 @@ int vmw_kms_helper_dirty(struct vmw_private *dev_priv,
 			 int num_clips,
 			 int increment,
 			 struct vmw_kms_dirty *dirty);
+enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
+					      struct drm_display_mode *mode);
+int vmw_connector_get_modes(struct drm_connector *connector);
 
 void vmw_kms_helper_validation_finish(struct vmw_private *dev_priv,
 				      struct drm_file *file_priv,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index a82fa9700370..c4db4aecca6c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -304,7 +304,7 @@ static void vmw_ldu_connector_destroy(struct drm_connector *connector)
 static const struct drm_connector_funcs vmw_legacy_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
 	.detect = vmw_du_connector_detect,
-	.fill_modes = vmw_du_connector_fill_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vmw_ldu_connector_destroy,
 	.reset = vmw_du_connector_reset,
 	.atomic_duplicate_state = vmw_du_connector_duplicate_state,
@@ -313,6 +313,8 @@ static const struct drm_connector_funcs vmw_legacy_connector_funcs = {
 
 static const struct
 drm_connector_helper_funcs vmw_ldu_connector_helper_funcs = {
+	.get_modes = vmw_connector_get_modes,
+	.mode_valid = vmw_connector_mode_valid
 };
 
 static int vmw_kms_ldu_do_bo_dirty(struct vmw_private *dev_priv,
@@ -449,7 +451,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 	ldu->base.pref_active = (unit == 0);
 	ldu->base.pref_width = dev_priv->initial_width;
 	ldu->base.pref_height = dev_priv->initial_height;
-	ldu->base.pref_mode = NULL;
 
 	/*
 	 * Remove this after enabling atomic because property values can
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 556a403b7eb5..30c3ad27b662 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -347,7 +347,7 @@ static void vmw_sou_connector_destroy(struct drm_connector *connector)
 static const struct drm_connector_funcs vmw_sou_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
 	.detect = vmw_du_connector_detect,
-	.fill_modes = vmw_du_connector_fill_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vmw_sou_connector_destroy,
 	.reset = vmw_du_connector_reset,
 	.atomic_duplicate_state = vmw_du_connector_duplicate_state,
@@ -357,6 +357,8 @@ static const struct drm_connector_funcs vmw_sou_connector_funcs = {
 
 static const struct
 drm_connector_helper_funcs vmw_sou_connector_helper_funcs = {
+	.get_modes = vmw_connector_get_modes,
+	.mode_valid = vmw_connector_mode_valid
 };
 
 
@@ -826,7 +828,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 	sou->base.pref_active = (unit == 0);
 	sou->base.pref_width = dev_priv->initial_width;
 	sou->base.pref_height = dev_priv->initial_height;
-	sou->base.pref_mode = NULL;
 
 	/*
 	 * Remove this after enabling atomic because property values can
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 6bc23bdf32c2..3c8414a13dba 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -835,7 +835,7 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
 static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
 	.detect = vmw_du_connector_detect,
-	.fill_modes = vmw_du_connector_fill_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = vmw_stdu_connector_destroy,
 	.reset = vmw_du_connector_reset,
 	.atomic_duplicate_state = vmw_du_connector_duplicate_state,
@@ -845,6 +845,8 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
+	.get_modes = vmw_connector_get_modes,
+	.mode_valid = vmw_connector_mode_valid
 };
 
 
-- 
2.40.1

