Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4027184223
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB216E07F;
	Fri, 13 Mar 2020 08:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6689A91
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:11:16 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id ca9so2768449qvb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TfPq0MKSBUEoMMxdu/We2AG1PfaPZyygxsMFnWty7og=;
 b=nR6jOHnUM5YoXGhFP3+k07DnsntC+/xywZyRwpU3VDnnAMXe9oNyKt9LaXqqd9/DgX
 BWk/8DiskNev0gVHTSQA4FAxEuUmYU2GBbg6Ci1ebekkrWmjpO6MHlJmTHqIcwsrIoLN
 fuIww4eG2GsLrNAFZlZaFNkgz8byAfXPJ+BsZ9dXcGSyMBnHWAG3oQ08D46ep/vp4lAs
 w6hyx1ssjKnwH7NTO93Al4Hs1waERYYjMtyiIUejX0RboR3oRlAxSDtae77l7OH89V7g
 Buxbjk64Qwtsqxy0IrnCgY6RxdI+2bDbFkyCikrOIgUMWkIFa7SvElXw55AY9yYPeNof
 uIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TfPq0MKSBUEoMMxdu/We2AG1PfaPZyygxsMFnWty7og=;
 b=tP6He+wMIEHEThRlutSUXBsjUO7o4f4bZFS75XbiCfjS6lBWSML1NEca1IFriSlvsn
 9fJsderHJHHo3MrpAGjNqpn5WDow6QBDrn3lpOU6c4jw+5dI4S0+p4u235PzBPBwjAg6
 CA+aKFE/lvcklI8siYixFO6X3+EhFZNF+OfAtNn4LqF6JiM/XPDeegiknVZC+hWdsj7i
 EH0KYsQ2SninUFWD6I1TakXItZsUMIjRT8MNuWivu9emJaW56sNH69pQmPY9FNe/hozT
 3DQAadcMrvUraokxtux6eoRzbA4TGzgiBFSIE2uF3K/qajg26tHi4cVJtfRiv21gz3Fl
 OXGw==
X-Gm-Message-State: ANhLgQ2EqtXdfla50rNzEYCH/x8I2jkeMhZM16NRTUmdt4q3NA1eBuiP
 i2uOGiS67H7p0KqOGkQBQoHk+A==
X-Google-Smtp-Source: ADFU+vsXc20453obvlA3XsCJo8lxaMgzs3qiHWmSYfwVLrhpKBdZooziEPV1gPImfSe6apbMuNmDJw==
X-Received: by 2002:a0c:f892:: with SMTP id u18mr7789034qvn.159.1584025874739; 
 Thu, 12 Mar 2020 08:11:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id w4sm13785252qts.92.2020.03.12.08.11.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 08:11:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jCPUP-0007Vd-Fj; Thu, 12 Mar 2020 12:11:13 -0300
Date: Thu, 12 Mar 2020 12:11:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
Message-ID: <20200312151113.GO31668@ziepe.ca>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
 <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
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

On Thu, Mar 12, 2020 at 02:40:08PM +0000, Steven Price wrote:
> On 12/03/2020 14:27, Jason Gunthorpe wrote:
> > On Thu, Mar 12, 2020 at 10:28:13AM +0000, Steven Price wrote:
> > > By refactoring to deal with the !pud_huge(pud) || !pud_devmap(pud)
> > > condition early it's possible to remove the 'ret' variable and remove a
> > > level of indentation from half the function making the code easier to
> > > read.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > Thanks to Jason's changes there were only two code paths left using
> > > the out_unlock label so it seemed like a good opportunity to
> > > refactor.
> > 
> > Yes, I made something very similar, what do you think of this:
> > 
> > https://github.com/jgunthorpe/linux/commit/93f0ed42ab3f9ceb27b58fb7c7c3ecaf60f16b36
> 
> Even better! Sorry I didn't realise you'd already done this. I just saw that
> the function was needlessly complicated after your fix, so I thought I'd do
> a drive-by cleanup since part of the mess was my fault! :)

No worries, I've got a lot of patches for hmm_range_fault right now,
just trying to organize them, test them and post them. Haven't posted
that one yet.

Actually, while you are looking at this, do you think we should be
adding at least READ_ONCE in the pagewalk.c walk_* functions? The
multiple references of pmd, pud, etc without locking seems sketchy to
me.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
