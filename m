Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D356D7E9A55
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 11:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961610E33F;
	Mon, 13 Nov 2023 10:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B567110E33F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699871629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aOGLTuh5ESYNeOqdnKvh9Tfl9wvwpFnKPRwUnq11j0U=;
 b=WsZ9610VPLHuheTHtfyGbJ6AU3A2Tf8SdUDpMRFuPbK6LWPh3hfl3zPMKdDC2U5TL1LTL8
 4buePFZOnMlQZbVA1sOKnu/suPslYxduD06y4bvtJPqJDdVxWFIRfeuNdWN+xzAIPO4VIl
 bLMhSowVDetU5quJnbG4sZzfxNac7v4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-ERTHYLdFPPKj4nmaJYmeLQ-1; Mon, 13 Nov 2023 05:33:46 -0500
X-MC-Unique: ERTHYLdFPPKj4nmaJYmeLQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32fa41d0564so1911255f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 02:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699871625; x=1700476425;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOGLTuh5ESYNeOqdnKvh9Tfl9wvwpFnKPRwUnq11j0U=;
 b=sWVbu4w4BieDic2q1RjAHCQY452vRr1/SBPNO80R4wbW9liD3azYSqArmJ3XQtF7PG
 ZjgAGafxjJP4ScCbjbpOtVtcYVVhYtXgCbik3lM87MNfQK89IfB7MqQfBfByV3KkRFl9
 T9ESN/FPfdkm4QIKQO07spUx7fJth1zLR9CmrTY1Cd17khnw4VV7QM8lhBXurZdmy9AI
 3ODyQwQAm2vJ2YW3V7SpBTceeAdNfMHG3Mbkj+MfC6xv2qBXAwz87xexhgeHKwNurY0l
 oODb1ipLqDDqEpqiwZfxRoABobrlWH8OzVEJmCjZ8hzv+9G1c15M+kBNEbaWOY+Muz6T
 I1lg==
X-Gm-Message-State: AOJu0YwkRdjJRNgUTc+uEM3UHUJfRiWya+EY67baaQRj+O7vgNBm+CZo
 nlF7sk9BzAmUxmBWzM1IAsStSJ3HEhWBIeEzfZHaX2p+pA8s2QGhRndznW4ScndOXDU1vkKMUUl
 fSgHdG+jjKRiyWIC/Q/qVSpy5XXEN
X-Received: by 2002:a05:6000:2c1:b0:32f:c750:6ebc with SMTP id
 o1-20020a05600002c100b0032fc7506ebcmr4334702wry.71.1699871625556; 
 Mon, 13 Nov 2023 02:33:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2MAMIyKyXFbIqfoh46ekBYFzDJiAKj6xNuZtPoBt8H6P4Xe+ycv4ercecBCDKsUKJ2ui03g==
X-Received: by 2002:a05:6000:2c1:b0:32f:c750:6ebc with SMTP id
 o1-20020a05600002c100b0032fc7506ebcmr4334687wry.71.1699871625153; 
 Mon, 13 Nov 2023 02:33:45 -0800 (PST)
Received: from ?IPV6:2003:d8:2f09:f500:a38f:d086:59d4:9df?
 (p200300d82f09f500a38fd08659d409df.dip0.t-ipconnect.de.
 [2003:d8:2f09:f500:a38f:d086:59d4:9df])
 by smtp.gmail.com with ESMTPSA id
 j30-20020adfb31e000000b003197869bcd7sm5163464wrd.13.2023.11.13.02.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 02:33:44 -0800 (PST)
Message-ID: <0f05cade-c75e-4605-8e22-9fb916c622b0@redhat.com>
Date: Mon, 13 Nov 2023 11:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v2)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20231106061541.507116-1-vivek.kasireddy@intel.com>
 <20231106061541.507116-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231106061541.507116-2-vivek.kasireddy@intel.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.11.23 07:15, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the pages associated
