Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056254D0394
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027DB10E00F;
	Mon,  7 Mar 2022 15:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5810E00F;
 Mon,  7 Mar 2022 15:58:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61E75B81606;
 Mon,  7 Mar 2022 15:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52D7C340E9;
 Mon,  7 Mar 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646668726;
 bh=W5kqratoVSRl9NEd4VE6Iu3BSqv9ulKVQPHP1qdhNvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aurmVE6NZjU7sOJJ+E50h+AIed6RxvrashOmy+xb2DcYubmVUquVyy5I9fekqFNX5
 Cj+DSIerBr9haVVQWprk2CNueZQDWhPWsYbjZnFm5soSe9mGKZABgiP7UB87yme/N4
 6EPfyNphy7nkrwusx8woJNJVhhRtzd+KdAwnPwTkOb1R7gnVSFeh7a2JW9/ViytEVh
 Q601UbynX2V3G3LMpsywSlFS/RXL1A8v1EyttbFgnIXyJHWxWdXHy8L4t6dm0RnGNZ
 1nhf2OPJo2RASPa3NwFjwplBGb8ddISaD7ZUdDcGoU3Lc8nvMUP2jl9oHK4F7hlT1g
 hFXST0Agp0K8w==
Date: Mon, 7 Mar 2022 17:58:05 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 0/3] MAP_POPULATE for device memory
Message-ID: <YiYrjRW/Qmoq8c+L@iki.fi>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <YiSb7tsUEBRGS+HA@casper.infradead.org>
 <YiW4yurDXSifTYUt@infradead.org> <YiYIv9guOgClLKT8@iki.fi>
 <YiYrRWMp1akXY8Vb@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiYrRWMp1akXY8Vb@infradead.org>
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 Matthew Auld <matthew.auld@intel.com>, Vasily Averin <vvs@virtuozzo.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, G@iki.fi, linux-mips@vger.kernel.org,
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

On Mon, Mar 07, 2022 at 07:56:53AM -0800, Christoph Hellwig wrote:
> On Mon, Mar 07, 2022 at 03:29:35PM +0200, Jarkko Sakkinen wrote:
> > So what would you suggest to sort out the issue? I'm happy to go with
> > ioctl if nothing else is acceptable.
> 
> PLenty of drivers treat all mmaps as if MAP_POPULATE was specified,
> typically by using (io_)remap_pfn_range.  If there any reason to only
> optionally have the pre-fault semantics for sgx?  If not this should
> be really simple.  And if we have a real need for it to be optional
> we'll just need to find a sane way to pass that information to ->mmap.

Dave, what if mmap() would just unconditionally EAUG after initialization?

It's an option, yes.

BR, Jarkko
