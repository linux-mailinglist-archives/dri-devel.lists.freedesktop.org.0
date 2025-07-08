Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68296AFCDA3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3954A10E669;
	Tue,  8 Jul 2025 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HpeuQR8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E42810E665
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751985076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f30AiRiu83THpcfglthOdo9U6Yf3sX8E34Z3cjlwv24=;
 b=HpeuQR8JiAubq+rGaocp0RGfhb8HvzbUK8qz3jzZz08kx+RZzA5155Anc/AXuiRwMY1qja
 GWpkYz8x7NKanZkYQUYz54RMhBxiTIzHtNVRnqrUTFnRz9R7vd/seekeDjDdfNnVnMNQmx
 jOsJP5OnQoroQUBqnZ2MeSu4w/sT/ww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-smCNH7JbNaW0wEyWNU7bzw-1; Tue, 08 Jul 2025 10:31:10 -0400
X-MC-Unique: smCNH7JbNaW0wEyWNU7bzw-1
X-Mimecast-MFC-AGG-ID: smCNH7JbNaW0wEyWNU7bzw_1751985069
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45311704d1fso29603485e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 07:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751985069; x=1752589869;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f30AiRiu83THpcfglthOdo9U6Yf3sX8E34Z3cjlwv24=;
 b=MIg2983Kqb0QrW369qsashHw79JdsIUuP4SRnJy8ptrvTYjxS5xb2MIW7GdyQbQlyj
 SDHnqT9E78btmIArIVsLqRT5QmBfAXTkvVqOrMgKNVUW/CoxM7cMk39IBDORhKG/XeYb
 toowi+fJuPKCiuKVCdsO2Bg8dEhvUOhicsogu6tqnoUMX6o4Isc3u9TAsZf/82MVDHir
 PFPnkQcQMon0pkvFyytkxsH44DfGzgzxvtApdIBn1sBeqZ4TTW1xKWlKQJfAXzOrC2KU
 F8qVCRWxl+/vQE4dkBPYXTMXp2xAYON2rTDm2YRPY2i7/qfKa7oTiDwG1Qb/zuPsBcHH
 Wt3Q==
X-Gm-Message-State: AOJu0Yx/wOStgE5HddMC+uXGl59i5y4LlZNwRO1lL6M4wn2q9MjLOj5g
 QK90Hq0N1PWbcVK8j5FLBVORQBPLQqDg8HeqiXFiw1UWZB8riRvisb/gQIkS3N4jbidFGWbc6O+
 5l+p/KbUq3uYn10uLWA99lXM2NbLqWpFoRQkCuT/Jh5H59cHD3vo3jD86a6SPfyRJzmr5IQ==
X-Gm-Gg: ASbGncvuMloP2pAeig4d3V9VMacr/2kbg6En4yxp8DiWi+Z028+levc0E4PgwbCinBn
 KXFIkmz5fz+Pn+7rZRoRMcr/smBH/LIctZo2l13d1iGDT1Dj/ciRLAZfTqykhVry9mj0WHMM1CU
 9RCxXxceBHSp1Qf74Z9U4UrwRdHsrCBOpPZwIuJVY9dAQsWD6zs69MfehBQxDasOEJ0AluX3tZ4
 fXghyFVRxeGNeMz2AsbE/j8X4UmtczPEFcxp+r095BxBQsTXPu4ezOK2w4D6jNm4KweqngCvyHN
 Wp/N7OPoqlTec7OiQYahNDhXOWCYKZ6wULbE3+CJ8M9BcLMi/f8/hQATKd4jD307p8Qpx2HG1i+
 Z9Hp5zXvTLlcqgJeykcW29GMzLwda9Wo5S0jU9DUp2d+0K4S5FA==
X-Received: by 2002:a05:600c:19c9:b0:43c:f629:66f4 with SMTP id
 5b1f17b1804b1-454b305fcb1mr171466855e9.0.1751985069216; 
 Tue, 08 Jul 2025 07:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWGRrMb9BJjJO2DTEd6f/RxIyRkezBsBP3T5rnNrCC4JPUdxPSSzV9Y9MBFk+53+FOzAZhGw==
X-Received: by 2002:a05:600c:19c9:b0:43c:f629:66f4 with SMTP id
 5b1f17b1804b1-454b305fcb1mr171465925e9.0.1751985068571; 
 Tue, 08 Jul 2025 07:31:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0ae0sm13394704f8f.33.2025.07.08.07.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:31:08 -0700 (PDT)
