Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38E58C984
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0CC98BB9;
	Mon,  8 Aug 2022 13:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2517B9CC42
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 13:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659964400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2Le18vEjMuG32IZRZ6acaPMiOe9vJQ/9Cp75yeRk0k=;
 b=Awu0hmPmorf4cNp4/Smx7Cly3cVH/8gFvgViS+BzklLjruhni/dVrVso15L2L66k5G5NC8
 TieeOv4SOl/KvYivr26svU4971s5+7UufEJ5YtUShqUBGvTqS+UAa2cvMiTv6cMiN48JOx
 ALePMhBF80+I+PGuJ5BWSIQDcj0WExU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Z1ChY1ObMhq5-H6R4bta7w-1; Mon, 08 Aug 2022 09:13:19 -0400
X-MC-Unique: Z1ChY1ObMhq5-H6R4bta7w-1
Received: by mail-qt1-f200.google.com with SMTP id
 d29-20020ac8615d000000b0033d168124e9so6745752qtm.19
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=k2Le18vEjMuG32IZRZ6acaPMiOe9vJQ/9Cp75yeRk0k=;
 b=KGPJurAErqX0wuxKwt0277F8XgaYdhY7fzdab/1eh/uwvjp8P32Qxp4idQj/x4IPSM
 Dnya4sJOjjmbRwDm2gs/6ZTR/5Mk9fs3F6CzuHH/y+YRBfcqxhP82HnxCA4KGCc/65xw
 2z9zeFricYGxrcS5S2fG9KzqxmyGXx6pOD9OWfdmLp7NCK+mRJoXHwbSPg3mxfy/92r2
 zoEq1VuqbByDFc1FuvUGRfIqFaAQyWX3HFmC9NwyELj5rs/hdD6666q2E9AHoEaUGrnU
 lYgf4c6rIjLc/ilzRMVR2HRxcLcCOegU1BQaMgbROn7w5Y4IhEUjTqJylVvZp0QaaXGk
 U4FQ==
X-Gm-Message-State: ACgBeo23uIzd46cJAVZMye2WnlRkiK1rUN/zasQP+stgnqHt8vtSE779
 oSukL4A7p8F9i5QxPnyq8HsLTczIuZLZuGsDEsgRzJVGEH+L66c4YDRoP0BTB5MaumEzTz6Szb4
 ZrJvXZPbSm4//ZUwUX1aC43bvjX/E
X-Received: by 2002:a05:6214:c67:b0:476:e8f8:4f6 with SMTP id
 t7-20020a0562140c6700b00476e8f804f6mr16091504qvj.125.1659964397968; 
 Mon, 08 Aug 2022 06:13:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5K08IhOo2vRCi+p3vNMp7OX+5ASJXvVxw1Zpp3dXT8g1dhNI0d+rkJPk6hBou4AA3CbWrhOQ==
X-Received: by 2002:a05:6214:c67:b0:476:e8f8:4f6 with SMTP id
 t7-20020a0562140c6700b00476e8f804f6mr16091436qvj.125.1659964397342; 
 Mon, 08 Aug 2022 06:13:17 -0700 (PDT)
Received: from [10.35.4.238] (bzq-82-81-161-50.red.bezeqint.net.
 [82.81.161.50]) by smtp.gmail.com with ESMTPSA id
 y17-20020a05620a25d100b006b60d5a7205sm9175671qko.51.2022.08.08.06.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 06:13:16 -0700 (PDT)
Message-ID: <fe76ea902a38a10e2d8078fd9e5a71a0c7724d84.camel@redhat.com>
Subject: Nested AVIC design (was:Re: [RFC PATCH v3 04/19] KVM: x86: mmu:
 allow to enable write tracking externally)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Mon, 08 Aug 2022 16:13:09 +0300
