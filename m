Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C396B5301FA
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 11:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D3C10F8D6;
	Sun, 22 May 2022 09:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D514F10F8DF
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653210201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZk3PNgU+m5QGZbYbM3Q/AYoB1xcu8VqIfJcE4Df1D8=;
 b=RACHC0nP6DPi3/uyZgDoCdVipe1XEQ/ClFRxrYiRl1+N4BcoUmDdLSyypeudkzVMkB307c
 smhqF+KEjtUo0leyUKNkquQBnoeKzv8RqX9ku3lj53kjvoLPBFop/Kg8U3U9qd5XuJqMdV
 mFuiQhesixax4tZ1QDSZglW2nlL+Qlk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-lDNHqC-NPg6GqFVGjvEqjQ-1; Sun, 22 May 2022 05:03:18 -0400
X-MC-Unique: lDNHqC-NPg6GqFVGjvEqjQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29ECD811E7A;
 Sun, 22 May 2022 09:03:17 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97593492C14;
 Sun, 22 May 2022 09:03:11 +0000 (UTC)
Message-ID: <e32f6c904c92e9e9efabcc697917a232f5e88881.camel@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the
 guest and/or host changes apic id/base from the defaults.
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Sun, 22 May 2022 12:03:10 +0300
In-Reply-To: <YoZrG3n5fgMp4LQl@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com> <YoZrG3n5fgMp4LQl@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Thu, 2022-05-19 at 16:06 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > Neither of these settings should be changed by the guest and it is
> > a burden to support it in the acceleration code, so just inhibit
> > it instead.
> > 
> > Also add a boolean 'apic_id_changed' to indicate if apic id ever changed.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h |  3 +++
> >  arch/x86/kvm/lapic.c            | 25 ++++++++++++++++++++++---
> >  arch/x86/kvm/lapic.h            |  8 ++++++++
> >  3 files changed, 33 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 63eae00625bda..636df87542555 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1070,6 +1070,8 @@ enum kvm_apicv_inhibit {
> >  	APICV_INHIBIT_REASON_ABSENT,
> >  	/* AVIC is disabled because SEV doesn't support it */
> >  	APICV_INHIBIT_REASON_SEV,
> > +	/* APIC ID and/or APIC base was changed by the guest */
> 
> I don't see any reason to inhibit APICv if the APIC base is changed.  KVM has
> never supported that, and disabling APICv won't "fix" anything.

I kind of tacked the APIC base on the thing just to be a good citezen.

In theory currently if the guest changes the APIC base, neither APICv
nor AVIC will even notice, so the guest will still be able to access the
default APIC base and the new APIC base, which is kind of wrong.

Inhibiting APICv/AVIC in this case makes it better and it is very cheap to do.

If you still think that it shouln't be done, I'll remove it.


> 
> Ignoring that is a minor simplification, but also allows for a more intuitive
> name, e.g.
> 
> 	APICV_INHIBIT_REASON_APIC_ID_MODIFIED,
> 
> The inhibit also needs to be added avic_check_apicv_inhibit_reasons() and
> vmx_check_apicv_inhibit_reasons().
> 
> > +	APICV_INHIBIT_REASON_RO_SETTINGS,

> >  };
> >  
> >  struct kvm_arch {
> > @@ -1258,6 +1260,7 @@ struct kvm_arch {
> >  	hpa_t	hv_root_tdp;
> >  	spinlock_t hv_root_tdp_lock;
> >  #endif
> > +	bool apic_id_changed;
> >  };
> >  
> >  struct kvm_vm_stat {
> > diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> > index 66b0eb0bda94e..8996675b3ef4c 100644
> > --- a/arch/x86/kvm/lapic.c
> > +++ b/arch/x86/kvm/lapic.c
> > @@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
> >  	}
> >  }
> >  
> > +static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)
> 
> The "check" part is misleading/confusing.  "check" helpers usually query and return
> state.  I assume you avoided "changed" because the ID may or may not actually be
> changing.  Maybe kvm_apic_id_updated()?  Ah, better idea.  What about
> kvm_lapic_xapic_id_updated()?  See below for reasoning.

This is a very good idea!

> 
> > +{
> > +	if (kvm_apic_has_initial_apic_id(apic))
> 
> Rather than add a single-use helper, invoke the helper from kvm_apic_state_fixup()
> in the !x2APIC path, then this can KVM_BUG_ON() x2APIC to help document that KVM
> should never allow the ID to change for x2APIC.

yes, but we do allow non default x2apic id via userspace api - I wasn't able to convience
you to remove this :)

> 
> > +		return;
> > +
> > +	pr_warn_once("APIC ID change is unsupported by KVM");
> 
> It's supported (modulo x2APIC shenanigans), otherwise KVM wouldn't need to disable
> APICv.

