Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B589C6846
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 05:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508AD10E683;
	Wed, 13 Nov 2024 04:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ZT7wqmL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C5E10E24F;
 Wed, 13 Nov 2024 04:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j1HJo1ufOOxZgsH2EGvRK6a4aBfxJMGSr5VDtSY9Rgs=; b=ZT7wqmL2VOXcAirGj0kjVCjCvh
 4z2BhaS4iVOQ43YLyNmGY43VklL1/Z2O7Ma1NK4RzLuUHfFiUzS2WjkOYB5oKPoFJda3Bx7rTagGw
 jOZn1nnDPQGPUnhJMJHFu4kXX+w8FgWC1U4gfDubH4vy8aK6Mf6LRX/CMPitatQjucVjfC+qTKfkV
 JrRVjk2/BoA8zXvfKHLDICQwWNltHNpqfMqSmAxHbBBbPZSd6hJRwc1k5YwiM7C5ZPiZMducbEvnl
 VIh1yDHuoLwWUumcMyn/Y5kUfjO/K1qrgEniRYXqOBLcIrJyY+T6jb+nbxTL70sAmPUGrDVo22mWO
 vPHnMYtA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tB5RY-0000000Fj5A-3sOC; Wed, 13 Nov 2024 04:57:29 +0000
Date: Wed, 13 Nov 2024 04:57:28 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <tabba@google.com>,
 linux-mm@kvack.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rppt@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 muchun.song@linux.dev, simona@ffwll.ch, airlied@gmail.com,
 pbonzini@redhat.com, seanjc@google.com, jhubbard@nvidia.com,
 ackerleytng@google.com, vannapurve@google.com,
 mail@maciej.szmigiero.name, kirill.shutemov@linux.intel.com,
 quic_eberman@quicinc.com, maz@kernel.org, will@kernel.org,
 qperret@google.com, keirf@google.com, roypat@amazon.co.uk
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
Message-ID: <ZzQxuAiJLbqm5xGO@casper.infradead.org>
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
 <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
 <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
 <ZzLnFh1_4yYao_Yz@casper.infradead.org>
 <e82d7a46-8749-429c-82fa-0c996c858f4a@redhat.com>
 <20241112135348.GA28228@nvidia.com>
 <430b6a38-facf-4127-b1ef-5cfe7c495d63@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <430b6a38-facf-4127-b1ef-5cfe7c495d63@redhat.com>
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

On Tue, Nov 12, 2024 at 03:22:46PM +0100, David Hildenbrand wrote:
> On 12.11.24 14:53, Jason Gunthorpe wrote:
> > On Tue, Nov 12, 2024 at 10:10:06AM +0100, David Hildenbrand wrote:
> > > On 12.11.24 06:26, Matthew Wilcox wrote:
> > > > I don't want you to respin.  I think this is a bad idea.
> > > 
> > > I'm hoping you'll find some more time to explain what exactly you don't
> > > like, because this series only refactors what we already have.
> > > 
> > > I enjoy seeing the special casing (especially hugetlb) gone from mm/swap.c.

I don't.  The list of 'if's is better than the indirect function call.
That's terribly expensive, and the way we reuse the lru.next field
is fragile.  Not to mention that it introduces a new thing for the
hardening people to fret over.

> > And, IMHO, seems like overkill. We have only a handful of cases -
> > maybe we shouldn't be trying to get to full generality but just handle
> > a couple of cases directly? I don't really think it is such a bad
> > thing to have an if ladder on the free path if we have only a couple
> > things. Certainly it looks good instead of doing overlaying tricks.
> 
> I'd really like to abstract hugetlb handling if possible. The way it stands
> it's just very odd.

There might be ways to make that better.  I haven't really been looking
too hard at making that special handling go away.

> We'll need some reliable way to identify these folios that need care.
> guest_memfd will be using folio->mapcount for now, so for now we couldn't
> set a page type like hugetlb does.

If hugetlb can set lru.next at a certain point, then guestmemfd could
set a page type at a similar point, no?

> > Also how does this translate to Matthew's memdesc world?

In a memdesc world, pages no longer have a refcount.  We might still
have put_page() which will now be a very complicated (and out-of-line)
function that looks up what kind of memdesc it is and operates on the
memdesc's refcount ... if it has one.  I don't know if it'll be exported
to modules; I can see uses in the mm code, but I'm not sure if modules
will have a need.

Each memdesc type will have its own function to call to free the memdesc.
So we'll still have folio_put().  But slab does not have, need nor want
a refcount, so it'll just slab_free().  I expect us to keep around a
list of recently-freed memdescs of a particular type with their pages
still attached so that we can allocate them again quickly (or reclaim
them under memory pressure).  Once that freelist overflows, we'll free
a batch of them to the buddy allocator (for the pages) and the slab
allocator (for the memdesc itself).

> guest_memfd and hugetlb would be operating on folios (at least for now),
> which contain the refcount,lru,private, ... so nothing special there.
> 
> Once we actually decoupled "struct folio" from "struct page", we *might*
> have to play less tricks, because we could just have a callback pointer
> there. But well, maybe we also want to save some space in there.
> 
> Do we want dedicated memdescs for hugetlb/guest_memfd that extend folios in
> the future? I don't know, maybe.

I've certainly considered going so far as a per-fs folio.  So we'd
have an ext4_folio, an btrfs_folio, an iomap_folio, etc.  That'd let us
get rid of folio->private, but I'm not sure that C's type system can
really handle this nicely.  Maybe in a Rust world ;-)

What I'm thinking about is that I'd really like to be able to declare
that all the functions in ext4_aops only accept pointers to ext4_folio,
so ext4_dirty_folio() can't be called with pointers to _any_ folio,
but specifically folios which were previously allocated for ext4.

I don't know if Rust lets you do something like that.

> I'm currently wondering if we can use folio->private for the time being.
> Either
> 
> (a) If folio->private is still set once the refcount drops to 0, it
> indicates that there is a freeing callback/owner_ops. We'll have to make
> hugetlb not use folio->private and convert others to clear folio->private
> before freeing.
> 
> (b) Use bitX of folio->private to indicate that this has "owner_ops"
> meaning. We'll have to make hugetlb not use folio->private and make others
> not use bitX. Might be harder and overkill, because right now we only really
> need the callback when refcount==0.
> 
> (c) Use some other indication that folio->private contains folio_ops.

I really don't want to use folio_ops / folio_owner_ops.  I read
https://lore.kernel.org/all/CAGtprH_JP2w-4rq02h_Ugvq5KuHX7TUvegOS7xUs_iy5hriE7g@mail.gmail.com/
and I still don't understand what you're trying to do.

Would it work to use aops->free_folio() to notify you when the folio is
being removed from the address space?