In-Reply-To: <YugLc5LLPJkt89z6@google.com>
References: <20220427200314.276673-1-mlevitsk@redhat.com>
 <20220427200314.276673-5-mlevitsk@redhat.com> <YoZyWOh4NPA0uN5J@google.com>
 <5ed0d0e5a88bbee2f95d794dbbeb1ad16789f319.camel@redhat.com>
 <c22a18631c2067871b9ed8a9246ad58fa1ab8947.camel@redhat.com>
 <Yt6/9V0S9of7dueW@google.com>
 <7c4cf32dca42ab84bdb427a9e4862dbf5509f961.camel@redhat.com>
 <YugLc5LLPJkt89z6@google.com>
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 2022-08-01 at 17:20 +0000, Sean Christopherson wrote:
> On Thu, Jul 28, 2022, Maxim Levitsky wrote:
> > On Mon, 2022-07-25 at 16:08 +0000, Sean Christopherson wrote:
> > > On Wed, Jul 20, 2022, Maxim Levitsky wrote:
> > > And on that topic, do you have performance numbers to justify using a single
> > > shared node?  E.g. if every table instance has its own notifier, then no additional
> > > refcounting is needed. 
> > 
> > The thing is that KVM goes over the list of notifiers and calls them for
> > every write from the emulator in fact even just for mmio write, and when you
> > enable write tracking on a page, you just write protect the page and add a
> > mark in the page track array, which is roughly 
> > 
> > 'don't install spte, don't install mmio spte, but just emulate the page fault if it hits this page'
> > 
> > So adding more than a bare minimum to this list, seems just a bit wrong.
> 
> Hmm, I see what you're saying.  To some extent, having a minimal page tracker
> implementation is just that, an implementation detail.  But for better or worse,
> the existing API effectively pushes range checking to the callers.  I agree that
> breaking from that pattern would be odd.
> 
> > >  It's not obvious that a shared node will provide better performance, e.g.
> > >  if there are only a handful of AVIC tables being shadowed, then a linear
> > >  walk of all nodes is likely fast enough, and doesn't bring the risk of a
> > >  write potentially being stalled due to having to acquire a VM-scoped
> > >  mutex.
> > 
> > The thing is that if I register multiple notifiers, they all will be called anyway,
> > but yes I can use container_of, and discover which table the notifier belongs to,
> > instead of having a hash table where I lookup the GFN of the fault.
> > 
> > The above means practically that all the shadow physid tables will be in a linear
> > list of notifiers, so I could indeed avoid per vm mutex on the write tracking,
> > however for simplicity I probably will still need it because I do modify the page,
> > and having per physid table mutex complicates things.
> > 
> > Currently in my code the locking is very simple and somewhat dumb, but the performance
> > is very good because the code isn't executed often, most of the time the AVIC hardware
> > works alone without any VM exits.
> 
> Yes, but because the code isn't executed often, pretty much any solution will
> provide good performance.
> 
> > Once the code is accepted upstream, it's one of the things that can be improved.
> > 
> > Note though that I still need a hash table and a mutex because on each VM entry,
> > the guest can use a different physid table, so I need to lookup it, and create it,
> > if not found, which would require read/write of the hash table and thus a mutex.
> 
> One of the points I'm trying to make is that a hash table isn't strictly required.
> E.g. if I understand the update rules correctly, I believe tables can be tracked
> via an RCU-protected list, with vCPUs taking a spinlock and doing synchronize_rcu()
> when adding/removing a table.  That would avoid having to take any "real" locks in
> the page track notifier.
> 
> The VM-scoped mutex worries me as it will be a bottleneck if L1 is running multiple
> L2 VMs.  E.g. if L1 is frequently switching vmcs12 and thus avic_physical_id, then
> nested VMRUN will effectively get serialized.  That is mitigated to some extent by
> an RCU-protected list, as a sane L1 will use a single table for each L2, and so a
> vCPU will need to add/remove a table if and only if it's the first/last vCPU to
> start/stop running an L2 VM.

Hi Sean, Paolo, and everyone else who wants to review my nested AVIC work.
 
I would like to explain the design choices for locking, and life cycle of the shadow physid tables, and I hope
that this will make it easier for you to review my code and/or make some suggestions on how to improve it.
 
=====================================================================================================================
Explanation of the AVIC physid page (AVIC physical ID table)
=====================================================================================================================
 
This table gives a vCPU enough knowledge of its peers to send them IPIs without VM exit.
 
A vCPU doesn’t use this table to send IPIs to itself and or to process its own interrupts from its own
IRR/ISR. It accesses its APIC backing page directly.
 
This table contains an entry for each vCPU, and each entry contains 2 things:
 
1. A physical address of a peer’s vCPU APIC backing page, so that when sending IPIs to this vCPU
   It can set them in the IRR location in this page (this differs from APICv, which uses PIR bitmaps).
 
   NOTE1: There is also a ‘V’(valid) bit attached to the address - when clear, then whole entry is invalid
   and trying to use it will trigger a VM exit for unicast IPIs, but for broadcast interrupts the
   entry will be ignored.
 
   NOTE2: This part of the entry is not supposed to change during the lifetime of a VM.
 
