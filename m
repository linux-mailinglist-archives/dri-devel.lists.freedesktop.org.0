Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21651237D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A1210E56E;
	Wed, 27 Apr 2022 20:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E110E545
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnDGED1eoKg8mWDlJ24GzZnh49DIKVV+Swzkc6d/KD8=;
 b=FdNhWuxnsL3yHh7BDBO6fhFIt9HGq8IP4UApAc6sqmDF6OHHtOGDnrXrwuQijZYW2kXEdm
 4dkYl94WFYEqABOgedIL43XDOjsU13dTndPG/QfQTMYDEAb0TRbF7LMheWlhzorh6fn2Ow
 ZzKDd4DUPuvlbkPMYfNdj6LadBhatl8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-ToKsD41uOPSms3Wrh18dDQ-1; Wed, 27 Apr 2022 16:04:51 -0400
X-MC-Unique: ToKsD41uOPSms3Wrh18dDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E85F381079E;
 Wed, 27 Apr 2022 20:04:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 536F89E82;
 Wed, 27 Apr 2022 20:04:44 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 13/19] KVM: x86: nSVM: wire nested AVIC to nested guest
 entry/exit
Date: Wed, 27 Apr 2022 23:03:08 +0300
Message-Id: <20220427200314.276673-14-mlevitsk@redhat.com>
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

  * Passthrough guest's avic pages that can be passed through
     - logical id table
     - avic backing page

  * Passthrough AVIC's mmio range
     - nested guest is responsible for marking it RW
       in its NPT tables.

  * Write track physical id page
     - all peer's avic backing pages are pinned
       as long as the shadow table is not invalidated/
       freed.

  * Cache guest AVIC settings.

  * Add SDM mandated changes to emulated VM enter/exit.

Note that nested AVIC still can't be enabled, thus this
code has no effect yet.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c   |  51 ++++++++++++++-
 arch/x86/kvm/svm/nested.c | 127 +++++++++++++++++++++++++++++++++++++-
 arch/x86/kvm/svm/svm.c    |   2 +
 arch/x86/kvm/svm/svm.h    |  24 +++++++
 4 files changed, 199 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 34da9fabd5194..e6ec525a88625 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -59,6 +59,18 @@ static inline struct kvm_vcpu *avic_vcpu_by_l1_apicid(struct kvm *kvm,
 	return kvm_get_vcpu_by_id(kvm, l1_apicid);
 }
 
