Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 893439B879F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835EE10E0B7;
	Fri,  1 Nov 2024 00:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RuXsjLb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0262510E0B7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso1574305e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420711; x=1731025511; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
 b=RuXsjLb3POSNrdtLQ7z82PfXa1XhwNFvZ+XPSS6/nvvJt49/D06/0wT2Ws1+5Ou9GF
 BoaqUqWJAY97TW1POKj1zDIXy7fAJNL2bQXalhIPZY5RJcuHs1h9ZgegzvPHIUIKeJTU
 GSj4BG85F1loVtnl1jCyV0aYEMCLjY71AoT/ZninLOl/2ZfGPAzntk88iyUPfYQw44mB
 N7dj0VS/hDXxqs22LjlmWh4Pe3+AUCEC5LiDbqKwtyfHHXzHFsgDpViO0xxO7j1VzxuQ
 PNsIufh57+PpqXu8Q9TLPWqETTLLtOFIngDPflx17/jN3yI5YvgDLnMQQNpR7G//nUEE
 B6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420711; x=1731025511;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f6wvkpdEJy3UY0KoyL1u6wW6pZJHCkWq8daEN8XaygQ=;
 b=D6coIT9ypIndasjEwEed40Jxe+5qP10R+FWiHwCnmFB1oDpNmjEZsGTXK3tA/rqaRs
 vGbP3u7HdSPbVFjCdszdyXSqe8r8g88ZHzyqb8220hMGyFVI+AXabG2UcCRBj3557O9A
 ih49dIiTzzE2X78Tdkbyhu8UN+Bm72C7WNMbVLQexotv4Mx+Rv3qxB5q9DYcgwA/fg5U
 GUwJpGHgmrS/ggNoCpOurnm1EaeCL33+Zqj/sxyrbRR6UlS0E5RD5wvZHJaJvdAzEScn
 mqcl+GFuNICALemAd797FY9qYYUFt1LqslF39L6bXxVGeEwv08CeNk8FUi0ZCWtaW0f9
 oN5Q==
X-Gm-Message-State: AOJu0YwwAqo8FiSynwhcYfTHXgDmxOSHA8cRzh88fMo1o8eMpPapMKCf
 ESlIYHZD40qhwVCuelgzke2VRcKwbQzuVxJn2EA2cVOzlIFMrlMxre5CttDc7RA=
X-Google-Smtp-Source: AGHT+IFl02U+Enu+dOc8nLBGUqiQvjvTgpJmOb8nUqlghPqDc1+5KcRdRr4F22uyWdsyfKCDEEXcqg==
X-Received: by 2002:a05:6512:114f:b0:539:958a:8fb1 with SMTP id
 2adb3069b0e04-53d65e1aeecmr830681e87.60.1730420710791; 
 Thu, 31 Oct 2024 17:25:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:04 +0200
Subject: [PATCH v2 1/6] drm/display: hdmi: add generic mode_valid helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-1-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12996;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kVBUKzWAeHVvHBydx3EkRE4Q3REprXqMLr3/QDo5buM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/h+qQ1svDVzgd0LXjIU1mOZYulRshe8N4cO
 hhkv1trDDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1YsEB/oCWybrGbF8Zp55m5T5SgJSWWMvmHdwta73P4TbzdbYxcw2s2JeW3ZdBed51YYxvd29orC
 p6PB0KX/CZKEEyn4Xp9ZqQYRtEo4BZufIesiJxN6SWc+jisZtmmNry8JkoNh0C6UaLeip2k6dF3
 HHISp68oCmsgCVPYX7oPUN3Yv27H8YXfd1/UllhI2fuAMNtl4txBzdiPwRlvJpZEKv3CkGnOgeP
 QTdDn7BX88d9AjlBozZcgJa5Hib1obJ31EY57vKWvMxLt1vgPH5PIE1g94Nmq01lQdsUoZvV3GJ
 HjeNxTzyfa42+vFSYu0Zppy75ikECUbDVNoTowRpSr3FDqub
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
It can be either used directly or as a part of the .mode_valid callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c          |  45 ++++++
 drivers/gpu/drm/display/drm_hdmi_helper_internal.h |  11 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  26 +---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 168 ++++++++++++++++++++-
 include/drm/display/drm_hdmi_helper.h              |   4 +
 5 files changed, 229 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..560c5d4365ca54d3f669395349cedfd6f75fa033 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -9,6 +9,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_property.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
 {
 	return sink_eotf & BIT(output_eotf);
@@ -256,3 +258,46 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
 }
 EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock)
