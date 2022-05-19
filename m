Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51852D9C6
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C510F1A8;
	Thu, 19 May 2022 16:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5237B10F19D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:06:56 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id i17so5199288pla.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vb5Fnrc6nvtN1QtPGNOnSmpxdHdQwhzVPVW+3aY5wHk=;
 b=bthLWmgwcikyZgGW6rfnkIduMLxplP+DXLV0jYgCgLPYDUYOnSFxunRjjtmbMLvTsh
 Sb07SOOLIEr7jmCPXtgmCs1nkY1OAOhbqJj5++OYyW8VQlTC7ix0RDfar6BjM6SQozbU
 CGXT6au5xsfjXj5ZIcMDlpYS2QrDsL+YHg2fxz0By7UbglWG+i0ixwv3IqN+8tepzyzR
 WJSJbjhM8rYadb/PQ+66UpxzMkLvCkqr6aAcJkM/sKJAgqbAZHh1s6d+Qjgo44MK4vnd
 bnMCRhYyAEOQHd0ecCPLdXij7An1AfrHImdoL9qP+DlwZhbKZqm3fxXKQzq1VxefDRit
 EIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vb5Fnrc6nvtN1QtPGNOnSmpxdHdQwhzVPVW+3aY5wHk=;
 b=uJ56aYKDSJ75euhjQgfyGwEx/4ucDDHzlmJQHnlo/XyxYEr31xdE8j5COpj5i8H/nm
 VXkn0IZiKPfu2OrckKE5jpR1nGVANineXm+Mkx0TUObiLdahTQOmtWMDz9xtae/hNOkG
 IAu0DwnW7jbum4XzQqTUHm8rtOWPIe6zYM4JSIt40QmN8Q8+csR11CZkHIm4us9ILdvR
 TtB8Kk9NuoP8AoH3NdBVUyXHH5J7s5Q6stULeXOT64UNB3tEB7tZVvp50FjgOF1mtKlD
 kgP4X5z4J9o7XV4sSAFlZhjLwOzbc/2ihnWLeFpk1cRrJiJ7FGdUbTT55jUnIwCqqbWs
 c4Qg==
X-Gm-Message-State: AOAM5319WAzxGJxhrvo6Yqrm9qcC8Tmyc8nif2Lbtn/6+ODhJOpLHm4W
 74+gSMmcigB5cWJI+EOCKbOe7A==
X-Google-Smtp-Source: ABdhPJyeLc4AGyvXKd1KpG/Rm0x8OTOUXyvVlK/e3r152D9+knL3BxE9xzM0Up4sV2KRWTCnHP/A4A==
X-Received: by 2002:a17:90b:1c82:b0:1dd:1b46:5aa9 with SMTP id
 oo2-20020a17090b1c8200b001dd1b465aa9mr5954557pjb.158.1652976415612; 
 Thu, 19 May 2022 09:06:55 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 b2-20020a621b02000000b005182d0a3d5csm4029858pfb.7.2022.05.19.09.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:06:55 -0700 (PDT)
Date: Thu, 19 May 2022 16:06:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the guest
 and/or host changes apic id/base from the defaults.
Message-ID: <YoZrG3n5fgMp4LQl@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427200314.276673-3-mlevitsk@redhat.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> Neither of these settings should be changed by the guest and it is
> a burden to support it in the acceleration code, so just inhibit
> it instead.
> 
> Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  3 +++
>  arch/x86/kvm/lapic.c            | 25 ++++++++++++++++++++++---
>  arch/x86/kvm/lapic.h            |  8 ++++++++
>  3 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 63eae00625bda..636df87542555 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1070,6 +1070,8 @@ enum kvm_apicv_inhibit {
>  	APICV_INHIBIT_REASON_ABSENT,
>  	/* AVIC is disabled because SEV doesn't support it */
>  	APICV_INHIBIT_REASON_SEV,
> +	/* APIC ID and/or APIC base was changed by the guest */

I don't see any reason to inhibit APICv if the APIC base is changed.  KVM has
never supported that, and disabling APICv won't "fix" anything.

Ignoring that is a minor simplification, but also allows for a more intuitive
name, e.g.

	APICV_INHIBIT_REASON_APIC_ID_MODIFIED,

The inhibit also needs to be added avic_check_apicv_inhibit_reasons() and
vmx_check_apicv_inhibit_reasons().

> +	APICV_INHIBIT_REASON_RO_SETTINGS,
>  };
>  
>  struct kvm_arch {
> @@ -1258,6 +1260,7 @@ struct kvm_arch {
>  	hpa_t	hv_root_tdp;
>  	spinlock_t hv_root_tdp_lock;
>  #endif
> +	bool apic_id_changed;
>  };
>  
>  struct kvm_vm_stat {
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 66b0eb0bda94e..8996675b3ef4c 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
>  	}
>  }
>  
> +static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)

