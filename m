Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D623D82B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 10:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE606E899;
	Thu,  6 Aug 2020 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B5E6E89A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 08:52:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FA8FB61F;
 Thu,  6 Aug 2020 08:53:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, emil.l.velikov@gmail.com,
 lyude@redhat.com, noralf@tronnes.org, zou_wei@huawei.com
Subject: [PATCH v2 2/4] drm/gem: Update client API to use struct drm_gem_membuf
Date: Thu,  6 Aug 2020 10:52:37 +0200
Message-Id: <20200806085239.4606-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200806085239.4606-1-tzimmermann@suse.de>
References: <20200806085239.4606-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM's vmap interface now wraps memory pointers in struct drm_gem_membuf.
The structure represents a pointer into the framebuffer, which is either
in I/O memory or in system memory. The structure contains a flag that
distinguishes these cases.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c    | 25 ++++++++++++-------------
 drivers/gpu/drm/drm_fb_helper.c | 18 +++++++++---------
 drivers/gpu/drm/drm_gem.c       | 19 +++++++++++--------
 drivers/gpu/drm/drm_internal.h  |  5 +++--
 drivers/gpu/drm/drm_prime.c     | 16 ++++++++++------
 include/drm/drm_client.h        |  7 ++++---
 include/drm/drm_device.h        | 26 ++++++++++++++++++++++++++
 7 files changed, 75 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 495f47d23d87..0359b82928c1 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -234,7 +234,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	struct drm_device *dev = buffer->client->dev;
 
-	drm_gem_vunmap(buffer->gem, buffer->vaddr);
+	drm_gem_vunmap(buffer->gem, &buffer->membuf);
 
 	if (buffer->gem)
 		drm_gem_object_put(buffer->gem);
@@ -302,12 +302,13 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
  * Returns:
  *	The mapped memory's address
  */
-void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
+const struct drm_gem_membuf *
+drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 {
-	void *vaddr;
+	int ret;
 
-	if (buffer->vaddr)
-		return buffer->vaddr;
+	if (buffer->membuf.vaddr)
+		return &buffer->membuf;
 
 	/*
 	 * FIXME: The dependency on GEM here isn't required, we could
@@ -317,13 +318,11 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
 	 * fd_install step out of the driver backend hooks, to make that
 	 * final step optional for internal users.
 	 */
-	vaddr = drm_gem_vmap(buffer->gem);
-	if (IS_ERR(vaddr))
-		return vaddr;
-
-	buffer->vaddr = vaddr;
+	ret = drm_gem_vmap(buffer->gem, &buffer->membuf);
+	if (ret)
+		return ERR_PTR(ret);
 
-	return vaddr;
+	return &buffer->membuf;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -337,8 +336,8 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	drm_gem_vunmap(buffer->gem, buffer->vaddr);
-	buffer->vaddr = NULL;
+	drm_gem_vunmap(buffer->gem, &buffer->membuf);
+	buffer->membuf.vaddr = NULL;
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8697554ccd41..da24874247e7 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -394,7 +394,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	unsigned int cpp = fb->format->cpp[0];
 	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
 	void *src = fb_helper->fbdev->screen_buffer + offset;
-	void *dst = fb_helper->buffer->vaddr + offset;
+	void *dst = fb_helper->buffer->membuf.vaddr + offset;
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y;
 
@@ -416,7 +416,7 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 	struct drm_clip_rect *clip = &helper->dirty_clip;
 	struct drm_clip_rect clip_copy;
 	unsigned long flags;
-	void *vaddr;
+	const struct drm_gem_membuf *buf;
 
 	spin_lock_irqsave(&helper->dirty_lock, flags);
 	clip_copy = *clip;
@@ -429,8 +429,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
 
 		/* Generic fbdev uses a shadow buffer */
 		if (helper->buffer) {
-			vaddr = drm_client_buffer_vmap(helper->buffer);
-			if (IS_ERR(vaddr))
+			buf = drm_client_buffer_vmap(helper->buffer);
+			if (IS_ERR(buf))
 				return;
 			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
 		}
@@ -2076,7 +2076,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 	struct drm_framebuffer *fb;
 	struct fb_info *fbi;
 	u32 format;
-	void *vaddr;
+	const struct drm_gem_membuf *membuf;
 
 	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
 		    sizes->surface_width, sizes->surface_height,
@@ -2112,11 +2112,11 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		fb_deferred_io_init(fbi);
 	} else {
 		/* buffer is mapped for HW framebuffer */
-		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
-		if (IS_ERR(vaddr))
-			return PTR_ERR(vaddr);
+		membuf = drm_client_buffer_vmap(fb_helper->buffer);
+		if (IS_ERR(membuf))
+			return PTR_ERR(membuf);
 
-		fbi->screen_buffer = vaddr;
+		fbi->screen_buffer = membuf->vaddr;
 		/* Shamelessly leak the physical address to user-space */
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 19d73868490e..36ded6a56fb2 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1220,7 +1220,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
 		obj->dev->driver->gem_prime_unpin(obj);
 }
 
