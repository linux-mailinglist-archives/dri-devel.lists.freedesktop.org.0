Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF43BEC41D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA810E02A;
	Sat, 18 Oct 2025 02:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nmgII/h1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9057C10E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:01:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 83EEB1A14AB;
 Sat, 18 Oct 2025 02:01:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5417B60701;
 Sat, 18 Oct 2025 02:01:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC69C102F236F; 
 Sat, 18 Oct 2025 04:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Mnv27ovYNz38usZbzkAYTlGQ14nBpYD431Z4+TIHANM=;
 b=nmgII/h1krwbElwZn8xpCGJU+b78/hg9w91qEAW8pbSXhX6W3WbOK8JXyTasrWysvz9XsI
 45+oPOBYJEkSCTGsyll0WtJsoMipIEqK/pB3rq+VGVUiQD0Sh1RWXUgovlvTZWEc4FVJT7
 mTBhNpO814Xv+KXwXbf3GHtqoLdTd1HHdb/h145ofDZdTIoN4c0V39zBzGGj/q8zGueItG
 m8k14kaqvc8TAFhpU4nhR3Gzb3zXRlcf/GHNvM3bugKe0nF0JG3GURa2fcKgqq98d51kfs
 4Aip95PIeLSnpJS8nTreYrzPQzyERi1AUa5Eqc+euh1WR/1BdKcHgsr1nkiRvg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:01 +0200
Subject: [PATCH 01/22] drm/vkms: Introduce config for plane name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-1-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5960;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MLS9g/NpckWYbbJ6erVOl7QRiaiJ2oNsg6Sk2z+gRnQ=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT9pcd2hSq9HuzMJddMH+kvfVu4GWWq1vSXs
 zsoTOFU24eJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/QAKCRAgrS7GWxAs
 4jEeD/0R73U6k89+5gVeDYqTQ6fkhZpG2tOpKK4T+QeQeOC0LLDxXWIle3xRl26ZbJWo6vLzT9F
 mDHqTB3ZVz8kGXRrDxZ2PW+LJOruz4sxuymNZEtWfrczc7jLKiBR7fpBevaUToxrTSe9vU4NsqG
 /nXnoOujAhTmR9gZqCZ/C4Yyt3mVCMSf+TyD3oQOBpXMQ5Z+IDXNVF8/hGlkTfcXgrIzqZpqZLJ
 mxgphAh6sblseKPKn7NZ3/A+YsPkOcBrEGFRLJoOncoEdJfsr5Fpn5fn+TLWKjW6i3SyG7Nqujn
 afSQKjopvmOsjIHE9ue4LQZx+VJ6vYvSwhYOfkfcuYzF2qvhFefxk21Q+4dUiWI9IAKJ1RSGyoh
 s/huHiWsOMgeA5gq8YYpFwxRGEqkVM7PnjGiDxbv8Sq6OXqJFVHVWMa8BqLpcjqcvcZUiPj8aEB
 U+dNgml19i9/ckuY1W76iyq2eIfDtaewTfVmA6y62OrSs2kSzkfSeToDoPYNGmyFLxfi3FeyL4v
 bHmxJQBQX9+VF8h97EoAYHmp91rejk3mTTcJb7mFAnBTr3H8gWVqxTnI6ZOS2Ti4cE2dtesv/Xp
 ftM8pLHIYsDwPRQkYwxcSwbyiiqo0n7Lr+1R1+gpySRh46pBKGshE5afzvM8ouxkysZ4+xEI1TD
 PN61p2JrGxIPj9Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

As planes can have a name in DRM, prepare VKMS to configure it using
ConfigFS.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  4 ++++
 drivers/gpu/drm/vkms/vkms_config.h | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h    |  5 +++--
 drivers/gpu/drm/vkms/vkms_output.c |  6 +-----
 drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++++--
 5 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f8394a063ecf..ed172f800685 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -350,6 +350,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "plane:\n");
 		seq_printf(m, "\ttype=%d\n",
 			   vkms_config_plane_get_type(plane_cfg));
+		seq_printf(m, "\tname=%s\n",
+			   vkms_config_plane_get_name(plane_cfg));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -390,6 +392,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 
 	plane_cfg->config = config;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
+	vkms_config_plane_set_name(plane_cfg, NULL);
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail(&plane_cfg->link, &config->planes);
@@ -402,6 +405,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 {
 	xa_destroy(&plane_cfg->possible_crtcs);
 	list_del(&plane_cfg->link);
+	kfree_const(plane_cfg->name);
 	kfree(plane_cfg);
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4c8d668e7ef8..b69c35097ba0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -35,6 +35,7 @@ struct vkms_config {
  *
  * @link: Link to the others planes in vkms_config
  * @config: The vkms_config this plane belongs to
+ * @name: Name of the plane
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
  * @possible_crtcs: Array of CRTCs that can be used with this plane
@@ -47,6 +48,7 @@ struct vkms_config_plane {
 	struct list_head link;
 	struct vkms_config *config;
 
+	const char *name;
 	enum drm_plane_type type;
 	struct xarray possible_crtcs;
 
@@ -288,6 +290,30 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 	plane_cfg->type = type;
 }
 
+/**
+ * vkms_config_plane_set_name() - Set the plane name
+ * @plane_cfg: Plane to set the name to
+ * @name: New plane name. The name is copied.
+ */
+static inline void
+vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
+			   const char *name)
+{
+	if (plane_cfg->name)
+		kfree_const(plane_cfg->name);
+	plane_cfg->name = kstrdup_const(name, GFP_KERNEL);
+}
+
+/**
+ * vkms_config_plane_get_name - Get the plane name
+ * @plane_cfg: Plane to get the name from
+ */
+static inline const char *
+vkms_config_plane_get_name(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->name;
+}
+
 /**
  * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
  * @plane_cfg: Plane to attach
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index db260df1d4f6..9ad286f043b5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -225,6 +225,7 @@ struct vkms_output {
 };
 
 struct vkms_config;
+struct vkms_config_plane;
 
 /**
  * struct vkms_device - Description of a VKMS device
@@ -298,10 +299,10 @@ int vkms_output_init(struct vkms_device *vkmsdev);
  * vkms_plane_init() - Initialize a plane
  *
  * @vkmsdev: VKMS device containing the plane
- * @type: type of plane to initialize
+ * @config: plane configuration
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type);
+				   struct vkms_config_plane *config);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2ee3749e2b28..22208d02afa4 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -19,11 +19,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		return -EINVAL;
 
 	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
-		enum drm_plane_type type;
-
-		type = vkms_config_plane_get_type(plane_cfg);
-
-		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
+		plane_cfg->plane = vkms_plane_init(vkmsdev, plane_cfg);
 		if (IS_ERR(plane_cfg->plane)) {
 			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 			return PTR_ERR(plane_cfg->plane);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e592e47a5736..263376686794 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -11,6 +11,7 @@
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
+#include "vkms_config.h"
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
@@ -217,7 +218,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type)
+				   struct vkms_config_plane *config)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
@@ -225,7 +226,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, type, NULL);
+					   NULL, vkms_config_plane_get_type(config),
+					   vkms_config_plane_get_name(config));
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.51.0

