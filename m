Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447580EB4A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8910E1B8;
	Tue, 12 Dec 2023 12:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE410E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702383242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fISaOeAsyCJNN+NgPL5k4jqcKgvpVQg/3+vT/4W+zE=;
 b=SLhTo2S9RyxqyVYwxhc6Ur0BDsB2u5HQz7dAinyyf1kJ6XKVqYrKCxGQODTlhp9njnvFnQ
 jElbWeWSK0pcM3BqIBRICUNN9SmAqh+reSJii5nl+PQlmZMdYyWUbrn50DzDs2uq5McRbh
 Hpu/x5jIB1T/w319a8Cmi4KuGSIRyqU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-8wHiMQpkOSuoXSfsoya0HQ-1; Tue, 12 Dec 2023 07:14:01 -0500
X-MC-Unique: 8wHiMQpkOSuoXSfsoya0HQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c421f2686so18000185e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 04:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702383240; x=1702988040;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fISaOeAsyCJNN+NgPL5k4jqcKgvpVQg/3+vT/4W+zE=;
 b=ZDvHPBKTXIQ4GhrARkTs+BONbKe6Ipmun6/+m/+R5EX98MrVsj7JFPDsQ1KkhVc8mW
 Uw5mwFQA6Tx7hd/0HaCCtJHqmHwOHGJYRiLsx5EJklcmOLypwEPh3N/tQgUxTX89w7B6
 jK0PE4ALXvbjzlYQ8IOb1pEptMKql+FoEi9vVi0f35BQh2trtii/E+0whuMKUV9KtbuO
 Oi1+RjuJRp5gM3mk8wDP0iT/Q/UmsubwHifonwTgeUNpkXqQJ3i92TQFODuheW+Mrii+
 HsOpRPbllwdrqrXvhCMLNA7780W+VJKmGbvvAVxWw+OIgtr4vEmToh417oQvxXTal4Xs
 OVqg==
X-Gm-Message-State: AOJu0YzxYnawfTm/5/UebVoqFR4p1q3K8S3QiknLKjT7/7UcE7bS5Twj
 /wuOJrfc8F2pTW1IPBP5GU9Vm/uqGusSTbS5oyHtENJSLRvbN9G6lOy6Wed3/yojA450shxz7EJ
 rGIjIAqHRrPGpLLiyCTmJYYhAlJb+
X-Received: by 2002:a05:600c:3556:b0:40b:5f03:b3b5 with SMTP id
 i22-20020a05600c355600b0040b5f03b3b5mr1303315wmq.215.1702383240141; 
 Tue, 12 Dec 2023 04:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUKy5CHQAd49v51fpCPu5YK59KXKOF9z2TqYPtBccURzcxHnE/F8rEMVqoblDUTeW5DdqmBA==
X-Received: by 2002:a05:600c:3556:b0:40b:5f03:b3b5 with SMTP id
 i22-20020a05600c355600b0040b5f03b3b5mr1303313wmq.215.1702383239685; 
 Tue, 12 Dec 2023 04:13:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c74b:ca00:4ca2:ff2c:9092:f070?
 (p200300cbc74bca004ca2ff2c9092f070.dip0.t-ipconnect.de.
 [2003:cb:c74b:ca00:4ca2:ff2c:9092:f070])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b00405959469afsm16528751wmq.3.2023.12.12.04.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 04:13:59 -0800 (PST)
Message-ID: <00c84f06-66b9-484c-8a2c-e820c7d21c9d@redhat.com>
Date: Tue, 12 Dec 2023 13:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-4-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231212073803.3233055-4-vivek.kasireddy@intel.com>
X-Mimecast-Spam-Score: 0
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Junxiao Chang <junxiao.chang@intel.com>,
 Christoph Hellwig <hch@lst.de>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.23 08:38, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the folios associated
