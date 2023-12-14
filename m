Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE7812E0C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 12:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D194510E092;
	Thu, 14 Dec 2023 11:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFBE10E092
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702551883; x=1734087883;
 h=from:to:cc:subject:date:message-id;
 bh=PPJ0qo+v4gU51NZ6QR1Rk2xhM3fO+C3owLqS4ypDdH8=;
 b=P7DrjrDlccdgzyGxKAYA6wtrd7xo1xXYGpsL2ZgeWrA23jwC5KFa2Zi4
 +AXaZSXzbtC4QQW7h9ZSP0DkjmweU9vhDacREMtB54Re9Kgv0uFXYCOHS
 S9Rez4M5HH8fYiNYjsjjF7qgRk2yfbrqy3FbPe+2C7HsKPb1jaJAnlWvl
 yuZFMki2/s3wxxIQlIs3RnHp022jec6b8OTO2tfB2R9SwEq+nnI4T8v1Z
 tOPCCcVOq5AirnrK9a5ajO0LOSO2qlWu2Byew1weV0HI88pto3FA9v6Ip
 TxGZqoKHvX2QiA0SIL3jIDSIooTTHJi76wrODzggkVrHcMs4Vh8cCZRgz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8500545"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="8500545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="22358938"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 03:04:37 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] KVM: Introduce KVM VIRTIO device
Date: Thu, 14 Dec 2023 18:35:20 +0800
Message-Id: <20231214103520.7198-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: kevin.tian@intel.com, wanpengli@tencent.com, zhenyu.z.wang@intel.com,
 seanjc@google.com, joro@8bytes.org, gurchetansingh@chromium.org,
 Yan Zhao <yan.y.zhao@intel.com>, kraxel@redhat.com, yongwei.ma@intel.com,
 zhiyuan.lv@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
 jmattson@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a new KVM device that represents a virtio device in order to
allow user to indicate device hardware's noncoherent DMA status.

Motivation
===
A virtio GPU device may want to configure GPU hardware to work in
noncoherent mode, i.e. some of its DMAs do not snoop CPU caches.
This is generally for performance consideration.
In certain platform, GFX performance can improve 20+% with DMAs going to
noncoherent path.

This noncoherent DMA mode works in below sequence:
1. Host backend driver programs hardware not to snoop memory of target
   DMA buffer.
2. Host backend driver indicates guest frontend driver to program guest PAT
   to WC for target DMA buffer.
3. Guest frontend driver writes to the DMA buffer without clflush stuffs.
4. Hardware does noncoherent DMA to the target buffer.

In this noncoherent DMA mode, both guest and hardware regard a DMA buffer
as not cached. So, if KVM forces the effective memory type of this DMA
buffer to be WB, hardware DMA may read incorrect data and cause misc
failures.

Therefore, we introduce a new KVM virtio device to let KVM be aware that
the virtio device hardware is working in noncoherent mode.
Then, KVM will honor guest PAT type in Intel's platform.

For a virtio device model (e.g. QEMU), if it knows device hardware is to be
configured to work in

a. noncoherent mode,
   - on device realization,
     it can create a KVM virtio device and set device attr to increase KVM
     noncoherent DMA count;
   - on device unrealization,
     destroy the KVM virtio device to decrease KVM noncoherent DMA count.

b. coherent mode,
   just do nothing.

Security
===
The biggest concern for KVM to honor guest's memory type in Intel platform
is page aliasing issue.
- For host MMIO, it's not a concern as KVM VMX programs EPT memory type to
  UC (which will overwrite all guest PAT type except WC) no matter guest
  memory type is honored or not.

- For host non-MMIO pages,
  * virtio guest frontend and host backend driver should be synced to use
    the same memory type to map a buffer. Otherwise, there will be
    potential problem for incorrect memory data. But this will only impact
    the buggy guest alone.
  * for live migration,
    as QEMU will read all guest memory during live migration, page aliasing
    could happen.
    Current thinking is to disable live migration if a virtio device has
    indicated its noncoherent state.
    As a follow-up, we can discuss other solutions. e.g.
    (a) switching back to coherent path before starting live migration.
    (b) read/write of guest memory with clflush during live migration.

Implementation Consideration
===
There is a previous series [1] from google to serve the same purpose to
let KVM be aware of virtio GPU's noncoherent DMA status. That series
requires a new memslot flag, and special memslots in user space.

We don't choose to use memslot flag to request honoring guest memory type.
Instead we hope to make the honoring request to be explicit (not tied to a
memslot flag). This is because once guest memory type is honored, not only
memory used by guest virtio device, but all guest memory is facing page
aliasing issue potentially. KVM needs a generic solution to take care of
page aliasing issue rather than counting on memory type of a special
memslot being aligned in host and guest.
(we can discuss what a generic solution to handle page aliasing issue will
look like in later follow-up series).

