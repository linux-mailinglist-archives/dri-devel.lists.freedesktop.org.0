Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2027579B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0941D6E994;
	Wed, 23 Sep 2020 11:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95BF6E994
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 11:58:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwRug029762;
 Wed, 23 Sep 2020 06:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600862307;
 bh=YochQlWGFyA3cWoEkbNumxFSI6n0LilPR4enz10eGT8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FYwvp9t17FC50cFweulATgnfoRAw4tSc8jXlAw/mMzcqveUPipXoV3M0JOa81w1B7
 vVRVDu5z2HHJYak0PhcsNuNtbKpr7zA/2RlzvkGAg17Genntrv8hdkNTRtNP/hra9j
 VsDRy8cVioJOrC9fpsq7nzXXVbh42iG9QUxMWte0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NBwQeu036822
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 06:58:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 06:58:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 06:58:26 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NBwJhw038765;
 Wed, 23 Sep 2020 06:58:24 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/5] drm/omap: use degamma property for gamma table
Date: Wed, 23 Sep 2020 14:57:24 +0300
Message-ID: <20200923115727.248705-3-tomi.valkeinen@ti.com>
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
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 328a4a74f534..6116af920660 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -573,8 +573,8 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_plane_state *pri_state;
 
-	if (state->color_mgmt_changed && state->gamma_lut) {
-		unsigned int length = state->gamma_lut->length /
+	if (state->color_mgmt_changed && state->degamma_lut) {
+		unsigned int length = state->degamma_lut->length /
 			sizeof(struct drm_color_lut);
 
 		if (length < 2)
@@ -614,10 +614,10 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
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
@@ -738,7 +738,7 @@ static const struct drm_crtc_funcs omap_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = omap_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
-	.gamma_set = drm_atomic_helper_legacy_gamma_set,
+	.gamma_set = drm_atomic_helper_legacy_degamma_set,
 	.atomic_duplicate_state = omap_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.atomic_set_property = omap_crtc_atomic_set_property,
@@ -839,7 +839,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
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
