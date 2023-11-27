Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0273F7FA0AB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ED510E27D;
	Mon, 27 Nov 2023 13:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354D10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7E5D20406;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701091026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMYeEz0Q73q918wsHM2+edxekdU0h2WLPFYhZeJ7F54=;
 b=sVhlrlzHaKM/giXjKRmepsweEywFwRE0A2VF7qW8kWxJO8ac4JGe1iE/OhO6Wp0iLrXiyU
 PXdGs6YRE1GYNOK1H0o2mSaVKekMYX0S5goN6zkvrPy6K8RDvTAbTUrZDUpIUPvw6nIA3g
 2SqBlRbXEg1wbkE7HBV2rKjpZFfh4is=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701091026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMYeEz0Q73q918wsHM2+edxekdU0h2WLPFYhZeJ7F54=;
 b=WGm2fraR2yOrQIqRt+fMaY1igEMbligy4zQGUL587lopawra8LmgSPXFdPxq//J+Th9oPQ
 +4g9PkunBUQCNYAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9253313B3A;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SJWlItKWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 30/32] fbdev: Move default fb_mmap code into helper function
Date: Mon, 27 Nov 2023 14:15:59 +0100
Message-ID: <20231127131655.4020-31-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCPT_COUNT_FIVE(0.00)[5]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.70
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

Move the default fb_mmap code for I/O address spaces into the helper
function fb_io_mmap(). The helper can either be called via struct
fb_ops.fb_mmap or as the default if no fb_mmap has been set. Also
set the new helper in __FB_DEFAULT_IOMEM_OPS_MMAP.

In the mid-term, fb_io_mmap() is supposed to become optional. Fbdev
drivers will initialize their struct fb_ops.fb_mmap to the helper
and select a corresponding Kconfig token. The helper can then be made
optional at compile time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_chrdev.c  | 36 +++++----------------------
 drivers/video/fbdev/core/fb_io_fops.c | 27 ++++++++++++++++++++
 include/linux/fb.h                    |  3 ++-
 3 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_chrdev.c b/drivers/video/fbdev/core/fb_chrdev.c
index b73a122950a94..089441c9d810f 100644
--- a/drivers/video/fbdev/core/fb_chrdev.c
+++ b/drivers/video/fbdev/core/fb_chrdev.c
@@ -314,20 +314,16 @@ static long fb_compat_ioctl(struct file *file, unsigned int cmd,
 static int fb_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct fb_info *info = file_fb_info(file);
-	unsigned long mmio_pgoff;
-	unsigned long start;
-	u32 len;
+	int res;
 
 	if (!info)
 		return -ENODEV;
+
 	mutex_lock(&info->mm_lock);
 
 	if (info->fbops->fb_mmap) {
-		int res;
 
 		res = info->fbops->fb_mmap(info, vma);
-		mutex_unlock(&info->mm_lock);
-		return res;
 #if IS_ENABLED(CONFIG_FB_DEFERRED_IO)
 	} else if (info->fbdefio) {
 		/*
@@ -335,35 +331,15 @@ static int fb_mmap(struct file *file, struct vm_area_struct *vma)
 		 * minimum, point struct fb_ops.fb_mmap to fb_deferred_io_mmap().
 		 */
 		dev_warn_once(info->dev, "fbdev mmap not set up for deferred I/O.\n");
-		mutex_unlock(&info->mm_lock);
-		return -ENODEV;
+		res = -ENODEV;
 #endif
+	} else {
+		res = fb_io_mmap(info, vma);
 	}
 
-	/*
-	 * Ugh. This can be either the frame buffer mapping, or
-	 * if pgoff points past it, the mmio mapping.
-	 */
-	start = info->fix.smem_start;
-	len = info->fix.smem_len;
-	mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
-	if (vma->vm_pgoff >= mmio_pgoff) {
-		if (info->var.accel_flags) {
-			mutex_unlock(&info->mm_lock);
-			return -EINVAL;
-		}
-
-		vma->vm_pgoff -= mmio_pgoff;
-		start = info->fix.mmio_start;
-		len = info->fix.mmio_len;
-	}
 	mutex_unlock(&info->mm_lock);
 
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	vma->vm_page_prot = pgprot_framebuffer(vma->vm_page_prot, vma->vm_start,
-					       vma->vm_end, start);
-
-	return vm_iomap_memory(vma, start, len);
+	return res;
 }
 
 static int fb_open(struct inode *inode, struct file *file)
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index 871b829521af3..60805e43914e5 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -132,5 +132,32 @@ ssize_t fb_io_write(struct fb_info *info, const char __user *buf, size_t count,
 }
 EXPORT_SYMBOL(fb_io_write);
 
+int fb_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	unsigned long start = info->fix.smem_start;
+	u32 len = info->fix.smem_len;
+	unsigned long mmio_pgoff = PAGE_ALIGN((start & ~PAGE_MASK) + len) >> PAGE_SHIFT;
+
+	/*
+	 * This can be either the framebuffer mapping, or if pgoff points
+	 * past it, the mmio mapping.
+	 */
+	if (vma->vm_pgoff >= mmio_pgoff) {
+		if (info->var.accel_flags)
+			return -EINVAL;
+
+		vma->vm_pgoff -= mmio_pgoff;
+		start = info->fix.mmio_start;
+		len = info->fix.mmio_len;
+	}
+
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = pgprot_framebuffer(vma->vm_page_prot, vma->vm_start,
+					       vma->vm_end, start);
+
+	return vm_iomap_memory(vma, start, len);
+}
+EXPORT_SYMBOL(fb_io_mmap);
+
 MODULE_DESCRIPTION("Fbdev helpers for framebuffers in I/O memory");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 94e2c44c65699..a36d05b576b0c 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -536,6 +536,7 @@ extern ssize_t fb_io_read(struct fb_info *info, char __user *buf,
 			  size_t count, loff_t *ppos);
 extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 			   size_t count, loff_t *ppos);
+int fb_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
 #define __FB_DEFAULT_IOMEM_OPS_RDWR \
 	.fb_read	= fb_io_read, \
@@ -547,7 +548,7 @@ extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
 	.fb_imageblit	= cfb_imageblit
 
 #define __FB_DEFAULT_IOMEM_OPS_MMAP \
-	.fb_mmap	= NULL /* default implementation */
+	.fb_mmap	= fb_io_mmap
 
 #define FB_DEFAULT_IOMEM_OPS \
 	__FB_DEFAULT_IOMEM_OPS_RDWR, \
-- 
2.43.0

