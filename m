Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214250FC75
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EBB10F383;
	Tue, 26 Apr 2022 12:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456D210F37F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:04:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0ADA210FC;
 Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650974641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0WMJRxLoqjw+Wq7byINl/aZixMf3N2/EKUen6EMZaw=;
 b=vFm5SiZRoiiPDDLbQLLhBAKVT5ktkeZ7nXg7CePnqjZsBqCV3piFzxODS6afbl66rasbJv
 J4srbxTJKrLbOiJx7Xsdc8nVH+hhJfGQLyMjbeIDIX4AFZ7+EUfhYdEA8N/PR4JbDfPEii
 gTi4yC93Mm9Cu1Z01Ll7O5f4JF/lgnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650974641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0WMJRxLoqjw+Wq7byINl/aZixMf3N2/EKUen6EMZaw=;
 b=1dfIR4GpElbxb6gDleGLwEK3SqZNPmnyfnRhXf63eB76/UC5kjD9G/GhX1sEmZaCmXaIc4
 6Gr26wJ22752zSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B494913AE0;
 Tue, 26 Apr 2022 12:04:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iFdAK7HfZ2KqBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 12:04:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 3/5] fbdev: Refactor implementation of page_mkwrite
Date: Tue, 26 Apr 2022 14:03:57 +0200
Message-Id: <20220426120359.17437-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426120359.17437-1-tzimmermann@suse.de>
References: <20220426120359.17437-1-tzimmermann@suse.de>
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

v3:
	* keep locking within track-pages function for readability (Sam)
v2:
	* don't export the helper until we have an external caller

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 53 +++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 1bdef5c241f7..3f9bb4725119 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -143,26 +143,17 @@ int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasy
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
 
-/* vm_ops->page_mkwrite handler */
-static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
+/*
+ * Adds a page to the dirty list. Call this from struct
+ * vm_operations_struct.page_mkwrite.
+ */
+static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
+					    struct page *page)
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
 	/* protect against the workqueue changing the page list */
 	mutex_lock(&fbdefio->lock);
 
@@ -197,6 +188,38 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
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
+	unsigned long offset = vmf->address - vmf->vma->vm_start;
+	struct page *page = vmf->page;
+
+	file_update_time(vmf->vma->vm_file);
+
+	return fb_deferred_io_track_page(info, offset, page);
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

