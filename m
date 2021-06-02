Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CF3992AD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54E66E54C;
	Wed,  2 Jun 2021 18:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDEF6E52A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:38:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id h3so1913236wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/wtJi5bShJgdXtDe5bLqTBg8zSE4Lgs1lWCT3B79EHo=;
 b=Uzo2KDRyDEk1fLiNI64Hwv3RD4PHwVlDjGgyFpcTnEK607m0CNwu9mBC8B0Ls/kBm9
 4K1NegWl2Vw8/Ny7G7SK8mKXaQPaevQSEOAmciZ5qaTf72Un1aa+S0YnMLW26rUyfYwp
 Jf169qkzF0dotgiQtm+7C51thKxJPo9HEsoDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/wtJi5bShJgdXtDe5bLqTBg8zSE4Lgs1lWCT3B79EHo=;
 b=lr0jtDzzvLCSrFwo9IqfRdD7/RhybUfAcpnWya5YOdJ8S4ilndgqwdtbfinugN/3FV
 F85XTLELTXDbOM7cAePW06cX+DieDJkfn/3iTW6cRlbmF8wH8nzUZqHZ4zV2ArQhlv+k
 5CdmM+hrUGvmtdx06OI98crnXfVjtETuALeAoXCK7YdapBzbZ63bF9cAzQpFT813dkg7
 CH2eOBwHpzKEhID27NsNf3sF6zOmypPLGz1ZGIPy4MSiKeVeCczYSn+n6E6lc8KzJd/S
 85xK5y65XlS1DSarqT7tBg5WH0w2rJnm8BROOnoKtR03zPREp36qyafMA1PB4imUelfv
 TIVQ==
X-Gm-Message-State: AOAM531hiEnR62qS1w2yO/FJGrPoVyyGQLSILB3rqh0bBiI8Lh+kKE50
 p31debO3F5Pn6DNHfe8xH1Q6SA==
X-Google-Smtp-Source: ABdhPJxGEvzyNyMHEYPGSFt4sm4o9W5RzD6ycXBUM3RkvndEnhhwQg482YSTgzyC5KXeLgQy7y8v0w==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr6459166wml.178.1622659090255; 
 Wed, 02 Jun 2021 11:38:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j14sm3532836wmi.32.2021.06.02.11.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:38:09 -0700 (PDT)
Date: Wed, 2 Jun 2021 20:38:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
Message-ID: <YLfQEJy0PisO6eAh@phenom.ffwll.local>
References: <20210602083013.1561-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602083013.1561-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: jgg@ziepe.ca, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 10:30:13AM +0200, Christian König wrote:
> We discussed if that is really the right approach for quite a while now, but
> digging deeper into a bug report on arm turned out that this is actually
> horrible broken right now.
> 
> The reason for this is that vmf_insert_mixed_prot() always tries to grab
> a reference to the underlaying page on architectures without
> ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.
> 
> So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.
> 
> Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, but better
> save than sorry.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174

I thought we still have the same issue open for ttm_bo_vm_insert_huge()?
Or at least a potentially pretty big bug, because our current huge entries
don't stop gup (because there's no pmd_mkspecial right now in the kernel).

So I think if you want to close this for good then we also need to
(temporarily at least) disable the huge entry code?
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 9bd15cb39145..bf86ae849340 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		 * at arbitrary times while the data is mmap'ed.
>  		 * See vmf_insert_mixed_prot() for a discussion.
>  		 */
> -		if (vma->vm_flags & VM_MIXEDMAP)
> -			ret = vmf_insert_mixed_prot(vma, address,
> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
> -						    prot);
> -		else
> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>  
>  		/* Never error on prefaulted PTEs */
>  		if (unlikely((ret & VM_FAULT_ERROR))) {
> @@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>  	pfn = page_to_pfn(page);
>  
>  	/* Prefault the entire VMA range right away to avoid further faults */
> -	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
> -
> -		if (vma->vm_flags & VM_MIXEDMAP)
> -			ret = vmf_insert_mixed_prot(vma, address,
> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
> -						    prot);
> -		else
> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> -	}
> +	for (address = vma->vm_start; address < vma->vm_end;
> +	     address += PAGE_SIZE)
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>  
>  	return ret;
>  }
> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
>  
>  	vma->vm_private_data = bo;
>  
> -	/*
> -	 * We'd like to use VM_PFNMAP on shared mappings, where
> -	 * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
> -	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
> -	 * bad for performance. Until that has been sorted out, use
> -	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
> +	/* Enforce VM_SHARED here since no driver backend actually supports COW
> +	 * on TTM buffer object mappings.
>  	 */
> -	vma->vm_flags |= VM_MIXEDMAP;
> +	vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>  	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
