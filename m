Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB4186077
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9173E6E2E4;
	Sun, 15 Mar 2020 23:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C9B6EC65;
 Fri, 13 Mar 2020 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kG1biFClbKbYgFFQeYcmL3mnBar5ik1AP4RtTRFtUdc=; b=HNp96A1aGfofaHntBOlcPPAGYe
 fKv2S0oyjOydDLIATST8n+CzNInlngdN7LddpSIGHWus1TBeiHZ/KWK9ZaH1RdS1dJWpIG+vmwMxO
 vCoq6O8qDw2WfmnQCOLZTz/GPuosY0S5JOS+JaANi8tJNSCD/xn/G7PXwcC3tSQAJ1RR4s3kM9H3q
 en1EAYmGv3KLxzwbDbPipRS0JehSV99OYCc2JWj8z2sH356pXvq++/zydiY0tXeqX69rf/SFn8XJl
 qzERNpa6BTAxrsx+7fs6+gragq3CloQfs6gALK6AJgxYCs6aZ+z6FF4I/y5+kEo21Ws/yRGJrXH6M
 TvEbijXw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jCrU6-0003Yn-QN; Fri, 13 Mar 2020 21:04:46 +0000
Date: Fri, 13 Mar 2020 14:04:46 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
Message-ID: <20200313210446.GP22433@bombadil.infradead.org>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
 <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
 <20200312151113.GO31668@ziepe.ca>
 <689d3c56-3d19-4655-21f5-f9aeab3089df@arm.com>
 <20200312163734.GR31668@ziepe.ca>
 <bf9b38ae-edd5-115f-e1ca-d769872f994a@arm.com>
 <20200313195550.GH31668@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313195550.GH31668@ziepe.ca>
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:05 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 04:55:50PM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 12, 2020 at 05:02:18PM +0000, Steven Price wrote:
> > On 12/03/2020 16:37, Jason Gunthorpe wrote:
> > > On Thu, Mar 12, 2020 at 04:16:33PM +0000, Steven Price wrote:
> > > > > Actually, while you are looking at this, do you think we should be
> > > > > adding at least READ_ONCE in the pagewalk.c walk_* functions? The
> > > > > multiple references of pmd, pud, etc without locking seems sketchy to
> > > > > me.
> > > > 
> > > > I agree it seems worrying. I'm not entirely sure whether the holding of
> > > > mmap_sem is sufficient,
> > > 
> > > I looked at this question, and at least for PMD, mmap_sem is not
> > > sufficient. I didn't easilly figure it out for the other ones
> > > 
> > > I'm guessing if PMD is not safe then none of them are.
> > > 
> > > > this isn't something that I changed so I've just
> > > > been hoping that it's sufficient since it seems to have been working
> > > > (whether that's by chance because the compiler didn't generate multiple
> > > > reads I've no idea). For walking the kernel's page tables the lack of
> > > > READ_ONCE is also not great, but at least for PTDUMP we don't care too much
> > > > about accuracy and it should be crash proof because there's no RCU grace
> > > > period. And again the code I was replacing didn't have any special
> > > > protection.
> > > > 
> > > > I can't see any harm in updating the code to include READ_ONCE and I'm happy
> > > > to review a patch.
> > > 
> > > The reason I ask is because hmm's walkers often have this pattern
> > > where they get the pointer and then de-ref it (again) then
> > > immediately have to recheck the 'again' conditions of the walker
> > > itself because the re-read may have given a different value.
> > > 
> > > Having the walker deref the pointer and pass the value it into the ops
> > > for use rather than repeatedly de-refing an unlocked value seems like
> > > a much safer design to me.
> > 
> > Yeah that sounds like a good idea.
> 
> I'm looking at this now.. The PUD is also changing under the read
> mmap_sem - and I was able to think up some race conditiony bugs
> related to this. Have some patches now..
> 
> However, I haven't been able to understand why walk_page_range()
> doesn't check pud_present() or pmd_present() before calling
> pmd_offset_map() or pte_offset_map().
> 
> As far as I can see a non-present entry has a swap entry encoded in
> it, and thus it seems like it is a bad idea to pass a non-present
> entry to the two map functions. I think those should only be called
> when the entry points to the next level in the page table  (so there
> is something to map?)
> 
> I see you added !present tests for the !vma case, but why only there?
> 
> Is this a bug? Do you know how it works?
> 
> Is it something that was missed when people added non-present PUD and
> PMD's?

... I'm sorry, I did what now?  As far as I can tell, you're talking
about mm/pagewalk.c, and the only commit I have in that file is
a00cc7d9dd93d66a3fb83fc52aa57a4bec51c517 ("mm, x86: add support for
PUD-sized transparent hugepages", which I think I was pretty clear
from the commit message is basically copy-and-paste from the PMD code.
I have no clue why most of the decisions in the MM were made.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
