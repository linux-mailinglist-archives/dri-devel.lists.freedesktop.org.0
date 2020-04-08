Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E251A24B5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 17:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD1A6EA72;
	Wed,  8 Apr 2020 15:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CBE6EA72
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rjv5131jSAiyIu5HYACdcXLWZcmDSy5Ae4NdyG3A0EU=; b=FuXsAshYsSTgOfgG+tafxq311H
 2DLcoyBxKM/nbGCT2GEvorwEQ03/VOWi5DKAbxhI4DqIPjAGXNNsOWsSOG7aU/Lla3ICxHLRu6SzM
 /q9DEwOTHGBUUXd+C1gWvP9Pjgc6GcW+Xi/RtUJFOAx/HNAnnerQFGHAfcPScOe5j3ll7FaXVMW5Z
 Z2xjwSDzwp0YcD5TzxjStK7nQDDKjXVISOx5Itl6OOQeUK3wpMFWDuSjU7Q7E7VC31GOzaWh+PQx5
 zbPF7UcdVGkG+53Xs4Olbyq1FLyXUWKqf1azA1wf6Pm9lsIEV7Cpflmxs3MnCPe2MFR6K51PRMHF8
 JF/j+ctA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCN3-0004v8-A7; Wed, 08 Apr 2020 15:12:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 64B9E300478;
 Wed,  8 Apr 2020 17:12:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2B71F2BB026A0; Wed,  8 Apr 2020 17:12:03 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:12:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200408151203.GN20730@hirez.programming.kicks-ass.net>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
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
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 08:01:00AM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 4/8/20 4:59 AM, Christoph Hellwig wrote:
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 36949a9425b8..614cc786b519 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -702,7 +702,7 @@ config ZSMALLOC
> >  
> >  config ZSMALLOC_PGTABLE_MAPPING
> >  	bool "Use page table mapping to access object in zsmalloc"
> > -	depends on ZSMALLOC
> > +	depends on ZSMALLOC=y
> 
> It's a bool so this shouldn't matter... not needed.

My mm/Kconfig has:

config ZSMALLOC
	tristate "Memory allocator for compressed pages"
	depends on MMU

which I think means it can be modular, no?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
