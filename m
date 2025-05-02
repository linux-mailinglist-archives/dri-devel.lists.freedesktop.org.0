Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7BAA699D
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0623D10E8AB;
	Fri,  2 May 2025 04:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZzawpCA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108B710E8AB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 04:05:37 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2255003f4c6so18124575ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 21:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746158736; x=1746763536; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q8rtwXd/8ryLn7PMv/3BI/1btBWjP67A1M55jgL3p1I=;
 b=ZzawpCA9QOL2fnW9RMjatWBZJtZwfMLm//maHUCaPi9dxpbZFR2QhU5a+d0ygPcwcZ
 zkYbLKuSZFU4JAehVVW/iJqZGfA3pn90c4eKbhpk+0D005qPKe2DM4CG/eB0vYBFaRB1
 h4+BbyAGBiK+yMiymh2SNuMywMoFqaBvnvzPzKkyaGdxWf6nGGUf1spx+Z/sHS1nI4/D
 trFUhH8pTRwG547tWHrYFGrTvUjaWSUqCAFpR+6zCw0tvIUNIvQI2O5quvZgDI29gY3q
 y2lK2TK0RUO/jiA6TG6whVGdghy0dTt81Fz8svz7Tw9+fTFKv2fBIIZe1iRuhRvqRB8U
 2+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746158736; x=1746763536;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q8rtwXd/8ryLn7PMv/3BI/1btBWjP67A1M55jgL3p1I=;
 b=o1/BtA7zdgJw+6mbsDqjWmm1i6jqW6PzNcUljUsAqk2dRQRip6407vJVrxFuQzgt2X
 UACf6OI8qmMa9fkB/w7Z6YA4NMgtEADYbuZu3fk8QDDXczgaYGp3psxuEKeAn01g0VUk
 IFNHWwYJJeILdRaQqbKSfgO7yNeUK2K3ybtEyEttzIZVyGo8GYoXVHlLDFPoAJxajBCD
 2dvHLxBOJRkkhZ3dR841GftxKBv/DOIsr8iZcf9Mer+zeFbuVgNj9L6zPajZGmwYykmD
 IOoOyTNHFOCYvD+exoMXElZwP9q0+6hbBtwFPSE85bxwyeoy48MdUvcKuDNsMpaLrIPn
 g8Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnRkH7eqk0nmmPr4iEyGJirCILuNKpvOVx3mYjcoSaKiFkYGOYAWD46o7hJgSYURPkNBMPlmsSvq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjWPZQrtv77h7qe1NK0sNsB0oai1tfETvhsFVp7/5KSbCwiHLr
 jQvCOahWxB1/Ach9Z0DujeHI8/uzRKvNtseH2AeW36Cu15qPakMR
X-Gm-Gg: ASbGncvHcJy0of+uhkRS+9JXKH45JCcpMjexR7FgNV6lTcU3JjL5FrmKxxVw6a4giOC
 z1Jiy3rLTD30ycXWdvpp7nXWTDqw1xcyhlELeXenu7y5l63Bx/fhHQnLvVqVnYF8rXXxRbzXfFs
 /ESQ6jsHikU4cEnDg143g+aC2d44hYEk6gJqtm0G18rKqcG4WTwNJsJljvnCfCA5Min9yRhMJIj
 2TRaevljGKj4uMj9CFrhwfM8RImCViECp6xopAsPv2k0YkeyhGP9Ej5nTNwqMqnC/7w2PcXwmqw
 gG0Hs4zBUiqk/V8e+irUDL+QOQdlfMIU/iFa0G217tIIL74skJe+3RF0rbUhdDZzwwAYV6yWtEA
 YL5dFmVO48IKzWkMZaaU=
X-Google-Smtp-Source: AGHT+IEf3+uT4scOVSUlWdwMAEVx4CjYg+szZX2Ppg1uSU729mUa1LeAuSEqHWUWSIGC5cTyM8JORw==
X-Received: by 2002:a17:903:2405:b0:215:4a4e:9262 with SMTP id
 d9443c01a7336-22e102b84cbmr20583985ad.8.1746158736282; 
 Thu, 01 May 2025 21:05:36 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fb836sm4510635ad.141.2025.05.01.21.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 21:05:35 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v2 2/3] fbdev/deferred-io: Support contiguous kernel memory
 framebuffers
