Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697E7A8D3A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B726410E551;
	Wed, 20 Sep 2023 19:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB210E54D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqNzyDz4cREI90UtQiQYs75oZQPILvBZMvQm1D6ktbw=;
 b=L5jUY5ERFlH3wuN5OE7oDqPFBmUqY0BfcrjCn35DrH0desUs1pt1ItiCi97IIxTrs6VTas
 tAzJ02OFQ+m6a+ae7d20Y426+z5Ygcop0SFGtwkAv04mDjDLb95/ioUM4Lq0PNjeNOBefl
 c+L8OQoxdHeWMkeN+JloHkEEqK+OE00=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-Uwbpmm6RMH6W7XwmKX2B-g-1; Wed, 20 Sep 2023 15:56:26 -0400
X-MC-Unique: Uwbpmm6RMH6W7XwmKX2B-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FD7028EC107;
 Wed, 20 Sep 2023 19:56:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C31D2C15BB8;
 Wed, 20 Sep 2023 19:56:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 2/4] drm/i915/vlv_dsi: Add DMI quirk for wrong I2C bus and
 panel size on Lenovo Yoga Tablet 2 series (v3)
Date: Wed, 20 Sep 2023 21:56:11 +0200
Message-ID: <20230920195613.304091-3-hdegoede@redhat.com>
In-Reply-To: <20230920195613.304091-1-hdegoede@redhat.com>
References: <20230920195613.304091-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the Lenovo Yoga Tablet 2 830 / 1050 there are 2 problems:

1. The I2C MIPI sequence elements reference bus 3. ACPI has I2C1 - I2C7
   which under Linux become bus 0 - 6. And the MIPI sequence reference
   to bus 3 is indented for I2C3 which is bus 2 under Linux.

   This leads to errors like these:
   [  178.244049] i2c_designware 80860F41:03: controller timed out
   [  178.245703] i915 0000:00:02.0: [drm] *ERROR* Failed to xfer payload of size (1) to reg (169)
   There are 3 timeouts when the panel is on, delaying
   waking up the screen on a key press by 3 seconds.

   Note mipi_exec_i2c() cannot just subtract 1 from the bus
   given in the I2C MIPI sequence element. Since on other
   devices the I2C bus-numbers used in the MIPI sequences do
   actually start at 0.

2. width_/height_mm contain a bogus 192mm x 120mm size. This is
   especially a problem on the 8" 830 version which uses a 10:16
   portrait screen where as the bogus size is 16:10.

Add a DMI quirk to override the I2C bus and the panel size with
the correct values.

Note both the 10" 1050 models as well as the 8" 830 models use the same
mainboard and thus the same DMI strings. The 10" 1050 uses a 1920x1200
landscape screen, where as the 8" 830 uses a 1200x1920 portrait screen,
so the quirk handling uses the display resolution to detect the model.

v2:
- Also override i2c_bus_num to fix mipi_exec_i2c() timeouts

v3:
- Add Closes tag to gitlab issue with drm.debug=0xe, VBT info

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9379
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 0d3aabf6a1dd..f69cafe8a17d 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1767,6 +1767,44 @@ static void vlv_dsi_asus_tf103c_mode_fixup(struct intel_dsi *intel_dsi)
 		fixed_mode->vtotal -= 4;
 }
 
+/*
+ * On the Lenovo Yoga Tablet 2 830 / 1050 there are 2 problems:
+ * 1. The I2C MIPI sequence elements reference bus 3. ACPI has I2C1 - I2C7
+ *    which under Linux become bus 0 - 6. And the MIPI sequence reference
+ *    to bus 3 is indented for I2C3 which is bus 2 under Linux.
+ *
+ *    Note mipi_exec_i2c() cannot just subtract 1 from the bus
+ *    given in the I2C MIPI sequence element. Since on other
+ *    devices the I2C bus-numbers used in the MIPI sequences do
+ *    actually start at 0.
+ *
+ * 2. width_/height_mm contain a bogus 192mm x 120mm size. This is
+ *    especially a problem on the 8" 830 version which uses a 10:16
+ *    portrait screen where as the bogus size is 16:10.
+ *
+ * https://gitlab.freedesktop.org/drm/intel/-/issues/9379
+ */
+static void vlv_dsi_lenovo_yoga_tab2_size_fixup(struct intel_dsi *intel_dsi)
+{
+	const struct drm_display_mode *fixed_mode =
+		intel_panel_preferred_fixed_mode(intel_dsi->attached_connector);
+	struct drm_display_info *info = &intel_dsi->attached_connector->base.display_info;
+
+	intel_dsi->i2c_bus_num = 2;
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
 static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
 	{
 		/* Asus Transformer Pad TF103C */
@@ -1776,6 +1814,20 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
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
+		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab2_size_fixup,
+	},
 	{ }
 };
 
-- 
2.41.0

