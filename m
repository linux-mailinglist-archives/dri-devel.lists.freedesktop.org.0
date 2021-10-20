Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBED434F3F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405D6E30C;
	Wed, 20 Oct 2021 15:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2D26E30C;
 Wed, 20 Oct 2021 15:46:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289658761"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="289658761"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:40:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="718997241"
Received: from bsieu-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.14.221])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 08:40:06 -0700
Date: Wed, 20 Oct 2021 08:40:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 matthew.auld@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/4] mm: add a io_mapping_map_user helper
Message-ID: <20211020154005.uk6u4ovcmlhpyubk@ldmartin-desk2>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210326055505.1424432-3-hch@lst.de>
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

On Fri, Mar 26, 2021 at 06:55:03AM +0100, Christoph Hellwig wrote:
>Add a helper that calls remap_pfn_range for an struct io_mapping, relying
>on the pgprot pre-validation done when creating the mapping instead of
>doing it at runtime.
>
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>---
> include/linux/io-mapping.h |  3 +++
> mm/Kconfig                 |  3 +++
> mm/Makefile                |  1 +
> mm/io-mapping.c            | 29 +++++++++++++++++++++++++++++
> 4 files changed, 36 insertions(+)
> create mode 100644 mm/io-mapping.c
>
>diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
>index c093e81310a9b3..e9743cfd858527 100644
>--- a/include/linux/io-mapping.h
>+++ b/include/linux/io-mapping.h
>@@ -220,3 +220,6 @@ io_mapping_free(struct io_mapping *iomap)
> }
>
> #endif /* _LINUX_IO_MAPPING_H */
>+
>+int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>+		unsigned long addr, unsigned long pfn, unsigned long size);

I'm not sure what exactly brought me to check this, but while debugging
I noticed this outside the header guard. But then after some more checks I
saw nothing actually selects CONFIG_IO_MAPPING because commit using
it was reverted in commit 0e4fe0c9f2f9 ("Revert "i915: use io_mapping_map_user"")

Is this something we want to re-attempt moving to mm/ ?

thanks
Lucas De Marchi

>diff --git a/mm/Kconfig b/mm/Kconfig
>index 24c045b24b9506..6b0f2cfbfac0f3 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -872,4 +872,7 @@ config MAPPING_DIRTY_HELPERS
> config KMAP_LOCAL
> 	bool
>
>+# struct io_mapping based helper.  Selected by drivers that need them
>+config IO_MAPPING
>+	bool
> endmenu
>diff --git a/mm/Makefile b/mm/Makefile
>index 72227b24a61688..c0135e385984bb 100644
>--- a/mm/Makefile
>+++ b/mm/Makefile
>@@ -120,3 +120,4 @@ obj-$(CONFIG_MEMFD_CREATE) += memfd.o
> obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
> obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
> obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
>+obj-$(CONFIG_IO_MAPPING) += io-mapping.o
>diff --git a/mm/io-mapping.c b/mm/io-mapping.c
>new file mode 100644
>index 00000000000000..01b3627999304e
>--- /dev/null
>+++ b/mm/io-mapping.c
>@@ -0,0 +1,29 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+
>+#include <linux/mm.h>
>+#include <linux/io-mapping.h>
>+
>+/**
>+ * io_mapping_map_user - remap an I/O mapping to userspace
>+ * @iomap: the source io_mapping
>+ * @vma: user vma to map to
>+ * @addr: target user address to start at
>+ * @pfn: physical address of kernel memory
>+ * @size: size of map area
>+ *
>+ *  Note: this is only safe if the mm semaphore is held when called.
>+ */
>+int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>+		unsigned long addr, unsigned long pfn, unsigned long size)
>+{
>+	vm_flags_t expected_flags = VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>+
>+	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>+		return -EINVAL;
>+
>+	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
>+	return remap_pfn_range_notrack(vma, addr, pfn, size,
>+		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
>+			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
>+}
>+EXPORT_SYMBOL_GPL(io_mapping_map_user);
>-- 
>2.30.1
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
