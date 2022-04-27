Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85797512390
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E35E10E5C4;
	Wed, 27 Apr 2022 20:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC910E5C3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GV3d6wfnLZ9DPMhIuJkRiJ9c+aPcmjflnu/p8xzABDY=;
 b=Ektl3BjUqKhFySJe2iQ9pWl40uZ/9vmkPd/PWwwGuFwner5J/HcKniEQULrP+tvglpsR2Q
 qyflSiWUgeydknydNPrLlNJ/SwMiW/F7odhQZZyXRaKs8wQX9hNXl39uflFqhV+VG+gEmC
 D55K8G8ydmWNxbGJaL2URXblARh6EQs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-YDhqTfXTMQaHEF-ulFcYlQ-1; Wed, 27 Apr 2022 16:05:52 -0400
X-MC-Unique: YDhqTfXTMQaHEF-ulFcYlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC88802812;
 Wed, 27 Apr 2022 20:05:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B0DB9E74;
 Wed, 27 Apr 2022 20:05:35 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 18/19] KVM: x86: SVM/nSVM: add optional non strict AVIC
 doorbell mode
Date: Wed, 27 Apr 2022 23:03:13 +0300
Message-Id: <20220427200314.276673-19-mlevitsk@redhat.com>
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

By default, peers of a vCPU, can send it doorbell messages,
only when that vCPU is assigned (loaded) a physical CPU.

However when doorbell messages are not allowed, this causes all of
the vCPU's peers to get VM exits, which is suboptimal when this
vCPU is not halted, and therefore just temporary not running
in the guest mode due to being scheduled out and/or
having a userspace VM exit.

In this case peers can't make this vCPU enter guest mode faster,
and thus the VM exits they get don't do anything good.

Therefore this patch introduces (disabled by default)
new non strict mode (enabled by setting avic_doorbell_strict
kvm_amd module param to 0), such as when it is enabled,
and a vCPU is scheduled out but not halted, its peers can continue
sending  doorbell messages to the last physical CPU where the vCPU was
last running.

Security wise, a malicious guest with a compromised guest kernel,
can in this mode in some cases slow down whatever is
running on the last physical CPU where a vCPU was running
by spamming it with doorbell messages (hammering on ICR),
from its another vCPU.

Thus this mode is disabled by default.

However if admin policy is to have 1:1 vCPU/pCPU mapping,
this mode can be useful to avoid VM exits when a vCPU has
a userspace VM exit and such.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/svm/avic.c | 16 +++++++++-------
 arch/x86/kvm/svm/svm.c  | 25 +++++++++++++++++++++----
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 149df26e17462..4bf0f00f13c12 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1704,7 +1704,7 @@ avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu, bool r)
 
 void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	u64 entry;
+	u64 old_entry, new_entry;
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
 	struct vcpu_svm *svm = to_svm(vcpu);
 
@@ -1723,14 +1723,16 @@ void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	entry = READ_ONCE(*(svm->avic_physical_id_cache));
-	WARN_ON(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
+	old_entry = READ_ONCE(*(svm->avic_physical_id_cache));
+	new_entry = old_entry;
 
-	entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
-	entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
-	entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+	new_entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+	new_entry |= (h_physical_id & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK);
+	new_entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
+
+	if (old_entry != new_entry)
+		WRITE_ONCE(*(svm->avic_physical_id_cache), new_entry);
 
-	WRITE_ONCE(*(svm->avic_physical_id_cache), entry);
 	avic_update_iommu_vcpu_affinity(vcpu, h_physical_id, true);
 }
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index b31bab832360e..099329711ad13 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -191,6 +191,10 @@ module_param(avic, bool, 0444);
 static bool force_avic;
 module_param_unsafe(force_avic, bool, 0444);
 
+static bool avic_doorbell_strict = true;
+module_param(avic_doorbell_strict, bool, 0444);
+
+
 bool __read_mostly dump_invalid_vmcb;
 module_param(dump_invalid_vmcb, bool, 0644);
 
@@ -1402,10 +1406,23 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 static void svm_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	if (kvm_vcpu_apicv_active(vcpu))
-		__avic_vcpu_put(vcpu);
-
-	__nested_avic_put(vcpu);
+	/*
+	 * Forbid this vCPU's peers to send doorbell messages.
+	 * Unless non strict doorbell mode is used.
+	 *
+	 * In this mode, doorbell messages are forbidden only when a vCPU
+	 * blocks, since for correctness only in this case it is needed
+	 * to intercept an IPI to wake up a vCPU.
+	 *
+	 * However this reduces the isolation of the guest since flood of
+	 * spurious doorbell messages can slow a CPU running another task
+	 * while this vCPU is scheduled out.
+	 */
+	if (avic_doorbell_strict) {
+		if (kvm_vcpu_apicv_active(vcpu))
+			__avic_vcpu_put(vcpu);
+		__nested_avic_put(vcpu);
+	}
 
 	svm_prepare_host_switch(vcpu);
 
-- 
2.26.3

