Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8818606D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853ED6E27C;
	Sun, 15 Mar 2020 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD1A6EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 22:52:00 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id p60so5577026qva.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 15:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pnEWT5exzE8VNu4uP9aWxirCjTGDlMeZrBFn4okz7EY=;
 b=Q2YVEh2mTyNrujOq2W42VrodkM3tb5wDoyO3GCTU9cStXcr06aCbXttMPTosmjn2uF
 K09UEgvt4RldFZJxIPJIFOYgCpPc4UJ9Ft2myme5EtjlQSfX5PeXhDpuEmeOQCXVX809
 uRG5r/blZpuWxkNimYtvArbCVFAgPqF7oxLaifB+l1KBSCZ0iOQLyTNVsJZuQntwNkeT
 svCjJndRKtajjPu8wfb7nDRTUGRLJKeUawhNZQbZ1uR6C2t1hAGqZ7QAJ2XPcdMNO96L
 p6fVD9Y9FcQvhr4tiFJh8PvW5HEzM7O6/LEbVxsaW5N+swJVENseaveM2mFQT9e4YQXo
 IY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pnEWT5exzE8VNu4uP9aWxirCjTGDlMeZrBFn4okz7EY=;
 b=cO+YHlK+bJVrsaDUtmxQkllx8AE6HwOJ7oQlhmrF8bdXzvYp0QHkt23Hiz7hJbdQ98
 4pWFuHSVxSoT9CzLIsUuv5VoHQnKlRfgW2eVzeO0iSi0ageOjcXK1zzEIOsRUpe0p5BY
 zUSdKTRCqIQExjFqNrqnl8OTjRTaO7H3CytT0X1S9oJianRI7A8SciNGBVk+3+0fyFra
 L4xhxn07JCiVRLqYq4M7gz0uT7A+s3E8bK+MQSQF4yVDPoNZP7gt/472LGNVpBqoP6lt
 Ow+q6reFVZvZkGsn0MyYgd8WWbmi0A8vZg31qlHtDDmojsuI/pypJ7NePhsm4bzt83ry
 iTwg==
X-Gm-Message-State: ANhLgQ0DD2n3V8cinA7B0z2vyeKudvIUeJbCMr3131zu2sagElugDQNG
 B9GhAe4pChSXwf6Y2z8VTZXnjw==
X-Google-Smtp-Source: ADFU+vvXWaP3fRj/KPrE6Z5f5i6cOnkWg08gknIHvw6A2Y52E3vHJqQUV+svDxlJJrQAl4dNNJtp9A==
X-Received: by 2002:a0c:fcc4:: with SMTP id i4mr14219926qvq.191.1584139919208; 
 Fri, 13 Mar 2020 15:51:59 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u13sm29863801qtg.64.2020.03.13.15.51.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 15:51:58 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCt9p-0005N0-T2; Fri, 13 Mar 2020 19:51:57 -0300
Date: Fri, 13 Mar 2020 19:51:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
Message-ID: <20200313225157.GA20412@ziepe.ca>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
 <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
 <20200312151113.GO31668@ziepe.ca>
 <689d3c56-3d19-4655-21f5-f9aeab3089df@arm.com>
 <20200312163734.GR31668@ziepe.ca>
 <bf9b38ae-edd5-115f-e1ca-d769872f994a@arm.com>
 <20200313195550.GH31668@ziepe.ca>
 <20200313210446.GP22433@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313210446.GP22433@bombadil.infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Mar 13, 2020 at 02:04:46PM -0700, Matthew Wilcox wrote:
> On Fri, Mar 13, 2020 at 04:55:50PM -0300, Jason Gunthorpe wrote:
> > On Thu, Mar 12, 2020 at 05:02:18PM +0000, Steven Price wrote:
> > > On 12/03/2020 16:37, Jason Gunthorpe wrote:
> > > > On Thu, Mar 12, 2020 at 04:16:33PM +0000, Steven Price wrote:
> > > > > > Actually, while you are looking at this, do you think we should be
> > > > > > adding at least READ_ONCE in the pagewalk.c walk_* functions? The
> > > > > > multiple references of pmd, pud, etc without locking seems sketchy to
> > > > > > me.
> > > > > 
> > > > > I agree it seems worrying. I'm not entirely sure whether the holding of
> > > > > mmap_sem is sufficient,
> > > > 
> > > > I looked at this question, and at least for PMD, mmap_sem is not
> > > > sufficient. I didn't easilly figure it out for the other ones
> > > > 
> > > > I'm guessing if PMD is not safe then none of them are.
> > > > 
> > > > > this isn't something that I changed so I've just
> > > > > been hoping that it's sufficient since it seems to have been working
> > > > > (whether that's by chance because the compiler didn't generate multiple
> > > > > reads I've no idea). For walking the kernel's page tables the lack of
> > > > > READ_ONCE is also not great, but at least for PTDUMP we don't care too much
> > > > > about accuracy and it should be crash proof because there's no RCU grace
> > > > > period. And again the code I was replacing didn't have any special
> > > > > protection.
> > > > > 
> > > > > I can't see any harm in updating the code to include READ_ONCE and I'm happy
> > > > > to review a patch.
> > > > 
> > > > The reason I ask is because hmm's walkers often have this pattern
> > > > where they get the pointer and then de-ref it (again) then
> > > > immediately have to recheck the 'again' conditions of the walker
> > > > itself because the re-read may have given a different value.
> > > > 
> > > > Having the walker deref the pointer and pass the value it into the ops
> > > > for use rather than repeatedly de-refing an unlocked value seems like
> > > > a much safer design to me.
> > > 
> > > Yeah that sounds like a good idea.
> > 
> > I'm looking at this now.. The PUD is also changing under the read
> > mmap_sem - and I was able to think up some race conditiony bugs
> > related to this. Have some patches now..
> > 
> > However, I haven't been able to understand why walk_page_range()
> > doesn't check pud_present() or pmd_present() before calling
> > pmd_offset_map() or pte_offset_map().
> > 
> > As far as I can see a non-present entry has a swap entry encoded in
> > it, and thus it seems like it is a bad idea to pass a non-present
> > entry to the two map functions. I think those should only be called
> > when the entry points to the next level in the page table  (so there
> > is something to map?)
> > 
> > I see you added !present tests for the !vma case, but why only there?
> > 
> > Is this a bug? Do you know how it works?
> > 
> > Is it something that was missed when people added non-present PUD and
> > PMD's?
> 
> ... I'm sorry, I did what now? 

No, no, just widening to see if someone knows

> As far as I can tell, you're talking
> about mm/pagewalk.c, and the only commit I have in that file is
> a00cc7d9dd93d66a3fb83fc52aa57a4bec51c517 ("mm, x86: add support for
> PUD-sized transparent hugepages", which I think I was pretty clear
> from the commit message is basically copy-and-paste from the PMD
> code.

Right, which added the split_huge_pud() which seems maybe related to
pud_present, or maybe not, I don't know.

> I have no clue why most of the decisions in the MM were made.

Fun!

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