> with a memfd, the memfd_pin_folios() API provides an option to
> not only pin the folios via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with memfds but it should work with any files
> that belong to either shmemfs or hugetlbfs. Files belonging to
> other filesystems are rejected for now.
> 
> The folios need to be located first before pinning them via FOLL_PIN.
> If they are found in the page cache, they can be immediately pinned.
> Otherwise, they need to be allocated using the filesystem specific
> APIs and then pinned.
> 
> v2:
> - Drop gup_flags and improve comments and commit message (David)
> - Allocate a page if we cannot find in page cache for the hugetlbfs
>    case as well (David)
> - Don't unpin pages if there is a migration related failure (David)
> - Drop the unnecessary nr_pages <= 0 check (Jason)
> - Have the caller of the API pass in file * instead of fd (Jason)
> 
> v3: (David)
> - Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
>    (Build error reported by kernel test robot <lkp@intel.com>)
> - Don't forget memalloc_pin_restore() on non-migration related errors
> - Improve the readability of the cleanup code associated with
>    non-migration related errors
> - Augment the comments by describing FOLL_LONGTERM like behavior
> - Include the R-b tag from Jason
> 
> v4:
> - Remove the local variable "page" and instead use 3 return statements
>    in alloc_file_page() (David)
> - Add the R-b tag from David
> 
> v5: (David)
> - For hugetlb case, ensure that we only obtain head pages from the
>    mapping by using __filemap_get_folio() instead of find_get_page_flags()
> - Handle -EEXIST when two or more potential users try to simultaneously
>    add a huge page to the mapping by forcing them to retry on failure
> 
> v6: (Christoph)
> - Rename this API to memfd_pin_user_pages() to make it clear that it
>    is intended for memfds
> - Move the memfd page allocation helper from gup.c to memfd.c
> - Fix indentation errors in memfd_pin_user_pages()
> - For contiguous ranges of folios, use a helper such as
>    filemap_get_folios_contig() to lookup the page cache in batches
> 
> v7:
> - Rename this API to memfd_pin_folios() and make it return folios
>    and offsets instead of pages (David)
> - Don't continue processing the folios in the batch returned by
>    filemap_get_folios_contig() if they do not have correct next_idx
> - Add the R-b tag from Christoph
> 

Sorry, I'm still not happy about the current state, because (1) the
folio vs. pages handling is still mixed (2) we're returning+pinning a
large folio multiple times.

See below if there is an easy way to clean this up.

