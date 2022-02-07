Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C074AC3C1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D7010E450;
	Mon,  7 Feb 2022 15:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB65112464
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644248057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Xxoic2Sn/qFA/mhRCvHnS08xjpesyCCqOxwVNKsehI=;
 b=U3zMK3SQfj2XiOlmHaGPD7y3qcOBC0nDpA3Ix0iTaSgEvPr3SBdPNG7UQoqwvAxQSrj90n
 KoNFEVqxAhDi77XTJOzRXPGgFxOwoE2tdaF0l2kKeHXHR9PTox+dn7cMkuGAuqYfNVDItX
 e/xlVZeJLrFYXaw0j53sqFgWzqBqJSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-liy7FMWTPFmy0kaoiLc8fg-1; Mon, 07 Feb 2022 10:34:14 -0500
X-MC-Unique: liy7FMWTPFmy0kaoiLc8fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90F3363A4;
 Mon,  7 Feb 2022 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8809184FF5;
 Mon,  7 Feb 2022 15:33:38 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 27/30] KVM: x86: add force_intercept_exceptions_mask
Date: Mon,  7 Feb 2022 17:28:44 +0200
Message-Id: <20220207152847.836777-28-mlevitsk@redhat.com>
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
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>" <intel-gfx@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This parameter will be used by VMX and SVM code to force
interception of a set of exceptions, given by a bitmask
for guest debug and/or kvm debug.

This is based on an idea first shown here:
https://patchwork.kernel.org/project/kvm/patch/20160301192822.GD22677@pd.tnic/

CC: Borislav Petkov <bp@suse.de>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 7 +++++++
 arch/x86/kvm/x86.c              | 9 +++++++++
 arch/x86/kvm/x86.h              | 5 +++++
 3 files changed, 21 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 428ab1cc7dd34..fa498612839a0 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1168,6 +1168,13 @@ struct kvm_arch {
 	struct kvm_pmu_event_filter __rcu *pmu_event_filter;
 	struct task_struct *nx_lpage_recovery_thread;
 
+	/*
+	 * Bitmask of exceptions that KVM will intercept
+	 * and forward to the guest, even if that is not needed
+	 * for normal operation. Debug feature.
+	 */
+	u32 force_intercept_exceptions_bitmask;
+
 #ifdef CONFIG_X86_64
 	/*
 	 * Whether the TDP MMU is enabled for this VM. This contains a
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 63d84c373e465..202c34697852f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -193,6 +193,13 @@ module_param(enable_pmu, bool, 0444);
 bool __read_mostly eager_page_split = true;
 module_param(eager_page_split, bool, 0644);
 
+/*
+ * force_intercept_exceptions_mask is a writable param and its value
+ * is snapshotted when a VM is created
+ */
+static uint force_intercept_exceptions_mask;
+module_param(force_intercept_exceptions_mask, uint, S_IRUGO | S_IWUSR);
+
 /*
  * Restoring the host value for MSRs that are only consumed when running in
  * usermode, e.g. SYSCALL MSRs and TSC_AUX, can be deferred until the CPU
@@ -11646,6 +11653,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	raw_spin_unlock_irqrestore(&kvm->arch.tsc_write_lock, flags);
 
 	kvm->arch.guest_can_read_msr_platform_info = true;
+	kvm->arch.force_intercept_exceptions_bitmask = force_intercept_exceptions_mask;
 
 #if IS_ENABLED(CONFIG_HYPERV)
 	spin_lock_init(&kvm->arch.hv_root_tdp_lock);
@@ -12886,6 +12894,7 @@ int kvm_sev_es_string_io(struct kvm_vcpu *vcpu, unsigned int size,
 }
 EXPORT_SYMBOL_GPL(kvm_sev_es_string_io);
 
+
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_entry);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_exit);
 EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_fast_mmio);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index e9b303b21f173..34f96f483c7e5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -91,6 +91,11 @@ static inline bool kvm_exception_is_soft(unsigned int nr)
 	return (nr == BP_VECTOR) || (nr == OF_VECTOR);
 }
 
+static inline bool kvm_is_exception_force_intercepted(struct kvm *kvm, int exception)
+{
+	return kvm->arch.force_intercept_exceptions_bitmask & BIT(exception);
+}
+
 static inline bool is_protmode(struct kvm_vcpu *vcpu)
 {
 	return kvm_read_cr0_bits(vcpu, X86_CR0_PE);
-- 
2.26.3

