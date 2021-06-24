Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A543B25CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 05:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408EC6E9E2;
	Thu, 24 Jun 2021 03:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B816E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 03:59:31 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id h23so2688388pjv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yb1+LhNVbe1kIYCnyFfMJBCC3qabaZPT2bIO7LNCP6o=;
 b=UYDsdmsP+EIvqrlkwC60eIHtSQYwjNwSm4fRjdJXA9d7VhUz+Tu4MiZPf2QXN2l7gl
 ZWqt5zpVsrPi4llEQA5dtKTI559ToqIgZmuejMvoyBkIgSOrDt8ZQMVwSfhIffzLKRcU
 8Q110U/UtS86jkL95jOuIoCjbIQuhQ+HEFqpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yb1+LhNVbe1kIYCnyFfMJBCC3qabaZPT2bIO7LNCP6o=;
 b=kAzoCkzOZpmOayuf03c+FmuaEKJEYxOUpwyMmSrFUAPdnH0d8btEXZ5HkeezrNk27a
 3/Hia1b5nuIcoB+S/xTabVRzjYueYEAGmmf7EDG1tpanwzxDbtY53WDlk6ijN2BxrmtK
 lYAnzUhKP2OsqLpkYGUP8fDd7uPMCLkWGtiIFxycgJTL1jyBcJUQMTuM9BoaFGH7+FHJ
 ql8JB42p3dfLcXLGgsAHzyAwVaU96l+qaRcsUsRk+KD6uB6MrICnGfPAP1puKyVx5VY0
 wo9r66Zm870KrDjK/N3DIQ9b+HCA7hrWsgUHqQlfP7YhBIGlTRiDj5jQ7Otm3rbXJ4km
 0E5w==
X-Gm-Message-State: AOAM531dzw1iQsd4AHJOCvZPR4u5v1qNgjVuD2al1QHf4ac7g5mX2CE/
 P9xH3PBI7CQLkPRHJuqEa582pA==
X-Google-Smtp-Source: ABdhPJy0WHFe9jFE/dz97ZxHrx2+glqx5Vg7IZOJKP6a4okTNEREyFkkU5k72sPn7PPfxYTO9GUImw==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr2459172plx.50.1624507170769; 
 Wed, 23 Jun 2021 20:59:30 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id gx10sm867271pjb.45.2021.06.23.20.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:30 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
Date: Thu, 24 Jun 2021 12:57:45 +0900
Message-Id: <20210624035749.4054934-3-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, James Morse <james.morse@arm.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Stevens <stevensd@chromium.org>

Return a struct kvm_pfn_page containing both a pfn and an optional
struct page from the gfn_to_pfn family of functions. This differentiates
the gup and follow_fault_pfn cases, which allows callers that only need
a pfn to avoid touching the page struct in the latter case. For callers
that need a struct page, introduce a helper function that unwraps a
struct kvm_pfn_page into a struct page. This helper makes the call to
kvm_get_pfn which had previously been in hva_to_pfn_remapped.

For now, wrap all calls to gfn_to_pfn functions in the new helper
function. Callers which don't need the page struct will be updated in
follow-up patches.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/arm64/kvm/mmu.c                   |   5 +-
 arch/mips/kvm/mmu.c                    |   3 +-
 arch/powerpc/kvm/book3s.c              |   3 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |   5 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |   5 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c     |   4 +-
 arch/powerpc/kvm/e500_mmu_host.c       |   2 +-
 arch/x86/kvm/mmu/mmu.c                 |  11 ++-
 arch/x86/kvm/mmu/mmu_audit.c           |   2 +-
 arch/x86/kvm/x86.c                     |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c       |   2 +-
 include/linux/kvm_host.h               |  27 ++++--
 include/linux/kvm_types.h              |   5 +
 virt/kvm/kvm_main.c                    | 121 +++++++++++++------------
 14 files changed, 109 insertions(+), 88 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c10207fed2f3..896b3644b36f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -933,8 +933,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	smp_rmb();
 
