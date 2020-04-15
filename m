Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A11A986B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 11:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E66E929;
	Wed, 15 Apr 2020 09:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957AA6E929
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:20:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03F9KfE4009961;
 Wed, 15 Apr 2020 04:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586942442;
 bh=MB0TNw8Gk1jsagDWx4q5iYuNzD3Gk7EYrK8Hzwxo+jU=;
 h=From:To:CC:Subject:Date;
 b=lre7FjMtFvNX7aaqyMqGc349qbqLvqYHyoFaahAKZ382GOjWRPkQs73KDV9a6CiNW
 tW6DBzLv+BHeXeyrWYkxicTEw2t7M7yxRAemydzb0ar1/ysYoDggk+4E8p7hJkttb3
 K3ejsfn4Kzndn+pA9CrVD5nKSZlZjjgiBx1Tv4Lo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03F9KfBT046160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Apr 2020 04:20:41 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 04:20:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 04:20:40 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03F9Kc8T036571;
 Wed, 15 Apr 2020 04:20:38 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/tidss: fix crash related to accessing freed memory
Date: Wed, 15 Apr 2020 12:20:06 +0300
Message-ID: <20200415092006.26675-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tidss uses devm_kzalloc to allocate DRM plane, encoder and crtc objects.
This is not correct as the lifetime of those objects should be longer
than the underlying device's.

When unloading tidss module, the devm_kzalloc'ed objects have already
been freed when tidss_release() is called, and the driver will accesses
freed memory possibly causing a crash, a kernel WARN, or other undefined
behavior, and also KASAN will give a bug.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_crtc.c    | 16 +++++++++++++---
 drivers/gpu/drm/tidss/tidss_encoder.c | 14 +++++++++++---
 drivers/gpu/drm/tidss/tidss_plane.c   | 24 ++++++++++++++++++------
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index d4ce9bab8c7e..3221a707e073 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -379,9 +379,17 @@ static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &state->base;
 }
 
+static void tidss_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
+
+	drm_crtc_cleanup(crtc);
+	kfree(tcrtc);
+}
+
 static const struct drm_crtc_funcs tidss_crtc_funcs = {
 	.reset = tidss_crtc_reset,
-	.destroy = drm_crtc_cleanup,
+	.destroy = tidss_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = tidss_crtc_duplicate_state,
@@ -400,7 +408,7 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 	bool has_ctm = tidss->feat->vp_feat.color.has_ctm;
 	int ret;
 
-	tcrtc = devm_kzalloc(tidss->dev, sizeof(*tcrtc), GFP_KERNEL);
+	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
 	if (!tcrtc)
 		return ERR_PTR(-ENOMEM);
 
@@ -411,8 +419,10 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 
 	ret = drm_crtc_init_with_planes(&tidss->ddev, crtc, primary,
 					NULL, &tidss_crtc_funcs, NULL);
-	if (ret < 0)
+	if (ret < 0) {
+		kfree(tcrtc);
 		return ERR_PTR(ret);
+	}
 
 	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
 
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 83785b0a66a9..30bf2a65949c 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -55,12 +55,18 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void tidss_encoder_destroy(struct drm_encoder *encoder)
+{
+	drm_encoder_cleanup(encoder);
+	kfree(encoder);
+}
+
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.atomic_check = tidss_encoder_atomic_check,
 };
 
 static const struct drm_encoder_funcs encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
+	.destroy = tidss_encoder_destroy,
 };
 
 struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
@@ -69,7 +75,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 	struct drm_encoder *enc;
 	int ret;
 
-	enc = devm_kzalloc(tidss->dev, sizeof(*enc), GFP_KERNEL);
+	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
 	if (!enc)
 		return ERR_PTR(-ENOMEM);
 
@@ -77,8 +83,10 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 
 	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
 			       encoder_type, NULL);
-	if (ret < 0)
+	if (ret < 0) {
+		kfree(enc);
 		return ERR_PTR(ret);
+	}
 
 	drm_encoder_helper_add(enc, &encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index ff99b2dd4a17..798488948fc5 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -141,6 +141,14 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
 	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
 }
 
+static void drm_plane_destroy(struct drm_plane *plane)
+{
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+
+	drm_plane_cleanup(plane);
+	kfree(tplane);
+}
+
 static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
 	.atomic_check = tidss_plane_atomic_check,
 	.atomic_update = tidss_plane_atomic_update,
@@ -151,7 +159,7 @@ static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = drm_atomic_helper_plane_reset,
-	.destroy = drm_plane_cleanup,
+	.destroy = drm_plane_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
@@ -175,7 +183,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 			   BIT(DRM_MODE_BLEND_COVERAGE));
 	int ret;
 
-	tplane = devm_kzalloc(tidss->dev, sizeof(*tplane), GFP_KERNEL);
+	tplane = kzalloc(sizeof(*tplane), GFP_KERNEL);
 	if (!tplane)
 		return ERR_PTR(-ENOMEM);
 
@@ -190,7 +198,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 				       formats, num_formats,
 				       NULL, type, NULL);
 	if (ret < 0)
-		return ERR_PTR(ret);
+		goto err;
 
 	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
 
@@ -203,15 +211,19 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 						default_encoding,
 						default_range);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err;
 
 	ret = drm_plane_create_alpha_property(&tplane->plane);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err;
 
 	ret = drm_plane_create_blend_mode_property(&tplane->plane, blend_modes);
 	if (ret)
-		return ERR_PTR(ret);
+		goto err;
 
 	return tplane;
+
+err:
+	kfree(tplane);
+	return ERR_PTR(ret);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
