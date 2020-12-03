Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB962CD4E5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 12:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8C96E995;
	Thu,  3 Dec 2020 11:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42986E983
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 11:49:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3BnAla046631;
 Thu, 3 Dec 2020 05:49:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606996150;
 bh=XwkbjGydtQkeR6TkGAX4trHaIW+i6Rld6FCr/CUKqVc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HEtLsXT6inmRkTzHvxehuRPdG2pgtuYuuxi0U27djpvVaEUZI6rs4/DdTMxUpmAbY
 EXky6afTHWzfxY0qUXWiQ/OzQ1IScvYPZMsduVbiNVIlEWjCWL+DAwWChd22V4ZuTP
 Ga9zRxfJan5NRJw7gEWkObE9DTKA3+oxhckgQ3LI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3Bn9EA098519
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Dec 2020 05:49:09 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 05:49:09 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 05:49:09 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3Bn0PJ094649;
 Thu, 3 Dec 2020 05:49:05 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm: add legacy support for using degamma for gamma
Date: Thu, 3 Dec 2020 13:48:44 +0200
Message-ID: <20201203114845.232911-2-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203114845.232911-1-tomi.valkeinen@ti.com>
References: <20201203114845.232911-1-tomi.valkeinen@ti.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++++++++---
 drivers/gpu/drm/drm_color_mgmt.c    |  4 ++++
 include/drm/drm_crtc.h              |  3 +++
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ba1507036f26..fe59c8ea42a9 100644
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
@@ -3525,6 +3529,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 	struct drm_color_lut *blob_data;
 	int i, ret = 0;
 	bool replaced;
+	bool use_degamma;
+
+	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
+		return -ENODEV;
+
+	use_degamma = !crtc->has_gamma_prop;
 
 	state = drm_atomic_state_alloc(crtc->dev);
 	if (!state)
@@ -3554,10 +3564,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
 		goto fail;
 	}
 
-	/* Reset DEGAMMA_LUT and CTM properties. */
-	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
+	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
+	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
+					      use_degamma ? blob : NULL);
 	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
-	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
+	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
+					      use_degamma ? NULL : blob);
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
 
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index ba839e5e357d..9e1f06047e3d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1084,6 +1084,9 @@ struct drm_crtc {
 	 */
 	uint16_t *gamma_store;
 
+	bool has_gamma_prop;
+	bool has_degamma_prop;
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
