Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A339359E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 20:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28576F49E;
	Thu, 27 May 2021 18:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3961B6F49C;
 Thu, 27 May 2021 18:52:49 +0000 (UTC)
IronPort-SDR: +Q3LHn6C+aCLY96ZMKiawzymBOQ49t2HLkSwB8wmE5CrALekv76aOeie5OwNmVSCAyKf6J/lZw
 3yBRknlFKuwA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199769094"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="199769094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 11:52:47 -0700
IronPort-SDR: Rez/6JzoNtdyWKIbrHSSAUZX33NofENtXzC+SYelkokBQeeY7G3WqzS0u3AlKjEBr49qgobzIq
 C1XQZEFvKeoQ==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="477615777"
Received: from ggrant1-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.74])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 11:52:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "i915: use io_mapping_map_user"
Date: Thu, 27 May 2021 19:51:45 +0100
Message-Id: <20210527185145.458021-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Eero Tamminen <eero.t.tamminen@intel.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b739f125e4ebd73d10ed30a856574e13649119ed.

We are unfortunately seeing more issues like we did in 293837b9ac8d
("Revert "i915: fix remap_io_sg to verify the pgprot""), except this is
now for the vm_fault_gtt path, where we are now hitting the same
BUG_ON(!pte_none(*pte)):

[10887.466150] kernel BUG at mm/memory.c:2183!
[10887.466162] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[10887.466168] CPU: 0 PID: 7775 Comm: ffmpeg Tainted: G     U            5.13.0-rc3-CI-Nightly #1
[10887.466174] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./J4205-ITX, BIOS P1.40 07/14/2017
[10887.466177] RIP: 0010:remap_pfn_range_notrack+0x30f/0x440
[10887.466188] Code: e8 96 d7 e0 ff 84 c0 0f 84 27 01 00 00 48 ba 00 f0 ff ff ff ff 0f 00 4c 89 e0 48 c1 e0 0c 4d 85 ed 75 96 48 21 d0 31 f6 eb a9 <0f> 0b 48 39 37 0f 85 0e 01 00 00 48 8b 0c 24 48 39 4f 08 0f 85 00
[10887.466193] RSP: 0018:ffffc90006e33c50 EFLAGS: 00010286
[10887.466198] RAX: 800000000000002f RBX: 00007f5e01800000 RCX: 0000000000000028
[10887.466201] RDX: 0000000000000001 RSI: ffffea0000000000 RDI: 0000000000000000
[10887.466204] RBP: ffffea000033fea8 R08: 800000000000002f R09: ffff8881072256e0
[10887.466207] R10: ffffc9000b84fff8 R11: 0000000017dab000 R12: 0000000000089f9f
[10887.466210] R13: 800000000000002f R14: 00007f5e017e4000 R15: ffff88800cffaf20
[10887.466213] FS:  00007f5e04849640(0000) GS:ffff888278000000(0000) knlGS:0000000000000000
[10887.466216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[10887.466220] CR2: 00007fd9b191a2ac CR3: 00000001829ac000 CR4: 00000000003506f0
[10887.466223] Call Trace:
[10887.466233]  vm_fault_gtt+0x1ca/0x5d0 [i915]
[10887.466381]  ? ktime_get+0x38/0x90
[10887.466389]  __do_fault+0x37/0x90
[10887.466395]  __handle_mm_fault+0xc46/0x1200
[10887.466402]  handle_mm_fault+0xce/0x2a0
[10887.466407]  do_user_addr_fault+0x1c5/0x660

Reverting this commit is reported to fix the issue.

Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3519
Fixes: b739f125e4eb ("i915: use io_mapping_map_user")
Cc: Christoph Hellwig <hch@lst.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/Kconfig             |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  9 ++---
 drivers/gpu/drm/i915/i915_drv.h          |  3 ++
 drivers/gpu/drm/i915/i915_mm.c           | 44 ++++++++++++++++++++++++
 4 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 93f4d059fc89..1e1cb245fca7 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -20,7 +20,6 @@ config DRM_I915
 	select INPUT if ACPI
 	select ACPI_VIDEO if ACPI
 	select ACPI_BUTTON if ACPI
-	select IO_MAPPING
 	select SYNC_FILE
 	select IOSF_MBI
 	select CRC32
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index f6fe5cb01438..8598a1c78a4c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -367,10 +367,11 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		goto err_unpin;
 
 	/* Finally, remap it using the new GTT offset */
-	ret = io_mapping_map_user(&ggtt->iomap, area, area->vm_start +
-			(vma->ggtt_view.partial.offset << PAGE_SHIFT),
-			(ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
-			min_t(u64, vma->size, area->vm_end - area->vm_start));
+	ret = remap_io_mapping(area,
+			       area->vm_start + (vma->ggtt_view.partial.offset << PAGE_SHIFT),
+			       (ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
+			       min_t(u64, vma->size, area->vm_end - area->vm_start),
+			       &ggtt->iomap);
 	if (ret)
 		goto err_fence;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0f6d27da69ac..e926f20c5b82 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1941,6 +1941,9 @@ int i915_reg_read_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
 /* i915_mm.c */
+int remap_io_mapping(struct vm_area_struct *vma,
+		     unsigned long addr, unsigned long pfn, unsigned long size,
+		     struct io_mapping *iomap);
 int remap_io_sg(struct vm_area_struct *vma,
 		unsigned long addr, unsigned long size,
 		struct scatterlist *sgl, resource_size_t iobase);
diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 9a777b0ff59b..666808cb3a32 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -37,6 +37,17 @@ struct remap_pfn {
 	resource_size_t iobase;
 };
 
+static int remap_pfn(pte_t *pte, unsigned long addr, void *data)
+{
+	struct remap_pfn *r = data;
+
+	/* Special PTE are not associated with any struct page */
+	set_pte_at(r->mm, addr, pte, pte_mkspecial(pfn_pte(r->pfn, r->prot)));
+	r->pfn++;
+
+	return 0;
+}
+
 #define use_dma(io) ((io) != -1)
 
 static inline unsigned long sgt_pfn(const struct remap_pfn *r)
@@ -66,7 +77,40 @@ static int remap_sg(pte_t *pte, unsigned long addr, void *data)
 	return 0;
 }
 
+/**
+ * remap_io_mapping - remap an IO mapping to userspace
+ * @vma: user vma to map to
+ * @addr: target user address to start at
+ * @pfn: physical address of kernel memory
+ * @size: size of map area
+ * @iomap: the source io_mapping
+ *
+ *  Note: this is only safe if the mm semaphore is held when called.
+ */
+int remap_io_mapping(struct vm_area_struct *vma,
+		     unsigned long addr, unsigned long pfn, unsigned long size,
+		     struct io_mapping *iomap)
+{
+	struct remap_pfn r;
+	int err;
+
 #define EXPECTED_FLAGS (VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP)
+	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
+
+	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	r.mm = vma->vm_mm;
+	r.pfn = pfn;
+	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
+			  (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
+
+	err = apply_to_page_range(r.mm, addr, size, remap_pfn, &r);
+	if (unlikely(err)) {
+		zap_vma_ptes(vma, addr, (r.pfn - pfn) << PAGE_SHIFT);
+		return err;
+	}
+
+	return 0;
+}
 
 /**
  * remap_io_sg - remap an IO mapping to userspace
-- 
2.26.3

