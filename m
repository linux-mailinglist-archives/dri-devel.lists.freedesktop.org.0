Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BE52B9EB
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 14:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B690F10F40B;
	Wed, 18 May 2022 12:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04A510F410
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652877418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZnwAbpuf8out8csgmDT/1EJa0Dp/wEa0FwZfSMt3EgU=;
 b=fAbahCo0YATze7pzVH1o8kv8t2+O6shAnWtV7O3l+vYgAgsIInJZhPpdGOfkijssluul6p
 yO+N2GsWiInu8ajvGLErUteZWsrzu/deO/4AnbVZ/6qvedK39vMNl65Z5lJquHa54MV9ky
 y8f2A6fNIAWzZup1inISYRJpFrFM4p4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-rJch5im4PDmw0Q0Y98zPcg-1; Wed, 18 May 2022 08:36:52 -0400
X-MC-Unique: rJch5im4PDmw0Q0Y98zPcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC5BF398CA60;
 Wed, 18 May 2022 12:36:51 +0000 (UTC)
Received: from starship (unknown [10.40.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B23940CF8EE;
 Wed, 18 May 2022 12:36:45 +0000 (UTC)
Message-ID: <670fdf36585b1bf7c367cff4ab0653f4c7de8808.camel@redhat.com>
Subject: Re: [RFC PATCH v3 02/19] KVM: x86: inhibit APICv/AVIC when the
 guest and/or host changes apic id/base from the defaults.
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Chao Gao <chao.gao@intel.com>
Date: Wed, 18 May 2022 15:36:44 +0300
In-Reply-To: <20220518115056.GA18087@gao-cwp>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-3-mlevitsk@redhat.com>
 <20220518082811.GA8765@gao-cwp>
 <8c78939bf01a98554696add10e17b07631d97a28.camel@redhat.com>
 <20220518115056.GA18087@gao-cwp>
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
 dri-devel@lists.freedesktop.org, "H. Peter
 Anvin" <hpa@zytor.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 intel-gfx@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 intel-gvt-dev@lists.freedesktop.org, Jim Mattson <jmattson@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-05-18 at 19:51 +0800, Chao Gao wrote:
> On Wed, May 18, 2022 at 12:50:27PM +0300, Maxim Levitsky wrote:
> > > > struct kvm_arch {
> > > > @@ -1258,6 +1260,7 @@ struct kvm_arch {
> > > > 	hpa_t	hv_root_tdp;
> > > > 	spinlock_t hv_root_tdp_lock;
> > > > #endif
> > > > +	bool apic_id_changed;
> > > 
> > > What's the value of this boolean? No one reads it.
> > 
> > I use it in later patches to kill the guest during nested VM entry 
> > if it attempts to use nested AVIC after any vCPU changed APIC ID.
> > 
> > I mentioned this boolean in the commit description.
> > 
> > This boolean avoids the need to go over all vCPUs and checking
> > if they still have the initial apic id.
> 
> Do you want to kill the guest if APIC base got changed? If yes,
> you can check if APICV_INHIBIT_REASON_RO_SETTINGS is set and save
> the boolean.

Yep, I thrown in the apic base just because I can. It doesn't matter to 
my nested AVIC logic at all, but since it is also something that guests
don't change, I also don't care if this will lead to inhibit and
killing the guest if it attempts to use nested AVIC.

That boolean should have the same value as the APICV_INHIBIT_REASON_RO_SETTINGS
inhibit, so yes I can instead check if the inhibit is active.

I don't know if that is cleaner that this boolean though, individual
inhibit value is currently not something that anybody uses in logic.

Best regards,
	Maxim Levitsky


> 
> > In the future maybe we can introduce a more generic 'taint'
> > bitmap with various flags like that, indicating that the guest
> > did something unexpected.
> > 
> > BTW, the other option in regard to the nested AVIC is just to ignore this issue completely.
> > The code itself always uses vcpu_id's, thus regardless of when/how often the guest changes
> > its apic ids, my code would just use the initial APIC ID values consistently.
> > 
> > In this case I won't need this boolean.
> > 
> > > > };
> > > > 
> > > > struct kvm_vm_stat {
> > > > diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> > > > index 66b0eb0bda94e..8996675b3ef4c 100644
> > > > --- a/arch/x86/kvm/lapic.c
> > > > +++ b/arch/x86/kvm/lapic.c
> > > > @@ -2038,6 +2038,19 @@ static void apic_manage_nmi_watchdog(struct kvm_lapic *apic, u32 lvt0_val)
> > > > 	}
> > > > }
> > > > 
> > > > +static void kvm_lapic_check_initial_apic_id(struct kvm_lapic *apic)
> > > > +{
> > > > +	if (kvm_apic_has_initial_apic_id(apic))
> > > > +		return;
> > > > +
> > > > +	pr_warn_once("APIC ID change is unsupported by KVM");
> > > 
> > > It is misleading because changing xAPIC ID is supported by KVM; it just
> > > isn't compatible with APICv. Probably this pr_warn_once() should be
> > > removed.
> > 
> > Honestly since nobody uses this feature, I am not sure if to call this supported,
> > I am sure that KVM has more bugs in regard of using non standard APIC ID.
> > This warning might hopefuly make someone complain about it if this
> > feature is actually used somewhere.
> 
> Now I got you. It is fine to me.
> 