2. An apic id of a physical vCPU where this vCPU is running (in case of nesting, this would be L1 APIC id).
 
   This field allows AVIC to ring the doorbell on the target physical CPU to make its AVIC process the 
   incoming interrupt request.
 
   It also has a ‘IR’ bit (is running) which when clear indicates that the target vCPU is not running anywhere
   thus the field content is not valid.
 
   - This field is supposed to be changed by L1 once in a while when it either migrates
     the L2's vCPUs around and/or schedules them in/out
 
   - Write tracking of the guest physid table ensures that the shadow physid table is kept up to date.
 
   - In addition to that, the L1's vCPUs can be migrated and/or scheduled in/out, which would 
     lead to an update of the shadow table as well.
     (similar how mmu notifiers need to update the shadow tables, not because of a guest 
     lead change but due to host triggered change)
 
 
- All vCPUs of a nested VM are supposed to share the same physid page, and the page is supposed to contain
  entries such as each entry points to unique apic backing page and contains the L1’s physical apic id,
  On which this nested vCPU runs now (or has is_running=1 meaning that this vCPU is scheduled out)
 
- The number of entries in the physid table (aka max guest apic id) is not specified in it, bur rather it is given
  In the vmcb that references it (also all vmcbs of a guest should have the same value).
 
NOTE: while I say ‘supposed’ I understand that a malicious guest will try to bend each of these
  assumptions and AFAIK I do handle (but often in a slow way) all these unusual cases while
  still following the AVIC spec.
 
=====================================================================================================================
Lifecycle of the shadow physid pages
=====================================================================================================================
 
- An empty shadow physid page is created when a nested entry with AVIC is attempted with a new physid table.
  New shadow physid table is created, and has 0 entries, thus it needs to be synced.
 
- On each VM entry, if the vCPU’s shadow physid table is not NULL but is not synced, then all the entries in the
  table are created (synced):
 
  - the apic backing page pointed by the entry is pinned in ram and its real physical address is written 
    in the shadow entry
 
  - the L1 vCPU in the entry, when valid (is_running=1) is translated to L0 apic id based on which CPU, the L1 vCPU 
    runs, and the value is written in the shadow entry.
 
- On nested VM exit, pretty much nothing is done in regard to shadow physid tables:
  the vCPU keeps its shadow physid table, its shadow entries are still valid and point to pinned apic backing pages.
 
- Once L1 is running, if it is about to schedule the L2’s vCPU off, it can toggle is_running bit, which will trigger
   write tracking and update the shadow physid table.
 
 
- On another nested VM entry with *same* physid table, nothing happens
  (Unless for some reason the guest increased the number of entries, then new entries are synced, which
  is very rare to happen - can only practically happen when nested CPU hotplug happens)
 
