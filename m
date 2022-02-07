Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D74AC3CB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6F112472;
	Mon,  7 Feb 2022 15:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C472112465
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644248083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WIO5n6+3jqzKnCirxzx86dJnJZyXVHjiDs7Tj6xNnY=;
 b=DYrFdqE5DqHnWsAGMpYpUuLAD2Xxv0AUvjP50LloLQfxwgkChU5MI7FVSb+wvmPD+ewp6V
 NYRJJp6FVfhVkDv2HRrpxrUGN/fHHW1wTQSFK43JTnvhyYOgwmfBrzBqBcItRXhbkAdjVp
 2v82nyxtKC3VeStcby714gXqGO1S2CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-JpLtitjQOiWSR0ljzuCs7g-1; Mon, 07 Feb 2022 10:34:40 -0500
X-MC-Unique: JpLtitjQOiWSR0ljzuCs7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1648B85EE60;
 Mon,  7 Feb 2022 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 475ED5E495;
 Mon,  7 Feb 2022 15:34:29 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 30/30] KVM: x86: get rid of KVM_REQ_GET_NESTED_STATE_PAGES
Date: Mon,  7 Feb 2022 17:28:47 +0200
Message-Id: <20220207152847.836777-31-mlevitsk@redhat.com>
In-Reply-To: <20220207152847.836777-1-mlevitsk@redhat.com>
References: <20220207152847.836777-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Wanpeng Li <wanpengli@tencent.com>, David Airlie <airlied@linux.ie>,
 "Chang S. Bae" <chang.seok.bae@intel.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 "open list:X86 ARCHITECTURE 32-BIT AND 64-BIT" <linux-kernel@vger.kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Tony Luck <tony.luck@intel.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>,
 "open list:INTEL GVT-g DRIVERS Intel GPU Virtualization"
 <intel-gvt-dev@lists.freedesktop.org>,
 "open list:INTEL DRM DRIVERS excluding Poulsbo, Moorestow..., 
 Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
 Daniel Vetter <daniel@ffwll.ch>, \"H. Peter Anvin\" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>" <intel-gfx@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As it turned out this request isn't really needed,
and it complicates the nested migration.

In theory this patch can break userspace if
userspace relies on updating KVM's memslots
after setting nested state but there is little reason
for it to rely on this.

However this is undocumented and there is a good chance
that no userspace relies on this, thus
just try to remove this code.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h |  5 +-
 arch/x86/kvm/hyperv.c           |  4 ++
 arch/x86/kvm/svm/nested.c       | 50 ++++-------------
 arch/x86/kvm/svm/svm.c          |  2 +-
 arch/x86/kvm/svm/svm.h          |  2 +-
 arch/x86/kvm/vmx/nested.c       | 99 +++++++++------------------------
 arch/x86/kvm/x86.c              |  6 --
 7 files changed, 45 insertions(+), 123 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 446ee29e6cc99..fc2d5628ad930 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -92,7 +92,6 @@
 #define KVM_REQ_HV_EXIT			KVM_ARCH_REQ(21)
 #define KVM_REQ_HV_STIMER		KVM_ARCH_REQ(22)
 #define KVM_REQ_LOAD_EOI_EXITMAP	KVM_ARCH_REQ(23)
-#define KVM_REQ_GET_NESTED_STATE_PAGES	KVM_ARCH_REQ(24)
 #define KVM_REQ_APICV_UPDATE \
 	KVM_ARCH_REQ_FLAGS(25, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_TLB_FLUSH_CURRENT	KVM_ARCH_REQ(26)
@@ -1519,12 +1518,14 @@ struct kvm_x86_nested_ops {
 	int (*set_state)(struct kvm_vcpu *vcpu,
 			 struct kvm_nested_state __user *user_kvm_nested_state,
 			 struct kvm_nested_state *kvm_state);
-	bool (*get_nested_state_pages)(struct kvm_vcpu *vcpu);
 	int (*write_log_dirty)(struct kvm_vcpu *vcpu, gpa_t l2_gpa);
 
 	int (*enable_evmcs)(struct kvm_vcpu *vcpu,
 			    uint16_t *vmcs_version);
 	uint16_t (*get_evmcs_version)(struct kvm_vcpu *vcpu);
+
+	bool (*get_evmcs_page)(struct kvm_vcpu *vcpu);
+
 };
 
 struct kvm_x86_init_ops {
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index dac41784f2b87..d297d102c0910 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -1497,6 +1497,10 @@ static int kvm_hv_set_msr(struct kvm_vcpu *vcpu, u32 msr, u64 data, bool host)
 					    gfn_to_gpa(gfn) | KVM_MSR_ENABLED,
 					    sizeof(struct hv_vp_assist_page)))
 			return 1;
