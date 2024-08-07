Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E994A338
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F8210E47C;
	Wed,  7 Aug 2024 08:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D8A10E462;
 Wed,  7 Aug 2024 08:45:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 678CE1FB87;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D4D513B03;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ADv/ATk0s2ZmfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Aug 2024 08:45:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/8] drm: Remove struct drm_driver.lastclose
Date: Wed,  7 Aug 2024 10:41:39 +0200
Message-ID: <20240807084539.304014-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807084539.304014-1-tzimmermann@suse.de>
References: <20240807084539.304014-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 678CE1FB87
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

The lastclose callback in struct drm_driver is unused. Remove it. Also
inline the now trivial drm_lastclose() and update documentation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c       |  5 ++---
 drivers/gpu/drm/drm_fb_helper.c | 18 +++++------------
 drivers/gpu/drm/drm_file.c      | 35 +++++++--------------------------
 drivers/gpu/drm/drm_internal.h  |  1 -
 include/drm/drm_client.h        |  7 ++++---
 include/drm/drm_drv.h           | 28 --------------------------
 6 files changed, 18 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 93543071a500..5859838b68cb 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -409,9 +409,8 @@ void drm_minor_release(struct drm_minor *minor)
  * drm_put_dev - Unregister and release a DRM device
  * @dev: DRM device
  *
- * Called at module unload time or when a PCI device is unplugged.
- *
- * Cleans up all DRM device, calling drm_lastclose().
+ * Called at module unload time or when a PCI device is unplugged. Cleans up all DRM
+ * device resrouces.
  *
  * Note: Use of this function is deprecated. It will eventually go away
  * completely.  Please use drm_dev_unregister() and drm_dev_put() explicitly
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3cafb28236f7..36ac75a2ebb8 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -89,14 +89,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * interfaces. Drivers that use one of the shared memory managers, TTM, SHMEM,
  * DMA, should instead use the corresponding fbdev emulation.
  *
- * Existing fbdev implementations should restore the fbdev console by using
- * drm_fb_helper_lastclose() as their &drm_driver.lastclose callback.
- * They should also notify the fb helper code from updates to the output
- * configuration by using drm_fb_helper_output_poll_changed() as their
- * &drm_mode_config_funcs.output_poll_changed callback. New implementations
- * of fbdev should be build on top of struct &drm_client_funcs, which handles
- * this automatically. Setting the old callbacks should be avoided.
- *
  * For suspend/resume consider using drm_mode_config_helper_suspend() and
  * drm_mode_config_helper_resume() which takes care of fbdev as well.
  *
@@ -260,12 +252,12 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
  * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
  * @fb_helper: driver-allocated fbdev helper, can be NULL
  *
- * This should be called from driver's drm &drm_driver.lastclose callback
- * when implementing an fbcon on top of kms using this helper. This ensures that
- * the user isn't greeted with a black screen when e.g. X dies.
+ * This helper should be called from fbdev emulation's &drm_client_funcs.restore
+ * callback. It ensures that the user isn't greeted with a black screen when the
+ * userspace compositor releases the display device.
  *
- * RETURNS:
- * Zero if everything went ok, negative error code otherwise.
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
  */
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 {
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b05108..8fc664974e72 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -62,15 +62,6 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
 	if (dev->driver->load || dev->driver->unload)
 		return true;
 
-	/*
-	 * Drivers with the lastclose callback assume that it's synchronized
-	 * against concurrent opens, which again needs the BKL. The proper fix
-	 * is to use the drm_client infrastructure with proper locking for each
-	 * client.
-	 */
-	if (dev->driver->lastclose)
-		return true;
-
 	return false;
 }
 
@@ -395,26 +386,15 @@ int drm_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL(drm_open);
 
