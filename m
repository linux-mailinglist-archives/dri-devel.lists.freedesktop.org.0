Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542B1A3039
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0148D6EB7B;
	Thu,  9 Apr 2020 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750CB6EA7E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=zXlIsbDM28OKmK+7j6iTmvR4wjllvC+TzshTZOZR7TU=; b=gBMMD0VVRRKgOhHzpjDt/lZU1Y
 u9BILt8VLhw0sO34uaQF8z0/PQuXdH0k8rq6aufu410mYc/h3uYsHE3q9jGtAR4M+g6usA+9c6hXK
 qRLaLBonqPUOIZaYwx8mMo+2EsEG9nTiAccNRbs6mfHNotxOLNwE+DlKy1V2XzHirfFfsMPOVzUym
 kj+8W0aL1LC5SGUCy/9LavI/NBI3tZTJ8tgBbvnAEsg8PZoPaY6ZqgBKJJoDlEFMhPCgeRUq/t2tJ
 UNV8tw5S5/pX84WeHyxnsmLcEBTrdKEA6VvzmozcQ0Sa3ZoJrnu5VhBf+PUP8I8OdfHleFuFcY7pQ
 OYfbsiKQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCm9-0006Y5-CG; Wed, 08 Apr 2020 15:38:07 +0000
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
 <20200408151203.GN20730@hirez.programming.kicks-ass.net>
 <20200408151519.GQ21484@bombadil.infradead.org>
 <20200408153602.GA28081@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ce1cb560-2670-c79d-48eb-e4dd423aecb0@infradead.org>
Date: Wed, 8 Apr 2020 08:37:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408153602.GA28081@lst.de>
Content-Language: en-US
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
Cc: linux-hyperv@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 David Airlie <airlied@linux.ie>, Laura Abbott <labbott@redhat.com>,
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

On 4/8/20 8:36 AM, Christoph Hellwig wrote:
> On Wed, Apr 08, 2020 at 08:15:19AM -0700, Matthew Wilcox wrote:
>>>>>  config ZSMALLOC_PGTABLE_MAPPING
>>>>>  	bool "Use page table mapping to access object in zsmalloc"
>>>>> -	depends on ZSMALLOC
>>>>> +	depends on ZSMALLOC=y
>>>>
>>>> It's a bool so this shouldn't matter... not needed.
>>>
>>> My mm/Kconfig has:
>>>
>>> config ZSMALLOC
>>> 	tristate "Memory allocator for compressed pages"
>>> 	depends on MMU
>>>
>>> which I think means it can be modular, no?
>>
>> Randy means that ZSMALLOC_PGTABLE_MAPPING is a bool, so I think hch's patch
>> is wrong ... if ZSMALLOC is 'm' then ZSMALLOC_PGTABLE_MAPPING would become
>> 'n' instead of 'y'.
> 
> In Linus' tree you can select PGTABLE_MAPPING=y with ZSMALLOC=m,
> and that fits my understanding of the kbuild language.  With this
> patch I can't anymore.
> 

Makes sense. thanks.

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
