Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39868A050A8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEEC10E7DA;
	Wed,  8 Jan 2025 02:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdlAPim6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95B410E7DA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303338; x=1767839338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MmiaYqOSRFerEB2by5lm7b3Hd56RnhjXOTZ4ghG6PaQ=;
 b=SdlAPim6OXOreqCoAiQTDYzvWy9EL47bN9//0SfxDVZGkHXBz794Ul5d
 X9yS3S+ikGhNZ9oYso8nfYJyIwM/9sYko2YkjEVKFkD311BfSfaQOUbmC
 zNG9V0OWQ1gi/BlfGpP0tSnPWOkMXsQAAGfaVHp0fhYeqNuBhs9PlwZLp
 JCfSi+k28Jp9pv91o2i8pCrE5fYl8KsbQLqOMx2fx3T6rxTnGtNNjK3Ad
 +vEBXvjajJKkVgv6I/owEVzBR4IyqCR69N+sbA3slnUyFypUyN1JBRiQC
 tzA5YdqCstAYZ2ysj/SUgVdKQu67iI6EfdOrp7HUCTCIXSiGEqYKla9s8 Q==;
X-CSE-ConnectionGUID: nLGBibvgSLiai3Lnbr+BoA==
X-CSE-MsgGUID: 1ukrsub/QZSvPTY1tX6+hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010518"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:28:58 -0800
X-CSE-ConnectionGUID: irjzBI/xRXqn/310sPapow==
X-CSE-MsgGUID: KHJR6cqgS+KEj/qLC2/O2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793681"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:52 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com
Cc: yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: [RFC PATCH 06/12] KVM: Support vfio_dmabuf backed MMIO region
Date: Tue,  7 Jan 2025 22:27:13 +0800
Message-Id: <20250107142719.179636-7-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend KVM_SET_USER_MEMORY_REGION2 to support mapping vfio_dmabuf
backed MMIO region into a guest.

The main purpose of this change is for KVM to map MMIO resources
without firstly mapping into the host, similar to what is done in
guest_memfd. The immediate use case is for CoCo VMs to support private
MMIO.

Similar to private guest memory, private MMIO is also not intended to be
accessed by host. The host access to private MMIO would be rejected by
private devices (known as TDI in TDISP spec) and cause the TDI exit the
secure state. The further impact to the system may vary according to
device implementation. The TDISP spec doesn't mandate any error
reporting or logging, the TLP may be handled as an Unsupported Request,
or just be dropped. In my test environment, an AER NonFatalErr is
reported and no further impact. So from HW perspective, disallowing
host access to private MMIO is not that critical but nice to have.

But stick to find pfn via userspace mapping while allowing the pfn been
privately mapped conflicts with the private mapping concept. And it
virtually allows userspace to map any address as private. Before
fault in, KVM cannot distinguish if a userspace addr is for private
MMIO and safe to host access.

Rely on userspace mapping also means private MMIO mapping should follow
userspace mapping change via mmu_notifier. This conflicts with the
current design that mmu_notifier never impacts private mapping. It also
makes no sense to support mmu_notifier just for private MMIO, private
MMIO mapping should be fixed when CoCo-VM accepts the private MMIO, any
following mapping change without guest permission should be invalid.

So the choice here is to eliminate userspace mapping and switch to use
the FD based MMIO resources.

There is still need to switch the memory attribute (shared <-> private)
for private MMIO, when guest switches the device attribute between
shared & private. Unlike memory, MMIO region has only one physical
backend so it is a bit like in-place conversion, which for private
memory, requires much effort on how to invalidate user mapping when
converting to private. But for MMIO, it is expected that VMM never
needs to access assigned MMIO for feature emulation, so always disallow
userspace MMIO mapping and use FD based MMIO resources for 'private
capable' MMIO region.

The dma-buf is chosen as the FD based backend, it meets the need for KVM
to aquire the non-struct page memory that can still have lifetime
controlled by VFIO. It provides the option to disallow userspace mmap as
long as the exporter doesn't provide dma_buf_ops.mmap() callback. The
concern is it now just supports mapping into device's default_domain via
DMA APIs. Some clue I can found to extend dma-buf APIs for subsystems
like IOMMUFD [1] or KVM. The adding of dma_buf_get_pfn_unlocked() in this
series is for this purpose.

