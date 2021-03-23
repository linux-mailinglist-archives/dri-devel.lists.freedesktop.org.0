Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A350F345CFC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA06E0F3;
	Tue, 23 Mar 2021 11:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234C6E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:34:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so942314wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=kJG6PyZc23JI+PUGii9zTxJBB3El6qdcUXm7Ja4hn5w=;
 b=WH+kDMCfYBdW7/F2qQa1invWtJWWKHsmhMnK7Wa6ORo5PhDr8OH1NtstjlLVKkIYNJ
 zE+MVu0P11LlLzWbcm8J/yUSsIPb2gXI7FPN5EedkchW8r7aT+8ayoOl8KiNNR1p2XVk
 bToehT/I1pqXS+twn7B1+B76Tu0Ojh7JAtVUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=kJG6PyZc23JI+PUGii9zTxJBB3El6qdcUXm7Ja4hn5w=;
 b=isP9DXLKcX3j9LSR/wZbqPtuxLJGLY9BdiJ8WfaRSvGV7BCPj7/NtqyaG379nNPxA9
 rnKdREgPpCOwgUjMwkRoVoKoOymIO45l4UaUFES68vButwwGR6k/BmzpIA7h4MrxNcmO
 X6pYCYPhUNVkjbYiPHWcm9nnlLe0rilh16MkEfknTRtC3obY5hLUOJpTL8n1UG5FT5bU
 Af3bUOJja0vMBMGsH+qF0ymbSS3KdFKYMgCN6YBiu+sElSe90br6/yzUgshQJ3ZrKXHu
 cB/N6/zj9iXOpkpuSWUYjUQjdOSZHwsgqHUcAYpJ0l9qZKK8vu2Op0ocmyAdDoDVEam7
 YvWw==
X-Gm-Message-State: AOAM531dhhATLzuIsbbH/TDIuGlY50xK9Fxdli44vdQoGvg9qLnY4Cun
 SuhwWZaVk2XuAQNBqI4WYkBcdg==
X-Google-Smtp-Source: ABdhPJxIn1uOvVoXyyDbPHMe7z9nkcLsx6iPBeZVerfGAZRaAPQO90B8PHsR5Uu1okld1HMrH4DIcg==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr2995826wma.134.1616499281914; 
 Tue, 23 Mar 2021 04:34:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm26287859wrm.0.2021.03.23.04.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:34:41 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:34:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <YFnST5VLcEgv9q+s@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?=
 <thomas_os@shipmail.org>, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321184529.59006-2-thomas_os@shipmail.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 07:45:28PM +0100, Thomas Hellstr=F6m (Intel) wrote:
> TTM sets up huge page-table-entries both to system- and device memory,
> and we don't want gup to assume there are always valid backing struct
> pages for these. For PTEs this is handled by setting the pte_special bit,
> but for the huge PUDs and PMDs, we have neither pmd_special nor
> pud_special. Normally, huge TTM entries are identified by looking at
> vma_is_special_huge(), but fast gup can't do that, so as an alternative
> define _devmap entries for which there are no backing dev_pagemap as
> special, update documentation and make huge TTM entries _devmap, after
> verifying that there is no backing dev_pagemap.
> =

> One other alternative would be to block TTM huge page-table-entries
> completely, and while currently only vmwgfx use them, they would be
> beneficial to other graphis drivers moving forward as well.
> =

> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellstr=F6m (Intel) <thomas_os@shipmail.org>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 17 ++++++++++++++++-
>  mm/gup.c                        | 21 +++++++++++----------
>  mm/memremap.c                   |  5 +++++
>  3 files changed, 32 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 6dc96cf66744..1c34983480e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -195,6 +195,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt *vmf,
>  	pfn_t pfnt;
>  	struct ttm_tt *ttm =3D bo->ttm;
>  	bool write =3D vmf->flags & FAULT_FLAG_WRITE;
> +	struct dev_pagemap *pagemap;
>  =