Message-ID: <9e8771ef-e734-4d56-aa20-c3fdba0fd5ab@redhat.com>
Date: Tue, 8 Jul 2025 16:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/11] mm/memremap: Add folio_split support
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-8-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-8-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x9L3214_oGIyGp8ITrhYCb3Ex_y3M51-px0w-DpQzrY_1751985069
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06.03.25 05:42, Balbir Singh wrote:
> When a zone device page is split (via huge pmd folio split). The
> driver callback for folio_split is invoked to let the device driver
> know that the folio size has been split into a smaller order.
> 
> The HMM test driver has been updated to handle the split, since the
> test driver uses backing pages, it requires a mechanism of reorganizing
> the backing pages (backing pages are used to create a mirror device)
> again into the right sized order pages. This is supported by exporting
> prep_compound_page().
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   include/linux/memremap.h |  7 +++++++
>   include/linux/mm.h       |  1 +
>   lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
>   mm/huge_memory.c         |  5 +++++
>   mm/page_alloc.c          |  1 +
>   5 files changed, 49 insertions(+)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 11d586dd8ef1..2091b754f1da 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>   	 */
>   	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>   			      unsigned long nr_pages, int mf_flags);
> +
> +	/*
> +	 * Used for private (un-addressable) device memory only.
> +	 * This callback is used when a folio is split into
> +	 * a smaller folio

Confusing. When a folio is split, it is split into multiple folios.

So when will this be invoked?

> +	 */
> +	void (*folio_split)(struct folio *head, struct folio *tail);

head and tail are really suboptimal termonology. They refer to head and 
tail pages, which is not really the case with folios (in the long run).

>   };
>   
>   #define PGMAP_ALTMAP_VALID	(1 << 0)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 98a67488b5fe..3d0e91e0a923 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
>   void __folio_put(struct folio *folio);
>   
>   void split_page(struct page *page, unsigned int order);
> +void prep_compound_page(struct page *page, unsigned int order);
>   void folio_copy(struct folio *dst, struct folio *src);
>   int folio_mc_copy(struct folio *dst, struct folio *src);
>   
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index a81d2f8a0426..18b6a7b061d7 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>   	return ret;
>   }
>   
> +
> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
> +{
> +	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
> +	struct folio *new_rfolio;
> +	struct folio *rfolio;
> +	unsigned long offset = 0;
> +
> +	if (!rpage) {
> +		folio_page(tail, 0)->zone_device_data = NULL;
> +		return;
> +	}
> +
> +	offset = folio_pfn(tail) - folio_pfn(head);
> +	rfolio = page_folio(rpage);
> +	new_rfolio = page_folio(folio_page(rfolio, offset));
> +
> +	folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
> +
> +	if (folio_pfn(tail) - folio_pfn(head) == 1) {
> +		if (folio_order(head))
> +			prep_compound_page(folio_page(rfolio, 0),
> +						folio_order(head));
> +		folio_set_count(rfolio, 1);
> +	}
> +	clear_compound_head(folio_page(new_rfolio, 0));
> +	if (folio_order(tail))
> +		prep_compound_page(folio_page(new_rfolio, 0),
> +						folio_order(tail));
> +	folio_set_count(new_rfolio, 1);
> +	folio_page(new_rfolio, 0)->mapping = folio_page(rfolio, 0)->mapping;
> +	tail->pgmap = head->pgmap;

Most of this doesn't look like it should be the responsibility of this 
callback.

Setting up a new folio after the split (messing with compound pages etc) 
really should not be the responsibility of this callback.

So no, this looks misplaced.

> +}
> +
>   static const struct dev_pagemap_ops dmirror_devmem_ops = {
>   	.page_free	= dmirror_devmem_free,
>   	.migrate_to_ram	= dmirror_devmem_fault,
>   	.page_free	= dmirror_devmem_free,
> +	.folio_split	= dmirror_devmem_folio_split,
>   };
>   
>   static int dmirror_device_init(struct dmirror_device *mdevice, int id)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 995ac8be5709..518a70d1b58a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3655,6 +3655,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>   						MTHP_STAT_NR_ANON, 1);
>   			}
>   
> +			if (folio_is_device_private(origin_folio) &&
> +					origin_folio->pgmap->ops->folio_split)
> +				origin_folio->pgmap->ops->folio_split(
> +					origin_folio, release);

Absolutely ugly. I think we need a wrapper for the

> +
>   			/*
>   			 * Unfreeze refcount first. Additional reference from
>   			 * page cache.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 17ea8fb27cbf..563f7e39aa79 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -573,6 +573,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>   
>   	prep_compound_head(page, order);
>   }
> +EXPORT_SYMBOL_GPL(prep_compound_page);

Hmmm, that is questionable. We don't want arbitrary modules to make use 
of that.

Another sign that you are exposing the wrong functionality/interface 
(folio_split) to modules.

-- 
Cheers,

David / dhildenb