-	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable, NULL);
+	pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(memslot, gfn, false,
+						       NULL, write_fault,
+						       &writable, NULL));
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 6d1f68cf4edf..f4e5e48bc6bf 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -630,7 +630,8 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writeable);
+	pfn = kvm_pfn_page_unwrap(gfn_to_pfn_prot(kvm, gfn,
+						  write_fault, &writeable));
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2b691f4d1f26..2dff01d0632a 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -417,7 +417,8 @@ kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 		return pfn;
 	}
 
-	return gfn_to_pfn_prot(vcpu->kvm, gfn, writing, writable);
+	return kvm_pfn_page_unwrap(gfn_to_pfn_prot(vcpu->kvm, gfn,
+						   writing, writable));
 }
 EXPORT_SYMBOL_GPL(kvmppc_gpa_to_pfn);
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 2d9193cd73be..ba094b9f87a9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -590,8 +590,9 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 		write_ok = true;
 	} else {
 		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, &write_ok, NULL);
+		pfn = kvm_pfn_page_unwrap(
+				__gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+						     writing, &write_ok, NULL));
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page = NULL;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index d909c069363e..e7892f148222 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -821,8 +821,9 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 		unsigned long pfn;
 
 		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p, NULL);
+		pfn = kvm_pfn_page_unwrap(
+				__gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+						     writing, upgrade_p, NULL));
 		if (is_error_noslot_pfn(pfn))
 			return -EFAULT;
 		page = NULL;
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..0eee0d98b055 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -890,7 +890,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 retry:
 	mutex_unlock(&kvm->arch.uvmem_lock);
-	pfn = gfn_to_pfn(kvm, gfn);
+	pfn = kvm_pfn_page_unwrap(gfn_to_pfn(kvm, gfn));
 	if (is_error_noslot_pfn(pfn))
 		goto out;
 
@@ -1075,7 +1075,7 @@ int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 	unsigned long pfn;
 	int ret = U_SUCCESS;
 
-	pfn = gfn_to_pfn(kvm, gfn);
+	pfn = kvm_pfn_page_unwrap(gfn_to_pfn(kvm, gfn));
 	if (is_error_noslot_pfn(pfn))
 		return -EFAULT;
 
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 7f16afc331ef..be7ca5788a05 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -446,7 +446,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = kvm_pfn_page_unwrap(gfn_to_pfn_memslot(slot, gfn));
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 8d5876dfc6b7..84913677c404 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2619,7 +2619,7 @@ static kvm_pfn_t pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 	if (!slot)
 		return KVM_PFN_ERR_FAULT;
 
-	return gfn_to_pfn_memslot_atomic(slot, gfn);
+	return kvm_pfn_page_unwrap(gfn_to_pfn_memslot_atomic(slot, gfn));
 }
 
 static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
@@ -3694,8 +3694,9 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 	}
 
 	async = false;
-	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, &async,
-				    write, writable, hva);
+	*pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(slot, gfn, false,
+							&async, write,
+							writable, hva));
 	if (!async)
 		return false; /* *pfn has correct page already */
 
@@ -3709,8 +3710,8 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 			return true;
 	}
 
-	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, NULL,
-				    write, writable, hva);
+	*pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(slot, gfn, false, NULL,
+							write, writable, hva));
 	return false;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
index 97ff184084b4..3f983dc6e0f1 100644
--- a/arch/x86/kvm/mmu/mmu_audit.c
+++ b/arch/x86/kvm/mmu/mmu_audit.c
@@ -111,7 +111,7 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
 		return;
 
 	gfn = kvm_mmu_page_get_gfn(sp, sptep - sp->spt);
-	pfn = kvm_vcpu_gfn_to_pfn_atomic(vcpu, gfn);
+	pfn = kvm_pfn_page_unwrap(kvm_vcpu_gfn_to_pfn_atomic(vcpu, gfn));
 
 	if (is_error_pfn(pfn))
 		return;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 6d425310054b..d31797e0cb6e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7341,7 +7341,7 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	 * retry instruction -> write #PF -> emulation fail -> retry
 	 * instruction -> ...
 	 */
