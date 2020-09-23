Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5B275799
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D0A06E992;
	Wed, 23 Sep 2020 11:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742996E984
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 11:58:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwORt029752;
 Wed, 23 Sep 2020 06:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600862304;
 bh=81kpyZX9IZ53paxCu9E0Kb8n3WeCSE4d3i/WYG2myJw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=u6ZKIu5NwMGOv1qOr57qWLuobRPc20sawRATq3Mx6tHWluPbV98H2vcwj8dwBY8T+
 j1UwoFy+ASXrOfPaIE0gJt4zTa3nMjkzTmMgMElGadxIFC8g4a2W0WOgx3CA1/XZDB
 j3t9vG6Jnm/16RLNdUPyW9uT1vgt+TgU582e3iUI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwOV4047783;
 Wed, 23 Sep 2020 06:58:24 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 06:58:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 06:58:24 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwJhv038765;
 Wed, 23 Sep 2020 06:58:22 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/5] drm: add legacy support for using degamma for gamma
Date: Wed, 23 Sep 2020 14:57:23 +0300
Message-ID: <20200923115727.248705-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200923115727.248705-1-tomi.valkeinen@ti.com>
References: <20200923115727.248705-1-tomi.valkeinen@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
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
---
 drivers/gpu/drm/drm_atomic_helper.c | 81 ++++++++++++++++++++++-------
 include/drm/drm_atomic_helper.h     |  4 ++
 2 files changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9e1ad493e689..5ba359114df6 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3469,24 +3469,11 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
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
@@ -3525,9 +3512,11 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
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
@@ -3537,8 +3526,60 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
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
index b268180c97eb..e60f5a600195 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -148,6 +148,10 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
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
