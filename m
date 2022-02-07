Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70544AC3C8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE88112464;
	Mon,  7 Feb 2022 15:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE77112464
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644248074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdxSxSRMwi46phQmQDHMqytXBvrQerh2Lq0bkWEDmYc=;
 b=fNX7exg+iaPecSN6WsW8tMdGQ0+xoLvC26FOkL5Q/+DeCchywvnCtjcjWAfz6WJa7iG/Zw
 B9kW+ld1XpL5tYLqoXu/3qLXEfebaupnsYu8vEOvg72FvCotToG6zLSqS6mu0CUItPdBoi
 lIvGEJhLIpXXJ+AH9xJDLk40TjcZKgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98--O5g3A7GP8GQvV1SlAQjnQ-1; Mon, 07 Feb 2022 10:34:31 -0500
X-MC-Unique: -O5g3A7GP8GQvV1SlAQjnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C162286A8A0;
 Mon,  7 Feb 2022 15:34:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE5015E495;
 Mon,  7 Feb 2022 15:34:20 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 29/30] KVM: VMX: implement force_intercept_exceptions_mask
Date: Mon,  7 Feb 2022 17:28:46 +0200
Message-Id: <20220207152847.836777-30-mlevitsk@redhat.com>
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

All exceptions are supported. Some bugs might remain in regard to KVM own
interception of #PF but since this is strictly
debug feature this should be OK.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/vmx/nested.c |  8 +++++++
 arch/x86/kvm/vmx/vmcs.h   |  6 +++++
 arch/x86/kvm/vmx/vmx.c    | 47 +++++++++++++++++++++++++++++++++------
 3 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index c73e4d938ddc3..e89b32b1d9efb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5902,6 +5902,14 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
 	switch ((u16)exit_reason.basic) {
 	case EXIT_REASON_EXCEPTION_NMI:
 		intr_info = vmx_get_intr_info(vcpu);
+
+		if (is_exception(intr_info)) {
+			int ex_no = intr_info & INTR_INFO_VECTOR_MASK;
+
+			if (kvm_is_exception_force_intercepted(vcpu->kvm, ex_no))
+				return true;
+		}
+
 		if (is_nmi(intr_info))
 			return true;
 		else if (is_page_fault(intr_info))
diff --git a/arch/x86/kvm/vmx/vmcs.h b/arch/x86/kvm/vmx/vmcs.h
index e325c290a8162..d5aac5abe5cdd 100644
--- a/arch/x86/kvm/vmx/vmcs.h
+++ b/arch/x86/kvm/vmx/vmcs.h
@@ -94,6 +94,12 @@ static inline bool is_exception_n(u32 intr_info, u8 vector)
 	return is_intr_type_n(intr_info, INTR_TYPE_HARD_EXCEPTION, vector);
 }
 