-	pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
+	pfn = kvm_pfn_page_unwrap(gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa)));
 
 	/*
 	 * If the instruction failed on the error pfn, it can not be fixed,
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 65ff43cfc0f7..b829ff67e3d9 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1938,7 +1938,7 @@ static unsigned long kvmgt_gfn_to_pfn(unsigned long handle, unsigned long gfn)
 
 	info = (struct kvmgt_guest_info *)handle;
 
-	pfn = gfn_to_pfn(info->kvm, gfn);
+	pfn = kvm_pfn_page_unwrap(gfn_to_pfn(info->kvm, gfn));
 	if (is_error_noslot_pfn(pfn))
 		return INTEL_GVT_INVALID_ADDR;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8583ed3ff344..d3731790a967 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -138,6 +138,8 @@ static inline bool is_error_page(struct page *page)
 	return IS_ERR(page);
 }
 
+#define KVM_PFN_PAGE_ERR(e) ((struct kvm_pfn_page) { .pfn = (e), .page = NULL })
+
 #define KVM_REQUEST_MASK           GENMASK(7,0)
 #define KVM_REQUEST_NO_WAKEUP      BIT(8)
 #define KVM_REQUEST_WAIT           BIT(9)
@@ -795,14 +797,19 @@ void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 void kvm_set_page_accessed(struct page *page);
 
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool atomic, bool *async, bool write_fault,
-			       bool *writable, hva_t *hva);
+struct kvm_pfn_page gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
+struct kvm_pfn_page gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn,
+				    bool write_fault, bool *writable);
+struct kvm_pfn_page  gfn_to_pfn_memslot(struct kvm_memory_slot *slot,
+					gfn_t gfn);
+struct kvm_pfn_page  gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot,
+					       gfn_t gfn);
+struct kvm_pfn_page  __gfn_to_pfn_memslot(struct kvm_memory_slot *slot,
+					  gfn_t gfn, bool atomic, bool *async,
+					  bool write_fault, bool *writable,
+					  hva_t *hva);
+
+kvm_pfn_t kvm_pfn_page_unwrap(struct kvm_pfn_page pfnpg);
 
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
@@ -883,8 +890,8 @@ void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
 struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
-kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn);
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
+struct kvm_pfn_page kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn);
+struct kvm_pfn_page kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map);
 int kvm_map_gfn(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 		struct gfn_to_pfn_cache *cache, bool atomic);
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index a7580f69dda0..471f4b329f46 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -45,6 +45,11 @@ typedef u64            hfn_t;
 
 typedef hfn_t kvm_pfn_t;
 
+struct kvm_pfn_page {
+	kvm_pfn_t pfn;
+	struct page *page;
+};
+
 struct gfn_to_hva_cache {
 	u64 generation;
 	gpa_t gpa;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a6bc7af0e28..898e90be4d0e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1982,9 +1982,8 @@ static inline int check_user_page_hwpoison(unsigned long addr)
  * only part that runs if we can in atomic context.
  */
 static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
-			    bool *writable, kvm_pfn_t *pfn)
+			    bool *writable, struct kvm_pfn_page *pfnpg)
 {
-	struct page *page[1];
 
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -1994,8 +1993,8 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
 	if (!(write_fault || writable))
 		return false;
 
-	if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
-		*pfn = page_to_pfn(page[0]);
+	if (get_user_page_fast_only(addr, FOLL_WRITE, &pfnpg->page)) {
+		pfnpg->pfn = page_to_pfn(pfnpg->page);
 
 		if (writable)
 			*writable = true;
@@ -2010,10 +2009,9 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
  * 1 indicates success, -errno is returned if error is detected.
  */
 static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
-			   bool *writable, kvm_pfn_t *pfn)
+			   bool *writable, struct kvm_pfn_page *pfnpg)
 {
 	unsigned int flags = FOLL_HWPOISON;
-	struct page *page;
 	int npages = 0;
 
 	might_sleep();
@@ -2026,7 +2024,7 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 	if (async)
 		flags |= FOLL_NOWAIT;
 
-	npages = get_user_pages_unlocked(addr, 1, &page, flags);
+	npages = get_user_pages_unlocked(addr, 1, &pfnpg->page, flags);
 	if (npages != 1)
 		return npages;
 
@@ -2036,11 +2034,11 @@ static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
 
 		if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
 			*writable = true;
-			put_page(page);
-			page = wpage;
+			put_page(pfnpg->page);
+			pfnpg->page = wpage;
 		}
 	}
