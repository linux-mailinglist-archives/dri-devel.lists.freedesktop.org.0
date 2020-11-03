Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A807E2A3E51
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D773F6EB9B;
	Tue,  3 Nov 2020 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63E66E855
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 08:04:25 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A384Jar114389;
 Tue, 3 Nov 2020 02:04:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604390659;
 bh=dMbXi+JaTETe0eBirFEc6Fe75Stlr5py8mA1qXEuaq0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pshnYpgw3FKxon9c7+FXw+N8kYbOP4b3k7mEtVO9ezRaqv7hrkpkq+wjhYagR52WF
 VUUbShUEPVgu/jRCCqlKFFhpvmE76Dv8vjIeX7OX1287Dtcc7NTM6i/CNp0hMguhl5
 B/lLgv9Lhje9GYZ6M0r2GOH8SSaiU5Grd1+DOjmg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A384J4r108654
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 02:04:19 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 02:04:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 02:04:19 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3849ev095622;
 Tue, 3 Nov 2020 02:04:17 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar
 <nikhil.nd@ti.com>
Subject: [PATCH v2 3/5] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
Date: Tue, 3 Nov 2020 10:03:08 +0200
Message-ID: <20201103080310.164453-4-tomi.valkeinen@ti.com>
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

From: Jyri Sarha <jsarha@ti.com>

Implement CTM color management property for OMAP CRTC using DSS
overlay manager's Color Phase Rotation matrix. The CPR matrix does not
exactly match the CTM property documentation. On DSS the CPR matrix is
applied after gamma table look up. However, it seems stupid to add a
custom property just for that.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 39 +++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index d40220b2f312..b2c251a8b404 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -391,6 +391,33 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 	}
 }
 
+static s16 omap_crtc_s31_32_to_s2_8(s64 coef)
+{
+	u64 sign_bit = 1ULL << 63;
+	u64 cbits = (u64)coef;
+
+	s16 ret = clamp_val(((cbits & ~sign_bit) >> 24), 0, 0x1ff);
+
+	if (cbits & sign_bit)
+		ret = -ret;
+
+	return ret;
+}
+
+static void omap_crtc_cpr_coefs_from_ctm(const struct drm_color_ctm *ctm,
+					 struct omap_dss_cpr_coefs *cpr)
+{
+	cpr->rr = omap_crtc_s31_32_to_s2_8(ctm->matrix[0]);
+	cpr->rg = omap_crtc_s31_32_to_s2_8(ctm->matrix[1]);
+	cpr->rb = omap_crtc_s31_32_to_s2_8(ctm->matrix[2]);
+	cpr->gr = omap_crtc_s31_32_to_s2_8(ctm->matrix[3]);
+	cpr->gg = omap_crtc_s31_32_to_s2_8(ctm->matrix[4]);
+	cpr->gb = omap_crtc_s31_32_to_s2_8(ctm->matrix[5]);
+	cpr->br = omap_crtc_s31_32_to_s2_8(ctm->matrix[6]);
+	cpr->bg = omap_crtc_s31_32_to_s2_8(ctm->matrix[7]);
+	cpr->bb = omap_crtc_s31_32_to_s2_8(ctm->matrix[8]);
+}
+
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
@@ -402,7 +429,15 @@ static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 	info.default_color = 0x000000;
 	info.trans_enabled = false;
 	info.partial_alpha_enabled = false;
-	info.cpr_enable = false;
+
+	if (crtc->state->ctm) {
+		struct drm_color_ctm *ctm = crtc->state->ctm->data;
+
+		info.cpr_enable = true;
+		omap_crtc_cpr_coefs_from_ctm(ctm, &info.cpr_coefs);
+	} else {
+		info.cpr_enable = false;
+	}
 
 	priv->dispc_ops->mgr_setup(priv->dispc, omap_crtc->channel, &info);
 }
@@ -842,7 +877,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
 
-		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, false, 0);
+		drm_crtc_enable_color_mgmt(crtc, gamma_lut_size, true, 0);
 		drm_mode_crtc_set_gamma_size(crtc, gamma_lut_size);
 	}
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
