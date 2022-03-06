Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BD4CE89E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 04:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABB110EB5A;
	Sun,  6 Mar 2022 03:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A310EB59;
 Sun,  6 Mar 2022 03:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9sW6PT9UhN7TdCknrB4vEZzr80Evyo9BiN2TBCQrpu8=; b=mexz5CF+uqowjqVXolKHAmICBZ
 /gBgallofA7ozgz6jmmxeLDOiLP+ug6bK856a/z+a9w7TUyxkvWlRyWXibD8YaVX9xEhWkvXfvJ0c
 T9CsFtuhgdywtjyO5X9YgUt7T7PWomuTwyfHCOGFUDiGUHpzGsSie9GdiLq7+5D36BobFZ/yP2NUj
 qr1wqTzCzqTn0g1ebz0/mAsEBexkspvGujBr22b3rqg8CDfMkfi2+IvRyah//kltQsrveMxB400WD
 J0XLKsOaVBufmV3UVpDkBZF539qZ0MxKfcyCwprq0N/9p+ZQ6jqDwbiBbdFzFrSEzsOcI1kPbIRAL
 xGmlkpYw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nQhwK-00E56f-PJ; Sun, 06 Mar 2022 03:52:12 +0000
Date: Sun, 6 Mar 2022 03:52:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH RFC] mm: Add f_ops->populate()
Message-ID: <YiQv7JEBPzgYUTTa@casper.infradead.org>
References: <20220306021534.83553-1-jarkko@kernel.org>
 <YiQjM7LdwoAWpC5L@casper.infradead.org> <YiQop71ABWm7hbMy@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiQop71ABWm7hbMy@iki.fi>
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

On Sun, Mar 06, 2022 at 05:21:11AM +0200, Jarkko Sakkinen wrote:
> On Sun, Mar 06, 2022 at 02:57:55AM +0000, Matthew Wilcox wrote:
> > On Sun, Mar 06, 2022 at 04:15:33AM +0200, Jarkko Sakkinen wrote:
> > > Sometimes you might want to use MAP_POPULATE to ask a device driver to
> > > initialize the device memory in some specific manner. SGX driver can use
> > > this to request more memory by issuing ENCLS[EAUG] x86 opcode for each
> > > page in the address range.
> > > 
> > > Add f_ops->populate() with the same parameters as f_ops->mmap() and make
> > > it conditionally called inside call_mmap(). Update call sites
> > > accodingly.
> > 
> > Your device driver has a ->mmap operation.  Why does it need another
> > one?  More explanation required here.
> 
> f_ops->mmap() would require an additional parameter, which results
> heavy refactoring.
> 
> struct file_operations has 1125 references in the kernel tree, so I
> decided to check this way around first. 

Are you saying that your device driver behaves differently if
MAP_POPULATE is set versus if it isn't?  That seems hideously broken.
