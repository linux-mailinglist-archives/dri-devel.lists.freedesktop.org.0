Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B30724C50E3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788410EA10;
	Fri, 25 Feb 2022 21:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803B10E229
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645825796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AbGxeSXFBVDBJkexbTyEgFiLLSTKssRShbzZVnpdfyE=;
 b=IoJWFc1+WoaknWAIAW4FpFw/kfXBK6+ium1qgG2kn/FXgLf5Plgowvd32n8/sC6jgzZrJd
 CWfsQEDuoBb880u2l4f0WKw8DYPalCvy46fASTLsdZAr/DhGp70kqJZosmFIHTiu/DXdPU
 KPTSF0ThUF/QtDmjcZy+FLz2lavXft0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-L67PbGpCPB-DHI7R91BM2g-1; Fri, 25 Feb 2022 16:49:53 -0500
X-MC-Unique: L67PbGpCPB-DHI7R91BM2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE7B71006AA7;
 Fri, 25 Feb 2022 21:49:51 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B07E887BB5;
 Fri, 25 Feb 2022 21:49:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/5] drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline
 in BIOS on Asus TF103C (v2)
Date: Fri, 25 Feb 2022 22:49:30 +0100
Message-Id: <20220225214934.383168-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vtotal is wrong in the BIOS supplied modeline for the DSI panel on
the Asus TF103C leading to the last line of the display being shown
as the first line.

Original: "1280x800": 60 67700 1280 1312 1328 1376 800 808 812 820 0x8 0xa
Fixed:    "1280x800": 60 67700 1280 1312 1328 1376 800 808 812 816 0x8 0xa

The factory installed Android has a hardcoded modeline in its kernel,
causing it to not suffer from this BIOS bug;
and the Android boot-splash which uses the EFI FB which does have this bug
has the last line all black causing the bug to not be visible.

This commit introduces a generic DMI based quirk mechanism to vlv_dsi for
doing various fixups, and uses this to correct the modeline.

v2:
- s/mode_fixup/dmi_quirk/ to make the new DMI quirk mechanism more generic
- Add a comment with the old and new modelines to the patch and commit msg

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 06ef822c27bd..831ca6401c51 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -23,6 +23,7 @@
  * Author: Jani Nikula <jani.nikula@intel.com>
  */
 
+#include <linux/dmi.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -1831,6 +1832,36 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 	intel_dsi_log_params(intel_dsi);
 }
 
+typedef void (*vlv_dsi_dmi_quirk_func)(struct intel_dsi *intel_dsi,
+				       struct drm_display_mode *fixed_mode);
+
+/*
+ * Vtotal is wrong on the Asus TF103C leading to the last line of the display
+ * being shown as the first line. The factory installed Android has a hardcoded
+ * modeline, causing it to not suffer from this BIOS bug.
+ *
+ * Original mode: "1280x800": 60 67700 1280 1312 1328 1376 800 808 812 820 0x8 0xa
+ * Fixed    mode: "1280x800": 60 67700 1280 1312 1328 1376 800 808 812 816 0x8 0xa
+ */
+static void vlv_dsi_asus_tf103c_mode_fixup(struct intel_dsi *intel_dsi,
+					   struct drm_display_mode *fixed_mode)
+{
+	if (fixed_mode->vtotal == 820)
+		fixed_mode->vtotal -= 4;
+}
+
+static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
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
@@ -1840,6 +1871,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
 	struct drm_display_mode *current_mode, *fixed_mode;
+	const struct dmi_system_id *dmi_id;
 	enum port port;
 	enum pipe pipe;
 
@@ -1968,6 +2000,14 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 		goto err_cleanup_connector;
 	}
 
+	dmi_id = dmi_first_match(vlv_dsi_dmi_quirk_table);
+	if (dmi_id) {
+		vlv_dsi_dmi_quirk_func quirk_func =
+			(vlv_dsi_dmi_quirk_func)dmi_id->driver_data;
+
+		quirk_func(intel_dsi, fixed_mode);
+	}
+
 	intel_panel_init(&intel_connector->panel, fixed_mode, NULL);
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
-- 
2.35.1

