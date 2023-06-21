Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3DB737D22
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289B10E412;
	Wed, 21 Jun 2023 08:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC26C10E40C;
 Wed, 21 Jun 2023 08:11:00 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC2E915E9;
 Wed, 21 Jun 2023 10:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335024;
 bh=L0Or/dRrc/G1jwhGCHOAPe0GtoeuM6ImRaeCz+srIco=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h9BXmzIAr2Dwm2Vp3+BxB/W4AVimJ9SAHWOf7JjPEREb4WifvjXRwZHq6pLW8QdRr
 cF7jEvCXpEK92/LdLt0Fu5hKLJCto4rm1V8QOtF7u0bFaGeDfbsO8fGICAVo2NXX5z
 pViuoMXWfiIilrRo4VfJGmWN/NUXOkoiEP1Q7I4Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 8/9] drm: rcar-du: kms: Configure the CLU
Date: Wed, 21 Jun 2023 10:10:30 +0200
Message-Id: <20230621081031.7876-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 aleixpol@kde.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 xaver.hugl@gmail.com, linux-renesas-soc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Link the DRM 3D-CLU configuration to the CMM setup configuration.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index a2d477dc5a51..895a23161f7b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -521,19 +521,23 @@ static int rcar_du_cmm_check(struct drm_crtc *crtc,
 			     struct drm_crtc_state *state)
 {
 	struct drm_property_blob *drm_lut = state->gamma_lut;
+	struct drm_property_blob *drm_clu = state->lut3d;
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct device *dev = rcrtc->dev->dev;
 
-	if (!drm_lut)
-		return 0;
-
-	/* We only accept fully populated LUT tables. */
-	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
+	/* We only accept fully populated LUTs. */
+	if (drm_lut && drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
 		dev_err(dev, "invalid gamma lut size: %zu bytes\n",
 			drm_lut->length);
 		return -EINVAL;
 	}
 
+	if (drm_clu && drm_color_lut_size(drm_clu) != CM2_CLU_SIZE) {
+		dev_err(dev, "invalid cubic lut size: %zu bytes\n",
+			drm_clu->length);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -555,6 +559,15 @@ static void rcar_du_cmm_setup(struct rcar_du_crtc *rcrtc,
 				     ? new_state->gamma_lut->data : NULL;
 	}
 
+	if (!old_state ||
+	    !old_state->lut3d != !new_state->lut3d ||
+	    (old_state->lut3d && new_state->lut3d &&
+	     old_state->lut3d->base.id != new_state->lut3d->base.id)) {
+		cmm_config.clu.update = true;
+		cmm_config.clu.table = new_state->lut3d
+				     ? new_state->lut3d->data : NULL;
+	}
+
 	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
 }
 
-- 
2.40.1

