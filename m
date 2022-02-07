Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E561C4AC3AA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54E11246C;
	Mon,  7 Feb 2022 15:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8686111246D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV5jkqTeSUUXBrzTfKSBHIk3+2wrmrIK57QNIliC8wc=;
 b=ZScf/EftTbPUv7gCkOELlfEk+Vvw/TlfDjWhVWfIi2CWUyFKTBQlDA+s0q3RMBinKEgg0W
 h5iLmN8ZCdGKsE96mQFg6agZhrdwBjnovRpMuKFNt2ThzzhGElx87HthI5CrotHzThstcx
 GfbXPNOsMc3kOagBWhXjxf6S96YW4EQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-MrUjQzLENKyrcmMpkHhahg-1; Mon, 07 Feb 2022 10:32:57 -0500
X-MC-Unique: MrUjQzLENKyrcmMpkHhahg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491671923B9A;
 Mon,  7 Feb 2022 15:32:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1C7384FFB;
 Mon,  7 Feb 2022 15:32:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 22/30] KVM: x86: nSVM: correctly virtualize LBR msrs when L2
 is running
Date: Mon,  7 Feb 2022 17:28:39 +0200
Message-Id: <20220207152847.836777-23-mlevitsk@redhat.com>
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

When L2 is running without LBR virtualization, we should ensure
that L1's LBR msrs continue to update as usual.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 11 +++++
 arch/x86/kvm/svm/svm.c    | 98 +++++++++++++++++++++++++++++++--------
 arch/x86/kvm/svm/svm.h    |  2 +
 3 files changed, 92 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index ac9159b0618c7..9f7bc7db08dd3 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -535,6 +535,9 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
 		svm->vcpu.arch.dr6  = svm->nested.save.dr6 | DR6_ACTIVE_LOW;
 		vmcb_mark_dirty(svm->vmcb, VMCB_DR);
 	}
+
+	if (unlikely(svm->vmcb01.ptr->control.virt_ext & LBR_CTL_ENABLE_MASK))
+		svm_copy_lbrs(svm->vmcb01.ptr, svm->vmcb);
 }
 
 static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
@@ -587,6 +590,9 @@ static void nested_vmcb02_prepare_control(struct vcpu_svm *svm)
 	svm->vmcb->control.event_inj           = svm->nested.ctl.event_inj;
 	svm->vmcb->control.event_inj_err       = svm->nested.ctl.event_inj_err;
 
+	svm->vmcb->control.virt_ext            = svm->vmcb01.ptr->control.virt_ext &
+						 LBR_CTL_ENABLE_MASK;
+
 	nested_svm_transition_tlb_flush(vcpu);
 
 	/* Enter Guest-Mode */
@@ -852,6 +858,11 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 
 	svm_switch_vmcb(svm, &svm->vmcb01);
 
+	if (unlikely(svm->vmcb->control.virt_ext & LBR_CTL_ENABLE_MASK)) {
+		svm_copy_lbrs(svm->nested.vmcb02.ptr, svm->vmcb);
+		svm_update_lbrv(vcpu);
+	}
+
 	/*
 	 * On vmexit the  GIF is set to false and
 	 * no event can be injected in L1.
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index b88ca7f07a0fc..294e016f575a8 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -805,6 +805,17 @@ static void init_msrpm_offsets(void)
 	}
 }
 
+void svm_copy_lbrs(struct vmcb *from_vmcb, struct vmcb *to_vmcb)
+{
+	to_vmcb->save.dbgctl		= from_vmcb->save.dbgctl;
+	to_vmcb->save.br_from		= from_vmcb->save.br_from;
+	to_vmcb->save.br_to		= from_vmcb->save.br_to;
+	to_vmcb->save.last_excp_from	= from_vmcb->save.last_excp_from;
+	to_vmcb->save.last_excp_to	= from_vmcb->save.last_excp_to;
+
+	vmcb_mark_dirty(to_vmcb, VMCB_LBR);
+}
+
 static void svm_enable_lbrv(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -814,6 +825,10 @@ static void svm_enable_lbrv(struct kvm_vcpu *vcpu)
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTBRANCHTOIP, 1, 1);
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTINTFROMIP, 1, 1);
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTINTTOIP, 1, 1);
+
+	/* Move the LBR msrs to the vmcb02 so that the guest can see them. */
+	if (is_guest_mode(vcpu))
+		svm_copy_lbrs(svm->vmcb01.ptr, svm->vmcb);
 }
 
 static void svm_disable_lbrv(struct kvm_vcpu *vcpu)
@@ -825,6 +840,63 @@ static void svm_disable_lbrv(struct kvm_vcpu *vcpu)
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTBRANCHTOIP, 0, 0);
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTINTFROMIP, 0, 0);
 	set_msr_interception(vcpu, svm->msrpm, MSR_IA32_LASTINTTOIP, 0, 0);