-	*pfn = page_to_pfn(page);
+	pfnpg->pfn = page_to_pfn(pfnpg->page);
 	return npages;
 }
 
@@ -2058,7 +2056,7 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       unsigned long addr, bool *async,
 			       bool write_fault, bool *writable,
-			       kvm_pfn_t *p_pfn)
+			       struct kvm_pfn_page *p_pfn)
 {
 	kvm_pfn_t pfn;
 	pte_t *ptep;
@@ -2094,22 +2092,12 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 		*writable = pte_write(*ptep);
 	pfn = pte_pfn(*ptep);
 
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_get_pfn/kvm_release_pfn_clean pair will
-	 * simply do nothing for reserved pfns.
-	 *
-	 * Whoever called remap_pfn_range is also going to call e.g.
-	 * unmap_mapping_range before the underlying pages are freed,
-	 * causing a call to our MMU notifier.
-	 */ 
-	kvm_get_pfn(pfn);
-
 out:
 	pte_unmap_unlock(ptep, ptl);
-	*p_pfn = pfn;
+
+	p_pfn->pfn = pfn;
+	p_pfn->page = NULL;
+
 	return 0;
 }
 
@@ -2127,30 +2115,30 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
  * 2): @write_fault = false && @writable, @writable will tell the caller
  *     whether the mapping is writable.
  */
-static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
-			bool write_fault, bool *writable)
+static struct kvm_pfn_page hva_to_pfn(unsigned long addr, bool atomic,
+			bool *async, bool write_fault, bool *writable)
 {
 	struct vm_area_struct *vma;
-	kvm_pfn_t pfn = 0;
+	struct kvm_pfn_page pfnpg = {};
 	int npages, r;
 
 	/* we can do it either atomically or asynchronously, not both */
 	BUG_ON(atomic && async);
 
-	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
-		return pfn;
+	if (hva_to_pfn_fast(addr, write_fault, writable, &pfnpg))
+		return pfnpg;
 
 	if (atomic)
-		return KVM_PFN_ERR_FAULT;
+		return KVM_PFN_PAGE_ERR(KVM_PFN_ERR_FAULT);
 
-	npages = hva_to_pfn_slow(addr, async, write_fault, writable, &pfn);
+	npages = hva_to_pfn_slow(addr, async, write_fault, writable, &pfnpg);
 	if (npages == 1)
-		return pfn;
+		return pfnpg;
 
 	mmap_read_lock(current->mm);
 	if (npages == -EHWPOISON ||
 	      (!async && check_user_page_hwpoison(addr))) {
-		pfn = KVM_PFN_ERR_HWPOISON;
+		pfnpg.pfn = KVM_PFN_ERR_HWPOISON;
 		goto exit;
 	}
 
@@ -2158,26 +2146,27 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool *async,
 	vma = find_vma_intersection(current->mm, addr, addr + 1);
 
 	if (vma == NULL)
-		pfn = KVM_PFN_ERR_FAULT;
+		pfnpg.pfn = KVM_PFN_ERR_FAULT;
 	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
-		r = hva_to_pfn_remapped(vma, addr, async, write_fault, writable, &pfn);
+		r = hva_to_pfn_remapped(vma, addr, async, write_fault, writable, &pfnpg);
 		if (r == -EAGAIN)
 			goto retry;
 		if (r < 0)
-			pfn = KVM_PFN_ERR_FAULT;
+			pfnpg.pfn = KVM_PFN_ERR_FAULT;
 	} else {
 		if (async && vma_is_valid(vma, write_fault))
 			*async = true;
-		pfn = KVM_PFN_ERR_FAULT;
+		pfnpg.pfn = KVM_PFN_ERR_FAULT;
 	}
 exit:
 	mmap_read_unlock(current->mm);
