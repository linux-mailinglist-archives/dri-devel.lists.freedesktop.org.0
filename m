Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BA47B0F6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 17:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1D10F7E3;
	Mon, 20 Dec 2021 16:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC8510F7DE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640016835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZN5JEzjz2Tw+pkfbr6lx1bQ/6DLtomfwH5EeUBzdWoI=;
 b=JU6zFMUuze9q+6N7Oo7yTAP+bMcXGBLs5e5eD4W628bAkc1gFT616cqZSlc/gqXgO6IU0R
 jMxzqnputXLEsxxWEniJlz7JbjXvsIgJF6FgEZ92Vls7mcwfSh1GOjivdQCr3gH1ESu2cb
 TYv4A6ThAtJEsbKfWQrustOvyzU38tY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-Sj6IdsCFN8y9kb3II7MCDQ-1; Mon, 20 Dec 2021 11:13:52 -0500
X-MC-Unique: Sj6IdsCFN8y9kb3II7MCDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94C0A101796D;
 Mon, 20 Dec 2021 16:13:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2413BE2C9;
 Mon, 20 Dec 2021 16:13:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/vlv_dsi: Add DMI quirk for wrong panel modeline in
 BIOS on Asus TF103C
Date: Mon, 20 Dec 2021 17:13:43 +0100
Message-Id: <20211220161343.21975-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
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
 drivers/gpu/drm/i915/display/vlv_dsi.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index fc0dd0c4079e..98d64b6e132e 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -23,6 +23,7 @@
  * Author: Jani Nikula <jani.nikula@intel.com>
  */
 
+#include <linux/dmi.h>
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -1828,6 +1829,30 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
 	intel_dsi_log_params(intel_dsi);
 }
 
+typedef void (*vlv_dsi_mode_fixup_func)(struct drm_display_mode *fixed_mode);
+
+/*
+ * Vtotal is wrong on the Asus TF103C leading to the last line of the display
+ * being shown as the first line. The factory installed Android has a hardcoded
+ * modeline, causing it to not suffer from this BIOS bug.
+ */
+static void vlv_dsi_asus_tf103c_mode_fixup(struct drm_display_mode *fixed_mode)
+{
+	fixed_mode->vtotal = 816;
+	fixed_mode->crtc_vtotal = 816;
+}
+
+static const struct dmi_system_id dmi_mode_fixup_table[] = {
+	{
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
@@ -1837,6 +1862,8 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 	struct intel_connector *intel_connector;
 	struct drm_connector *connector;
 	struct drm_display_mode *current_mode, *fixed_mode;
+	const struct dmi_system_id *dmi_id;
+	vlv_dsi_mode_fixup_func mode_fixup;
 	enum port port;
 	enum pipe pipe;
 
@@ -1965,6 +1992,12 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 		goto err_cleanup_connector;
 	}
 
+	dmi_id = dmi_first_match(dmi_mode_fixup_table);
+	if (dmi_id) {
+		mode_fixup = (vlv_dsi_mode_fixup_func)dmi_id->driver_data;
+		mode_fixup(fixed_mode);
+	}
+
 	intel_panel_init(&intel_connector->panel, fixed_mode, NULL);
 	intel_backlight_setup(intel_connector, INVALID_PIPE);
 
-- 
2.33.1

