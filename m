Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD04CFFFF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47D10F8BB;
	Mon,  7 Mar 2022 13:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1D10F8BB;
 Mon,  7 Mar 2022 13:26:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 043D96122C;
 Mon,  7 Mar 2022 13:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D7FC340E9;
 Mon,  7 Mar 2022 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646659612;
 bh=qX81leV8bx9GvO9cEY2kcfusSYlXGTfvKVJTjhs6u1k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EC5A4Xv6QJzgcsYzCWZkTnri1S1yMA6bREkS5X2l9zN2F1BasfM3p9xw1HQ5LfMcP
 Nwtut30wUo1NePVEIVCcgq6s0teloneCRYm3xr9DLbDZUahN5RvHxiqHLLp2j1kgWE
 SnJUZO1FhecuEYalCzLn+5OK2E+6s07YlZ1YRsy9+eY7jdeC76jyH/Yz3Ie2bmIRIR
 GblNgqmdg0SQr5GjqMSzE8Sc8CpWRwT4T0PJp+RCi9fKYhZYMb6/ZlLkVIA1MtvFCj
 2kVaAxYDvdR3laIZVSikufQ4LXJsMAB/Spv2b3PZVzr+4T2DD0EVIelk6vWCBOcCid
 aVATXTZ8VVvmQ==
Date: Mon, 7 Mar 2022 15:26:11 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC 1/3] mm: Add f_ops->populate()
Message-ID: <YiYH88wJQzCMvSPC@iki.fi>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <20220306053211.135762-2-jarkko@kernel.org>
 <YiSGgCV9u9NglYsM@kroah.com> <YiTpQTM+V6rlDy6G@iki.fi>
 <YiU5E6qqYAI+WPw9@casper.infradead.org> <YiYFxq87p2WVkZcz@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiYFxq87p2WVkZcz@iki.fi>
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
Cc: zhangyiru <zhangyiru3@huawei.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Matthew Auld <matthew.auld@intel.com>,
 Vasily Averin <vvs@virtuozzo.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 03:16:57PM +0200, Jarkko Sakkinen wrote:
> On Sun, Mar 06, 2022 at 10:43:31PM +0000, Matthew Wilcox wrote:
> > On Sun, Mar 06, 2022 at 07:02:57PM +0200, Jarkko Sakkinen wrote:
> > > So can I conclude from this that in general having populate available for
> > > device memory is something horrid, or just the implementation path?
> > 
> > You haven't even attempted to explain what the problem is you're trying
> > to solve.  You've shown up with some terrible code and said "Hey, is
> > this a good idea".  No, no, it's not.
> 
> The problem is that in order to include memory to enclave, which is
> essentially a reserved address range processes virtual address space
> there's two steps into it:
> 
> 1. Host side (kernel) does ENCLS[EAUG] to request a new page to be
>    added to the enclave.
> 2. Enclave accepts request with ENCLU[EACCEPT] or ENCLU[EACCEPTCOPY].
> 
> In the current SGX2 patch set this taken care by the page fault
> handler. I.e. the enclave calls ENCLU[EACCEPT] for an empty address
> and the #PF handler then does EAUG for a single page.
> 
> So if you want to process a batch of pages this generates O(n)
> round-trips.
> 
> So if there was a way pre-do a batch of EAUG's, that would allow
> to load data to the enclave without causing page faults happening
> constantly.
> 
> One solution for this simply add ioctl:
> 
> https://lore.kernel.org/linux-sgx/YiLRBglTEbu8cHP9@iki.fi/T/#m195ec84bf85614a140abeee245c5118c22ace8f3
> 
> But in practice when you wanted to use it, you would setup the
> parameters so that they match the mmap() range. So for pratical
> user space API having mmap() take care of this would be much more
> lean option.

For something like Graphene [1] the lazy #PF based option is probably
a way to go. For wasm runtime that we're doing in Enarx [2] we get better
performance by having something like this. I.e. we most of the time take
as much as we use.

[1] https://github.com/gramineproject/graphene
[2] https://enarx.dev/

BR, Jarkko