+static inline bool is_exception(u32 intr_info)
+{
+	return is_intr_type(intr_info, INTR_TYPE_HARD_EXCEPTION) ||
+	       is_intr_type(intr_info, INTR_TYPE_SOFT_EXCEPTION);
+}
+
 static inline bool is_debug(u32 intr_info)
 {
 	return is_exception_n(intr_info, DB_VECTOR);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index fc9c4eca90a78..aec2b962707a0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -719,6 +719,7 @@ static u32 vmx_read_guest_seg_ar(struct vcpu_vmx *vmx, unsigned seg)
 void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu)
 {
 	u32 eb;
+	int exc;
 
 	eb = (1u << PF_VECTOR) | (1u << UD_VECTOR) | (1u << MC_VECTOR) |
 	     (1u << DB_VECTOR) | (1u << AC_VECTOR);
@@ -749,7 +750,8 @@ void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu)
         else {
 		int mask = 0, match = 0;
 
-		if (enable_ept && (eb & (1u << PF_VECTOR))) {
+		if (enable_ept && (eb & (1u << PF_VECTOR)) &&
+		    !kvm_is_exception_force_intercepted(vcpu->kvm, PF_VECTOR)) {
 			/*
 			 * If EPT is enabled, #PF is currently only intercepted
 			 * if MAXPHYADDR is smaller on the guest than on the
@@ -772,6 +774,10 @@ void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu)
 	if (vcpu->arch.xfd_no_write_intercept)
 		eb |= (1u << NM_VECTOR);
 
+	for (exc = 0 ; exc < 32 ; ++exc)
+		if (kvm_is_exception_force_intercepted(vcpu->kvm, exc) && exc != NMI_VECTOR)
+			eb |= (1u << exc);
+
 	vmcs_write32(EXCEPTION_BITMAP, eb);
 }
 
@@ -4867,18 +4873,23 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 		error_code = vmcs_read32(VM_EXIT_INTR_ERROR_CODE);
 
 	if (!vmx->rmode.vm86_active && is_gp_fault(intr_info)) {
-		WARN_ON_ONCE(!enable_vmware_backdoor);
-
 		/*
 		 * VMware backdoor emulation on #GP interception only handles
 		 * IN{S}, OUT{S}, and RDPMC, none of which generate a non-zero
 		 * error code on #GP.
 		 */
-		if (error_code) {
+
+		if (enable_vmware_backdoor && !error_code)
+			return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP);
+
+		if (!kvm_is_exception_force_intercepted(vcpu->kvm, GP_VECTOR))
+			WARN_ON_ONCE(!enable_vmware_backdoor);
+
+		if (intr_info & INTR_INFO_DELIVER_CODE_MASK)
 			kvm_queue_exception_e(vcpu, GP_VECTOR, error_code);
-			return 1;
-		}
-		return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP);
+		else
+			kvm_queue_exception(vcpu, GP_VECTOR);
+		return 1;
 	}
 
 	/*
@@ -4887,6 +4898,7 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 	 * See the comments in vmx_handle_exit.
 	 */
 	if ((vect_info & VECTORING_INFO_VALID_MASK) &&
+	    !kvm_is_exception_force_intercepted(vcpu->kvm, PF_VECTOR) &&
 	    !(is_page_fault(intr_info) && !(error_code & PFERR_RSVD_MASK))) {
 		vcpu->run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		vcpu->run->internal.suberror = KVM_INTERNAL_ERROR_SIMUL_EX;
@@ -4901,10 +4913,23 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 	if (is_page_fault(intr_info)) {
 		cr2 = vmx_get_exit_qual(vcpu);
 		if (enable_ept && !vcpu->arch.apf.host_apf_flags) {
+			/*
+			 * If we force intercept #PF and the page fault
+			 * is due to the reason which we don't intercept,
+			 * reflect it to the guest.
+			 */
+			if (kvm_is_exception_force_intercepted(vcpu->kvm, PF_VECTOR) &&
+			    (!allow_smaller_maxphyaddr ||
+			     !(error_code & PFERR_PRESENT_MASK) ||
+			     (error_code & PFERR_RSVD_MASK))) {
+				kvm_queue_exception_e_p(vcpu, PF_VECTOR, error_code, cr2);
+				return 1;
+			}
 			/*
 			 * EPT will cause page fault only if we need to
 			 * detect illegal GPAs.
 			 */
+
 			WARN_ON_ONCE(!allow_smaller_maxphyaddr);
 			kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
 			return 1;
@@ -4983,6 +5008,14 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 			return 1;
 		fallthrough;
 	default:
+		if (kvm_is_exception_force_intercepted(vcpu->kvm, ex_no)) {
+			if (intr_info & INTR_INFO_DELIVER_CODE_MASK)
+				kvm_queue_exception_e(vcpu, ex_no, error_code);
+			else
+				kvm_queue_exception(vcpu, ex_no);
+			break;
+		}
+
 		kvm_run->exit_reason = KVM_EXIT_EXCEPTION;
 		kvm_run->ex.exception = ex_no;
 		kvm_run->ex.error_code = error_code;
-- 
2.26.3

