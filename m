Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4877FA0A5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7659A10E275;
	Mon, 27 Nov 2023 13:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE9110E273
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8C66920405;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 689B9132A6;
 Mon, 27 Nov 2023 13:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id MFdvGNKWZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 29/32] fbdev: Push pgprot_decrypted() into mmap
 implementations
Date: Mon, 27 Nov 2023 14:15:58 +0100
Message-ID: <20231127131655.4020-30-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++
X-Spam-Score: 7.71
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 8C66920405
X-Spam-Flag: NO
X-Spam-Level: *******
X-Spamd-Result: default: False [7.71 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5];
 R_RATELIMIT(0.00)[to_ip_from(RLd5zd8tio7mptchx3z93fk9kq)];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.18)[-0.877];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-0.91)[-0.907];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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

If a driver sets struct fb_ops.fb_mmap, the fbdev core automatically
calls pgprot_decrypted(). But the default fb_mmap code doesn't handle
pgprot_decrypted().

Move the call to pgprot_decrypted() into each drivers' fb_mmap function.
This only concerns fb_mmap functions for system and DMA memory. For
I/O memory, which is the default case, nothing changes. The fb_mmap
for I/O-memory can later be moved into a helper as well.

DRM's fbdev emulation handles pgprot_decrypted() internally via the
Prime helpers. Fbdev doesn't have to do anything in this case. In
cases where DRM uses deferred I/O, this patch updates fb_mmap correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/auxdisplay/cfag12864bfb.c              | 2 ++
 drivers/auxdisplay/ht16k33.c                   | 2 ++
 drivers/video/fbdev/amba-clcd.c                | 2 ++
 drivers/video/fbdev/au1100fb.c                 | 2 ++
 drivers/video/fbdev/au1200fb.c                 | 2 ++
 drivers/video/fbdev/core/fb_chrdev.c           | 5 -----
 drivers/video/fbdev/core/fb_defio.c            | 2 ++
 drivers/video/fbdev/ep93xx-fb.c                | 2 ++
 drivers/video/fbdev/gbefb.c                    | 2 ++
 drivers/video/fbdev/omap/omapfb_main.c         | 2 ++
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c | 2 ++
 drivers/video/fbdev/ps3fb.c                    | 2 ++
 drivers/video/fbdev/sa1100fb.c                 | 2 ++
 drivers/video/fbdev/sbuslib.c                  | 1 +
 drivers/video/fbdev/sh_mobile_lcdcfb.c         | 4 ++++
 drivers/video/fbdev/smscufx.c                  | 2 ++
 drivers/video/fbdev/udlfb.c                    | 2 ++
 drivers/video/fbdev/vermilion/vermilion.c      | 2 ++
 drivers/video/fbdev/vfb.c                      | 2 ++
 19 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index ede0f9a513110..5ba19c339f088 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -51,6 +51,8 @@ static int cfag12864bfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct page *pages = virt_to_page(cfag12864b_buffer);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return vm_map_pages_zero(vma, &pages, 1);
 }
 
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 2f1dc6b4e2765..a90430b7d07ba 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -351,6 +351,8 @@ static int ht16k33_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct ht16k33_priv *priv = info->par;
 	struct page *pages = virt_to_page(priv->fbdev.buffer);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return vm_map_pages_zero(vma, &pages, 1);
 }
 
diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
index 0399db369e709..47d373f04f3f0 100644
--- a/drivers/video/fbdev/amba-clcd.c
+++ b/drivers/video/fbdev/amba-clcd.c
@@ -829,6 +829,8 @@ static int clcdfb_of_dma_setup(struct clcd_fb *fb)
 
 static int clcdfb_of_dma_mmap(struct clcd_fb *fb, struct vm_area_struct *vma)
 {
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return dma_mmap_wc(&fb->dev->dev, vma, fb->fb.screen_base,
 			   fb->fb.fix.smem_start, fb->fb.fix.smem_len);
 }
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index a9c8d33a6ef71..08109ce535cd4 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -342,6 +342,8 @@ int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 {
 	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
 
 	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 16ebbab500972..6f20efc663d7e 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1236,6 +1236,8 @@ static int au1200fb_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct au1200fb_device *fbdev = info->par;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return dma_mmap_coherent(fbdev->dev, vma,
 				 fbdev->fb_mem, fbdev->fb_phys, fbdev->fb_len);
 }
