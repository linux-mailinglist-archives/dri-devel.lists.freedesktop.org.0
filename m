Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3DAC77CF
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D63710E6E6;
	Thu, 29 May 2025 05:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STDobxnL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87F10E6E6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497356; x=1780033356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9hqoSu/HsjsyfABS0VPyixE2kcW46/UFMRJtpNvppI=;
 b=STDobxnL0ps/z+In0pzUfcs+Gw8vVhuHQHyTA5lQLzgcXfj9wu3vGcrK
 fTp0bpTSr1q5fxK9PRsWjHBs4Z0o9tTfU+MXkyPQyxKyfb6jLe704Fht/
 7Cos15g7IqybnZzKgGpHSIs6hc28XpO/yfWEfHzPG7sfHogrpNZ3bmfQh
 VTeUYVlHGf2Uf7ma+ZVJ0fz89xv7mZWjmQhdDydpewmn1k5p7eERxYxqX
 sDbcn7CkV3zL5/fnOn/Iun41U7TvaAALns2a1zcWEuqC1sz8ZLvTwIOq0
 VmO8cPL5RpnrzxbspBK/KFdYSgUTymT6w6BGYwP+LRSsJ4HCSZ4n55j55 Q==;
X-CSE-ConnectionGUID: 6DhMasESTSiWneyRY9SznQ==
X-CSE-MsgGUID: sLILUFiTSNe55OhNFNMblQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963035"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:42:36 -0700
X-CSE-ConnectionGUID: sX7W78N6RGefx/ixE10Qpg==
X-CSE-MsgGUID: EQlW02SCRkeY3QkKQvP9LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443338"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:42:29 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 09/30] KVM: x86/mmu: Handle page fault for private MMIO
Date: Thu, 29 May 2025 13:34:52 +0800
Message-Id: <20250529053513.1592088-10-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Add support for resolving page faults on private MMIO. This is part of
the effort to enable private assigned devices (known as TDI in TDISP
spec).

Private MMIOs are set to KVM as vfio_dmabuf typed memory slot, which is
another type of can-be-private memory slot just like the gmem slot.
Like gmem slot, KVM needs to map its GFN as shared or private based on
the current state of the GFN's memory attribute. When page fault
happens for private MMIO but private <-> shared conversion is needed,
KVM still exits to userspace with exit reason KVM_EXIT_MEMORY_FAULT and
toggles KVM_MEMORY_EXIT_FLAG_PRIVATE. Unlike gmem slot, vfio_dmabuf
slot has only one backend MMIO resource, the switching of GFN's
attribute won't change the way of getting PFN, the vfio_dmabuf specific
way, kvm_vfio_dmabuf_get_pfn().

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 arch/x86/kvm/mmu/mmu.c   | 9 +++++++--
 include/linux/kvm_host.h | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 40d33bd6b532..547fb645692b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4501,8 +4501,13 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &fault->refcounted_page, &max_order);
+	if (kvm_slot_is_vfio_dmabuf(fault->slot))
+		r = kvm_vfio_dmabuf_get_pfn(vcpu->kvm, fault->slot, fault->gfn,
+					    &fault->pfn, &max_order);
+	else
+		r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn,
+				     &fault->pfn, &fault->refcounted_page,
+				     &max_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b850d3cff83c..dd9c876374b8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -620,7 +620,7 @@ struct kvm_memory_slot {
 
 static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
 {
-	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
+	return slot && (slot->flags & (KVM_MEM_GUEST_MEMFD | KVM_MEM_VFIO_DMABUF));
 }
 
 static inline bool kvm_slot_is_vfio_dmabuf(const struct kvm_memory_slot *slot)
-- 
2.25.1