The "check" part is misleading/confusing.  "check" helpers usually query and return
state.  I assume you avoided "changed" because the ID may or may not actually be
changing.  Maybe kvm_apic_id_updated()?  Ah, better idea.  What about
kvm_lapic_xapic_id_updated()?  See below for reasoning.

> +{
> +	if (kvm_apic_has_initial_apic_id(apic))

Rather than add a single-use helper, invoke the helper from kvm_apic_state_fixup()
in the !x2APIC path, then this can KVM_BUG_ON() x2APIC to help document that KVM
should never allow the ID to change for x2APIC.

> +		return;
> +
> +	pr_warn_once("APIC ID change is unsupported by KVM");

It's supported (modulo x2APIC shenanigans), otherwise KVM wouldn't need to disable
APICv.

> +	kvm_set_apicv_inhibit(apic->vcpu->kvm,
> +			APICV_INHIBIT_REASON_RO_SETTINGS);
> +
> +	apic->vcpu->kvm->arch.apic_id_changed = true;
> +}
> +
>  static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
>  {
>  	int ret = 0;
> @@ -2046,9 +2059,11 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
>  
>  	switch (reg) {
>  	case APIC_ID:		/* Local APIC ID */
> -		if (!apic_x2apic_mode(apic))
> +		if (!apic_x2apic_mode(apic)) {
> +

Spurious newline.

>  			kvm_apic_set_xapic_id(apic, val >> 24);
> -		else
> +			kvm_lapic_check_initial_apic_id(apic);
> +		} else

Needs curly braces for both paths.

>  			ret = 1;
>  		break;
>  

E.g.

---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/lapic.c            | 21 +++++++++++++++++++--
 arch/x86/kvm/svm/avic.c         |  3 ++-
 arch/x86/kvm/vmx/vmx.c          |  3 ++-
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d895d25c5b2f..d888fa1bae77 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1071,6 +1071,7 @@ enum kvm_apicv_inhibit {
 	APICV_INHIBIT_REASON_BLOCKIRQ,
 	APICV_INHIBIT_REASON_ABSENT,
 	APICV_INHIBIT_REASON_SEV,
+	APICV_INHIBIT_REASON_APIC_ID_MODIFIED,
 };

 struct kvm_arch {
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 5fd678c90288..6fe8f20f03d8 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2039,6 +2039,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
 	}
 }

+static void kvm_lapic_xapic_id_updated(struct kvm_lapic *apic)
+{
+	struct kvm *kvm = apic->vcpu->kvm;
+
+	if (KVM_BUG_ON(apic_x2apic_mode(apic), kvm))
+		return;
+
+	if (kvm_xapic_id(apic) == apic->vcpu->vcpu_id)
+		return;
+
+	kvm_set_apicv_inhibit(kvm, APICV_INHIBIT_REASON_APIC_ID_MODIFIED);
+}
+
 static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 {
 	int ret = 0;
@@ -2047,10 +2060,12 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)

 	switch (reg) {
 	case APIC_ID:		/* Local APIC ID */
-		if (!apic_x2apic_mode(apic))
+		if (!apic_x2apic_mode(apic)) {
 			kvm_apic_set_xapic_id(apic, val >> 24);
-		else
+			kvm_lapic_xapic_id_updated(apic);
+		} else {
 			ret = 1;
+		}
 		break;

 	case APIC_TASKPRI:
@@ -2665,6 +2680,8 @@ static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
 			icr = __kvm_lapic_get_reg64(s->regs, APIC_ICR);
 			__kvm_lapic_set_reg(s->regs, APIC_ICR2, icr >> 32);
 		}
+	} else {
+		kvm_lapic_xapic_id_updated(vcpu->arch.apic);
 	}

 	return 0;
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 54fe03714f8a..239c3e8b1f3f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -910,7 +910,8 @@ bool avic_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
 			  BIT(APICV_INHIBIT_REASON_PIT_REINJ) |
 			  BIT(APICV_INHIBIT_REASON_X2APIC) |
 			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
-			  BIT(APICV_INHIBIT_REASON_SEV);
+			  BIT(APICV_INHIBIT_REASON_SEV) |
+			  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED);

 	return supported & BIT(reason);
 }
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b06eafa5884d..941adade21ea 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7818,7 +7818,8 @@ static bool vmx_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
 	ulong supported = BIT(APICV_INHIBIT_REASON_DISABLE) |
 			  BIT(APICV_INHIBIT_REASON_ABSENT) |
 			  BIT(APICV_INHIBIT_REASON_HYPERV) |
-			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ);
+			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
+			  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED);

 	return supported & BIT(reason);
 }

base-commit: 6ab6e3842d18e4529fa524fb6c668ae8a8bf54f4
--

