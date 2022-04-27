Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFDA512377
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BFD10E542;
	Wed, 27 Apr 2022 20:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512E310E521
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AE6j2Z/VdUQtMtfyLiPPrZMPCCO8jp5Oj+E1IX+QYM=;
 b=ZTV4+ARp3mX2Qkn/Q4Q7PWXE1j1jWJKaWitcoUysDwddJT9WlN9AvCeTPYhBUnrqGKxp+2
 uc6fK5aPcrW5gTnBvBTEaqVc9OSP0n2hPVSK3+0O8hnxaCQNzST/xmvbjM2ZJlCfIQpoFr
 kcnz+IeiIhwQ3Kkdh3DwPMFwxVNKjOo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-BxQAc8sbPyqddXdWg2ibGg-1; Wed, 27 Apr 2022 16:04:45 -0400
X-MC-Unique: BxQAc8sbPyqddXdWg2ibGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1E0F381078B;
 Wed, 27 Apr 2022 20:04:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DBDF9E82;
 Wed, 27 Apr 2022 20:04:36 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 12/19] KVM: x86: nSVM: make nested AVIC physid write
 tracking be aware of the host scheduling
Date: Wed, 27 Apr 2022 23:03:07 +0300
Message-Id: <20220427200314.276673-13-mlevitsk@redhat.com>
In-Reply-To: <20220427200314.276673-1-mlevitsk@redhat.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For each vCPU
  - store a linked list of all shadow physical id entries
    which address it.

  - Update those entries when this vCPU is scheduled
    in/out

  - update this list, when physid tables are modified by
    other means (guest write and/or table sync)

To avoid races vs vcpu schedule, use a spinlock.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 113 +++++++++++++++++++++++++++++++++++++---
 arch/x86/kvm/svm/svm.c  |   7 +++
 arch/x86/kvm/svm/svm.h  |  10 ++++
 3 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f462b7e48e3ca..34da9fabd5194 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -67,8 +67,12 @@ static void avic_physid_shadow_entry_set_vcpu(struct kvm *kvm,
 	struct avic_physid_entry_descr *e = &t->entries[n];
 	u64 sentry = READ_ONCE(*e->sentry);
 	u64 old_sentry = sentry;
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
 	struct kvm_vcpu *new_vcpu = NULL;
 	int l0_apicid = -1;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
 
 	WARN_ON(!test_bit(n, t->valid_entires));
 
@@ -79,6 +83,9 @@ static void avic_physid_shadow_entry_set_vcpu(struct kvm *kvm,
 		new_vcpu = avic_vcpu_by_l1_apicid(kvm, new_l1_apicid);
 
 	if (new_vcpu)
+		list_add_tail(&e->link, &to_svm(new_vcpu)->nested.physid_ref_entries);
+
+	if (new_vcpu && to_svm(new_vcpu)->nested_avic_active)
 		l0_apicid = kvm_cpu_get_apicid(new_vcpu->cpu);
 
 	physid_entry_set_apicid(&sentry, l0_apicid);
@@ -87,6 +94,8 @@ static void avic_physid_shadow_entry_set_vcpu(struct kvm *kvm,
 
 	if (sentry != old_sentry)
 		WRITE_ONCE(*e->sentry, sentry);
+
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
 }
 
 static void avic_physid_shadow_entry_create(struct kvm *kvm,
@@ -131,7 +140,11 @@ static void avic_physid_shadow_entry_remove(struct kvm *kvm,
 					   int n)
 {
 	struct avic_physid_entry_descr *e = &t->entries[n];
+	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
 	hpa_t backing_page_hpa;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
 
 	if (!test_and_clear_bit(n, t->valid_entires))
 		WARN_ON(1);
@@ -147,8 +160,49 @@ static void avic_physid_shadow_entry_remove(struct kvm *kvm,
 
 	e->gentry = 0;
 	*e->sentry = 0;
+
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
 }
 
+static void avic_update_peer_physid_entries(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * Update all shadow physid tables which contain entries
+	 * which reference this vCPU with its new physical location
+	 */
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+	struct avic_physid_entry_descr *e;
+	int updated_nentries = 0;
+	int l0_apicid = -1;
+	unsigned long flags;
+	bool new_active = cpu != -1;
+
+	if (cpu != -1)
+		l0_apicid = kvm_cpu_get_apicid(cpu);
+
+	raw_spin_lock_irqsave(&kvm_svm->avic.table_entries_lock, flags);
+
+	list_for_each_entry(e, &vcpu_svm->nested.physid_ref_entries, link) {
+		u64 sentry = READ_ONCE(*e->sentry);
+		u64 old_sentry = sentry;
+
+		physid_entry_set_apicid(&sentry, l0_apicid);
+
+		if (sentry != old_sentry) {
+			updated_nentries++;
+			WRITE_ONCE(*e->sentry, sentry);
+		}
+	}
+
+	if (updated_nentries)
+		trace_kvm_avic_physid_update_vcpu_host(vcpu->vcpu_id,
+						       l0_apicid, updated_nentries);
+
+	vcpu_svm->nested_avic_active = new_active;
+
+	raw_spin_unlock_irqrestore(&kvm_svm->avic.table_entries_lock, flags);
+}
 
 static bool
 avic_physid_shadow_table_setup_write_tracking(struct kvm *kvm,
@@ -603,6 +657,7 @@ int avic_vm_init(struct kvm *kvm)
 	hash_add(svm_vm_data_hash, &avic->hnode, avic->vm_id);
 	spin_unlock_irqrestore(&svm_vm_data_hash_lock, flags);
 
+	raw_spin_lock_init(&avic->table_entries_lock);
 	mutex_init(&avic->tables_lock);
 	INIT_LIST_HEAD(&avic->physid_tables);
 
@@ -1428,9 +1483,51 @@ static void avic_vcpu_load(struct kvm_vcpu *vcpu)
 static void avic_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	preempt_disable();
-
 	__avic_vcpu_put(vcpu);
+	preempt_enable();
+}
+
 
+void __nested_avic_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	lockdep_assert_preemption_disabled();
+
+	/*
+	 * For the same reason as in __avic_vcpu_load there is no
+	 * need to load nested AVIC when this vCPU is blocking
+	 */
+	if (kvm_vcpu_is_blocking(vcpu))
+		return;
+
+	if (svm->nested.initialized)
+		avic_update_peer_physid_entries(vcpu, cpu);
+}
+
+void __nested_avic_put(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	lockdep_assert_preemption_disabled();
+
+	if (svm->nested.initialized)
+		avic_update_peer_physid_entries(vcpu, -1);
+}
+
+void nested_avic_load(struct kvm_vcpu *vcpu)
+{
+	int cpu = get_cpu();
+
+	WARN_ON(cpu != vcpu->cpu);
+	__nested_avic_load(vcpu, cpu);
+	put_cpu();
+}
+
+void nested_avic_put(struct kvm_vcpu *vcpu)
+{
+	preempt_disable();
+	__nested_avic_put(vcpu);
 	preempt_enable();
 }
 
@@ -1468,9 +1565,6 @@ void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
-	if (!kvm_vcpu_apicv_active(vcpu))
-		return;
-
        /*
         * Unload the AVIC when the vCPU is about to block, _before_
         * the vCPU actually blocks.
@@ -1484,13 +1578,16 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
         * IRR and reading IsRunning; the lack of this barrier might be
         * the cause of errata #1235).
         */
-	avic_vcpu_put(vcpu);
+	if (kvm_vcpu_apicv_active(vcpu))
+		avic_vcpu_put(vcpu);
+
+	nested_avic_put(vcpu);
 }
 
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
-	if (!kvm_vcpu_apicv_active(vcpu))
-		return;
+	if (kvm_vcpu_apicv_active(vcpu))
+		avic_vcpu_load(vcpu);
 
-	avic_vcpu_load(vcpu);
+	nested_avic_load(vcpu);
 }
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 75b4f3ac8b1a0..76fbee2c8c5d7 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1302,6 +1302,8 @@ static int svm_vcpu_create(struct kvm_vcpu *vcpu)
 
 	svm->guest_state_loaded = false;
 
+	INIT_LIST_HEAD(&svm->nested.physid_ref_entries);
+
 	return 0;
 
 error_free_vmsa_page:
@@ -1391,8 +1393,11 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		sd->current_vmcb = svm->vmcb;
 		indirect_branch_prediction_barrier();
 	}
