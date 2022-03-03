Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA0E4CC771
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4C010E97A;
	Thu,  3 Mar 2022 20:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD010E84A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D559C218E6;
 Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3e+1ciDGqD2s/iqm/ZtOxkRig2RHyQsLRvyc+Ijx30=;
 b=z2VZ8HWreTEYHvlzpcGMD2MLYq3WzmHOzU3FnYwvKlaQ+Cd13YetqnfrFNLvCHD8FIzYOC
 dfQnvBWqc8KGzSj/4NrxOqD391n3IxishT48IUR/1b06Z3+PMbtf4GJ++CXBbF4TgyIyd2
 Py54C3DwApmX98A4U+XAZ+98m8Y94fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3e+1ciDGqD2s/iqm/ZtOxkRig2RHyQsLRvyc+Ijx30=;
 b=Q2BtL3LikJJbwh6KdXF9cU4EkHc+PB58UjQaBJL1nohl/OwogX9cApznDnpoEVJLdQtzJj
 9ePCNPm4IWyxi6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A15DD139B5;
 Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uBNoJgIsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
Date: Thu,  3 Mar 2022 21:58:36 +0100
Message-Id: <20220303205839.28484-7-tzimmermann@suse.de>
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

Provide struct drm_driver.dumb_create_fbdev, a callback hook for
fbdev dumb buffers. Wire up fbdev and client helpers to use the new
interface, if present.

This acknowledges the fact that fbdev buffers are different. The most
significant difference to regular GEM BOs is in mmap semantics. Fbdev
userspace treats the pages as video memory, which makes it impossible
to ever move the mmap'ed buffer. Hence, drivers ussually have to pin
the BO permanently or install an intermediate shadow buffer for mmap.

So far, fbdev memory came from dumb buffers and DRM drivers had no
means of detecting this without reimplementing a good part of the fbdev
code. With the new callback, drivers can perma-pin fbdev buffer objects
if needed.

Several drivers also require damage handling, which fbdev implements
with its deferred I/O helpers. The new callback allows a driver's memory
manager to set up a suitable mmap.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c        | 14 +++++++----
 drivers/gpu/drm/drm_crtc_internal.h |  3 +++
 drivers/gpu/drm/drm_dumb_buffers.c  | 36 +++++++++++++++++++++++++----
 drivers/gpu/drm/drm_fb_helper.c     | 26 +++++++++++++++++----
 include/drm/drm_client.h            |  3 ++-
 include/drm/drm_drv.h               | 17 ++++++++++++++
 6 files changed, 84 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index af3b7395bf69..c964064651d5 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -247,7 +247,8 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 }
 
 static struct drm_client_buffer *
-drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
+drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format,
+			 bool fbdev)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_mode_create_dumb dumb_args = { };
@@ -265,7 +266,10 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 	dumb_args.width = width;
 	dumb_args.height = height;
 	dumb_args.bpp = info->cpp[0] * 8;
-	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
+	if (fbdev)
+		ret = drm_mode_create_dumb_fbdev(dev, &dumb_args, client->file);
+	else
+		ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
 	if (ret)
 		goto err_delete;
 
@@ -402,6 +406,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
  * @width: Framebuffer width
  * @height: Framebuffer height
  * @format: Buffer format
+ * @fbdev: True if the client provides an fbdev device, or false otherwise
  *
  * This function creates a &drm_client_buffer which consists of a
  * &drm_framebuffer backed by a dumb buffer.
