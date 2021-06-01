Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58767397573
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 16:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AB16EA7C;
	Tue,  1 Jun 2021 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301316EA7C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HJDgl1iY2Z3fUN3IPfhLi/UD9VZIA/neNyy393ulZWo=; b=Srqfo/9bnr/j7N2SYfCtTP9zGa
 enNfxpv7x7y9A2cEgwGiiCqgSJgUaZr//4MkdKoO9ffCC+NP8vVGdYU8UK1A+oF2AEOLyaOfY9DOe
 QQTYghj92V6d47Kaaf0o6KgS4rzaojSz+8Kq+Faf5yYLpqXnQZNn/u9I71jf6CdGi2o2Xra/dRc2L
 zOV6Jbnk0GeDKYnPhw9C7afLakax84WLSWsYOtQaGy9FzM9a5SW3Sriz16goK46YNQ8PHjiiy5Y4b
 vDfN9vHI0j/w9yokgGHxG5QA3aFHQ1Gsph4oFOm91dHj0hHiMakyylRClhsEyCPgGQ3FKW374vl8l
 q/+f51Fw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lo5Pa-00A7Ao-Uf; Tue, 01 Jun 2021 14:30:31 +0000
Date: Tue, 1 Jun 2021 15:30:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>, linux-fbdev@vger.kernel.org,
 linux-mm@kvack.org, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 William Kucharski <william.kucharski@oracle.com>,
 Ian Campbell <ijc@hellion.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaya Kumar <jayakumar.lkml@gmail.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] fb_defio: Remove custom address_space_operations
Message-ID: <YLZEhv0cpZp8uVE3@casper.infradead.org>
References: <20210310185530.1053320-1-willy@infradead.org>
 <YLPjwUUmHDRjyPpR@Ryzen-9-3900X.localdomain>
 <YLQALv2YENIDh77N@casper.infradead.org>
 <YLY/2O16fAjriZGQ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OUZuLF3ujgGn3J2J"
Content-Disposition: inline
In-Reply-To: <YLY/2O16fAjriZGQ@phenom.ffwll.local>
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


--OUZuLF3ujgGn3J2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2021 at 04:10:32PM +0200, Daniel Vetter wrote:
> On Sun, May 30, 2021 at 10:14:22PM +0100, Matthew Wilcox wrote:
> > On Sun, May 30, 2021 at 12:13:05PM -0700, Nathan Chancellor wrote:
> > > Hi Matthew,
> > > 
> > > On Wed, Mar 10, 2021 at 06:55:30PM +0000, Matthew Wilcox (Oracle) wrote:
> > > > There's no need to give the page an address_space.  Leaving the
> > > > page->mapping as NULL will cause the VM to handle set_page_dirty()
> > > > the same way that it's handled now, and that was the only reason to
> > > > set the address_space in the first place.
> > > > 
> > > > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> > > 
> > > This patch in mainline as commit ccf953d8f3d6 ("fb_defio: Remove custom
> > > address_space_operations") causes my Hyper-V based VM to no longer make
> > > it to a graphical environment.
> > 
> > Hi Nathan,
> > 
> > Thanks for the report.  I sent Daniel a revert patch with a full
> > explanation last week, which I assume he'll queue up for a pull soon.
> > You can just git revert ccf953d8f3d6 for yourself until that shows up.
> > Sorry for the inconvenience.
> 
> Uh that patch didn't get cc'ed to any list so I've ignored it. I've found
> it now, but lack of lore link is awkward. Can you pls resubmit with
> dri-devel on cc? fbdev list is dead, I don't look there.

How about I just attach it here?

--OUZuLF3ujgGn3J2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Revert-fb_defio-Remove-custom-address_space_operatio.patch"

From e88921d0775d87323a8688af37dfd7cdebdde5a9 Mon Sep 17 00:00:00 2001
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 25 May 2021 08:37:33 -0400
Subject: [PATCH] Revert "fb_defio: Remove custom address_space_operations"

Commit ccf953d8f3d6 makes framebuffers which use deferred I/O stop
displaying updates after the first one.  This is because the pages
handled by fb_defio no longer have a page_mapping().  That prevents
page_mkclean() from marking the PTEs as clean, and so writes are only
noticed the first time.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/video/fbdev/core/fb_defio.c | 35 +++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c    |  4 ++++
 include/linux/fb.h                  |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index b292887a2481..a591d291b231 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -52,6 +52,13 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 
 	get_page(page);
+
+	if (vmf->vma->vm_file)
+		page->mapping = vmf->vma->vm_file->f_mapping;
+	else
+		printk(KERN_ERR "no mapping available\n");
+
+	BUG_ON(!page->mapping);
 	page->index = vmf->pgoff;
 
 	vmf->page = page;
@@ -144,6 +151,17 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.page_mkwrite	= fb_deferred_io_mkwrite,
 };
 
+static int fb_deferred_io_set_page_dirty(struct page *page)
+{
+	if (!PageDirty(page))
+		SetPageDirty(page);
+	return 0;
+}
+
+static const struct address_space_operations fb_deferred_io_aops = {
+	.set_page_dirty = fb_deferred_io_set_page_dirty,
+};
+
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_ops = &fb_deferred_io_vm_ops;
@@ -194,12 +212,29 @@ void fb_deferred_io_init(struct fb_info *info)
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
+void fb_deferred_io_open(struct fb_info *info,
+			 struct inode *inode,
+			 struct file *file)
+{
+	file->f_mapping->a_ops = &fb_deferred_io_aops;
+}
+EXPORT_SYMBOL_GPL(fb_deferred_io_open);
+
 void fb_deferred_io_cleanup(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
+	struct page *page;
+	int i;
 
 	BUG_ON(!fbdefio);
 	cancel_delayed_work_sync(&info->deferred_work);
+
+	/* clear out the mapping that we setup */
+	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
+		page = fb_deferred_io_page(info, i);
+		page->mapping = NULL;
+	}
+
 	mutex_destroy(&fbdefio->lock);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 072780b0e570..98f193078c05 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1415,6 +1415,10 @@ __releases(&info->lock)
 		if (res)
 			module_put(info->fbops->owner);
 	}
+#ifdef CONFIG_FB_DEFERRED_IO
+	if (info->fbdefio)
+		fb_deferred_io_open(info, inode, file);
+#endif
 out:
 	unlock_fb_info(info);
 	if (res)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index a8dccd23c249..ecfbcc0553a5 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -659,6 +659,9 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 /* drivers/video/fb_defio.c */
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
 extern void fb_deferred_io_init(struct fb_info *info);
+extern void fb_deferred_io_open(struct fb_info *info,
+				struct inode *inode,
+				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
-- 
2.30.2


--OUZuLF3ujgGn3J2J--
