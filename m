Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9450E4BECE2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 23:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F8610E47E;
	Mon, 21 Feb 2022 22:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA6310E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645481176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s9Cbs01/4Uw0CzyPi5qSvtCSA/xeRmyWsFGieNqcaGs=;
 b=di2dvvSmWZsmUFMgts0NWkFnvMNjEw22zd21mIJNNpdI2itDz5QF028gjVsn/vwMoiJz0R
 E0x3lQXa+6ab2xMSGAuvxMfC2hJDPtghDYK4/N3YJ8wACIfCsbDUf7D+zhJ2PFZRL5O1Od
 LMrJCeGGSkyvkpmnhmsimewgMjdNgZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-M-FUy_I9Ni6h3TTBHks-hQ-1; Mon, 21 Feb 2022 17:06:15 -0500
X-MC-Unique: M-FUy_I9Ni6h3TTBHks-hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA0B801ADB;
 Mon, 21 Feb 2022 22:06:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 173785023B;
 Mon, 21 Feb 2022 22:06:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline
 in BIOS on Asus TF103C
Date: Mon, 21 Feb 2022 23:06:07 +0100
Message-Id: <20220221220608.12131-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vtotal is wrong in the BIOS supplied modeline for the DSI panel on
the Asus TF103C leading to the last line of the display being shown
as the first line.

The factory installed Android has a hardcoded modeline in its kernel,
causing it to not suffer from this BIOS bug;

and the Android boot-splash which uses the EFI FB which does have this bug
has the last line all black causing the bug to not be visible.

This commit introduces a generic DMI based mechanism for doing modeline
fixups, in case we need similar fixups on other models in the future.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 06ef822c27bd..66f5cf32bb66 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -23,6 +23,7 @@
  * Author: Jani Nikula <jani.nikula@intel.com>
  */
 
+#include <linux/dmi.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -1831,6 +1832,33 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 	intel_dsi_log_params(intel_dsi);
 }
 
+typedef void (*vlv_dsi_mode_fixup_func)(struct drm_connector *connector,
+					struct drm_display_mode *fixed_mode);
+
+/*
+ * Vtotal is wrong on the Asus TF103C leading to the last line of the display
+ * being shown as the first line. The factory installed Android has a hardcoded
+ * modeline, causing it to not suffer from this BIOS bug.
+ */
+static void vlv_dsi_asus_tf103c_mode_fixup(struct drm_connector *connector,
+					   struct drm_display_mode *fixed_mode)
+{
+	fixed_mode->vtotal = 816;
+	fixed_mode->crtc_vtotal = 816;
+}
+
+static const struct dmi_system_id dmi_mode_fixup_table[] = {
+	{
+		/* Asus Transformer Pad TF103C */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)vlv_dsi_asus_tf103c_mode_fixup,
+	},
+	{ }
+};
+
 void vlv_dsi_init(struct drm_i915_private *dev_priv)
 {
 	struct drm_device *dev = &dev_priv->drm;
@@ -1840,6 +1868,8 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
 	struct drm_display_mode *current_mode, *fixed_mode;
+	const struct dmi_system_id *dmi_id;
+	vlv_dsi_mode_fixup_func mode_fixup;
 	enum port port;
 	enum pipe pipe;
 
@@ -1968,6 +1998,12 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 		goto err_cleanup_connector;
 	}
 
+	dmi_id = dmi_first_match(dmi_mode_fixup_table);
+	if (dmi_id) {
+		mode_fixup = (vlv_dsi_mode_fixup_func)dmi_id->driver_data;
+		mode_fixup(connector, fixed_mode);
+	}
+
 	intel_panel_init(&intel_connector->panel, fixed_mode, NULL);
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
-- 
2.35.1