+
+		if (host && kvm_x86_ops.nested_ops->get_evmcs_page)
+			if (!kvm_x86_ops.nested_ops->get_evmcs_page(vcpu))
+				return 1;
 		break;
 	}
 	case HV_X64_MSR_EOI:
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index a426d4d3dcd82..ac813ad83d784 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -670,7 +670,7 @@ static void nested_svm_copy_common_state(struct vmcb *from_vmcb, struct vmcb *to
 }
 
 int enter_svm_guest_mode(struct kvm_vcpu *vcpu, u64 vmcb12_gpa,
-			 struct vmcb *vmcb12, bool from_vmrun)
+			 struct vmcb *vmcb12)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 	int ret;
@@ -700,15 +700,13 @@ int enter_svm_guest_mode(struct kvm_vcpu *vcpu, u64 vmcb12_gpa,
 	nested_vmcb02_prepare_save(svm, vmcb12);
 
 	ret = nested_svm_load_cr3(&svm->vcpu, svm->nested.save.cr3,
-				  nested_npt_enabled(svm), from_vmrun);
+				  nested_npt_enabled(svm), true);
 	if (ret)
 		return ret;
 
 	if (!npt_enabled)
 		vcpu->arch.mmu->inject_page_fault = svm_inject_page_fault_nested;
 
-	if (!from_vmrun)
-		kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 
 	svm_set_gif(svm, true);
 
@@ -779,7 +777,7 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 
 	svm->nested.nested_run_pending = 1;
 
-	if (enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12, true))
+	if (enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12))
 		goto out_exit_err;
 
 	if (nested_svm_vmrun_msrpm(svm))
@@ -863,8 +861,6 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 	svm->nested.vmcb12_gpa = 0;
 	WARN_ON_ONCE(svm->nested.nested_run_pending);
 
-	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
-
 	/* in case we halted in L2 */
 	svm->vcpu.arch.mp_state = KVM_MP_STATE_RUNNABLE;
 
@@ -1069,8 +1065,6 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
 		nested_svm_uninit_mmu_context(vcpu);
 		vmcb_mark_all_dirty(svm->vmcb);
 	}
-
-	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 }
 
 static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
@@ -1562,53 +1556,31 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	 */
 
 	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
-				  nested_npt_enabled(svm), false);
+				  nested_npt_enabled(svm), !vcpu->arch.pdptrs_from_userspace);
 	if (WARN_ON_ONCE(ret))
 		goto out_free;
 
 
-	kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
-	ret = 0;
-out_free:
-	kfree(save);
-	kfree(ctl);
-
-	return ret;
-}
-
-static bool svm_get_nested_state_pages(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_svm *svm = to_svm(vcpu);
-
-	if (WARN_ON(!is_guest_mode(vcpu)))
-		return true;
-
-	if (!vcpu->arch.pdptrs_from_userspace &&
-	    !nested_npt_enabled(svm) && is_pae_paging(vcpu))
-		/*
-		 * Reload the guest's PDPTRs since after a migration
-		 * the guest CR3 might be restored prior to setting the nested
-		 * state which can lead to a load of wrong PDPTRs.
-		 */
-		if (CC(!load_pdptrs(vcpu, vcpu->arch.cr3)))
-			return false;
-
 	if (!nested_svm_vmrun_msrpm(svm)) {
 		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		vcpu->run->internal.suberror =
 			KVM_INTERNAL_ERROR_EMULATION;
 		vcpu->run->internal.ndata = 0;
-		return false;
+		goto out_free;
 	}
 
-	return true;
+	ret = 0;
+out_free:
+	kfree(save);
+	kfree(ctl);
+	return ret;
 }
 
+
 struct kvm_x86_nested_ops svm_nested_ops = {
 	.leave_nested = svm_leave_nested,
 	.check_events = svm_check_nested_events,
 	.triple_fault = nested_svm_triple_fault,
-	.get_nested_state_pages = svm_get_nested_state_pages,
 	.get_state = svm_get_nested_state,
 	.set_state = svm_set_nested_state,
 };
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index afa4116ea938c..6d6421e0cadcd 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4498,7 +4498,7 @@ static int svm_leave_smm(struct kvm_vcpu *vcpu, const char *smstate)
 	vmcb12 = map.hva;
 	nested_copy_vmcb_control_to_cache(svm, &vmcb12->control);
 	nested_copy_vmcb_save_to_cache(svm, &vmcb12->save);
