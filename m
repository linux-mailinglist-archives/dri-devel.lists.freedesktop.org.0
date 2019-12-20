Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D03127716
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD486E451;
	Fri, 20 Dec 2019 08:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7F36E451
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 08:24:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so8537544wru.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 00:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=16kleYj3EzWpMaA9Rqqv7rsiyiD6OUag5CBmilPxVWQ=;
 b=TCaYBul3H4UA3W0Z0h5q+6XUx+T+JmzyeYEdPVOoz0fTQM5HdJDbuo5225E85FvfZu
 woqMhoXYcsZj6JNrJrq7vptPBZAAkvqIKYYY3cFE1sti7Eey94HcoYdqAeHHLu6YTR/o
 vE7tImt7qs0DeLbw78/M/1+2bVYFNJtaq8dNe9O6ivigCwKnIIBkzMVg1PttZ61ARqfr
 u2p19277j8uCfDu9c/bCsUxMWDfZwBs3yPLEww/dBmtQj/1ZOZ52YGy8Xzrj2GBvcEzp
 3oTvlUWtlY2dwaSG8O1GMe0F3pKVB/dEhDOBnJQ99TliTagjAB+anIaTXeimm3PcwXdY
 CbJA==
X-Gm-Message-State: APjAAAXG7gsl1Xclw/Hk0HQ9+xdzNtHlSN18q8+7djZIMvPgSx1LrJnN
 NwN9Fi78yQS8MvpiXdH2lN0=
X-Google-Smtp-Source: APXvYqwj2I+JPingsGXkMNL2ZaL9e1PCB9+FBAHMeSCLK9AHTTFkQAjwf7ZwwRriPeGiK/PwXbKoQw==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr14443874wrv.308.1576830241291; 
 Fri, 20 Dec 2019 00:24:01 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id v62sm8994041wmg.3.2019.12.20.00.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 00:24:00 -0800 (PST)
Date: Fri, 20 Dec 2019 09:23:59 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v4 1/2] mm: Add a vmf_insert_mixed_prot() function
Message-ID: <20191220082359.GD20332@dhcp22.suse.cz>
References: <20191212084741.9251-1-thomas_os@shipmail.org>
 <20191212084741.9251-2-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212084741.9251-2-thomas_os@shipmail.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, pv-drivers@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 12-12-19 09:47:40, Thomas Hellstr=F6m (VMware) wrote:
> From: Thomas Hellstrom <thellstrom@vmware.com>
> =

> The TTM module today uses a hack to be able to set a different page
> protection than struct vm_area_struct::vm_page_prot. To be able to do
> this properly, add the needed vm functionality as vmf_insert_mixed_prot().
> =

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: "J=E9r=F4me Glisse" <jglisse@redhat.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>

I cannot say I am happy about this because it adds a discrepancy and
that is always tricky but I do agree that a formalized discrepancy is
better than ad-hoc hacks so

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks for extending the documentation.

> ---
>  include/linux/mm.h       |  2 ++
>  include/linux/mm_types.h |  7 ++++++-
>  mm/memory.c              | 43 ++++++++++++++++++++++++++++++++++++----
>  3 files changed, 47 insertions(+), 5 deletions(-)
> =

> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cc292273e6ba..29575d3c1e47 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2548,6 +2548,8 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struc=
t *vma, unsigned long addr,
>  			unsigned long pfn, pgprot_t pgprot);
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long ad=
dr,
>  			pfn_t pfn);
> +vm_fault_t vmf_insert_mixed_prot(struct vm_area_struct *vma, unsigned lo=
ng addr,
> +			pfn_t pfn, pgprot_t pgprot);
>  vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
>  		unsigned long addr, pfn_t pfn);
>  int vm_iomap_memory(struct vm_area_struct *vma, phys_addr_t start, unsig=
ned long len);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 2222fa795284..ac96afdbb4bc 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -307,7 +307,12 @@ struct vm_area_struct {
>  	/* Second cache line starts here. */
>  =

>  	struct mm_struct *vm_mm;	/* The address space we belong to. */
> -	pgprot_t vm_page_prot;		/* Access permissions of this VMA. */
> +
> +	/*
> +	 * Access permissions of this VMA.
> +	 * See vmf_insert_mixed() for discussion.
> +	 */
> +	pgprot_t vm_page_prot;
>  	unsigned long vm_flags;		/* Flags, see mm.h. */
>  =

>  	/*
> diff --git a/mm/memory.c b/mm/memory.c
> index b1ca51a079f2..269a8a871e83 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1646,6 +1646,9 @@ static vm_fault_t insert_pfn(struct vm_area_struct =
*vma, unsigned long addr,
>   * vmf_insert_pfn_prot should only be used if using multiple VMAs is
>   * impractical.
>   *
> + * See vmf_insert_mixed_prot() for a discussion of the implication of us=
ing
> + * a value of @pgprot different from that of @vma->vm_page_prot.
> + *
>   * Context: Process context.  May allocate using %GFP_KERNEL.
>   * Return: vm_fault_t value.
>   */
> @@ -1719,9 +1722,9 @@ static bool vm_mixed_ok(struct vm_area_struct *vma,=
 pfn_t pfn)
>  }
>  =

>  static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
> -		unsigned long addr, pfn_t pfn, bool mkwrite)
> +		unsigned long addr, pfn_t pfn, pgprot_t pgprot,
> +		bool mkwrite)
>  {
> -	pgprot_t pgprot =3D vma->vm_page_prot;
>  	int err;
>  =

>  	BUG_ON(!vm_mixed_ok(vma, pfn));
> @@ -1764,10 +1767,42 @@ static vm_fault_t __vm_insert_mixed(struct vm_are=
a_struct *vma,
>  	return VM_FAULT_NOPAGE;
>  }
>  =

> +/**
> + * vmf_insert_mixed_prot - insert single pfn into user vma with specifie=
d pgprot
> + * @vma: user vma to map to
> + * @addr: target user address of this page
> + * @pfn: source kernel pfn
> + * @pgprot: pgprot flags for the inserted page
> + *
> + * This is exactly like vmf_insert_mixed(), except that it allows driver=
s to
> + * to override pgprot on a per-page basis.
> + *
> + * Typically this function should be used by drivers to set caching- and
> + * encryption bits different than those of @vma->vm_page_prot, because
> + * the caching- or encryption mode may not be known at mmap() time.
> + * This is ok as long as @vma->vm_page_prot is not used by the core vm
> + * to set caching and encryption bits for those vmas (except for COW pag=
es).
> + * This is ensured by core vm only modifying these page table entries us=
ing
> + * functions that don't touch caching- or encryption bits, using pte_mod=
ify()
> + * if needed. (See for example mprotect()).
> + * Also when new page-table entries are created, this is only done using=
 the
> + * fault() callback, and never using the value of vma->vm_page_prot,
> + * except for page-table entries that point to anonymous pages as the re=
sult
> + * of COW.
> + *
> + * Context: Process context.  May allocate using %GFP_KERNEL.
> + * Return: vm_fault_t value.
> + */
> +vm_fault_t vmf_insert_mixed_prot(struct vm_area_struct *vma, unsigned lo=
ng addr,
> +				 pfn_t pfn, pgprot_t pgprot)
> +{
> +	return __vm_insert_mixed(vma, addr, pfn, pgprot, false);
> +}
> +
>  vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long ad=
dr,
>  		pfn_t pfn)
>  {
> -	return __vm_insert_mixed(vma, addr, pfn, false);
> +	return __vm_insert_mixed(vma, addr, pfn, vma->vm_page_prot, false);
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed);
>  =

> @@ -1779,7 +1814,7 @@ EXPORT_SYMBOL(vmf_insert_mixed);
>  vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
>  		unsigned long addr, pfn_t pfn)
>  {
> -	return __vm_insert_mixed(vma, addr, pfn, true);
> +	return __vm_insert_mixed(vma, addr, pfn, vma->vm_page_prot, true);
>  }
>  EXPORT_SYMBOL(vmf_insert_mixed_mkwrite);
>  =

> -- =

> 2.21.0

-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