+static u32 nested_avic_get_reg(struct kvm_vcpu *vcpu, int reg_off)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	void *nested_apic_regs = svm->nested.l2_apic_access_page.hva;
+
+	if (WARN_ON_ONCE(!nested_apic_regs))
+		return 0;
+
+	return *((u32 *) (nested_apic_regs + reg_off));
+}
+
 static void avic_physid_shadow_entry_set_vcpu(struct kvm *kvm,
 					      struct avic_physid_table *t,
 					      int n,
@@ -531,6 +543,20 @@ static void avic_physid_shadow_table_flush_memslot(struct kvm *kvm,
 	mutex_unlock(&kvm_svm->avic.tables_lock);
 }
 
+void avic_free_nested(struct kvm_vcpu *vcpu)
+{
+	struct avic_physid_table *t;
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	t = svm->nested.l2_physical_id_table;
+	if (t) {
+		avic_physid_shadow_table_put(vcpu->kvm, t);
+		svm->nested.l2_physical_id_table = NULL;
+	}
+
+	kvm_vcpu_unmap(vcpu, &svm->nested.l2_apic_access_page, true);
+	kvm_vcpu_unmap(vcpu, &svm->nested.l2_logical_id_table, true);
+}
 
 /*
  * This is a wrapper of struct amd_iommu_ir_data.
@@ -586,10 +612,18 @@ void avic_vm_destroy(struct kvm *kvm)
 {
 	unsigned long flags;
 	struct kvm_svm_avic *avic = &to_kvm_svm(kvm)->avic;
+	unsigned long i;
+	struct kvm_vcpu *vcpu;
 
 	if (!enable_apicv)
 		return;
 
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		vcpu_load(vcpu);
+		avic_free_nested(vcpu);
+		vcpu_put(vcpu);
+	}
+
 	if (avic->logical_id_table_page)
 		__free_page(avic->logical_id_table_page);
 	if (avic->physical_id_table_page)
@@ -1501,7 +1535,7 @@ void __nested_avic_load(struct kvm_vcpu *vcpu, int cpu)
 	if (kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	if (svm->nested.initialized)
+	if (svm->nested.initialized && svm->avic_enabled)
 		avic_update_peer_physid_entries(vcpu, cpu);
 }
 
@@ -1511,7 +1545,7 @@ void __nested_avic_put(struct kvm_vcpu *vcpu)
 
 	lockdep_assert_preemption_disabled();
 
-	if (svm->nested.initialized)
+	if (svm->nested.initialized && svm->avic_enabled)
 		avic_update_peer_physid_entries(vcpu, -1);
 }
 
@@ -1591,3 +1625,16 @@ void avic_vcpu_unblocking(struct kvm_vcpu *vcpu)
 
 	nested_avic_load(vcpu);
 }
+
+bool avic_nested_has_interrupt(struct kvm_vcpu *vcpu)
+{
+	int off;
+
+	if (!nested_avic_in_use(vcpu))
+		return false;
+
+	for (off = 0x10; off < 0x80; off += 0x10)
+		if (nested_avic_get_reg(vcpu, APIC_IRR + off))
+			return true;
+	return false;
+}
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index bed5e1692cef0..eb5e9b600e052 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -387,6 +387,14 @@ void __nested_copy_vmcb_control_to_cache(struct kvm_vcpu *vcpu,
 		memcpy(to->reserved_sw, from->reserved_sw,
 		       sizeof(struct hv_enlightenments));
 	}
+
+	/* copy avic related settings only when it is enabled */
+	if (from->int_ctl & AVIC_ENABLE_MASK) {
+		to->avic_vapic_bar      = from->avic_vapic_bar;
+		to->avic_backing_page   = from->avic_backing_page;
+		to->avic_logical_id     = from->avic_logical_id;
+		to->avic_physical_id    = from->avic_physical_id;
+	}
 }
 
 void nested_copy_vmcb_control_to_cache(struct vcpu_svm *svm,
@@ -539,6 +547,79 @@ void nested_vmcb02_compute_g_pat(struct vcpu_svm *svm)
 	svm->nested.vmcb02.ptr->save.g_pat = svm->vmcb01.ptr->save.g_pat;
 }
 
+
+static bool nested_vmcb02_prepare_avic(struct vcpu_svm *svm)
+{
+	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
+	struct avic_physid_table *t = svm->nested.l2_physical_id_table;
+	gfn_t physid_gfn;
+	int physid_nentries;
+
+	if (!nested_avic_in_use(&svm->vcpu))
+		return true;
+
+	if (svm->vcpu.kvm->arch.apic_id_changed) {
+		/* if the guest played with apic id, it will keep both pieces */
+		kvm_vm_bugged(svm->vcpu.kvm);
+		return false;
+	}
+
+	if (kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(svm->nested.ctl.avic_backing_page & AVIC_HPA_MASK),
+			  &svm->nested.l2_apic_access_page))
+		goto error;
+
+	if (kvm_vcpu_map(&svm->vcpu, gpa_to_gfn(svm->nested.ctl.avic_logical_id & AVIC_HPA_MASK),
+			  &svm->nested.l2_logical_id_table))
+		goto error_unmap_backing_page;
+
+	physid_gfn = gpa_to_gfn(svm->nested.ctl.avic_physical_id &
+		     AVIC_HPA_MASK);
+	physid_nentries = svm->nested.ctl.avic_physical_id &
+			AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
+
+	if (t && t->gfn != physid_gfn) {
+		avic_physid_shadow_table_put(svm->vcpu.kvm, t);
+		svm->nested.l2_physical_id_table = NULL;
+	}
+
+	if (!svm->nested.l2_physical_id_table) {
+		t = avic_physid_shadow_table_get(&svm->vcpu, physid_gfn);
+		if (!t)
+			goto error_unmap_logical_id_table;
+		svm->nested.l2_physical_id_table = t;
+	}
+
+	atomic_inc(&t->usecount);
+
+	if (t->nentries < physid_nentries)
+		if (avic_physid_shadow_table_sync(&svm->vcpu, t, physid_nentries) < 0)
+			goto error_put_table;
+
+	/* Everything is setup, we can enable AVIC */
+	vmcb02->control.avic_vapic_bar =
+		svm->nested.ctl.avic_vapic_bar & VMCB_AVIC_APIC_BAR_MASK;
+	vmcb02->control.avic_backing_page =
+		pfn_to_hpa(svm->nested.l2_apic_access_page.pfn);
+	vmcb02->control.avic_logical_id =
+		pfn_to_hpa(svm->nested.l2_logical_id_table.pfn);
+	vmcb02->control.avic_physical_id =
+		(svm->nested.l2_physical_id_table->shadow_table_hpa) | physid_nentries;
+
+	vmcb02->control.int_ctl |= AVIC_ENABLE_MASK;
+	vmcb_mark_dirty(vmcb02, VMCB_AVIC);
+	return true;
+
+error_put_table:
+	avic_physid_shadow_table_put(svm->vcpu.kvm, t);
+	svm->nested.l2_physical_id_table = NULL;
+error_unmap_logical_id_table:
+	kvm_vcpu_unmap(&svm->vcpu, &svm->nested.l2_logical_id_table, false);
+error_unmap_backing_page:
+	kvm_vcpu_unmap(&svm->vcpu, &svm->nested.l2_apic_access_page, false);
+error:
+	return false;
+}
+
 static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12)
 {
 	bool new_vmcb12 = false;
@@ -627,6 +708,17 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 	else
 		int_ctl_vmcb01_bits |= (V_GIF_MASK | V_GIF_ENABLE_MASK);
 
+	if (nested_avic_in_use(vcpu)) {
+
+		/*
+		 * Enabling AVIC implicitly disables the
+		 * V_IRQ, V_INTR_PRIO, V_IGN_TPR, and V_INTR_VECTOR
+		 * fields in the VMCB Control Word
+		 */
+		int_ctl_vmcb12_bits &= ~V_IRQ_INJECTION_BITS_MASK;
+	}
+
+
 	/* Copied from vmcb01.  msrpm_base can be overwritten later.  */
 	vmcb02->control.nested_ctl = vmcb01->control.nested_ctl;
 	vmcb02->control.iopm_base_pa = vmcb01->control.iopm_base_pa;
@@ -829,7 +921,10 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 	if (enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12, true))
 		goto out_exit_err;
 
