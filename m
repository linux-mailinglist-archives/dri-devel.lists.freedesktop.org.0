Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED90825113
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB24910E5A0;
	Fri,  5 Jan 2024 09:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA0210E5A9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704447894; x=1735983894;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=dRCZ1S0CO2msFURA90luHjWFusP5YsJ6PzRmy9EYQoE=;
 b=DX64LuvtPSLWbQIAuzW81DjVfHNiYIksK4C7p2LJyXDJHyQ9/xtDNQlJ
 2de6RgPUsvVj4qDznfPC6KVWnrVOrIjKH6UWdDqfrSNfbP6lsj85bd8E4
 2w/kn0FkXA5dqKiLinZjyzLtmzKnJggFsNvi+FM3+jDlXqvErpeBK0K3c
 cHJi7tqsLl7jcRcVAKN9RIuqF2w+g0QGdKuB1AEzNxV6HIlNlLSluUSR+
 ZY4MbjYGb7JwSinoIueIMR5gXVHLKnGnxZ/l60xYfONnsa8pG7F3DpdWd
 NAHCssDs4iZCpN5OtOZ2icENDs/2GGymdckyv4AocyMEbAK2eRTrvU5J5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10959400"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="10959400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784158177"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="784158177"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:44:47 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] KVM: VMX: Honor guest PATs for memslots of flag
 KVM_MEM_NON_COHERENT_DMA
Date: Fri,  5 Jan 2024 17:15:35 +0800
Message-Id: <20240105091535.24760-1-yan.y.zhao@intel.com>
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

Honor guest PATs in the range of memslots of flag KVM_MEM_NON_COHERENT_DMA
set no matter the value of noncoherent dma count.

Just honoring guest PATs (without honoring guest MTRRs) for memslots of
flag KVM_MEM_NON_COHERENT_DMA is because
- guest OS will ensure no page aliasing issue in guest side by honoring
  guest MTRRs in guest page table.
  Combinations like guest MTRR=WC or UC, guest PAT = WB is not allowed.
  (at least in Linux, see pat_x_mtrr_type()).
- guest device driver programs device hardware according to guest PATs in
  modern platforms.

Besides, we don't break down an EPT huge page if guest MTRRs in its range
are not consistent, because
- guest should have chosen correct guest PATs according to guest MTRRs.
- in normal platforms, small guest pages with different PATs must
  correspond to different TLBs though they are mapped in a huge page in
  EPT.

However, one condition may not be supported well by honoring guest PAT
alone -- when guest MTRR=WC, guest PAT=UC-.
By honoring guest MTRRs+PATs, the effective memory type is WC; while
by honoring guest PATs alone, the effective memory type is UC.
But it's arguable to support such a usage.

Suggested-by: Sean Christopherson <seanjc@google.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 arch/x86/kvm/vmx/vmx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 85a23765e506..99f22589fa6d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7600,6 +7600,9 @@ static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio,
 	if (is_mmio)
 		return MTRR_TYPE_UNCACHABLE << VMX_EPT_MT_EPTE_SHIFT;
 
+	if (slot->flags & KVM_MEM_NON_COHERENT_DMA)
+		return MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT;
+
 	if (!kvm_arch_has_noncoherent_dma(vcpu->kvm))
 		return (MTRR_TYPE_WRBACK << VMX_EPT_MT_EPTE_SHIFT) | VMX_EPT_IPAT_BIT;
 
-- 
2.17.1

