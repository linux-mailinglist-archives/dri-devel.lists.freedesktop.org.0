Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241F7A8D39
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 21:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9302A10E54E;
	Wed, 20 Sep 2023 19:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108910E551
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695239792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MD0RrfpQRpRBiB63gzF2nYaMsSToXY1skWl+a5+PJM=;
 b=OiNw7LWdP+gA1e37BnlHhzsf4v7u5OYl5KF09dt0JUtdnKab6e9JQ8F0MXqGm6lyOI/RAx
 WU2lGLLjDALHl+TqkMAbnkZ+Qby8ArKvKHQjIZgKB1bbQZg3V4UY73Ms0CjhKcwi4KKl4P
 9+E6+BEPyxzJB41YyqVxbErNWxhdGr0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-9doLGUQJNKm7f6Hhq9bTEg-1; Wed, 20 Sep 2023 15:56:29 -0400
X-MC-Unique: 9doLGUQJNKm7f6Hhq9bTEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87F333800BB8;
 Wed, 20 Sep 2023 19:56:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70452C15BB8;
 Wed, 20 Sep 2023 19:56:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 3/4] drm/i915/vlv_dsi: Add DMI quirk for backlight control
 issues on Lenovo Yoga Tab 3 (v2)
Date: Wed, 20 Sep 2023 21:56:12 +0200
Message-ID: <20230920195613.304091-4-hdegoede@redhat.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the Lenovo Yoga Tab 3 Pro YT3-X90F there are 2 issues with the backlight
on/off MIPI sequences:

1. The backlight on sequence has an I2C MIPI sequence element which uses
   bus 0, but there is a bogus I2cSerialBus resource under the GPU in
   the DSDT which causes i2c_acpi_find_adapter() to pick the wrong bus.

2. There is no backlight off sequence, causing the backlight to stay on.

Add a DMI quirk fixing both issues.

v2:
- Add Closes tag to gitlab issue with drm.debug=0xe, VBT info

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9380
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index f69cafe8a17d..55da627a8b8d 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1805,6 +1805,31 @@ static void vlv_dsi_lenovo_yoga_tab2_size_fixup(struct intel_dsi *intel_dsi)
 	}
 }
 
+/*
+ * On the Lenovo Yoga Tab 3 Pro YT3-X90F there are 2 problems:
+ * 1. i2c_acpi_find_adapter() picks the wrong adapter causing mipi_exec_i2c()
+ *    to not work. Fix this by setting i2c_bus_num.
+ * 2. There is no backlight off MIPI sequence, causing the backlight to stay on.
+ *    Add a backlight off sequence mirroring the existing backlight on sequence.
+ *
+ * https://gitlab.freedesktop.org/drm/intel/-/issues/9380
+ */
+static void vlv_dsi_lenovo_yoga_tab3_backlight_fixup(struct intel_dsi *intel_dsi)
+{
+	static const u8 backlight_off_sequence[16] = {
+		/* Header Seq-id 7, length after header 11 bytes */
+		0x07, 0x0b, 0x00, 0x00, 0x00,
+		/* MIPI_SEQ_ELEM_I2C bus 0 addr 0x2c reg 0x00 data-len 1 data 0x00 */
+		0x04, 0x08, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x01, 0x00,
+		/* MIPI_SEQ_ELEM_END */
+		0x00
+	};
+	struct intel_connector *connector = intel_dsi->attached_connector;
+
+	intel_dsi->i2c_bus_num = 0;
+	connector->panel.vbt.dsi.sequence[MIPI_SEQ_BACKLIGHT_OFF] = backlight_off_sequence;
+}
+
 static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
 	{
 		/* Asus Transformer Pad TF103C */
@@ -1828,6 +1853,15 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
 		},
 		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab2_size_fixup,
 	},
+	{
+		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data = (void *)vlv_dsi_lenovo_yoga_tab3_backlight_fixup,
+	},
 	{ }
 };
 
-- 
2.41.0

