Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D521806DC3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884B10E0E0;
	Wed,  6 Dec 2023 11:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F08410E0E0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701861572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f7roCKr2mcGdqHQUXuuIaroHOsYDCDLJgd8x5ZSB/dY=;
 b=Qo36NNNe1YDxm+xOceEHhRDZ5a71PXsmbND+GBuSeKY+ZlShduMdArADh6BWNU3O8PzCio
 s5ihB/+IG59aUKxBC2QzqMbAKaShmyTo1gwlZ9rDl1FOfbvEv68oMP6zqCzxnGTz3qIqr1
 POtcGJZN8lYGXVw8XGAFLKj86Lh6qsk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-kNNMki2YOH2n_tBlCRZVGg-1; Wed, 06 Dec 2023 06:19:28 -0500
X-MC-Unique: kNNMki2YOH2n_tBlCRZVGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3334b472196so559996f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 03:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701861567; x=1702466367;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7roCKr2mcGdqHQUXuuIaroHOsYDCDLJgd8x5ZSB/dY=;
 b=TEVgkMslQbSaSnM3DGe2be4ieO7uNUC1fYp3jWL5upxaAcEDiduxGFnwC5EwtzUnr/
 6bjRSmiSttgAXnx6514MYUG2fhfE+TSngc4SO0fBirQ8xa3qavxXy0CnVmYceyxMi/4r
 Odr+FvkSPdRr94Jn5yZxBM8sSmGBVgbUFIWGW3FrPNQr7bWFV0fMfZGn88hEfIDg5a1b
 zDvcBFINnxtCagMpJzuS3WsCedKEwJexIoDBvwNbrRon6Hptjsfsx1xJVXZTfx6pWyio
 hsFkFqcbJia0mfkjB2VyzdFFJXGHUkQAbJ3enV90zqWj62EQaUDjbUqnPspn3ECzGAnF
 30ww==
X-Gm-Message-State: AOJu0YyaFd+yW9rTX/l8YOs6OXFYQFXJeLh1Yrpu56gN2nUt8+m1AirS
 JUJbNn1GMwzwjG3LT2FKUABnSxDDjylLQ4BQGUfnbcjSmCKtMFVcr6rspqTRsuuydkZn4/PZXFF
 FHNjxr1iDk//2zD0nhcoIJBY+8m9Y
X-Received: by 2002:a05:600c:5199:b0:40c:2395:1fa7 with SMTP id
 fa25-20020a05600c519900b0040c23951fa7mr195531wmb.141.1701861567499; 
 Wed, 06 Dec 2023 03:19:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo2+sn3lzaBWGdqRBjbmSLaFrvex+tUmSTtXpMdIieqiRbjWBhwTje9Gs7p8SFKTmOHhvygw==
X-Received: by 2002:a05:600c:5199:b0:40c:2395:1fa7 with SMTP id
 fa25-20020a05600c519900b0040c23951fa7mr195523wmb.141.1701861567062; 
 Wed, 06 Dec 2023 03:19:27 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 p17-20020adff211000000b00333332a8d39sm13520672wro.55.2023.12.06.03.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:19:26 -0800 (PST)
