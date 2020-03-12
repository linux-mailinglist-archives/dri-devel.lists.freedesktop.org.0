Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACF184221
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C9989C97;
	Fri, 13 Mar 2020 08:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA6D6EB01
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 16:37:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m2so7255864qka.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fmA8zKRe76L9QKXynKJ5M/zisBlIkbsLwFQy3LQahYI=;
 b=KnteymGLpkCc/QfvlROTLY5FU+cvnMfHx3Z/DRw8BCFXZt7iuH6QM2L8dGPveQUUn3
 Xlhpfnj22gbb00Ajojd+xRnUeKGKFC/Zglayy3ZU7Fb8m4VFbcrwr40XiWp3ov1/ykVn
 50j0Xys2kPWj8lJQThzi6h+Abasy7fco7NKHepLokp4T3nUslp5eA0azM8UN5ShssXcR
 /coFE6WQnM7yvxRwRmdgJOv84KxclHIi1t/Vuh6HvLG48YWad9Scekhq9v5t4slQNOVw
 VUBakr2wwlLvqTGCCgx2gzI5gxsHdjkTDbdmt7DrBlCzDNkcudKItHAvui1LdFqzC7SL
 O7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fmA8zKRe76L9QKXynKJ5M/zisBlIkbsLwFQy3LQahYI=;
 b=ZnoVGRJep9uznw2Kej6mZQs0aEj4CogV1wMVuPtVrWZ0LE1vWnc03Pkp4rMWsc8jhu
 auGAE4jaPPOuMq2tUCTrXjkXvv5D62xpkoLAp5o+JPE0YGMJt/vks8ZcBE4IP8W/D+0U
 TcRlXxrvFpcj7VBmyzC/P0QUQH9fC0GUldjV310OEWYR+dB2ZfV6cVkyDMzb+5CsYVVp
 lKgKWu6Vmj/Hxq0G2nVheheSfDXTT7YxzRobYr6KtdruISgWtAaG6fQ1gVS58bnCD351
 de3O8SfBS/BYDunw6VEehhi3XT+8cWjMOwBFkfEwkOhS3/ZA+fKIIreernmEge/dUT5k
 /5hg==
X-Gm-Message-State: ANhLgQ1XFGlStYd4vN9ZKXathm+hMiaS68fYXus0Lrev+N1XI0YVZKxU
 DMq9uW0DjoRw0odkQUrjrEeUyw==
X-Google-Smtp-Source: ADFU+vsCZGS3KHARg6F0Q8AUmySkB/O1C49CFLK8V1S8E9P7Q1oeOBUV0BmgWYk1CW/U1GncetrzAg==
X-Received: by 2002:ae9:e509:: with SMTP id w9mr8707944qkf.26.1584031055747;
 Thu, 12 Mar 2020 09:37:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id f26sm12590660qkl.119.2020.03.12.09.37.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 09:37:35 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCQpy-0008RM-Kv; Thu, 12 Mar 2020 13:37:34 -0300
Date: Thu, 12 Mar 2020 13:37:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
Message-ID: <20200312163734.GR31668@ziepe.ca>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
 <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
 <20200312151113.GO31668@ziepe.ca>
 <689d3c56-3d19-4655-21f5-f9aeab3089df@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <689d3c56-3d19-4655-21f5-f9aeab3089df@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 04:16:33PM +0000, Steven Price wrote:
> > Actually, while you are looking at this, do you think we should be
> > adding at least READ_ONCE in the pagewalk.c walk_* functions? The
> > multiple references of pmd, pud, etc without locking seems sketchy to
> > me.
> 
> I agree it seems worrying. I'm not entirely sure whether the holding of
> mmap_sem is sufficient,

I looked at this question, and at least for PMD, mmap_sem is not
sufficient. I didn't easilly figure it out for the other ones

I'm guessing if PMD is not safe then none of them are.

> this isn't something that I changed so I've just
> been hoping that it's sufficient since it seems to have been working
> (whether that's by chance because the compiler didn't generate multiple
> reads I've no idea). For walking the kernel's page tables the lack of
> READ_ONCE is also not great, but at least for PTDUMP we don't care too much
> about accuracy and it should be crash proof because there's no RCU grace
> period. And again the code I was replacing didn't have any special
> protection.
>
> I can't see any harm in updating the code to include READ_ONCE and I'm happy
> to review a patch.

The reason I ask is because hmm's walkers often have this pattern
where they get the pointer and then de-ref it (again) then
immediately have to recheck the 'again' conditions of the walker
itself because the re-read may have given a different value.

Having the walker deref the pointer and pass the value it into the ops
for use rather than repeatedly de-refing an unlocked value seems like
a much safer design to me.

If this also implicitly relies on a RCU grace period then it is also
missing RCU locking...

I also didn't quite understand why walk_pte_range() skipped locking
the pte in the no_vma case - I don't get why vma would be related to
locking here.

I also saw that hmm open coded the pte walk, presumably for
performance, so I was thinking of adding some kind of pte_range()
callback to avoid the expensive indirect function call per pte, but
hmm also can't have the pmd locked...

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