-void drm_lastclose(struct drm_device * dev)
-{
-	drm_dbg_core(dev, "\n");
-
-	if (dev->driver->lastclose)
-		dev->driver->lastclose(dev);
-	drm_dbg_core(dev, "driver lastclose completed\n");
-
-	drm_client_dev_restore(dev);
-}
-
 /**
  * drm_release - release method for DRM file
  * @inode: device inode
  * @filp: file pointer.
  *
  * This function must be used by drivers as their &file_operations.release
- * method. It frees any resources associated with the open file, and calls the
- * &drm_driver.postclose driver callback. If this is the last open file for the
- * DRM device also proceeds to call the &drm_driver.lastclose driver callback.
+ * method. It frees any resources associated with the open file. If this
+ * is the last open file for the DRM device, it also restores the active
+ * in-kernel DRM client.
  *
  * RETURNS:
  *
@@ -434,7 +414,7 @@ int drm_release(struct inode *inode, struct file *filp)
 	drm_close_helper(filp);
 
 	if (atomic_dec_and_test(&dev->open_count))
-		drm_lastclose(dev);
+		drm_client_dev_restore(dev);
 
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
@@ -484,9 +464,8 @@ void drm_file_update_pid(struct drm_file *filp)
  *
  * This function may be used by drivers as their &file_operations.release
  * method. It frees any resources associated with the open file prior to taking
- * the drm_global_mutex, which then calls the &drm_driver.postclose driver
- * callback. If this is the last open file for the DRM device also proceeds to
- * call the &drm_driver.lastclose driver callback.
+ * the drm_global_mutex. If this is the last open file for the DRM device, it
+ * then restores the active in-kernel DRM client.
  *
  * RETURNS:
  *
@@ -501,7 +480,7 @@ int drm_release_noglobal(struct inode *inode, struct file *filp)
 	drm_close_helper(filp);
 
 	if (atomic_dec_and_mutex_lock(&dev->open_count, &drm_global_mutex)) {
-		drm_lastclose(dev);
+		drm_client_dev_restore(dev);
 		mutex_unlock(&drm_global_mutex);
 	}
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 690505a1f7a5..23c99803af44 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -53,7 +53,6 @@ extern struct mutex drm_global_mutex;
 bool drm_dev_needs_global_mutex(struct drm_device *dev);
 struct drm_file *drm_file_alloc(struct drm_minor *minor);
 void drm_file_free(struct drm_file *file);
-void drm_lastclose(struct drm_device *dev);
 
 #ifdef CONFIG_PCI
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..ddf38b210254 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -41,9 +41,10 @@ struct drm_client_funcs {
 	/**
 	 * @restore:
 	 *
-	 * Called on drm_lastclose(). The first client instance in the list that
-	 * returns zero gets the privilege to restore and no more clients are
-	 * called. This callback is not called after @unregister has been called.
+	 * Called userspace closes the final reference to the DRM device file. The
+	 * first client instance in the list that returns zero gets the privilege
+	 * to restore and no more clients are called. This callback is not called
+	 * after @unregister has been called.
 	 *
 	 * Note that the core does not guarantee exclusion against concurrent
 	 * drm_open(). Clients need to ensure this themselves, for example by
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cd37936c3926..02ea4e3248fd 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -228,34 +228,6 @@ struct drm_driver {
 	 */
 	void (*postclose) (struct drm_device *, struct drm_file *);
 
-	/**
-	 * @lastclose:
-	 *
-	 * Called when the last &struct drm_file has been closed and there's
-	 * currently no userspace client for the &struct drm_device.
-	 *
-	 * Modern drivers should only use this to force-restore the fbdev
-	 * framebuffer using drm_fb_helper_restore_fbdev_mode_unlocked().
-	 * Anything else would indicate there's something seriously wrong.
-	 * Modern drivers can also use this to execute delayed power switching
-	 * state changes, e.g. in conjunction with the :ref:`vga_switcheroo`
-	 * infrastructure.
-	 *
-	 * This is called after @postclose hook has been called.
-	 *
-	 * NOTE:
-	 *
-	 * All legacy drivers use this callback to de-initialize the hardware.
-	 * This is purely because of the shadow-attach model, where the DRM
-	 * kernel driver does not really own the hardware. Instead ownershipe is
-	 * handled with the help of userspace through an inheritedly racy dance
-	 * to set/unset the VT into raw mode.
-	 *
-	 * Legacy drivers initialize the hardware in the @firstopen callback,
-	 * which isn't even called for modern drivers.
-	 */
-	void (*lastclose) (struct drm_device *);
-
 	/**
 	 * @unload:
 	 *
-- 
2.46.0

