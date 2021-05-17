Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5F386C89
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 23:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6F96E4C1;
	Mon, 17 May 2021 21:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564576E48E;
 Mon, 17 May 2021 21:46:41 +0000 (UTC)
IronPort-SDR: jedau+5vNUxmyr3/Y75oc0/ZG6Dw3/FnGMdhhyBRwTYHvhl0I9M4473HbbE9XgnmwKPLxisbaD
 ZzOWi/OlCAbA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198624735"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="198624735"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 14:46:40 -0700
IronPort-SDR: s5l9ImYLcSiB/VyGPVX9aB8wj3/TqQL2Gvtn9SvHg+KEAQri3lwvx4FhqH3+3zM3KjxvlykP5/
 YFPogSmBzmJA==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="393695671"
Received: from mkosciow-mobl.igk.intel.com (HELO [10.249.254.186])
 ([10.249.254.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 14:46:37 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] i915: fix remap_io_sg to verify the pgprot
To: Christoph Hellwig <hch@lst.de>, Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <20210326055505.1424432-1-hch@lst.de>
 <20210326055505.1424432-5-hch@lst.de> <87pmxqiry6.fsf@depni.sinp.msu.ru>
 <20210517123716.GD15150@lst.de> <87lf8dik15.fsf@depni.sinp.msu.ru>
 <20210517131137.GA19451@lst.de>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <976fb38a-7780-6ca6-d602-a5f02c0938c9@linux.intel.com>
Date: Mon, 17 May 2021 23:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517131137.GA19451@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/17/21 3:11 PM, Christoph Hellwig wrote:
> On Mon, May 17, 2021 at 04:09:42PM +0300, Serge Belyshev wrote:
>> Christoph Hellwig <hch@lst.de> writes:
>>
>>> As an ad-hoc experiment:  can you replace the call to remap_pfn_range
>>> with remap_pfn_range_notrack (and export it if you build i915 modular)
>>> in remap_io_sg and see if that makes any difference?
>> That worked, thanks -- no artifacts seen.
> Looks like it is caused by the validation failure then.  Which means the
> existing code is doing something wrong in its choice of the page
> protection bit.  I really need help from the i915 maintainers here..

Hmm,

Apart from the caching aliasing Mattew brought up, doesn't the 
remap_pfn_range_xxx() family require the mmap_sem held in write mode 
since it modifies the vma structure? remap_io_sg() is called from the 
fault handler with the mmap_sem held in read mode only.

/Thomas

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