An alternative is VFIO provides a dedicated FD for KVM. But considering
IOMMUFD may use dma-buf for MMIO mapping [2], it is better to have a
unified export mechanism for the same purpose in VFIO.

Open: Currently store the dmabuf fd parameter in
kvm_userspace_memory_region2::guest_memfd. It may be confusing but avoids
introducing another API format for IOCTL(KVM_SET_USER_MEMORY_REGION3).

[1] https://lore.kernel.org/all/YwywgciH6BiWz4H1@nvidia.com/
[2] https://lore.kernel.org/kvm/14-v4-0de2f6c78ed0+9d1-iommufd_jgg@nvidia.com/

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 Documentation/virt/kvm/api.rst |   7 ++
 include/linux/kvm_host.h       |  18 +++++
 include/uapi/linux/kvm.h       |   1 +
 virt/kvm/Kconfig               |   6 ++
 virt/kvm/Makefile.kvm          |   1 +
 virt/kvm/kvm_main.c            |  32 +++++++--
 virt/kvm/kvm_mm.h              |  19 +++++
 virt/kvm/vfio_dmabuf.c         | 125 +++++++++++++++++++++++++++++++++
 8 files changed, 205 insertions(+), 4 deletions(-)
 create mode 100644 virt/kvm/vfio_dmabuf.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 7911da34b9fd..f6199764a768 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6304,6 +6304,13 @@ state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
+Userspace can set KVM_MEM_VFIO_DMABUF in flags to indicate the memory region is
+backed by a userspace unmappable dma_buf exported by VFIO. The backend resource
+is one piece of MMIO region of the device. The slot is unmappable so it is
+allowed to be converted to private. KVM binds the memory region to a given
+dma_buf fd range of [0, memory_size]. For now, the dma_buf fd is filled in
+'guest_memfd' field, and the guest_memfd_offset must be 0;
+
 S390:
 ^^^^^
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0a141685872d..871d927485a5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -606,6 +606,10 @@ struct kvm_memory_slot {
 		pgoff_t pgoff;
 	} gmem;
 #endif
+
+#ifdef CONFIG_KVM_VFIO_DMABUF
+	struct dma_buf_attachment *dmabuf_attach;
+#endif
 };
 
 static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
@@ -2568,4 +2572,18 @@ static inline int kvm_enable_virtualization(void) { return 0; }
 static inline void kvm_disable_virtualization(void) { }
 #endif
 