>  	/* Fault should not cross bo boundary. */
>  	page_offset &=3D ~(fault_page_size - 1);
> @@ -210,6 +211,20 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fa=
ult *vmf,
>  	if ((pfn & (fault_page_size - 1)) !=3D 0)
>  		goto out_fallback;
>  =

> +	/*
> +	 * Huge entries must be special, that is marking them as devmap
> +	 * with no backing device map range. If there is a backing
> +	 * range, Don't insert a huge entry.
> +	 * If this check turns out to be too much of a performance hit,
> +	 * we can instead have drivers indicate whether they may have
> +	 * backing device map ranges and if not, skip this lookup.
> +	 */

I think we can do this statically:
- if it's system memory we know there's no devmap for it, and we do the
  trick to block gup_fast
- if it's iomem, we know gup_fast wont work anyway if don't set PFN_DEV,
  so might as well not do that

I think that would cover all cases without this check here?
-Daniel

> +	pagemap =3D get_dev_pagemap(pfn, NULL);
> +	if (pagemap) {
> +		put_dev_pagemap(pagemap);
> +		goto out_fallback;
> +	}
> +
>  	/* Check that memory is contiguous. */
>  	if (!bo->mem.bus.is_iomem) {
>  		for (i =3D 1; i < fault_page_size; ++i) {
> @@ -223,7 +238,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt *vmf,
>  		}
>  	}
>  =

> -	pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV);
> +	pfnt =3D __pfn_to_pfn_t(pfn, PFN_DEV | PFN_MAP);
>  	if (fault_page_size =3D=3D (HPAGE_PMD_SIZE >> PAGE_SHIFT))
>  		ret =3D vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
>  #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> diff --git a/mm/gup.c b/mm/gup.c
> index e40579624f10..1b6a127f0bdd 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1993,6 +1993,17 @@ static void __maybe_unused undo_dev_pagemap(int *n=
r, int nr_start,
>  }
>  =

>  #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> +/*
> + * If we can't determine whether or not a pte is special, then fail imme=
diately
> + * for ptes. Note, we can still pin HugeTLB as it is guaranteed not to be
> + * special. For THP, special huge entries are indicated by xxx_devmap()
> + * returning true, but a corresponding call to get_dev_pagemap() will
> + * return NULL.
> + *
> + * For a futex to be placed on a THP tail page, get_futex_key requires a
> + * get_user_pages_fast_only implementation that can pin pages. Thus it's=
 still
> + * useful to have gup_huge_pmd even if we can't operate on ptes.
> + */
>  static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long en=
d,
>  			 unsigned int flags, struct page **pages, int *nr)
>  {
> @@ -2069,16 +2080,6 @@ static int gup_pte_range(pmd_t pmd, unsigned long =
addr, unsigned long end,
>  	return ret;
>  }
>  #else
> -
> -/*
> - * If we can't determine whether or not a pte is special, then fail imme=
diately
> - * for ptes. Note, we can still pin HugeTLB and THP as these are guarant=
eed not
> - * to be special.
> - *
> - * For a futex to be placed on a THP tail page, get_futex_key requires a
> - * get_user_pages_fast_only implementation that can pin pages. Thus it's=
 still
> - * useful to have gup_huge_pmd even if we can't operate on ptes.
> - */
>  static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long en=
d,
>  			 unsigned int flags, struct page **pages, int *nr)
>  {
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 7aa7d6e80ee5..757551cd2a4d 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -471,6 +471,11 @@ void vmem_altmap_free(struct vmem_altmap *altmap, un=
signed long nr_pfns)
>   *
>   * If @pgmap is non-NULL and covers @pfn it will be returned as-is.  If =
@pgmap
>   * is non-NULL but does not cover @pfn the reference to it will be relea=
sed.
> + *
> + * Return: A referenced pointer to a struct dev_pagemap containing @pfn,
> + * or NULL if there was no such pagemap registered. For interpretion
> + * of NULL returns for pfns extracted from valid huge page table entries,
> + * please see gup_pte_range().
>   */
>  struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  		struct dev_pagemap *pgmap)
> -- =

> 2.30.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