-void *drm_gem_vmap(struct drm_gem_object *obj)
+int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf)
 {
 	void *vaddr;
 
@@ -1229,23 +1229,26 @@ void *drm_gem_vmap(struct drm_gem_object *obj)
 	else if (obj->dev->driver->gem_prime_vmap)
 		vaddr = obj->dev->driver->gem_prime_vmap(obj);
 	else
-		vaddr = ERR_PTR(-EOPNOTSUPP);
+		return -EOPNOTSUPP;
 
 	if (!vaddr)
-		vaddr = ERR_PTR(-ENOMEM);
+		return -ENOMEM;
+
+	buf->vaddr = vaddr;
+	buf->is_iomem = false;
 
-	return vaddr;
+	return 0;
 }
 
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr)
+void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_membuf *buf)
 {
-	if (!vaddr)
+	if (!buf || !buf->vaddr)
 		return;
 
 	if (obj->funcs && obj->funcs->vunmap)
-		obj->funcs->vunmap(obj, vaddr);
+		obj->funcs->vunmap(obj, buf->vaddr);
 	else if (obj->dev->driver->gem_prime_vunmap)
-		obj->dev->driver->gem_prime_vunmap(obj, vaddr);
+		obj->dev->driver->gem_prime_vunmap(obj, buf->vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 8e01caaf95cc..201d71249954 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -36,6 +36,7 @@ struct dma_buf;
 struct drm_connector;
 struct drm_crtc;
 struct drm_framebuffer;
+struct drm_gem_membuf;
 struct drm_gem_object;
 struct drm_master;
 struct drm_minor;
@@ -186,8 +187,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 
 int drm_gem_pin(struct drm_gem_object *obj);
 void drm_gem_unpin(struct drm_gem_object *obj);
-void *drm_gem_vmap(struct drm_gem_object *obj);
-void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
+int drm_gem_vmap(struct drm_gem_object *obj, struct drm_gem_membuf *buf);
+void drm_gem_vunmap(struct drm_gem_object *obj, const struct drm_gem_membuf *buf);
 
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1693aa7c14b5..d95a39030a93 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -671,13 +671,14 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
 void *drm_gem_dmabuf_vmap(struct dma_buf *dma_buf)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
-	void *vaddr;
+	struct drm_gem_membuf buf;
+	int ret;
 
-	vaddr = drm_gem_vmap(obj);
-	if (IS_ERR(vaddr))
-		vaddr = NULL;
+	ret = drm_gem_vmap(obj, &buf);
+	if (ret)
+		buf.vaddr = NULL;
 
-	return vaddr;
+	return buf.vaddr;
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -692,8 +693,11 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
+	struct drm_gem_membuf buf;
 
-	drm_gem_vunmap(obj, vaddr);
+	buf.vaddr = vaddr;
+	buf.is_iomem = false;
+	drm_gem_vunmap(obj, &buf);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 7aaea665bfc2..5ed73c390619 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -14,6 +14,7 @@ struct drm_client_dev;
 struct drm_device;
 struct drm_file;
 struct drm_framebuffer;
+struct drm_gem_membuf;
 struct drm_gem_object;
 struct drm_minor;
 struct module;
@@ -141,9 +142,9 @@ struct drm_client_buffer {
 	struct drm_gem_object *gem;
 
 	/**
-	 * @vaddr: Virtual address for the buffer
+	 * @membuf: Virtual address for the buffer
 	 */
-	void *vaddr;
+	struct drm_gem_membuf membuf;
 
 	/**
 	 * @fb: DRM framebuffer
@@ -155,7 +156,7 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
-void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
+const struct drm_gem_membuf *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 
 int drm_client_modeset_create(struct drm_client_dev *client);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 0988351d743c..6ecf03601c36 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -381,4 +381,30 @@ struct drm_device {
 #endif
 };
 
+/**
+ * struct drm_gem_membuf - GEM memory buffer
+ */
+struct drm_gem_membuf {
+	union {
+		/**
+		 * @vaddr:
+		 *
+		 * The virtual address for the buffer in system memory.
+		 */
+		void *vaddr;
+		/**
+		 * @vaddr_iomem:
+		 *
+		 * The virtual address for the buffer in I/O memory.
+		 */
+		void __iomem *vaddr_iomem;
+	};
+	/**
+	 * @is_iomem:
+	 *
+	 * True if the memory is located in I/O memory, false otherwise.
+	 */
+	bool is_iomem;
+};
+
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