Message-ID: <5ffe2ea3-83da-4b5f-adc8-af9cd9a57cd2@redhat.com>
Date: Wed, 6 Dec 2023 12:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for
 pinning memfd pages (v6)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
 <20231205053509.2342169-4-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231205053509.2342169-4-vivek.kasireddy@intel.com>
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
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.12.23 06:35, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the pages associated
> with a memfd, the pin_user_pages_fd() API provides an option to
> not only pin the pages via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with memfds but it should work with any files
> that belong to either shmemfs or hugetlbfs. Files belonging to
> other filesystems are rejected for now.
> 
> The pages need to be located first before pinning them via FOLL_PIN.
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
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
> Reviewed-by: David Hildenbrand <david@redhat.com> (v3)
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   include/linux/memfd.h |   5 +++
>   include/linux/mm.h    |   2 +
>   mm/gup.c              | 102 ++++++++++++++++++++++++++++++++++++++++++
>   mm/memfd.c            |  34 ++++++++++++++
>   4 files changed, 143 insertions(+)
> 
> diff --git a/include/linux/memfd.h b/include/linux/memfd.h
> index e7abf6fa4c52..6fc0d1282151 100644
> --- a/include/linux/memfd.h
> +++ b/include/linux/memfd.h
> @@ -6,11 +6,16 @@
>   
>   #ifdef CONFIG_MEMFD_CREATE
>   extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned int arg);
> +extern struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx);
>   #else
>   static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned int a)
>   {
>   	return -EINVAL;
>   }
> +static inline struct page *memfd_alloc_page(struct file *memfd, pgoff_t idx)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
>   #endif
>   
>   #endif /* __LINUX_MEMFD_H */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 418d26608ece..ac69db45509f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2472,6 +2472,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
>   long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
> +long memfd_pin_user_pages(struct file *file, pgoff_t start,
> +			  unsigned long nr_pages, struct page **pages);
>   
>   int get_user_pages_fast(unsigned long start, int nr_pages,
>   			unsigned int gup_flags, struct page **pages);
> diff --git a/mm/gup.c b/mm/gup.c
> index 231711efa390..eb93d1ec9dc6 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -5,6 +5,7 @@
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
> @@ -3410,3 +3412,103 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   				     &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(pin_user_pages_unlocked);
> +
> +/**
> + * memfd_pin_user_pages() - pin user pages associated with a memfd
> + * @memfd:      the memfd whose pages are to be pinned
> + * @start:      starting memfd offset
> + * @nr_pages:   number of pages from start to pin
> + * @pages:      array that receives pointers to the pages pinned.
> + *              Should be at-least nr_pages long.
> + *
> + * Attempt to pin pages associated with a memfd; given that a memfd is either
> + * backed by shmem or hugetlb, the pages can either be found in the page cache
> + * or need to be allocated if necessary. Once the pages are located, they are
> + * all pinned via FOLL_PIN. And, these pinned pages need to be released either
> + * using unpin_user_pages() or unpin_user_page().
> + *
> + * It must be noted that the pages may be pinned for an indefinite amount
> + * of time. And, in most cases, the duration of time they may stay pinned
> + * would be controlled by the userspace. This behavior is effectively the
> + * same as using FOLL_LONGTERM with other GUP APIs.
> + *
> + * Returns number of pages pinned. This would be equal to the number of
> + * pages requested. If no pages were pinned, it returns -errno.
> + */
> +long memfd_pin_user_pages(struct file *memfd, pgoff_t start,
> +			  unsigned long nr_pages, struct page **pages)
> +{
> +	pgoff_t start_idx, end_idx = start + nr_pages - 1;
> +	unsigned int flags, nr_folios, i, j;
> +	struct folio_batch fbatch;
> +	struct page *page = NULL;
> +	struct folio *folio;
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
> +	flags = memalloc_pin_save();
> +	do {
> +		folio_batch_init(&fbatch);
> +		start_idx = start;
> +		i = 0;
> +
> +		while (start_idx <= end_idx) {
> +			/*
> +			 * In most cases, we should be able to find the page
> +			 * in the page cache. If we cannot find it for some
> +			 * reason, we try to allocate one and add it to the
> +			 * page cache.
> +			 */
> +			nr_folios = filemap_get_folios_contig(memfd->f_mapping,
> +							      &start_idx,
> +							      end_idx,
> +							      &fbatch);
> +			if (page) {
> +				put_page(page);
> +				page = NULL;
> +			}
> +			for (j = 0; j < nr_folios; j++) {
> +				folio = fbatch.folios[j];
> +				ret = try_grab_page(&folio->page, FOLL_PIN);
> +				if (unlikely(ret)) {
> +					folio_batch_release(&fbatch);
> +					goto err;
> +				}
> +
> +				pages[i++] = &folio->page;
> +			}

I might be wrong, but that interface is still inconsistent. I think your 
intention is to always return folios (head pages), but why are we 
returning pages from this interface then?

It would be more consistent regarding the other GUP interfaces to return 
the actual tail pages that fit the given "pgoff_t start". So if you 
punch in "nr_pages" you expect to get "nr_pages" pages, and not some 
other number of folios.

Otherwise, this interface is highly confusing.

If you always want to return folios, then better name it 
"memfd_pin_user_folios" (or just "memfd_pin_folios") and pass in a range 
(instead of a nr_pages parameter), and somehow indicate to the caller 
how many folio were in that range, and if that range was fully covered.

Or am I missing something?

-- 
Cheers,

David / dhildenb

