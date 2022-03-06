Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EA84CE8BC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 05:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A0910E58A;
	Sun,  6 Mar 2022 04:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFEF10E58A;
 Sun,  6 Mar 2022 04:26:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFBA7B80CA5;
 Sun,  6 Mar 2022 04:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A59AC340EF;
 Sun,  6 Mar 2022 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646540794;
 bh=0JU4U5+lOyIAdCnvSBFHtdXzenPHV8wshAXmaTDzyec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=enYPYnhKNbQlGCuV9rgRWqwOZoAA2/26Pz1a1vQsn0dcwm0e7qQPAuiiY2aZa7UVz
 8cDgv3TRivJP53dbTwDKRp/INFtVtTyBcFDsRfqyeQOWYlbNRFC5ZfECwydfiL3Fim
 SoL64RSWI/Bl0LUYpfWZ8NwrH4mco1sI8MJeRAxdqVYOWifM/pz21xXm607B8FMxuo
 gcy5ANlRYV2HeBFrmP15CJtH4vIXv+C1hKT6qAMtqDnXgqigiGroyxudYT9rqm7vTs
 Pfs7Ul86sEebvwI101HAVbOty5rPj/mvEXXDoOEnk6WPImCBA9+CkqPHxse1O0ONvE
 6Q37wbuuZ5B0A==
Date: Sun, 6 Mar 2022 06:25:52 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQ30O/5LGh84z3t@iki.fi>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org> <YiQop71ABWm7hbMy@iki.fi>
 <YiQv7JEBPzgYUTTa@casper.infradead.org> <YiQ0aWhwY4BGLEMK@iki.fi>
 <YiQ2ThvkvnBBFRzD@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQ2ThvkvnBBFRzD@casper.infradead.org>
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
Cc: Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, codalist@coda.cs.cmu.edu,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 04:19:26AM +0000, Matthew Wilcox wrote:
> On Sun, Mar 06, 2022 at 06:11:21AM +0200, Jarkko Sakkinen wrote:
> > On Sun, Mar 06, 2022 at 03:52:12AM +0000, Matthew Wilcox wrote:
> > > On Sun, Mar 06, 2022 at 05:21:11AM +0200, Jarkko Sakkinen wrote:
> > > > On Sun, Mar 06, 2022 at 02:57:55AM +0000, Matthew Wilcox wrote:
> > > > > On Sun, Mar 06, 2022 at 04:15:33AM +0200, Jarkko Sakkinen wrote:
> > > > > > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > > > > > initialize the device memory in some specific manner. SGX driver can use
> > > > > > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > > > > > page in the address range.
> > > > > > 
> > > > > > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > > > > > it conditionally called inside call_mmap(). Update call sites
> > > > > > accodingly.
> > > > > 
> > > > > Your device driver has a ->mmap operation.  Why does it need another
> > > > > one?  More explanation required here.
> > > > 
> > > > f_ops->mmap() would require an additional parameter, which results
> > > > heavy refactoring.
> > > > 
> > > > struct file_operations has 1125 references in the kernel tree, so I
> > > > decided to check this way around first. 
> > > 
> > > Are you saying that your device driver behaves differently if
> > > MAP_POPULATE is set versus if it isn't?  That seems hideously broken.
> > 
> > MAP_POPULATE does not do anything (according to __mm_populate in mm/gup.c)
> > with VMA's that have some sort of device/IO memory, i.e. vm_flags
> > intersecting with VM_PFNMAP | VM_IO.
> > 
> > I can extend the guard obviously to:
> > 
> > if (!ret && do_populate && file->f_op->populate &&
> >     !!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
> >         file->f_op->populate(file, vma);
> 
> Are you deliberately avoiding the question?  I'm not asking about
> implementation.  I'm asking about the semantics of MAP_POPULATE with
> your driver.

No. I just noticed a bug in the guard from your comment that I wanted
point out.

With the next version I post the corresponding change to the driver,
in order to see this in context.

BR, Jarkko
