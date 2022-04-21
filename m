Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED250966C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 07:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E5210F368;
	Thu, 21 Apr 2022 05:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D349510F367
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650518016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFfak0fL1x1PD2NGlDq0gbCHu4stLjWexcxTqgBpjZU=;
 b=iQLyocRbalAz8LbQOZ2bgZG2f1bDPviVD2pgOSVYIqiGwFI/x8/E3QcMPuiKZXS4Fg0OHP
 eTwcoGtZCIhnDoNrb+JhiNUSOcETigQ3+aa0E6I5DW3ukGxcKbnzQxxjCIGt5+IIKGTNuu
 v2MhahwloOKjSEIU9M3nHHBcfV6OO30=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-E-cy5rt1PnWU_0o6vX-bsg-1; Thu, 21 Apr 2022 01:13:33 -0400
X-MC-Unique: E-cy5rt1PnWU_0o6vX-bsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E3D8038E3;
 Thu, 21 Apr 2022 05:13:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD2DE145BA5A;
 Thu, 21 Apr 2022 05:13:26 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v2 07/10] KVM: x86: SVM: move avic state to separate struct
Date: Thu, 21 Apr 2022 08:12:41 +0300
Message-Id: <20220421051244.187733-8-mlevitsk@redhat.com>
In-Reply-To: <20220421051244.187733-1-mlevitsk@redhat.com>
References: <20220421051244.187733-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will make the code a bit easier to read when nested AVIC support
is added.

No functional change intended.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 49 +++++++++++++++++++++++------------------
 arch/x86/kvm/svm/svm.h  | 14 +++++++-----
 2 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f375ca1d6518e..87756237c646d 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -69,6 +69,8 @@ int avic_ga_log_notifier(u32 ga_tag)
 	unsigned long flags;
 	struct kvm_svm *kvm_svm;
 	struct kvm_vcpu *vcpu = NULL;
+	struct kvm_svm_avic *avic;
+
 	u32 vm_id = AVIC_GATAG_TO_VMID(ga_tag);
 	u32 vcpu_id = AVIC_GATAG_TO_VCPUID(ga_tag);
 
@@ -76,9 +78,13 @@ int avic_ga_log_notifier(u32 ga_tag)
 	trace_kvm_avic_ga_log(vm_id, vcpu_id);
 
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
-	hash_for_each_possible(svm_vm_data_hash, kvm_svm, hnode, vm_id) {
-		if (kvm_svm->avic_vm_id != vm_id)
+	hash_for_each_possible(svm_vm_data_hash, avic, hnode, vm_id) {
+
+
+		if (avic->vm_id != vm_id)
 			continue;
+
+		kvm_svm = container_of(avic, struct kvm_svm, avic);
 		vcpu = kvm_get_vcpu_by_id(&kvm_svm->kvm, vcpu_id);
 		break;
 	}
@@ -98,18 +104,18 @@ int avic_ga_log_notifier(u32 ga_tag)
 void avic_vm_destroy(struct kvm *kvm)
 {
 	unsigned long flags;
-	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
+	struct kvm_svm_avic *avic = &to_kvm_svm(kvm)->avic;
 
 	if (!enable_apicv)
 		return;
 
-	if (kvm_svm->avic_logical_id_table_page)
-		__free_page(kvm_svm->avic_logical_id_table_page);
-	if (kvm_svm->avic_physical_id_table_page)
-		__free_page(kvm_svm->avic_physical_id_table_page);
+	if (avic->logical_id_table_page)
+		__free_page(avic->logical_id_table_page);
+	if (avic->physical_id_table_page)
+		__free_page(avic->physical_id_table_page);
 
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
-	hash_del(&kvm_svm->hnode);
+	hash_del(&avic->hnode);
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
 }
 
@@ -117,10 +123,9 @@ int avic_vm_init(struct kvm *kvm)
 {
 	unsigned long flags;
 	int err = -ENOMEM;
-	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
-	struct kvm_svm *k2;
 	struct page *p_page;
 	struct page *l_page;
+	struct kvm_svm_avic *avic = &to_kvm_svm(kvm)->avic;
 	u32 vm_id;
 
 	if (!enable_apicv)
@@ -131,14 +136,14 @@ int avic_vm_init(struct kvm *kvm)
 	if (!p_page)
 		goto free_avic;
 
-	kvm_svm->avic_physical_id_table_page = p_page;
+	avic->physical_id_table_page = p_page;
 
 	/* Allocating logical APIC ID table (4KB) */
 	l_page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
 	if (!l_page)
 		goto free_avic;
 
-	kvm_svm->avic_logical_id_table_page = l_page;
+	avic->logical_id_table_page = l_page;
 
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
  again:
@@ -149,13 +154,15 @@ int avic_vm_init(struct kvm *kvm)
 	}
 	/* Is it still in use? Only possible if wrapped at least once */
 	if (next_vm_id_wrapped) {
-		hash_for_each_possible(svm_vm_data_hash, k2, hnode, vm_id) {
-			if (k2->avic_vm_id == vm_id)
+		struct kvm_svm_avic *avic2;
+
+		hash_for_each_possible(svm_vm_data_hash, avic2, hnode, vm_id) {
+			if (avic2->vm_id == vm_id)
 				goto again;
 		}
 	}
-	kvm_svm->avic_vm_id = vm_id;
-	hash_add(svm_vm_data_hash, &kvm_svm->hnode, kvm_svm->avic_vm_id);
+	avic->vm_id = vm_id;
+	hash_add(svm_vm_data_hash, &avic->hnode, avic->vm_id);
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
 
 	return 0;
@@ -169,8 +176,8 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
 	phys_addr_t bpa = __sme_set(page_to_phys(svm->avic_backing_page));
-	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
-	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic_physical_id_table_page));
+	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic.logical_id_table_page));
+	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic.physical_id_table_page));
 
 	vmcb->control.avic_backing_page = bpa & AVIC_HPA_MASK;
 	vmcb->control.avic_logical_id = lpa & AVIC_HPA_MASK;
