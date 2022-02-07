Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C884AC378
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7910FF4B;
	Mon,  7 Feb 2022 15:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBBB10FA5B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qBv9qwSEqvx96/HtSvc9qvyeLhvKy4iFAhj6kK93B8=;
 b=XNT+XU1YMquoMXC2iD15olb5alewXcO3St2tffBPz9z4J+36W+fhEfnQ8o7yXMw3NDIp6L
 8fnDPYdFKqaOTBScWDY4x6bCkF3pDCmjuwaKr0h/T4/qo6KiCPULcCTPzrURkLNim6nbSz
 d39zdnhrPKVVIlhRhuRfNgVnnGGwoQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-vUZnz9OrMWSNbm4bzDT-IA-1; Mon, 07 Feb 2022 10:31:17 -0500
X-MC-Unique: vUZnz9OrMWSNbm4bzDT-IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89AA38E7C0;
 Mon,  7 Feb 2022 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2E9E84D38;
 Mon,  7 Feb 2022 15:31:05 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 10/30] KVM: x86: SVM: fix race between interrupt delivery and
 AVIC inhibition
Date: Mon,  7 Feb 2022 17:28:27 +0200
Message-Id: <20220207152847.836777-11-mlevitsk@redhat.com>
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

If svm_deliver_avic_intr is called just after the target vcpu's AVIC got
inhibited, it might read a stale value of vcpu->arch.apicv_active
which can lead to the target vCPU not noticing the interrupt.

To fix this use load-acquire/store-release so that, if the target vCPU
is IN_GUEST_MODE, we're guaranteed to see a previous disabling of the
AVIC.  If AVIC has been disabled in the meanwhile, proceed with the
KVM_REQ_EVENT-based delivery.

All this complicated logic is actually exactly how we can handle an
incomplete IPI vmexit; the only difference lies in who sets IRR, whether
KVM or the processor.

Also incomplete IPI vmexit also has the same races as
svm_deliver_avic_intr.
Therefore use the avic_kick_target_vcpu there as well.

Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 73 ++++++++++++++---------------------------
 arch/x86/kvm/svm/svm.c  | 65 ++++++++++++++++++++++++++++--------
 arch/x86/kvm/svm/svm.h  |  3 ++
 arch/x86/kvm/x86.c      |  4 ++-
 4 files changed, 82 insertions(+), 63 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index fabfc337e1c35..4c2d622b3b9f0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -269,6 +269,24 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+
+void avic_ring_doorbell(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Note, the vCPU could get migrated to a different pCPU at any
+	 * point, which could result in signalling the wrong/previous
+	 * pCPU.  But if that happens the vCPU is guaranteed to do a
+	 * VMRUN (after being migrated) and thus will process pending
+	 * interrupts, i.e. a doorbell is not needed (and the spurious
+	 * one is harmless).
+	 */
+	int cpu = READ_ONCE(vcpu->cpu);
+
+	if (cpu != get_cpu())
+		wrmsrl(MSR_AMD64_SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
+	put_cpu();
+}
+
 static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
 				   u32 icrl, u32 icrh)
 {
@@ -284,8 +302,13 @@ static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (kvm_apic_match_dest(vcpu, source, icrl & APIC_SHORT_MASK,
 					GET_APIC_DEST_FIELD(icrh),
-					icrl & APIC_DEST_MASK))
-			kvm_vcpu_wake_up(vcpu);
+					icrl & APIC_DEST_MASK)) {
+			vcpu->arch.apic->irr_pending = true;
+			svm_complete_interrupt_delivery(vcpu,
+							icrl & APIC_MODE_MASK,
+							icrl & APIC_INT_LEVELTRIG,
+							icrl & APIC_VECTOR_MASK);
+		}
 	}
 }
 
@@ -649,52 +672,6 @@ void avic_load_eoi_exitmap(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap)
 	return;
 }
 
