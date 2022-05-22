Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7253025C
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 12:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7F810E24F;
	Sun, 22 May 2022 10:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA5F10E24F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653214954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lsPbt2EDsFllYzK/7L7lTHe+KfYj5ghUR9vmWSox+jk=;
 b=Num9gk3SUhLxllev69Q0hYGtG+BOS3HizZDVQXXEmEy/YW6KrmJFnHTCJ+DmEmGUtJy9LH
 IA4JhSnQdHVkfebUW8Qeto+Av1c8vh64CQAbYWW9bjulP/ykZnbb1NsE+CM1OKnnpBXOiT
 LNcWhwAp051cMkH0Tac+LVqcWlKG1Po=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-mGS1BWIbPBmSuVqrzBns2g-1; Sun, 22 May 2022 06:22:31 -0400
X-MC-Unique: mGS1BWIbPBmSuVqrzBns2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A55E3804517;
 Sun, 22 May 2022 10:22:29 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00619492C14;
 Sun, 22 May 2022 10:22:23 +0000 (UTC)
Message-ID: <008e29b8acd3f6c5a8c7da461c3c92fc927c10bd.camel@redhat.com>
Subject: Re: [RFC PATCH v3 14/19] KVM: x86: rename
 .set_apic_access_page_addr to reload_apic_access_page
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Sun, 22 May 2022 13:22:22 +0300
In-Reply-To: <YoZ2dh+ZujErT5nk@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-15-mlevitsk@redhat.com>
 <YoZ2dh+ZujErT5nk@google.com>
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

On Thu, 2022-05-19 at 16:55 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > This will be used on SVM to reload shadow page of the AVIC physid table
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index d2f73ce87a1e3..ad744ab99734c 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -9949,12 +9949,12 @@ void kvm_arch_mmu_notifier_invalidate_range(struct kvm *kvm,
> >  		kvm_make_all_cpus_request(kvm, KVM_REQ_APIC_PAGE_RELOAD);
> >  }
> >  
> > -static void kvm_vcpu_reload_apic_access_page(struct kvm_vcpu *vcpu)
> > +static void kvm_vcpu_reload_apic_pages(struct kvm_vcpu *vcpu)
> >  {
> >  	if (!lapic_in_kernel(vcpu))
> >  		return;
> >  
> > -	static_call_cond(kvm_x86_set_apic_access_page_addr)(vcpu);
> > +	static_call_cond(kvm_x86_reload_apic_pages)(vcpu);
> >  }
> >  
> >  void __kvm_request_immediate_exit(struct kvm_vcpu *vcpu)
> > @@ -10071,7 +10071,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
> >  		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
> >  			vcpu_load_eoi_exitmap(vcpu);
> >  		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
> > -			kvm_vcpu_reload_apic_access_page(vcpu);
> > +			kvm_vcpu_reload_apic_pages(vcpu);
> 
> My vote is to add a new request and new kvm_x86_ops hook instead of piggybacking
> KVM_REQ_APIC_PAGE_RELOAD.  The usage in kvm_arch_mmu_notifier_invalidate_range()
> very subtlies relies on the memslot and vma being allocated/controlled by KVM.
> 
> The use in avic_physid_shadow_table_flush_memslot() is too similar in that it
> also deals with memslot changes, but at the same time is _very_ different in that
> it's dealing with user controlled memslots.
> 

No objections, will do.

Best regards,
	Maxim Levitsky

