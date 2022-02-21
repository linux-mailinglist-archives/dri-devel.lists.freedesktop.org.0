Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F394BECE3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 23:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E224610E3E8;
	Mon, 21 Feb 2022 22:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBBB10E3E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645481181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1yW1M2dkLzBqH5mIpakZf+eqzzqwFabHRn+0hiLN50=;
 b=dSLOwFPfQSpKl4GPW9H3O21k+J1jE5LgnREyCjDGS8YuAImjjJe7Fxu9FpXwDj0bpizxjA
 E50PQRD0dZz7GQdJhcGx2wnOPdmw3BRFFuI0vLrWVkQqAkoiMWcdM0pGRmri0psrPjvSmY
 Rd5OaR4FbXcLtRbZefHcUGBWegjeRhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-aL377bfuNCKcO7GKxl-YCQ-1; Mon, 21 Feb 2022 17:06:17 -0500
X-MC-Unique: aL377bfuNCKcO7GKxl-YCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80081091DA1;
 Mon, 21 Feb 2022 22:06:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CEA5BC27;
 Mon, 21 Feb 2022 22:06:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/i915/vlv_dsi: Add DMI quirk for wrong panel size on
 Lenovo Yoga Tablet 2 series
Date: Mon, 21 Feb 2022 23:06:08 +0100
Message-Id: <20220221220608.12131-2-hdegoede@redhat.com>
In-Reply-To: <20220221220608.12131-1-hdegoede@redhat.com>
References: <20220221220608.12131-1-hdegoede@redhat.com>
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

On the Lenovo Yoga Tablet 2 830 / 1050 the VBT contains a bogus
192mm x 120mm size. This is especially a problem on the 8" 830 version
which uses a 10:16 portrait screen where as the bogus size is 16:10.

Add a DMI quirk to override the wrong panel size with the correct one.
Note both the 10" 1050 models as well as the 8" 830 models use the same
mainboard and thus the same DMI strings. The 10" 1050 uses a 1920x1200
landscape screen, where as the 8" 830 uses a 1200x1920 portrait screen,
so the quirk handling uses the display resolution to detect the model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 66f5cf32bb66..e370a039e991 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1847,6 +1847,29 @@ static void vlv_dsi_asus_tf103c_mode_fixup(struct drm_connector *connector,
 	fixed_mode->crtc_vtotal = 816;
 }
 
+/*
+ * On the Lenovo Yoga Tablet 2 830 / 1050 width_/height_mm contain a bogus
+ * 192mm x 120mm size. This is especially a problem on the 8" 830 version which
+ * uses a 10:16 portrait screen where as the bogus size is 16:10.
+ */
+static void vlv_dsi_lenovo_yoga_tab2_mode_fixup(struct drm_connector *connector,
+						struct drm_display_mode *fixed_mode)
+{
+	struct drm_display_info *info = &connector->display_info;
+
+	/*
+	 * The 10" 1050 uses a 1920x1200 landscape screen, where as the 8" 830
+	 * uses a 1200x1920 portrait screen.
+	 */
+	if (fixed_mode->hdisplay == 1920) {
+		info->width_mm = 216;
+		info->height_mm = 135;
+	} else {
+		info->width_mm = 107;
+		info->height_mm = 171;
+	}
+}
+
 static const struct dmi_system_id dmi_mode_fixup_table[] = {
 	{
 		/* Asus Transformer Pad TF103C */
@@ -1856,6 +1879,20 @@ static const struct dmi_system_id dmi_mode_fixup_table[] = {
 		},
 		.driver_data = (void *)vlv_dsi_asus_tf103c_mode_fixup,
 	},
+	{
+		/*
+		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
+		 * Lenovo Yoga Tablet 2 use the same mainboard)
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+			/* Partial match on beginning of BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
+		},
+		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab2_mode_fixup,
+	},
 	{ }
 };
 
-- 
2.35.1

