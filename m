Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8520339F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B426E12D;
	Mon, 22 Jun 2020 09:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72E96E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:41:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k6so3481657wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cPOjN1RgR1/QvtDhOaRjif3zZdMDq5ibV4Mtk4nxrcw=;
 b=bmf235iKEZumcIhA7e2S5sxJxpIBKgrKUH0MZOkNNHnVdeMckIWsg6MHr5H9KLwZyA
 wBC+dfnLRaW3JhnhelFrNqZ77ubOMI/jZtfIiMdrsAfAQ6IXyghwrjSmgkwnquIi7Yr2
 7fv/HEDx73l0Mp6nAlEi+1I1HklVLeTgwWvao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cPOjN1RgR1/QvtDhOaRjif3zZdMDq5ibV4Mtk4nxrcw=;
 b=PIRrtCiZ1D+mZMElVE4RGJknWqUI9met8BORWWwykPQyR2oHjq3xeaO2WS3LTyJoSc
 uxEt/6h7lEKNg3miXwbiGJ366JriH90vg1mbi7WRc3moGlIsLNvD4ASbWufAliRBpO9l
 XopkZiWzuItmbE3n6au1tjkykRQX8VLp7+TWZk0gtMDb+mrq6M5AlUr1NYLhvDGRDj3r
 +Jti56PtHLz/S7ZjcrMOEknKG2coezkcxLLfKYYcaLEbL7zi1facTIsn7M/J7HaG/iYi
 urzqO0KZquFdEnDtWt8CXbLzo/dbIYffNCSCrmEGsyPfIxL6pAGRlsy1gQ4Bk91EryBn
 g/6g==
X-Gm-Message-State: AOAM532IzSQS+Xq4oFmOZdbhjXAB6czCblRjUAFK1kZqX7JOvD1/zEmU
 yfHF6mqy9i5wqLwdD8iHvJjewRhKA9A=
X-Google-Smtp-Source: ABdhPJwv9lPgdZ22lP+wVMRCN6L8yQW/brQnUetwwH+hsqa42fLeNZaPOxblsPGTirqOh4FbUFhrYQ==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr11057936wrw.19.1592818865480; 
 Mon, 22 Jun 2020 02:41:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 138sm16379039wma.23.2020.06.22.02.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:41:04 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:41:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 2/8] drm/ttm: Remap all page faults to per process
 dummy page.
Message-ID: <20200622094103.GA20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 02:03:02AM -0400, Andrey Grodzovsky wrote:
> On device removal reroute all CPU mappings to dummy page per drm_file
> instance or imported GEM object.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 65 ++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 57 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 389128b..2f8bf5e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -35,6 +35,8 @@
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/drm_vma_manager.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
>  #include <linux/mm.h>
>  #include <linux/pfn_t.h>
>  #include <linux/rbtree.h>
> @@ -328,19 +330,66 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)

Hm I think diff and code flow look a bit bad now. What about renaming the
current function to __ttm_bo_vm_fault and then having something like the
below:

ttm_bo_vm_fault(args) {

	if (drm_dev_enter()) {
		__ttm_bo_vm_fault(args);
		drm_dev_exit();
	} else  {
		drm_gem_insert_dummy_pfn();
	}
}

I think drm_gem_insert_dummy_pfn(); should be portable across drivers, so
another nice point to try to unifiy drivers as much as possible.
-Daniel

>  	pgprot_t prot;
>  	struct ttm_buffer_object *bo = vma->vm_private_data;
>  	vm_fault_t ret;
> +	int idx;
> +	struct drm_device *ddev = bo->base.dev;
>  
> -	ret = ttm_bo_vm_reserve(bo, vmf);
> -	if (ret)
> -		return ret;
> +	if (drm_dev_enter(ddev, &idx)) {
> +		ret = ttm_bo_vm_reserve(bo, vmf);
> +		if (ret)
> +			goto exit;
> +
> +		prot = vma->vm_page_prot;
>  
> -	prot = vma->vm_page_prot;
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> +		if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> +			goto exit;
> +
> +		dma_resv_unlock(bo->base.resv);
> +
> +exit:
> +		drm_dev_exit(idx);
>  		return ret;
> +	} else {
>  
> -	dma_resv_unlock(bo->base.resv);
> +		struct drm_file *file = NULL;
> +		struct page *dummy_page = NULL;
> +		int handle;
>  
> -	return ret;
> +		/* We are faulting on imported BO from dma_buf */
> +		if (bo->base.dma_buf && bo->base.import_attach) {
> +			dummy_page = bo->base.dummy_page;
> +		/* We are faulting on non imported BO, find drm_file owning the BO*/

Uh, we can't fish that out of the vma->vm_file pointer somehow? Or is that
one all wrong? Doing this kind of list walk looks pretty horrible.

If the vma doesn't have the right pointer I guess next option is that we
store the drm_file page in gem_bo->dummy_page, and replace it on first
export. But that's going to be tricky to track ...

> +		} else {
> +			struct drm_gem_object *gobj;
> +
> +			mutex_lock(&ddev->filelist_mutex);
> +			list_for_each_entry(file, &ddev->filelist, lhead) {
> +				spin_lock(&file->table_lock);
> +				idr_for_each_entry(&file->object_idr, gobj, handle) {
> +					if (gobj == &bo->base) {
> +						dummy_page = file->dummy_page;
> +						break;
> +					}
> +				}
> +				spin_unlock(&file->table_lock);
> +			}
> +			mutex_unlock(&ddev->filelist_mutex);
> +		}
> +
> +		if (dummy_page) {
> +			/*
> +			 * Let do_fault complete the PTE install e.t.c using vmf->page
> +			 *
> +			 * TODO - should i call free_page somewhere ?

Nah, instead don't call get_page. The page will be around as long as
there's a reference for the drm_file or gem_bo, which is longer than any
mmap. Otherwise yes this would like really badly.

> +			 */
> +			get_page(dummy_page);
> +			vmf->page = dummy_page;
> +			return 0;
> +		} else {
> +			return VM_FAULT_SIGSEGV;

Hm that would be a kernel bug, wouldn't it? WARN_ON() required here imo.
-Daniel

> +		}
> +	}
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_fault);
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
