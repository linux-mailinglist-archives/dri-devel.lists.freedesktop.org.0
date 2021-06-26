Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240C3B4FAC
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 18:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61826E0AB;
	Sat, 26 Jun 2021 16:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (unknown [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEC46E027;
 Sat, 26 Jun 2021 16:52:13 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 26 Jun 2021 09:52:07 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 26 Jun 2021 09:52:05 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 26 Jun 2021 22:21:19 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id 09DF021478; Sat, 26 Jun 2021 22:21:16 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v8 1/6] drm/panel: add basic DP AUX backlight support
Date: Sat, 26 Jun 2021 22:21:03 +0530
Message-Id: <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
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
Cc: daniel.thompson@linaro.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, jani.nikula@intel.com, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 a.hajda@samsung.com, thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-fbdev@vger.kernel.org,
 kalyan_t@codeaurora.org, jingoohan1@gmail.com, hoegsberg@chromium.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels support backlight control over DP AUX channel using
VESA's standard backlight control interface.
Using new DRM eDP backlight helpers, add support to create and
register a backlight for those panels in drm_panel to simplify
the panel drivers.

The panel driver with access to "struct drm_dp_aux" can create and
register a backlight device using following code snippet in its
probe() function:

	err = drm_panel_dp_aux_backlight(panel, aux);
	if (err)
		return err;

Then drm_panel will handle backlight_(enable|disable) calls
similar to the case when drm_panel_of_backlight() is used.

Currently, we are not supporting one feature where the source
device can combine the backlight brightness levels set through
DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
required for the basic backlight controls, it can be added later.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

Changes in v5:
- New

Changes in v6:
- Fixed ordering of memory allocation (Douglas)
- Updated word wrapping in a comment (Douglas)

Changes in v8:
- Now using backlight_is_blank() to get the backlight blank status (Sam Ravnborg)

 drivers/gpu/drm/drm_panel.c | 108 ++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h     |  15 ++++--
 2 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371..4fa1e3b 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -26,12 +26,20 @@
 #include <linux/module.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 static DEFINE_MUTEX(panel_lock);
 static LIST_HEAD(panel_list);
 
+struct dp_aux_backlight {
+	struct backlight_device *base;
+	struct drm_dp_aux *aux;
+	struct drm_edp_backlight_info info;
+	bool enabled;
+};
+
 /**
  * DOC: drm panel
  *
@@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel *panel)
 	return 0;
 }
 EXPORT_SYMBOL(drm_panel_of_backlight);
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
 #endif
 
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3..3ebfaa6 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -32,6 +32,7 @@ struct backlight_device;
 struct device_node;
 struct drm_connector;
 struct drm_device;
+struct drm_dp_aux;
 struct drm_panel;
 struct display_timing;
 
@@ -64,8 +65,8 @@ enum drm_panel_orientation;
  * the panel. This is the job of the .unprepare() function.
  *
  * Backlight can be handled automatically if configured using
- * drm_panel_of_backlight(). Then the driver does not need to implement the
- * functionality to enable/disable backlight.
+ * drm_panel_of_backlight() or drm_panel_dp_aux_backlight(). Then the driver
+ * does not need to implement the functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
 	/**
@@ -144,8 +145,8 @@ struct drm_panel {
 	 * Backlight device, used to turn on backlight after the call
 	 * to enable(), and to turn off backlight before the call to
 	 * disable().
-	 * backlight is set by drm_panel_of_backlight() and drivers
-	 * shall not assign it.
+	 * backlight is set by drm_panel_of_backlight() or
+	 * drm_panel_dp_aux_backlight() and drivers shall not assign it.
 	 */
 	struct backlight_device *backlight;
 
@@ -208,11 +209,17 @@ static inline int of_drm_get_panel_orientation(const struct device_node *np,
 #if IS_ENABLED(CONFIG_DRM_PANEL) && (IS_BUILTIN(CONFIG_BACKLIGHT_CLASS_DEVICE) || \
 	(IS_MODULE(CONFIG_DRM) && IS_MODULE(CONFIG_BACKLIGHT_CLASS_DEVICE)))
 int drm_panel_of_backlight(struct drm_panel *panel);
+int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux);
 #else
 static inline int drm_panel_of_backlight(struct drm_panel *panel)
 {
 	return 0;
 }
+static inline int drm_panel_dp_aux_backlight(struct drm_panel *panel,
+					     struct drm_dp_aux *aux)
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
2.7.4

