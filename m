Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58204D0190
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BB810E40F;
	Mon,  7 Mar 2022 14:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C4310E420;
 Mon,  7 Mar 2022 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NW9RpFh+hvH2B+kdkMZrrBGYcByfxt2ECpS3XLUg5ic=; b=tJW4g9xzh7Hr7eTiR6n30j60WO
 IYwXR9LZ0duAlYTPi8RrvkjPPngfb7+5UiJ9/ZQDEmqZxuVEE7Qbp6lMMYytUbktkhxgCkWSDTHz/
 1HZ0/A46EkR5RhOL/6a/GA/m7T0Xdl7GYI14I9F+ekXEYTzuywuHs6g05qrRgYv8hr/bztXDiu2e+
 NN0Vkgbei6YVv2EJhvRxLOhyg0NOBGLz0ad8LGOORcltIsEZCfhwsdgFVWe1FyuU/IK3Nyj+5fUwi
 f50yHXIse9zePYwFp7mtZTHd3yptwZqau6qA/Lwjq3Ry8EyNIJpG+QOGy9Q7M8mbbEBcnSDA3dMvA
 /ZHTriAA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nREUe-00FIYz-EZ; Mon, 07 Mar 2022 14:37:48 +0000
Date: Mon, 7 Mar 2022 14:37:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <YiYYvAWYgC+PKEx0@casper.infradead.org>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
 <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com>
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
 Jarkko Sakkinen <jarkko@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 03:41:54PM -0800, Dave Hansen wrote:
> In short: page faults stink.  The core kernel has lots of ways of
> avoiding page faults like madvise(MADV_WILLNEED) or mmap(MAP_POPULATE).
>  But, those only work on normal RAM that the core mm manages.
> 
> SGX is weird.  SGX memory is managed outside the core mm.  It doesn't
> have a 'struct page' and get_user_pages() doesn't work on it.  Its VMAs
> are marked with VM_IO.  So, none of the existing methods for avoiding
> page faults work on SGX memory.
> 
> This essentially helps extend existing "normal RAM" kernel ABIs to work
> for avoiding faults for SGX too.  SGX users want to enjoy all of the
> benefits of a delayed allocation policy (better resource use,
> overcommit, NUMA affinity) but without the cost of millions of faults.

We have a mechanism for dynamically reducing the number of page faults
already; it's just buried in the page cache code.  You have vma->vm_file,
which contains a file_ra_state.  You can use this to track where
recent faults have been and grow the size of the region you fault in
per page fault.  You don't have to (indeed probably don't want to) use
the same algorithm as the page cache, but the _principle_ is the same --
were recent speculative faults actually used; should we grow the number
of pages actually faulted in, or is this a random sparse workload where
we want to allocate individual pages.

Don't rely on the user to ask.  They don't know.
