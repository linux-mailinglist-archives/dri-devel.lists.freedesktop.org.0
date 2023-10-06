Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D97BB2CC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 10:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AFA10E4BF;
	Fri,  6 Oct 2023 08:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5610E4BF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696579417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XkP8fX/lwBAbWVwI0ovy1iMFjgsEo1LcLA94ICCi4H4=;
 b=gssB4Gfo5RQPnVj2KroQjGbInqzC9KzBuSNcMQ1jK2xO2xNd3Lf0+K2Lj3g7smn92zsWXH
 zaBY9xcS3t+ZTyWEJPklsQrGqYLBFvhpnsG6C3f5s9Ls/f9UGlrkCYBXgfFRmZJwI9xz3M
 Mzf312Qo/PA0hL+xKdw49ah8tte8S/8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-w-rdZvLDPV6zuUlfL8_uRA-1; Fri, 06 Oct 2023 04:03:36 -0400
X-MC-Unique: w-rdZvLDPV6zuUlfL8_uRA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3233a13b47eso1383063f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696579415; x=1697184215;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkP8fX/lwBAbWVwI0ovy1iMFjgsEo1LcLA94ICCi4H4=;
 b=ekvStnp5SqFHdaRAP3I2hGhABRC3jH7CUGopccPwbCNbFEXOtHwUsHTTWZ/neTxGeO
 Pn70+47AiL3SJBKx9cd6pPQIk0kTzNxUCSoEZLv+ZOzo54Y9v6ULp7D87AAdMD5Rmt9e
 8T9phUwlRPS8LFPji1sFRHHvEN3S+5B9RPDGwoXFXupI3dm65b35YfhJSpVh7iAVzOQs
 wyMNnRK1TadIuB4WeE8m6cMs6hc7gQ6CavQ7Y3U+PRdJqOk+V5cHE9CZ0AHs7E9lc+On
 VVyfwtfpU2bwuHwBusfOcG2RCMekIL6O9CMc8BvEtDCJuTN1mvVvCPR0YS/6p+HSZWNw
 WitQ==
X-Gm-Message-State: AOJu0YwiBaCflMkWMd6EG3ugoxndV4pZ0yIJTPotSglRZLOb2ImbBPfI
 aOOXA+XOYMId528HAf7bQMX88jprLuE4bb1VlaF7yYT95nHX8PchxeF+9bH5Nhy7Vo9+ZsZHLYG
 ggAxJX+BgEHZWZ6Cp88WhJSiH6+vx
X-Received: by 2002:a5d:500b:0:b0:31f:f753:5897 with SMTP id
 e11-20020a5d500b000000b0031ff7535897mr6304256wrt.59.1696579415294; 
 Fri, 06 Oct 2023 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl7whorgWW11yV3Rlk/hS9JfFYJ9DRAM3E8dIDZfFdA9kZ3iHGe9Su0hKNaNQuWg7Aj9/xsA==
X-Received: by 2002:a5d:500b:0:b0:31f:f753:5897 with SMTP id
 e11-20020a5d500b000000b0031ff7535897mr6304211wrt.59.1696579414711; 
 Fri, 06 Oct 2023 01:03:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c715:ee00:4e24:cf8e:3de0:8819?
 (p200300cbc715ee004e24cf8e3de08819.dip0.t-ipconnect.de.
 [2003:cb:c715:ee00:4e24:cf8e:3de0:8819])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4cc4000000b003247d3e5d99sm1025352wrt.55.2023.10.06.01.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 01:03:34 -0700 (PDT)
Message-ID: <4c272313-d2cd-fa29-3126-496636e14115@redhat.com>
Date: Fri, 6 Oct 2023 10:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
 <20231003074447.3245729-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
In-Reply-To: <20231003074447.3245729-2-vivek.kasireddy@intel.com>
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
 Junxiao Chang <junxiao.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.10.23 09:44, Vivek Kasireddy wrote:
> For drivers that would like to longterm-pin the pages associated
> with a file, the pin_user_pages_fd() API provides an option to
> not only FOLL_PIN the pages but also to check and migrate them
> if they reside in movable zone or CMA block. For now, this API
> can only work with files belonging to shmem or hugetlbfs given
> that the udmabuf driver is the only user.

