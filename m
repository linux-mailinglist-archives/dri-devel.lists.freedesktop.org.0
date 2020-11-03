Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB792A3E50
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2EF6E855;
	Tue,  3 Nov 2020 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80936E855
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:04:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A384GeW124235;
 Tue, 3 Nov 2020 02:04:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604390656;
 bh=zFCZbVYTtR4/jiDmpkI7k54dTFJuRkTYNHOm6W+uaXQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eOtjbxgdNycOv/LyTxDCxzRqqZeB2L6TIW4rTZ35BiZJFT/mtkVz0QVo0Tzm08ivn
 7fY4H8yM59OP+2EPAI0T96+XqM2J0wTnjTNtrinFYFcmvUqpf0WtHWWzwOA3d3oh+n
 O2oxYa2xpXKG1TMkcogU5eptlIe4uTwNtXOxOEy8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A384GaA026193
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 02:04:16 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 02:04:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 02:04:16 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3849eu095622;
 Tue, 3 Nov 2020 02:04:14 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
Subject: [PATCH v2 2/5] drm/omap: use degamma property for gamma table
Date: Tue, 3 Nov 2020 10:03:07 +0200
Message-ID: <20201103080310.164453-3-tomi.valkeinen@ti.com>
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

omapdrm supports gamma via GAMMA_LUT property. However, the HW we have
is:

gamma -> ctm -> out

instead of what the model DRM framework uses:

ctm -> gamma -> out

As the following patches add CTM support for omapdrm, lets first fix the
gamma.

This patch changes the property from GAMMA_LUT to DEGAMMA_LUT, and uses
drm_atomic_helper_legacy_degamma_set for gamma_set helper. Thus we will
have:

degamma -> ctm -> out

and the legacy ioctl will continue working as before.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index d7442aa55f89..d40220b2f312 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -575,8 +575,8 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	struct drm_plane_state *pri_state;
 
-	if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
-		unsigned int length = crtc_state->gamma_lut->length /
+	if (crtc_state->color_mgmt_changed && crtc_state->degamma_lut) {
+		unsigned int length = crtc_state->degamma_lut->length /
 			sizeof(struct drm_color_lut);
 
 		if (length < 2)
@@ -617,10 +617,10 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 		struct drm_color_lut *lut = NULL;
 		unsigned int length = 0;
 
-		if (crtc->state->gamma_lut) {
+		if (crtc->state->degamma_lut) {
 			lut = (struct drm_color_lut *)
-				crtc->state->gamma_lut->data;
-			length = crtc->state->gamma_lut->length /
+				crtc->state->degamma_lut->data;
+			length = crtc->state->degamma_lut->length /
 				sizeof(*lut);
 		}
 		priv->dispc_ops->mgr_set_gamma(priv->dispc, omap_crtc->channel,
@@ -741,7 +741,7 @@ static const struct drm_crtc_funcs omap_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = omap_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
-	.gamma_set = drm_atomic_helper_legacy_gamma_set,
+	.gamma_set = drm_atomic_helper_legacy_degamma_set,
 	.atomic_duplicate_state = omap_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.atomic_set_property = omap_crtc_atomic_set_property,
@@ -842,7 +842,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
 
-		drm_crtc_enable_color_mgmt(crtc, 0, false, gamma_lut_size);
+		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, false, 0);
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 	}
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