-	ret = enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12, false);
+	ret = enter_svm_guest_mode(vcpu, vmcb12_gpa, vmcb12);
 
 	if (ret)
 		goto unmap_save;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index dd3671d77258b..e2eb91851e922 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -551,7 +551,7 @@ static inline bool nested_exit_on_nmi(struct vcpu_svm *svm)
 }
 
 int enter_svm_guest_mode(struct kvm_vcpu *vcpu,
-			 u64 vmcb_gpa, struct vmcb *vmcb12, bool from_vmrun);
+			 u64 vmcb_gpa, struct vmcb *vmcb12);
 void svm_leave_nested(struct kvm_vcpu *vcpu);
 void svm_free_nested(struct vcpu_svm *svm);
 int svm_allocate_nested(struct vcpu_svm *svm);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index e89b32b1d9efb..19331f742662d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -294,8 +294,6 @@ static void free_nested(struct kvm_vcpu *vcpu)
 	if (!vmx->nested.vmxon && !vmx->nested.smm.vmxon)
 		return;
 
-	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
-
 	vmx->nested.vmxon = false;
 	vmx->nested.smm.vmxon = false;
 	vmx->nested.vmxon_ptr = INVALID_GPA;
@@ -2593,7 +2591,8 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 
 	/* Shadow page tables on either EPT or shadow page tables. */
 	if (nested_vmx_load_cr3(vcpu, vmcs12->guest_cr3, nested_cpu_has_ept(vmcs12),
-				from_vmentry, entry_failure_code))
+				from_vmentry || !vcpu->arch.pdptrs_from_userspace,
+				entry_failure_code))
 		return -EINVAL;
 
 	/*
@@ -3125,7 +3124,7 @@ static int nested_vmx_check_vmentry_hw(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-static bool nested_get_evmcs_page(struct kvm_vcpu *vcpu)
+bool nested_get_evmcs_page(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
@@ -3161,18 +3160,6 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
 	struct page *page;
 	u64 hpa;
 
-	if (!vcpu->arch.pdptrs_from_userspace &&
-	    !nested_cpu_has_ept(vmcs12) && is_pae_paging(vcpu)) {
-		/*
-		 * Reload the guest's PDPTRs since after a migration
-		 * the guest CR3 might be restored prior to setting the nested
-		 * state which can lead to a load of wrong PDPTRs.
-		 */
-		if (CC(!load_pdptrs(vcpu, vcpu->arch.cr3)))
-			return false;
-	}
-
-
 	if (nested_cpu_has2(vmcs12, SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)) {
 		/*
 		 * Translate L1 physical address to host physical
@@ -3254,25 +3241,6 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
 	return true;
 }
 
-static bool vmx_get_nested_state_pages(struct kvm_vcpu *vcpu)
-{
-	if (!nested_get_evmcs_page(vcpu)) {
-		pr_debug_ratelimited("%s: enlightened vmptrld failed\n",
-				     __func__);
-		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
-		vcpu->run->internal.suberror =
-			KVM_INTERNAL_ERROR_EMULATION;
-		vcpu->run->internal.ndata = 0;
-
-		return false;
-	}
-
-	if (is_guest_mode(vcpu) && !nested_get_vmcs12_pages(vcpu))
-		return false;
-
-	return true;
-}
-
 static int nested_vmx_write_pml_buffer(struct kvm_vcpu *vcpu, gpa_t gpa)
 {
 	struct vmcs12 *vmcs12;
@@ -3402,12 +3370,12 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 
 	prepare_vmcs02_early(vmx, &vmx->vmcs01, vmcs12);
 
-	if (from_vmentry) {
-		if (unlikely(!nested_get_vmcs12_pages(vcpu))) {
-			vmx_switch_vmcs(vcpu, &vmx->vmcs01);
-			return NVMX_VMENTRY_KVM_INTERNAL_ERROR;
-		}
+	if (unlikely(!nested_get_vmcs12_pages(vcpu))) {
+		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
+		return NVMX_VMENTRY_KVM_INTERNAL_ERROR;
+	}
 
+	if (from_vmentry) {
 		if (nested_vmx_check_vmentry_hw(vcpu)) {
 			vmx_switch_vmcs(vcpu, &vmx->vmcs01);
 			return NVMX_VMENTRY_VMFAIL;
@@ -3429,24 +3397,14 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
 		goto vmentry_fail_vmexit_guest_mode;
 	}
 
-	if (from_vmentry) {
-		failed_index = nested_vmx_load_msr(vcpu,
-						   vmcs12->vm_entry_msr_load_addr,
-						   vmcs12->vm_entry_msr_load_count);
-		if (failed_index) {
-			exit_reason.basic = EXIT_REASON_MSR_LOAD_FAIL;
-			vmcs12->exit_qualification = failed_index;
-			goto vmentry_fail_vmexit_guest_mode;
-		}
-	} else {
-		/*
-		 * The MMU is not initialized to point at the right entities yet and
-		 * "get pages" would need to read data from the guest (i.e. we will
-		 * need to perform gpa to hpa translation). Request a call
-		 * to nested_get_vmcs12_pages before the next VM-entry.  The MSRs
-		 * have already been set at vmentry time and should not be reset.
-		 */
-		kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
+
+	failed_index = nested_vmx_load_msr(vcpu,
+					   vmcs12->vm_entry_msr_load_addr,
+					   vmcs12->vm_entry_msr_load_count);
+	if (failed_index) {
+		exit_reason.basic = EXIT_REASON_MSR_LOAD_FAIL;
+		vmcs12->exit_qualification = failed_index;
+		goto vmentry_fail_vmexit_guest_mode;
 	}
 
 	/*
@@ -4516,16 +4474,6 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 	/* Similarly, triple faults in L2 should never escape. */
 	WARN_ON_ONCE(kvm_check_request(KVM_REQ_TRIPLE_FAULT, vcpu));
 
-	if (kvm_check_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu)) {
-		/*
-		 * KVM_REQ_GET_NESTED_STATE_PAGES is also used to map
-		 * Enlightened VMCS after migration and we still need to
-		 * do that when something is forcing L2->L1 exit prior to
-		 * the first L2 run.
-		 */
-		(void)nested_get_evmcs_page(vcpu);
-	}
-
 	/* Service pending TLB flush requests for L2 before switching to L1. */
 	kvm_service_local_tlb_flush_requests(vcpu);
 