+#ifdef CONFIG_KVM_VFIO_DMABUF
+int kvm_vfio_dmabuf_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+#else
+static inline int kvm_vfio_dmabuf_get_pfn(struct kvm *kvm,
+					  struct kvm_memory_slot *slot,
+					  gfn_t gfn, kvm_pfn_t *pfn,
+					  int *max_order);
+{
+	KVM_BUG_ON(1, kvm);
+	return -EIO;
+}
+#endif
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 1dae36cbfd52..4f5b5def182a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -51,6 +51,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_VFIO_DMABUF	(1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..68fff3fb1841 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -115,6 +115,7 @@ config KVM_PRIVATE_MEM
 config KVM_GENERIC_PRIVATE_MEM
        select KVM_GENERIC_MEMORY_ATTRIBUTES
        select KVM_PRIVATE_MEM
+       select KVM_VFIO_DMABUF
        bool
 
 config HAVE_KVM_ARCH_GMEM_PREPARE
@@ -124,3 +125,8 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config KVM_VFIO_DMABUF
+       bool
+       select DMA_SHARED_BUFFER
+       select DMABUF_MOVE_NOTIFY
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..c08e98f13f65 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -13,3 +13,4 @@ kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
 kvm-$(CONFIG_KVM_PRIVATE_MEM) += $(KVM)/guest_memfd.o
+kvm-$(CONFIG_KVM_VFIO_DMABUF) += $(KVM)/vfio_dmabuf.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4a13de82479d..c9342d88f06c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -938,6 +938,8 @@ static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 {
 	if (slot->flags & KVM_MEM_GUEST_MEMFD)
 		kvm_gmem_unbind(slot);
+	else if (slot->flags & KVM_MEM_VFIO_DMABUF)
+		kvm_vfio_dmabuf_unbind(slot);
 
 	kvm_destroy_dirty_bitmap(slot);
 
@@ -1526,13 +1528,19 @@ static void kvm_replace_memslot(struct kvm *kvm,
 static int check_memory_region_flags(struct kvm *kvm,
 				     const struct kvm_userspace_memory_region2 *mem)
 {
+	u32 private_mask = KVM_MEM_GUEST_MEMFD | KVM_MEM_VFIO_DMABUF;
+	u32 private_flag = mem->flags & private_mask;
 	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
 
+	/* private flags are mutually exclusive. */
+	if (private_flag & (private_flag - 1))
+		return -EINVAL;
+
 	if (kvm_arch_has_private_mem(kvm))
-		valid_flags |= KVM_MEM_GUEST_MEMFD;
+		valid_flags |= private_flag;
 
 	/* Dirty logging private memory is not currently supported. */
-	if (mem->flags & KVM_MEM_GUEST_MEMFD)
+	if (private_flag)
 		valid_flags &= ~KVM_MEM_LOG_DIRTY_PAGES;
 
 	/*
@@ -1540,8 +1548,7 @@ static int check_memory_region_flags(struct kvm *kvm,
 	 * read-only memslots have emulated MMIO, not page fault, semantics,
 	 * and KVM doesn't allow emulated MMIO for private memory.
 	 */
-	if (kvm_arch_has_readonly_mem(kvm) &&
-	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
+	if (kvm_arch_has_readonly_mem(kvm) && !private_flag)
 		valid_flags |= KVM_MEM_READONLY;
 
 	if (mem->flags & ~valid_flags)
@@ -2044,6 +2051,21 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
+	} else if (mem->flags & KVM_MEM_VFIO_DMABUF) {
+		if (mem->guest_memfd_offset) {
+			r = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Open: May be confusing that store the dmabuf fd parameter in
+		 * kvm_userspace_memory_region2::guest_memfd. But this avoids
+		 * introducing another format for
+		 * IOCTL(KVM_SET_USER_MEMORY_REGIONX).
+		 */
+		r = kvm_vfio_dmabuf_bind(kvm, new, mem->guest_memfd);
+		if (r)
+			goto out;
 	}
 
 	r = kvm_set_memslot(kvm, old, new, change);
@@ -2055,6 +2077,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 out_unbind:
 	if (mem->flags & KVM_MEM_GUEST_MEMFD)
 		kvm_gmem_unbind(new);
+	else if (mem->flags & KVM_MEM_VFIO_DMABUF)
+		kvm_vfio_dmabuf_unbind(new);
 out:
 	kfree(new);
 	return r;
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index acef3f5c582a..faefc252c337 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -93,4 +93,23 @@ static inline void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 #endif /* CONFIG_KVM_PRIVATE_MEM */
 
+#ifdef CONFIG_KVM_VFIO_DMABUF
+int kvm_vfio_dmabuf_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
+			 unsigned int fd);
+void kvm_vfio_dmabuf_unbind(struct kvm_memory_slot *slot);
+#else
+static inline int kvm_vfio_dmabuf_bind(struct kvm *kvm,
+				       struct kvm_memory_slot *slot,
+				       unsigned int fd);
+{
+	WARN_ON_ONCE(1);
+	return -EIO;
+}
+
+static inline void kvm_vfio_dmabuf_unbind(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(1);
+}
+#endif /* CONFIG_KVM_VFIO_DMABUF */
+
 #endif /* __KVM_MM_H__ */
diff --git a/virt/kvm/vfio_dmabuf.c b/virt/kvm/vfio_dmabuf.c
new file mode 100644
index 000000000000..c427ab39c68a
--- /dev/null
+++ b/virt/kvm/vfio_dmabuf.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/dma-buf.h>
+#include <linux/kvm_host.h>
+#include <linux/vfio.h>
+
+#include "kvm_mm.h"
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+struct kvm_vfio_dmabuf {
+	struct kvm *kvm;
+	struct kvm_memory_slot *slot;
+};
+
+static void kv_dmabuf_move_notify(struct dma_buf_attachment *attach)
+{
+	struct kvm_vfio_dmabuf *kv_dmabuf = attach->importer_priv;
+	struct kvm_memory_slot *slot = kv_dmabuf->slot;
+	struct kvm *kvm = kv_dmabuf->kvm;
+	bool flush = false;
+
+	struct kvm_gfn_range gfn_range = {
+		.start = slot->base_gfn,
+		.end = slot->base_gfn + slot->npages,
+		.slot = slot,
+		.may_block = true,
+		.attr_filter = KVM_FILTER_PRIVATE | KVM_FILTER_SHARED,
+	};
+
+	KVM_MMU_LOCK(kvm);
+	kvm_mmu_invalidate_begin(kvm);
+	flush |= kvm_mmu_unmap_gfn_range(kvm, &gfn_range);
+	if (flush)
+		kvm_flush_remote_tlbs(kvm);
+
+	kvm_mmu_invalidate_end(kvm);
+	KVM_MMU_UNLOCK(kvm);
+}
+
+static const struct dma_buf_attach_ops kv_dmabuf_attach_ops = {
+	.allow_peer2peer = true,
+	.move_notify = kv_dmabuf_move_notify,
+};
+
+int kvm_vfio_dmabuf_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
+			 unsigned int fd)
+{
+	size_t size = slot->npages << PAGE_SHIFT;
+	struct dma_buf_attachment *attach;
+	struct kvm_vfio_dmabuf *kv_dmabuf;
+	struct dma_buf *dmabuf;
+	int ret;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	if (size != dmabuf->size) {
+		ret = -EINVAL;
+		goto err_dmabuf;
+	}
+
+	kv_dmabuf = kzalloc(sizeof(*kv_dmabuf), GFP_KERNEL);
+	if (!kv_dmabuf) {
+		ret = -ENOMEM;
+		goto err_dmabuf;
+	}
+
+	kv_dmabuf->kvm = kvm;
+	kv_dmabuf->slot = slot;
+	attach = dma_buf_dynamic_attach(dmabuf, NULL, &kv_dmabuf_attach_ops,
+					kv_dmabuf);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto err_kv_dmabuf;
+	}
+
+	slot->dmabuf_attach = attach;
+
+	return 0;
+
+err_kv_dmabuf:
+	kfree(kv_dmabuf);
+err_dmabuf:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
+void kvm_vfio_dmabuf_unbind(struct kvm_memory_slot *slot)
+{
+	struct dma_buf_attachment *attach = slot->dmabuf_attach;
+	struct kvm_vfio_dmabuf *kv_dmabuf;
+	struct dma_buf *dmabuf;
+
+	if (WARN_ON_ONCE(!attach))
+		return;
+
+	kv_dmabuf = attach->importer_priv;
+	dmabuf = attach->dmabuf;
+	dma_buf_detach(dmabuf, attach);
+	kfree(kv_dmabuf);
+	dma_buf_put(dmabuf);
+}
+
+/*
+ * The return value matters. If return -EFAULT, userspace will try to do
+ * page attribute (shared <-> private) conversion.
+ */
+int kvm_vfio_dmabuf_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
+			    gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+{
+	struct dma_buf_attachment *attach = slot->dmabuf_attach;
+	pgoff_t pgoff = gfn - slot->base_gfn;
+	int ret;
+
+	if (WARN_ON_ONCE(!attach))
+		return -EFAULT;
+
+	ret = dma_buf_get_pfn_unlocked(attach, pgoff, pfn, max_order);
+	if (ret)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vfio_dmabuf_get_pfn);
-- 
2.25.1