Date: Thu,  1 May 2025 21:05:24 -0700
Message-Id: <20250502040525.822075-3-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502040525.822075-1-mhklinux@outlook.com>
References: <20250502040525.822075-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Current defio code works only for framebuffer memory that is allocated
with vmalloc(). The code assumes that the underlying page refcount can
be used by the mm subsystem to manage each framebuffer page's lifecycle,
including freeing the page if the refcount goes to 0. This approach is
consistent with vmalloc'ed memory, but not with contiguous kernel memory
allocated via alloc_pages() or similar. The latter such memory pages
usually have a refcount of 0 when allocated, and would be incorrectly
freed page-by-page if used with defio. That free'ing corrupts the memory
free lists and Linux eventually panics. Simply bumping the refcount after
allocation doesn’t work because when the framebuffer memory is freed,
__free_pages() complains about non-zero refcounts.

Commit 37b4837959cb ("video: deferred io with physically contiguous
memory") from the year 2008 purported to add support for contiguous
kernel memory framebuffers. The motivating device, sh_mobile_lcdcfb, uses
dma_alloc_coherent() to allocate framebuffer memory, which is likely to
use alloc_pages(). It's unclear to me how this commit actually worked at
the time, unless dma_alloc_coherent() was pulling from a CMA pool instead
of alloc_pages(). Or perhaps alloc_pages() worked differently or on the
arm32 architecture on which sh_mobile_lcdcfb is used.

In any case, for x86 and arm64 today, commit 37b4837959cb9 is not
sufficient to support contiguous kernel memory framebuffers. The problem
can be seen with the hyperv_fb driver, which may allocate the framebuffer
memory using vmalloc() or alloc_pages(), depending on the configuration
of the Hyper-V guest VM (Gen 1 vs. Gen 2) and the size of the framebuffer.

Fix this limitation by adding defio support for contiguous kernel memory
framebuffers. A driver with a framebuffer allocated from contiguous
kernel memory must set the FBINFO_KMEMFB flag to indicate such.

Tested with the hyperv_fb driver in both configurations -- with a vmalloc()
framebuffer and with an alloc_pages() framebuffer on x86. Also verified a
vmalloc() framebuffer on arm64. Hardware is not available to me to verify
that the older arm32 devices still work correctly, but the path for
vmalloc() framebuffers is essentially unchanged.

Even with these changes, defio does not support framebuffers in MMIO
space, as defio code depends on framebuffer memory pages having
corresponding 'struct page's.

Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2:
* Tweaked code comments regarding framebuffers allocated with
  dma_alloc_coherent() [Christoph Hellwig]

 drivers/video/fbdev/core/fb_defio.c | 128 +++++++++++++++++++++++-----
 include/linux/fb.h                  |   1 +
 2 files changed, 109 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 4fc93f253e06..f8ae91a1c4df 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -8,11 +8,40 @@
  * for more details.
  */
 
+/*
+ * Deferred I/O ("defio") allows framebuffers that are mmap()'ed to user space
+ * to batch user space writes into periodic updates to the underlying
+ * framebuffer hardware or other implementation (such as with a virtualized
+ * framebuffer in a VM). At each batch interval, a callback is invoked in the
+ * framebuffer's kernel driver, and the callback is supplied with a list of
+ * pages that have been modified in the preceding interval. The callback can
+ * use this information to update the framebuffer hardware as necessary. The
+ * batching can improve performance and reduce the overhead of updating the
+ * hardware.
+ *
+ * Defio is supported on framebuffers allocated using vmalloc() and allocated
+ * as contiguous kernel memory using alloc_pages() or kmalloc(). These
+ * memory allocations all have corresponding "struct page"s. Framebuffers
+ * allocated using dma_alloc_coherent() should not be used with defio.
+ * Such allocations should be treated as a black box owned by the DMA
+ * layer, and should not be deconstructed into individual pages as defio
+ * does. Framebuffers in MMIO space are *not* supported because MMIO space
+ * does not have corrresponding "struct page"s.
+ *
+ * For framebuffers allocated using vmalloc(), struct fb_info must have
+ * "screen_buffer" set to the vmalloc address of the framebuffer. For
+ * framebuffers allocated from contiguous kernel memory, FBINFO_KMEMFB must
+ * be set, and "fix.smem_start" must be set to the physical address of the
+ * frame buffer. In both cases, "fix.smem_len" must be set to the framebuffer
+ * size in bytes.
+ */
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/mm.h>
+#include <linux/pfn_t.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -37,7 +66,7 @@ static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long
 	else if (info->fix.smem_start)
 		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
 
-	if (page)
+	if (page && !(info->flags & FBINFO_KMEMFB))
 		get_page(page);
 
 	return page;
@@ -137,6 +166,15 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 
 	BUG_ON(!info->fbdefio->mapping);
 
+	if (info->flags & FBINFO_KMEMFB)
+		/*
+		 * In this path, the VMA is marked VM_PFNMAP, so mm assumes
+		 * there is no struct page associated with the page. The
+		 * PFN must be directly inserted and the created PTE will be
+		 * marked "special".
+		 */
+		return vmf_insert_pfn(vmf->vma, vmf->address, page_to_pfn(page));
+
 	vmf->page = page;
 	return 0;
 }
