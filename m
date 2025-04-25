Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F2A9BD1A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 05:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F49E10E120;
	Fri, 25 Apr 2025 03:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NY3Q2Aod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE98310E120
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745550227; x=1777086227;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PbrTW9Nb3NrHcVwh2uM1HWLU9tSO0MnJRZBwUbnBVL0=;
 b=NY3Q2Aodw/+ExeUtZhELwWKZmiXIMAuZ2+xlMa3sdpfzw0VDL0OYxX6g
 ciY0SlETOdAY4x/9jizOtS+XdTR58zU5Jgcw//HFUNmPCozApZqHiXKek
 4HH2gGBaevOki7Pd7PT6UYHbJ4TQBg1p+rDfYZsc0uC3QExJhqfZJvWbG
 tEEmGB23rj6CxZsMb8h4A2W0kCKDYA1wxlaspwFTVHIsGMlPtiS+rCX0E
 MTiHOWIWG8IZSLVA4bUYpuz3Cj34WXwTRLjB9jgUaIYIzLyB3E16770vS
 hcZnT25Zn7x13CA6tEyXFi8UVFKCWc1UTSlvNzu8bTA7sY+iqcmpaanYu g==;
X-CSE-ConnectionGUID: pLyOr+PbQVW+t0tSKDQGGQ==
X-CSE-MsgGUID: l2XR6SXmQUi6QSKK29oQoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57404505"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="57404505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 20:03:46 -0700
X-CSE-ConnectionGUID: AdA3GsKPSe+gUpEo+rXnjA==
X-CSE-MsgGUID: 2wUPDRRrROKdrn9fLmgO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="136858169"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136])
 ([10.238.232.136])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 20:03:43 -0700
Subject: Re: [PATCH 2/2] udmabuf: fix vmap missed offset page
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, Huan Yang
 <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-3-link@vivo.com>
 <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <70a4ae40-dbfe-a8ff-c4d7-a11c35490b3a@linux.intel.com>
Date: Fri, 25 Apr 2025 10:59:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


On 4/22/25 1:22 PM, Kasireddy, Vivek wrote:
> Hi Huan,
> 
>> Subject: [PATCH 2/2] udmabuf: fix vmap missed offset page
>>
>> Before invoke vmap, we need offer a pages pointer array which each page
>> need to map in vmalloc area.
>>
>> But currently vmap_udmabuf only set each folio's head page into pages,
>> missed each offset pages when iter.
>>
>> This patch set the correctly offset page in each folio into array.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
>> ---
>>  drivers/dma-buf/udmabuf.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 79845565089d..af5200e360a6 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -120,7 +120,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
>> iosys_map *map)
>>  		return -ENOMEM;
>>
>>  	for (pg = 0; pg < ubuf->pagecount; pg++)
>> -		pages[pg] = &ubuf->folios[pg]->page;
>> +		pages[pg] = folio_page(ubuf->folios[pg],
>> +				       ubuf->offsets[pg] >> PAGE_SHIFT);
> IIUC, it does not look like vm_map_ram() or the other functions it calls would
> write to these tail page pointers (struct page*), which should be safe even
> when HVO is enabled (based on your conversations with Muchun). However,
> I am wondering whether Bingbu can test this out with HVO enabled?

Sorry, I cannot test HVO enabled case. I was running my case with local
revert patch. :)

> 
> Regardless,
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> Thanks,
> Vivek
> 
>>
>>  	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>>  	kvfree(pages);
>> --
>> 2.48.1
> 

-- 
Best regards,
Bingbu Cao
