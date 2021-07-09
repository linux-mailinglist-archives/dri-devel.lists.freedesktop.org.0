Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C83C2B67
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BF26E9A8;
	Fri,  9 Jul 2021 22:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCBF6E922
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 22:30:11 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id q10so10017566pfj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zu7nfuoGVnghpqd5EAwAWywe/m4wGfzvJeeGoNqQyKU=;
 b=AMqEFY6pT7rbAO9aO3LJfW0n9bSGqFn8ToIg/HOXEb25aG4PSy8jaf+yUPQTSHmOu1
 cte51ZFKFd6f1/ZvR15QXK+HCp5hEqTbI+PlhHLbRXWsVX9YqdeN0CFGl/Klohrg6Cpz
 X4anR6PAKT3j+NIf07X1RJmZ3RaM2wXO+ck8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zu7nfuoGVnghpqd5EAwAWywe/m4wGfzvJeeGoNqQyKU=;
 b=jks7bv64u+3PyVy/Dp5PNjzlR3NfbXwqkA79bskp4liWfM2Y+mozYH62VA6Y1JMA2M
 0p6B1fiY/a2Q3ynSFHl7gjaqc3meDYnLwwHCgEsNouvJyzeERKy1NGBO3o6ehAswNQgO
 xjNb0tpjBc4WvYHpuXfE7pVmXlFV/ySdf7SJj29LrwDnTgEAu4p/AXlbOEJHoMrY5LHr
 AyDD/5FbhyubtNOCw5Fe20LQONSQXChPBAyGZeBm2HzvSqoZJBHJ5Yi+lqLAphw/4ch1
 uNQGhvZ8fpJWEolEA9VyAk/dK0aP6egrmryCGKFQ11S7PrOIPit5xMpb2qLdAIEt2wo3
 6MUA==
X-Gm-Message-State: AOAM531PWXBvwhRVjIKvz63H29lYyV/Kj2G6FFD61vj6H4UY1zVjeTEa
 6no7ew36dGeXBCV+hKTogBi1Ww==
X-Google-Smtp-Source: ABdhPJzB8Asoz56jdErTO4hhcvUSN2+/eRrvvEgtzxTJKPxbKfey86WR0Q2VYJRvcjab+k2YmV+R7Q==
X-Received: by 2002:a65:568c:: with SMTP id v12mr41128093pgs.88.1625869811371; 
 Fri, 09 Jul 2021 15:30:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:b519:bd3e:1e31:1d0b])
 by smtp.gmail.com with ESMTPSA id e1sm2596704pjc.5.2021.07.09.15.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 15:30:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Lyude Paul <lyude@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH] drm/dp: Move panel DP AUX backlight support to drm_dp_helper
Date: Fri,  9 Jul 2021 15:29:20 -0700
Message-Id: <20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Rajeev Nandan <rajeevny@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We were getting a depmod error:
  depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper

It looks like the rule is that drm_kms_helper can call into drm, but
drm can't call into drm_kms_helper. That means we've got to move the
DP AUX backlight support into drm_dp_helper.

NOTE: as part of this, I didn't try to do any renames of the main
registration function. Even though it's in the drm_dp_helper, it still
feels very parallel to drm_panel_of_backlight().

Fixes: 10f7b40e4f30 ("drm/panel: add basic DP AUX backlight support")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that I've compile tested this, but I don't have a device setup
yet that uses this code. Since the code is basically the same as it
was this should be OK, but if Rajeev could confirm that nothing is
broken that'd be nice.

 drivers/gpu/drm/drm_dp_helper.c | 108 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_panel.c     | 108 --------------------------------
 include/drm/drm_dp_helper.h     |   3 +
 include/drm/drm_panel.h         |   8 ---
 4 files changed, 111 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 24bbc710c825..5b1c772e8f38 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -33,9 +33,17 @@
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_dp_mst_helper.h>
+#include <drm/drm_panel.h>
 
 #include "drm_crtc_helper_internal.h"
 
