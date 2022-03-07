Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147F4D032D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE38310E010;
	Mon,  7 Mar 2022 15:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711D510E010;
 Mon,  7 Mar 2022 15:44:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F38ADB815E5;
 Mon,  7 Mar 2022 15:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3107EC340E9;
 Mon,  7 Mar 2022 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646667835;
 bh=pfUclWf7OeQP6fVMwAxfeek4Z/tO6y5WQdf6JL4ro+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGqXs4QUJZlZgCVSTmVIhUyrefWcLiV5XQbqLL4lWUXGjnXK8TQIh8MZmlhlk7Dws
 vymCZmmrecWaK5QsPzl/JEnH42FdMm3knJaE2LeAyUSJ6XKfnw56pF4AeKS+pTp0gM
 5KdvMy04Dnkw4+IxsOcB497JN8wWMBQMp3/kpehP7UKOCvtf1DHR6KqD1XbWMnWqm1
 J5NppGJKVe/xpRZtg5cS5CCRR4+KxGOb1RuKPdZJJ1tfKV82mNLMPHXXAbwf++SaN3
 MlkGhHuxVnfK5PtQGRXqcvD5ziuoeGJJ2APZH4iRWJVk48q3ueX06DQHuMjFgRGo6P
 8lzRQuuKTdedQ==
Date: Mon, 7 Mar 2022 17:43:14 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <YiYoEiBklxQrb8Wj@iki.fi>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
 <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com>
 <YiYYvAWYgC+PKEx0@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiYYvAWYgC+PKEx0@casper.infradead.org>
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
Cc: codalist@telemann.coda.cs.cmu.edu, jaharkes@cs.cmu.edu,
 Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 02:37:48PM +0000, Matthew Wilcox wrote:
> On Sun, Mar 06, 2022 at 03:41:54PM -0800, Dave Hansen wrote:
> > In short: page faults stink.  The core kernel has lots of ways of
> > avoiding page faults like madvise(MADV_WILLNEED) or mmap(MAP_POPULATE).
> >  But, those only work on normal RAM that the core mm manages.
> > 
> > SGX is weird.  SGX memory is managed outside the core mm.  It doesn't
> > have a 'struct page' and get_user_pages() doesn't work on it.  Its VMAs
> > are marked with VM_IO.  So, none of the existing methods for avoiding
> > page faults work on SGX memory.
> > 
> > This essentially helps extend existing "normal RAM" kernel ABIs to work
> > for avoiding faults for SGX too.  SGX users want to enjoy all of the
> > benefits of a delayed allocation policy (better resource use,
> > overcommit, NUMA affinity) but without the cost of millions of faults.
> 
> We have a mechanism for dynamically reducing the number of page faults
> already; it's just buried in the page cache code.  You have vma->vm_file,
> which contains a file_ra_state.  You can use this to track where
> recent faults have been and grow the size of the region you fault in
> per page fault.  You don't have to (indeed probably don't want to) use
> the same algorithm as the page cache, but the _principle_ is the same --
> were recent speculative faults actually used; should we grow the number
> of pages actually faulted in, or is this a random sparse workload where
> we want to allocate individual pages.
> 
> Don't rely on the user to ask.  They don't know.

This sounds like a possibility. I'll need to study it properly first
though. Thank you for pointing this out.

BR, Jarkko
