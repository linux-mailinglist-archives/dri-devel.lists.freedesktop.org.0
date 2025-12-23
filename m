Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A274CDA348
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B5E10E0E6;
	Tue, 23 Dec 2025 18:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="iYZ6NWrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAAD10E0E6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512930; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d3hb84uTPG+CDdV3cHoRdnJFrhrXIrapWiyYYM3eHoVk0w/Aj72Ky0uFdcFRcjt/J9IBmSbd1vNTVGh0x9OBlmhUk8jl2QuWKh5N6Pt6ANEDi6G65IET7Few+qwqYq5KpP3/aizGXEwXGQca8t/PupewITDCfgPsJeP01e7YmHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512930;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QDecqC8pPAc/kwxbxhgA+tgjzq6teJWKhoUb2qBJ7Fk=; 
 b=Flb/I+y9noVXhqiJyr4kmdqb/b+WlU2YjHAK/X+pFW9WP8p8v7cYZCZVn+8MdC/l+pK96Vl8AGMYKSSm4D9Cq7+ELMuuyg7fLyvuJSx5rTPZwPQJB/tgAmsiBSVCoIXCTOgNV4ZHISM+C6D03Xf8TO8WHo3bK8+wd8aQne5U0YQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512930; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=QDecqC8pPAc/kwxbxhgA+tgjzq6teJWKhoUb2qBJ7Fk=;
 b=iYZ6NWrZ7yPyYjSdnYvkWPp7ntq8YfnN17aKNNW9mFwwz5mV7BU7+1Ruatdo6nHc
 XSZKSZLVLoY9ClitKGmvPTb0HLyO1+FDNBdVWfBueI7K3bdDCpuwyjY1jPnM5QAaSBB
 IDw3EW0NcW+pgmj7elfh6xYOmbiOcGJMUBMq1bu8=
Received: by mx.zohomail.com with SMTPS id 1766512928220672.591399354645;
 Tue, 23 Dec 2025 10:02:08 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:23 -0300
Subject: [PATCH v3 03/21] drm: Factor out common color_pipeline property
 initialization code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-3-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=4529;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=pXUAhGp4YOn3VSWvXDCPIq61Qsa1Bmj3Jy8ZAyYUCkc=;
 b=lYPrKkc9rid3IkMNgun/1saiJEubBmxIrZQQR0RDt8t0cH6mUxQFPUQOA7S0SZNjbYqD++7Rn
 MA1fgpIg1gHBrYKgb4VdoOS0VMFpDZ/ECGAq0JrLhKIILztVMf2R+sG
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

In preparation for sharing the initialization code for the color
pipeline property between pre-blend (plane) and post-blend (crtc) color
pipelines, factor out the common initialization to a separate function.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_plane.c    | 35 ++++-----------------------------
 drivers/gpu/drm/drm_property.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_property.h     |  5 +++++
 3 files changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index bed2562bf911b..3d7324757d7b2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1839,43 +1839,16 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 					     const struct drm_prop_enum_list *pipelines,
 					     int num_pipelines)
 {
-	struct drm_prop_enum_list *all_pipelines;
 	struct drm_property *prop;
-	int len = 0;
-	int i;
-
-	all_pipelines = kcalloc(num_pipelines + 1,
-				sizeof(*all_pipelines),
-				GFP_KERNEL);
-
-	if (!all_pipelines) {
-		drm_err(plane->dev, "failed to allocate color pipeline\n");
-		return -ENOMEM;
-	}
-
-	/* Create default Bypass color pipeline */
-	all_pipelines[len].type = 0;
-	all_pipelines[len].name = "Bypass";
-	len++;
 
-	/* Add all other color pipelines */
-	for (i = 0; i < num_pipelines; i++, len++) {
-		all_pipelines[len].type = pipelines[i].type;
-		all_pipelines[len].name = pipelines[i].name;
-	}
+	prop = drm_property_create_color_pipeline(plane->dev, &plane->base,
+						  pipelines, num_pipelines);
+	if (IS_ERR(prop))
+		return PTR_ERR(prop);
 
-	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
-					"COLOR_PIPELINE",
-					all_pipelines, len);
-	if (!prop) {
-		kfree(all_pipelines);
-		return -ENOMEM;
-	}
 
-	drm_object_attach_property(&plane->base, prop, 0);
 	plane->color_pipeline_property = prop;
 
-	kfree(all_pipelines);
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a359..cc2a1422599ac 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -997,3 +997,47 @@ void drm_property_change_valid_put(struct drm_property *property,
 	} else if (drm_property_type_is(property, DRM_MODE_PROP_BLOB))
 		drm_property_blob_put(obj_to_blob(ref));
 }
+
+struct drm_property *
+drm_property_create_color_pipeline(struct drm_device *dev, struct drm_mode_object *obj,
+				   const struct drm_prop_enum_list *pipelines,
+				   int num_pipelines)
+{
+	struct drm_prop_enum_list *all_pipelines;
+	struct drm_property *prop;
+	int len = 0;
+	int i;
+
+	all_pipelines = kcalloc(num_pipelines + 1,
+				sizeof(*all_pipelines),
+				GFP_KERNEL);
+
+	if (!all_pipelines) {
+		drm_err(dev, "failed to allocate color pipeline\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Create default Bypass color pipeline */
+	all_pipelines[len].type = 0;
+	all_pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add all other color pipelines */
+	for (i = 0; i < num_pipelines; i++, len++) {
+		all_pipelines[len].type = pipelines[i].type;
+		all_pipelines[len].name = pipelines[i].name;
+	}
+
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					all_pipelines, len);
+	if (!prop) {
+		kfree(all_pipelines);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	drm_object_attach_property(obj, prop, 0);
+
+	kfree(all_pipelines);
+	return prop;
+}
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 082f29156b3e3..3acf340635226 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -296,6 +296,11 @@ bool drm_property_replace_blob(struct drm_property_blob **blob,
 struct drm_property_blob *drm_property_blob_get(struct drm_property_blob *blob);
 void drm_property_blob_put(struct drm_property_blob *blob);
 
+struct drm_property *
+drm_property_create_color_pipeline(struct drm_device *dev, struct drm_mode_object *obj,
+				   const struct drm_prop_enum_list *pipelines,
+				   int num_pipelines);
+
 /**
  * drm_property_find - find property object
  * @dev: DRM device

-- 
2.51.0