-	if (nested_svm_vmrun_msrpm(svm))
+	if (!nested_svm_vmrun_msrpm(svm))
+		goto out_exit_err;
+
+	if (nested_vmcb02_prepare_avic(svm))
 		goto out;
 
 out_exit_err:
@@ -956,6 +1051,15 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 
 	nested_svm_copy_common_state(svm->nested.vmcb02.ptr, svm->vmcb01.ptr);
 
+	if (nested_avic_in_use(vcpu)) {
+		struct avic_physid_table *t = svm->nested.l2_physical_id_table;
+
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_apic_access_page, true);
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_logical_id_table, true);
+
+		atomic_dec(&t->usecount);
+	}
+
 	svm_switch_vmcb(svm, &svm->vmcb01);
 
 	if (unlikely(svm->lbrv_enabled && (svm->nested.ctl.virt_ext & LBR_CTL_ENABLE_MASK))) {
@@ -1069,6 +1173,7 @@ int svm_allocate_nested(struct vcpu_svm *svm)
 	svm_vcpu_init_msrpm(&svm->vcpu, svm->nested.msrpm);
 
 	svm->nested.initialized = true;
+	nested_avic_load(&svm->vcpu);
 	return 0;
 
 err_free_vmcb02:
@@ -1078,6 +1183,8 @@ int svm_allocate_nested(struct vcpu_svm *svm)
 
 void svm_free_nested(struct vcpu_svm *svm)
 {
+	struct kvm_vcpu *vcpu = &svm->vcpu;
+
 	if (!svm->nested.initialized)
 		return;
 
@@ -1096,6 +1203,11 @@ void svm_free_nested(struct vcpu_svm *svm)
 	 */
 	svm->nested.last_vmcb12_gpa = INVALID_GPA;
 
+	if (svm->avic_enabled) {
+		nested_avic_put(vcpu);
+		avic_free_nested(vcpu);
+	}
+
 	svm->nested.initialized = false;
 }
 
@@ -1116,8 +1228,10 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
 
 		nested_svm_uninit_mmu_context(vcpu);
 		vmcb_mark_all_dirty(svm->vmcb);
-	}
 
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_apic_access_page, true);
+		kvm_vcpu_unmap(vcpu, &svm->nested.l2_logical_id_table, true);
+	}
 	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 }
 
