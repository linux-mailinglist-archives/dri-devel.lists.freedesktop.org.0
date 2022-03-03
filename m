Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B31FF4CC76F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D900710EAC1;
	Thu,  3 Mar 2022 20:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B8F10E79E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92ACF1F387;
 Thu,  3 Mar 2022 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGKPWdswBenK67eQjyzqzCZAIpf0aWbVZ9VytjJasTw=;
 b=u5ehuTqRLSvIpHum2nwBwBaKqq+xFxMDx7RiR8Ny5v2Y50i5Z8asdG70yJMb5HGmb9zlsx
 ZvtSmDXulMJXYnzTDeJsHkMqAvBYnN66dxtESSYO+oZrqawICWGDuWA2FvpDYCjTPv9yU5
 GouRFKZDasJSxqhK+KY3gSBuukJA3R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGKPWdswBenK67eQjyzqzCZAIpf0aWbVZ9VytjJasTw=;
 b=r61MdzQz4lpwo78o/VqXJ878NqMVOZUueoFBSDJZgwLBrXo5BofSAWM4WPg6c1eqqZGdjv
 Pv1lLE5wDG3eHGBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F4D613AEE;
 Thu,  3 Mar 2022 20:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EGpWFgMsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 9/9] drm/virtio: Implement dumb_create_fbdev with GEM SHMEM
 helpers
Date: Thu,  3 Mar 2022 21:58:39 +0100
Message-Id: <20220303205839.28484-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement struct drm_driver.dumb_create_fbdev with the helpers
provided by GEM SHMEM. Fbdev deferred I/O will now work without
an intermediate shadow buffer for mmap.

As the virtio driver replaces several of the regular GEM SHMEM
functions with its own implementation, some additional code is
necessary make fbdev optimization work. Especially, the driver
has to provide buffer-object functions for fbdev. Add the hook
struct drm_driver.gem_create_object_fbdev, which is similar to
struct drm_driver.gem_create_object and allows for the creation
of dedicated fbdev buffer objects. Wire things up within GEM
SHMEM.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  |  7 +++-
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  2 +
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +
 drivers/gpu/drm/virtio/virtgpu_object.c | 54 +++++++++++++++++++++++--
 include/drm/drm_drv.h                   | 10 +++++
 5 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index ab7cb7d896c3..225aa17895bd 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -71,7 +71,12 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private, bool f
 
 	size = PAGE_ALIGN(size);
 
-	if (dev->driver->gem_create_object) {
+	if (dev->driver->gem_create_object_fbdev && fbdev) {
+		obj = dev->driver->gem_create_object_fbdev(dev, size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		shmem = to_drm_gem_shmem_obj(obj);
+	} else if (dev->driver->gem_create_object) {
 		obj = dev->driver->gem_create_object(dev, size);
 		if (IS_ERR(obj))
 			return ERR_CAST(obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 5f25a8d15464..ee414f6e785a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -203,6 +203,7 @@ static const struct drm_driver driver = {
 	.postclose = virtio_gpu_driver_postclose,
 
 	.dumb_create = virtio_gpu_mode_dumb_create,
+	.dumb_create_fbdev = virtio_gpu_mode_dumb_create, // same as dumb_create
 	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
 
 #if defined(CONFIG_DEBUG_FS)
@@ -215,6 +216,7 @@ static const struct drm_driver driver = {
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
 	.gem_create_object = virtio_gpu_create_object,
+	.gem_create_object_fbdev = virtio_gpu_create_object_fbdev,
 	.fops = &virtio_gpu_driver_fops,
 
 	.ioctls = virtio_gpu_ioctls,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0a194aaad419..71556c21c029 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -449,6 +449,8 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
 void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
 struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 						size_t size);
+struct drm_gem_object *virtio_gpu_create_object_fbdev(struct drm_device *dev,
+						      size_t size);
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f293e6ad52da..255f2d650451 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -132,8 +132,8 @@ bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
 	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
 }
 
-struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-						size_t size)
+static struct drm_gem_object *__virtio_gpu_create_object(struct drm_device *dev,
+							 size_t size)
 {
 	struct virtio_gpu_object_shmem *shmem;
 	struct drm_gem_shmem_object *dshmem;
@@ -143,10 +143,58 @@ struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	dshmem = &shmem->base.base;
-	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
 	return &dshmem->base;
 }
 
+struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
+						size_t size)
+{
+	struct drm_gem_object *obj;
+
+	obj = __virtio_gpu_create_object(dev, size);
+	if (IS_ERR(obj))
+		return obj;
+	obj->funcs = &virtio_gpu_shmem_funcs;
+
+	return obj;
+}
+
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
+static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs_fbdev = {
+	.free = virtio_gpu_free_object,
+	.open = virtio_gpu_gem_object_open,
+	.close = virtio_gpu_gem_object_close,
+	.print_info = drm_gem_shmem_object_print_info,
+	.export = virtgpu_gem_prime_export,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap_fbdev,
+	.vm_ops = &drm_gem_shmem_vm_ops_fbdev,
+};
+
+struct drm_gem_object *virtio_gpu_create_object_fbdev(struct drm_device *dev,
+						      size_t size)
+{
+	struct drm_gem_object *obj;
+
+	obj = __virtio_gpu_create_object(dev, size);
+	if (IS_ERR(obj))
+		return obj;
+	obj->funcs = &virtio_gpu_shmem_funcs_fbdev;
+
+	return obj;
+}
+#else
+struct drm_gem_object *virtio_gpu_create_object_fbdev(struct drm_device *dev,
+						      size_t size)
+{
+	return ERR_PTR(-ENOSYS);
+}
+#endif
+
 static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					struct virtio_gpu_object *bo,
 					struct virtio_gpu_mem_entry **ents,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index da4a095de1e7..9081281c1f39 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -298,6 +298,16 @@ struct drm_driver {
 	struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
 						    size_t size);
 
+	/**
+	 * @gem_create_object_fbdev: constructor for gem objects that back fbdev
+	 *
+	 * Hook for allocating the GEM object struct, for use by the CMA
+	 * and SHMEM GEM helpers. Returns a GEM object on success, or an
+	 * ERR_PTR()-encoded error code otherwise.
+	 */
+	struct drm_gem_object *(*gem_create_object_fbdev)(struct drm_device *dev,
+							  size_t size);
+
 	/**
 	 * @prime_handle_to_fd:
 	 *
-- 
2.35.1

