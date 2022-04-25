Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42D50DEC4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6F710E37A;
	Mon, 25 Apr 2022 11:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94C210E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 11:27:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EB0721100;
 Mon, 25 Apr 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650886073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhG85TsSK3EUNgu/Na86s/FJVe6togqbhN7J3edS+WM=;
 b=vqg2CryCgYd6kLH0tLoFQyHhVg4AhY8NLQCAJeDzo5yC2EjCeynr2o0HM2trjGWh3nTIY3
 R5+Kz4+rIv25UsRHhRWuXYrLfWaA7/5layykgX0YHU5AH+S4Tuj/0WpTTUNBjt61lLZius
 CNmkh2n+4ddM2Gl3XpSNAXcKlXfcmOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650886073;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhG85TsSK3EUNgu/Na86s/FJVe6togqbhN7J3edS+WM=;
 b=IHWVCNEy65SK8ormwXXXRu52C2dClqGRD+8E5d7P7VgIIyyiTMq1rM1RcNw+qYtlBDNBVL
 OC1pzVA2tgbzDMCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 419BF13AF3;
 Mon, 25 Apr 2022 11:27:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yFsxD7mFZmIPUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Apr 2022 11:27:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 3/3] fbdev: Refactor implementation of page_mkwrite
Date: Mon, 25 Apr 2022 13:27:51 +0200
Message-Id: <20220425112751.25985-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425112751.25985-1-tzimmermann@suse.de>
References: <20220425112751.25985-1-tzimmermann@suse.de>
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

Refactor the page-write handler for deferred I/O. Drivers use the
function to let fbdev track written pages of mmap'ed framebuffer
memory.

v2:
	* don't export the helper until we have an external caller

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 68 ++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index a03b9c64fc61..214581ce5840 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -143,29 +143,18 @@ int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasy
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
 
-/* vm_ops->page_mkwrite handler */
-static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
+/*
+ * Adds a page to the dirty list. Requires caller to hold
+ * struct fb_deferred_io.lock. Call this from struct
+ * vm_operations_struct.page_mkwrite.
+ */
+static vm_fault_t __fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
+					      struct page *page)
 {
-	struct page *page = vmf->page;
-	struct fb_info *info = vmf->vma->vm_private_data;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_pageref *pageref;
-	unsigned long offset;
 	vm_fault_t ret;
 
-	offset = (vmf->address - vmf->vma->vm_start);
-
-	/* this is a callback we get when userspace first tries to
-	write to the page. we schedule a workqueue. that workqueue
-	will eventually mkclean the touched pages and execute the
-	deferred framebuffer IO. then if userspace touches a page
-	again, we repeat the same scheme */
-
-	file_update_time(vmf->vma->vm_file);
-
-	/* protect against the workqueue changing the page list */
-	mutex_lock(&fbdefio->lock);
-
 	/* first write in this cycle, notify the driver */
 	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
 		fbdefio->first_io(info);
@@ -186,8 +175,6 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	 */
 	lock_page(pageref->page);
 
-	mutex_unlock(&fbdefio->lock);
-
 	/* come back after delay to process the deferred IO */
 	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
 	return VM_FAULT_LOCKED;
@@ -197,6 +184,47 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	return ret;
 }
 
+/*
+ * fb_deferred_io_page_mkwrite - Mark a page as written for deferred I/O
+ * @fb_info: The fbdev info structure
+ * @vmf: The VM fault
+ *
+ * This is a callback we get when userspace first tries to
+ * write to the page. We schedule a workqueue. That workqueue
+ * will eventually mkclean the touched pages and execute the
+ * deferred framebuffer IO. Then if userspace touches a page
+ * again, we repeat the same scheme.
+ *
+ * Returns:
+ * VM_FAULT_LOCKED on success, or a VM_FAULT error otherwise.
+ */
+static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
+{
+	struct page *page = vmf->page;
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+	unsigned long offset;
+	vm_fault_t ret;
+
+	offset = (vmf->address - vmf->vma->vm_start);
+
+	file_update_time(vmf->vma->vm_file);
+
+	/* protect against the workqueue changing the page list */
+	mutex_lock(&fbdefio->lock);
+	ret = __fb_deferred_io_track_page(info, offset, page);
+	mutex_unlock(&fbdefio->lock);
+
+	return ret;
+}
+
+/* vm_ops->page_mkwrite handler */
+static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
+{
+	struct fb_info *info = vmf->vma->vm_private_data;
+
+	return fb_deferred_io_page_mkwrite(info, vmf);
+}
+
 static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.fault		= fb_deferred_io_fault,
 	.page_mkwrite	= fb_deferred_io_mkwrite,
-- 
2.36.0

