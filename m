Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF7A050B2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA810E7DF;
	Wed,  8 Jan 2025 02:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPKZhMzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688DF10E7DF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736303366; x=1767839366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/z8023DqOXrBeB2h+oVIlnQB3qWuu0HfYeVGYTz0Vk=;
 b=DPKZhMzs/eOLXhfb3QjvAREcq9SY5HdbHHvQ/g1XCAGd56bFiqXSO7t7
 3gCieKnwCuefl6D7+p/0nQNUHULtl0HVvyUB1Irhgo5P+jalsE0U55cVu
 aCqpsmR1vlHNNr5urpZYd49/a5X/oC0pJdZRR4RiADzcFx2N0pSzLEClj
 kBPS8n1bHfMyf/0YxtmIOEW6wst/oTDZP7DhaAIfUx+oghb5i2pYWTe3T
 nxsHH3v+A0x76N1W1S3vnWEViLxOrFFNsGSoMJiAIuNP3b2eHx/cr6zbN
 VGC5GYqNzjSxQfKU1CY2HE/i8bND5HhgztDT+SwTtQipVfFWcrLbSnY+P A==;
X-CSE-ConnectionGUID: 8AnSxOAkTFuM8akLQP8AUw==
X-CSE-MsgGUID: pHg1AohWTvaAWEJxIFl3Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010646"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="47010646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 18:29:25 -0800
X-CSE-ConnectionGUID: i6Mkl2ZcQM2v3FBIYzGXfw==
X-CSE-MsgGUID: zcD3B7dES06fsa7ON3BDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103793857"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:29:20 -0800
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
Subject: [RFC PATCH 11/12] KVM: x86/mmu: Export kvm_is_mmio_pfn()
Date: Tue,  7 Jan 2025 22:27:18 +0800
Message-Id: <20250107142719.179636-12-yilun.xu@linux.intel.com>
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

From: Xu Yilun <yilun.xu@intel.com>

Export kvm_is_mmio_pfn() for KVM TDX to decide which seamcall should be
used to setup SEPT leaf entry.

TDX Module requires tdh_mem_page_aug() for memory page setup,
and tdh_mmio_map() for MMIO setup.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@intel.com>
---
 arch/x86/kvm/mmu.h      | 1 +
 arch/x86/kvm/mmu/spte.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index e40097c7e8d4..23ff0e6c9ef6 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -102,6 +102,7 @@ void kvm_mmu_sync_roots(struct kvm_vcpu *vcpu);
 void kvm_mmu_sync_prev_roots(struct kvm_vcpu *vcpu);
 void kvm_mmu_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 			 int bytes);
+bool kvm_is_mmio_pfn(kvm_pfn_t pfn);
 
 static inline int kvm_mmu_reload(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index e819d16655b6..0a9a81afba93 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -105,7 +105,7 @@ u64 make_mmio_spte(struct kvm_vcpu *vcpu, u64 gfn, unsigned int access)
 	return spte;
 }
 
-static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
+bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
 {
 	if (pfn_valid(pfn))
 		return !is_zero_pfn(pfn) && PageReserved(pfn_to_page(pfn)) &&
@@ -125,6 +125,7 @@ static bool kvm_is_mmio_pfn(kvm_pfn_t pfn)
 				     pfn_to_hpa(pfn + 1) - 1,
 				     E820_TYPE_RAM);
 }
+EXPORT_SYMBOL_GPL(kvm_is_mmio_pfn);
 
 /*
  * Returns true if the SPTE has bits that may be set without holding mmu_lock.
-- 
2.25.1

