Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC82530250
	for <lists+dri-devel@lfdr.de>; Sun, 22 May 2022 12:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C3C10E045;
	Sun, 22 May 2022 10:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD6210E045
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653214911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajSKHpDgMxCnIlOKAJfBL23NVlLdxTAamDLVJE7LOew=;
 b=GhtKCLiQGz5KGKTBv/iMdo8iKoUOpXDYiSyNoypJezZXaz8lKcn4mkp9UOl9hhx5fZaahS
 MwntMnj8urZ8kdyU8kxHauJM9rEpVVSVhbX7ApzVzBXX518ByqvOUNabj9Prf2A7s8f6tW
 C3/0yB9KpMfy6cPBjOTBhkK9n99LLV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-LOb20kgOPOukB8UtH84T5A-1; Sun, 22 May 2022 06:21:50 -0400
X-MC-Unique: LOb20kgOPOukB8UtH84T5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1D461C05AED;
 Sun, 22 May 2022 10:21:48 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B29232026D6A;
 Sun, 22 May 2022 10:21:42 +0000 (UTC)
Message-ID: <e79a98afda1920a3f8fadd13dc6a20ef2719eeb2.camel@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Sun, 22 May 2022 13:21:41 +0300
In-Reply-To: <YoZv8HmRc7tqQbuL@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZv8HmRc7tqQbuL@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Thu, 2022-05-19 at 16:27 +0000, Sean Christopherson wrote:
> On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > This will be used to enable write tracking from nested AVIC code
> > and can also be used to enable write tracking in GVT-g module
> > when it actually uses it as opposed to always enabling it,
> > when the module is compiled in the kernel.
> 
> Wrap at ~75.
Well, the checkpatch.pl didn't complain, so I didn't notice.

> 
> > No functional change intended.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h       |  2 +-
> >  arch/x86/include/asm/kvm_page_track.h |  1 +
> >  arch/x86/kvm/mmu.h                    |  8 +++++---
> >  arch/x86/kvm/mmu/mmu.c                | 17 ++++++++++-------
> >  arch/x86/kvm/mmu/page_track.c         | 10 ++++++++--
> >  5 files changed, 25 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 636df87542555..fc7df778a3d71 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1254,7 +1254,7 @@ struct kvm_arch {
> >  	 * is used as one input when determining whether certain memslot
> >  	 * related allocations are necessary.
> >  	 */
> 
> The above comment needs to be rewritten.
Good catch, thank a lot!!

> 
> > -	bool shadow_root_allocated;
> > +	bool mmu_page_tracking_enabled;
> >  #if IS_ENABLED(CONFIG_HYPERV)
> >  	hpa_t	hv_root_tdp;
> > diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
> > index eb186bc57f6a9..955a5ae07b10e 100644
> > --- a/arch/x86/include/asm/kvm_page_track.h
> > +++ b/arch/x86/include/asm/kvm_page_track.h
> > @@ -50,6 +50,7 @@ int kvm_page_track_init(struct kvm *kvm);
> >  void kvm_page_track_cleanup(struct kvm *kvm);
> >  
> >  bool kvm_page_track_write_tracking_enabled(struct kvm *kvm);
> > +int kvm_page_track_write_tracking_enable(struct kvm *kvm);
> >  int kvm_page_track_write_tracking_alloc(struct kvm_memory_slot *slot);
> >  
> >  void kvm_page_track_free_memslot(struct kvm_memory_slot *slot);
> > diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> > index 671cfeccf04e9..44d15551f7156 100644
> > --- a/arch/x86/kvm/mmu.h
> > +++ b/arch/x86/kvm/mmu.h
> > @@ -269,7 +269,7 @@ int kvm_arch_write_log_dirty(struct kvm_vcpu *vcpu);
> >  int kvm_mmu_post_init_vm(struct kvm *kvm);
> >  void kvm_mmu_pre_destroy_vm(struct kvm *kvm);
> >  
> > -static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
> > +static inline bool mmu_page_tracking_enabled(struct kvm *kvm)
> >  {
> >  	/*
> >  	 * Read shadow_root_allocated before related pointers. Hence, threads
> > @@ -277,9 +277,11 @@ static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
> >  	 * see the pointers. Pairs with smp_store_release in
> >  	 * mmu_first_shadow_root_alloc.
> >  	 */
> 
> This comment also needs to be rewritten.
Also thanks a lot, next time I'll check comments better.

> 
> > -	return smp_load_acquire(&kvm->arch.shadow_root_allocated);
> > +	return smp_load_acquire(&kvm->arch.mmu_page_tracking_enabled);
> >  }
> 
> ...
> 
> > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > index 2e09d1b6249f3..8857d629036d7 100644
> > --- a/arch/x86/kvm/mmu/page_track.c
> > +++ b/arch/x86/kvm/mmu/page_track.c
> > @@ -21,10 +21,16 @@
> >  
> >  bool kvm_page_track_write_tracking_enabled(struct kvm *kvm)
> 
> This can be static, it's now used only by page_track.c.
I'll fix this.
> 
> >  {
> > -	return IS_ENABLED(CONFIG_KVM_EXTERNAL_WRITE_TRACKING) ||
> > -	       !tdp_enabled || kvm_shadow_root_allocated(kvm);
> > +	return mmu_page_tracking_enabled(kvm);
> >  }
> >  
> > +int kvm_page_track_write_tracking_enable(struct kvm *kvm)
> 
> This is too similar to the "enabled" version; "kvm_page_track_enable_write_tracking()"
> would maintain namespacing and be less confusing.
Makes sense, thanks, will do!

> 
> Hmm, I'd probably vote to make this a "static inline" in kvm_page_track.h, and
> rename mmu_enable_write_tracking() to kvm_mmu_enable_write_tracking and export.
> Not a strong preference, just feels silly to export a one-liner.

The sole reason I did it this way, because 'page_track.c' this way contains all the interfaces
that an external user of write tracking needs to use.

> 
> > +{
> > +	return mmu_enable_write_tracking(kvm);
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_page_track_write_tracking_enable);
> > +
> > +
> >  void kvm_page_track_free_memslot(struct kvm_memory_slot *slot)
> >  {
> >  	int i;
> > -- 
> > 2.26.3
> > 

Best regards,
	Maxim Levitsky



