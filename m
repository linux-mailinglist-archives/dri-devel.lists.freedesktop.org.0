Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2055962FCD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301AE10E5A7;
	Wed, 28 Aug 2024 18:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="V8nptRr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D848910E5A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 18:22:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so59318395e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724869375; x=1725474175; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kGJO04ku/Lmh8lAJ4udIk6gxaBtWAL1i/Zibk51B9zg=;
 b=V8nptRr443yI/qn0oiDHu0wKtRkC1SEqHIHxQcVl4NkZorqsXmtEkasHYfrdIb6Un9
 i+BujknuIy+GInLRnFYjnbm02ukg9GaW6mjMqNDPBfMu7clR2L0PgyP3aE+oJCy3XH9e
 jztIOxD+aKbVk7H+PoB1FA3rnVWMSdQv7Ohn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724869375; x=1725474175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGJO04ku/Lmh8lAJ4udIk6gxaBtWAL1i/Zibk51B9zg=;
 b=hoxqztlL7OHjdy0hpZzKOFcQYHT22B9NPlmBqeMnLqegDoDUBMbrWO64UUYwA2ms1m
 xA/vECWdHOG8Y1fq9lNKBBJgIfrJSek7wX6Qo/EU6SiQPtVBp6CxiiLHgTHGqzc+jOui
 s0uX7Q+sHnX+dPbihQLMNCRANuASorAzz5LdArSdcGcjk/0d3yPsj/5jbw3DNsZngtUZ
 gFDNNHtyZIjhfIQhfarC6skE+GmA9BlyFdDjlaWmiRCgR2vNOXnrGRJSU89RVK/XIauv
 dl0/c2oX67WIf4b0mRR5edisKgDd6fZFEgryoKcFqaYuBZAQ1cSsrg+TrGvEss3RWNsO
 /pBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjCmUpVVnU4NV1obFmKYWtoHMCJJnzuvAyr5sS5Qk9lP7DGHiiCWklZO5KZh0ef6cDg+euAO46ld0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzssM7B9+gwdgGEDp2w9W1GteJTinB+7KfZzbL0lUDttD3pJE9k
 1OHpXossIrZ3i8ENZiTwSFOopH74EV6VmJMJRsVXAOPPo7VnEMDgoZjuXA2KpV8=
X-Google-Smtp-Source: AGHT+IFZOON2xLRB02ESq61KmxfYl6c/9ErP5KS337TLYvq8Ygdk7nKNUlTtjPt5jWWgbZ8qxGeyrQ==
X-Received: by 2002:a05:600c:4fc4:b0:428:1d27:f3db with SMTP id
 5b1f17b1804b1-42bb27b342bmr3008385e9.35.1724869374584; 
 Wed, 28 Aug 2024 11:22:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42baf7fa745sm9021365e9.31.2024.08.28.11.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 11:22:54 -0700 (PDT)