On the other hand, we choose to introduce a KVM virtio device rather than
just provide an ioctl to wrap kvm_arch_[un]register_noncoherent_dma()
directly, which is based on considerations that
1. Explicitly limit the "register noncoherent DMA" ability to virtio
   devices.
2. Provide a better encapsulation.
   Repeated setting noncoherent attribute to a KVM virtio device will only
   increase KVM noncoherent DMA count for once.
   KVM noncohrent DMA count will be decreased automatically when KVM virtio
   device is closed.
3. The KVM virtio device can be extended to let KVM know more info about
   the device to introduce non-coherent DMA.

Example QEMU usage
===
- on virtio device realize:
   struct kvm_create_device cd = {
       .type = KVM_DEV_TYPE_VIRTIO,
   };
   kvm_vm_ioctl(kvm_state, KVM_CREATE_DEVICE, &cd);

   struct kvm_device_attr attr = {
       .group = KVM_DEV_VIRTIO_NONCOHERENT,
       .attr = KVM_DEV_VIRTIO_NONCOHERENT_SET,
   };

   ioctl(cd.fd, KVM_SET_DEVICE_ATTR, &attr);

   g->kvm_device_fd = cd.fd;

- on virtio device unrealize
  close(g->kvm_device_fd);

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: https://patchwork.kernel.org/project/dri-devel/cover/20200213213036.207625-1-olvaffe@gmail.com/ [1]
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 arch/x86/kvm/Kconfig     |   1 +
 include/uapi/linux/kvm.h |   5 ++
 virt/kvm/Kconfig         |   3 +
 virt/kvm/Makefile.kvm    |   1 +
 virt/kvm/kvm_main.c      |   8 +++
 virt/kvm/virtio.c        | 121 +++++++++++++++++++++++++++++++++++++++
 virt/kvm/virtio.h        |  18 ++++++
 7 files changed, 157 insertions(+)
 create mode 100644 virt/kvm/virtio.c
 create mode 100644 virt/kvm/virtio.h

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index b07247b0b958..9f7223d298a2 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -44,6 +44,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_VFIO
+	select KVM_VIRTIO
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b1f92a0edc35..7f57fa902a0a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1394,6 +1394,9 @@ struct kvm_device_attr {
 #define   KVM_DEV_VFIO_GROUP_DEL	KVM_DEV_VFIO_FILE_DEL
 #define   KVM_DEV_VFIO_GROUP_SET_SPAPR_TCE		3
 
+#define KVM_DEV_VIRTIO_NONCOHERENT	1
+#define KVM_DEV_VIRTIO_NONCOHERENT_SET	1
+
 enum kvm_device_type {
 	KVM_DEV_TYPE_FSL_MPIC_20	= 1,
 #define KVM_DEV_TYPE_FSL_MPIC_20	KVM_DEV_TYPE_FSL_MPIC_20
@@ -1417,6 +1420,8 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_ARM_PV_TIME	KVM_DEV_TYPE_ARM_PV_TIME
 	KVM_DEV_TYPE_RISCV_AIA,
 #define KVM_DEV_TYPE_RISCV_AIA		KVM_DEV_TYPE_RISCV_AIA
+	KVM_DEV_TYPE_VIRTIO,
+#define KVM_DEV_TYPE_VIRTIO		KVM_DEV_TYPE_VIRTIO
 	KVM_DEV_TYPE_MAX,
 };
 
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 6793211a0b64..5dcba034593c 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -56,6 +56,9 @@ config HAVE_KVM_CPU_RELAX_INTERCEPT
 config KVM_VFIO
        bool
 
+config KVM_VIRTIO
+       bool
+
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..614c4c4fe50e 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -7,6 +7,7 @@ KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
 kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
+kvm-$(CONFIG_KVM_VIRTIO) += $(KVM)/virtio.o
 kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index acd67fb40183..dca2040368da 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -61,6 +61,7 @@
 #include "async_pf.h"
 #include "kvm_mm.h"
 #include "vfio.h"
+#include "virtio.h"
 
 #include <trace/events/ipi.h>
 
@@ -6453,6 +6454,10 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	if (WARN_ON_ONCE(r))
 		goto err_vfio;
 
+	r = kvm_virtio_ops_init();
+	if (WARN_ON_ONCE(r))
+		goto err_virtio;
+
 	kvm_gmem_init(module);
 
 	/*
@@ -6468,6 +6473,8 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	return 0;
 
 err_register:
+	kvm_virtio_ops_exit();
+err_virtio:
 	kvm_vfio_ops_exit();
 err_vfio:
 	kvm_async_pf_deinit();
@@ -6503,6 +6510,7 @@ void kvm_exit(void)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
 	kvm_vfio_ops_exit();
+	kvm_virtio_ops_exit();
 	kvm_async_pf_deinit();
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 	unregister_syscore_ops(&kvm_syscore_ops);
diff --git a/virt/kvm/virtio.c b/virt/kvm/virtio.c
new file mode 100644
index 000000000000..dbb25d9784c5
--- /dev/null
+++ b/virt/kvm/virtio.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KVM-VIRTIO device
+ *
+ */
+#include <linux/kvm_host.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include "virtio.h"
+
+struct kvm_virtio {
+	struct mutex lock;
+	bool noncoherent;
+};
+
+static int kvm_virtio_set_noncoherent(struct kvm_device *dev, long attr,
+				      void __user *arg)
+{
+	struct kvm_virtio *kv = dev->private;
+
+	/*
+	 * Currently, only set to noncoherent is allowed, and therefore a virtio
+	 * device is not allowed to switch back to coherent once it's set to
+	 * noncoherent.
+	 * User arg is also not checked as the attr name has indicated that the
+	 * purpose is to set to noncoherent.
+	 */
+	if (attr != KVM_DEV_VIRTIO_NONCOHERENT_SET)
+		return -ENXIO;
+
+	mutex_lock(&kv->lock);
+	if (kv->noncoherent)
+		goto out;
+
+	kv->noncoherent = true;
+	kvm_arch_register_noncoherent_dma(dev->kvm);
+out:
+	mutex_unlock(&kv->lock);
+	return 0;
+}
+
+static int kvm_virtio_set_attr(struct kvm_device *dev,
+			       struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_VIRTIO_NONCOHERENT:
+		return kvm_virtio_set_noncoherent(dev, attr->attr,
+						  u64_to_user_ptr(attr->addr));
+	}
+
+	return -ENXIO;
+}
+
+static int kvm_virtio_has_attr(struct kvm_device *dev,
+			     struct kvm_device_attr *attr)
+{
+	switch (attr->group) {
+	case KVM_DEV_VIRTIO_NONCOHERENT:
+		switch (attr->attr) {
+		case KVM_DEV_VIRTIO_NONCOHERENT_SET:
+			return 0;
+		}
+
+		break;
+	}
+
+	return -ENXIO;
+}
+
+static void kvm_virtio_release(struct kvm_device *dev)
+{
+	struct kvm_virtio *kv = dev->private;
+
+	if (kv->noncoherent)
+		kvm_arch_unregister_noncoherent_dma(dev->kvm);
+	kfree(kv);
+	kfree(dev); /* alloc by kvm_ioctl_create_device, free by .release */
+}
+
+static int kvm_virtio_create(struct kvm_device *dev, u32 type);
+
+static struct kvm_device_ops kvm_virtio_ops = {
+	.name = "kvm-virtio",
+	.create = kvm_virtio_create,
+	.release = kvm_virtio_release,
+	.set_attr = kvm_virtio_set_attr,
+	.has_attr = kvm_virtio_has_attr,
+};
+
+static int kvm_virtio_create(struct kvm_device *dev, u32 type)
+{
+	struct kvm_virtio *kv;
+
+	if (type != KVM_DEV_TYPE_VIRTIO)
+		return -ENODEV;
+
+	/*
+	 * This kvm_virtio device is created per virtio device.
+	 * Its default noncoherent state is false.
+	 */
+	kv = kzalloc(sizeof(*kv), GFP_KERNEL_ACCOUNT);
+	if (!kv)
+		return -ENOMEM;
+
+	mutex_init(&kv->lock);
+
+	dev->private = kv;
+
+	return 0;
+}
+
+int kvm_virtio_ops_init(void)
+{
+	return kvm_register_device_ops(&kvm_virtio_ops, KVM_DEV_TYPE_VIRTIO);
+}
+
+void kvm_virtio_ops_exit(void)
+{
+	kvm_unregister_device_ops(KVM_DEV_TYPE_VIRTIO);
+}
diff --git a/virt/kvm/virtio.h b/virt/kvm/virtio.h
new file mode 100644
index 000000000000..0353398ee1f2
--- /dev/null
+++ b/virt/kvm/virtio.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_VIRTIO_H
+#define __KVM_VIRTIO_H
+
+#ifdef CONFIG_KVM_VIRTIO
+int kvm_virtio_ops_init(void);
+void kvm_virtio_ops_exit(void);
+#else
+static inline int kvm_virtio_ops_init(void)
+{
+	return 0;
+}
+static inline void kvm_virtio_ops_exit(void)
+{
+}
+#endif
+
+#endif

base-commit: 8ed26ab8d59111c2f7b86d200d1eb97d2a458fd1
-- 
2.17.1

