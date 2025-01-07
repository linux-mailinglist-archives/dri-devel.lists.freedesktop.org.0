Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA38A050AB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DF010E7D9;
	Wed,  8 Jan 2025 02:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONsWXK1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BB410E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303344; x=1767839344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJRSkONMJqebaCZW+gob8Q62wZ/LJw1y78ECWyPbnZQ=;
 b=ONsWXK1OU/ZhqFyRHRzr5Y3DvdyVLsxOy6pVd9Lqd38ws4dld/HyyKHD
 ugvFMr0NHX5nBfW3As1sR43yc+HsXn2lLn0bZApn6d5yZnmpbxGx2j6FC
 a2/ZyEXn4YvK4BC6OjMrdt1xNWO9AYcTVzucq9UizM5xAXocQCKBW13SR
 xDKAwOMFb0uoz/KRpNKgg+Rwfxdr0XOORaSU62rhaZVrTE1Pt8N3f/dxv
 RtjTjbqnRTe1+syEiQb6P9f8eVkwuzfoRC6/NccNHfjzWK9b3xYuICItY
 s31Mpjz0jylRhupDX6BOKHV4k9/UVH/ts9Lp/V08ArUwjz8UQXhAQfuhZ g==;
X-CSE-ConnectionGUID: m+58FTXzQXuhmeLB5425aQ==
X-CSE-MsgGUID: WNL93RClT/+idbTMtWaWaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010538"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010538"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:29:03 -0800
X-CSE-ConnectionGUID: ftMgnn64SLq8VRe+W3TdqQ==
X-CSE-MsgGUID: YgHk+2iRRXSnX7E/tvOqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793703"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:28:58 -0800
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
Subject: [RFC PATCH 07/12] KVM: x86/mmu: Handle page fault for vfio_dmabuf
 backed MMIO
Date: Tue,  7 Jan 2025 22:27:14 +0800
Message-Id: <20250107142719.179636-8-yilun.xu@linux.intel.com>
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

Add support for resolving page faults on vfio_dmabuf backed MMIO. This
is to support private MMIO for private assigned devices (known as TDI
in TDISP spec).

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
 arch/x86/kvm/mmu/mmu.c   | 25 +++++++++++++++++++++++--
 include/linux/kvm_host.h |  7 ++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 713ca857f2c2..90ca54fee22f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4341,8 +4341,13 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
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
@@ -4363,6 +4368,22 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
+	/* vfio_dmabuf slot is also applicable for shared mapping */
+	if (kvm_slot_is_vfio_dmabuf(fault->slot)) {
+		int max_order, r;
+
+		r = kvm_vfio_dmabuf_get_pfn(vcpu->kvm, fault->slot, fault->gfn,
+					    &fault->pfn, &max_order);
+		if (r)
+			return r;
+
+		fault->max_level = min(kvm_max_level_for_order(max_order),
+				       fault->max_level);
+		fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
+
+		return RET_PF_CONTINUE;
+	}
+
 	foll |= FOLL_NOWAIT;
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
 				       &fault->map_writable, &fault->refcounted_page);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 871d927485a5..966a5a247c6b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -614,7 +614,12 @@ struct kvm_memory_slot {
 
 static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
 {
-	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
+	return slot && (slot->flags & (KVM_MEM_GUEST_MEMFD | KVM_MEM_VFIO_DMABUF));
+}
+
+static inline bool kvm_slot_is_vfio_dmabuf(const struct kvm_memory_slot *slot)
+{
+	return slot && (slot->flags & KVM_MEM_VFIO_DMABUF);
 }
 
 static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
-- 
2.25.1

