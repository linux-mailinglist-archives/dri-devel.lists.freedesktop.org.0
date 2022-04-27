Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D166051238D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7610E5BB;
	Wed, 27 Apr 2022 20:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519B10E5C2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yA9Ogh+XZjCqc2vT+o0W3Eipd0C5KqefizxAchXjEVE=;
 b=Tne9iSDPebKu/feFFETnJrg5Y9qhaq4BU+iZXxi1q0bAQHObhPiNTvcvnLbnJBtzCcswdc
 SXDpZgYxWgYVFsILtaDn4QYNeWEtD5WBajukqIu5fBX5ExG7i6xOegCrXnGIR8rcbgXWqA
 VQ1EV6epGbeiF0kg6vqc/OJusfQ56go=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-qLc1Y9eCOsGgT0TQKKNudg-1; Wed, 27 Apr 2022 16:05:36 -0400
X-MC-Unique: qLc1Y9eCOsGgT0TQKKNudg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D94E980418D;
 Wed, 27 Apr 2022 20:05:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1676E9E74;
 Wed, 27 Apr 2022 20:05:08 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 17/19] KVM: x86: nSVM: implement nested AVIC doorbell
 emulation
Date: Wed, 27 Apr 2022 23:03:12 +0300
Message-Id: <20220427200314.276673-18-mlevitsk@redhat.com>
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

This patch implements the doorbell msr emulation
for nested AVIC.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 49 +++++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/svm/svm.c  |  2 ++
 arch/x86/kvm/svm/svm.h  |  1 +
 3 files changed, 52 insertions(+)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index e8c53fd77f0b1..149df26e17462 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1165,6 +1165,55 @@ unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+int avic_emulate_doorbell_write(struct kvm_vcpu *vcpu, u64 data)
+{
+	int source_l1_apicid = vcpu->vcpu_id;
+	int target_l1_apicid = data & AVIC_DOORBELL_PHYSICAL_ID_MASK;
+	bool target_running, target_nested;
+	struct kvm_vcpu *target;
+	struct vcpu_svm *svm = to_svm(vcpu);
+
+	if (!svm->avic_enabled || (data & ~AVIC_DOORBELL_PHYSICAL_ID_MASK))
+		return 1;
+
+	target = avic_vcpu_by_l1_apicid(vcpu->kvm, target_l1_apicid);
+	if (!target)
+		/* Guest bug: targeting invalid APIC ID. */
+		return 0;
+
+	target_running = READ_ONCE(target->mode) == IN_GUEST_MODE;
+	target_nested = is_guest_mode(target);
+
+	trace_kvm_avic_nested_doorbell(source_l1_apicid, target_l1_apicid,
+				       target_nested, target_running);
+
+	/*
+	 * Target is not in the nested mode, thus the doorbell doesn't affect it.
+	 * If it just became nested after is_guest_mode was checked,
+	 * it means that it just processed AVIC state and KVM doesn't need
+	 * to send it another doorbell.
+	 */
+	if (!target_nested)
+		return 0;
+
+	/*
+	 * If the target vCPU is in guest mode, kick the real doorbell.
+	 * Otherwise KVM needs to try to wake it up if it was sleeping.
+	 *
+	 * If the target is not longer in guest mode (just exited it),
+	 * it will either halt and before that it will notice pending IRR
+	 * bits, and cancel halting, or it will enter the guest mode again,
+	 * and notice the IRR bits as well.
+	 */
+	if (target_running)
+		wrmsr(MSR_AMD64_SVM_AVIC_DOORBELL,
+		      kvm_cpu_get_apicid(READ_ONCE(target->cpu)), 0);
+	else
+		kvm_vcpu_wake_up(target);
+
+	return 0;
+}
+
 static u32 *avic_get_logical_id_entry(struct kvm_vcpu *vcpu, u32 ldr, bool flat)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d96a73931d1e5..b31bab832360e 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2772,6 +2772,8 @@ static int svm_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr)
 	u32 ecx = msr->index;
 	u64 data = msr->data;
 	switch (ecx) {
+	case MSR_AMD64_SVM_AVIC_DOORBELL:
+		return avic_emulate_doorbell_write(vcpu, data);
 	case MSR_AMD64_TSC_RATIO:
 
 		if (!svm->tsc_scaling_enabled) {
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 93fd9d6f5fd85..14e2c5c451cad 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -714,6 +714,7 @@ unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu);
 void avic_reload_apic_pages(struct kvm_vcpu *vcpu);
 void avic_free_nested(struct kvm_vcpu *vcpu);
 bool avic_nested_has_interrupt(struct kvm_vcpu *vcpu);
+int avic_emulate_doorbell_write(struct kvm_vcpu *vcpu, u64 data);
 
 struct avic_physid_table *
 avic_physid_shadow_table_get(struct kvm_vcpu *vcpu, gfn_t gfn);
-- 
2.26.3

