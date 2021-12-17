Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F1478E5B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4298112847;
	Fri, 17 Dec 2021 14:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C55112783;
 Fri, 17 Dec 2021 14:46:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70BF11F397;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KpirQLqA6bzO8Zr6fzoQSxc3YDG2bHxIzx5vE4lAfg=;
 b=MnIcTwzVkEsWyCVHiRgDR4SOba6wvYzWrZuBNBh9Rej1uScwQGDSnB8kdbgOPrbF+GIJ6t
 eWRqYO5iEJ6BafHZWLokNckUSpfsM+gjXkqk01JeVsK07XsCgsvQwUBG48METkYCmr/Jr2
 d8Ef6Gwpfxs//XLIqiTkWQ2xCdMPw4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6KpirQLqA6bzO8Zr6fzoQSxc3YDG2bHxIzx5vE4lAfg=;
 b=7Rh+MqFve9UeCvP0F3V+o9bygyjlo6nVrEI80dxECAJCa4MxeKmNdewYWuAwjpAR5ZsV6W
 0MOmYerfZ3SdtlBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A9B213E1C;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GHdZDbuivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 07/10] drm/qxl: Move ioctl array next to its only user
Date: Fri, 17 Dec 2021 15:46:12 +0100
Message-Id: <20211217144615.32733-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217144615.32733-1-tzimmermann@suse.de>
References: <20211217144615.32733-1-tzimmermann@suse.de>
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the array qxl_ioctl to qxl_drv.c and initialize the num_ioctls
field of struct drm_driver at runtime. Replaces the current fragile
ioctl setup and allows for generating the module init/exit code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_drv.c   | 12 +++++++++-
 drivers/gpu/drm/qxl/qxl_drv.h   | 13 +++++++----
 drivers/gpu/drm/qxl/qxl_ioctl.c | 41 ++++++---------------------------
 3 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index e4b16421500b..323671e9cfc8 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -269,6 +269,16 @@ static struct pci_driver qxl_pci_driver = {
 	 .driver.pm = &qxl_pm_ops,
 };
 
+static const struct drm_ioctl_desc qxl_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QXL_ALLOC, qxl_alloc_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_MAP, qxl_map_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_EXECBUFFER, qxl_execbuffer_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_UPDATE_AREA, qxl_update_area_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_GETPARAM, qxl_getparam_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_CLIENTCAP, qxl_clientcap_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(QXL_ALLOC_SURF, qxl_alloc_surf_ioctl, DRM_AUTH),
+};
+
 static struct drm_driver qxl_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 
@@ -282,6 +292,7 @@ static struct drm_driver qxl_driver = {
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
+	.num_ioctls = ARRAY_SIZE(qxl_ioctls),
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
@@ -299,7 +310,6 @@ static int __init qxl_init(void)
 
 	if (qxl_modeset == 0)
 		return -EINVAL;
-	qxl_driver.num_ioctls = qxl_max_ioctls;
 	return pci_register_driver(&qxl_pci_driver);
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 359266d9e860..29641ceaab7d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -65,7 +65,6 @@ struct dma_buf_map;
 #define QXL_DEBUGFS_MAX_COMPONENTS		32
 
 extern int qxl_num_crtc;
-extern int qxl_max_ioctls;
 
 #define QXL_INTERRUPT_MASK (\
 	QXL_INTERRUPT_DISPLAY |\
@@ -261,9 +260,6 @@ struct qxl_device {
 
 int qxl_debugfs_fence_init(struct qxl_device *rdev);
 
-extern const struct drm_ioctl_desc qxl_ioctls[];
-extern int qxl_max_ioctl;
-
 int qxl_device_init(struct qxl_device *qdev, struct pci_dev *pdev);
 void qxl_device_fini(struct qxl_device *qdev);
 
@@ -457,4 +453,13 @@ struct qxl_drv_surface *
 qxl_surface_lookup(struct drm_device *dev, int surface_id);
 void qxl_surface_evict(struct qxl_device *qdev, struct qxl_bo *surf, bool freeing);
 
+/* qxl_ioctl.c */
+int qxl_alloc_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qxl_map_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qxl_execbuffer_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qxl_update_area_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int qxl_getparam_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qxl_clientcap_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
 #endif
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 38aabcbe2238..30f58b21372a 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -33,8 +33,7 @@
  * TODO: allocating a new gem(in qxl_bo) for each request.
  * This is wasteful since bo's are page aligned.
  */
-static int qxl_alloc_ioctl(struct drm_device *dev, void *data,
-			   struct drm_file *file_priv)
+int qxl_alloc_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_alloc *qxl_alloc = data;
@@ -61,8 +60,7 @@ static int qxl_alloc_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-static int qxl_map_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv)
+int qxl_map_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_map *qxl_map = data;
@@ -272,8 +270,7 @@ static int qxl_process_single_command(struct qxl_device *qdev,
 	return ret;
 }
 
-static int qxl_execbuffer_ioctl(struct drm_device *dev, void *data,
-				struct drm_file *file_priv)
+int qxl_execbuffer_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_execbuffer *execbuffer = data;
@@ -297,8 +294,7 @@ static int qxl_execbuffer_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
-				 struct drm_file *file)
+int qxl_update_area_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_update_area *update_area = data;
@@ -347,8 +343,7 @@ static int qxl_update_area_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static int qxl_getparam_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv)
+int qxl_getparam_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_getparam *param = data;
@@ -366,8 +361,7 @@ static int qxl_getparam_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-static int qxl_clientcap_ioctl(struct drm_device *dev, void *data,
-				  struct drm_file *file_priv)
+int qxl_clientcap_ioctl(struct drm_device *dev, void *data, struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
@@ -388,8 +382,7 @@ static int qxl_clientcap_ioctl(struct drm_device *dev, void *data,
 	return -ENOSYS;
 }
 
-static int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data,
-				struct drm_file *file)
+int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct qxl_device *qdev = to_qxl(dev);
 	struct drm_qxl_alloc_surf *param = data;
@@ -422,23 +415,3 @@ static int qxl_alloc_surf_ioctl(struct drm_device *dev, void *data,
 		param->handle = handle;
 	return ret;
 }
-
-const struct drm_ioctl_desc qxl_ioctls[] = {
-	DRM_IOCTL_DEF_DRV(QXL_ALLOC, qxl_alloc_ioctl, DRM_AUTH),
-
-	DRM_IOCTL_DEF_DRV(QXL_MAP, qxl_map_ioctl, DRM_AUTH),
-
-	DRM_IOCTL_DEF_DRV(QXL_EXECBUFFER, qxl_execbuffer_ioctl,
-							DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(QXL_UPDATE_AREA, qxl_update_area_ioctl,
-							DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(QXL_GETPARAM, qxl_getparam_ioctl,
-							DRM_AUTH),
-	DRM_IOCTL_DEF_DRV(QXL_CLIENTCAP, qxl_clientcap_ioctl,
-							DRM_AUTH),
-
-	DRM_IOCTL_DEF_DRV(QXL_ALLOC_SURF, qxl_alloc_surf_ioctl,
-			  DRM_AUTH),
-};
-
-int qxl_max_ioctls = ARRAY_SIZE(qxl_ioctls);
-- 
2.34.1