+
 	if (kvm_vcpu_apicv_active(vcpu))
 		__avic_vcpu_load(vcpu, cpu);
+
+	__nested_avic_load(vcpu, cpu);
 }
 
 static void svm_vcpu_put(struct kvm_vcpu *vcpu)
@@ -1400,6 +1405,8 @@ static void svm_vcpu_put(struct kvm_vcpu *vcpu)
 	if (kvm_vcpu_apicv_active(vcpu))
 		__avic_vcpu_put(vcpu);
 
+	__nested_avic_put(vcpu);
+
 	svm_prepare_host_switch(vcpu);
 
 	++vcpu->stat.host_state_reload;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index fc15e1f938793..401449dbce65d 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -99,6 +99,7 @@ struct kvm_svm_avic {
 	struct page *physical_id_table_page;
 	struct hlist_node hnode;
 
+	raw_spinlock_t table_entries_lock;
 	struct mutex tables_lock;
 
 	/* List of all shadow tables */
@@ -244,6 +245,9 @@ struct svm_nested_state {
 	 * on its side.
 	 */
 	bool force_msr_bitmap_recalc;
+
+	/* All AVIC shadow PID table entry descriptors that reference this vCPU */
+	struct list_head physid_ref_entries;
 };
 
 struct vcpu_sev_es_state {
@@ -311,6 +315,7 @@ struct vcpu_svm {
 	u32 dfr_reg;
 	struct page *avic_backing_page;
 	u64 *avic_physical_id_cache;
+	bool nested_avic_active;
 
 	/*
 	 * Per-vcpu list of struct amd_svm_iommu_ir:
@@ -678,6 +683,11 @@ int avic_unaccelerated_access_interception(struct kvm_vcpu *vcpu);
 int avic_init_vcpu(struct vcpu_svm *svm);
 void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
 void __avic_vcpu_put(struct kvm_vcpu *vcpu);
+void __nested_avic_load(struct kvm_vcpu *vcpu, int cpu);
+void __nested_avic_put(struct kvm_vcpu *vcpu);
+void nested_avic_load(struct kvm_vcpu *vcpu);
+void nested_avic_put(struct kvm_vcpu *vcpu);
+
 void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu);
 void avic_set_virtual_apic_mode(struct kvm_vcpu *vcpu);
 void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu);
-- 
2.26.3