+
+	/*
+	 * Move the LBR msrs back to the vmcb01 to avoid copying them
+	 * on nested guest entries.
+	 */
+	if (is_guest_mode(vcpu))
+		svm_copy_lbrs(svm->vmcb, svm->vmcb01.ptr);
+}
+
+static int svm_get_lbr_msr(struct vcpu_svm *svm, u32 index)
+{
+	/*
+	 * If the LBR virtualization is disabled, the LBR msrs are always
+	 * kept in the vmcb01 to avoid copying them on nested guest entries.
+	 *
+	 * If nested, and the LBR virtualization is enabled/disabled, the msrs
+	 * are moved between the vmcb01 and vmcb02 as needed.
+	 */
+	struct vmcb *vmcb =
+		(svm->vmcb->control.virt_ext & LBR_CTL_ENABLE_MASK) ?
+			svm->vmcb : svm->vmcb01.ptr;
+
+	switch (index) {
+	case MSR_IA32_DEBUGCTLMSR:
+		return vmcb->save.dbgctl;
+	case MSR_IA32_LASTBRANCHFROMIP:
+		return vmcb->save.br_from;
+	case MSR_IA32_LASTBRANCHTOIP:
+		return vmcb->save.br_to;
+	case MSR_IA32_LASTINTFROMIP:
+		return vmcb->save.last_excp_from;
+	case MSR_IA32_LASTINTTOIP:
+		return vmcb->save.last_excp_to;
+	default:
+		KVM_BUG(false, svm->vcpu.kvm,
+			"%s: Unknown MSR 0x%x", __func__, index);
+		return 0;
+	}
+}
+
+void svm_update_lbrv(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	bool enable_lbrv = svm_get_lbr_msr(svm, MSR_IA32_DEBUGCTLMSR) &
+					   DEBUGCTLMSR_LBR;
+
+	bool current_enable_lbrv = !!(svm->vmcb->control.virt_ext &
+				      LBR_CTL_ENABLE_MASK);
+
+	if (enable_lbrv == current_enable_lbrv)
+		return;
+
+	if (enable_lbrv)
+		svm_enable_lbrv(vcpu);
+	else
+		svm_disable_lbrv(vcpu);
 }
 
 void disable_nmi_singlestep(struct vcpu_svm *svm)
@@ -2591,25 +2663,12 @@ static int svm_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	case MSR_TSC_AUX:
 		msr_info->data = svm->tsc_aux;
 		break;
-	/*
-	 * Nobody will change the following 5 values in the VMCB so we can
-	 * safely return them on rdmsr. They will always be 0 until LBRV is
-	 * implemented.
-	 */
 	case MSR_IA32_DEBUGCTLMSR:
-		msr_info->data = svm->vmcb->save.dbgctl;
-		break;
 	case MSR_IA32_LASTBRANCHFROMIP:
-		msr_info->data = svm->vmcb->save.br_from;
-		break;
 	case MSR_IA32_LASTBRANCHTOIP:
-		msr_info->data = svm->vmcb->save.br_to;
-		break;
 	case MSR_IA32_LASTINTFROMIP:
-		msr_info->data = svm->vmcb->save.last_excp_from;
-		break;
 	case MSR_IA32_LASTINTTOIP:
-		msr_info->data = svm->vmcb->save.last_excp_to;
+		msr_info->data = svm_get_lbr_msr(svm, msr_info->index);
 		break;
 	case MSR_VM_HSAVE_PA:
 		msr_info->data = svm->nested.hsave_msr;
@@ -2840,12 +2899,13 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 		if (data & DEBUGCTL_RESERVED_BITS)
 			return 1;
 
-		svm->vmcb->save.dbgctl = data;
-		vmcb_mark_dirty(svm->vmcb, VMCB_LBR);
-		if (data & (1ULL<<0))
-			svm_enable_lbrv(vcpu);
+		if (svm->vmcb->control.virt_ext & LBR_CTL_ENABLE_MASK)
+			svm->vmcb->save.dbgctl = data;
 		else
-			svm_disable_lbrv(vcpu);
+			svm->vmcb01.ptr->save.dbgctl = data;
+
+		svm_update_lbrv(vcpu);
+
 		break;
 	case MSR_VM_HSAVE_PA:
 		/*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index c02903641d13d..b83e06d5d942a 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -476,6 +476,8 @@ u32 svm_msrpm_offset(u32 msr);
 u32 *svm_vcpu_alloc_msrpm(void);
 void svm_vcpu_init_msrpm(struct kvm_vcpu *vcpu, u32 *msrpm);
 void svm_vcpu_free_msrpm(u32 *msrpm);
+void svm_copy_lbrs(struct vmcb *from_vmcb, struct vmcb *to_vmcb);
+void svm_update_lbrv(struct kvm_vcpu *vcpu);
 
 int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer);
 void svm_set_cr0(struct kvm_vcpu *vcpu, unsigned long cr0);
-- 
2.26.3

