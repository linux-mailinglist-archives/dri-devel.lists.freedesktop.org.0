Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DFE6563EE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C3510E1FF;
	Mon, 26 Dec 2022 15:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37CE10E1C2;
 Mon, 26 Dec 2022 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v7BLxcmv54ZghGIeL/NetHeNVse710hXnO8qNFDiNp0=; b=ZfSpBYkgdJpaWdhpFW7tGqNe+r
 nhhtt+CV18qthe4KwLsiJ89OUo2WvsKbl6Z9+ZXKv+uX93ArrYP53iZ3JZqUyX+QM2aMOEfK9oetm
 hol/OLCXeSCGFABw0gSKaltriuUM92t5OyRF6jD+/PNQvvnmlYXt0kI2NWJyXMMdZ8Uon1XWP3jA3
 k5XjuDX5I332whUg9Lcm2Stly5MArl1ipWjQZie26vFmUGL7oKmQNYk7fGUDgNtNQy9gKQkcN1upW
 82fgxAyD5AE0HgyzuWzLEzz1KqyWNYzQMIzehgbsE57x2mpdYq/yZKuV2p1LS2Z6WJjceSa1n39rC
 bNIusnGQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9pmC-00AXBr-6O; Mon, 26 Dec 2022 16:52:32 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] drm/virtio: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:26 -0300
Message-Id: <20221226155029.244355-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221226155029.244355-1-mcanal@igalia.com>
References: <20221226155029.244355-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, etnaviv@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which center the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on virtio_gpu_probe(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 17 +++++++----------
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  5 ++---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..91c81b7429cc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -68,8 +68,8 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 static int
 virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct drm_debugfs_entry *entry = m->private;
+	struct virtio_gpu_device *vgdev = entry->dev->dev_private;
 
 	seq_printf(m, "fence %llu %lld\n",
 		   (u64)atomic64_read(&vgdev->fence_drv.last_fence_id),
@@ -80,8 +80,8 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 static int
 virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
+	struct drm_debugfs_entry *entry = m->private;
+	struct virtio_gpu_device *vgdev = entry->dev->dev_private;
 	struct drm_printer p;
 
 	if (!vgdev->has_host_visible) {
@@ -94,7 +94,7 @@ virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 	return 0;
 }
 
-static struct drm_info_list virtio_gpu_debugfs_list[] = {
+static struct drm_debugfs_info virtio_gpu_debugfs_list[] = {
 	{ "virtio-gpu-features", virtio_gpu_features },
 	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
 	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
@@ -102,10 +102,7 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
 
 #define VIRTIO_GPU_DEBUGFS_ENTRIES ARRAY_SIZE(virtio_gpu_debugfs_list)
 
-void
-virtio_gpu_debugfs_init(struct drm_minor *minor)
+void virtio_gpu_debugfs_init(struct drm_device *drm)
 {
-	drm_debugfs_create_files(virtio_gpu_debugfs_list,
-				 VIRTIO_GPU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(drm, virtio_gpu_debugfs_list, VIRTIO_GPU_DEBUGFS_ENTRIES);
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ae97b98750b6..83aa77e5893b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -98,6 +98,8 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	if (ret)
 		goto err_free;
 
+	virtio_gpu_debugfs_init(dev);
+
 	ret = drm_dev_register(dev, 0);
 	if (ret)
 		goto err_deinit;
@@ -179,9 +181,6 @@ static const struct drm_driver driver = {
 	.dumb_create = virtio_gpu_mode_dumb_create,
 	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
 
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = virtio_gpu_debugfs_init,
-#endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_mmap = drm_gem_prime_mmap,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b7a64c7dcc2c..663d405ccacd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -469,7 +469,7 @@ struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct sg_table *sgt);
 
 /* virtgpu_debugfs.c */
-void virtio_gpu_debugfs_init(struct drm_minor *minor);
+void virtio_gpu_debugfs_init(struct drm_device *drm);
 
 /* virtgpu_vram.c */
 bool virtio_gpu_is_vram(struct virtio_gpu_object *bo);
-- 
2.38.1