diff --git a/drivers/video/fbdev/core/fb_chrdev.c b/drivers/video/fbdev/core/fb_chrdev.c
index 32a7315b4b6dd..b73a122950a94 100644
--- a/drivers/video/fbdev/core/fb_chrdev.c
+++ b/drivers/video/fbdev/core/fb_chrdev.c
@@ -325,11 +325,6 @@ static int fb_mmap(struct file *file, struct vm_area_struct *vma)
 	if (info->fbops->fb_mmap) {
 		int res;
 
-		/*
-		 * The framebuffer needs to be accessed decrypted, be sure
-		 * SME protection is removed ahead of the call
-		 */
-		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 		res = info->fbops->fb_mmap(info, vma);
 		mutex_unlock(&info->mm_lock);
 		return res;
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 274f5d0fa2471..1b0b85e59e5e1 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -227,6 +227,8 @@ static const struct address_space_operations fb_deferred_io_aops = {
 
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	vma->vm_ops = &fb_deferred_io_vm_ops;
 	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
 	if (!(info->flags & FBINFO_VIRTFB))
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index cae00deee0014..3e378874ccc79 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -311,6 +311,8 @@ static int ep93xxfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	unsigned int offset = vma->vm_pgoff << PAGE_SHIFT;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	if (offset < info->fix.smem_len) {
 		return dma_mmap_wc(info->device, vma, info->screen_base,
 				   info->fix.smem_start, info->fix.smem_len);
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index e89e5579258ef..8463de833d1e1 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1000,6 +1000,8 @@ static int gbefb_mmap(struct fb_info *info,
 	unsigned long phys_addr, phys_size;
 	u16 *tile;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	/* check range */
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
 		return -EINVAL;
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 694cf6318782b..aa31c0d26e925 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1203,6 +1203,8 @@ static int omapfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct omapfb_device *fbdev = plane->fbdev;
 	int r;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	omapfb_rqueue_lock(fbdev);
 	r = fbdev->ctrl->mmap(info, vma);
 	omapfb_rqueue_unlock(fbdev);
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index c9fd0ad352d7f..0db9c55fce5a2 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -1095,6 +1095,8 @@ static int omapfb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 	u32 len;
 	int r;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	rg = omapfb_get_mem_region(ofbi->region);
 
 	start = omapfb_get_region_paddr(ofbi);
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index de8d78bf070a0..dbcda307f6a67 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -708,6 +708,8 @@ static int ps3fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	int r;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	r = vm_iomap_memory(vma, info->fix.smem_start, info->fix.smem_len);
 
 	dev_dbg(info->device, "ps3fb: mmap framebuffer P(%lx)->V(%lx)\n",
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index befd3fe2f6596..0d362d2bf0e38 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -562,6 +562,8 @@ static int sa1100fb_mmap(struct fb_info *info,
 		container_of(info, struct sa1100fb_info, fb);
 	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	if (off < info->fix.smem_len) {
 		vma->vm_pgoff += 1; /* skip over the palette */
 		return dma_mmap_wc(fbi->dev, vma, fbi->map_cpu, fbi->map_dma,
diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 4d524db5c4f26..634e3d159452c 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -60,6 +60,7 @@ int sbusfb_mmap_helper(struct sbus_mmap_map *map,
 
 	/* VM_IO | VM_DONTEXPAND | VM_DONTDUMP are set by remap_pfn_range() */
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 
 	/* Each page, see which map applies */
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index d84628de51893..eb2297b37504c 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1482,6 +1482,8 @@ sh_mobile_lcdc_overlay_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	if (info->fbdefio)
 		return fb_deferred_io_mmap(info, vma);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return dma_mmap_coherent(ovl->channel->lcdc->dev, vma, ovl->fb_mem,
 				 ovl->dma_handle, ovl->fb_size);
 }
@@ -1956,6 +1958,8 @@ sh_mobile_lcdc_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	if (info->fbdefio)
 		return fb_deferred_io_mmap(info, vma);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return dma_mmap_coherent(ch->lcdc->dev, vma, ch->fb_mem,
 				 ch->dma_handle, ch->fb_size);
 }
diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 90a77d19b236b..35d682b110c42 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -783,6 +783,8 @@ static int ufx_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	if (info->fbdefio)
 		return fb_deferred_io_mmap(info, vma);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
 		return -EINVAL;
 	if (size > info->fix.smem_len)
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 2460ff4ac86b4..1514ddac4cafc 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -331,6 +331,8 @@ static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	if (info->fbdefio)
 		return fb_deferred_io_mmap(info, vma);
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
 		return -EINVAL;
 	if (size > info->fix.smem_len)
diff --git a/drivers/video/fbdev/vermilion/vermilion.c b/drivers/video/fbdev/vermilion/vermilion.c
index 840ead69654b8..a087b42ca652f 100644
--- a/drivers/video/fbdev/vermilion/vermilion.c
+++ b/drivers/video/fbdev/vermilion/vermilion.c
@@ -998,6 +998,8 @@ static int vmlfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	int ret;
 	unsigned long prot;
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	ret = vmlfb_vram_offset(vinfo, offset);
 	if (ret)
 		return -EINVAL;
diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index f6140f247e4b0..f86149ba38352 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -382,6 +382,8 @@ static int vfb_pan_display(struct fb_var_screeninfo *var,
 static int vfb_mmap(struct fb_info *info,
 		    struct vm_area_struct *vma)
 {
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return remap_vmalloc_range(vma, (void *)info->fix.smem_start, vma->vm_pgoff);
 }
 
-- 
2.43.0

