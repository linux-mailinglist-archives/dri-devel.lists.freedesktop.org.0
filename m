Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D622D5D2C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B7E6E5B9;
	Thu, 10 Dec 2020 14:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121EF6E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:09:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAE9Efd076557;
 Thu, 10 Dec 2020 08:09:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607609354;
 bh=/0noUIDI1kC3NNn9hsmFCto6oZcn4JaA8AYXIIP6wPc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eFHbA88xVow/ds7PRGV6LHnnu2p/u/GLqX5jBTFfc6izXTk2NAUKjkkY8SWLRuRwK
 +QXRyKuX86FHD8MWGS1MGBz5lGWjy5/gt3oK0dJ2n+ZsJ63k0e/P3eWpn+wWiBmpyi
 mz3/9ChR31bfswcpHB3hoW3KtYfiaWgV9sJvzVT0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAE9DHQ063562
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 08:09:14 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 08:09:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 08:09:13 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAE90cC086731;
 Thu, 10 Dec 2020 08:09:09 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 2/2] drm: add legacy support for using degamma for gamma
Date: Thu, 10 Dec 2020 16:08:52 +0200
Message-ID: <20201210140852.1040054-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
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
 drivers/gpu/drm/drm_color_mgmt.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index c4e4d59c4432..8733d9d95b82 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -238,6 +238,7 @@ EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
 bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 {
 	uint32_t gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
+	uint32_t degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
 
 	if (!crtc->gamma_size)
 		return false;
@@ -245,7 +246,8 @@ bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 	if (crtc->funcs->gamma_set)
 		return true;
 
-	return !!drm_mode_obj_find_prop_id(&crtc->base, gamma_id);
+	return !!(drm_mode_obj_find_prop_id(&crtc->base, gamma_id) ||
+		  drm_mode_obj_find_prop_id(&crtc->base, degamma_id));
 }
 EXPORT_SYMBOL(drm_crtc_supports_legacy_gamma);
 
@@ -256,18 +258,28 @@ EXPORT_SYMBOL(drm_crtc_supports_legacy_gamma);
  * @blob: property blob for the gamma ramp
  *
  * Set given gamma ramp to the crtc using GAMMA_LUT property and resetting
- * DEGAMMA_LUT and CTM.
+ * DEGAMMA_LUT and CTM, or if GAMMA_LUT is not available, using DEGAMMA_LUT
+ * and resetting GAMMA_LUT and CTM.
  */
 int drm_crtc_gamma_ramp_set(struct drm_atomic_state *state, struct drm_crtc *crtc,
 		       struct drm_property_blob *blob)
 {
+	uint32_t gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
+	uint32_t degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
 	struct drm_crtc_state *crtc_state;
 	struct drm_property_blob *gamma_blob;
 	struct drm_property_blob *degamma_blob;
 	bool replaced;
 
-	gamma_blob = blob;
-	degamma_blob = NULL;
+	if (drm_mode_obj_find_prop_id(&crtc->base, gamma_id)) {
+		gamma_blob = blob;
+		degamma_blob = NULL;
+	} else if (drm_mode_obj_find_prop_id(&crtc->base, degamma_id)) {
+		gamma_blob = NULL;
+		degamma_blob = blob;
+	} else {
+		return -ENODEV;
+	}
 
 	crtc_state = drm_atomic_get_crtc_state(state, crtc);
 	if (IS_ERR(crtc_state))
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
