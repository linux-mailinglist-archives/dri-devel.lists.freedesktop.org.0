Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCB512350
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 22:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA32F10E399;
	Wed, 27 Apr 2022 20:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B5610E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 20:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651089819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3HuyXBj7sbCyPJII4k+rhKVq+N2QJKVq0tQDMGX/Io=;
 b=eYGOCeGS/KgeYmQ+KKojnUECmm2401/HTJeTRZiPbiywfS0SbGfiB4DwMSyXfRG+yHL1ZH
 iNLX89/xig8lwe/xds+NA5995zxKBs48z12OZWWB8ZuRpessXpt4oKe5Ayaw8/Xe4cjplb
 iRrQJEEvEzUCM2GerlHmIvW1CE5nW5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-gDqYxOC3NJe1YVvQKWXlBQ-1; Wed, 27 Apr 2022 16:03:36 -0400
X-MC-Unique: gDqYxOC3NJe1YVvQKWXlBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92F9D101AA44;
 Wed, 27 Apr 2022 20:03:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE3D9E82;
 Wed, 27 Apr 2022 20:03:28 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Date: Wed, 27 Apr 2022 23:02:57 +0300
Message-Id: <20220427200314.276673-3-mlevitsk@redhat.com>
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

Neither of these settings should be changed by the guest and it is
a burden to support it in the acceleration code, so just inhibit
it instead.

Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/lapic.c            | 25 ++++++++++++++++++++++---
 arch/x86/kvm/lapic.h            |  8 ++++++++
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 63eae00625bda..636df87542555 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1070,6 +1070,8 @@ enum kvm_apicv_inhibit {
 	APICV_INHIBIT_REASON_ABSENT,
 	/* AVIC is disabled because SEV doesn't support it */
 	APICV_INHIBIT_REASON_SEV,
+	/* APIC ID and/or APIC base was changed by the guest */
+	APICV_INHIBIT_REASON_RO_SETTINGS,
 };
 
 struct kvm_arch {
@@ -1258,6 +1260,7 @@ struct kvm_arch {
 	hpa_t	hv_root_tdp;
 	spinlock_t hv_root_tdp_lock;
 #endif
+	bool apic_id_changed;
 };
 
 struct kvm_vm_stat {
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 66b0eb0bda94e..8996675b3ef4c 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
 	}
 }
 
+static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)
+{
+	if (kvm_apic_has_initial_apic_id(apic))
+		return;
+
+	pr_warn_once("APIC ID change is unsupported by KVM");
+
+	kvm_set_apicv_inhibit(apic->vcpu->kvm,
+			APICV_INHIBIT_REASON_RO_SETTINGS);
+
+	apic->vcpu->kvm->arch.apic_id_changed = true;
+}
+
 static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 {
 	int ret = 0;
@@ -2046,9 +2059,11 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 
 	switch (reg) {
 	case APIC_ID:		/* Local APIC ID */
-		if (!apic_x2apic_mode(apic))
+		if (!apic_x2apic_mode(apic)) {
+
 			kvm_apic_set_xapic_id(apic, val >> 24);
-		else
+			kvm_lapic_check_initial_apic_id(apic);
+		} else
 			ret = 1;
 		break;
 
@@ -2335,8 +2350,11 @@ void kvm_lapic_set_base(struct kvm_vcpu *vcpu, u64 value)
 			     MSR_IA32_APICBASE_BASE;
 
 	if ((value & MSR_IA32_APICBASE_ENABLE) &&
-	     apic->base_address != APIC_DEFAULT_PHYS_BASE)
+	     apic->base_address != APIC_DEFAULT_PHYS_BASE) {
+		kvm_set_apicv_inhibit(apic->vcpu->kvm,
+				APICV_INHIBIT_REASON_RO_SETTINGS);
 		pr_warn_once("APIC base relocation is unsupported by KVM");
+	}
 }
 
 void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
@@ -2649,6 +2667,7 @@ static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
 		}
 	}
 
+	kvm_lapic_check_initial_apic_id(vcpu->arch.apic);
 	return 0;
 }
 
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 4e4f8a22754f9..b9c406d383080 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -252,4 +252,12 @@ static inline u8 kvm_xapic_id(struct kvm_lapic *apic)
 	return kvm_lapic_get_reg(apic, APIC_ID) >> 24;
 }
 
+static inline bool kvm_apic_has_initial_apic_id(struct kvm_lapic *apic)
+{
+	if (apic_x2apic_mode(apic))
+		return true;
+
+	return kvm_xapic_id(apic) == apic->vcpu->vcpu_id;
+}
+
 #endif
-- 
2.26.3

