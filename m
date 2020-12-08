Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21B2D2C5C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 14:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609B26E958;
	Tue,  8 Dec 2020 13:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149556E92D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 13:58:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8DwL5f096239;
 Tue, 8 Dec 2020 07:58:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607435901;
 bh=Gz8IFUnwoC5xNWWCE3iQJslJwZ9tWuDzj5MDxeSr80Q=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fqi8Lt0jiNW0xM3FttVWp6biqdaDm/E9tEljH24qP1COOMsXhrlsB7pPf59fJP7ak
 iEsUUK1ZqM/JltVFqQO8SWKbBPfOOOPaVkgoxUvOPXDukL2gsA67peznK57ML+Y39w
 0rc0ycvNp1aP45w0yrnzZA3Zb8uCA7TvEPgR/bT8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8DwLxo108090
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 07:58:21 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 07:58:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 07:58:21 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8DwCrO051014;
 Tue, 8 Dec 2020 07:58:17 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 1/2] drm: add legacy support for using degamma for gamma
Date: Tue, 8 Dec 2020 15:57:58 +0200
Message-ID: <20201208135759.451772-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208135759.451772-1-tomi.valkeinen@ti.com>
References: <20201208135759.451772-1-tomi.valkeinen@ti.com>
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

This patch fixes the issue by changing
drm_atomic_helper_legacy_gamma_set() so that GAMMA_LUT will be used if
it exists, and DEGAMMA_LUT will be used as a fallback.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 15 ++++++++++++---
 drivers/gpu/drm/drm_color_mgmt.c    |  4 ++++
 drivers/gpu/drm/drm_fb_helper.c     |  8 ++++++--
 include/drm/drm_crtc.h              |  3 +++
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ba1507036f26..117b186fe646 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3512,6 +3512,10 @@ EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
  * that support color management through the DEGAMMA_LUT/GAMMA_LUT
  * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
  * how the atomic color management and gamma tables work.
+ *
+ * This function uses the GAMMA_LUT or DEGAMMA_LUT property for the gamma table.
+ * GAMMA_LUT property is used if it exists, and DEGAMMA_LUT property is used as
+ * a fallback.
  */
 int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 				       u16 *red, u16 *green, u16 *blue,
@@ -3526,6 +3530,9 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	int i, ret = 0;
 	bool replaced;
 
+	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
+		return -ENODEV;
+
 	state = drm_atomic_state_alloc(crtc->dev);
 	if (!state)
 		return -ENOMEM;
@@ -3554,10 +3561,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 		goto fail;
 	}
 
-	/* Reset DEGAMMA_LUT and CTM properties. */
-	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
+	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
+	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
+					      crtc->has_gamma_prop ? NULL : blob);
 	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
-	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
+	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
+					      crtc->has_gamma_prop ? blob : NULL);
 	crtc_state->color_mgmt_changed |= replaced;
 
 	ret = drm_atomic_commit(state);
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3bcabc2f6e0e..956e59d5f6a7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -176,6 +176,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   degamma_lut_size);
 	}
 
+	crtc->has_degamma_prop = !!degamma_lut_size;
+
 	if (has_ctm)
 		drm_object_attach_property(&crtc->base,
 					   config->ctm_property, 0);
@@ -187,6 +189,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 					   config->gamma_lut_size_property,
 					   gamma_lut_size);
 	}
+
+	crtc->has_gamma_prop = !!gamma_lut_size;
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 25edf670867c..b0906ef97617 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1001,6 +1001,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
 
+		if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
+			continue;
+
 		if (!gamma_lut)
 			gamma_lut = setcmap_new_gamma_lut(crtc, cmap);
 		if (IS_ERR(gamma_lut)) {
@@ -1015,11 +1018,12 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 			goto out_state;
 		}
 
+		/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
 		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
-						      NULL);
+						      crtc->has_gamma_prop ? NULL : gamma_lut);
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
-						      gamma_lut);
+						      crtc->has_gamma_prop ? gamma_lut : NULL);
 		crtc_state->color_mgmt_changed |= replaced;
 	}
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index ba839e5e357d..4d9e217e5040 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1084,6 +1084,9 @@ struct drm_crtc {
 	 */
 	uint16_t *gamma_store;
 
+	bool has_gamma_prop : 1;
+	bool has_degamma_prop : 1;
+
 	/** @helper_private: mid-layer private data */
 	const struct drm_crtc_helper_funcs *helper_private;
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