@@ -163,13 +201,14 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
 
 /*
  * Adds a page to the dirty list. Call this from struct
- * vm_operations_struct.page_mkwrite.
+ * vm_operations_struct.page_mkwrite or .pfn_mkwrite.
  */
-static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
+static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, struct vm_fault *vmf,
 					    struct page *page)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_pageref *pageref;
+	unsigned long offset = vmf->pgoff << PAGE_SHIFT;
 	vm_fault_t ret;
 
 	/* protect against the workqueue changing the page list */
@@ -182,20 +221,34 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 	}
 
 	/*
-	 * We want the page to remain locked from ->page_mkwrite until
-	 * the PTE is marked dirty to avoid mapping_wrprotect_range()
-	 * being called before the PTE is updated, which would leave
-	 * the page ignored by defio.
-	 * Do this by locking the page here and informing the caller
-	 * about it with VM_FAULT_LOCKED.
+	 * The PTE must be marked writable before the defio deferred work runs
+	 * again and potentially marks the PTE write-protected. If the order
+	 * should be switched, the PTE would become writable without defio
+	 * tracking the page, leaving the page forever ignored by defio.
+	 *
+	 * For vmalloc() framebuffers, the associated struct page is locked
+	 * before releasing the defio lock. mm will later mark the PTE writaable
+	 * and release the struct page lock. The struct page lock prevents
+	 * the page from being prematurely being marked write-protected.
+	 *
+	 * For FBINFO_KMEMFB framebuffers, mm assumes there is no struct page,
+	 * so the PTE must be marked writable while the defio lock is held.
 	 */
-	lock_page(pageref->page);
+	if (info->flags & FBINFO_KMEMFB) {
+		unsigned long pfn = page_to_pfn(pageref->page);
+
+		ret = vmf_insert_mixed_mkwrite(vmf->vma, vmf->address,
+					       __pfn_to_pfn_t(pfn, PFN_SPECIAL));
+	} else {
+		lock_page(pageref->page);
+		ret = VM_FAULT_LOCKED;
+	}
 
 	mutex_unlock(&fbdefio->lock);
 
 	/* come back after delay to process the deferred IO */
 	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
-	return VM_FAULT_LOCKED;
+	return ret;
 
 err_mutex_unlock:
 	mutex_unlock(&fbdefio->lock);
@@ -207,10 +260,10 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
  * @fb_info: The fbdev info structure
  * @vmf: The VM fault
  *
