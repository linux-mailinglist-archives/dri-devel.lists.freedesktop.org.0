Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E028115E8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9EF10E7C3;
	Wed, 13 Dec 2023 15:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4006710E7C3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702480540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VXgUOG1b6Qjymoe+8cSevYM1JivwxAkM7r9Mp6vefxA=;
 b=GjJIu060SJGykmHXIqfWZpSXdw2ZmnKi/kbqTz5EZAuWgFOzguBdCrYLBo+37YW4R7rHHe
 bRbqf7k9NoxSqIzxxIr2cjqNSoq5vs/2iXcpZzxYXoYGdl2PsDb6BjUU/je8VU51H1CtBV
 8fFsxu0isP1MBqAHuSjXivsAhUe4wx4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-mKstBdD8PE-A8boBXeKXpw-1; Wed, 13 Dec 2023 10:15:37 -0500
X-MC-Unique: mKstBdD8PE-A8boBXeKXpw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33608afb161so4917417f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 07:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702480536; x=1703085336;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXgUOG1b6Qjymoe+8cSevYM1JivwxAkM7r9Mp6vefxA=;
 b=oNORUxrj7aaViEq+A9wVFqGVj8o8p+mtABzETYv9seAnOWH4VE0U/0rDPSL/UqwCky
 XaRMHgNISipuH1Kzl4RVZ3irpvHo4LQmVrV4GpIotZWnGjiasV7vN58bJK+ok9H7Ede9
 oZ8LCtbnZLIPw5t+WU6XgQx1vJqafStmcCdyPmg2UhwYwH3D3kW0mFneCmJXOE0wQ3DB
 tgesiG1lq+WUh39edY1aJ5oVUdKkf5Zd/PEEt9tyHmPL/uXNsfOg1/OHmlB3Q/9PU3aN
 hdzqO6brAb19JaCc76lOB1WEEk+35t4WphVt57W5us3YqrPV1GtUww6lKUMPxSE/wLKO
 JrQQ==
X-Gm-Message-State: AOJu0YxoVuykY/T5hWOwXPxZToRlnnUZZtW9uUHhPA9WqTJbXXFcYEfh
 T2XRHsvG+kwAnThWJPpswdoQgNrsirr3dxvxQlN+QysDb12Nf4MlnvJQv9Lwk23phejDL/tm1gQ
 cWN8Oahp6aSeIcTqBM30d/QubZ5az
X-Received: by 2002:a5d:630c:0:b0:333:3ffe:dbcd with SMTP id
 i12-20020a5d630c000000b003333ffedbcdmr5034993wru.36.1702480536172; 
 Wed, 13 Dec 2023 07:15:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJXD7jCAhLy31SNYG3ze2iaKMTLiHt5N3fgiWBmtIqxrX6p4m23doMhrGPjeJrh2UNsKqM9Q==
X-Received: by 2002:a5d:630c:0:b0:333:3ffe:dbcd with SMTP id
 i12-20020a5d630c000000b003333ffedbcdmr5034970wru.36.1702480535633; 
 Wed, 13 Dec 2023 07:15:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:6e00:7e5:5f4d:f300:5d52?
 (p200300cbc7096e0007e55f4df3005d52.dip0.t-ipconnect.de.
 [2003:cb:c709:6e00:7e5:5f4d:f300:5d52])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a056000023900b003363617c9cdsm3022340wrz.5.2023.12.13.07.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 07:15:35 -0800 (PST)
Message-ID: <440a9691-dd6c-4705-868d-ed64fa6c9b12@redhat.com>
Date: Wed, 13 Dec 2023 16:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios (v7)
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20231212073803.3233055-1-vivek.kasireddy@intel.com>
 <20231212073803.3233055-4-vivek.kasireddy@intel.com>
 <00c84f06-66b9-484c-8a2c-e820c7d21c9d@redhat.com>
 <IA0PR11MB718554F149A09AD0E64B4F0AF88DA@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <IA0PR11MB718554F149A09AD0E64B4F0AF88DA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Christoph Hellwig <hch@infradead.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Christoph Hellwig <hch@lst.de>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