> with a file, the pin_user_pages_fd() API provides an option to
> not only pin the pages via FOLL_PIN but also to check and migrate
> them if they reside in movable zone or CMA block. This API
> currently works with files that belong to either shmem or hugetlbfs.
> Files belonging to other filesystems are rejected for now.
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
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   include/linux/mm.h |  2 +
>   mm/gup.c           | 99 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 101 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bf5d0b1b16f4..f6cc17b14653 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2457,6 +2457,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
>   long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
> +long pin_user_pages_fd(struct file *file, pgoff_t start,
> +		       unsigned long nr_pages, struct page **pages);
>   
>   int get_user_pages_fast(unsigned long start, int nr_pages,
>   			unsigned int gup_flags, struct page **pages);
> diff --git a/mm/gup.c b/mm/gup.c
> index 2f8a2d89fde1..d30b9dfebbb6 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3400,3 +3400,102 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   				     &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(pin_user_pages_unlocked);
> +
> +static struct page *alloc_file_page(struct file *file, pgoff_t idx)
> +{
> +	struct page *page = ERR_PTR(-ENOMEM);
> +	struct folio *folio;
> +	int err;
> +
> +	if (shmem_file(file))
> +		return shmem_read_mapping_page(file->f_mapping, idx);
> +

As the build reports indicate, this might have to be fenced with

#ifdef CONFIG_HUGETLB_PAGE

> +	folio = alloc_hugetlb_folio_nodemask(hstate_file(file),
> +					     NUMA_NO_NODE,
> +					     NULL,
> +					     GFP_USER);
> +	if (folio && folio_try_get(folio)) {
> +		page = &folio->page;
> +		err = hugetlb_add_to_page_cache(folio, file->f_mapping, idx);
> +		if (err) {
> +			folio_put(folio);
> +			free_huge_folio(folio);
> +			page = ERR_PTR(err);
> +		}
> +	}
> +
> +	return page;
> +}
> +
> +/**
> + * pin_user_pages_fd() - pin user pages associated with a file
> + * @file:       the file whose pages are to be pinned
> + * @start:      starting file offset
> + * @nr_pages:   number of pages from start to pin
> + * @pages:      array that receives pointers to the pages pinned.
> + *              Should be at-least nr_pages long.
> + *
> + * Attempt to pin pages associated with a file that belongs to either shmem
> + * or hugetlbfs. The pages are either found in the page cache or allocated

nit: s/hugetlbfs/hugetlb/

> + * if necessary. Once the pages are located, they are all pinned via FOLL_PIN.
> + * And, these pinned pages need to be released using unpin_user_pages() or
> + * unpin_user_page().
> + *

It might be reasonable to add that the behavior mimics FOLL_LONGTERM 
semantics: the page may be held for an indefinite time period _often_ 
under userspace control.

> + * Returns number of pages pinned. This would be equal to the number of
> + * pages requested. If no pages were pinned, it returns -errno.
> + */
> +long pin_user_pages_fd(struct file *file, pgoff_t start,
> +		       unsigned long nr_pages, struct page **pages)
> +{
> +	struct page *page;
> +	unsigned int flags, i;
> +	long ret;
> +
> +	if (start < 0)
> +		return -EINVAL;
> +
> +	if (!file)
> +	    return -EINVAL;
> +
> +	if (!shmem_file(file) && !is_file_hugepages(file))
> +	    return -EINVAL;
> +
> +	flags = memalloc_pin_save();
> +	do {
> +		for (i = 0; i < nr_pages; i++) {
> +			/*
> + 			 * In most cases, we should be able to find the page
> +			 * in the page cache. If we cannot find it, we try to
> +			 * allocate one and add it to the page cache.
> +			 */
> +			page = find_get_page_flags(file->f_mapping,
> +						   start + i,
> +						   FGP_ACCESSED);
> +			if (!page) {
> +				page = alloc_file_page(file, start + i);
> +				if (IS_ERR(page)) {
> +					ret = PTR_ERR(page);
> +					goto err;
> +				}
> +			}
> +			ret = try_grab_page(page, FOLL_PIN);
> +			if (unlikely(ret))
> +				goto err;
> +
> +			pages[i] = page;
> +			put_page(pages[i]);
> +		}
> +
> +		ret = check_and_migrate_movable_pages(nr_pages, pages);
> +	} while (ret == -EAGAIN);
> +
> +	memalloc_pin_restore(flags);
> +	return ret ? ret : nr_pages;
> +err:

missing memalloc_pin_restore() ?

> +	while (i > 0 && pages[--i])
> +		unpin_user_page(pages[i]);

So if any pages[] would be 0, we would stop completely? Shouldn't this 
be something like:

while (i-- > 0)
	if (pages[i])
		unpin_user_page(pages[i]);

-- 
Cheers,

David / dhildenb