- * This is a callback we get when userspace first tries to
- * write to the page. We schedule a workqueue. That workqueue
- * will eventually mkclean the touched pages and execute the
- * deferred framebuffer IO. Then if userspace touches a page
+ * This is a callback we get when userspace first tries to write to a
+ * page. We schedule a workqueue. That workqueue will eventually do
+ * mapping_wrprotect_range() on the written pages and execute the
+ * deferred framebuffer IO. Then if userspace writes to a page
  * again, we repeat the same scheme.
  *
  * Returns:
@@ -218,12 +271,11 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
  */
 static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
 {
-	unsigned long offset = vmf->pgoff << PAGE_SHIFT;
 	struct page *page = vmf->page;
 
 	file_update_time(vmf->vma->vm_file);
 
-	return fb_deferred_io_track_page(info, offset, page);
+	return fb_deferred_io_track_page(info, vmf, page);
 }
 
 /* vm_ops->page_mkwrite handler */
@@ -234,9 +286,25 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	return fb_deferred_io_page_mkwrite(info, vmf);
 }
 
+/*
+ * Similar to fb_deferred_io_mkwrite(), but for first writes to pages
+ * in VMAs that have VM_PFNMAP set.
+ */
+static vm_fault_t fb_deferred_io_pfn_mkwrite(struct vm_fault *vmf)
+{
+	struct fb_info *info = vmf->vma->vm_private_data;
+	unsigned long offset = vmf->pgoff << PAGE_SHIFT;
+	struct page *page = phys_to_page(info->fix.smem_start + offset);
+
+	file_update_time(vmf->vma->vm_file);
+
+	return fb_deferred_io_track_page(info, vmf, page);
+}
+
 static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.fault		= fb_deferred_io_fault,
 	.page_mkwrite	= fb_deferred_io_mkwrite,
+	.pfn_mkwrite	= fb_deferred_io_pfn_mkwrite,
 };
 
 static const struct address_space_operations fb_deferred_io_aops = {
@@ -246,11 +314,31 @@ static const struct address_space_operations fb_deferred_io_aops = {
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+	vm_flags_t flags = VM_DONTEXPAND | VM_DONTDUMP;
 
 	vma->vm_ops = &fb_deferred_io_vm_ops;
-	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
-	if (!(info->flags & FBINFO_VIRTFB))
-		vm_flags_set(vma, VM_IO);
+	if (info->flags & FBINFO_KMEMFB) {
+		/*
+		 * I/O fault path calls vmf_insert_pfn(), which bug checks
+		 * if the vma is not marked shared. mmap'ing the framebuffer
+		 * as PRIVATE doesn't really make sense anyway, though doing
+		 * so isn't harmful for vmalloc() framebuffers. So there's
+		 * no prohibition for that case.
+		 */
+		if (!(vma->vm_flags & VM_SHARED))
+			return -EINVAL;
+		/*
+		 * Set VM_PFNMAP so mm code will not try to manage the pages'
+		 * lifecycles. We don't want individual pages to be freed
+		 * based on refcount. Instead the memory must be returned to
+		 * the free pool in the usual way. Cf. the implementation of
+		 * remap_pfn_range() and remap_pfn_range_internal().
+		 */
+		flags |= VM_PFNMAP | VM_IO;
+	} else if (!(info->flags & FBINFO_VIRTFB)) {
+		flags |= VM_IO;
+	}
+	vm_flags_set(vma, flags);
 	vma->vm_private_data = info;
 	return 0;
 }
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..a1121116eef0 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -396,6 +396,7 @@ struct fb_tile_ops {
 
 /* hints */
 #define FBINFO_VIRTFB		0x0004 /* FB is System RAM, not device. */
+#define FBINFO_KMEMFB		0x0008 /* FB is allocated in contig kernel mem */
 #define FBINFO_PARTIAL_PAN_OK	0x0040 /* otw use pan only for double-buffering */
 #define FBINFO_READS_FAST	0x0080 /* soft-copy faster than rendering */
 
-- 
2.25.1

