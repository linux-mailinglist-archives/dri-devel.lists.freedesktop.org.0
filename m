Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D151A3034
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F7E6EB8A;
	Thu,  9 Apr 2020 07:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA616EA80
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5Zyr+e9ojNxPf0UJbZ9u+v/X52sgt1i2sd8hmR6F47U=; b=L32SowMkDY1Nvkk1P+JH95Mz1a
 GuD4zRqv2dPCcJVwSn1QwymJ24KIDAK1RGhAyV/QQ+p2QbBtRHvi/a1FYE3qfogJFrnBZkDlThFzK
 IqCB93D/bsMtpUeC4hD3PyzdzrsUqcglZldNwu/V0g0eR8ChVF9oZFNzWsry73hFTny3aFVqoOety
 mJ0SNj2FV0h0akd26thCyTTJlDnP3cVMyV9RDiMHzwxr89F3pcghAW072S9K43a3CAhduPy/Qqxhj
 9VZc0gmBwmCxm9pi6xN0ggQWrzvceGDE2Tt7CjnyWIReAaTLibi/4WD/2QFbaSK0YWgfUD4jZuoHs
 1qhQI+Mw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jMCQB-0000vd-W6; Wed, 08 Apr 2020 15:15:19 +0000
Date: Wed, 8 Apr 2020 08:15:19 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200408151519.GQ21484@bombadil.infradead.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
 <20200408151203.GN20730@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408151203.GN20730@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Christoph Hellwig <hch@lst.de>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 05:12:03PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 08, 2020 at 08:01:00AM -0700, Randy Dunlap wrote:
> > Hi,
> > 
> > On 4/8/20 4:59 AM, Christoph Hellwig wrote:
> > > diff --git a/mm/Kconfig b/mm/Kconfig
> > > index 36949a9425b8..614cc786b519 100644
> > > --- a/mm/Kconfig
> > > +++ b/mm/Kconfig
> > > @@ -702,7 +702,7 @@ config ZSMALLOC
> > >  
> > >  config ZSMALLOC_PGTABLE_MAPPING
> > >  	bool "Use page table mapping to access object in zsmalloc"
> > > -	depends on ZSMALLOC
> > > +	depends on ZSMALLOC=y
> > 
> > It's a bool so this shouldn't matter... not needed.
> 
> My mm/Kconfig has:
> 
> config ZSMALLOC
> 	tristate "Memory allocator for compressed pages"
> 	depends on MMU
> 
> which I think means it can be modular, no?

Randy means that ZSMALLOC_PGTABLE_MAPPING is a bool, so I think hch's patch
is wrong ... if ZSMALLOC is 'm' then ZSMALLOC_PGTABLE_MAPPING would become
'n' instead of 'y'.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
