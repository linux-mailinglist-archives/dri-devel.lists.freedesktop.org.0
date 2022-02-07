Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E224AC3B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE80112456;
	Mon,  7 Feb 2022 15:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721411245B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oU3s7CnCjp2O1VaC3lW5tk3dKh1EHix/EeWBDaZUEPI=;
 b=aUdNRnmHHWlssHuxT0FdQdTkZFafbWdSvl+PboRpqrXAmadZMcfVTbxGxoh+lo4dLc5fE8
 ss/vIctoXr/wa7QIFRu/E7a5YceY0pdGhWkjeMj3BPnUxxXVIGzbU/KA8LIlVTy756Zwv6
 bKSuoCySOdYpS64TU/w2SlxJEiaSsR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-1jisPzjKOBq4fw-RaZabSA-1; Mon, 07 Feb 2022 10:33:13 -0500
X-MC-Unique: 1jisPzjKOBq4fw-RaZabSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8226985EE6D;
 Mon,  7 Feb 2022 15:33:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDA055E495;
 Mon,  7 Feb 2022 15:33:02 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 24/30] KVM: x86: nSVM: implement nested VMLOAD/VMSAVE
Date: Mon,  7 Feb 2022 17:28:41 +0200
Message-Id: <20220207152847.836777-25-mlevitsk@redhat.com>
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

This was tested by booting L1,L2,L3 (all Linux) and checking
that no VMLOAD/VMSAVE vmexits happened.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 35 +++++++++++++++++++++++++++++------
 arch/x86/kvm/svm/svm.c    |  7 +++++++
 arch/x86/kvm/svm/svm.h    |  8 +++++++-
 3 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 4a228a76b27d7..bdcb23c76e89e 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -120,6 +120,20 @@ static void nested_svm_uninit_mmu_context(struct kvm_vcpu *vcpu)
 	vcpu->arch.walk_mmu = &vcpu->arch.root_mmu;
 }
 
+static bool nested_vmcb_needs_vls_intercept(struct vcpu_svm *svm)
+{
+	if (!svm->v_vmload_vmsave_enabled)
+		return true;
+
+	if (!nested_npt_enabled(svm))
+		return true;
+
+	if (!(svm->nested.ctl.virt_ext & VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK))
+		return true;
+
+	return false;
+}
+
 void recalc_intercepts(struct vcpu_svm *svm)
 {
 	struct vmcb_control_area *c, *h;
@@ -161,8 +175,17 @@ void recalc_intercepts(struct vcpu_svm *svm)
 	if (!intercept_smi)
 		vmcb_clr_intercept(c, INTERCEPT_SMI);
 
-	vmcb_set_intercept(c, INTERCEPT_VMLOAD);
-	vmcb_set_intercept(c, INTERCEPT_VMSAVE);
+	if (nested_vmcb_needs_vls_intercept(svm)) {
+		/*
+		 * If the virtual VMLOAD/VMSAVE is not enabled for the L2,
+		 * we must intercept these instructions to correctly
+		 * emulate them in case L1 doesn't intercept them.
+		 */
+		vmcb_set_intercept(c, INTERCEPT_VMLOAD);
+		vmcb_set_intercept(c, INTERCEPT_VMSAVE);
+	} else {
+		WARN_ON(!(c->virt_ext & VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK));
+	}
 }
 
 static bool nested_svm_vmrun_msrpm(struct vcpu_svm *svm)
@@ -426,10 +449,7 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
 	vmcb12->control.exit_int_info = exit_int_info;
 }
 
-static inline bool nested_npt_enabled(struct vcpu_svm *svm)
-{
-	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
-}
+
 
 static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
 {
@@ -607,6 +627,9 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 		svm->vmcb->control.virt_ext  |=
 			(svm->nested.ctl.virt_ext & LBR_CTL_ENABLE_MASK);
 
+	if (!nested_vmcb_needs_vls_intercept(svm))
+		svm->vmcb->control.virt_ext |= VIRTUAL_VMLOAD_VMSAVE_ENABLE_MASK;
+
 	nested_svm_transition_tlb_flush(vcpu);
 
 	/* Enter Guest-Mode */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 76aa6054d9db2..0f068da098d9f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1051,6 +1051,8 @@ static inline void init_vmcb_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SYSENTER_EIP, 0, 0);
 		set_msr_interception(vcpu, svm->msrpm, MSR_IA32_SYSENTER_ESP, 0, 0);
+
+		svm->v_vmload_vmsave_enabled = false;
 	} else {
 		/*
 		 * If hardware supports Virtual VMLOAD VMSAVE then enable it
@@ -3993,6 +3995,8 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	svm->tsc_scaling_enabled = tsc_scaling && guest_cpuid_has(vcpu, X86_FEATURE_TSCRATEMSR);
 	svm->lbrv_enabled = lbrv && guest_cpuid_has(vcpu, X86_FEATURE_LBRV);
 
+	svm->v_vmload_vmsave_enabled = vls && guest_cpuid_has(vcpu, X86_FEATURE_V_VMSAVE_VMLOAD);
+
 	svm_recalc_instruction_intercepts(vcpu, svm);
 
 	/* For sev guests, the memory encryption bit is not reserved in CR3.  */
@@ -4799,6 +4803,9 @@ static __init void svm_set_cpu_caps(void)
 		if (lbrv)
 			kvm_cpu_cap_set(X86_FEATURE_LBRV);
 
+		if (vls)
+			kvm_cpu_cap_set(X86_FEATURE_V_VMSAVE_VMLOAD);
+
 		/* Nested VM can receive #VMEXIT instead of triggering #GP */
 		kvm_cpu_cap_set(X86_FEATURE_SVME_ADDR_CHK);
 	}
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 0012ba5affcba..e8ffd458a5575 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -217,10 +217,11 @@ struct vcpu_svm {
 	unsigned int3_injected;
 	unsigned long int3_rip;
 
-	/* cached guest cpuid flags for faster access */
+	/* optional nested SVM features that are enabled for this guest  */
 	bool nrips_enabled                : 1;
 	bool tsc_scaling_enabled          : 1;
 	bool lbrv_enabled                 : 1;
+	bool v_vmload_vmsave_enabled      : 1;
 
 	u32 ldr_reg;
 	u32 dfr_reg;
@@ -468,6 +469,11 @@ static inline bool gif_set(struct vcpu_svm *svm)
 		return !!(svm->vcpu.arch.hflags & HF_GIF_MASK);
 }
 
+static inline bool nested_npt_enabled(struct vcpu_svm *svm)
+{
+	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
+}
+
 /* svm.c */
 #define MSR_INVALID				0xffffffffU
 
-- 
2.26.3

