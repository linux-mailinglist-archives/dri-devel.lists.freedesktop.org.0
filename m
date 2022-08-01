Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D929586E1C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 17:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C064D91025;
	Mon,  1 Aug 2022 15:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB7D1127E0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDrzxcK/hdqF7u8DnUOKQqM/ecXSwkQXnfqic59uxkQ=;
 b=fvr0vBXom4gOmnQZyFA3o+5Q7lCG2q0AqnabgG2DsUDk+0TDXXWdHSNqK+Zf/7evgp+Xry
 eJPIsnCRX2JlYu4eK8oYLEUanrDTYtuuikw7kKLfuqFu1vn1ARVVt715s3lOHsDckt6IBv
 xRp+kxvf8Aa0smWHEAc+KC6mFI9L8/o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-9GoOoRyOOP-3kn0drtBscw-1; Mon, 01 Aug 2022 11:54:06 -0400
X-MC-Unique: 9GoOoRyOOP-3kn0drtBscw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7D4101A586;
 Mon,  1 Aug 2022 15:54:05 +0000 (UTC)
Received: from starship (unknown [10.40.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3AB40E80F4;
 Mon,  1 Aug 2022 15:53:59 +0000 (UTC)
Message-ID: <ad3a01ffe9c6f7fa40a4b51ac88d8fad56606435.camel@redhat.com>
Subject: Re: [RFC PATCH v3 04/19] KVM: x86: mmu: allow to enable write
 tracking externally
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Mon, 01 Aug 2022 18:53:58 +0300
In-Reply-To: <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
 <Yt6/9V0S9of7dueW@google.com>
 <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

On Thu, 2022-07-28 at 10:46 +0300, Maxim Levitsky wrote:
> On Mon, 2022-07-25 at 16:08 +0000, Sean Christopherson wrote:
> > On Wed, Jul 20, 2022, Maxim Levitsky wrote:
> > > On Sun, 2022-05-22 at 13:22 +0300, Maxim Levitsky wrote:
> > > > On Thu, 2022-05-19 at 16:37 +0000, Sean Christopherson wrote:
> > > > > On Wed, Apr 27, 2022, Maxim Levitsky wrote:
> > > > > > @@ -5753,6 +5752,10 @@ int kvm_mmu_init_vm(struct kvm *kvm)
> > > Now for nested AVIC, this is what I would like to do:
> > >  
> > > - just like mmu, I prefer to register the write tracking notifier, when the
> > >   VM is created.
> > > 
> > > - just like mmu, write tracking should only be enabled when nested AVIC is
> > >   actually used first time, so that write tracking is not always enabled when
> > >   you just boot a VM with nested avic supported, since the VM might not use
> > >   nested at all.
> > >  
> > > Thus I either need to use the __kvm_page_track_register_notifier too for AVIC
> > > (and thus need to export it) or I need to have a boolean
> > > (nested_avic_was_used_once) and register the write tracking notifier only
> > > when false and do it not on VM creation but on first attempt to use nested
> > > AVIC.
> > >  
> > > Do you think this is worth it? I mean there is some value of registering the
> > > notifier only when needed (this way it is not called for nothing) but it does
> > > complicate things a bit.
> > 
> > Compared to everything else that you're doing in the nested AVIC code, refcounting
> > the shared kvm_page_track_notifier_node object is a trivial amount of complexity.
> Makes sense.
> 
> > And on that topic, do you have performance numbers to justify using a single
> > shared node?  E.g. if every table instance has its own notifier, then no additional
> > refcounting is needed. 
> 
> The thing is that KVM goes over the list of notifiers and calls them for every write from the emulator
> in fact even just for mmio write, and when you enable write tracking on a page,
> you just write protect the page and add a mark in the page track array, which is roughly 
> 
> 'don't install spte, don't install mmio spte, but just emulate the page fault if it hits this page'
> 
> So adding more than a bare minimum to this list, seems just a bit wrong.
> 
> 
> >  It's not obvious that a shared node will provide better
> > performance, e.g. if there are only a handful of AVIC tables being shadowed, then
> > a linear walk of all nodes is likely fast enough, and doesn't bring the risk of
> > a write potentially being stalled due to having to acquire a VM-scoped mutex.
> 
> The thing is that if I register multiple notifiers, they all will be called anyway,
> but yes I can use container_of, and discover which table the notifier belongs to,
> instead of having a hash table where I lookup the GFN of the fault.
> 
> The above means practically that all the shadow physid tables will be in a linear
> list of notifiers, so I could indeed avoid per vm mutex on the write tracking,
> however for simplicity I probably will still need it because I do modify the page,
> and having per physid table mutex complicates things.
> 
> Currently in my code the locking is very simple and somewhat dumb, but the performance
> is very good because the code isn't executed often, most of the time the AVIC hardware
> works alone without any VM exits.
> 
> Once the code is accepted upstream, it's one of the things that can be improved.
> 
> 
> Note though that I still need a hash table and a mutex because on each VM entry,
> the guest can use a different physid table, so I need to lookup it, and create it,
> if not found, which would require read/write of the hash table and thus a mutex.
> 
> 
> 
> > > I can also stash this boolean (like 'bool registered;') into the 'struct
> > > kvm_page_track_notifier_node',  and thus allow the
> > > kvm_page_track_register_notifier to be called more that once -  then I can
> > > also get rid of __kvm_page_track_register_notifier. 
> > 
> > No, allowing redundant registration without proper refcounting leads to pain,
> > e.g. X registers, Y registers, X unregisters, kaboom.
> > 
> 
> True, but then what about adding a refcount to 'struct kvm_page_track_notifier_node'
> instead of a boolean, and allowing redundant registration? 
> Probably not worth it, in which case I am OK to add a refcount to my avic code.
> 
> Or maybe just scrap the whole thing and just leave registration and activation of the
> write tracking as two separate things? Honestly now that looks like the most clean
> solution.


Kind ping on this. Do you still want me to enable write tracking on the notifier registeration,
or scrap the idea?


Best regards,
	Maxim Levitsky
> 
> Best regards,
> 	Maxim Levitsky


