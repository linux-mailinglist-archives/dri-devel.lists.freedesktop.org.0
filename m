Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7D7F4609
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D21E10E615;
	Wed, 22 Nov 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E529E10E610
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:24:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 771BA1FD60;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700655895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75C3sdg/o12I/irlqCaCX1LRC7UlneUYOrJezXaa0ww=;
 b=L/56D1iuKmAmEumfzXaD0iEhouMrdjnUaMOIf0vdNi0fPcLkeyb+c27vsH4LtU/H86wkyX
 h8TM+SUyXNSoY+OFLyIC26loVXxxTk1kGqJ2QDVqmtBz2c4lXkIds8aknOihzTZdHzb4Sq
 dKejD37Cm76XneNgg9trAOBq+YY3VG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700655895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75C3sdg/o12I/irlqCaCX1LRC7UlneUYOrJezXaa0ww=;
 b=VkUCteNn1BQ9AXaY7fvcyvy/VIlzwRAHn3gi1qXRWtOYLuTL3LPf0OCwEOkRjfMnHunE8L
 OI/7PWByoQVxnxCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48C6C13461;
 Wed, 22 Nov 2023 12:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ACDoEBfzXWU2TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Nov 2023 12:24:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, cai.huoqing@linux.dev
Subject: [PATCH 10/14] drm: Remove support for legacy drivers
Date: Wed, 22 Nov 2023 13:09:39 +0100
Message-ID: <20231122122449.11588-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231122122449.11588-1-tzimmermann@suse.de>
References: <20231122122449.11588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.30
X-Spamd-Result: default: False [-7.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove all hooks and calls into code for user-space mode setting from
the DRM core. Without the drivers and ioctl entry points, none of this
is required any longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_auth.c   |  8 +----
 drivers/gpu/drm/drm_drv.c    | 17 ----------
 drivers/gpu/drm/drm_file.c   | 64 ++----------------------------------
 drivers/gpu/drm/drm_vblank.c | 19 -----------
 4 files changed, 3 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 2ed2585ded378..252c105d614ff 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -37,13 +37,12 @@
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
-#include "drm_legacy.h"
 
 /**
  * DOC: master and authentication
  *
  * &struct drm_master is used to track groups of clients with open
- * primary/legacy device nodes. For every &struct drm_file which has had at
+ * primary device nodes. For every &struct drm_file which has had at
  * least once successfully became the device master (either through the
  * SET_MASTER IOCTL, or implicitly through opening the primary device node when
  * no one else is the current master that time) there exists one &drm_master.
@@ -139,7 +138,6 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 		return NULL;
 
 	kref_init(&master->refcount);
-	drm_master_legacy_init(master);
 	idr_init_base(&master->magic_map, 1);
 	master->dev = dev;
 
@@ -365,8 +363,6 @@ void drm_master_release(struct drm_file *file_priv)
 	if (!drm_is_current_master_locked(file_priv))
 		goto out;
 
-	drm_legacy_lock_master_cleanup(dev, master);
-
 	if (dev->master == file_priv->master)
 		drm_drop_master(dev, file_priv);
 out:
@@ -429,8 +425,6 @@ static void drm_master_destroy(struct kref *kref)
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		drm_lease_destroy(master);
 
-	drm_legacy_master_rmmaps(dev, master);
-
 	idr_destroy(&master->magic_map);
 	idr_destroy(&master->leases);
 	idr_destroy(&master->lessee_idr);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 535f16e7882e7..979366e68dbb8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -48,7 +48,6 @@
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
-#include "drm_legacy.h"
 
 MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
@@ -585,8 +584,6 @@ static void drm_fs_inode_free(struct inode *inode)
 
 static void drm_dev_init_release(struct drm_device *dev, void *res)
 {
-	drm_legacy_ctxbitmap_cleanup(dev);
-	drm_legacy_remove_map_hash(dev);
 	drm_fs_inode_free(dev->anon_inode);
 
 	put_device(dev->dev);
@@ -597,7 +594,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
 	mutex_destroy(&dev->clientlist_mutex);
 	mutex_destroy(&dev->filelist_mutex);
 	mutex_destroy(&dev->struct_mutex);
-	drm_legacy_destroy_members(dev);
 }
 
 static int drm_dev_init(struct drm_device *dev,
@@ -632,7 +628,6 @@ static int drm_dev_init(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	drm_legacy_init_members(dev);
 	INIT_LIST_HEAD(&dev->filelist);
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
@@ -673,12 +668,6 @@ static int drm_dev_init(struct drm_device *dev,
 			goto err;
 	}
 
-	ret = drm_legacy_create_map_hash(dev);
-	if (ret)
-		goto err;
-
-	drm_legacy_ctxbitmap_init(dev);
-
 	if (drm_core_check_feature(dev, DRIVER_GEM)) {
 		ret = drm_gem_init(dev);
 		if (ret) {
@@ -990,9 +979,6 @@ EXPORT_SYMBOL(drm_dev_register);
  */
 void drm_dev_unregister(struct drm_device *dev)
 {
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		drm_lastclose(dev);
-
 	dev->registered = false;
 
 	drm_client_dev_unregister(dev);
@@ -1003,9 +989,6 @@ void drm_dev_unregister(struct drm_device *dev)
 	if (dev->driver->unload)
 		dev->driver->unload(dev);
 
-	drm_legacy_pci_agp_destroy(dev);
-	drm_legacy_rmmaps(dev);
-
 	remove_compat_control_link(dev);
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 5ddaffd325865..987c1a5d1773b 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -47,21 +47,12 @@
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
-#include "drm_legacy.h"
 
 /* from BKL pushdown */
 DEFINE_MUTEX(drm_global_mutex);
 
 bool drm_dev_needs_global_mutex(struct drm_device *dev)
 {
-	/*
-	 * Legacy drivers rely on all kinds of BKL locking semantics, don't
-	 * bother. They also still need BKL locking for their ioctls, so better
-	 * safe than sorry.
-	 */
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		return true;
-
 	/*
 	 * The deprecated ->load callback must be called after the driver is
 	 * already registered. This means such drivers rely on the BKL to make
@@ -107,9 +98,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  * drm_send_event() as the main starting points.
  *
  * The memory mapping implementation will vary depending on how the driver
- * manages memory. Legacy drivers will use the deprecated drm_legacy_mmap()
- * function, modern drivers should use one of the provided memory-manager
- * specific implementations. For GEM-based drivers this is drm_gem_mmap().
+ * manages memory. For GEM-based drivers this is drm_gem_mmap().
  *
  * No other file operations are supported by the DRM userspace API. Overall the
  * following is an example &file_operations structure::
@@ -254,18 +243,6 @@ void drm_file_free(struct drm_file *file)
 		     (long)old_encode_dev(file->minor->kdev->devt),
 		     atomic_read(&dev->open_count));
 
-#ifdef CONFIG_DRM_LEGACY
-	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
-	    dev->driver->preclose)
-		dev->driver->preclose(dev, file);
-#endif
-
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		drm_legacy_lock_release(dev, file->filp);
-
-	if (drm_core_check_feature(dev, DRIVER_HAVE_DMA))
-		drm_legacy_reclaim_buffers(dev, file);
-
 	drm_events_release(file);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
@@ -279,8 +256,6 @@ void drm_file_free(struct drm_file *file)
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_release(dev, file);
 
-	drm_legacy_ctxbitmap_flush(dev, file);
-
 	if (drm_is_primary_client(file))
 		drm_master_release(file);
 
@@ -367,29 +342,6 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
-#ifdef CONFIG_DRM_LEGACY
-#ifdef __alpha__
-	/*
-	 * Default the hose
-	 */
-	if (!dev->hose) {
-		struct pci_dev *pci_dev;
-
-		pci_dev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
-		if (pci_dev) {
-			dev->hose = pci_dev->sysdata;
-			pci_dev_put(pci_dev);
-		}
-		if (!dev->hose) {
-			struct pci_bus *b = list_entry(pci_root_buses.next,
-				struct pci_bus, node);
-			if (b)
-				dev->hose = b->sysdata;
-		}
-	}
-#endif
-#endif
-
 	return 0;
 }
 
@@ -411,7 +363,6 @@ int drm_open(struct inode *inode, struct file *filp)
 	struct drm_device *dev;
 	struct drm_minor *minor;
 	int retcode;
-	int need_setup = 0;
 
 	minor = drm_minor_acquire(iminor(inode));
 	if (IS_ERR(minor))
@@ -421,8 +372,7 @@ int drm_open(struct inode *inode, struct file *filp)
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
-	if (!atomic_fetch_inc(&dev->open_count))
-		need_setup = 1;
+	atomic_fetch_inc(&dev->open_count);
 
 	/* share address_space across all char-devs of a single device */
 	filp->f_mapping = dev->anon_inode->i_mapping;
@@ -430,13 +380,6 @@ int drm_open(struct inode *inode, struct file *filp)
 	retcode = drm_open_helper(filp, minor);
 	if (retcode)
 		goto err_undo;
-	if (need_setup) {
-		retcode = drm_legacy_setup(dev);
-		if (retcode) {
-			drm_close_helper(filp);
-			goto err_undo;
-		}
-	}
 
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
@@ -460,9 +403,6 @@ void drm_lastclose(struct drm_device * dev)
 		dev->driver->lastclose(dev);
 	drm_dbg_core(dev, "driver lastclose completed\n");
 
-	if (drm_core_check_feature(dev, DRIVER_LEGACY))
-		drm_legacy_dev_reinit(dev);
-
 	drm_client_dev_restore(dev);
 }
 
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index a11f164b2384f..702a12bc93bd9 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -210,11 +210,6 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->get_vblank_counter)
 			return crtc->funcs->get_vblank_counter(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
-	else if (dev->driver->get_vblank_counter) {
-		return dev->driver->get_vblank_counter(dev, pipe);
-	}
-#endif
 
 	return drm_vblank_no_hw_counter(dev, pipe);
 }
@@ -433,11 +428,6 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->disable_vblank)
 			crtc->funcs->disable_vblank(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
-	else {
-		dev->driver->disable_vblank(dev, pipe);
-	}
-#endif
 }
 
 /*
@@ -1151,11 +1141,6 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 		if (crtc->funcs->enable_vblank)
 			return crtc->funcs->enable_vblank(crtc);
 	}
-#ifdef CONFIG_DRM_LEGACY
-	else if (dev->driver->enable_vblank) {
-		return dev->driver->enable_vblank(dev, pipe);
-	}
-#endif
 
 	return -EINVAL;
 }
@@ -1698,10 +1683,6 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 
 static bool drm_wait_vblank_supported(struct drm_device *dev)
 {
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
-	if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
-		return dev->irq_enabled;
-#endif
 	return drm_dev_has_vblank(dev);
 }
 
-- 
2.42.1

