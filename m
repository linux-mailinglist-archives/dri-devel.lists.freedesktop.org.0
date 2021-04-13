Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED035D94C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7168C6E204;
	Tue, 13 Apr 2021 07:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A36E204
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:50:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p6so8689488wrn.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SwK+tMPzZuJzHn1ReRx+OUj2+6bNHdvV88p8aBr+RX0=;
 b=MsnrKCkFzSeecMcuOPMIIcHvHoIFuXANWhHF4EYu2fs1K7lPyKirReH7zL3T0WEBb1
 xvc4vkLydcH06To+vFwqVIZ45h0X1pgkFWkUsKadJX3YAL/JSEpeOO5838K7mKyGomm1
 U5YorUAIE9aRfySaAGpPRZ/bg5CZAY5trlj/kHwLuEMcRfn0axTnGxWBviuh2JziNJpv
 rYbUbMYSO3A9smCOsf80R8lE9cm1lTxeXwFx7A44PdArQdu32fBhCuayi6y8xp9Ld+g0
 gxm82g764LLiQjO265UDma8zavFK81unarKVn44ceVYzdR6OV/Brx3wHaocsEkuBuuOR
 6Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SwK+tMPzZuJzHn1ReRx+OUj2+6bNHdvV88p8aBr+RX0=;
 b=tHkmhV7Lo36hYUYn8SD7Ou1hdLzfoWOpsubRVOVhYFnpZexTcAF6lEi997H0wPYZhW
 h2qLsSkAk4k6bDGQ3be+qi3+VcbG0HAj99uV/PE+zfE1OrJTGVfRrSk9idKKR/qSRBD3
 E4sNGb4QnRqBg4aLKvaOIkEJAW/DcaoCILxQBO5Eq1iX35j5khXhLMEzyP2V7/V7Zw8G
 Ok9iTkN2wbrEV1XtrQ8lEO/SfKDGEesx9TyUzbyqONH0ZZu8FFyNhv1wBRuJecbOj4Jt
 fL1mPtVJlUGmgcqCTfkkV5+NMhBx7qV3Q7KjMnJB5+8IWEjP9futOm5oM2h2MoV8zyaz
 nfqw==
X-Gm-Message-State: AOAM53270IYUyOx7xW+Juaen70GCE+gaJMbAeWlHaa9CQ+T8ft++UqMo
 PH7tvUbtXJ8cnEkm3YudOQMFPwbB9VPCqg==
X-Google-Smtp-Source: ABdhPJwRtnNlOSEXVkXxESLT9Fa6I4rgle/Z1prmR0y3HX14ehkfuZIJ90l7OvL4b8evY7vEgWQCUQ==
X-Received: by 2002:adf:9481:: with SMTP id 1mr20118781wrr.114.1618300216580; 
 Tue, 13 Apr 2021 00:50:16 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o14sm19806522wrh.88.2021.04.13.00.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:50:16 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:50:08 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/vkms: init plane using drmm_universal_plane_alloc
Message-ID: <b0fed269b94099746fc040605aa8dfa376ba5908.1618299945.git.melissa.srw@gmail.com>
References: <cover.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1618299945.git.melissa.srw@gmail.com>
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
