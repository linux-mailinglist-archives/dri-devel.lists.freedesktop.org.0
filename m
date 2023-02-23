Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F06A086D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A692410EB5F;
	Thu, 23 Feb 2023 12:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61FC10EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99C0E37B09;
 Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJwi1DTQzBtgo9jXN9alD17H7QL+4ASEPYBtErcQZ+0=;
 b=rFw4nqUTJs/Wfl6sWNGWgDiH68VufEXmk1zrcJUtwr51KwO0JyjCnGZVmXRN5FkWsbIjnW
 DPRfhnZUL9VsRPPC2sJiqHwZy8oyhpUpUVWo31ChbC/Cy+6Je2nLzwAE2/Pr4nWcWQsBk5
 9+Eu0N7Qk0GqXM28yH+uTnm2qRo+kLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJwi1DTQzBtgo9jXN9alD17H7QL+4ASEPYBtErcQZ+0=;
 b=lQHJjJM8W20nLl4q8cEel+owKxcEF7edLPTzly/YbN7xD0P3hcG/svetQveIjq1seVqDec
 a+Qpi2g2LkdJngAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 793EF139C7;
 Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EPUGHGNZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 7/7] drm/gma500: Pass fb_info to psb_fbdev_vm_fault()
Date: Thu, 23 Feb 2023 13:17:33 +0100
Message-Id: <20230223121733.12549-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223121733.12549-1-tzimmermann@suse.de>
References: <20230223121733.12549-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 39 ++++++++++++----------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index a70ca4c5013f..c8dbcb33ddb5 100644
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
 	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
 	return 0;
@@ -235,7 +224,7 @@ static int psbfb_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->fix.smem_start = dev_priv->fb_base;
+	info->fix.smem_start = dev_priv->stolen_base + backing->offset;
 	info->fix.smem_len = size;
 	info->fix.ywrapstep = 0;
 	info->fix.ypanstep = 0;
-- 
2.39.2

