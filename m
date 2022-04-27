Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA6951237E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94110E57B;
	Wed, 27 Apr 2022 20:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD00D10E56E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUs4DpgdxHTyD0OQTTODRh43DT2WHmGc1ZDpPP7qap8=;
 b=jTa+hOeDAvyJLGYUrGrjFfOgAEp1qOGnDkHEtjc2A5TQggTYYe1+vdqWmiAZkhcKJSVgNy
 R51/9M7Q4KPYApDqE8zrr0WOA6tIKG2871RYhuy31cXFgmlgVXD3QJVxPxZ/gtCVim9hom
 SNkOYz2yLLg2mYxVj6f8ymZZXsOZRIM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-craAUaisNMOfN7hKJZAMCQ-1; Wed, 27 Apr 2022 16:04:57 -0400
X-MC-Unique: craAUaisNMOfN7hKJZAMCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E45080346F;
 Wed, 27 Apr 2022 20:04:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A53DE7C55;
 Wed, 27 Apr 2022 20:04:50 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 14/19] KVM: x86: rename .set_apic_access_page_addr to
 reload_apic_access_page
Date: Wed, 27 Apr 2022 23:03:09 +0300
Message-Id: <20220427200314.276673-15-mlevitsk@redhat.com>
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

This will be used on SVM to reload shadow page of the AVIC physid table

No functional change intended

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm-x86-ops.h | 2 +-
 arch/x86/include/asm/kvm_host.h    | 3 +--
 arch/x86/kvm/vmx/vmx.c             | 8 ++++----
 arch/x86/kvm/x86.c                 | 6 +++---
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 96e4e9842dfc6..997edb7453ac2 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -82,7 +82,7 @@ KVM_X86_OP_OPTIONAL(hwapic_isr_update)
 KVM_X86_OP_OPTIONAL_RET0(guest_apic_has_interrupt)
 KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
 KVM_X86_OP_OPTIONAL(set_virtual_apic_mode)
-KVM_X86_OP_OPTIONAL(set_apic_access_page_addr)
+KVM_X86_OP_OPTIONAL(reload_apic_pages)
 KVM_X86_OP(deliver_interrupt)
 KVM_X86_OP_OPTIONAL(sync_pir_to_irr)
 KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index fc7df778a3d71..52fa04c3108b1 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1436,7 +1436,7 @@ struct kvm_x86_ops {
 	bool (*guest_apic_has_interrupt)(struct kvm_vcpu *vcpu);
 	void (*load_eoi_exitmap)(struct kvm_vcpu *vcpu, u64 *eoi_exit_bitmap);
 	void (*set_virtual_apic_mode)(struct kvm_vcpu *vcpu);
-	void (*set_apic_access_page_addr)(struct kvm_vcpu *vcpu);
+	void (*reload_apic_pages)(struct kvm_vcpu *vcpu);
 	void (*deliver_interrupt)(struct kvm_lapic *apic, int delivery_mode,
 				  int trig_mode, int vector);
 	int (*sync_pir_to_irr)(struct kvm_vcpu *vcpu);
@@ -1909,7 +1909,6 @@ int kvm_cpu_has_extint(struct kvm_vcpu *v);
 int kvm_arch_interrupt_allowed(struct kvm_vcpu *vcpu);
 int kvm_cpu_get_interrupt(struct kvm_vcpu *v);
 void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
-
 int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
 		    unsigned long ipi_bitmap_high, u32 min,
 		    unsigned long icr, int op_64_bit);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index cf8581978bce3..7defd31703c61 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6339,7 +6339,7 @@ void vmx_set_virtual_apic_mode(struct kvm_vcpu *vcpu)
 	vmx_update_msr_bitmap_x2apic(vcpu);
 }
 
-static void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
+static void vmx_reload_apic_access_page(struct kvm_vcpu *vcpu)
 {
 	struct page *page;
 
@@ -7777,7 +7777,7 @@ static struct kvm_x86_ops vmx_x86_ops __initdata = {
 	.enable_irq_window = vmx_enable_irq_window,
 	.update_cr8_intercept = vmx_update_cr8_intercept,
 	.set_virtual_apic_mode = vmx_set_virtual_apic_mode,
-	.set_apic_access_page_addr = vmx_set_apic_access_page_addr,
+	.reload_apic_pages = vmx_reload_apic_access_page,
 	.refresh_apicv_exec_ctrl = vmx_refresh_apicv_exec_ctrl,
 	.load_eoi_exitmap = vmx_load_eoi_exitmap,
 	.apicv_post_state_restore = vmx_apicv_post_state_restore,
@@ -7940,12 +7940,12 @@ static __init int hardware_setup(void)
 		enable_vnmi = 0;
 
 	/*
-	 * set_apic_access_page_addr() is used to reload apic access
+	 * kvm_vcpu_reload_apic_pages() is used to reload apic access
 	 * page upon invalidation.  No need to do anything if not
 	 * using the APIC_ACCESS_ADDR VMCS field.
 	 */
 	if (!flexpriority_enabled)
-		vmx_x86_ops.set_apic_access_page_addr = NULL;
+		vmx_x86_ops.reload_apic_pages = NULL;
 
 	if (!cpu_has_vmx_tpr_shadow())
 		vmx_x86_ops.update_cr8_intercept = NULL;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d2f73ce87a1e3..ad744ab99734c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9949,12 +9949,12 @@ void kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
 		kvm_make_all_cpus_request(kvm, KVM_REQ_APIC_PAGE_RELOAD);
 }
 
-static void kvm_vcpu_reload_apic_access_page(struct kvm_vcpu *vcpu)
+static void kvm_vcpu_reload_apic_pages(struct kvm_vcpu *vcpu)
 {
 	if (!lapic_in_kernel(vcpu))
 		return;
 
-	static_call_cond(kvm_x86_set_apic_access_page_addr)(vcpu);
+	static_call_cond(kvm_x86_reload_apic_pages)(vcpu);
 }
 
 void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu)
@@ -10071,7 +10071,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
 			vcpu_load_eoi_exitmap(vcpu);
 		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
-			kvm_vcpu_reload_apic_access_page(vcpu);
+			kvm_vcpu_reload_apic_pages(vcpu);
 		if (kvm_check_request(KVM_REQ_HV_CRASH, vcpu)) {
 			vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 			vcpu->run->system_event.type = KVM_SYSTEM_EVENT_CRASH;
-- 
2.26.3