@@ -193,7 +200,7 @@ static u64 *avic_get_physical_id_entry(struct kvm_vcpu *vcpu,
 	if (index >= AVIC_MAX_PHYSICAL_ID_COUNT)
 		return NULL;
 
-	avic_physical_id_table = page_address(kvm_svm->avic_physical_id_table_page);
+	avic_physical_id_table = page_address(kvm_svm->avic.physical_id_table_page);
 
 	return &avic_physical_id_table[index];
 }
@@ -387,7 +394,7 @@ static u32 *avic_get_logical_id_entry(struct kvm_vcpu *vcpu, u32 ldr, bool flat)
 		index = (cluster << 2) + apic;
 	}
 
-	logical_apic_id_table = (u32 *) page_address(kvm_svm->avic_logical_id_table_page);
+	logical_apic_id_table = (u32 *) page_address(kvm_svm->avic.logical_id_table_page);
 
 	return &logical_apic_id_table[index];
 }
@@ -737,7 +744,7 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 			/* Try to enable guest_mode in IRTE */
 			pi.base = __sme_set(page_to_phys(svm->avic_backing_page) &
 					    AVIC_HPA_MASK);
-			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
+			pi.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic.vm_id,
 						     svm->vcpu.vcpu_id);
 			pi.is_guest_mode = true;
 			pi.vcpu_data = &vcpu_info;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index e246793cbeaeb..96390fa5e3917 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -88,15 +88,17 @@ struct kvm_sev_info {
 	atomic_t migration_in_progress;
 };
 
-struct kvm_svm {
-	struct kvm kvm;
 
-	/* Struct members for AVIC */
-	u32 avic_vm_id;
-	struct page *avic_logical_id_table_page;
-	struct page *avic_physical_id_table_page;
+struct kvm_svm_avic {
+	u32 vm_id;
+	struct page *logical_id_table_page;
+	struct page *physical_id_table_page;
 	struct hlist_node hnode;
+};
 
+struct kvm_svm {
+	struct kvm kvm;
+	struct kvm_svm_avic avic;
 	struct kvm_sev_info sev_info;
 };
 
-- 
2.26.3

