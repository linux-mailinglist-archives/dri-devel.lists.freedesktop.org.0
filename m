Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A13530257
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 12:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E06D10E147;
	Sun, 22 May 2022 10:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4210E355
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653214947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgC5JNYrsgqgs2qTUiLYfjxLufYrNUR4cj0BHzuGBF0=;
 b=NO/wVBfoEq/wzcGI612y3hJmdg8hcWaAvcMEimVinsezXr0nAGM2TSu0DUOMpmM/hIdUbg
 JH62sp0WTi01lDE181s1RqBOsWnk1ixHyH9S+fAIj2SODv4XZ67JRTtVQ3YT00mzAbmjMy
 yBtIB+vBJQU2X1KphkDsI0ZFjzrF81I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-UAk-XDoQNkam0zGc1orlpg-1; Sun, 22 May 2022 06:22:22 -0400
X-MC-Unique: UAk-XDoQNkam0zGc1orlpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CE8C185A79C;
 Sun, 22 May 2022 10:22:21 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12FEE7C2A;
 Sun, 22 May 2022 10:22:15 +0000 (UTC)
Message-ID: <71290b6ab1a269b518214721fd233b03440ff636.camel@redhat.com>
Subject: Re: [RFC PATCH v3 06/19] KVM: x86: mmu: add gfn_in_memslot helper
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Sun, 22 May 2022 13:22:14 +0300
In-Reply-To: <YoZzx6f1XBWL3i8F@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-7-mlevitsk@redhat.com> <YoZzx6f1XBWL3i8F@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2022-05-19 at 16:43 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > This is a tiny refactoring, and can be useful to check
> > if a GPA/GFN is within a memslot a bit more cleanly.
> 
> This doesn't explain the actual motivation, which is to use the new helper from
> arch code.
I'll add this in the next version
> 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  include/linux/kvm_host.h | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 252ee4a61b58b..12e261559070b 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1580,6 +1580,13 @@ int kvm_request_irq_source_id(struct kvm *kvm);
> >  void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id);
> >  bool kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args);
> >  
> > +
> > +static inline bool gfn_in_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
> > +{
> > +	return (gfn >= slot->base_gfn && gfn < slot->base_gfn + slot->npages);
> > +}
> > +
> 
> Spurious newline.
> 
> > +
> >  /*
> >   * Returns a pointer to the memslot if it contains gfn.
> >   * Otherwise returns NULL.
> > @@ -1590,12 +1597,13 @@ try_get_memslot(struct kvm_memory_slot *slot, gfn_t gfn)
> >  	if (!slot)
> >  		return NULL;
> >  
> > -	if (gfn >= slot->base_gfn && gfn < slot->base_gfn + slot->npages)
> > +	if (gfn_in_memslot(slot, gfn))
> >  		return slot;
> >  	else
> >  		return NULL;
> 
> At this point, maybe:

No objections.

Thanks for the review.

Best regards,
	Maxim Levitsky

> 
> 	if (!slot || !gfn_in_memslot(slot, gfn))
> 		return NULL;
> 
> 	return slot;
> 
> >  }
> >  
> > +
> >  /*
> >   * Returns a pointer to the memslot that contains gfn. Otherwise returns NULL.
> >   *
> > -- 
> > 2.26.3
> > 


