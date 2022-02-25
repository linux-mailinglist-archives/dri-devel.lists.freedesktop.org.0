Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030B4C50E5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1A10E37F;
	Fri, 25 Feb 2022 21:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C922310E974
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645825801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5Q0aZxL/HvCOpVLF1z1+VzDRQJZ96k0KvBU7wnO280=;
 b=KPd2QDooK/dBzxYJPrJndBr2s8zJIVJLA7lc9CccWY8soxfkQ3eISSgGIczx1bvKAJLq5A
 nr5axSxISQyyjvVtj9KqgTvfF6eeh49Q8ss/loMvb6cZq7xjCqtmD0UxT2l0CcrLSa//QI
 ec/8GocGj4KQpB7fpb3lg7rvnJ7ZsVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-c1VbCK3HPvmSJGQYU-v9-g-1; Fri, 25 Feb 2022 16:49:58 -0500
X-MC-Unique: c1VbCK3HPvmSJGQYU-v9-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A17A51091DA1;
 Fri, 25 Feb 2022 21:49:56 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 586D587BB5;
 Fri, 25 Feb 2022 21:49:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 2/5] drm/i915/vlv_dsi: Add DMI quirk for wrong panel size on
 Lenovo Yoga Tablet 2 series
Date: Fri, 25 Feb 2022 22:49:31 +0100
Message-Id: <20220225214934.383168-2-hdegoede@redhat.com>
In-Reply-To: <20220225214934.383168-1-hdegoede@redhat.com>
References: <20220225214934.383168-1-hdegoede@redhat.com>
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

On the Lenovo Yoga Tablet 2 830 / 1050 the VBT contains a bogus
192mm x 120mm size. This is especially a problem on the 8" 830 version
which uses a 10:16 portrait screen where as the bogus size is 16:10.

Add a DMI quirk to override the wrong panel size with the correct one.
Note both the 10" 1050 models as well as the 8" 830 models use the same
mainboard and thus the same DMI strings. The 10" 1050 uses a 1920x1200
landscape screen, where as the 8" 830 uses a 1200x1920 portrait screen,
so the quirk handling uses the display resolution to detect the model.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/vlv_dsi.c | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 831ca6401c51..0ddc0c8cd4f7 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1850,6 +1850,29 @@ static void vlv_dsi_asus_tf103c_mode_fixup(struct intel_dsi *intel_dsi,
 		fixed_mode->vtotal -= 4;
 }
 
+/*
+ * On the Lenovo Yoga Tablet 2 830 / 1050 width_/height_mm contain a bogus
+ * 192mm x 120mm size. This is especially a problem on the 8" 830 version which
+ * uses a 10:16 portrait screen where as the bogus size is 16:10.
+ */
+static void vlv_dsi_lenovo_yoga_tab2_size_fixup(struct intel_dsi *intel_dsi,
+						struct drm_display_mode *fixed_mode)
+{
+	struct drm_display_info *info = &intel_dsi->attached_connector->base.display_info;
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
@@ -1859,6 +1882,20 @@ static const struct dmi_system_id vlv_dsi_dmi_quirk_table[] = {
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
2.35.1

