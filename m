Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F47825105
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783D210E596;
	Fri,  5 Jan 2024 09:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE2210E596
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704447790; x=1735983790;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=yLRKvEWofDO1K6stvr9i2IomNOvR/08Zs5+c4O/ibFk=;
 b=ZoIf+xOCUja/+xF6xyOHlmjoliHWOoFCtn9VtwXxc1nrttUKQz7wnTKt
 ePIytw3QiiMdUiiu6YH3SeX4krUlFxmjnwEyLwJXMZbCYgwFJcgR+eRdX
 FlMVlwqictEQ8be4FDr/FQE9+XGB5BwSTMPk+Nygqcx6Vk+6E1FOoqRcK
 aHcqxXPRM9bmjK/ef7HhTRYYpvnS3m5kVxKJp6jZneecv1mUHl59JEwE7
 TP9cPzq0E0y6tYSoHkU6X2wP0VSD7jHcDDGbcv6aakpHGNxZl8TqGAPvC
 C47RzxDfIPf6dOxgV84xnwlXaljEd/QEc3pp39FHhXJQqnSYQ8LvWTI95 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="401260559"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="401260559"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="814920081"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="814920081"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:43:03 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] KVM: Introduce a new memslot flag KVM_MEM_NON_COHERENT_DMA
Date: Fri,  5 Jan 2024 17:13:46 +0800
Message-Id: <20240105091346.24637-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240105091237.24577-1-yan.y.zhao@intel.com>
References: <20240105091237.24577-1-yan.y.zhao@intel.com>
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
Cc: wanpengli@tencent.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 maz@kernel.org, joro@8bytes.org, zzyiwei@google.com, jgg@nvidia.com,
 yuzenghui@huawei.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 suzuki.poulose@arm.com, alex.williamson@redhat.com, yongwei.ma@intel.com,
 zhiyuan.lv@intel.com, jmattson@google.com, zhenyu.z.wang@intel.com,
 seanjc@google.com, ankita@nvidia.com, oliver.upton@linux.dev,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a new flag KVM_MEM_NON_COHERENT_DMA to provide user space a
channel to notify KVM that guest memory specified by the memslot may be
accessed by noncoherent DMA devices.

KVM can start honoring guest memory type for this range of guest memory in
platforms that do not always honoring guest PAT, e.g. in Intel's platform.

Previously, the only way to let KVM be aware of noncoherent DMA devices
is through KVM device for VFIO pass-through devices, in which case, KVM is
notified that all guest memory may be accessed by noncoherent DMA devices.

To avoid complication, flag KVM_MEM_NON_COHERENT_DMA is not allowed to be
dynamically modified for a memslot.

A KVM_CAP_USER_CONFIGURE_NONCOHERENT_DMA is added to let user space know if
this new memslot flag is supported in KVM.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 include/uapi/linux/kvm.h | 2 ++
 virt/kvm/kvm_main.c      | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b1f92a0edc35..4cb615e46488 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -46,6 +46,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_NON_COHERENT_DMA (1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
@@ -1155,6 +1156,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_MEMORY_ATTRIBUTES 233
 #define KVM_CAP_GUEST_MEMFD 234
 #define KVM_CAP_VM_TYPES 235
+#define KVM_CAP_USER_CONFIGURE_NONCOHERENT_DMA 236
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index acd67fb40183..6d44dcf7322d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1607,7 +1607,7 @@ static void kvm_replace_memslot(struct kvm *kvm,
  * only allows these.
  */
 #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
-	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
+	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY | KVM_MEM_NON_COHERENT_DMA)
 
 static int check_memory_region_flags(struct kvm *kvm,
 				     const struct kvm_userspace_memory_region2 *mem)
@@ -1625,6 +1625,8 @@ static int check_memory_region_flags(struct kvm *kvm,
 	valid_flags |= KVM_MEM_READONLY;
 #endif
 
+	valid_flags |= KVM_MEM_NON_COHERENT_DMA;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -2095,7 +2097,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
-		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
+		    ((mem->flags ^ old->flags) &
+		     (KVM_MEM_READONLY | KVM_MEM_NON_COHERENT_DMA)))
 			return -EINVAL;
 
 		if (base_gfn != old->base_gfn)
@@ -4822,6 +4825,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_USER_MEMORY2:
 	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
 	case KVM_CAP_JOIN_MEMORY_REGIONS_WORKS:
+	case KVM_CAP_USER_CONFIGURE_NONCOHERENT_DMA:
 	case KVM_CAP_INTERNAL_ERROR_DATA:
 #ifdef CONFIG_HAVE_KVM_MSI
 	case KVM_CAP_SIGNAL_MSI:
-- 
2.17.1

