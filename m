Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0F2830CF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8F16E151;
	Mon,  5 Oct 2020 07:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B44E6E156
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 23:24:45 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 19so6134489qtp.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Oct 2020 16:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
 b=Wt75KKGYlyB3SVZh+R6kN1ac9Vs1rLb3FsriPknSZPm+rurem+iWpgZgJn4OjhxTGZ
 9UwOdbqn0IcWxz+SXlFiwb4+rjtb+FIwhhqFqQCCHCvfa+S2U6Kl8NLkXIpYAhA/a10W
 r/rLG3s+ms3GT5JJgD+ISxGasTSiyNYlo6eShkO1GzrSNpTK/YeaG5lgDrFWf6poASEm
 HB67uKceG7Zv3GOVEaWOpYkegB/R/AxePvPSKebeq4LE2/szG8/0SQsD2yphB471fLtE
 A3BPhFHCM7s2bOPhwoXpknrKjY/J2CP+KFTRaSIylcr9nsqahczax8dmHfThNO+XSHbg
 6rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
 b=SZA/6/62wr2sTRv/vW/XyznEj/zQ7N+EwrG+m9E7znL8i+hjmneqJCrZD5MELs+LtW
 tDKVMHmlcXYLFSMNMSmcVHwXlY2eKs3wZILQtS3YoZ4DuKmr1tiNcewYTkIUJWlRYVen
 vxoM6T4sXoQabcy46mZ8iGv/Xq/rfKmpCjwfegdBL1vOjfzBO7+J0N/fAfesWVyuMrLl
 zlhHyvyaapp33DeLwsH3O/FE4n2w/jlgyhea3I/QJZY80pMcwmbTi+yd8btSD/eAYbBp
 sh0IrdBsoN2kfvMg5zlyuYMfah97HV3B20YhCKq4h7cQ+aeebSz3rZzWHRN5PQ8dgSRp
 xnbg==
X-Gm-Message-State: AOAM5327fvS5hEdgF+gpQOYe6qrG0ZjfmnX9y1qBZPvMT/QFCTg1RKpR
 n0XJubKXO36ip6y4iCSnE/GF/Q==
X-Google-Smtp-Source: ABdhPJz+EnEtdlsIy9dnMqFENsfi2yM5N7tbJ9Hj1Iht+h6SFBydHWolNKH2FPE4uwkGjBxQdXBxaQ==
X-Received: by 2002:aed:3b72:: with SMTP id q47mr2051233qte.347.1601767483069; 
 Sat, 03 Oct 2020 16:24:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a52sm4343504qtc.22.2020.10.03.16.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 16:24:42 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kOqtN-0075j4-EX; Sat, 03 Oct 2020 20:24:41 -0300
Date: Sat, 3 Oct 2020 20:24:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201003232441.GO9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 03, 2020 at 03:52:32PM -0700, John Hubbard wrote:
> On 10/3/20 2:45 AM, Daniel Vetter wrote:
> > On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
> > > 
> > > On 10/2/20 10:53 AM, Daniel Vetter wrote:
> > > > For $reasons I've stumbled over this code and I'm not sure the change
> > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> > > > 
> > > > This here is used for long term buffers (not just quick I/O) like
> > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > didn't do.
> > > 
> > > Yep. The earlier gup --> pup conversion patches were intended to not
> > > have any noticeable behavior changes, and FOLL_LONGTERM, with it's
> > > special cases and such, added some risk that I wasn't ready to take
> > > on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
> > > up. So there was some doubt at least in my mind, about which sites
> > > should have it.
> > > 
> > > But now that we're here, I think it's really good that you've brought
> > > this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.
> > 
> > So should I keep this patch, or will it collide with a series you're working on?
> 
> It doesn't collide with anything on my end yet, because I've been slow to
> pick up on the need for changing callsites to add FOLL_LONGTERM. :)
> 
> And it looks like that's actually a problem, because:
> 
> > 
> > Also with the firmed up rules, correct that I can also drop the
> > vma_is_fsdax check when the FOLL_LONGTERM flag is set?
> 
> That's the right direction to go *in general*, but I see that the
> pin_user_pages code is still a bit stuck in the past. And this patch
> won't actually work, with or without that vma_is_fsdax() check.
> Because:
> 
> get_vaddr_frames(FOLL_LONGTERM)
>    pin_user_pages_locked()
> 	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
> 		return -EINVAL;

There is no particular reason this code needs to have the mm sem at
that point.

It should call pin_user_pages_fast() and only if that fails get the mmap
lock and extract the VMA to do broken hackery.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
