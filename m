Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462E7EACF1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 10:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32A010E1E6;
	Tue, 14 Nov 2023 09:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AC610E1E9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699953842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rhwvl11mQ/I60uaprzSGe+FBFm6/F2WNQMrZtU+N8vU=;
 b=VfTzWFSDEYkBTFus21PDGBjd4rWaNpLV4TgO/yPqEa/8j+AqZcguvC20h4RXWs46oeaDEs
 RVWqqt6jGkS2qGQBETr8400NpOS11D8++rV9hhscsWuho7Aq/HHwfhIF0XVCooiT1RFv5c
 BIro0lXhjyxQoFbyIhOXu8mBviLPn2A=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-Jud_EbVJNDq84lqJ8p_Jjw-1; Tue, 14 Nov 2023 04:24:00 -0500
X-MC-Unique: Jud_EbVJNDq84lqJ8p_Jjw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c82f76f9c4so34996421fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 01:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699953839; x=1700558639;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhwvl11mQ/I60uaprzSGe+FBFm6/F2WNQMrZtU+N8vU=;
 b=SMIOk5bZIkLt8UHNtz0Hf9A4Q34kQ1Mte4hH5FGaL5X7/K4KzB55cFklw0cWWYg2Nt
 1sl6hETtg9u+O1ZP4XJqRtLigwTfSXAS3iyG8/d3wRHbQONr5f/H+YX6qMJ+IE323YIp
 SbhnT+ApfNHRT0Sp830N/WtUsFo1PaSHAz4XyKYdTEkYhtOHLTAuPXG2vrWhttD1d7Tc
 D5IJajGKslIBSEW8fRpw8ziK7uUaMWDBWqYCK7Zby2NxdH9Gt+sKKchjSwBWtXhfZMrm
 Ruc/Csjv9TPSspHMw0YSCd5jU0vox5o2PlOX6cyRoTq6OYZOZxslO3uJ4ax6uX8tBG6F
 +y5g==
X-Gm-Message-State: AOJu0Yyu5T0VBJs/ACe3OantM/+9lkIp+O4/NMh7i1j9E/Lc/Qe1rURG
 hlKUWSK+9MQmzcGxje38jogwG0rT7VU20KcJZ+LeRBCdBv3oLitK+S9DWwDs00sekVS44wzhy6Z
 S+TR6jTjpUfC5B3ky7xcCvHO1SvWWdIDHNNWR
X-Received: by 2002:a2e:b0c6:0:b0:2c6:edfd:658a with SMTP id
 g6-20020a2eb0c6000000b002c6edfd658amr1136428ljl.31.1699953838988; 
 Tue, 14 Nov 2023 01:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+xvL6+Z0qg7QgFVDxtPcqBvEkwPp8e1GJFupKCOxCqWNOkI+ZnPM95DB9nhgwJyRcXbo0RQ==
X-Received: by 2002:a2e:b0c6:0:b0:2c6:edfd:658a with SMTP id
 g6-20020a2eb0c6000000b002c6edfd658amr1136405ljl.31.1699953838488; 
 Tue, 14 Nov 2023 01:23:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c73e:8900:2d8:c9f0:f3fb:d4fd?
 (p200300cbc73e890002d8c9f0f3fbd4fd.dip0.t-ipconnect.de.
 [2003:cb:c73e:8900:2d8:c9f0:f3fb:d4fd])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a05600c475500b003feae747ff2sm16781241wmo.35.2023.11.14.01.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 01:23:58 -0800 (PST)
Message-ID: <ee876cb8-f3de-4294-91e0-60bb426bf5bc@redhat.com>
Date: Tue, 14 Nov 2023 10:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages (v3)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <0f05cade-c75e-4605-8e22-9fb916c622b0@redhat.com>
 <20231114070044.464451-1-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231114070044.464451-1-vivek.kasireddy@intel.com>
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

On 14.11.23 08:00, Vivek Kasireddy wrote:
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
> v3: (David)
> - Enclose the huge page allocation code with #ifdef CONFIG_HUGETLB_PAGE
>    (Build error reported by kernel test robot <lkp@intel.com>)
> - Don't forget memalloc_pin_restore() on non-migration related errors
> - Improve the readability of the cleanup code associated with
>    non-migration related errors
> - Augment the comments by describing FOLL_LONGTERM like behavior
> - Include the R-b tag from Jason
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
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> (v2)
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   include/linux/mm.h |   2 +
>   mm/gup.c           | 109 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 111 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 418d26608ece..1b675fa35059 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2472,6 +2472,8 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
>   long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   		    struct page **pages, unsigned int gup_flags);
> +long pin_user_pages_fd(struct file *file, pgoff_t start,
> +		       unsigned long nr_pages, struct page **pages);
>   
>   int get_user_pages_fast(unsigned long start, int nr_pages,
>   			unsigned int gup_flags, struct page **pages);
> diff --git a/mm/gup.c b/mm/gup.c
> index 231711efa390..b3af967cdff1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3410,3 +3410,112 @@ long pin_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
>   				     &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(pin_user_pages_unlocked);
> +
> +static struct page *alloc_file_page(struct file *file, pgoff_t idx)
> +{
> +#ifdef CONFIG_HUGETLB_PAGE
> +	struct page *page = ERR_PTR(-ENOMEM);
> +	struct folio *folio;
> +	int err;
> +
> +	if (is_file_hugepages(file)) {
> +		folio = alloc_hugetlb_folio_nodemask(hstate_file(file),
> +						     NUMA_NO_NODE,
> +						     NULL,
> +						     GFP_USER);
> +		if (folio && folio_try_get(folio)) {
> +			page = &folio->page;
> +			err = hugetlb_add_to_page_cache(folio,
> +							file->f_mapping,
> +							idx);
> +			if (err) {
> +				folio_put(folio);
> +				free_huge_folio(folio);
> +				page = ERR_PTR(err);
> +			}
> +		}
> +		return page;

You could avoid the "page" variable completely simply by using 3 return 
statements.

LGTM, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

