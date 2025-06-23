Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1A2AE5811
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 01:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ABB10E47F;
	Mon, 23 Jun 2025 23:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sIKXIz8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608E010E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 23:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 16B59A500E5;
 Mon, 23 Jun 2025 23:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724C6C4CEEA;
 Mon, 23 Jun 2025 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1750721747;
 bh=v3mXMdkiN3SKrn9IVtLWTsSO9yIG76lq1pU/dQfOUFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sIKXIz8vgnVPk1Xk/E6PE+l07VvE/mtIAWNojffeIsvHVGhRSAVFkgy4h1/ivb6kp
 bhpzSKQwAWzEbjJYEv9gjBHh6QsIWEW4E4M2gDGM9jxC9BXQAY3IWfxlqoXsX4k9yK
 VPPLPgfn4aZGoQ+cD4czH2EWTLQgf9rOmW4yfk1w=
Date: Mon, 23 Jun 2025 16:35:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 "David Hildenbrand" <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if
 there are no resv
Message-Id: <20250623163546.ddb768e0833f7a19af259a43@linux-foundation.org>
In-Reply-To: <IA0PR11MB71859403C79419049C075E44F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
 <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
 <IA0PR11MB71859403C79419049C075E44F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 19 Jun 2025 05:30:52 +0000 "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:

> Hi Andrew, Anshuman,
> 
> > Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if there
> > are no resv
> > 
> > On Wed, 18 Jun 2025 12:14:49 +0530 Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> > 
> > > > Therefore, prevent the above crash by replacing the VM_BUG_ON()
> > > > with WARN_ON_ONCE() as there is no need to crash the system in
> > > > this situation and instead we could just warn and fail the
> > > > allocation.
> > >
> > > Why there are no reserved huge pages in such situations and also how
> > > likely this might happen ? Is it recoverable ?
> As described in the commit message above, the specific situation where this
> happens is when we try to pin memfd folios before they are faulted-in.
> Although, this is a valid thing to do, it is not the regular or the common
> use-case. Let me explain this further with the following scenarios:
> 1) hugetlbfs_file_mmap()
>     memfd_alloc_folio()
>     hugetlb_fault()
> 
> 2) memfd_alloc_folio()
>     hugetlbfs_file_mmap()
>     hugetlb_fault()
> 
> 3) hugetlbfs_file_mmap()
>     hugetlb_fault()
>         alloc_hugetlb_folio()
> 
> 3) is the most common use-case where first a memfd is allocated followed
> by mmap(), user writes/updates and then the relevant folios are pinned
> (memfd_pin_folios()). The BUG this patch is fixing occurs in 2) because we
> try to pin the folios before hugetlbfs_file_mmap() is called. So, in this
> situation we try to allocate the folios before pinning them but since we did
> not make any reservations, resv_huge_pages would be 0, leading to this issue.

Cool, thanks, I'll paste that into the changelog ;)

So if this code path is rare but expected and normal, should we be
emitting this warning at all?

> > I can't find any mailing report/discussion of this.  The Closes: takes
> > us to the syskaller report which is a bit of a dead end.
> My understanding is that the Closes tag can be associated with a URL for
> a public bugtracker like Syzkaller. Would the following be a better Closes link:
> https://lore.kernel.org/all/677928b5.050a0220.3b53b0.004d.GAE@google.com/T/

I'll add that - the more the merrier.

> > 
> > I agree with the patch - converting a BUG into a WARN+recover is a good
> > thing but as far as I can tell, we don't know what's causing this
> > situation.
> > 
> > syskaller has a C reproducer, if anyone is feeling brave.
> The udmabuf selftest added in patch #3 of the other series can also reproduce 
> this issue and is a lot simpler.
> 
> Thanks,
> Vivek