+struct dp_aux_backlight {
+	struct backlight_device *base;
+	struct drm_dp_aux *aux;
+	struct drm_edp_backlight_info info;
+	bool enabled;
+};
+
 /**
  * DOC: dp helpers
  *
@@ -3462,3 +3470,103 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 	return 0;
 }
 EXPORT_SYMBOL(drm_edp_backlight_init);
+
+static int dp_aux_backlight_update_status(struct backlight_device *bd)
+{
+	struct dp_aux_backlight *bl = bl_get_data(bd);
+	u16 brightness = backlight_get_brightness(bd);
+	int ret = 0;
+
+	if (!backlight_is_blank(bd)) {
+		if (!bl->enabled) {
+			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
+			bl->enabled = true;
+			return 0;
+		}
+		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
+	} else {
+		if (bl->enabled) {
+			drm_edp_backlight_disable(bl->aux, &bl->info);
+			bl->enabled = false;
+		}
+	}
+
+	return ret;
+}
+
+static const struct backlight_ops dp_aux_bl_ops = {
+	.update_status = dp_aux_backlight_update_status,
+};
+
+/**
+ * drm_panel_dp_aux_backlight - create and use DP AUX backlight
+ * @panel: DRM panel
+ * @aux: The DP AUX channel to use
+ *
+ * Use this function to create and handle backlight if your panel
+ * supports backlight control over DP AUX channel using DPCD
+ * registers as per VESA's standard backlight control interface.
+ *
+ * When the panel is enabled backlight will be enabled after a
+ * successful call to &drm_panel_funcs.enable()
+ *
+ * When the panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting backlight
+ * control over DP AUX will call this function at probe time.
+ * Backlight will then be handled transparently without requiring
+ * any intervention from the driver.
+ *
+ * drm_panel_dp_aux_backlight() must be called after the call to drm_panel_init().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
+{
+	struct dp_aux_backlight *bl;
+	struct backlight_properties props = { 0 };
+	u16 current_level;
+	u8 current_mode;
+	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+	int ret;
+
+	if (!panel || !panel->dev || !aux)
+		return -EINVAL;
+
+	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
+			       EDP_DISPLAY_CTL_CAP_SIZE);
+	if (ret < 0)
+		return ret;
+
+	if (!drm_edp_backlight_supported(edp_dpcd)) {
+		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
+		return 0;
+	}
+
+	bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
+	if (!bl)
+		return -ENOMEM;
+
+	bl->aux = aux;
+
+	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
+				     &current_level, &current_mode);
+	if (ret < 0)
+		return ret;
+
+	props.type = BACKLIGHT_RAW;
+	props.brightness = current_level;
+	props.max_brightness = bl->info.max;
+
+	bl->base = devm_backlight_device_register(panel->dev, "dp_aux_backlight",
+						  panel->dev, bl,
+						  &dp_aux_bl_ops, &props);
+	if (IS_ERR(bl->base))
+		return PTR_ERR(bl->base);
+
+	panel->backlight = bl->base;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 4fa1e3bb1b78..f634371c717a 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -26,20 +26,12 @@
 #include <linux/module.h>
 
 #include <drm/drm_crtc.h>
-#include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 static DEFINE_MUTEX(panel_lock);
 static LIST_HEAD(panel_list);
 
-struct dp_aux_backlight {
-	struct backlight_device *base;
-	struct drm_dp_aux *aux;
-	struct drm_edp_backlight_info info;
-	bool enabled;
-};
-
 /**
  * DOC: drm panel
  *
@@ -350,106 +342,6 @@ int drm_panel_of_backlight(struct drm_panel *panel)
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_of_backlight);
-
-static int dp_aux_backlight_update_status(struct backlight_device *bd)
-{
-	struct dp_aux_backlight *bl = bl_get_data(bd);
-	u16 brightness = backlight_get_brightness(bd);
-	int ret = 0;
-
-	if (!backlight_is_blank(bd)) {
-		if (!bl->enabled) {
-			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
-			bl->enabled = true;
-			return 0;
-		}
-		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
-	} else {
-		if (bl->enabled) {
-			drm_edp_backlight_disable(bl->aux, &bl->info);
-			bl->enabled = false;
-		}
-	}
-
-	return ret;
-}
-
-static const struct backlight_ops dp_aux_bl_ops = {
-	.update_status = dp_aux_backlight_update_status,
-};
-
-/**
- * drm_panel_dp_aux_backlight - create and use DP AUX backlight
- * @panel: DRM panel
- * @aux: The DP AUX channel to use
- *
- * Use this function to create and handle backlight if your panel
- * supports backlight control over DP AUX channel using DPCD
- * registers as per VESA's standard backlight control interface.
- *
- * When the panel is enabled backlight will be enabled after a
- * successful call to &drm_panel_funcs.enable()
- *
- * When the panel is disabled backlight will be disabled before the
- * call to &drm_panel_funcs.disable().
- *
- * A typical implementation for a panel driver supporting backlight
- * control over DP AUX will call this function at probe time.
- * Backlight will then be handled transparently without requiring
- * any intervention from the driver.
- *
- * drm_panel_dp_aux_backlight() must be called after the call to drm_panel_init().
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
-{
-	struct dp_aux_backlight *bl;
-	struct backlight_properties props = { 0 };
-	u16 current_level;
-	u8 current_mode;
-	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
-	int ret;
-
-	if (!panel || !panel->dev || !aux)
-		return -EINVAL;
-
-	ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
-			       EDP_DISPLAY_CTL_CAP_SIZE);
-	if (ret < 0)
-		return ret;
-
-	if (!drm_edp_backlight_supported(edp_dpcd)) {
-		DRM_DEV_INFO(panel->dev, "DP AUX backlight is not supported\n");
-		return 0;
-	}
-
-	bl = devm_kzalloc(panel->dev, sizeof(*bl), GFP_KERNEL);
-	if (!bl)
-		return -ENOMEM;
-
-	bl->aux = aux;
-
-	ret = drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
-				     &current_level, &current_mode);
-	if (ret < 0)
-		return ret;
-
-	props.type = BACKLIGHT_RAW;
-	props.brightness = current_level;
-	props.max_brightness = bl->info.max;
-
-	bl->base = devm_backlight_device_register(panel->dev, "dp_aux_backlight",
-						  panel->dev, bl,
-						  &dp_aux_bl_ops, &props);
-	if (IS_ERR(bl->base))
-		return PTR_ERR(bl->base);
-
-	panel->backlight = bl->base;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 #endif
 
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 729d5d82475e..4ca34f61ca01 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -30,6 +30,7 @@
 
 struct drm_device;
 struct drm_dp_aux;
+struct drm_panel;
 
 /*
  * Unless otherwise noted, all values are from the DP 1.1a spec.  Note that
@@ -2200,6 +2201,8 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 			     u16 level);
 int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
 
+int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux);
+
 #ifdef CONFIG_DRM_DP_CEC
 void drm_dp_cec_irq(struct drm_dp_aux *aux);
 void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 71aac751a032..4602f833eb51 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -32,7 +32,6 @@ struct backlight_device;
 struct device_node;
 struct drm_connector;
 struct drm_device;
-struct drm_dp_aux;
 struct drm_panel;
 struct display_timing;
 
@@ -209,18 +208,11 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
 #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
 	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
 int drm_panel_of_backlight(struct drm_panel *panel);
-int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux);
 #else
 static inline int drm_panel_of_backlight(struct drm_panel *panel)
 {
 	return 0;
 }
-
-static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
-					     struct drm_dp_aux *aux)
-{
-	return 0;
-}
 #endif
 
 #endif
-- 
2.32.0.93.g670b81a890-goog

