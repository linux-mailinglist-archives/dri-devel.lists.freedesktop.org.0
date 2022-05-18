Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B552C0E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F47210E909;
	Wed, 18 May 2022 17:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5D10E8D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652894038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qf34QxTWXu6jfX2j3XIj3eZmVPnYfmk76qYQB3qVuUQ=;
 b=hSWjA75XNoalNN0bxldG4RpofH1KVFMI3t8ZFUHPP2fV5TZSP9AQqD0+bW+Z80dc4nYdZX
 JAZt4IZ9w/BZgXEwU4tPfbEai23RfxK+RzOplqRh69RHTljYfyqwX1QN9rtEb8ZgEwlEdy
 vKN4Pa93qhzoVnssUWObYAl3mPCcAw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-IiGtG4eXN_uBsaFoMSm2-g-1; Wed, 18 May 2022 13:13:55 -0400
X-MC-Unique: IiGtG4eXN_uBsaFoMSm2-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C23899ED0;
 Wed, 18 May 2022 17:13:53 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A1B40CF8F0;
 Wed, 18 May 2022 17:13:47 +0000 (UTC)
Message-ID: <c6fbaa85304eb18eb9adf6b6212698d5fe78e9c7.camel@redhat.com>
Subject: Re: [RFC PATCH v3 01/19] KVM: x86: document AVIC/APICv inhibit reasons
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Wed, 18 May 2022 20:13:46 +0300
In-Reply-To: <YoUXFmh9vef4CC+8@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-2-mlevitsk@redhat.com> <YoUXFmh9vef4CC+8@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Wed, 2022-05-18 at 15:56 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > These days there are too many AVIC/APICv inhibit
> > reasons, and it doesn't hurt to have some documentation
> > for them.
> 
> Please wrap at ~75 chars.
> 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index f164c6c1514a4..63eae00625bda 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1046,14 +1046,29 @@ struct kvm_x86_msr_filter {
> >  };
> >  
> >  enum kvm_apicv_inhibit {
> > +	/* APICv/AVIC is disabled by module param and/or not supported in hardware */
> 
> Rather than tag every one as APICv vs. AVIC, what about reorganizing the enums so
> that the common vs. AVIC flags are bundled together?  And then the redundant info
> in the comments about "XYZ is inhibited" can go away too, i.e. the individual
> comments can focus on explaining what triggers the inhibit (and for some, why that
> action is incompatible with APIC virtualization).

Very good idea, will do!

Best regards,
	Maxim Levitsky

> 
> E.g.
> 	/***************************************************************/
> 	/* INHIBITs are relevant to both Intel's APICv and AMD's AVIC. */
> 	/***************************************************************/
> 
> 	/* APIC/AVIC is unsupported and/or disabled via module param. */
> 	APICV_INHIBIT_REASON_DISABLE,
> 
> 	/* The local APIC is not in-kernel.  See KVM_CREATE_IRQCHIP. */
> 	APICV_INHIBIT_REASON_ABSENT,
> 
> 	/*
> 	 * At least one IRQ vector is configured for HyperV's AutoEOI, which
> 	 * requires manually injecting the IRQ to do EOI on behalf of the guest.
> 	 */
> 	APICV_INHIBIT_REASON_HYPERV,
> 	
> 
> 	/**********************************************/
> 	/* INHIBITs relevant only to AMD's AVIC. */
> 	/**********************************************/
> 
> >  	APICV_INHIBIT_REASON_DISABLE,
> > +	/* APICv/AVIC is inhibited because AutoEOI feature is being used by a HyperV guest*/
> >  	APICV_INHIBIT_REASON_HYPERV,
> > +	/* AVIC is inhibited on a CPU because it runs a nested guest */
> >  	APICV_INHIBIT_REASON_NESTED,
> > +	/* AVIC is inhibited due to wait for an irq window (AVIC doesn't support this) */
> >  	APICV_INHIBIT_REASON_IRQWIN,
> > +	/*
> > +	 * AVIC is inhibited because i8254 're-inject' mode is used
> > +	 * which needs EOI intercept which AVIC doesn't support
> > +	 */
> >  	APICV_INHIBIT_REASON_PIT_REINJ,
> > +	/* AVIC is inhibited because the guest has x2apic in its CPUID*/
> >  	APICV_INHIBIT_REASON_X2APIC,
> > +	/* AVIC/APICv is inhibited because KVM_GUESTDBG_BLOCKIRQ was enabled */
> >  	APICV_INHIBIT_REASON_BLOCKIRQ,
> > +	/*
> > +	 * AVIC/APICv is inhibited because the guest didn't yet
> 
> s/guest/userspace
> 
> > +	 * enable kernel/split irqchip
> > +	 */
> >  	APICV_INHIBIT_REASON_ABSENT,
> > +	/* AVIC is disabled because SEV doesn't support it */
> >  	APICV_INHIBIT_REASON_SEV,
> >  };
> >  
> > -- 
> > 2.26.3
> > 


