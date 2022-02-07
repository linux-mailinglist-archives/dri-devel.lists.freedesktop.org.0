Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453BB4AC3C4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09525112469;
	Mon,  7 Feb 2022 15:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B362112465
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644248066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iV+sT7eBaIHlnSrQTGcmgC2l+6R2K6ll4jPmbZAHXmI=;
 b=V1hHtNrnux+ZZqwXJMmjXlUkXv7/v+PQTuvxbL9f4EOpZMJK2M+o/l94SLoE57wRzd3dCg
 BvvoLMydOt2Np+Wu2nWqgzfb9GwWcsFzxQzs+i3UjNygbQ8YJU++bFHN+vneBQRqXY7eEz
 NUtV6qMuXFt9Ak6YKztsChsVznqhl1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-mZGXc3z_N4u2XQtm2vkTmA-1; Mon, 07 Feb 2022 10:34:23 -0500
X-MC-Unique: mZGXc3z_N4u2XQtm2vkTmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF91363A6;
 Mon,  7 Feb 2022 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4221B5E495;
 Mon,  7 Feb 2022 15:34:12 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 28/30] KVM: SVM: implement force_intercept_exceptions_mask
Date: Mon,  7 Feb 2022 17:28:45 +0200
Message-Id: <20220207152847.836777-29-mlevitsk@redhat.com>
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

Currently #TS interception is only done once.
Also exception interception is not enabled for SEV guests.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/svm.c          | 92 ++++++++++++++++++++++++++++++++-
 arch/x86/kvm/svm/svm.h          |  5 +-
 arch/x86/kvm/svm/svm_onhyperv.c |  1 +
 arch/x86/kvm/x86.c              |  5 +-
 6 files changed, 101 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index fa498612839a0..446ee29e6cc99 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1750,6 +1750,8 @@ int kvm_emulate_rdpmc(struct kvm_vcpu *vcpu);
 void kvm_queue_exception(struct kvm_vcpu *vcpu, unsigned nr);
 void kvm_queue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code);
 void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr, unsigned long payload);
+void kvm_queue_exception_e_p(struct kvm_vcpu *vcpu, unsigned nr,
+			     u32 error_code, unsigned long payload);
 void kvm_requeue_exception(struct kvm_vcpu *vcpu, unsigned nr);
 void kvm_requeue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code);
 void kvm_inject_page_fault(struct kvm_vcpu *vcpu, struct x86_exception *fault);
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index bf6e96011dfed..d462b4808e893 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -32,6 +32,7 @@
 #define MC_VECTOR 18
 #define XM_VECTOR 19
 #define VE_VECTOR 20
+#define CP_VECTOR 21
 
 /* Select x86 specific features in <linux/kvm.h> */
 #define __KVM_HAVE_PIT
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1cf682d1553cc..afa4116ea938c 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -245,6 +245,8 @@ static const u32 msrpm_ranges[] = {0, 0xc0000000, 0xc0010000};
 #define MSRS_RANGE_SIZE 2048
 #define MSRS_IN_RANGE (MSRS_RANGE_SIZE * 8 / 2)
 
+static int svm_handle_invalid_exit(struct kvm_vcpu *vcpu, u64 exit_code);
+
 u32 svm_msrpm_offset(u32 msr)
 {
 	u32 offset;
@@ -1035,6 +1037,16 @@ static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu,
 	}
 }
 
+static void svm_init_force_exceptions_intercepts(struct kvm_vcpu *vcpu)
+{
+	int exc;
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	for (exc = 0 ; exc < 32 ; ++exc)
+		if (kvm_is_exception_force_intercepted(vcpu->kvm, exc))
+			set_exception_intercept(svm, exc);
+}
+
 static inline void init_vmcb_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -1235,6 +1247,8 @@ static void __svm_vcpu_reset(struct kvm_vcpu *vcpu)
 
 	if (sev_es_guest(vcpu->kvm))
 		sev_es_vcpu_reset(svm);
