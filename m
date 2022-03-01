Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6484C930A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 19:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCFB10E6E9;
	Tue,  1 Mar 2022 18:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2355310E722
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646159243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IDLL0J2wmfUo2QHEAi6G+1bVWCJViWSogr2BTd1oZqc=;
 b=Zgp/w+uTzkAD1Obtx0mVcwBvRSawxGV/BMSUWyT4lE6JHKxSSrxURSa693CassKtQZ4lPb
 XWnaL6OiRyc5/EQKttP4kgBMfdW88u76BF4FDDWJqANdZppScPvm1P8VnEYevSCA2jN58D
 38TpLDi67SE/3iw7dMRTMh3SRpZDjoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-GTeinlubPomyZouasXbaPQ-1; Tue, 01 Mar 2022 13:27:20 -0500
X-MC-Unique: GTeinlubPomyZouasXbaPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F48FC80;
 Tue,  1 Mar 2022 18:27:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.195.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA8B086C4D;
 Tue,  1 Mar 2022 18:27:10 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v3 01/11] KVM: x86: SVM: move nested_npt_enabled to svm.h
Date: Tue,  1 Mar 2022 20:26:29 +0200
Message-Id: <20220301182639.559568-2-mlevitsk@redhat.com>
In-Reply-To: <20220301182639.559568-1-mlevitsk@redhat.com>
References: <20220301182639.559568-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It will be used in other places

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/nested.c | 5 -----
 arch/x86/kvm/svm/svm.h    | 9 +++++++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 96bab464967f2..62cda8ae71bbc 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -454,11 +454,6 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
 	vmcb12->control.exit_int_info = exit_int_info;
 }
 
-static inline bool nested_npt_enabled(struct vcpu_svm *svm)
-{
-	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
-}
-
 static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
 {
 	/*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 70850cbe5bcb5..c8dedc4a068d2 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -509,6 +509,11 @@ void svm_complete_interrupt_delivery(struct kvm_vcpu *vcpu, int delivery_mode,
 #define NESTED_EXIT_DONE	1	/* Exit caused nested vmexit  */
 #define NESTED_EXIT_CONTINUE	2	/* Further checks needed      */
 
+static inline bool nested_npt_enabled(struct vcpu_svm *svm)
+{
+	return svm->nested.ctl.nested_ctl & SVM_NESTED_CTL_NP_ENABLE;
+}
+
 static inline bool nested_svm_virtualize_tpr(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -626,4 +631,8 @@ void sev_es_unmap_ghcb(struct vcpu_svm *svm);
 void __svm_sev_es_vcpu_run(unsigned long vmcb_pa);
 void __svm_vcpu_run(unsigned long vmcb_pa, unsigned long *regs);
 
+ /* svm.c */
+ #define MSR_INVALID                            0xffffffffU
+
+
 #endif
-- 
2.26.3

