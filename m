Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B4B388D2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 19:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AF310E874;
	Wed, 27 Aug 2025 17:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="gjp99OQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C383510E874;
 Wed, 27 Aug 2025 17:46:19 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id C15E14931C;
 Wed, 27 Aug 2025 20:46:17 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 948394935B;
 Wed, 27 Aug 2025 20:46:16 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 9D2DE1FE1EC;
 Wed, 27 Aug 2025 20:46:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756316776;
 bh=RffAdHQk/eYb/Ego7s1KxqdM++ty0P5kpe8hGz9yzsc=; h=From:To:Subject;
 b=gjp99OQJvw3UltU1OBjhbZXSBVIbqJAxX3npj3bTvT4OIuHXoCNiMiSmJdzxhwh9m
 f2OCHDN6ILmq3Nyd1GxYDPuoiyiJbUy5nGlS3HWaSwSL8SDg0WjOGByWuYFVeJZnIG
 +k4+Ifyq8qo0yQXpHrgT2xkBS0vHjZwkow/tffKGa3vF9oZtaUYv3ywDy4EJVyU8w5
 WGM1FWx5gHbA7VN4hGFXyMbSSHNMtpSFSLT+giytoUAPHLxMKsyrKTL47xFjNRQ0wO
 7MMRHPc1xAP2Rc9916E1KVrZ1+buvAEC6kUgHN1gaIGKMkNUBOvr463eqSPECUu0NV
 K4JbgaXffZhmg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 89.150.168.85) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 2/5] drm: panel-backlight-quirks: Convert brightness quirk
 to generic structure
Date: Wed, 27 Aug 2025 19:43:57 +0200
Message-ID: <20250827174400.3692549-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827174400.3692549-1-lkml@antheas.dev>
References: <20250827174400.3692549-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175631677613.1365241.10326644939874316012@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

Currently, the brightness quirk is limited to minimum brightness only.
Refactor it to a structure, so that more quirks can be added in the
future. Reserve 0 value for "no quirk", and use u16 to allow minimum
brightness up to 255.

Tested-by: Philip Müller <philm@manjaro.org>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++--
 drivers/gpu/drm/drm_panel_backlight_quirks.c  | 41 ++++++++++---------
 include/drm/drm_utils.h                       |  7 +++-
 3 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a0ca3b2c6bd8..b967c6952e11 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3612,11 +3612,11 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 {
+	const struct drm_panel_backlight_quirk *panel_backlight_quirk;
 	struct amdgpu_dm_backlight_caps *caps;
 	struct drm_connector *conn_base;
 	struct amdgpu_device *adev;
 	struct drm_luminance_range_info *luminance_range;
-	int min_input_signal_override;
 
 	if (aconnector->bl_idx == -1 ||
 	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
@@ -3656,9 +3656,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	else
 		caps->aux_min_input_signal = 1;
 
-	min_input_signal_override = drm_get_panel_min_brightness_quirk(aconnector->drm_edid);
-	if (min_input_signal_override >= 0)
-		caps->min_input_signal = min_input_signal_override;
+	panel_backlight_quirk =
+		drm_get_panel_backlight_quirk(aconnector->drm_edid);
+	if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
+		if (panel_backlight_quirk->min_brightness)
+			caps->min_input_signal =
+				panel_backlight_quirk->min_brightness - 1;
+	}
 }
 
 DEFINE_FREE(sink_release, struct dc_sink *, if (_T) dc_sink_release(_T))
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index b38b33e26ea5..702726c20ccc 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -8,23 +8,23 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_utils.h>
 
-struct drm_panel_min_backlight_quirk {
+struct drm_get_panel_backlight_quirk {
 	struct {
 		enum dmi_field field;
 		const char * const value;
 	} dmi_match;
 	struct drm_edid_ident ident;
-	u8 min_brightness;
+	struct drm_panel_backlight_quirk quirk;
 };
 
-static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
+static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks[] = {
 	/* 13 inch matte panel */
 	{
 		.dmi_match.field = DMI_BOARD_VENDOR,
 		.dmi_match.value = "Framework",
 		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bca),
 		.ident.name = "NE135FBM-N41",
-		.min_brightness = 0,
+		.quirk = { .min_brightness = 1, },
 	},
 	/* 13 inch glossy panel */
 	{
@@ -32,7 +32,7 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match.value = "Framework",
 		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x095f),
 		.ident.name = "NE135FBM-N41",
-		.min_brightness = 0,
+		.quirk = { .min_brightness = 1, },
 	},
 	/* 13 inch 2.8k panel */
 	{
@@ -40,12 +40,13 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match.value = "Framework",
 		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
 		.ident.name = "NE135A1M-NY1",
-		.min_brightness = 0,
+		.quirk = { .min_brightness = 1, },
 	},
 };
 
-static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
-						  const struct drm_edid *edid)
+static bool drm_panel_min_backlight_quirk_matches(
+	const struct drm_get_panel_backlight_quirk *quirk,
+	const struct drm_edid *edid)
 {
 	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
 		return false;
@@ -57,39 +58,39 @@ static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_bac
 }
 
 /**
- * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
+ * drm_get_panel_backlight_quirk - Get backlight quirks for a panel
  * @edid: EDID of the panel to check
  *
  * This function checks for platform specific (e.g. DMI based) quirks
  * providing info on the minimum backlight brightness for systems where this
- * cannot be probed correctly from the hard-/firm-ware.
+ * cannot be probed correctly from the hard-/firm-ware and other sources.
  *
  * Returns:
- * A negative error value or
- * an override value in the range [0, 255] representing 0-100% to be scaled to
- * the drivers target range.
+ * a drm_panel_backlight_quirk struct if a quirk was found, otherwise an
+ * error pointer.
  */
-int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
+const struct drm_panel_backlight_quirk *
+drm_get_panel_backlight_quirk(const struct drm_edid *edid)
 {
-	const struct drm_panel_min_backlight_quirk *quirk;
+	const struct drm_get_panel_backlight_quirk *quirk;
 	size_t i;
 
 	if (!IS_ENABLED(CONFIG_DMI))
-		return -ENODATA;
+		return ERR_PTR(-ENODATA);
 
 	if (!edid)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
 		quirk = &drm_panel_min_backlight_quirks[i];
 
 		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
-			return quirk->min_brightness;
+			return &quirk->quirk;
 	}
 
-	return -ENODATA;
+	return ERR_PTR(-ENODATA);
 }
-EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
+EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
 
 MODULE_DESCRIPTION("Quirks for panel backlight overrides");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
index 15fa9b6865f4..82eeee4a58ab 100644
--- a/include/drm/drm_utils.h
+++ b/include/drm/drm_utils.h
@@ -16,7 +16,12 @@ struct drm_edid;
 
 int drm_get_panel_orientation_quirk(int width, int height);
 
-int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
+struct drm_panel_backlight_quirk {
+	u16 min_brightness;
+};
+
+const struct drm_panel_backlight_quirk *
+drm_get_panel_backlight_quirk(const struct drm_edid *edid);
 
 signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
 
-- 
2.51.0


