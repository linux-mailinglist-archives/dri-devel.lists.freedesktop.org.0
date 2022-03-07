Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF24CFCC9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 12:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195410F722;
	Mon,  7 Mar 2022 11:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E9610F722;
 Mon,  7 Mar 2022 11:28:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA6B3B80FAB;
 Mon,  7 Mar 2022 11:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232DCC340E9;
 Mon,  7 Mar 2022 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646652494;
 bh=CoioyM0zIXElo8AmL5lOe9QJ9NofNT4LxKFCkZhNubU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKA3As2Yp0LuIulW1zXgVDONqGP5hbS9VFG+vVYQod0UmHUi6UPA8Y8VxsEutOIxK
 RdqcQTK2KdDpqkLso/Ze/vknDLOudeZqMzI4IyWs1I1RKkLK9P4P8w6EaAO5sjx6G4
 Y9jdSiMw8DWfTtAdMHy3mhqsUDbwHqjgPm4WPBVE5pmFou86QdYv7Icu79rkyLMlr3
 y1FObIg9d+jqzRRs3JF8h6WBEky7RdBwEqh/+KVxkT2O6t/pnHpmZTmzwMpPCJ5g6Y
 eSn+tbxZFwThOFwyhU36MfvqJjhZ/XfObC59oeVuDQX1k2u5PfI3xt16lzDpGvD12s
 qH+rdZcT7wO/w==
Date: Mon, 7 Mar 2022 13:27:33 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
Message-ID: <YiXsJRE8CWOvFNWH@iki.fi>
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 03:41:54PM -0800, Dave Hansen wrote:
> On 3/6/22 15:24, Andrew Morton wrote:
> > On Sun,  6 Mar 2022 05:26:55 +0200 Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > 
> >> Sometimes you might want to use MAP_POPULATE to ask a device driver to
> >> initialize the device memory in some specific manner. SGX driver can use
> >> this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> >> page in the address range.
> > Why is this useful?  Please fully describe the benefit to kernel users.
> > Convince us that the benefit justifies the code churn, maintenance
> > cost and larger kernel footprint.
> 
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
> 
> That said, this isn't how I would have implemented it.  I probably would
> have hooked in to populate_vma_page_range() or its callers.

The exact implementation path is not driver in this. I'm open for
better options. The point of these patches is more to show an issue
rather than solution, and they do carry RFC because of that.

Hooking into populate_vma_page_range() does sound like a better idea,
because then it would be nicely embedded into __mm_populate() and
other functionality that calls that function.

But e.g. in __mm_populate() anything with (VM_IO | VM_PFNMAP) gets
filtered out and never reach that function.

I don't know unorthodox that'd be but could we perhaps have a VM
flag for SGX?

BR, Jarkko