-int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
-{
-	if (!vcpu->arch.apicv_active)
-		return -1;
-
-	kvm_lapic_set_irr(vec, vcpu->arch.apic);
-
-	/*
-	 * Pairs with the smp_mb_*() after setting vcpu->guest_mode in
-	 * vcpu_enter_guest() to ensure the write to the vIRR is ordered before
-	 * the read of guest_mode, which guarantees that either VMRUN will see
-	 * and process the new vIRR entry, or that the below code will signal
-	 * the doorbell if the vCPU is already running in the guest.
-	 */
-	smp_mb__after_atomic();
-
-	/*
-	 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
-	 * is in the guest.  If the vCPU is not in the guest, hardware will
-	 * automatically process AVIC interrupts at VMRUN.
-	 */
-	if (vcpu->mode == IN_GUEST_MODE) {
-		int cpu = READ_ONCE(vcpu->cpu);
-
-		/*
-		 * Note, the vCPU could get migrated to a different pCPU at any
-		 * point, which could result in signalling the wrong/previous
-		 * pCPU.  But if that happens the vCPU is guaranteed to do a
-		 * VMRUN (after being migrated) and thus will process pending
-		 * interrupts, i.e. a doorbell is not needed (and the spurious
-		 * one is harmless).
-		 */
-		if (cpu != get_cpu())
-			wrmsrl(MSR_AMD64_SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
-		put_cpu();
-	} else {
-		/*
-		 * Wake the vCPU if it was blocking.  KVM will then detect the
-		 * pending IRQ when checking if the vCPU has a wake event.
-		 */
-		kvm_vcpu_wake_up(vcpu);
-	}
-
-	return 0;
-}
-
 bool avic_dy_apicv_has_pending_interrupt(struct kvm_vcpu *vcpu)
 {
 	return false;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 22e614008cf59..18d4d87e12e15 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3310,20 +3310,6 @@ static void svm_inject_irq(struct kvm_vcpu *vcpu)
 		SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_INTR;
 }
 
-static void svm_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-				  int trig_mode, int vector)
-{
-	struct kvm_vcpu *vcpu = apic->vcpu;
-
-	if (svm_deliver_avic_intr(vcpu, vector)) {
-		kvm_lapic_set_irr(vector, apic);
-		kvm_make_request(KVM_REQ_EVENT, vcpu);
-		kvm_vcpu_kick(vcpu);
-	} else {
-		trace_kvm_apicv_accept_irq(vcpu->vcpu_id, delivery_mode,
-					   trig_mode, vector);
-	}
-}
 
 static void svm_update_cr8_intercept(struct kvm_vcpu *vcpu, int tpr, int irr)
 {
@@ -4142,6 +4128,57 @@ static int svm_check_intercept(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+void svm_complete_interrupt_delivery(struct kvm_vcpu *vcpu, int delivery_mode,
+		  int trig_mode, int vec)
+{
+	/*
+	 * vcpu->arch.apicv_active must be read after vcpu->mode.
+	 * Pairs with smp_store_release in vcpu_enter_guest.
+	 */
+	bool in_guest_mode = (smp_load_acquire(&vcpu->mode) == IN_GUEST_MODE);
+
+	if (!READ_ONCE(vcpu->arch.apicv_active)) {
+		/*
+		 * Manually signal the event
+		 */
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+		kvm_vcpu_kick(vcpu);
+		return;
+	}
+
+	trace_kvm_apicv_accept_irq(vcpu->vcpu_id, delivery_mode, trig_mode, vec);
+
+	if (in_guest_mode)
+		/*
+		 * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
+		 * is in the guest.  If the vCPU is not in the guest, hardware will
+		 * automatically process AVIC interrupts at VMRUN.
+		 */
+		avic_ring_doorbell(vcpu);
+	else
+		/*
+		 * Wake the vCPU if it was blocking.  KVM will then detect the
+		 * pending IRQ when checking if the vCPU has a wake event.
+		 */
+		kvm_vcpu_wake_up(vcpu);
+}
+
+static void svm_deliver_interrupt(struct kvm_lapic *apic,  int delivery_mode,
+		  int trig_mode, int vec)
+{
+	kvm_lapic_set_irr(vec, apic);
+
+	/*
+	 * Pairs with the smp_mb_*() after setting vcpu->guest_mode in
+	 * vcpu_enter_guest() to ensure the write to the vIRR is ordered before
+	 * the read of guest_mode, which guarantees that either VMRUN will see
+	 * and process the new vIRR entry, or that the below code will signal
+	 * the doorbell if the vCPU is already running in the guest.
+	 */
+	smp_mb__after_atomic();
+	svm_complete_interrupt_delivery(apic->vcpu, delivery_mode, trig_mode, vec);
+}
+
 static void svm_handle_exit_irqoff(struct kvm_vcpu *vcpu)
 {
 }
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 6343558982c73..83f9f95eced3e 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -488,6 +488,8 @@ void svm_set_gif(struct vcpu_svm *svm, bool value);
 int svm_invoke_exit_handler(struct kvm_vcpu *vcpu, u64 exit_code);
 void set_msr_interception(struct kvm_vcpu *vcpu, u32 *msrpm, u32 msr,
 			  int read, int write);
+void svm_complete_interrupt_delivery(struct kvm_vcpu *vcpu, int delivery_mode,
+		  int trig_mode, int vec);
 
 /* nested.c */
 
@@ -577,6 +579,7 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 			uint32_t guest_irq, bool set);
 void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
+void avic_ring_doorbell(struct kvm_vcpu *vcpu);
 
 /* sev.c */
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 6f69f3e3635e2..8cb5390f75efe 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10039,7 +10039,9 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	 * result in virtual interrupt delivery.
 	 */
 	local_irq_disable();
-	vcpu->mode = IN_GUEST_MODE;
+
+	/* Store vcpu->apicv_active before vcpu->mode.  */
+	smp_store_release(&vcpu->mode, IN_GUEST_MODE);
 
 	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 
-- 
2.26.3