-	return pfn;
+	return pfnpg;
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool atomic, bool *async, bool write_fault,
-			       bool *writable, hva_t *hva)
+struct kvm_pfn_page __gfn_to_pfn_memslot(struct kvm_memory_slot *slot,
+					 gfn_t gfn, bool atomic, bool *async,
+					 bool write_fault, bool *writable,
+					 hva_t *hva)
 {
 	unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
 
@@ -2187,13 +2176,13 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 	if (addr == KVM_HVA_ERR_RO_BAD) {
 		if (writable)
 			*writable = false;
-		return KVM_PFN_ERR_RO_FAULT;
+		return KVM_PFN_PAGE_ERR(KVM_PFN_ERR_RO_FAULT);
 	}
 
 	if (kvm_is_error_hva(addr)) {
 		if (writable)
 			*writable = false;
-		return KVM_PFN_NOSLOT;
+		return KVM_PFN_PAGE_ERR(KVM_PFN_NOSLOT);
 	}
 
 	/* Do not map writable pfn in the readonly memslot. */
@@ -2207,44 +2196,55 @@ kvm_pfn_t __gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn,
 }
 EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
 
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable)
+struct kvm_pfn_page gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn,
+				    bool write_fault, bool *writable)
 {
 	return __gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn, false, NULL,
 				    write_fault, writable, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
 
-kvm_pfn_t gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
+struct kvm_pfn_page gfn_to_pfn_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	return __gfn_to_pfn_memslot(slot, gfn, false, NULL, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
 
-kvm_pfn_t gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot, gfn_t gfn)
+struct kvm_pfn_page gfn_to_pfn_memslot_atomic(struct kvm_memory_slot *slot,
+					      gfn_t gfn)
 {
 	return __gfn_to_pfn_memslot(slot, gfn, true, NULL, true, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot_atomic);
 
-kvm_pfn_t kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn)
+struct kvm_pfn_page kvm_vcpu_gfn_to_pfn_atomic(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
 	return gfn_to_pfn_memslot_atomic(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn_atomic);
 
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
+struct kvm_pfn_page gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
 {
 	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(gfn_to_pfn);
 
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
+struct kvm_pfn_page kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
 	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
+kvm_pfn_t kvm_pfn_page_unwrap(struct kvm_pfn_page pfnpg)
+{
+	if (pfnpg.page)
+		return pfnpg.pfn;
+
+	kvm_get_pfn(pfnpg.pfn);
+	return pfnpg.pfn;
+}
+EXPORT_SYMBOL_GPL(kvm_pfn_page_unwrap);
+
 int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 			    struct page **pages, int nr_pages)
 {
@@ -2277,11 +2277,14 @@ static struct page *kvm_pfn_to_page(kvm_pfn_t pfn)
 
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
+
+	pfnpg = gfn_to_pfn(kvm, gfn);
 
-	pfn = gfn_to_pfn(kvm, gfn);
+	if (pfnpg.page)
+		return pfnpg.page;
 
-	return kvm_pfn_to_page(pfn);
+	return kvm_pfn_to_page(kvm_pfn_page_unwrap(pfnpg));
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
@@ -2304,7 +2307,7 @@ static void kvm_cache_gfn_to_pfn(struct kvm_memory_slot *slot, gfn_t gfn,
 {
 	kvm_release_pfn(cache->pfn, cache->dirty, cache);
 
-	cache->pfn = gfn_to_pfn_memslot(slot, gfn);
+	cache->pfn = kvm_pfn_page_unwrap(gfn_to_pfn_memslot(slot, gfn));
 	cache->gfn = gfn;
 	cache->dirty = false;
 	cache->generation = gen;
@@ -2335,7 +2338,7 @@ static int __kvm_map_gfn(struct kvm_memslots *slots, gfn_t gfn,
 	} else {
 		if (atomic)
 			return -EAGAIN;
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = kvm_pfn_page_unwrap(gfn_to_pfn_memslot(slot, gfn));
 	}
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -2435,11 +2438,11 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
 struct page *kvm_vcpu_gfn_to_page(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 
-	pfn = kvm_vcpu_gfn_to_pfn(vcpu, gfn);
+	pfnpg = kvm_vcpu_gfn_to_pfn(vcpu, gfn);
 
-	return kvm_pfn_to_page(pfn);
+	return kvm_pfn_to_page(kvm_pfn_page_unwrap(pfnpg));
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_page);
 
-- 
2.32.0.93.g670b81a890-goog

