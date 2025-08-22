Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40DB30D5C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 06:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0187C10E08A;
	Fri, 22 Aug 2025 04:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S0USeWhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA8A10E315
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755835767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wD6Kie9NmTYlBWSYITqg8VmPWCkzgpHh3Jn6J+e3AEM=;
 b=S0USeWhYw+AAtz8n9BJc2lPdXrupSAo0WmePlvOBUUYJ67vXXuEXsPH8jH5n64xquWhsew
 GHwETkN8M2jEONa3d3KI1nkP+q5tONY6RxO7V+Yrbi0g+uCYjHNVIeUgo8UB6XCKcR623P
 WNIeD5a20sayIsLkxl46Ne9fgGi8jWo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-8wAUO3goPvi8QfrxaOAH8g-1; Fri, 22 Aug 2025 00:09:23 -0400
X-MC-Unique: 8wAUO3goPvi8QfrxaOAH8g-1
X-Mimecast-MFC-AGG-ID: 8wAUO3goPvi8QfrxaOAH8g_1755835762
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-333f92b401bso6907871fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 21:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755835762; x=1756440562;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wD6Kie9NmTYlBWSYITqg8VmPWCkzgpHh3Jn6J+e3AEM=;
 b=kmTUy3UnUINaFU7v3FNmVLrHP2jfxph3UoHRqpmNNBBE83zH28zcnOS0LhmkebRJ4Z
 0t++Lk29I3KpvQUYI7P9DwZ6Z48IUclAnDxf5EY2cFJDCzuuLKt/Upxm3AJ+rdsfUNHp
 yGVExgcNiO9xWzWvVnZng+5sVvsNc/yCZ+yC1J2M/Q0qm6tEHKsk2dXzw1XorIKBTcZ4
 8QTLqQ5C7xEI2Y3jjDW0t4ZwA4raTGVImt27ofARB4fMclUi3WUa5zhvDJXnw2wc0YXS
 N1N1VmZ+gPauxgvDyjCI/TCVn7UdE7NVT6RtMPPJeAQJaZhL0qXWx+HdhfmXXZtNt9vC
 bGPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX74uhIGpI8yBlVsRTnpMkjsdvIqxxZ74Kta2Bqdswv5hOmJcXtwSvspkLxMHUoh5yPri6eiFaTblM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY+VA/dvMW6vsxUOigoc+WwK1v6YMlT3kwBNOGOn9vsUxs7oTJ
 3c6P9otLT8DESbcsWVC26CK/KMxYCNvsTOG9pSS4CYjBcKyRvYeprCXVqNab226FnGpbzni/EIi
 lc3b+SXc4PFFYODuZyn7jKjcG2ItpR9Uq28E5c+dYUD/nmpw+2/TJo9FzCYfBp2HSf3tW
X-Gm-Gg: ASbGncvK/oCJ+GPSw95AynnegFEFw7wshjIFH24otsRbr/ATHL7vN77lIIiKk2dbMlc
 Zpk92UiO+mQEA4P6KpxoKUCyE/VmxBAcnfEwkCNIpYOH0otsnNygfsUlb7W2isbJKddAVdaBo9L
 YsWhAxUaQyGMBYyyXRy1oZYT/FAjtojwJr+UcLY9TqlVJC7gJx1Jewwq4VQMmjhLJuOQ9GCgus6
 HtEYI6uyCzzJ79ZpVE0k1BP4QgEZRR9SnZQ/5bE3PkjK3uLDiy1iCYQV0odvHXQsVqNdKkBKTTB
 3nOMOpUV0OxTrPeYYa7I/SVVrgdFyaIOf+UmDZaLgbUadPpupPM3le4Xbc3mLQdpIg==
X-Received: by 2002:a2e:be0c:0:b0:333:b6b0:e665 with SMTP id
 38308e7fff4ca-33650fa8605mr4319511fa.30.1755835762120; 
 Thu, 21 Aug 2025 21:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIfwy5viYQG7CiACnNo0XJ1QLrkAQo6vQi0t/AKYxGuojOFc+bxzH8Oeop0sL+wr/cDEqByA==
X-Received: by 2002:a2e:be0c:0:b0:333:b6b0:e665 with SMTP id
 38308e7fff4ca-33650fa8605mr4319091fa.30.1755835761548; 
 Thu, 21 Aug 2025 21:09:21 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41e3cfsm35236551fa.6.2025.08.21.21.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 21:09:19 -0700 (PDT)
Message-ID: <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
Date: Fri, 22 Aug 2025 07:09:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20250821200701.1329277-11-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kgcNdf4bibkyI-6lTJQ4_m6t3h9mMha9_16FTlE-RMQ_1755835762
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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


On 8/21/25 23:06, David Hildenbrand wrote:

> All pages were already initialized and set to PageReserved() with a
> refcount of 1 by MM init code.

Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
initialize struct pages?

> In fact, by using __init_single_page(), we will be setting the refcount to
> 1 just to freeze it again immediately afterwards.
>
> So drop the __init_single_page() and use __ClearPageReserved() instead.
> Adjust the comments to highlight that we are dealing with an open-coded
> prep_compound_page() variant.
>
> Further, as we can now safely iterate over all pages in a folio, let's
> avoid the page-pfn dance and just iterate the pages directly.
>
> Note that the current code was likely problematic, but we never ran into
> it: prep_compound_tail() would have been called with an offset that might
> exceed a memory section, and prep_compound_tail() would have simply
> added that offset to the page pointer -- which would not have done the
> right thing on sparsemem without vmemmap.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/hugetlb.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index d12a9d5146af4..ae82a845b14ad 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3235,17 +3235,14 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  					unsigned long start_page_number,
>  					unsigned long end_page_number)
>  {
> -	enum zone_type zone = zone_idx(folio_zone(folio));
> -	int nid = folio_nid(folio);
> -	unsigned long head_pfn = folio_pfn(folio);
> -	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> +	struct page *head_page = folio_page(folio, 0);
> +	struct page *page = folio_page(folio, start_page_number);
> +	unsigned long i;
>  	int ret;
>  
> -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
> -		struct page *page = pfn_to_page(pfn);
> -
> -		__init_single_page(page, pfn, zone, nid);
> -		prep_compound_tail((struct page *)folio, pfn - head_pfn);
> +	for (i = start_page_number; i < end_page_number; i++, page++) {
> +		__ClearPageReserved(page);
> +		prep_compound_tail(head_page, i);
>  		ret = page_ref_freeze(page, 1);
>  		VM_BUG_ON(!ret);
>  	}
> @@ -3257,12 +3254,14 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
>  {
>  	int ret;
>  
> -	/* Prepare folio head */
> +	/*
> +	 * This is an open-coded prep_compound_page() whereby we avoid
> +	 * walking pages twice by preparing+freezing them in the same go.
> +	 */
>  	__folio_clear_reserved(folio);
>  	__folio_set_head(folio);
>  	ret = folio_ref_freeze(folio, 1);
>  	VM_BUG_ON(!ret);
> -	/* Initialize the necessary tail struct pages */
>  	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
>  	prep_compound_head((struct page *)folio, huge_page_order(h));
>  }

--Mika