@@ -6382,14 +6330,17 @@ static int vmx_set_nested_state(struct kvm_vcpu *vcpu,
 
 		set_current_vmptr(vmx, kvm_state->hdr.vmx.vmcs12_pa);
 	} else if (kvm_state->flags & KVM_STATE_NESTED_EVMCS) {
+
+		vmx->nested.hv_evmcs_vmptr = EVMPTR_MAP_PENDING;
+
 		/*
 		 * nested_vmx_handle_enlightened_vmptrld() cannot be called
-		 * directly from here as HV_X64_MSR_VP_ASSIST_PAGE may not be
-		 * restored yet. EVMCS will be mapped from
-		 * nested_get_vmcs12_pages().
+		 * directly from here if HV_X64_MSR_VP_ASSIST_PAGE is not
+		 * restored yet. EVMCS will be mapped when it is.
 		 */
-		vmx->nested.hv_evmcs_vmptr = EVMPTR_MAP_PENDING;
-		kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
+		if (kvm_hv_assist_page_enabled(vcpu))
+			nested_get_evmcs_page(vcpu);
+
 	} else {
 		return -EINVAL;
 	}
@@ -6811,8 +6762,8 @@ struct kvm_x86_nested_ops vmx_nested_ops = {
 	.triple_fault = nested_vmx_triple_fault,
 	.get_state = vmx_get_nested_state,
 	.set_state = vmx_set_nested_state,
-	.get_nested_state_pages = vmx_get_nested_state_pages,
 	.write_log_dirty = nested_vmx_write_pml_buffer,
 	.enable_evmcs = nested_enable_evmcs,
 	.get_evmcs_version = nested_get_evmcs_version,
+	.get_evmcs_page = nested_get_evmcs_page,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0ee2fbb068b17..48dd01fd7a1ec 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9897,12 +9897,6 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 			r = -EIO;
 			goto out;
 		}
-		if (kvm_check_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu)) {
-			if (unlikely(!kvm_x86_ops.nested_ops->get_nested_state_pages(vcpu))) {
-				r = 0;
-				goto out;
-			}
-		}
 		if (kvm_check_request(KVM_REQ_MMU_RELOAD, vcpu))
 			kvm_mmu_unload(vcpu);
 		if (kvm_check_request(KVM_REQ_MIGRATE_TIMER, vcpu))
-- 
2.26.3