Here, as I said, it would be nice to see that warning if someone complains.
Fact is that AVIC code was totally broken in this regard, and there are probably more,
so it would be nice to see if anybody complains.

If you insist, I'll remove this warning.

> 
> > +	kvm_set_apicv_inhibit(apic->vcpu->kvm,
> > +			APICV_INHIBIT_REASON_RO_SETTINGS);
> > +
> > +	apic->vcpu->kvm->arch.apic_id_changed = true;
> > +}
> > +
> >  static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
> >  {
> >  	int ret = 0;
> > @@ -2046,9 +2059,11 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
> >  
> >  	switch (reg) {
> >  	case APIC_ID:		/* Local APIC ID */
> > -		if (!apic_x2apic_mode(apic))
> > +		if (!apic_x2apic_mode(apic)) {
> > +
> 
> Spurious newline.
Will fix.
> 
> >  			kvm_apic_set_xapic_id(apic, val >> 24);
> > -		else
> > +			kvm_lapic_check_initial_apic_id(apic);
> > +		} else
> 
> Needs curly braces for both paths.
Will fix.
> 
> >  			ret = 1;
> >  		break;
> >  
> 
> E.g.
> 
> ---
>  arch/x86/include/asm/kvm_host.h |  1 +
>  arch/x86/kvm/lapic.c            | 21 +++++++++++++++++++--
>  arch/x86/kvm/svm/avic.c         |  3 ++-
>  arch/x86/kvm/vmx/vmx.c          |  3 ++-
>  4 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index d895d25c5b2f..d888fa1bae77 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1071,6 +1071,7 @@ enum kvm_apicv_inhibit {
>  	APICV_INHIBIT_REASON_BLOCKIRQ,
>  	APICV_INHIBIT_REASON_ABSENT,
>  	APICV_INHIBIT_REASON_SEV,
> +	APICV_INHIBIT_REASON_APIC_ID_MODIFIED,
>  };
> 
>  struct kvm_arch {
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 5fd678c90288..6fe8f20f03d8 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -2039,6 +2039,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
>  	}
>  }
> 
> +static void kvm_lapic_xapic_id_updated(struct kvm_lapic *apic)
> +{
> +	struct kvm *kvm = apic->vcpu->kvm;
> +
> +	if (KVM_BUG_ON(apic_x2apic_mode(apic), kvm))
> +		return;
> +
> +	if (kvm_xapic_id(apic) == apic->vcpu->vcpu_id)
> +		return;
> +
> +	kvm_set_apicv_inhibit(kvm, APICV_INHIBIT_REASON_APIC_ID_MODIFIED);
> +}
> +
>  static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
>  {
>  	int ret = 0;
> @@ -2047,10 +2060,12 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
> 
>  	switch (reg) {
>  	case APIC_ID:		/* Local APIC ID */
> -		if (!apic_x2apic_mode(apic))
> +		if (!apic_x2apic_mode(apic)) {
>  			kvm_apic_set_xapic_id(apic, val >> 24);
> -		else
> +			kvm_lapic_xapic_id_updated(apic);
> +		} else {
>  			ret = 1;
> +		}
>  		break;
> 
>  	case APIC_TASKPRI:
> @@ -2665,6 +2680,8 @@ static int kvm_apic_state_fixup(struct kvm_vcpu *vcpu,
>  			icr = __kvm_lapic_get_reg64(s->regs, APIC_ICR);
>  			__kvm_lapic_set_reg(s->regs, APIC_ICR2, icr >> 32);
>  		}
> +	} else {
> +		kvm_lapic_xapic_id_updated(vcpu->arch.apic);
>  	}
> 
>  	return 0;
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 54fe03714f8a..239c3e8b1f3f 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -910,7 +910,8 @@ bool avic_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
>  			  BIT(APICV_INHIBIT_REASON_PIT_REINJ) |
>  			  BIT(APICV_INHIBIT_REASON_X2APIC) |
>  			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
> -			  BIT(APICV_INHIBIT_REASON_SEV);
> +			  BIT(APICV_INHIBIT_REASON_SEV) |
> +			  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED);
> 
>  	return supported & BIT(reason);
>  }
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index b06eafa5884d..941adade21ea 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7818,7 +7818,8 @@ static bool vmx_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
>  	ulong supported = BIT(APICV_INHIBIT_REASON_DISABLE) |
>  			  BIT(APICV_INHIBIT_REASON_ABSENT) |
>  			  BIT(APICV_INHIBIT_REASON_HYPERV) |
> -			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ);
> +			  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
> +			  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED);
> 
>  	return supported & BIT(reason);
>  }
> 
> base-commit: 6ab6e3842d18e4529fa524fb6c668ae8a8bf54f4



Best regards,
	Thanks for the review,
		Maxim Levitsky
> --
> 


