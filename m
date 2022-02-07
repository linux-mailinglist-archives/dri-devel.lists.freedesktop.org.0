Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789484AC36D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 16:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF4510EBFD;
	Mon,  7 Feb 2022 15:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B331310EDD9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 15:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPXfeiFExpOXhTUBTnQ3rPqBk4UBybQ6CD98nOBVkzg=;
 b=GhjA4FGs2UE/t1ThDOwONDKvXEva1mQBkfEYQnw/l1cdpkD/2z6v2CRnON8mF5fprowSUG
 5uBtuuvVQcLb03I5OhN46wRq0gQ8URxzBN2M/Y+ZunIfagf3A7ASBb7sUzgbWcT34v/Elf
 2DC30BQh3JD9d1nH4VPywY/HELTRmX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-qDpOo9wfOwuvnAJHTaZYeA-1; Mon, 07 Feb 2022 10:30:52 -0500
X-MC-Unique: qDpOo9wfOwuvnAJHTaZYeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347AA184C5E8;
 Mon,  7 Feb 2022 15:30:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15E57D723;
 Mon,  7 Feb 2022 15:30:41 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH 07/30] KVM: x86: nSVM: deal with L1 hypervisor that intercepts
 interrupts but lets L2 control them
Date: Mon,  7 Feb 2022 17:28:24 +0200
Message-Id: <20220207152847.836777-8-mlevitsk@redhat.com>
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

Fix a corner case in which the L1 hypervisor intercepts
interrupts (INTERCEPT_INTR) and either doesn't set
virtual interrupt masking (V_INTR_MASKING) or enters a
nested guest with EFLAGS.IF disabled prior to the entry.

In this case, despite the fact that L1 intercepts the interrupts,
KVM still needs to set up an interrupt window to wait before
injecting the INTR vmexit.

Currently the KVM instead enters an endless loop of 'req_immediate_exit'.

Exactly the same issue also happens for SMIs and NMI.
Fix this as well.

Note that on VMX, this case is impossible as there is only
'vmexit on external interrupts' execution control which either set,
in which case both host and guest's EFLAGS.IF
are ignored, or not set, in which case no VMexits are delivered.


Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/svm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 9a4e299ed5673..22e614008cf59 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -3372,11 +3372,13 @@ static int svm_nmi_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 	if (svm->nested.nested_run_pending)
 		return -EBUSY;
 
+	if (svm_nmi_blocked(vcpu))
+		return 0;
+
 	/* An NMI must not be injected into L2 if it's supposed to VM-Exit.  */
 	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_nmi(svm))
 		return -EBUSY;
-
-	return !svm_nmi_blocked(vcpu);
+	return 1;
 }
 
 static bool svm_get_nmi_mask(struct kvm_vcpu *vcpu)
@@ -3428,9 +3430,13 @@ bool svm_interrupt_blocked(struct kvm_vcpu *vcpu)
 static int svm_interrupt_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
+
 	if (svm->nested.nested_run_pending)
 		return -EBUSY;
 
+	if (svm_interrupt_blocked(vcpu))
+		return 0;
+
 	/*
 	 * An IRQ must not be injected into L2 if it's supposed to VM-Exit,
 	 * e.g. if the IRQ arrived asynchronously after checking nested events.
@@ -3438,7 +3444,7 @@ static int svm_interrupt_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_intr(svm))
 		return -EBUSY;
 
-	return !svm_interrupt_blocked(vcpu);
+	return 1;
 }
 
 static void svm_enable_irq_window(struct kvm_vcpu *vcpu)
@@ -4169,11 +4175,14 @@ static int svm_smi_allowed(struct kvm_vcpu *vcpu, bool for_injection)
 	if (svm->nested.nested_run_pending)
 		return -EBUSY;
 
+	if (svm_smi_blocked(vcpu))
+		return 0;
+
 	/* An SMI must not be injected into L2 if it's supposed to VM-Exit.  */
 	if (for_injection && is_guest_mode(vcpu) && nested_exit_on_smi(svm))
 		return -EBUSY;
 
-	return !svm_smi_blocked(vcpu);
+	return 1;
 }
 
 static int svm_enter_smm(struct kvm_vcpu *vcpu, char *smstate)
-- 
2.26.3