- On another nested VM entry with a different physid table:
 
  - The current table refcount is decreased, and the table is freed if it reaches 0. Freeing triggers unpinning of
    all guest apic backing pages referenced by the page.
 
    This relatively simple approach means that if L1 switches a lot between nested guests, and these  guests don't
    have many vCPUs, it would be possible that all nested vCPUs would switch to one  physid page and then to another
    thus triggering freeing of the first and creating of the second page  and then vice versa.
 
    In my testing that doesn't happen that often, unless there is quite some oversubscription  and/or double nesting
    (which leads to L1 running two guests (01 and 02) and switching between them like crazy.
 
    The design choice was made to avoid keeping a cache of physid tables (like mmu does) and  shrinking it once in
    a while.
 
    The problem with such cache is that each inactive physid table in it (which might very well be already reused 
    for something else), will keep all its entries pinned in the guest memory.
 
    With this design choice, the maximum number of shadow physid tables is the number of vCPUs.
 
  - new physid table is looked up in the hash table and created if not found there.
 
 
- When a vCPU disables nesting (clears EFER.SVME) and/or the VM is shut down the physid table that belongs to it,
  has its refcount decreased as well, which can also lead to its freeing.
  
  So when L1 fully disables nesting (in KVM case, means that it destroys all VMs), then all shadow physid
  pages will be freed.
 
 
- When L1 vCPU is migrated across physical cpus and/or scheduled in/out, all shadow physid table's entries which
  reference this vCPU, are updated.
 
  NOTE: usually there will be just one or zero such entries, but if this L1 vCPU is oversubscribed, it is possible 
  that two physid tables would contain entries that reference this vCPU, if two guests are running almost at the 
  same time on this vCPU. 
 
  It can't happen if the nested guest is KVM, because KVM always unloads the previous vCPU before it loads the
  next one, which will lead to setting is_running to 0 on the previous vCPU.
 
  In case of double nesting, KVM also clears is_running bit of L1 guest before running L2.
 
  A linked list of only the entries themselves is kept in each L1's vCPU, and it is protected from races vs write
  tracking by a spinlock.
 
=====================================================================================================================
Locking in the nested AVIC
=====================================================================================================================
 
First of all I use two locks.
 
1. a per VM mutex that roughly shares the same purpose as 'kvm->mmu_lock' and protects the hash table, and also just  
   serializes some operations.
 
2. a per VM spinlock which protects access to the physical CPU portion of physid tables. It is either taken with the
   mutex held or taken alone.
 
The choice of two locks is a bit odd, and I might be able to only have a single spinlock.
 
Let me now explain how the locking is used and how it compares with kvm’s mmu lock:
 
======================================
-> Nested VM entry
======================================
 
  mutex -> spinlock
 
  Mutex ensures that KVM doesn’t race against another nested VM entry which is also trying to create the 
  shadow physid page
 
  Spinlock ensures that we don't race with one of the vCPU schedule in/out, updating the is_running bit,
 
  kvm's mmu:
        - kvm_mmu_load is called when current mmu root is invalid
        - mmu lock is taken, and a new mmu root page is created or existing one looked up in the hash table
 
======================================
-> VM entry
======================================
 
  mutex -> spinlock
 
  (done only when KVM_REQ_APIC_PAGE_RELOAD is pending)
 
  Very similar to the nested VM entry, and in practice will happen *very rarely* because this can happen only if a 
  memslot that *contains* the page got flushed, or if write tracking detected unusual write to the page
  (like update of the avic backing page)
 
  kvm’s mmu:
	- kvm_mmu_load is called when current mmu root is invalid
	- mmu lock is taken, and a new mmu root page is created or existing one looked up in the hash table
 
======================================
-> Write tracking <-
======================================
 
   mutex -> spinlock
 
   Also like the above. 
 
   - Updates only the is_running bits in the shadow physid table.
 
   - Otherwise all entries in the table are erased and the KVM_REQ_APIC_PAGE_RELOAD request raised, which ensures 
     that if that table is used on another CPU, it will sync it before using it again.
     
     That is also very rare to happen, unless the guest stopped using the page as a physid page, in which case
     the page will be just dropped by vCPUs which still reference it but don’t use it.
 
   kvm’s mmu:
 
   - kvm_mmu_pte_write is called
 
   - mmu lock is taken, and a new mmu root page is created or existing one looked up in the hash table
 
   - if unaligned write / write flooding is detected, the page is zapped
 
   - for zapped root pages, since they are still could be in use by other cpus, this removes the table from 
     the linked list + raises KVM_REQ_MMU_FREE_OBSOLETE_ROOTS)
 
   - KVM_REQ_MMU_FREE_OBSOLETE_ROOTS makes each vcpu get rid of its mmu root if zapped, and later will lead
     to 'kvm_mmu_load' creating a new root shadow page
 
     (this is similar to raising KVM_REQ_APIC_PAGE_RELOAD)
 
======================================
-> Memslot flush <-
======================================
 
    mutex -> spinlock
 
   - Memslot flush happens very rarely, and leads to erase of all shadow physid tables in the memslot.
     and raising of KVM_REQ_APIC_PAGE_RELOAD which if some vCPUs use the page, will make them re-sync it.
 
   kvm’s mmu:
       kvm_mmu_invalidate_zap_pages_in_memslot is called which
	   - takes mmu lock
	   - zaps *all* the shadow pages (kvm_mmu_zap_all_fast)
	   - raises KVM_REQ_MMU_FREE_OBSOLETE_ROOTS to get re-create all the current mmu roots
 
======================================
-> L1 vCPU schedule in/out <-
======================================
 
   *only spinlock is taken*
 
    Here the KVM only updates the is_running bit in shadow physid tables that reference it using a linked list of 
    these entries.
 
    Can be optimized to avoid taking spinlock if the linked list is empty, using the correct memory barriers.
 
    kvm mmu: No equivalent.
 
