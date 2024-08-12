Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820EC94E8A2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC87010E0F4;
	Mon, 12 Aug 2024 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ncNBvVPh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jk5ClCT8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ncNBvVPh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jk5ClCT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3235410E10F;
 Mon, 12 Aug 2024 08:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B353620244;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/7xqilPI9yqipFG0q16kl0OTh2lTY6KXEvFyAjUdlg=;
 b=ncNBvVPhPImVhM2Ue2Tebd/FKXJuq1+XF40XwQKrCgiFmQZDpNv5w5f8f1VZ9MLFfXY7W8
 5ONPkwi44hkcYNvDOft81bSnMz5rliPt40uS8FSBED+MogrDJGtjTLbk86aB4OU1T8tMcM
 S3xymG4UlvbGs0P0u//radS/ngLvJOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/7xqilPI9yqipFG0q16kl0OTh2lTY6KXEvFyAjUdlg=;
 b=Jk5ClCT8Hc7R/VAJ0e+9h/rtQWaqE07L1qV0H++wzggHxiGLyceO8ipdtCVY+E73lVuvrX
 C8JzDU1MuQqJtjBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/7xqilPI9yqipFG0q16kl0OTh2lTY6KXEvFyAjUdlg=;
 b=ncNBvVPhPImVhM2Ue2Tebd/FKXJuq1+XF40XwQKrCgiFmQZDpNv5w5f8f1VZ9MLFfXY7W8
 5ONPkwi44hkcYNvDOft81bSnMz5rliPt40uS8FSBED+MogrDJGtjTLbk86aB4OU1T8tMcM
 S3xymG4UlvbGs0P0u//radS/ngLvJOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/7xqilPI9yqipFG0q16kl0OTh2lTY6KXEvFyAjUdlg=;
 b=Jk5ClCT8Hc7R/VAJ0e+9h/rtQWaqE07L1qV0H++wzggHxiGLyceO8ipdtCVY+E73lVuvrX
 C8JzDU1MuQqJtjBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5933813A23;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KC6VFBDIuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 8/9] drm: Remove struct drm_driver.lastclose
Date: Mon, 12 Aug 2024 10:28:29 +0200
Message-ID: <20240812083000.337744-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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
update documentation.

v2:
- update to use drm_lastclose()
- fix typo in documentation

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_file.c     | 28 ++++++----------------------
 drivers/gpu/drm/drm_internal.h |  1 -
 include/drm/drm_drv.h          | 28 ----------------------------
 3 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 513bef816ae9..e8a841e70934 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -63,15 +63,6 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
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
 
@@ -396,14 +387,8 @@ int drm_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL(drm_open);
 
-void drm_lastclose(struct drm_device * dev)
+static void drm_lastclose(struct drm_device *dev)
 {
-	drm_dbg_core(dev, "\n");
-
-	if (dev->driver->lastclose)
-		dev->driver->lastclose(dev);
-	drm_dbg_core(dev, "driver lastclose completed\n");
-
 	drm_client_dev_restore(dev);
 
 	if (dev_is_pci(dev->dev))
@@ -416,9 +401,9 @@ void drm_lastclose(struct drm_device * dev)
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
@@ -488,9 +473,8 @@ void drm_file_update_pid(struct drm_file *filp)
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