+{
+	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
+	const struct drm_display_info *info = &connector->display_info;
+
+	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
+		return MODE_CLOCK_HIGH;
+
+	if (funcs && funcs->tmds_char_rate_valid) {
+		enum drm_mode_status status;
+
+		status = funcs->tmds_char_rate_valid(connector, mode, clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
+	return MODE_OK;
+}
+
+/**
+ * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
+ * @connector: DRM connector to validate the mode
+ * @mode: Display mode to validate
+ *
+ * Generic .mode_valid implementation for HDMI connectors.
+ */
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	unsigned long long clock;
+
+	clock = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (!clock)
+		return MODE_ERROR;
+
+	return __drm_hdmi_connector_clock_valid(connector, mode, clock);
+}
+EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
diff --git a/drivers/gpu/drm/display/drm_hdmi_helper_internal.h b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
new file mode 100644
index 0000000000000000000000000000000000000000..ee74435c04f62cf71b9857bdc427c46442b85697
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_helper_internal.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DP_HELPER_INTERNAL_H
+#define DRM_DP_HELPER_INTERNAL_H
+
+enum drm_mode_status
+__drm_hdmi_connector_clock_valid(const struct drm_connector *connector,
+				 const struct drm_display_mode *mode,
+				 unsigned long long clock);
+
+#endif
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..29c2cb2c3171366a2a68fc6ad48f8ad8a4dc7e30 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -8,6 +8,8 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include "drm_hdmi_helper_internal.h"
+
 /**
  * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
  * @connector: DRM connector
@@ -198,28 +200,6 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 	return false;
 }
 
-static enum drm_mode_status
-hdmi_clock_valid(const struct drm_connector *connector,
-		 const struct drm_display_mode *mode,
-		 unsigned long long clock)
-{
-	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
-	const struct drm_display_info *info = &connector->display_info;
-
-	if (info->max_tmds_clock && clock > info->max_tmds_clock * 1000)
-		return MODE_CLOCK_HIGH;
-
-	if (funcs && funcs->tmds_char_rate_valid) {
-		enum drm_mode_status status;
-
-		status = funcs->tmds_char_rate_valid(connector, mode, clock);
-		if (status != MODE_OK)
-			return status;
-	}
-
-	return MODE_OK;
-}
-
 static int
 hdmi_compute_clock(const struct drm_connector *connector,
 		   struct drm_connector_state *conn_state,
@@ -233,7 +213,7 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	if (!clock)
 		return -EINVAL;
 
-	status = hdmi_clock_valid(connector, mode, clock);
+	status = __drm_hdmi_connector_clock_valid(connector, mode, clock);
 	if (status != MODE_OK)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 34ee95d41f2966ab23a60deb37d689430f6b0985..8640e7280053bd95852f53b92159f493b141f2bf 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -43,10 +43,12 @@ struct drm_atomic_helper_connector_hdmi_priv {
 static struct drm_display_mode *find_preferred_mode(struct drm_connector *connector)
 {
 	struct drm_device *drm = connector->dev;
-	struct drm_display_mode *mode, *preferred;
+	struct drm_display_mode *mode, *preferred = NULL;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	if (!list_empty(&connector->modes))
+		preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;
@@ -125,6 +127,18 @@ static const struct drm_connector_hdmi_funcs reject_connector_hdmi_funcs = {
 	.tmds_char_rate_valid	= reject_connector_tmds_char_rate_valid,
 };
 
+static enum drm_mode_status
+reject_100MHz_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					     const struct drm_display_mode *mode,
+					     unsigned long long tmds_rate)
+{
+	return (tmds_rate > 100ULL * 1000 * 1000) ? MODE_BAD : MODE_OK;
+}
+
+static const struct drm_connector_hdmi_funcs reject_100_MHz_connector_hdmi_funcs = {
+	.tmds_char_rate_valid	= reject_100MHz_connector_tmds_char_rate_valid,
+};
+
 static int dummy_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
@@ -147,6 +161,33 @@ static int dummy_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_helper_funcs dummy_connector_helper_funcs = {
 	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
 	.get_modes	= dummy_connector_get_modes,
+	.mode_valid		= drm_hdmi_connector_mode_valid,
+};
+
+static int dummy_connector_get_modes_100MHz_max_clock(struct drm_connector *connector)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv =
+		connector_to_priv(connector);
+	const struct drm_edid *edid;
+	unsigned int num_modes;
+
+	edid = drm_edid_alloc(priv->current_edid, priv->current_edid_len);
+	if (!edid)
+		return -EINVAL;
+
+	drm_edid_connector_update(connector, edid);
+	connector->display_info.max_tmds_clock = 100 * 1000;
+	num_modes = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(edid);
+
+	return num_modes;
+}
+
+static const struct drm_connector_helper_funcs dummy_connector_helper_funcs_max_tmds_clock = {
+	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.get_modes	= dummy_connector_get_modes_100MHz_max_clock,
+	.mode_valid		= drm_hdmi_connector_mode_valid,
 };
 
 static void dummy_hdmi_connector_reset(struct drm_connector *connector)
@@ -1734,9 +1775,132 @@ static struct kunit_suite drm_atomic_helper_connector_hdmi_reset_test_suite = {
 	.test_cases	= drm_atomic_helper_connector_hdmi_reset_tests,
 };
 
+static void drm_test_check_mode_valid(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 1920);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 1080);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 148500);
+}
+
+static void drm_test_check_mode_valid_reject(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	struct drm_device *drm;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_connector_hdmi_funcs;
+
+	priv->current_edid = test_edid_hdmi_1080p_rgb_max_200mhz;
+	priv->current_edid_len = ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz);
+
+	drm = &priv->drm;
+
+	mutex_lock(&drm->mode_config.mutex);
+	ret = conn->funcs->fill_modes(conn, 4096, 4096);
+	mutex_unlock(&drm->mode_config.mutex);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NULL(test, preferred);
+}
+
+static void drm_test_check_mode_valid_reject_rate(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	/* You shouldn't be doing that at home. */
+	conn->hdmi.funcs = &reject_100_MHz_connector_hdmi_funcs;
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_connector *conn;
+	struct drm_display_mode *preferred;
+	int ret;
+
+	priv = drm_atomic_helper_connector_hdmi_init(test,
+						     BIT(HDMI_COLORSPACE_RGB),
+						     8);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+
+	drm_connector_helper_add(conn, &dummy_connector_helper_funcs_max_tmds_clock);
+
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	preferred = find_preferred_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, preferred);
+	KUNIT_EXPECT_EQ(test, preferred->hdisplay, 640);
+	KUNIT_EXPECT_EQ(test, preferred->vdisplay, 480);
+	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
+}
+
+static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
+	KUNIT_CASE(drm_test_check_mode_valid),
+	KUNIT_CASE(drm_test_check_mode_valid_reject),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	{ }
+};
+
+static struct kunit_suite drm_atomic_helper_connector_hdmi_mode_valid_test_suite = {
+	.name		= "drm_atomic_helper_connector_hdmi_mode_valid",
+	.test_cases	= drm_atomic_helper_connector_hdmi_mode_valid_tests,
+};
+
 kunit_test_suites(
 	&drm_atomic_helper_connector_hdmi_check_test_suite,
 	&drm_atomic_helper_connector_hdmi_reset_test_suite,
+	&drm_atomic_helper_connector_hdmi_mode_valid_test_suite,
 );
 
 MODULE_AUTHOR("Maxime Ripard <mripard@kernel.org>");
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 57e3b18c15ec79636d89267aba0e88f434c5d4db..93f0e566257338fb6e9a1f0b2cc14ce9c97ec0a5 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -28,4 +28,8 @@ unsigned long long
 drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 			    unsigned int bpc, enum hdmi_colorspace fmt);
 
+enum drm_mode_status
+drm_hdmi_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode);
+
 #endif

-- 
2.39.5