Date: Wed, 28 Aug 2024 20:22:51 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <Zs9q-xrSM3shsER6@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 28, 2024 at 06:06:47PM +0200, Daniel Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:56PM -0700, Matthew Brost wrote:
> > Migration is implemented with range granularity, with VRAM backing being
> > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > 
> > The design choice for using TTM BO for VRAM backing store, as opposed to
> > direct buddy allocation, is as follows:
> > 
> > - DRM buddy allocations are not at page granularity, offering no
> >   advantage over a BO.
> 
> This one I'm not understanding.
> 
> > - DRM buddy allocations do not solve locking inversion problems between
> >   mmap lock and dma-resv locks.
> 
> Which mmap -> dma_resv inversion? I've seen a lot ... I guess it also
> matters hugely which migration path we're in, i.e. opportunistic
> migration, cpu fault where we have to migrate or die, or when we run out
> of vram and need to evict stuff to make space.
> 
> > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> >   evict each other).
> 
> So core mm handles this by just roughly equally shrinking everything.
> Seems to work, and it has a pile of object shrinkers, and the page lru is
> also split into page cache and anon memory.
> 
> I think you need to put in more justification that unified eviction is
> required than just stating it, because a look at mm/ gives a very well
> established counterexample.
> 
> > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> >   require a dma-resv.
> 
> So from the TTM side we need exhaustive eviction, or at least something a
> bit more exhaustive than what ttm currently has. Note that i915-gem also
> never really got to perfect exhaustive eviction, it's just a pile better
> than ttm right now.
> 
> Now if there's also SVM VRAM managed on a page lru, TTM exhaustive
> eviction is going to win because the shrinkers can only trylock dma_resv.
> So this part works. It actually works so well on the system memory side
> that if we're not careful we can trigger oom, because we're too good at
> getting at all the memory.
> 
> SVM VRAM allocations otoh do not need exhaustive evictions. Or at least I
> don't see why, because the idea is that thanks to gpu and cpu page faults,
> you can always get out of a pinch by just trashing everything for a while
> and migrating the handfull of available pages a lot.
> 
> > - Likely allocation size is 2M which makes of size of BO (872)
> >   acceptable per allocation (872 / 2M == .0004158).
> > 
> > With this, using TTM BO for VRAM backing store seems to be an obvious
> > choice as it allows leveraging of the TTM eviction code.
> 
> Except it requires that you hold dma_resv, which brings in all kinds of
> pain. And for eviction we really don't need a lot of synchronization, so a
> lot of that locking is not needed, unlike the case where we have a cpu
> fault, where we absolutely need mmap_lock and all that to make sure we
> fault in the right page.
> 
> But for eviction we only need to throw out some pages, if we're not
> entirely precise with picking the right ones (or have no idea into which
> vma they're all currently mapped into) it doesn't matter. That's why
> migrate_device_pages doesn't care about any of that at all, it doesn't
> need to by design. But by bo backing memory you drag in all that stuff
> that's causing headacheds for eviction.
> 
> The only thing migration tries to do is remove all pte, and if that
> succeeds, move the page. Specialized for the gpusvm case, looking at mm/
> code as cheat sheet, we need roughly:
> 
> - reverse mapping structure like anon_vma. Except gpusvm can assume that
>   there's currently only one gpu side mapping, so we can just stuff the
>   gpusvm an va_address into the page, and protect it with the page lock.
> 
> - we need pagetable locks, so that we can manipulate pagetables (well
>   specifically make ptes invalid) without taking any other locks.
> 
> - everyone else inserting or removing ptes for svm mappings also needs to
>   lock the page, or we have races. This might be the hmm_range_fault races
>   you're seeing when allowing vram pages, since I don't think there's
>   anything else stopping the page lookup otherwise from succeeding.
> 
> - we might also need to stuff migrate ptes into the gpu side, like the cpu
>   does, to hold up refaults before the migration has finished. But I think
>   those are only needed for anon memory in sram because there's no other
>   way to find the right page than swap pte entries, of which migration
>   entries are a special case.
> 
> - core code also expects us to handle the page refcount correctly for svm
>   device memory, so we can't free the pages like normal bo pages either
>   directly to drm_buddy.
> 
> Now typing this all up will look an awful lot like what you have, with the
> dma_resv lock serving as the page lock and the pagetable lock. The only
> reason is that these locks are much smaller and nest within all the other
> stuff going on and so avoid the inversion issues.
> 
> So one annoying part is that this is a lot of pointlessly looking typing.
> The other is that it's full of races, because core mm really is yolo all
> the way down. So lots of ways you lock the wrong page and fun stuff like
> that, but the few cases that matter work:
> 
> - svm fault handling with hmm_range fault retries with mmu notifiers. Note
>   that we need to have vram pages locked and the notifier retrie needs to
>   be under the pagetable lock, or there's room to escape. At least that's
>   what I came up with last time I thought it all through.
> 
> - migrate_to_ram: it will hold a page reference which we know was the
>   valid vram page when the cpu pte was locked, but it might not be it
>   anymore. So we have to lock the page and check whether it's still gpu
>   mapped, and if not retry the entire fault since most likey another
>   migrate_to_ram has succeed meanwhile in parallel.
> 
> - for eviction we don't care, we might actually be migrating a page no one
>   even wants anymore.
> 
> Now I think you can get all this done with the dma_resv lock and maybe the
> bo refcount. But it does involve a tremendous amount of headaches and
> impendence mismatch, because that's not how page faults and migrations
> work in core mm.

Bit a different take, and this might be completely wrong because I've
misread your gpusvm code or the amdkfd code. But I figured it might be
good for understanding when I explain, where the current page lock and
pgatable locks are.

For the pagetable lock:

In amdkfd that's svm_range_lock/unlock. This is also held while
re-checking mmu_notifiers. In gpusvm the equivalent is the
gpusvm->notifier_lock, which is global instead of per notifier range, but
the same idea.

For the page lock:

In amdkfd this is essentiall svm_range->migrate_mutex, it's the thing that
ensures we're consistent with any concurrent other migrations in the same
range. Note that this protects a virtual address range, but because that
has a 1:1 mapping to bot the cpu mm va ranges and to any vram allocations
it defacto serves as the page lock since there can never be more than one
svm_range for a svm vram allocation. That avoids the revalidation dance
core mm/ needs to do once it locks a page, since the va->page mappings
might have changed meanwhile. That's why it's pretty much everywhere just
trylocks while holding the pgtable locks and bailing out if that fails.

In your gpusvm design I guess it should be the bo's dma_resv lock that
backs a gpusvm_range. But it's not consistently enough used, or not with
big enough locking scope to protect against concurrent migration races.
The trouble with using the dma_resv lock like this is that it's not very
compatible with classic dma_resv usage (at least I think, might be wrong).

For core kernel:

Pagetable lock is in each pagetable at each level, so parallelizes
ridiculously. We could adopt that scheme by also storing the mmu notifier
seqno into each pgtable page. That would give us a mmu notifier ranges
that pretty much perfectly scale as we add/remove pagetables and map/unmap
stuff, instead of having to maintain a separate rbtree of ad-hoc notifiers
like gpuvsm and amdkfd do. And because it's hierarchical and we could
store the mmu notifier seqno at each level you can even optimize for both
small and huge ranges and it all checks out, since if the entire huge
range hasn't been invalidated, we can skip checking the ranges below.

page lock is the per-page (or well nowadays often the per-folio) lock. It
makes sure no one can rip the actual data stored in your page away from
underneath you (with migration or something else funny), since the
reference count only makes sure the allocation stays. The refcount itself
does not guarantee that the page you've looked up is actually still the
one that's mapped, it's like the bo refcount in that regard in gpusvm and
amdkfd for svm allocations in vram. Also with folios the locks are now per
chunk size, like gpusvm does.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
