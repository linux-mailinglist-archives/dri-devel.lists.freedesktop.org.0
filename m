Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C93512382
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F231410E587;
	Wed, 27 Apr 2022 20:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72DD10E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Am71f5MoXzQi71Stjn8gBw9OmI6jTzVjTksW/0/1FrU=;
 b=S88+rJ9lsFuW1okiij37i0elUMmIzvlCBzS4mln0WcBQfxdXxEfC+rLo50ynwt7MV8yr8R
 KKMRC6q+8Fqk5l5z6h/VW+v9oARZrUnNoIxRhd1pdvWZs4gn2LdtrpIr5vI/F8oukBLu+8
 ICFDys95BN9HUwk6CbiGmnCbOryKOAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-56fBFPFpPlCUYVISPPIDqQ-1; Wed, 27 Apr 2022 16:05:03 -0400
X-MC-Unique: 56fBFPFpPlCUYVISPPIDqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E62C6185A7A4;
 Wed, 27 Apr 2022 20:05:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77F9210725;
 Wed, 27 Apr 2022 20:04:56 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 15/19] KVM: x86: nSVM: add code to reload AVIC physid
 table when it is invalidated
Date: Wed, 27 Apr 2022 23:03:10 +0300
Message-Id: <20220427200314.276673-16-mlevitsk@redhat.com>
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

An AVIC table invalidation is not supposed to happen often, and can
only happen when the guest does something suspicious such as:

  - It places physid page in a memslot that is enabled/disabled and memslot
    flushing happens.

  - It tries to update apic backing page addresses - guest has no
    reason to touch this, and doing so on real hardware will likely
    result in unpredictable results.

  - It writes to reserved bits of a tracked page.


  - It write floods a physid table while no vCPU is using it
    (the page is likely reused at that point to contain something else)


All of the above causes a KVM_REQ_APIC_PAGE_RELOAD request to be raised
on all vCPUS, which kicks them out of the guest mode,
and then first vCPU to reach the handler will re-create the entries of
the physid page, and others will notice this and do nothing.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 13 +++++++++++++
 arch/x86/kvm/svm/svm.c  |  1 +
 arch/x86/kvm/svm/svm.h  |  1 +
 3 files changed, 15 insertions(+)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index e6ec525a88625..f13ca1e7b2845 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -379,6 +379,7 @@ static void avic_physid_shadow_table_invalidate(struct kvm *kvm,
 	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
 
 	lockdep_assert_held(&kvm_svm->avic.tables_lock);
+	kvm_make_all_cpus_request(kvm, KVM_REQ_APIC_PAGE_RELOAD);
 	avic_physid_shadow_table_erase(kvm, t);
 }
 
@@ -1638,3 +1639,15 @@ bool avic_nested_has_interrupt(struct kvm_vcpu *vcpu)
 			return true;
 	return false;
 }
+
+void avic_reload_apic_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_svm *vcpu_svm = to_svm(vcpu);
+	struct avic_physid_table *t = vcpu_svm->nested.l2_physical_id_table;
+
+	int nentries = vcpu_svm->nested.ctl.avic_physical_id &
+			AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
+
+	if (t && is_guest_mode(vcpu) && nested_avic_in_use(vcpu))
+		avic_physid_shadow_table_sync(vcpu, t, nentries);
+}
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a39bb0b27a51d..d96a73931d1e5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4677,6 +4677,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 	.enable_nmi_window = svm_enable_nmi_window,
 	.enable_irq_window = svm_enable_irq_window,
 	.update_cr8_intercept = svm_update_cr8_intercept,
+	.reload_apic_pages = avic_reload_apic_pages,
 	.refresh_apicv_exec_ctrl = avic_refresh_apicv_exec_ctrl,
 	.check_apicv_inhibit_reasons = avic_check_apicv_inhibit_reasons,
 	.apicv_post_state_restore = avic_apicv_post_state_restore,
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 17fcc09cf4be1..93fd9d6f5fd85 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -711,6 +711,7 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu);
 void avic_vcpu_unblocking(struct kvm_vcpu *vcpu);
 void avic_ring_doorbell(struct kvm_vcpu *vcpu);
 unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu);
+void avic_reload_apic_pages(struct kvm_vcpu *vcpu);
 void avic_free_nested(struct kvm_vcpu *vcpu);
 bool avic_nested_has_interrupt(struct kvm_vcpu *vcpu);
 
-- 
2.26.3

