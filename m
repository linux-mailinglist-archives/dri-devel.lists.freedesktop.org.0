Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67A6B7BB6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7C910E579;
	Mon, 13 Mar 2023 15:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503910E56F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:16:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B17F622ADB;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McT4chpUmHJMKEuourQFifyfsvon+kQCmiS9bLiSF3E=;
 b=fOcpk/IKPbvFCsQHBYdDC4qJ7nYGm1pzkHLIttgyCBef0xbtjho8GVcWGO5PTETAx18I6/
 uCqZn7sHJHGKjLFHJF5vDPXhXcVqSojMtXtgzws0++BRNcKi9qJi8Nvh2ejDdnyIRWUCo0
 x72Up0FpiXhh80cuRNscBaF/ztQWPDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McT4chpUmHJMKEuourQFifyfsvon+kQCmiS9bLiSF3E=;
 b=7AB23ZWVB5piBOJHZQEaG4oYYIIca7qanvYCMT2Kut9GnRBVV1mWKHewjhFbZvxlXNC4wx
 tIHK9EGpTayXjADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 948DE139F9;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aOV1Izw+D2Q5ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:16:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 7/7] drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
Date: Mon, 13 Mar 2023 16:16:10 +0100
Message-Id: <20230313151610.14367-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313151610.14367-1-tzimmermann@suse.de>
References: <20230313151610.14367-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of the DRM framebuffer, pass the FB info strcuture to the
fbdev page-fault handler psb_fbdev_vm_fault(). The framebuffer is a
high-level data structure and does not belong into fault handling.
The fb_info has all necessary information. Also set fix.smem_start
to the correct value (the beginning of the framebuffer in physical
address space) and streamline the page-fault handler.

v2:
	* remove unused struct drm_psb_private.fb_base (Patrik)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c       | 39 ++++++++++------------------
 drivers/gpu/drm/gma500/framebuffer.c |  5 ----
 drivers/gpu/drm/gma500/psb_drv.h     |  2 --
 3 files changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 0433392c7fbf..62287407e717 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -22,32 +22,24 @@
 static vm_fault_t psb_fbdev_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct drm_framebuffer *fb = vma->vm_private_data;
-	struct drm_device *dev = fb->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_gem_object *pobj = to_psb_gem_object(fb->obj[0]);
-	int page_num;
-	int i;
-	unsigned long address;
-	vm_fault_t ret = VM_FAULT_SIGBUS;
-	unsigned long pfn;
-	unsigned long phys_addr = (unsigned long)dev_priv->stolen_base + pobj->offset;
-
-	page_num = vma_pages(vma);
-	address = vmf->address - (vmf->pgoff << PAGE_SHIFT);
+	struct fb_info *info = vma->vm_private_data;
+	unsigned long address = vmf->address - (vmf->pgoff << PAGE_SHIFT);
+	unsigned long pfn = info->fix.smem_start >> PAGE_SHIFT;
+	vm_fault_t err = VM_FAULT_SIGBUS;
+	unsigned long page_num = vma_pages(vma);
+	unsigned long i;
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
-	for (i = 0; i < page_num; i++) {
-		pfn = (phys_addr >> PAGE_SHIFT);
-
-		ret = vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn, PFN_DEV));
-		if (unlikely(ret & VM_FAULT_ERROR))
+	for (i = 0; i < page_num; ++i) {
+		err = vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn, PFN_DEV));
+		if (unlikely(err & VM_FAULT_ERROR))
 			break;
 		address += PAGE_SIZE;
-		phys_addr += PAGE_SIZE;
+		++pfn;
 	}
-	return ret;
+
+	return err;
 }
 
 static const struct vm_operations_struct psb_fbdev_vm_ops = {
@@ -102,9 +94,6 @@ static int psb_fbdev_fb_setcolreg(unsigned int regno,
 
 static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-
 	if (vma->vm_pgoff != 0)
 		return -EINVAL;
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
@@ -116,7 +105,7 @@ static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	 * suitable for our mmap work
 	 */
 	vma->vm_ops = &psb_fbdev_vm_ops;
-	vma->vm_private_data = (void *)fb;
+	vma->vm_private_data = info;
 	vm_flags_set(vma, VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP);
 
 	return 0;
@@ -235,7 +224,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->fix.smem_start = dev_priv->fb_base;
+	info->fix.smem_start = dev_priv->stolen_base + backing->offset;
 	info->fix.smem_len = size;
 	info->fix.ywrapstep = 0;
 	info->fix.ypanstep = 0;
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index f5c3bae95eb5..1a374702b696 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -186,7 +186,6 @@ void psb_modeset_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int i;
 
 	if (drmm_mode_config_init(dev))
@@ -197,10 +196,6 @@ void psb_modeset_init(struct drm_device *dev)
 
 	dev->mode_config.funcs = &psb_mode_funcs;
 
-	/* set memory base */
-	/* Oaktrail and Poulsbo should use BAR 2*/
-	pci_read_config_dword(pdev, PSB_BSM, (u32 *)&(dev_priv->fb_base));
-
 	/* num pipes is 2 for PSB but 1 for Mrst */
 	for (i = 0; i < dev_priv->num_pipe; i++)
 		psb_intel_crtc_init(dev, i, mode_dev);
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 931f62c1d942..f7f709df99b4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -520,8 +520,6 @@ struct drm_psb_private {
 	uint32_t blc_adj1;
 	uint32_t blc_adj2;
 
-	resource_size_t fb_base;
-
 	bool dsr_enable;
 	u32 dsr_fb_update;
 	bool dpi_panel_on[3];
-- 
2.39.2