@@ -1423,6 +1537,13 @@ static void nested_copy_vmcb_cache_to_control(struct vmcb_control_area *dst,
 	dst->pause_filter_count   = from->pause_filter_count;
 	dst->pause_filter_thresh  = from->pause_filter_thresh;
 	/* 'clean' and 'reserved_sw' are not changed by KVM */
+
+	if (from->int_ctl & AVIC_ENABLE_MASK) {
+		dst->avic_vapic_bar      = from->avic_vapic_bar;
+		dst->avic_backing_page   = from->avic_backing_page;
+		dst->avic_logical_id     = from->avic_logical_id;
+		dst->avic_physical_id    = from->avic_physical_id;
+	}
 }
 
 static int svm_get_nested_state(struct kvm_vcpu *vcpu,
@@ -1644,7 +1765,7 @@ static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
 		if (CC(!load_pdptrs(vcpu, vcpu->arch.cr3)))
 			return false;
 
-	if (!nested_svm_vmrun_msrpm(svm)) {
+	if (!nested_svm_vmrun_msrpm(svm) || !nested_vmcb02_prepare_avic(svm)) {
 		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		vcpu->run->internal.suberror =
 			KVM_INTERNAL_ERROR_EMULATION;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 76fbee2c8c5d7..a39bb0b27a51d 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4680,6 +4680,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.refresh_apicv_exec_ctrl = avic_refresh_apicv_exec_ctrl,
 	.check_apicv_inhibit_reasons = avic_check_apicv_inhibit_reasons,
 	.apicv_post_state_restore = avic_apicv_post_state_restore,
+	.guest_apic_has_interrupt = avic_nested_has_interrupt,
 
 	.get_mt_mask = svm_get_mt_mask,
 	.get_exit_info = svm_get_exit_info,
@@ -4931,6 +4932,7 @@ static __init int svm_hardware_setup(void)
 		svm_x86_ops.vcpu_blocking = NULL;
 		svm_x86_ops.vcpu_unblocking = NULL;
 		svm_x86_ops.vcpu_get_apicv_inhibit_reasons = NULL;
+		svm_x86_ops.guest_apic_has_interrupt = NULL;
 	}
 
 	if (vls) {
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 401449dbce65d..17fcc09cf4be1 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -167,6 +167,11 @@ struct vmcb_ctrl_area_cached {
 	u64 virt_ext;
 	u32 clean;
 	u8 reserved_sw[32];
+
+	u64 avic_vapic_bar;
+	u64 avic_backing_page;
+	u64 avic_logical_id;
+	u64 avic_physical_id;
 };
 
 struct avic_physid_entry_descr {
@@ -248,6 +253,10 @@ struct svm_nested_state {
 
 	/* All AVIC shadow PID table entry descriptors that reference this vCPU */
 	struct list_head physid_ref_entries;
+
+	struct kvm_host_map l2_apic_access_page;
+	struct kvm_host_map l2_logical_id_table;
+	struct avic_physid_table *l2_physical_id_table;
 };
 
 struct vcpu_sev_es_state {
@@ -310,6 +319,7 @@ struct vcpu_svm {
 	bool pause_filter_enabled         : 1;
 	bool pause_threshold_enabled      : 1;
 	bool vgif_enabled                 : 1;
+	bool avic_enabled                 : 1;
 
 	u32 ldr_reg;
 	u32 dfr_reg;
@@ -701,6 +711,8 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
 void avic_ring_doorbell(struct kvm_vcpu *vcpu);
 unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu);
+void avic_free_nested(struct kvm_vcpu *vcpu);
+bool avic_nested_has_interrupt(struct kvm_vcpu *vcpu);
 
 struct avic_physid_table *
 avic_physid_shadow_table_get(struct kvm_vcpu *vcpu, gfn_t gfn);
@@ -708,6 +720,18 @@ void avic_physid_shadow_table_put(struct kvm *kvm, struct avic_physid_table *t);
 int avic_physid_shadow_table_sync(struct kvm_vcpu *vcpu,
 				  struct avic_physid_table *t, int nentries);
 
+static inline bool nested_avic_in_use(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+
+	if (!vcpu_svm->avic_enabled)
+		return false;
+
+	if (!nested_npt_enabled(vcpu_svm))
+		return false;
+
+	return vcpu_svm->nested.ctl.int_ctl & AVIC_ENABLE_MASK;
+}
 
 #define INVALID_BACKING_PAGE	(~(u64)0)
 
-- 
2.26.3