+	else
+		svm_init_force_exceptions_intercepts(vcpu);
 }
 
 static void svm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
@@ -1865,6 +1879,19 @@ static int pf_interception(struct kvm_vcpu *vcpu)
 	u64 fault_address = svm->vmcb->control.exit_info_2;
 	u64 error_code = svm->vmcb->control.exit_info_1;
 
+
+	if (kvm_is_exception_force_intercepted(vcpu->kvm, PF_VECTOR)) {
+		if (npt_enabled && !vcpu->arch.apf.host_apf_flags) {
+			/* If the #PF was only intercepted for debug, inject
+			 * it directly to the guest, since the kvm's mmu code
+			 * is not ready to deal with such page faults.
+			 */
+			kvm_queue_exception_e_p(vcpu, PF_VECTOR,
+						error_code, fault_address);
+			return 1;
+		}
+	}
+
 	return kvm_handle_page_fault(vcpu, error_code, fault_address,
 			static_cpu_has(X86_FEATURE_DECODEASSISTS) ?
 			svm->vmcb->control.insn_bytes : NULL,
@@ -1940,6 +1967,46 @@ static int ac_interception(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int gen_exc_interception(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Generic exception intercept handler which forwards a guest exception
+	 * as-is to the guest.
+	 * For exceptions that don't have a special intercept handler.
+	 *
+	 * Used only for 'force_intercept_exceptions_mask' KVM debug feature.
+	 */
+	struct vcpu_svm *svm = to_svm(vcpu);
+	int exc = svm->vmcb->control.exit_code - SVM_EXIT_EXCP_BASE;
+
+	if (!kvm_is_exception_force_intercepted(vcpu->kvm, exc))
+		return svm_handle_invalid_exit(vcpu, svm->vmcb->control.exit_code);
+
+	if (x86_exception_has_error_code(exc)) {
+
+		if (exc == TS_VECTOR) {
+			/*
+			 * SVM doesn't provide us with an error code to be able to
+			 * re-inject the #TS exception, so just disable its
+			 * intercept, and let the guest re-execute the instruction.
+			 */
+			vmcb_clr_intercept(&svm->vmcb01.ptr->control,
+					   INTERCEPT_EXCEPTION_OFFSET + TS_VECTOR);
+			recalc_intercepts(svm);
+			return 1;
+		} else if (exc == DF_VECTOR) {
+			/*
+			 * SVM doesn't provide the error code on #DF either
+			 * but it is always 0
+			 */
+			svm->vmcb->control.exit_info_1 = 0;
+		}
+		kvm_queue_exception_e(vcpu, exc, svm->vmcb->control.exit_info_1);
+	} else
+		kvm_queue_exception(vcpu, exc);
+	return 1;
+}
+
 static bool is_erratum_383(void)
 {
 	int err, i;
@@ -3050,13 +3117,34 @@ static int (*const svm_exit_handlers[])(struct kvm_vcpu *vcpu) = {
 	[SVM_EXIT_WRITE_DR5]			= dr_interception,
 	[SVM_EXIT_WRITE_DR6]			= dr_interception,
 	[SVM_EXIT_WRITE_DR7]			= dr_interception,
+
+	/* 0 */
+	[SVM_EXIT_EXCP_BASE + DE_VECTOR]	= gen_exc_interception,
 	[SVM_EXIT_EXCP_BASE + DB_VECTOR]	= db_interception,
+						  /* NMI*/
 	[SVM_EXIT_EXCP_BASE + BP_VECTOR]	= bp_interception,
+	[SVM_EXIT_EXCP_BASE + OF_VECTOR]	= gen_exc_interception,
+	[SVM_EXIT_EXCP_BASE + BR_VECTOR]	= gen_exc_interception,
 	[SVM_EXIT_EXCP_BASE + UD_VECTOR]	= ud_interception,
+	[SVM_EXIT_EXCP_BASE + NM_VECTOR]	= gen_exc_interception,
+	/* 8*/
+	[SVM_EXIT_EXCP_BASE + DF_VECTOR]	= gen_exc_interception,
+						  /* 9 is reserved*/
+	[SVM_EXIT_EXCP_BASE + TS_VECTOR]	= gen_exc_interception,
+	[SVM_EXIT_EXCP_BASE + NP_VECTOR]	= gen_exc_interception,
+	[SVM_EXIT_EXCP_BASE + SS_VECTOR]	= gen_exc_interception,
+	[SVM_EXIT_EXCP_BASE + GP_VECTOR]	= gp_interception,
 	[SVM_EXIT_EXCP_BASE + PF_VECTOR]	= pf_interception,
-	[SVM_EXIT_EXCP_BASE + MC_VECTOR]	= mc_interception,
+						  /* 15 is reserved*/
+	/* 16 */
+	[SVM_EXIT_EXCP_BASE + MF_VECTOR]	= gen_exc_interception,
 	[SVM_EXIT_EXCP_BASE + AC_VECTOR]	= ac_interception,
-	[SVM_EXIT_EXCP_BASE + GP_VECTOR]	= gp_interception,
+	[SVM_EXIT_EXCP_BASE + MC_VECTOR]	= mc_interception,
+	[SVM_EXIT_EXCP_BASE + XM_VECTOR]	= gen_exc_interception,
+						  /* 20 - #VE - reserved on AMD*/
+	[SVM_EXIT_EXCP_BASE + CP_VECTOR]	= gen_exc_interception,
+	/* TODO: exceptions 22-31 */
+
 	[SVM_EXIT_INTR]				= intr_interception,
 	[SVM_EXIT_NMI]				= nmi_interception,
 	[SVM_EXIT_SMI]				= smi_interception,
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 73cc9d3e784bd..dd3671d77258b 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -415,8 +415,11 @@ static inline void clr_exception_intercept(struct vcpu_svm *svm, u32 bit)
 	struct vmcb *vmcb = svm->vmcb01.ptr;
 
 	WARN_ON_ONCE(bit >= 32);
-	vmcb_clr_intercept(&vmcb->control, INTERCEPT_EXCEPTION_OFFSET + bit);
 
+	if (kvm_is_exception_force_intercepted(svm->vcpu.kvm, bit))
+		return;
+
+	vmcb_clr_intercept(&vmcb->control, INTERCEPT_EXCEPTION_OFFSET + bit);
 	recalc_intercepts(svm);
 }
 
diff --git a/arch/x86/kvm/svm/svm_onhyperv.c b/arch/x86/kvm/svm/svm_onhyperv.c
index 98aa981c04ec5..81be254e757b2 100644
--- a/arch/x86/kvm/svm/svm_onhyperv.c
+++ b/arch/x86/kvm/svm/svm_onhyperv.c
@@ -8,6 +8,7 @@
 
 #include <asm/mshyperv.h>
 
+#include "x86.h"
 #include "svm.h"
 #include "svm_ops.h"
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 202c34697852f..0ee2fbb068b17 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -706,12 +706,13 @@ void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr,
 }
 EXPORT_SYMBOL_GPL(kvm_queue_exception_p);
 
-static void kvm_queue_exception_e_p(struct kvm_vcpu *vcpu, unsigned nr,
-				    u32 error_code, unsigned long payload)
+void kvm_queue_exception_e_p(struct kvm_vcpu *vcpu, unsigned nr,
+			     u32 error_code, unsigned long payload)
 {
 	kvm_multiple_exception(vcpu, nr, true, error_code,
 			       true, payload, false);
 }
+EXPORT_SYMBOL_GPL(kvm_queue_exception_e_p);
 
 int kvm_complete_insn_gp(struct kvm_vcpu *vcpu, int err)
 {
-- 
2.26.3

