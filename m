Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9D4CE8AD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 05:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2510E229;
	Sun,  6 Mar 2022 04:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A439B10E229;
 Sun,  6 Mar 2022 04:12:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FAD8B80B52;
 Sun,  6 Mar 2022 04:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D11DC340EF;
 Sun,  6 Mar 2022 04:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646539922;
 bh=Qq7CIqw/wyoNGqP8SxKCADK3EiMnqFZiz0Fy3Y+3lI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dChxswxCVJWoQTWcJUnuMIlYUbzfRbQW+eLId9/Ei0rHOIrcrbjcXm/220WNeg06J
 RJSF/JqGVMgJHgTfiHNK2RdJgtuL1oOzDROr+1RBVmy23C/R4Q5soWU18mTaVTuYbx
 RxhEsAShP8lWIyrYhxtwmWYQWrgTIefRVR1iSIh5+gSp0JetS7+9tqkhX219cJxnM3
 1p/tS5jnPbQDScKHexmgcMK7qz5OyRTw4wTvpR6qWMpAbIsV1y7AlMbPNV/rLsKwqc
 KEdDBDvuqvOoKbhTfoYuFyF5GiKzZ325omdd6KQ05ZiG+sFsHZ5JPQE1M75KOw85rU
 s1B3+qZ+VarQg==
Date: Sun, 6 Mar 2022 06:11:21 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQ0aWhwY4BGLEMK@iki.fi>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org> <YiQop71ABWm7hbMy@iki.fi>
 <YiQv7JEBPzgYUTTa@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQv7JEBPzgYUTTa@casper.infradead.org>
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

On Sun, Mar 06, 2022 at 03:52:12AM +0000, Matthew Wilcox wrote:
> On Sun, Mar 06, 2022 at 05:21:11AM +0200, Jarkko Sakkinen wrote:
> > On Sun, Mar 06, 2022 at 02:57:55AM +0000, Matthew Wilcox wrote:
> > > On Sun, Mar 06, 2022 at 04:15:33AM +0200, Jarkko Sakkinen wrote:
> > > > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > > > initialize the device memory in some specific manner. SGX driver can use
> > > > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > > > page in the address range.
> > > > 
> > > > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > > > it conditionally called inside call_mmap(). Update call sites
> > > > accodingly.
> > > 
> > > Your device driver has a ->mmap operation.  Why does it need another
> > > one?  More explanation required here.
> > 
> > f_ops->mmap() would require an additional parameter, which results
> > heavy refactoring.
> > 
> > struct file_operations has 1125 references in the kernel tree, so I
> > decided to check this way around first. 
> 
> Are you saying that your device driver behaves differently if
> MAP_POPULATE is set versus if it isn't?  That seems hideously broken.

MAP_POPULATE does not do anything (according to __mm_populate in mm/gup.c)
with VMA's that have some sort of device/IO memory, i.e. vm_flags
intersecting with VM_PFNMAP | VM_IO.

I can extend the guard obviously to:

if (!ret && do_populate && file->f_op->populate &&
    !!(vma->vm_flags & (VM_IO | VM_PFNMAP)))
        file->f_op->populate(file, vma);

BR, Jarkko
