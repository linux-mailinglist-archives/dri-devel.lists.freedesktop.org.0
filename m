Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882C36A01C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 10:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5696E1A7;
	Sat, 24 Apr 2021 08:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7088F6E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 08:23:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x5so315104wrv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pzs9+l9dZGVv7oIFa2Vm2mSZNmaiUp4olXqSAZ7yZrA=;
 b=sQfeVFZkg/uSBgcG3HkAoIYmL6W3E9CJg8UCSJIOWFktWUeLuySok+bSJdELyRNdmb
 DF9+C64fe/2yMfrs0173lrbAlNuck0wq4A1gQueGKIuRCYyVt3kbwQAVod82wdt+Fr2f
 s11uGT15+chHXaj1sukVk1gsHZVM7rgCHQCdpmXOSRYvGpOoO7FdavkWOlAZdSFBJJYS
 IxZjRR3QxNuDpPnYIIYpri/oROune0Let0v9uw8C0FovsccZJJQP1Gb0NPYzFQEBqPvH
 /W3ufHvcBEAPVExFq67Gc/4aek+MSBXPdzLyuA35gmEtujQjg+puhiP091eHufMDzXir
 C9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pzs9+l9dZGVv7oIFa2Vm2mSZNmaiUp4olXqSAZ7yZrA=;
 b=suk2IhHiSsdMhOkR9G5TuRnN8Z7XzHwcCEC4jY1thGRGgEHn6v+Xa2RHWUm0pjyIQj
 fen2XnS8owQN+54rMzp6Jqjae6omvzr+sHS2Q18PfM73RVXb3p/KwKOZgbS8i97pAyyO
 AOVWto1WJFxywnI/iXDeVpdvaUcSozIoDYublKrTD9AjqvXzumh0+HF1sJmZWJyUt5qG
 fWwhYEGTodpPTuIXZIQu1EGie7RGVXNX8nJFKgQ1OLD9pSLgzLkXRlqPtqrigpJ8eiu/
 fV0gv5kLkZ5HvTtQCnqFSv0MnNiJpG7mYBI3Zqx1jHiRJiRLymKXhQU+U0/g/eLdY+vd
 qJOA==
X-Gm-Message-State: AOAM5302OeVTkevQI6hobTYTAVsQapRPhJ5jvNEkdovfzg77ujGrem0z
 IobsbMp4sKSemD4e/GSh3XNcDqh9ENyYEB1E
X-Google-Smtp-Source: ABdhPJzDATLhO04D2rECmDadeEf0pmzAfgZUYDoFelIy14Cg4Bs9770Atu3yhcYouSaJmDypHj/sbw==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr9585497wrg.274.1619252613880; 
 Sat, 24 Apr 2021 01:23:33 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id t20sm12653870wmi.35.2021.04.24.01.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 01:23:33 -0700 (PDT)
Date: Sat, 24 Apr 2021 05:23:27 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm/vkms: init plane using drmm_universal_plane_alloc
Message-ID: <3bbdabed0274d2d0917d1b829dd16f13d7b495f5.1619250933.git.melissa.srw@gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1619250933.git.melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By using drmm_universal_plane_alloc instead of
drm_universal_plane_init, we let the DRM infrastructure handles
resource allocation and cleanup. We can also get rid of some
code repetitions for plane cleanup, improving code maintainability
in vkms.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++++++--
 drivers/gpu/drm/vkms/vkms_output.c | 19 +++++--------------
 drivers/gpu/drm/vkms/vkms_plane.c  | 29 +++++++++++------------------
 3 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 35540c7c4416..70fb79621617 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -37,6 +37,10 @@ struct vkms_plane_state {
 	struct vkms_composer *composer;
 };
 
+struct vkms_plane {
+	struct drm_plane base;
+};
+
 /**
  * vkms_crtc_state - Driver specific CRTC state
  * @base: base CRTC state
@@ -114,8 +118,8 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
-struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				  enum drm_plane_type type, int index);
+struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
+				   enum drm_plane_type type, int index);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index f5f6f15c362c..6979fbc7f821 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -39,7 +39,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
-	struct drm_plane *primary, *cursor = NULL;
+	struct vkms_plane *primary, *cursor = NULL;
 	int ret;
 	int writeback;
 
@@ -49,15 +49,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	if (vkmsdev->config->cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
-		if (IS_ERR(cursor)) {
-			ret = PTR_ERR(cursor);
-			goto err_cursor;
-		}
+		if (IS_ERR(cursor))
+			return PTR_ERR(cursor);
 	}
 
-	ret = vkms_crtc_init(dev, crtc, primary, cursor);
+	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
 	if (ret)
-		goto err_crtc;
+		return ret;
 
 	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
@@ -100,12 +98,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 err_connector:
 	drm_crtc_cleanup(crtc);
 
-err_crtc:
-	if (vkmsdev->config->cursor)
-		drm_plane_cleanup(cursor);
-
-err_cursor:
-	drm_plane_cleanup(primary);
-
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6d310d31b75d..135140f8e87a 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -86,7 +86,6 @@ static void vkms_plane_reset(struct drm_plane *plane)
 static const struct drm_plane_funcs vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
 	.reset			= vkms_plane_reset,
 	.atomic_duplicate_state = vkms_plane_duplicate_state,
 	.atomic_destroy_state	= vkms_plane_destroy_state,
@@ -191,18 +190,14 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
 	.cleanup_fb		= vkms_cleanup_fb,
 };
 
-struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				  enum drm_plane_type type, int index)
+struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
+				   enum drm_plane_type type, int index)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	const struct drm_plane_helper_funcs *funcs;
-	struct drm_plane *plane;
+	struct vkms_plane *plane;
 	const u32 *formats;
-	int ret, nformats;
-
-	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return ERR_PTR(-ENOMEM);
+	int nformats;
 
 	if (type == DRM_PLANE_TYPE_CURSOR) {
 		formats = vkms_cursor_formats;
@@ -214,16 +209,14 @@ struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 		funcs = &vkms_primary_helper_funcs;
 	}
 
-	ret = drm_universal_plane_init(dev, plane, 1 << index,
-				       &vkms_plane_funcs,
-				       formats, nformats,
-				       NULL, type, NULL);
-	if (ret) {
-		kfree(plane);
-		return ERR_PTR(ret);
-	}
+	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
+					   &vkms_plane_funcs,
+					   formats, nformats,
+					   NULL, type, NULL);
+	if (IS_ERR(plane))
+		return plane;
 
-	drm_plane_helper_add(plane, funcs);
+	drm_plane_helper_add(&plane->base, funcs);
 
 	return plane;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