======================================
-> Unaccelerated IPI emulation <-
======================================
 
   * no lock are taken *
 
   Guest physid table is read to determine guest value of is_running bit. This is done without locking vs
   write tracking because the guest must itself insure that it either has locking or barriers to avoid a race here.
 
======================================
-> Nested doorbell emulation <-
======================================
 
   * no lock are taken *
 
   Thankfully the code doesn't need physid table at all, it just needs to translate the L1's apic ID to the L0's 
   apic id and ring the real doorbell.
 
=====================================================================================================================
Ideas for improvement:
=====================================================================================================================
 
1. Stopping pinning the avic backing pages. 
 
   While these pages have to be pinned when a vCPU uses it directly, they don't have to be pinned when a 
   the physid table references it if they could be pinned on demand.
 
   Many of these tables might not be used anymore and until KVM finds out, these backing pages will be pinned 
   for nothing.
 
   The problem with this is that keeping 'V' (valid/present) bit off in the shadow table isn't suitable for 
   on demand access to these entries like one would do in paging - the reason - when sending a broadcast interrupt
   through AVIC, it ignores the non valid entries and doesn't VMexit - which makes sense but ruins the plan.
 
   However there is a way to overcome it. An valid shadow physid table entry is created which points to a 'dummy' 
   page, and doesn't have the 'is_running' bit set. 
 
   For such entry, AVIC will set IRR bits in that dummy page, and then signal unaccelerated IPI vm exit,
   and then KVM can detect the condition, locate and swap in the AVIC backing page and write the bit there manually,
   by looking at what was written in the ICR (that is thankfully in the vm exit info field).
 
   This, together with hooking into mmu notifier to erase shadow physid entries, when an apic backing page is swapped out, 
   should make it work.

   The downside of this is that I will have to emulate more of the AVIC, I will have to set the IRR bits manually
   in the apic backing pages I just pinned.
   And I need a hash to track all avic backing pages, so that when I get mmu notifier notification, I can know
   that a page is a apic backing page, and I also need to know which physid table references it (I need a sort of
   'rmap' for this).
 
2. Use just a spinlock.
 
  - I have to use a spinlock because this is the only locking primitive that can be used from L1's vCPU load/put
    functions which are called from schedule().
 
  - I can avoid using the mutex, which is currently used because allocation of physid table can sleep and also
    because pinning of avic backing pages can sleep and accessing the guest physid table can sleep as well, so by having
    a spinlock, I can take it only in short critical sections where I update the is_running bit in the shadow table
    and nowhere else.
 
    KVM's mmu avoids first issue by having a pre-allocated cache of mmu pages and for the second issue, 
    it either uses atomic guest access functions and retires if they fail (need sleep), or pre-caches the values
    (like in mmu page walk struct) then takes the mmu spinlock, and then uses the read values.

 
Your feedback, ideas, and of course review of the patches is very welcome!
 
Best regards,
	Maxim Levitsky


> 
> > > > I can also stash this boolean (like 'bool registered;') into the 'struct
> > > > kvm_page_track_notifier_node',  and thus allow the
> > > > kvm_page_track_register_notifier to be called more that once -  then I can
> > > > also get rid of __kvm_page_track_register_notifier. 
> > > 
> > > No, allowing redundant registration without proper refcounting leads to pain,
> > > e.g. X registers, Y registers, X unregisters, kaboom.
> > > 
> > 
> > True, but then what about adding a refcount to 'struct kvm_page_track_notifier_node'
> > instead of a boolean, and allowing redundant registration?
> > Probably not worth it, in which case I am OK to add a refcount to my avic code.
> 
> Ya, I would rather force AVIC to do the refcounting.  Existing users don't need a
> refcount, and doing the refcounting in AVIC code means kvm_page_track_notifier_node
> can WARN on redundant registration, i.e. can sanity check the AVIC code to some
> extent.
> 
> > Or maybe just scrap the whole thing and just leave registration and
> > activation of the write tracking as two separate things? Honestly now that
> > looks like the most clean solution.
> 
> It's the easiest, but IMO it's not the cleanest.  Allowing notifiers to be
> registered without tracking being enabled is undesirable, especially since we know
> we can prevent it.
> 





