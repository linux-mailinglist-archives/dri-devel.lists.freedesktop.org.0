Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1F54CE8B6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 05:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A280C10E24B;
	Sun,  6 Mar 2022 04:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C6010E243;
 Sun,  6 Mar 2022 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8Nng+QuKnT6jXEBfHhGDnJuOSrUiwwiAzYqNGn/+k9A=; b=vVJ1rXfRt5F4XK5Yz4ulTDErn5
 eKxDN9r03x/ZoWofyr8V97nsvnlTMCb+7gJa6Tj2v0nu7TCEnFWVFBQRNZRk7+PAC8c66UdcfkxuT
 x9lW97vdND3H+9Z7Mb8ah0MHoZXIkBsXT7wWtcOhyXpYYX8Mg3yMfy/tvha0UiJKjBnJvSFmxMmZA
 vaFqiKkOg3YMN+HVca4AhzVQAxrTmG5D5ut1dashjkGQKuclZdwyzRiUAJcKaDsnRScRiEXXcG+kE
 Ld7/Wy34h69Yy0d5MYKGkyiHUZGcceewEJsyD1B1bg/VYWD0Ng+DxkiHL7ajBeRYFmQKINKzgsCpP
 PwcSUOlQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nQiMg-00E5oH-7u; Sun, 06 Mar 2022 04:19:26 +0000
Date: Sun, 6 Mar 2022 04:19:26 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQ2ThvkvnBBFRzD@casper.infradead.org>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org> <YiQop71ABWm7hbMy@iki.fi>
 <YiQv7JEBPzgYUTTa@casper.infradead.org> <YiQ0aWhwY4BGLEMK@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQ0aWhwY4BGLEMK@iki.fi>
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

On Sun, Mar 06, 2022 at 06:11:21AM +0200, Jarkko Sakkinen wrote:
> On Sun, Mar 06, 2022 at 03:52:12AM +0000, Matthew Wilcox wrote:
> > On Sun, Mar 06, 2022 at 05:21:11AM +0200, Jarkko Sakkinen wrote:
> > > On Sun, Mar 06, 2022 at 02:57:55AM +0000, Matthew Wilcox wrote:
> > > > On Sun, Mar 06, 2022 at 04:15:33AM +0200, Jarkko Sakkinen wrote:
> > > > > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > > > > initialize the device memory in some specific manner. SGX driver can use
> > > > > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > > > > page in the address range.
> > > > > 
> > > > > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > > > > it conditionally called inside call_mmap(). Update call sites
> > > > > accodingly.
> > > > 
> > > > Your device driver has a ->mmap operation.  Why does it need another
> > > > one?  More explanation required here.
> > > 
> > > f_ops->mmap() would require an additional parameter, which results
> > > heavy refactoring.
> > > 
> > > struct file_operations has 1125 references in the kernel tree, so I
> > > decided to check this way around first. 
> > 
> > Are you saying that your device driver behaves differently if
> > MAP_POPULATE is set versus if it isn't?  That seems hideously broken.
> 
> MAP_POPULATE does not do anything (according to __mm_populate in mm/gup.c)
> with VMA's that have some sort of device/IO memory, i.e. vm_flags
> intersecting with VM_PFNMAP | VM_IO.
> 
> I can extend the guard obviously to:
> 
> if (!ret && do_populate && file->f_op->populate &&
>     !!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
>         file->f_op->populate(file, vma);

Are you deliberately avoiding the question?  I'm not asking about
implementation.  I'm asking about the semantics of MAP_POPULATE with
your driver.
