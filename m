Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD11AD13A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D6F6EB65;
	Thu, 16 Apr 2020 20:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706ED6EB65
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:37:41 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id g6so2183092pgs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XptGLsb8LK835cBV0jSCf0HRG/zsBSED6dv7tPgulp4=;
 b=gnCYkWmGETLB8PFSLV04Wdrz2FK+gEIIVYi1koqv0Kj68T1sE9a0zKATXAPY7gyzfJ
 suAROh/dNMoI6pHy/mCCmAEukmmvuLcuT+oRiOR7pSsJ7zs8in52Gebp1M1SYorAU4tK
 gOw3D6aDwjxZUg6c2JW6Y26Oj3CTSIyaIex5HlRUwrN0Akr9mc2rJN/ETJ63AkMWNaPZ
 lBqmfTlQr2tQLv3hxk3korpwrPMIzUOkCHKM9MiAc5EcYNrnyoXofMkm1N6eYHhs/DeF
 913mMDnNGshbbDlgR/ygTf2Uto9ROB2t1oEKoFobtuWYnROIBcT0nnQEOaLeZGRWafc8
 pefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=XptGLsb8LK835cBV0jSCf0HRG/zsBSED6dv7tPgulp4=;
 b=TQ8JYq/odf/yFJmt1kGI1897d494N3fNz3yF4ZOsvF1tm08X3BNPUYby1X7w/XLHAW
 X0CAtjgDQ+JjNyn1DWVh0oQUVMFvL6rGC2O6QDIOjQJsfbthmDPiCtkuB06fASRe8zKX
 FZ+w+coiCze/n5BEKYvLTSeV/Tyz6iIavOHqxX9dJ1o/mUmGoGVXhCaFCNIOP2Zy/CWR
 JsR5pGdIsF1dnYgApfg7fuNorEO5emapU0pwtyPmUA9rUtTy7vvmi236m30DYWzGDZEA
 V8piI71I7jAKg8HpodEeYGU6G0QWIBmit97DZiEUoKPBVh/iFP0YRKXq5Mp4u1DVKKj1
 GZ5g==
X-Gm-Message-State: AGi0PuYTRbsQpmuiz+AVxDQbwkjTCeHRNF1rFSBnUpkh0hK+KNYnAivi
 nxzdKfy7W3M3J6yKbSScx0E=
X-Google-Smtp-Source: APiQypLz/G622vMAZI/1t7tx6iXdrAiprqdhsptFvPk2bcCnaQJR//IYq0Xxli2CBTatOLYd6eCB1g==
X-Received: by 2002:a63:2e03:: with SMTP id u3mr15186804pgu.121.1587069460712; 
 Thu, 16 Apr 2020 13:37:40 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id u13sm3654978pjb.45.2020.04.16.13.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 13:37:38 -0700 (PDT)
Date: Thu, 16 Apr 2020 13:37:36 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200416203736.GB50092@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <20200409160826.GC247701@google.com>
 <20200409165030.GG20713@hirez.programming.kicks-ass.net>
 <20200409170813.GD247701@google.com>
 <20200410023845.GA2354@jagdpanzerIV.localdomain>
 <20200410231136.GA101325@google.com>
 <20200411072052.GA31242@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200411072052.GA31242@lst.de>
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
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,


Sorry for the late.

On Sat, Apr 11, 2020 at 09:20:52AM +0200, Christoph Hellwig wrote:
> Hi Minchan,
> 
> On Fri, Apr 10, 2020 at 04:11:36PM -0700, Minchan Kim wrote:
> > It doesn't mean we couldn't use zsmalloc as module any longer. It means
> > we couldn't use zsmalloc as module with pgtable mapping whcih was little
> > bit faster on microbenchmark in some architecutre(However, I usually temped
> > to remove it since it had several problems). However, we could still use
> > zsmalloc as module as copy way instead of pgtable mapping. Thus, if someone
> > really want to rollback the feature, they should provide reasonable reason
> > why it doesn't work for them. "A little fast" wouldn't be enough to exports
> > deep internal to the module.
> 
> do you have any data how much faster it is on arm (and does that include
> arm64 as well)?  Besides the exports which were my prime concern,

https://github.com/sjenning/zsmapbench

I need to recall the memory. IIRC, it was almost 30% faster at that time
in ARM so was not trivial at that time. However, it was story from
several years ago.

> zsmalloc with pgtable mappings also is the only user of map_kernel_range
> outside of vmalloc.c, if it really is another code base for tiny
> improvements we could mark map_kernel_range or in fact remove it entirely
> and open code it in the remaining callers.

I alsh have temped to remove it. Let me have time to revist it in this
chance.

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
