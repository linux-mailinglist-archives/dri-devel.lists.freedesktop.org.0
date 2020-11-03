Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEA2A3E4E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BFB6EB92;
	Tue,  3 Nov 2020 08:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4226EB92
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:04:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A384EW0124229;
 Tue, 3 Nov 2020 02:04:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604390654;
 bh=vEU08qZ0ivvyO5bKW/iaFZMbk0jW0fNa9pjFJbYL4BE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=n9qZqcmxGGnNGmV3pj9HJiwH8Jjxz08v36C5V0gmRFqu1ApnBtTHg9JCtinHgzCjB
 lsX+h6Ga2BVNGd0WQokDakdpWlVm4EeqyDsq+M6Upv60Mm3qLIrCsuUqS/4DDmAtpI
 zVMvo6WGrhwd9ItAFNVY5yoCs3MzVrdBwT2/k2MA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A384E5d112472
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 02:04:14 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 02:04:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 02:04:14 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3849et095622;
 Tue, 3 Nov 2020 02:04:12 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
Subject: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
Date: Tue, 3 Nov 2020 10:03:06 +0200
Message-ID: <20201103080310.164453-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103080310.164453-1-tomi.valkeinen@ti.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sekhar Nori <nsekhar@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have drm_atomic_helper_legacy_gamma_set() helper which can
be used to handle legacy gamma-set ioctl.
drm_atomic_helper_legacy_gamma_set() sets GAMMA_LUT, and clears
CTM and DEGAMMA_LUT. This works fine on HW where we have either:

degamma -> ctm -> gamma -> out

or

ctm -> gamma -> out

However, if the HW has gamma table before ctm, the atomic property
should be DEGAMMA_LUT, and thus we have:

degamma -> ctm -> out

This is fine for userspace which sets gamma table using the properties,
as the userspace can check for the existence of gamma & degamma, but the
legacy gamma-set ioctl does not work.

This patch adds a new helper, drm_atomic_helper_legacy_degamma_set(),
which can be used instead of drm_atomic_helper_legacy_gamma_set() when
the DEGAMMA_LUT is the underlying property that needs to be set.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 81 ++++++++++++++++++++++-------
 include/drm/drm_atomic_helper.h     |  4 ++
 2 files changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ddd0e3239150..23cbed541dc7 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3499,24 +3499,11 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
 
-/**
- * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table
- * @crtc: CRTC object
- * @red: red correction table
- * @green: green correction table
- * @blue: green correction table
- * @size: size of the tables
- * @ctx: lock acquire context
- *
- * Implements support for legacy gamma correction table for drivers
- * that support color management through the DEGAMMA_LUT/GAMMA_LUT
- * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
- * how the atomic color management and gamma tables work.
- */
-int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
-				       u16 *red, u16 *green, u16 *blue,
-				       uint32_t size,
-				       struct drm_modeset_acquire_ctx *ctx)
+static int legacy_gamma_degamma_set(struct drm_crtc *crtc,
+				    u16 *red, u16 *green, u16 *blue,
+				    uint32_t size,
+				    struct drm_modeset_acquire_ctx *ctx,
+				    bool use_degamma)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_atomic_state *state;
@@ -3555,9 +3542,11 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	}
 
 	/* Reset DEGAMMA_LUT and CTM properties. */
-	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
+	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
+					      use_degamma ? blob : NULL);
 	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
-	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
+	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
+					      use_degamma ? NULL : blob);
 	crtc_state->color_mgmt_changed |= replaced;
 
 	ret = drm_atomic_commit(state);
@@ -3567,8 +3556,60 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	drm_property_blob_put(blob);
 	return ret;
 }
+
+/**
+ * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table using gamma_lut
+ * @crtc: CRTC object
+ * @red: red correction table
+ * @green: green correction table
+ * @blue: green correction table
+ * @size: size of the tables
+ * @ctx: lock acquire context
+ *
+ * Implements support for legacy gamma correction table for drivers
+ * that support color management through the DEGAMMA_LUT/GAMMA_LUT
+ * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
+ * how the atomic color management and gamma tables work.
+ *
+ * This function uses GAMMA_LUT property for the gamma table. This function
+ * can be used when the driver exposes either only GAMMA_LUT or both GAMMA_LUT
+ * and DEGAMMA_LUT.
+ */
+int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
+				       u16 *red, u16 *green, u16 *blue,
+				       uint32_t size,
+				       struct drm_modeset_acquire_ctx *ctx)
+{
+	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, false);
+}
 EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
 
+/**
+ * drm_atomic_helper_legacy_degamma_set - set the legacy gamma correction table using degamma_lut
+ * @crtc: CRTC object
+ * @red: red correction table
+ * @green: green correction table
+ * @blue: green correction table
+ * @size: size of the tables
+ * @ctx: lock acquire context
+ *
+ * Implements support for legacy gamma correction table for drivers
+ * that support color management through the DEGAMMA_LUT/GAMMA_LUT
+ * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
+ * how the atomic color management and gamma tables work.
+ *
+ * This function uses DEGAMMA_LUT property for the gamma table. This function
+ * can be used when the driver exposes only DEGAMNMA_LUT.
+ */
+int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
+					 u16 *red, u16 *green, u16 *blue,
+					 uint32_t size,
+					 struct drm_modeset_acquire_ctx *ctx)
+{
+	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, true);
+}
+EXPORT_SYMBOL(drm_atomic_helper_legacy_degamma_set);
+
 /**
  * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
  *						  the input end of a bridge
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 85df04c8e62f..561c78680388 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -151,6 +151,10 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 				       u16 *red, u16 *green, u16 *blue,
 				       uint32_t size,
 				       struct drm_modeset_acquire_ctx *ctx);
+int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
+					 u16 *red, u16 *green, u16 *blue,
+					 uint32_t size,
+					 struct drm_modeset_acquire_ctx *ctx);
 
 /**
  * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
