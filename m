Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52C52B49D
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 10:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A92311275F;
	Wed, 18 May 2022 08:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0C610EC1A;
 Wed, 18 May 2022 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652862512; x=1684398512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5CA8FtuEdlmAndh2dvdGmeNEcE6jVfqnArBWtfSrmrA=;
 b=T77Ti53zY/cDro6twKpVk6a3ZYDPZrftjEvM7kSkp7WtVhjr9y0vL96h
 zyynd+J5uz0rMxptYFR+qu/u25bkhfiahlOVuYZ68KDm92qiadTI1Z6TH
 bGw1Q1OJlL3BH8YCztZU7eSDtFZtWMKDEVsTvrccDEm2z63brOET92W4j
 nhi6FZdQ2d1YFSoDcR1rvzGsyLzx1QkB/J4TW5U6R86DHlfAFiwtEIhD2
 eOdQ0Wh3LnrARM0D8R8NwSObMMrJgNsxVgM8eSS8xlPOopBJbe5XWOvO3
 s8IvVMYbodQ44zSjJB0JEDHx1S2vY57rhTfpB6pcz8/4vtFGtfvV6RrR3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="296842855"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="296842855"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:28:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="523408190"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:28:25 -0700
Date: Wed, 18 May 2022 16:28:17 +0800
From: Chao Gao <chao.gao@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Message-ID: <20220518082811.GA8765@gao-cwp>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-3-mlevitsk@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, "H. Peter Anvin" <hpa@zytor.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 11:02:57PM +0300, Maxim Levitsky wrote:
>Neither of these settings should be changed by the guest and it is
>a burden to support it in the acceleration code, so just inhibit
>it instead.
>
>Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
>
>Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
>---
> arch/x86/include/asm/kvm_host.h |  3 +++
> arch/x86/kvm/lapic.c            | 25 ++++++++++++++++++++++---
> arch/x86/kvm/lapic.h            |  8 ++++++++
> 3 files changed, 33 insertions(+), 3 deletions(-)
>
>diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>index 63eae00625bda..636df87542555 100644
>--- a/arch/x86/include/asm/kvm_host.h
>+++ b/arch/x86/include/asm/kvm_host.h
>@@ -1070,6 +1070,8 @@ enum kvm_apicv_inhibit {
> 	APICV_INHIBIT_REASON_ABSENT,
> 	/* AVIC is disabled because SEV doesn't support it */
> 	APICV_INHIBIT_REASON_SEV,
>+	/* APIC ID and/or APIC base was changed by the guest */
>+	APICV_INHIBIT_REASON_RO_SETTINGS,

You need to add it to check_apicv_inhibit_reasons as well.

> };
> 
> struct kvm_arch {
>@@ -1258,6 +1260,7 @@ struct kvm_arch {
> 	hpa_t	hv_root_tdp;
> 	spinlock_t hv_root_tdp_lock;
> #endif
>+	bool apic_id_changed;

What's the value of this boolean? No one reads it.

> };
> 
> struct kvm_vm_stat {
>diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
>index 66b0eb0bda94e..8996675b3ef4c 100644
>--- a/arch/x86/kvm/lapic.c
>+++ b/arch/x86/kvm/lapic.c
>@@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
> 	}
> }
> 
>+static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)
>+{
>+	if (kvm_apic_has_initial_apic_id(apic))
>+		return;
>+
>+	pr_warn_once("APIC ID change is unsupported by KVM");

It is misleading because changing xAPIC ID is supported by KVM; it just
isn't compatible with APICv. Probably this pr_warn_once() should be
removed.

>+
>+	kvm_set_apicv_inhibit(apic->vcpu->kvm,
>+			APICV_INHIBIT_REASON_RO_SETTINGS);

The indentation here looks incorrect to me.
	kvm_set_apicv_inhibit(apic->vcpu->kvm,
			      APICV_INHIBIT_REASON_RO_SETTINGS);

>+
>+	apic->vcpu->kvm->arch.apic_id_changed = true;
>+}
>+
> static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
> {
> 	int ret = 0;
>@@ -2046,9 +2059,11 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
> 
> 	switch (reg) {
> 	case APIC_ID:		/* Local APIC ID */
>-		if (!apic_x2apic_mode(apic))
>+		if (!apic_x2apic_mode(apic)) {
>+
> 			kvm_apic_set_xapic_id(apic, val >> 24);
>-		else
>+			kvm_lapic_check_initial_apic_id(apic);
>+		} else
> 			ret = 1;
> 		break;
> 
>@@ -2335,8 +2350,11 @@ void kvm_lapic_set_base(struct kvm_vcpu *vcpu, u64 value)
> 			     MSR_IA32_APICBASE_BASE;
> 
> 	if ((value & MSR_IA32_APICBASE_ENABLE) &&
>-	     apic->base_address != APIC_DEFAULT_PHYS_BASE)
>+	     apic->base_address != APIC_DEFAULT_PHYS_BASE) {
>+		kvm_set_apicv_inhibit(apic->vcpu->kvm,
>+				APICV_INHIBIT_REASON_RO_SETTINGS);
> 		pr_warn_once("APIC base relocation is unsupported by KVM");
>+	}
> }
> 
> void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
>@@ -2649,6 +2667,7 @@ static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
> 		}
> 	}
> 
>+	kvm_lapic_check_initial_apic_id(vcpu->arch.apic);
> 	return 0;
> }
> 
>diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
>index 4e4f8a22754f9..b9c406d383080 100644
>--- a/arch/x86/kvm/lapic.h
>+++ b/arch/x86/kvm/lapic.h
>@@ -252,4 +252,12 @@ static inline u8 kvm_xapic_id(struct kvm_lapic *apic)
> 	return kvm_lapic_get_reg(apic, APIC_ID) >> 24;
> }
> 
>+static inline bool kvm_apic_has_initial_apic_id(struct kvm_lapic *apic)
>+{
>+	if (apic_x2apic_mode(apic))
>+		return true;

I suggest warning of x2apic mode:
	if (WARN_ON_ONCE(apic_x2apic_mode(apic)))

Because it is weird that callers care about initial apic id when apic is
in x2apic mode.
