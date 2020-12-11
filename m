Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BC22D74D7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185B6EDB4;
	Fri, 11 Dec 2020 11:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D076EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 11:43:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBBh107025051;
 Fri, 11 Dec 2020 05:43:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607686981;
 bh=AlRBzYNcomagPtt1npltPQoSZqB4UpwgyXdUwgnU3ig=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=B51Huo0m+r469c1NiP7is12JEzm6uuCCOalteVTyAZpH8oQKld6+bi8uiI275KKXn
 tXKMEmvz90Q3l+Xs4iaf7r2ONo1EgG1FTS0sKfZtQYAb//Oose/CJ1WAakF3gsV1iX
 owz/yw4/RCnucgbClmAULBQQGau/tidmK9zWdJiM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBBh1kI078306
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 05:43:01 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 05:43:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 05:43:00 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBBgmIN106824;
 Fri, 11 Dec 2020 05:42:56 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 2/2] drm: add legacy support for using degamma for gamma
Date: Fri, 11 Dec 2020 13:42:37 +0200
Message-ID: <20201211114237.213288-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211114237.213288-1-tomi.valkeinen@ti.com>
References: <20201211114237.213288-1-tomi.valkeinen@ti.com>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM core handles legacy gamma-set ioctl by setting GAMMA_LUT and
clearing CTM and DEGAMMA_LUT.

This works fine on HW where we have either:

degamma -> ctm -> gamma -> out

or

ctm -> gamma -> out

However, if the HW has gamma table before ctm, the atomic property
should be DEGAMMA_LUT, and thus we have:

degamma -> ctm -> out

This is fine for userspace which sets gamma table using the properties,
as the userspace can check for the existence of gamma & degamma, but the
legacy gamma-set ioctl does not work.

Change the DRM core to use DEGAMMA_LUT instead of GAMMA_LUT when the
latter is unavailable.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/drm_fb_helper.c  |  5 +++++
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 65eb36dc92bf..9100aac1570c 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -91,7 +91,7 @@
  *
  * There is also support for a legacy gamma table, which is set up by calling
  * drm_mode_crtc_set_gamma_size(). The DRM core will then alias the legacy gamma
- * ramp with "GAMMA_LUT".
+ * ramp with "GAMMA_LUT" or, if that is unavailable, "DEGAMMA_LUT".
  *
  * Support for different non RGB color encodings is controlled through
  * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
@@ -238,6 +238,7 @@ EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
 static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 {
 	uint32_t gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
+	uint32_t degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
 
 	if (!crtc->gamma_size)
 		return false;
@@ -245,7 +246,8 @@ static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 	if (crtc->funcs->gamma_set)
 		return true;
 
-	return !!drm_mode_obj_find_prop_id(&crtc->base, gamma_id);
+	return !!(drm_mode_obj_find_prop_id(&crtc->base, gamma_id) ||
+		  drm_mode_obj_find_prop_id(&crtc->base, degamma_id));
 }
 
 /**
@@ -276,12 +278,22 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	struct drm_property_blob *blob;
 	struct drm_color_lut *blob_data;
+	uint32_t gamma_id = dev->mode_config.gamma_lut_property->base.id;
+	uint32_t degamma_id = dev->mode_config.degamma_lut_property->base.id;
+	bool use_gamma_lut;
 	int i, ret = 0;
 	bool replaced;
 
 	if (crtc->funcs->gamma_set)
 		return crtc->funcs->gamma_set(crtc, red, green, blue, size, ctx);
 
+	if (drm_mode_obj_find_prop_id(&crtc->base, gamma_id))
+		use_gamma_lut = true;
+	else if (drm_mode_obj_find_prop_id(&crtc->base, degamma_id))
+		use_gamma_lut = false;
+	else
+		return -ENODEV;
+
 	state = drm_atomic_state_alloc(crtc->dev);
 	if (!state)
 		return -ENOMEM;
@@ -311,9 +323,11 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 	}
 
 	/* Set GAMMA_LUT and reset DEGAMMA_LUT and CTM */
-	replaced = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
+	replaced = drm_property_replace_blob(&crtc_state->degamma_lut,
+					     use_gamma_lut ? NULL : blob);
 	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
-	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
+	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
+					      use_gamma_lut ? blob : NULL);
 	crtc_state->color_mgmt_changed |= replaced;
 
 	ret = drm_atomic_commit(state);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e82db0f4e771..5ad19785daee 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1059,6 +1059,11 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 			goto out_state;
 		}
 
+		/*
+		 * FIXME: This always uses gamma_lut. Some HW have only
+		 * degamma_lut, in which case we should reset gamma_lut and set
+		 * degamma_lut. See drm_crtc_legacy_gamma_set().
+		 */
 		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
 						      NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
