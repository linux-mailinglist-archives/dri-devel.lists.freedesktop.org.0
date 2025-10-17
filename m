Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07348BEBD66
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 23:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FA310E061;
	Fri, 17 Oct 2025 21:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Pb3rtC4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49AF10E043;
 Fri, 17 Oct 2025 21:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=x7o2YWfTYWvvpeEx4JrqhbgEy4JzUWFniUNRW6oSBlM=; b=Pb3rtC4RdF2NsCYvJ4A9cC5+o5
 DV8vVeeFeVXh5fcNYXzcVmqJP8Vx6kBRhiYXuemDo+IX6LkKZWcKJRv1Ej0vSH3AVNBFG40U6V6Sa
 oa2CFHVvwLl+7WzdLCg34ITSujSABfuuu4RppYXDdrzwkuVJlveiuSnDFyloJa/RUQ5RZXDRHfqqh
 1sA6V+g5Sh/ypi1O6y0ntVjA7p+vo04vGDBaHgx2B64xqSD5vNazWjdpKGFtbuVHZbHdJyvqOZe/Z
 VmlxTUMp5if+N3N8KH+I9ZTl9Ohdc46Zq18kx5udsjizL5owhw8t3q1Nkr5Pk9ZmAg+2N4qM9JZHs
 tv/Vsh+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1v9sDz-00000003bne-2gZi;
 Fri, 17 Oct 2025 21:42:59 +0000
Date: Fri, 17 Oct 2025 22:42:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?utf-8?Q?Miko=C5=82aj?= Wasiak <mikolaj.wasiak@intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 03/13] drm/shmem-helper: Map huge pages in fault
 handlers
Message-ID: <aPK4YwMmYTDsKHcL@casper.infradead.org>
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-4-loic.molinari@collabora.com>
 <aO_ZmA6yoqbzTKt9@casper.infradead.org>
 <f564735b-7cbd-486c-9dd4-a4555e73edde@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f564735b-7cbd-486c-9dd4-a4555e73edde@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 16, 2025 at 01:17:07PM +0200, Loïc Molinari wrote:
> > It looks to me like we have an opportunity to do better here by
> > adding a vmf_insert_pfns() interface.  I don't think we should delay
> > your patch series to add it, but let's not forget to do that; it can
> > have very good performnce effects on ARM to use contptes.
> 
> Agreed. I initially wanted to provide such an interface based on set_ptes()
> to benefit from arm64 contptes but thought it'd better be a distinct patch
> series.

Agreed.

> > 
> > > @@ -617,8 +645,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> > [...]
> > > -		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> > > +	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
> > > +		ret = VM_FAULT_NOPAGE;
> > > +		goto out;
> > >   	}
> > 
> > Does this actually work?
> 
> Yes, it does. Huge pages are successfully mapped from both map_pages and
> fault handlers. Anything wrong with it?

No, I just wasn't sure that this would work correctly.

> There seems to be an another issue thought. There are failures [1], all
> looking like that one [2]. I think it's because map_pages is called with the
> RCU read lock taken and the DRM GEM map_pages handler must lock the GEM
> object before accessing pages with dma_resv_lock(). The locking doc says:
> "If it's not possible to reach a page without blocking, filesystem should
> skip it.". Unlocking the RCU read lock in the handler seems wrong and doing
> without a map_pages implementation would be unfortunate. What would you
> recommend here?

I'm not familiar with GEM locking, so let me describe briefly how
pagecache locking works.

Calling mmap bumps the refcount on the inode.  That keeps the inode
around while the page fault handler runs.  For each folio, we
get a refcount on it, then we trylock it.  Then we map each page in the
folio.

So maybe you can trylock the GEM object?  It isn't clear to me whether
you want finer grained locking than that.  If the trylock fails, no big
deal, you just fall through to the fault path (with the slightly more
heavy-weight locking that allows you to sleep).