>> @@ -5,6 +5,7 @@
>   #include <linux/spinlock.h>
>   
>   #include <linux/mm.h>
> +#include <linux/memfd.h>
>   #include <linux/memremap.h>
>   #include <linux/pagemap.h>
>   #include <linux/rmap.h>
> @@ -17,6 +18,7 @@
>   #include <linux/hugetlb.h>
>   #include <linux/migrate.h>
>   #include <linux/mm_inline.h>
> +#include <linux/pagevec.h>
>   #include <linux/sched/mm.h>
>   #include <linux/shmem_fs.h>
>   
> @@ -3410,3 +3412,156 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   				     &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(pin_user_pages_unlocked);
> +
> +/**
> + * memfd_pin_folios() - pin folios associated with a memfd
> + * @memfd:      the memfd whose folios are to be pinned
> + * @start:      starting memfd offset
> + * @nr_pages:   number of pages from start to pin

We're not pinning pages. An inclusive range [start, end] would be clearer.

> + * @folios:     array that receives pointers to the folios pinned.
> + *              Should be at-least nr_pages long.
> + * @offsets:    array that receives offsets of pages in their folios.
> + *              Should be at-least nr_pages long.

See below, I'm wondering if this is really required once we return each folio
only once.

> + *
> + * Attempt to pin folios associated with a memfd; given that a memfd is
> + * either backed by shmem or hugetlb, the folios can either be found in
> + * the page cache or need to be allocated if necessary. Once the folios
> + * are located, they are all pinned via FOLL_PIN and the @offsets array
> + * is populated with offsets of the pages in their respective folios.
> + * Therefore, for each page the caller requested, there will be a
> + * corresponding entry in both @folios and @offsets. And, eventually,
> + * these pinned folios need to be released either using unpin_user_pages()
> + * or unpin_user_page().

Oh, we don't have a folio function yet? Should be easy to add, and we'd really
add them.

> + *
> + * It must be noted that the folios may be pinned for an indefinite amount
> + * of time. And, in most cases, the duration of time they may stay pinned
> + * would be controlled by the userspace. This behavior is effectively the
> + * same as using FOLL_LONGTERM with other GUP APIs.
> + *
> + * Returns number of folios pinned. This would be equal to the number of
> + * pages requested. If no folios were pinned, it returns -errno.
> + */
> +long memfd_pin_folios(struct file *memfd, unsigned long start,
> +		      unsigned long nr_pages, struct folio **folios,
> +		      pgoff_t *offsets)
> +{
> +	unsigned long end = start + (nr_pages << PAGE_SHIFT) - 1;
> +	unsigned int max_pgs, pgoff, pgshift = PAGE_SHIFT;
> +	pgoff_t start_idx, end_idx, next_idx;
> +	unsigned int flags, nr_folios, i, j;
> +	struct folio *folio = NULL;
> +	struct folio_batch fbatch;
> +	struct page **pages;
> +	struct hstate *h;
> +	long ret;
> +
> +	if (!nr_pages)
> +		return -EINVAL;
> +
> +	if (!memfd)
> +		return -EINVAL;
> +
> +	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
> +		return -EINVAL;
> +
> +	pages = kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	if (is_file_hugepages(memfd)) {
> +		h = hstate_file(memfd);
> +		pgshift = huge_page_shift(h);
> +	}
> +
> +	flags = memalloc_pin_save();
> +	do {
> +		i = 0;
> +		start_idx = start >> pgshift;
> +		end_idx = end >> pgshift;
> +		if (is_file_hugepages(memfd)) {
> +			start_idx <<= huge_page_order(h);
> +			end_idx <<= huge_page_order(h);
> +		}
> +
> +		folio_batch_init(&fbatch);
> +		while (start_idx <= end_idx) {
> +			/*
> +			 * In most cases, we should be able to find the folios
> +			 * in the page cache. If we cannot find them for some
> +			 * reason, we try to allocate them and add them to the
> +			 * page cache.
> +			 */
> +			nr_folios = filemap_get_folios_contig(memfd->f_mapping,
> +							      &start_idx,
> +							      end_idx,
> +							      &fbatch);
> +			if (folio) {
> +				folio_put(folio);
> +				folio = NULL;
> +			}
> +
> +			next_idx = 0;
> +			for (j = 0; j < nr_folios; j++) {
> +				if (next_idx &&
> +				    next_idx != folio_index(fbatch.folios[j]))
> +					continue;
> +
> +				folio = try_grab_folio(&fbatch.folios[j]->page,
> +						       1, FOLL_PIN);
> +				if (!folio) {
> +					folio_batch_release(&fbatch);
> +					kfree(pages);
> +					goto err;
> +				}
> +
> +				max_pgs = folio_nr_pages(folio);
> +				if (i == 0) {
> +					pgoff = offset_in_folio(folio, start);
> +					pgoff >>= PAGE_SHIFT;
> +				}
> +
> +				do {
> +					folios[i] = folio;
> +					offsets[i] = pgoff << PAGE_SHIFT;
> +					pages[i] = folio_page(folio, 0);
> +					folio_add_pin(folio);
> +
> +					pgoff++;
> +					i++;
> +				} while (pgoff < max_pgs && i < nr_pages);
> +
> +				pgoff = 0;
> +				next_idx = folio_next_index(folio);
> +				gup_put_folio(folio, 1, FOLL_PIN);
> +			}
> +
> +			folio = NULL;
> +			folio_batch_release(&fbatch);
> +			if (!nr_folios) {
> +				folio = memfd_alloc_folio(memfd, start_idx);
> +				if (IS_ERR(folio)) {
> +					ret = PTR_ERR(folio);
> +					if (ret != -EEXIST) {
> +						kfree(pages);
> +						goto err;
> +					}
> +				}
> +			}
> +		}
> +
> +		ret = check_and_migrate_movable_pages(nr_pages, pages);

Having a folio variant would avoid having to mess with pages here at all.
Further, we're now returning+pinning the same folio multiple times, instead of
just once like the folio batching variant would.

I'm wondering if the following wouldn't make more sense, assuming we add
check_and_migrate_movable_folios(), which should be pretty easy to add.

Obviously untested, just to express what I have in mind:



/**
  * memfd_pin_folios() - pin folios associated with a memfd
  * @memfd:      the memfd whose folios are to be pinned
  * @start:      the starting memfd offset
  * @end:        the final memfd offset (inclusive)
  * @folios:     array that receives pointers to the folios pinned
  * @max_folios: the number of entries in the array for folios
  * @offsets:    the offset into the first folio
  *
  * Attempt to pin folios associated with a memfd; given that a memfd is
  * either backed by shmem or hugetlb, the folios can either be found in
  * the page cache or need to be allocated if necessary. Once the folios
  * are located, they are all pinned via FOLL_PIN and @offset is populated
  * with the offset into the first folio.
  *
  * Pinned folios must be released using unpin_folio() or unpin_folios().
  *
  * It must be noted that the folios may be pinned for an indefinite amount
  * of time. And, in most cases, the duration of time they may stay pinned
  * would be controlled by the userspace. This behavior is effectively the
  * same as using FOLL_LONGTERM with other GUP APIs.
  *
  * Returns number of folios pinned, which might be less than @max_folios
  * only if the whole range was pinned. If no folios were pinned, it returns
  * -errno.
  */
long memfd_pin_folios(struct file *memfd, unsigned long start,
		      unsigned long end, struct folio **folios,
		      unsigned int max_folios, unsigned long *offset)
{
	unsigned int pgshift = PAGE_SHIFT;
	unsigned int flags, nr_folios, cur_folios, i;
	pgoff_t start_idx, end_idx;
	struct folio_batch fbatch;
	struct folio *folio;
	struct hstate *h;
	long ret;

	if (start > end || !max_folios)
		return -EINVAL;

	if (!memfd)
		return -EINVAL;

	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
		return -EINVAL;

	if (is_file_hugepages(memfd)) {
		h = hstate_file(memfd);
		pgshift = huge_page_shift(h);
	}

	flags = memalloc_pin_save();
	folio_batch_init(&fbatch);
	do {
		nr_folios = 0;
		start_idx = start >> pgshift;
		end_idx = end >> pgshift;
		if (is_file_hugepages(memfd)) {
			start_idx <<= huge_page_order(h);
			end_idx <<= huge_page_order(h);
		}

		while (start_idx <= end_idx) {
			/*
			 * In most cases, we should be able to find the folios
			 * in the page cache. If we cannot find them for some
			 * reason, we try to allocate them and add them to the
			 * page cache.
			 */
			folio_batch_release(&fbatch);
			cur_folios = filemap_get_folios_contig(memfd->f_mapping,
							       &start_idx,
							       end_idx,
							       &fbatch);
			if (!cur_folios) {
				folio = memfd_alloc_folio(memfd, start_idx);
				if (IS_ERR(folio)) {
					ret = PTR_ERR(folio);
					if (ret != -EEXIST)
						goto err;
				}
				folio_put(folio);
				continue;
			}

			/* Let's pin each folio, which shouldn't really fail. */
			for (i = 0; i < cur_folios; i++) {
				folio = try_grab_folio(&fbatch.folios[i]->page,
						       1, FOLL_PIN);
				if (!folio)
					goto err;

				if (!nr_folios)
					*offset = offset_in_folio(folio, start);
				folios[nr_folios++] = folio;

				if (max_folios == nr_folios)
					break;
			}
			if (max_folios == nr_folios)
				break;
		}
		folio_batch_release(&fbatch);

		ret = check_and_migrate_movable_folios(nr_folios, folios);
	} while (ret == -EAGAIN);

	memalloc_pin_restore(flags);
	return ret ? ret : nr_folios;
err:
	folio_batch_release(&fbatch);
	memalloc_pin_restore(flags);
	while (i-- > 0)
		if (folios[i])
			gup_put_folio(folios[i], 1, FOLL_PIN);

	return ret;
}
EXPORT_SYMBOL_GPL(memfd_pin_folios);



I'm still wondering about the  offset handling, though. Could it happen that why we are
repeatedly calling filemap_get_folios_contig(), that we would need offset!=0 on any of
the other folios besides the first one? My current understanding (and looking at
filemap_get_folios_contig()) is: no.

I'm primarily concerned about concurrent fallocate(PUNCH_HOLE) and THP collapse/splitting.

-- 
Cheers,

David / dhildenb