@@ -411,12 +416,13 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
  * Pointer to a client buffer or an error pointer on failure.
  */
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
+drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format,
+			      bool fbdev)
 {
 	struct drm_client_buffer *buffer;
 	int ret;
 
-	buffer = drm_client_buffer_create(client, width, height, format);
+	buffer = drm_client_buffer_create(client, width, height, format, fbdev);
 	if (IS_ERR(buffer))
 		return buffer;
 
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 63279e984342..34e532953b5a 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -101,6 +101,9 @@ int drm_mode_getresources(struct drm_device *dev,
 int drm_mode_create_dumb(struct drm_device *dev,
 			 struct drm_mode_create_dumb *args,
 			 struct drm_file *file_priv);
+int drm_mode_create_dumb_fbdev(struct drm_device *dev,
+			       struct drm_mode_create_dumb *args,
+			       struct drm_file *file_priv);
 int drm_mode_destroy_dumb(struct drm_device *dev, u32 handle,
 			  struct drm_file *file_priv);
 
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index ad17fa21cebb..a605b4c4e4a3 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -57,14 +57,10 @@
  * a hardware-specific ioctl to allocate suitable buffer objects.
  */
 
-int drm_mode_create_dumb(struct drm_device *dev,
-			 struct drm_mode_create_dumb *args,
-			 struct drm_file *file_priv)
+static int drm_mode_sanitize_args(struct drm_mode_create_dumb *args)
 {
 	u32 cpp, stride, size;
 
-	if (!dev->driver->dumb_create)
-		return -ENOSYS;
 	if (!args->width || !args->height || !args->bpp)
 		return -EINVAL;
 
@@ -93,6 +89,21 @@ int drm_mode_create_dumb(struct drm_device *dev,
 	args->pitch = 0;
 	args->size = 0;
 
+	return 0;
+}
+
+int drm_mode_create_dumb(struct drm_device *dev,
+			 struct drm_mode_create_dumb *args,
+			 struct drm_file *file_priv)
+{
+	int ret;
+
+	if (!dev->driver->dumb_create)
+		return -ENOSYS;
+	ret = drm_mode_sanitize_args(args);
+	if (ret)
+		return ret;
+
 	return dev->driver->dumb_create(file_priv, dev, args);
 }
 
@@ -102,6 +113,21 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 	return drm_mode_create_dumb(dev, data, file_priv);
 }
 
+int drm_mode_create_dumb_fbdev(struct drm_device *dev,
+			       struct drm_mode_create_dumb *args,
+			       struct drm_file *file_priv)
+{
+	int ret;
+
+	if (!dev->driver->dumb_create_fbdev)
+		return -ENOSYS;
+	ret = drm_mode_sanitize_args(args);
+	if (ret)
+		return ret;
+
+	return dev->driver->dumb_create_fbdev(file_priv, dev, args);
+}
+
 /**
  * drm_mode_mmap_dumb_ioctl - create an mmap offset for a dumb backing storage buffer
  * @dev: DRM device
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 660ec5038c4e..9d1140a789f4 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -655,6 +655,15 @@ static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_framebuffer *fb = fb_helper->fb;
 
+	/*
+	 * If the driver provides an fbdev create function, it is expected
+	 * to provide its own implementation of deferred I/O. Shadow
+	 * buffering can still be enabled with the prefer_shadow_fbdev
+	 * flag.
+	 */
+	if (dev->driver->dumb_create_fbdev)
+		return dev->mode_config.prefer_shadow_fbdev;
+
 	return dev->mode_config.prefer_shadow_fbdev ||
 	       dev->mode_config.prefer_shadow ||
 	       fb->funcs->dirty;
@@ -2130,6 +2139,7 @@ static void drm_fbdev_fb_destroy(struct fb_info *info)
 static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_device *dev = fb_helper->dev;
 
 	if (drm_fbdev_use_shadow_fb(fb_helper))
 		/*
@@ -2137,14 +2147,20 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 		 * deferred I/O.
 		 */
 		return fb_deferred_io_mmap(info, vma);
-	else if (fb_helper->dev->driver->gem_prime_mmap)
+	else if (!dev->driver->dumb_create_fbdev && drm_fbdev_use_deferred_io(fb_helper))
+		/*
+		 * Drivers without fbdev dumb-create helper rely on fbdev's
+		 * deferred I/O.
+		 */
+		return fb_deferred_io_mmap(info, vma);
+	else if (dev->driver->gem_prime_mmap)
 		/*
 		 * Either directly mmap'ed or with deferred I/O; drivers
 		 * without shadow buffer handle mmap themselves.
 		 */
-		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
-	else
-		return -ENODEV;
+		return dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
+
+	return -ENODEV;
 }
 
 static bool drm_fbdev_use_iomem(struct fb_info *info)
@@ -2395,7 +2411,7 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 
 	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
-					       sizes->surface_height, format);
+					       sizes->surface_height, format, true);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 4fc8018eddda..8d80d5594bea 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -153,7 +153,8 @@ struct drm_client_buffer {
 };
 
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
+drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format,
+			      bool fbdev);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb8856..da4a095de1e7 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -379,6 +379,23 @@ struct drm_driver {
 	int (*dumb_create)(struct drm_file *file_priv,
 			   struct drm_device *dev,
 			   struct drm_mode_create_dumb *args);
+	/**
+	 * @dumb_create_fbdev:
+	 *
+	 * This creates a new dumb buffer for use with DRM fbdev clients and
+	 * returns the resulting buffer handle. This handle can then be wrapped
+	 * up into a framebuffer modeset object.
+	 *
+	 * This is an interface for kernel clients and never called via ioctl.
+	 *
+	 * See @dumb_create for more information.
+	 *
+	 * Returns:
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*dumb_create_fbdev)(struct drm_file *file_priv,
+				 struct drm_device *dev,
+				 struct drm_mode_create_dumb *args);
 	/**
 	 * @dumb_map_offset:
 	 *
-- 
2.35.1

