Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB282510D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5280810E59D;
	Fri,  5 Jan 2024 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDF010E59A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704447853; x=1735983853;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TAQv9JJR1XqAj6tjxwKS30HsTbZYt1Z095C7qYz5bks=;
 b=caget8ThtgtR60suaad3e2GpN8BRU9d63KkVcHsOijYx6Qu+gpuzXCYu
 4hXAzQE7IU1gSpDdBfEZPtyBKVTuVIneCSk1ZAyBq5mtWJVgkHGjGOts3
 d3maIBvSGlJQeP49c6hFFUaIocWXyMCJ4jlEHZ1zhXMt3YmTEXBrM1Sgw
 /osU6BAmXH+FR4TDSY4pJE4qdvdnNj8k/KBP/kImqNrlj1fwzgAe/Pju7
 Vd5jtRlISakHWGFIaZM7fql+/H6SBIqP63+gv9BMIqR074QROKtl5AqzY
 lXb9JNXrTzvMv/dyGcIAWe+owWPqqhFX0u+kISj8EvPOidrOw+5fk/lsj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10842968"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="10842968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:44:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="22458420"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:44:07 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] KVM: x86: Add a new param "slot" to op get_mt_mask in
 kvm_x86_ops
Date: Fri,  5 Jan 2024 17:14:54 +0800
Message-Id: <20240105091454.24700-1-yan.y.zhao@intel.com>
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

Add param "slot" to op get_mt_mask in kvm_x86_ops.
This is a preparation patch to later honor guest PATs for certain memslots.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 arch/x86/include/asm/kvm_host.h | 3 ++-
 arch/x86/kvm/mmu/spte.c         | 3 ++-
 arch/x86/kvm/vmx/vmx.c          | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a565a2e70f30..6be0d8ccff65 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1675,7 +1675,8 @@ struct kvm_x86_ops {
 	int (*sync_pir_to_irr)(struct kvm_vcpu *vcpu);
 	int (*set_tss_addr)(struct kvm *kvm, unsigned int addr);
 	int (*set_identity_map_addr)(struct kvm *kvm, u64 ident_addr);
-	u8 (*get_mt_mask)(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio);
+	u8 (*get_mt_mask)(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio,
+			  const struct kvm_memory_slot *slot);
 
 	void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
 			     int root_level);
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 4a599130e9c9..2c3ede3f27a9 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -191,7 +191,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 
 	if (shadow_memtype_mask)
 		spte |= static_call(kvm_x86_get_mt_mask)(vcpu, gfn,
-							 kvm_is_mmio_pfn(pfn));
+							 kvm_is_mmio_pfn(pfn),
+							 slot);
 	if (host_writable)
 		spte |= shadow_host_writable_mask;
 	else
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 40e3780d73ae..85a23765e506 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7576,7 +7576,8 @@ static int vmx_vm_init(struct kvm *kvm)
 	return 0;
 }
 
-static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
+static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio,
+			  const struct kvm_memory_slot *slot)
 {
 	/* We wanted to honor guest CD/MTRR/PAT, but doing so could result in
 	 * memory aliases with conflicting memory types and sometimes MCEs.
-- 
2.17.1