Maybe add "Other files are rejected.". Wasn't clear to me before I 
looked into the code.

> 
> It must be noted that the pages associated with hugetlbfs files
> are expected to be found in the page cache. An error is returned
> if they are not found. However, shmem pages can be swapped in or
> allocated if they are not present in the page cache.
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
>   include/linux/mm.h |  2 ++
>   mm/gup.c           | 87 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 89 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bf5d0b1b16f4..af2121fb8101 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2457,6 +2457,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
>   long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
> +long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
> +		       unsigned int gup_flags, struct page **pages);
>   
>   int get_user_pages_fast(unsigned long start, int nr_pages,
>   			unsigned int gup_flags, struct page **pages);
> diff --git a/mm/gup.c b/mm/gup.c
> index 2f8a2d89fde1..e34b77a15fa8 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3400,3 +3400,90 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   				     &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(pin_user_pages_unlocked);
> +

This does look quite neat, nice! Let's take a closer look ...

> +/**
> + * pin_user_pages_fd() - pin user pages associated with a file
> + * @fd:         the fd whose pages are to be pinned
> + * @start:      starting file offset
> + * @nr_pages:   number of pages from start to pin
> + * @gup_flags:  flags modifying pin behaviour

^ I assume we should drop that. At least for now the flags are 
completely unused. And most likely we would want a different set of 
flags later (GUPFD_ ...).

> + * @pages:      array that receives pointers to the pages pinned.
> + *              Should be at least nr_pages long.
> + *
> + * Attempt to pin (and migrate) pages associated with a file belonging to

I'd drop the "and migrate" part, it's more of an implementation detail.

> + * either shmem or hugetlbfs. An error is returned if pages associated with
> + * hugetlbfs files are not present in the page cache. However, shmem pages
> + * are swapped in or allocated if they are not present in the page cache.

Why don't we do the same for hugetlbfs? Would make the interface more 
streamlined.

Certainly add that pinned pages have to be released using 
unpin_user_pages().

> + *
> + * Returns number of pages pinned. This would be equal to the number of
> + * pages requested.
> + * If nr_pages is 0 or negative, returns 0. If no pages were pinned, returns
> + * -errno.
> + */
> +long pin_user_pages_fd(int fd, pgoff_t start, unsigned long nr_pages,
> +		       unsigned int gup_flags, struct page **pages)
> +{
> +	struct page *page;
> +	struct file *filep;
> +	unsigned int flags, i;
> +	long ret;
> +
> +	if (nr_pages <= 0)
> +		return 0;

I think we should just forbid that and use a WARN_ON_ONCE() here / 
return -EINVAL. So we'll never end up returning 0.

> +	if (!is_valid_gup_args(pages, NULL, &gup_flags, FOLL_PIN))
> +		return 0;
> +
> +	if (start < 0)
> +		return -EINVAL;
> +
> +	filep = fget(fd);
> +	if (!filep)
> +	    return -EINVAL;
> +
> +	if (!shmem_file(filep) && !is_file_hugepages(filep))
> +	    return -EINVAL;
> +
> +	flags = memalloc_pin_save();
> +	do {
> +		for (i = 0; i < nr_pages; i++) {
> +			if (shmem_mapping(filep->f_mapping)) {
> +				page = shmem_read_mapping_page(filep->f_mapping,
> +							       start + i);
> +				if (IS_ERR(page)) {
> +					ret = PTR_ERR(page);
> +					goto err;
> +				}
> +			} else {
> +				page = find_get_page_flags(filep->f_mapping,
> +							   start + i,
> +							   FGP_ACCESSED);
> +				if (!page) {
> +					ret = -EINVAL;
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
> +err:
> +	memalloc_pin_restore(flags);
> +	fput(filep);
> +	if (!ret)
> +		return nr_pages;
> +
> +	while (i > 0 && pages[--i]) {
> +		unpin_user_page(pages[i]);
> +		pages[i] = NULL;

If migrate_longterm_unpinnable_pages() failed, say with -ENOMEM, the 
pages were already unpinned, but pages[i] has not been cleared, no?

> +	}
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pin_user_pages_fd);
> +

-- 
Cheers,

David / dhildenb

