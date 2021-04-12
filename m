Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9E35D36B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 00:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DD06E09A;
	Mon, 12 Apr 2021 22:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E99A6E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 22:48:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so9566265wma.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=TUdrPTp6+iNHh800jnUbFC00+i4fdcpoqoReuUUUe4k=;
 b=HijQm42MU9EwpT+ggcqEDlAaQBu5nOfUxajRZsc4ALHLAPzvM2Rwmp7uSzn8McvJTt
 HBGyrdXm2w7i/tOdv/OJIOnABd2aZJOd25JeG4a878W80OO3ffbJAJuMc9mFSqf9V5/A
 PAGjxYeutFJ9w9K3Bp2MXblcSvsSazyZmRFWYg0PbtARa7YO9lVAtg+/cEFBARmgLW2r
 8V4zq5kUVPIrCKEgmq0YFH3jqeL8w6abDt+CY7VhL3o8XGDAK05+Fh34vMprDIzGOs+n
 8k/KsTMnN2Q3lgmzvXAwiU5trNobNYqhaUtzM8mDixUP4g7Ga45C4EedBNc4NRF+e+4k
 e8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=TUdrPTp6+iNHh800jnUbFC00+i4fdcpoqoReuUUUe4k=;
 b=SnAF1sZnzg30nfD65HHxvX4O+zCwB7fea5JSJWgMziX5SIQHvei1NsgYeqNXJl9Kp6
 DZL5O9HAaCjG/dyM+0iTtzESYiqvHpPsNAHpGYuaEWZGjGb4eFYjB7luj4jVZmVZ188+
 5nYf4WfFPZM0lb6FIQhetmaz44wgHVoHD1mO4kaYeKynBgvWOF54gXJ83DjoMR70YY6P
 krSin5FKB6TKQlEfcwu3GzTtSrdbGe5Nzum3kOOuwAq0lbunxA37wftBAu5t7UoKRFar
 4bnBQ2fTXjBvazGpZirWXiRpxDjWCIJVdd1vmvYHrAGlgd4JkDQ5HDgw5ou16bi/bdZy
 NLEQ==
X-Gm-Message-State: AOAM530Ka1/DAZI+1PrUfmSqwySogHOGZKS3WvorDfc/KfZzJ71o8Ce3
 c4A1+KnxIZk0D9tFjskcbcI=
X-Google-Smtp-Source: ABdhPJztLB3aW2A6dPd9MkNy2oOHWFbCJ5LUTH5Cya7VqtLlOQPXZ2N2Wse7qb3iC6ndN1Q3S301rg==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr1115268wmi.75.1618267725942; 
 Mon, 12 Apr 2021 15:48:45 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o5sm607330wmc.44.2021.04.12.15.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 15:48:45 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:48:39 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH v2 1/4] drm/vkms: init plane using drmm_universal_plane_alloc
Message-ID: <20210412224839.e6b2ib256a753zqf@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
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
index 6d310d31b75d..36562846f6cb 100644
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
+	drm_plane_helper_add(&plane->base, &vkms_primary_helper_funcs);
 
 	return plane;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