>> Sorry, I'm still not happy about the current state, because (1) the
>> folio vs. pages handling is still mixed (2) we're returning+pinning a
>> large folio multiple times.
> I can address (1) in a follow-up series and as far as (2) is concerned, my
> understanding is that we need to increase the folio's refcount as and
> when the folio's tail pages are used. Is this not the case? It appears
> this is what unpin_user_pages() expects as well. Do you see any
> concern with this?

If you'd just pin the folio once, you'd also only have to unpin it once.

Bu that raises a question: Is it a requirement for the user of this 
interface, being able to unmap+unpin each individual page?

If you really want to handle each subpage possibly individually, then 
subpage or folio+offset makes more sense, agreed.

> 
>>
>> See below if there is an easy way to clean this up.
>>
>>>> @@ -5,6 +5,7 @@
>>>    #include <linux/spinlock.h>
>>>
>>>    #include <linux/mm.h>
>>> +#include <linux/memfd.h>
>>>    #include <linux/memremap.h>
>>>    #include <linux/pagemap.h>
>>>    #include <linux/rmap.h>
>>> @@ -17,6 +18,7 @@
>>>    #include <linux/hugetlb.h>
>>>    #include <linux/migrate.h>
>>>    #include <linux/mm_inline.h>
>>> +#include <linux/pagevec.h>
>>>    #include <linux/sched/mm.h>
>>>    #include <linux/shmem_fs.h>
>>>
>>> @@ -3410,3 +3412,156 @@ long pin_user_pages_unlocked(unsigned long
>> start, unsigned long nr_pages,
>>>    				     &locked, gup_flags);
>>>    }
>>>    EXPORT_SYMBOL(pin_user_pages_unlocked);
>>> +
>>> +/**
>>> + * memfd_pin_folios() - pin folios associated with a memfd
>>> + * @memfd:      the memfd whose folios are to be pinned
>>> + * @start:      starting memfd offset
>>> + * @nr_pages:   number of pages from start to pin
>>
>> We're not pinning pages. An inclusive range [start, end] would be clearer.
> Ok, I'll make this change in the next version.
> 
>>
>>> + * @folios:     array that receives pointers to the folios pinned.
>>> + *              Should be at-least nr_pages long.
>>> + * @offsets:    array that receives offsets of pages in their folios.
>>> + *              Should be at-least nr_pages long.
>>
>> See below, I'm wondering if this is really required once we return each folio
>> only once.
> The offsets can be calculated by the caller (udmabuf) as well but doing so
> in this interface would prevent special handling in the caller for the hugetlb
> case. Please look at patch 5 in this series (udmabuf: Pin the pages using
> memfd_pin_folios() API (v5)) for more details as to what I mean.
> 

I'll have a look later to be reminded about the target use case :)


>>
>>> + *
>>> + * It must be noted that the folios may be pinned for an indefinite amount
>>> + * of time. And, in most cases, the duration of time they may stay pinned
>>> + * would be controlled by the userspace. This behavior is effectively the
>>> + * same as using FOLL_LONGTERM with other GUP APIs.
>>> + *
>>> + * Returns number of folios pinned. This would be equal to the number of
>>> + * pages requested. If no folios were pinned, it returns -errno.
>>> + */
>>> +long memfd_pin_folios(struct file *memfd, unsigned long start,
>>> +		      unsigned long nr_pages, struct folio **folios,
>>> +		      pgoff_t *offsets)
>>> +{
>>> +	unsigned long end = start + (nr_pages << PAGE_SHIFT) - 1;
>>> +	unsigned int max_pgs, pgoff, pgshift = PAGE_SHIFT;
>>> +	pgoff_t start_idx, end_idx, next_idx;
>>> +	unsigned int flags, nr_folios, i, j;
>>> +	struct folio *folio = NULL;
>>> +	struct folio_batch fbatch;
>>> +	struct page **pages;
>>> +	struct hstate *h;
>>> +	long ret;
>>> +
>>> +	if (!nr_pages)
>>> +		return -EINVAL;
>>> +
>>> +	if (!memfd)
>>> +		return -EINVAL;
>>> +
>>> +	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
>>> +		return -EINVAL;
>>> +
>>> +	pages = kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
>>> +	if (!pages)
>>> +		return -ENOMEM;
>>> +
>>> +	if (is_file_hugepages(memfd)) {
>>> +		h = hstate_file(memfd);
>>> +		pgshift = huge_page_shift(h);
>>> +	}
>>> +
>>> +	flags = memalloc_pin_save();
>>> +	do {
>>> +		i = 0;
>>> +		start_idx = start >> pgshift;
>>> +		end_idx = end >> pgshift;
>>> +		if (is_file_hugepages(memfd)) {
>>> +			start_idx <<= huge_page_order(h);
>>> +			end_idx <<= huge_page_order(h);
>>> +		}
>>> +
>>> +		folio_batch_init(&fbatch);
>>> +		while (start_idx <= end_idx) {
>>> +			/*
>>> +			 * In most cases, we should be able to find the folios
>>> +			 * in the page cache. If we cannot find them for some
>>> +			 * reason, we try to allocate them and add them to
>> the
>>> +			 * page cache.
>>> +			 */
>>> +			nr_folios = filemap_get_folios_contig(memfd-
>>> f_mapping,
>>> +							      &start_idx,
>>> +							      end_idx,
>>> +							      &fbatch);
>>> +			if (folio) {
>>> +				folio_put(folio);
>>> +				folio = NULL;
>>> +			}
>>> +
>>> +			next_idx = 0;
>>> +			for (j = 0; j < nr_folios; j++) {
>>> +				if (next_idx &&
>>> +				    next_idx != folio_index(fbatch.folios[j]))
>>> +					continue;
>>> +
>>> +				folio = try_grab_folio(&fbatch.folios[j]->page,
>>> +						       1, FOLL_PIN);
>>> +				if (!folio) {
>>> +					folio_batch_release(&fbatch);
>>> +					kfree(pages);
>>> +					goto err;
>>> +				}
>>> +
>>> +				max_pgs = folio_nr_pages(folio);
>>> +				if (i == 0) {
>>> +					pgoff = offset_in_folio(folio, start);
>>> +					pgoff >>= PAGE_SHIFT;
>>> +				}
>>> +
>>> +				do {
>>> +					folios[i] = folio;
>>> +					offsets[i] = pgoff << PAGE_SHIFT;
>>> +					pages[i] = folio_page(folio, 0);
>>> +					folio_add_pin(folio);
>>> +
>>> +					pgoff++;
>>> +					i++;
>>> +				} while (pgoff < max_pgs && i < nr_pages);
>>> +
>>> +				pgoff = 0;
>>> +				next_idx = folio_next_index(folio);
>>> +				gup_put_folio(folio, 1, FOLL_PIN);
>>> +			}
>>> +
>>> +			folio = NULL;
>>> +			folio_batch_release(&fbatch);
>>> +			if (!nr_folios) {
>>> +				folio = memfd_alloc_folio(memfd, start_idx);
>>> +				if (IS_ERR(folio)) {
>>> +					ret = PTR_ERR(folio);
>>> +					if (ret != -EEXIST) {
>>> +						kfree(pages);
>>> +						goto err;
>>> +					}
>>> +				}
>>> +			}
>>> +		}
>>> +
>>> +		ret = check_and_migrate_movable_pages(nr_pages, pages);
>>
>> Having a folio variant would avoid having to mess with pages here at all.
>> Further, we're now returning+pinning the same folio multiple times, instead
>> of
>> just once like the folio batching variant would.
> It should be possible to pin the folio only once but I don't see any problem with
> pinning it multiple times -- once per each subpage used -- as long as it is unpinned
> correctly the same number of times. Is this not ok?

You can, but that partially avoids the benefit of using folios?

Instead of "large folio + offset" you have "folio+offset1, folio+offset2 
..." essentially for each subpage. But again, maybe that really is 
required for the target use case.

It's not necessarily wrong to do that, but staring just at the interface 
it's the opposite of what other folio-handling functions like batching do.

> 
>>
>> I'm wondering if the following wouldn't make more sense, assuming we add
>> check_and_migrate_movable_folios(), which should be pretty easy to add.
>>
>> Obviously untested, just to express what I have in mind:
> Thank you for taking the time to do this!
> 
>>
>>
>>
>> /**
>>    * memfd_pin_folios() - pin folios associated with a memfd
>>    * @memfd:      the memfd whose folios are to be pinned
>>    * @start:      the starting memfd offset
>>    * @end:        the final memfd offset (inclusive)
>>    * @folios:     array that receives pointers to the folios pinned
>>    * @max_folios: the number of entries in the array for folios
>>    * @offsets:    the offset into the first folio
> Given that my goal is to do the following in udmabuf driver:
>          ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
>          for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
>                  sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE, ubuf->offsets[i]);
> 
>          ret = dma_map_sgtable(dev, sg, direction, 0);
> 
> That is, populate a scatterlist with ubuf->pagecount number of entries,
> where each segment if of size PAGE_SIZE, in order to be consistent and
> support a wide variety of DMA importers that may not probably handle
> segments that are larger than PAGE_SIZE.
> 
> Therefore, in the hugetlb case, there would be multiple entries pointing to
> the same folio with different offsets. The question really is whether these
> entries associated with @folios and @offsets would need to be populated
> by the caller (udmabuf) or the API (memfd_pin_folios). I have tried both of
> these approaches in the earlier versions and they all work fine but I think
> populating the entries in memfd_pin_folios() seems to be cleaner as the
> caller does not need to do any special handling (hugetlb vs shmem).
> 
>>    *
>>    * Attempt to pin folios associated with a memfd; given that a memfd is
>>    * either backed by shmem or hugetlb, the folios can either be found in
>>    * the page cache or need to be allocated if necessary. Once the folios
>>    * are located, they are all pinned via FOLL_PIN and @offset is populated
>>    * with the offset into the first folio.
>>    *
>>    * Pinned folios must be released using unpin_folio() or unpin_folios().
>>    *
>>    * It must be noted that the folios may be pinned for an indefinite amount
>>    * of time. And, in most cases, the duration of time they may stay pinned
>>    * would be controlled by the userspace. This behavior is effectively the
>>    * same as using FOLL_LONGTERM with other GUP APIs.
>>    *
>>    * Returns number of folios pinned, which might be less than @max_folios
>>    * only if the whole range was pinned. If no folios were pinned, it returns
>>    * -errno.
>>    */
>> long memfd_pin_folios(struct file *memfd, unsigned long start,
>> 		      unsigned long end, struct folio **folios,
>> 		      unsigned int max_folios, unsigned long *offset)
>> {
>> 	unsigned int pgshift = PAGE_SHIFT;
>> 	unsigned int flags, nr_folios, cur_folios, i;
>> 	pgoff_t start_idx, end_idx;
>> 	struct folio_batch fbatch;
>> 	struct folio *folio;
>> 	struct hstate *h;
>> 	long ret;
>>
>> 	if (start > end || !max_folios)
>> 		return -EINVAL;
>>
>> 	if (!memfd)
>> 		return -EINVAL;
>>
>> 	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
>> 		return -EINVAL;
>>
>> 	if (is_file_hugepages(memfd)) {
>> 		h = hstate_file(memfd);
>> 		pgshift = huge_page_shift(h);
>> 	}
>>
>> 	flags = memalloc_pin_save();
>> 	folio_batch_init(&fbatch);
>> 	do {
>> 		nr_folios = 0;
>> 		start_idx = start >> pgshift;
>> 		end_idx = end >> pgshift;
>> 		if (is_file_hugepages(memfd)) {
>> 			start_idx <<= huge_page_order(h);
>> 			end_idx <<= huge_page_order(h);
>> 		}
>>
>> 		while (start_idx <= end_idx) {
>> 			/*
>> 			 * In most cases, we should be able to find the folios
>> 			 * in the page cache. If we cannot find them for some
>> 			 * reason, we try to allocate them and add them to
>> the
>> 			 * page cache.
>> 			 */
>> 			folio_batch_release(&fbatch);
>> 			cur_folios = filemap_get_folios_contig(memfd-
>>> f_mapping,
>> 							       &start_idx,
>> 							       end_idx,
>> 							       &fbatch);
>> 			if (!cur_folios) {
>> 				folio = memfd_alloc_folio(memfd, start_idx);
>> 				if (IS_ERR(folio)) {
>> 					ret = PTR_ERR(folio);
>> 					if (ret != -EEXIST)
>> 						goto err;
>> 				}
>> 				folio_put(folio);
>> 				continue;
>> 			}
>>
>> 			/* Let's pin each folio, which shouldn't really fail. */
>> 			for (i = 0; i < cur_folios; i++) {
>> 				folio = try_grab_folio(&fbatch.folios[i]->page,
>> 						       1, FOLL_PIN);
>> 				if (!folio)
>> 					goto err;
>>
>> 				if (!nr_folios)
>> 					*offset = offset_in_folio(folio, start);
>> 				folios[nr_folios++] = folio;
>>
>> 				if (max_folios == nr_folios)
>> 					break;
>> 			}
>> 			if (max_folios == nr_folios)
>> 				break;
>> 		}
>> 		folio_batch_release(&fbatch);
>>
>> 		ret = check_and_migrate_movable_folios(nr_folios, folios);
>> 	} while (ret == -EAGAIN);
>>
>> 	memalloc_pin_restore(flags);
>> 	return ret ? ret : nr_folios;
>> err:
>> 	folio_batch_release(&fbatch);
>> 	memalloc_pin_restore(flags);
>> 	while (i-- > 0)
>> 		if (folios[i])
>> 			gup_put_folio(folios[i], 1, FOLL_PIN);
>>
>> 	return ret;
>> }
>> EXPORT_SYMBOL_GPL(memfd_pin_folios);
>>
>>
>>
>> I'm still wondering about the  offset handling, though. Could it happen that
>> why we are
>> repeatedly calling filemap_get_folios_contig(), that we would need offset!=0
>> on any of
>> the other folios besides the first one? My current understanding (and looking
>> at
>> filemap_get_folios_contig()) is: no.

> I am not entirely sure but while testing this series with Qemu master + kernel
> snapshot of drm-tip which is 6.7 RC1, I noticed strange behavior of
> filemap_get_folios_contig() and the batches it returns particularly for the
> hugetlb folios. Assuming we have order-9 folios in the memfd (my test-case),
> and if the range [start, end] cuts across more than one folio: lets say start is
> at subpage 490 (in folio-0) and end is at subpage 520 (in folio-1), then start_idx
> would be 0 and end_idx would be 512. In this case, I would have expected

That is weird. Shouldn't you get start_idx = 0 and end_idx = 1 with 
hugetlb, where the idx differs ? Maybe that's the problem.

> filemap_get_folios_contig() to return two entries in the batch that included
> folio-0 and folio-1. However, it returned a batch with 15 entries (max batch size)
> with all the entries pointing to folio-0. This is why I added the check: > 	if (next_idx &&
>                     next_idx != folio_index(fbatch.folios[j]))
>                     	continue;
> 
> Anyway, based on the code you wrote, I have realized that we both have a
> different view on how many entries need to be there in the @folios array
> for a given range [start, end] in the hugetlb case.

Oh, yes, ideally the interface should behave the same for hugetlb and shmem.

> 
> I have assumed that it is highly desirable to have a segment length of
> PAGE_SIZE for consistency and interoperability reasons but I guess it might
> be ok to do:
> sg_set_folio(sgl, ubuf->folios[i], nr_tails * PAGE_SIZE, ubuf->offsets[i]);
> 
> I'll run some experiments to see if this would work in most cases or not.
> 
>>
>> I'm primarily concerned about concurrent fallocate(PUNCH_HOLE) and THP
>> collapse/splitting.
> Could you please elaborate on what the issue would be in this case?

I'm not sure if this can happen, but assume the following (shouldn't 
happen as long as shmem does not support 1m folios):

Assume the file looks like this:

[    1m    ][ 512k ]
^0          ^256    ^384

Assume we call filemap_get_folios_contig() and get back the first folio 
and get start_idx=256

Then, someone fallocate(PUNCH_HOLE) the whole range and re-populates the 
whole range with a 2m folio.

[          2m          ]
^0          ^256    ^384


if we call filemap_get_folios_contig() with 256, we get another "large 
folio with offset".

Of course, we can detect that, and simply fail/retry. Just wondering if
that could happen.

-- 
Cheers,

David / dhildenb

