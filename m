Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A564360D3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251F36EC39;
	Thu, 21 Oct 2021 11:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50D6EC39
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:51:07 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g39so373407wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vsbdXFkgwC3aPqeNa0ZYigIeOn2MLKgQXeMFSvcdSsE=;
 b=jpM+gyqTsAiWKAvkXe0a70TY+VDREr8jNs1AQ2mdgqof7A2DdFkB4XlzdmlaNESko2
 ZLx15zVgGF1LlHJh1CS9Uaa6YBWWwgn3vqy8m0q0TYoG9RWyCC4UyBMC6BY+Oq17Suz4
 HUHLU7hobSuhcuzmSVY+qA7byr1PJXkDU+9kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vsbdXFkgwC3aPqeNa0ZYigIeOn2MLKgQXeMFSvcdSsE=;
 b=IqFCVSupXJgokymf0LyJiCher9eF/R4Td68171QBQLE1x7FyLCnJP3G/bkUR23vdfw
 AkFaOO4fdlOULZ63K0NvHxHDEa+EBY1ELOjv22bn/SvH7zVCw3IBYjkOnHPP6GWkGSbc
 OTIK8dOPg5L9Gr3Bwei2d5uijoE+qK+bvK86mZCiJLRmRHtYWYhFVBE9vJim316FuIn6
 s7Fb9eVP+kryQose2xxTL7/xDrYah1n+Oj5zuj7MC5lGlP+x+LZ3f/WqF1r5O2Q9I+ug
 LTyIDrkyQ+kwL3WqL0phzX+RhhZGd0VcH/6aMk6/djRqCqrwe2vYDq7NC9X8u/ZZmjA8
 eveQ==
X-Gm-Message-State: AOAM533wkhGqVnb1dkJAUEvexkRKy4ro+SNlAKlNaeagHX5FcPwwqhPD
 8ZO4J6JG2c4M3AJKbXOaWtReJQ==
X-Google-Smtp-Source: ABdhPJz0JNnYfcNq+4EhddRo2SIdnOTeCmvEpzukKTjLMvZJFhMXPAidJruU7Lr49f5/21WdrByEJA==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr20569098wmc.169.1634817066110; 
 Thu, 21 Oct 2021 04:51:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x7sm4632673wrq.69.2021.10.21.04.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:51:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:51:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: stop using PAGE_KERNEL_IO
Message-ID: <YXFUJ0jbr4iD9JAD@phenom.ffwll.local>
References: <20211020090625.1037517-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020090625.1037517-1-lucas.demarchi@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Wed, Oct 20, 2021 at 02:06:25AM -0700, Lucas De Marchi wrote:
> PAGE_KERNEL_IO is only defined for x86 and is the same as PAGE_KERNEL.
> Use the latter since that is also available on other archs, which should
> help us getting i915 there.
> 
> This is the same that was done done in commit 80c33624e472 ("io-mapping:
> Fixup for different names of writecombine"). Later the commit
> 80c33624e472 ("io-mapping: Fixup for different names of writecombine")
> added a "Fixes" tag to the first one, but that is actually fixing a
> separate issue:  the different names for pgprot_writecombine().
> 
> Fast-forward today, it seems the only 2 archs that define
> pgprot_noncached_wc() are microblaze and powerpc. Microblaze has the
> same definition for pgprot_writecombine() since commit
> 97ccedd793ac ("microblaze: Provide pgprot_device/writecombine macros for
> nommu"). Powerpc has 3 variants and all of them have the same behavior
> for pgprot_writecombine() and pgprot_noncached_wc(). From the commit message
> and linked issue, the fallback was needed for arm, but apparently today
> all the variants there also have pgprot_writecombine().
> 
> So, just use PAGE_KERNEL, and just use pgprot_writecombine().
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I think a bit more history on PAGE_KERNEL_IO is useful to add. It was
added in be43d72835ba ("x86: add _PAGE_IOMAP pte flag for IO mappings").
The one and only user was lost in f955371ca9d3 ("x86: remove the
Xen-specific _PAGE_IOMAP PTE flag"), therefore it's safe to do this.

With that added Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also if you're motivated, maybe delete PAGE_KERNEL_IO across the tree and
get x86 maintainers to merge the entire series?
-Daniel


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 8eb1c3a6fc9c..68fe1837ef54 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -289,7 +289,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
>  		pgprot = PAGE_KERNEL;
>  		break;
>  	case I915_MAP_WC:
> -		pgprot = pgprot_writecombine(PAGE_KERNEL_IO);
> +		pgprot = pgprot_writecombine(PAGE_KERNEL);
>  		break;
>  	}
>  
> @@ -333,7 +333,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>  	i = 0;
>  	for_each_sgt_daddr(addr, iter, obj->mm.pages)
>  		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
> -	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
> +	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL));
>  	if (pfns != stack)
>  		kvfree(pfns);
>  
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
