Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8C92FB689
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 14:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4C89C1B;
	Tue, 19 Jan 2021 13:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E094889C1B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 13:56:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id v184so12569246wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ustylnb7AoVAoYkeOYytqKa2F5zB9sXdO+4squMEXpA=;
 b=LhasP0YmQBIPBYoL9PYGwxx/VWpe0X4laY8qtyFIpXyvra9Vm0z2KVdfiOZLRT+ev3
 2Woyz+vc7mOLFvaxk7Ebe8lPYyMn7wpenQkTpQTObk0btSGCectYKsh2jUVtfLon0l6x
 j/xbIyu5c2O0GnIiokG2E9xUmhk7SFkcIDE2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ustylnb7AoVAoYkeOYytqKa2F5zB9sXdO+4squMEXpA=;
 b=tVqjLyl63i3u/Uj3LXCDM8fO/LBEddIq+tnT8lAXsOZpQp+fXAuhoccCmy8oCu/SGb
 VdtEUAVGwOa9EFZAZ1PStC8RaTAJlAmMtv1iPiVDVb9NQ3k8TqiE6zaqoN1oelYlAGLd
 nw+4xOX4FClAAuEyIR+MXOZio5n9bpsH4i3HhgNmkuhgbmi1s2Q1h3NkRGsMAanggbtm
 eNv8xPVtHNEzqRtZrlqt8qPrNhuQlkmpzkHXvVKxRegd0r4NNtEuX+fIBAb7VATuL/OE
 UtlV8ro2XFvQT47MojhF3zMzzAf56zxB6cDgtmmeR4/SK+r0SAKApkc9oGpXAkcHxH5Q
 VjYQ==
X-Gm-Message-State: AOAM531OjOqCeGIcfa0vswCT4eOLoZCpISK3QuhdyHDhj/1PfGdbvyiD
 IGCnJ0yRJAm5oQrq1pytXe6OFg==
X-Google-Smtp-Source: ABdhPJyFYOCetTLiL93Xj7Uq45vdwiTGb5L2oLDMKGJNBqXqPOv4Uj+u7FwH1hF6yvQGzZaESjLwiQ==
X-Received: by 2002:a7b:c34c:: with SMTP id l12mr4152149wmj.177.1611064607622; 
 Tue, 19 Jan 2021 05:56:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s4sm4372270wme.38.2021.01.19.05.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 05:56:46 -0800 (PST)
Date: Tue, 19 Jan 2021 14:56:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process
 dummy page.
Message-ID: <YAblHNmVZVlTI6ny@phenom.ffwll.local>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 04:01:10PM -0500, Andrey Grodzovsky wrote:
> On device removal reroute all CPU mappings to dummy page.
> 
> v3:
> Remove loop to find DRM file and instead access it
> by vma->vm_file->private_data. Move dummy page installation
> into a separate function.
> 
> v4:
> Map the entire BOs VA space into on demand allocated dummy page
> on the first fault for that BO.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 82 ++++++++++++++++++++++++++++++++++++++++-
>  include/drm/ttm/ttm_bo_api.h    |  2 +
>  2 files changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 6dc96cf..ed89da3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -34,6 +34,8 @@
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/drm_vma_manager.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
>  #include <linux/mm.h>
>  #include <linux/pfn_t.h>
>  #include <linux/rbtree.h>
> @@ -380,25 +382,103 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
>  
> +static void ttm_bo_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +	struct page *dummy_page = (struct page *)res;
> +
> +	__free_page(dummy_page);
> +}
> +
> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	struct ttm_bo_device *bdev = bo->bdev;
> +	struct drm_device *ddev = bo->base.dev;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	unsigned long address = vma->vm_start;
> +	unsigned long num_prefault = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
> +	unsigned long pfn;
> +	struct page *page;
> +	int i;
> +
> +	/*
> +	 * Wait for buffer data in transit, due to a pipelined
> +	 * move.
> +	 */
> +	ret = ttm_bo_vm_fault_idle(bo, vmf);
> +	if (unlikely(ret != 0))
> +		return ret;
> +
> +	/* Allocate new dummy page to map all the VA range in this VMA to it*/
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!page)
> +		return VM_FAULT_OOM;
> +
> +	pfn = page_to_pfn(page);
> +
> +	/*
> +	 * Prefault the entire VMA range right away to avoid further faults
> +	 */
> +	for (i = 0; i < num_prefault; ++i) {
> +
> +		if (unlikely(address >= vma->vm_end))
> +			break;
> +
> +		if (vma->vm_flags & VM_MIXEDMAP)
> +			ret = vmf_insert_mixed_prot(vma, address,
> +						    __pfn_to_pfn_t(pfn, PFN_DEV),
> +						    prot);
> +		else
> +			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +
> +		/* Never error on prefaulted PTEs */
> +		if (unlikely((ret & VM_FAULT_ERROR))) {
> +			if (i == 0)
> +				return VM_FAULT_NOPAGE;
> +			else
> +				break;
> +		}
> +
> +		address += PAGE_SIZE;
> +	}
> +
> +	/* Set the page to be freed using drmm release action */
> +	if (drmm_add_action_or_reset(ddev, ttm_bo_release_dummy_page, page))
> +		return VM_FAULT_OOM;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_vm_dummy_page);

I think we can lift this entire thing (once the ttm_bo_vm_fault_idle is
gone) to the drm level, since nothing ttm specific in here. Probably stuff
it into drm_gem.c (but really it's not even gem specific, it's fully
generic "replace this vma with dummy pages pls" function.

Aside from this nit I think the overall approach you have here is starting
to look good. Lots of work&polish, but imo we're getting there and can
start landing stuff soon.
-Daniel

> +
>  vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	pgprot_t prot;
>  	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	struct drm_device *ddev = bo->base.dev;
>  	vm_fault_t ret;
> +	int idx;
>  
>  	ret = ttm_bo_vm_reserve(bo, vmf);
>  	if (ret)
>  		return ret;
>  
>  	prot = vma->vm_page_prot;
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +	if (drm_dev_enter(ddev, &idx)) {
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +		drm_dev_exit(idx);
> +	} else {
> +		ret = ttm_bo_vm_dummy_page(vmf, prot);
> +	}
>  	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>  		return ret;
>  
>  	dma_resv_unlock(bo->base.resv);
>  
>  	return ret;
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_fault);
>  
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e17be32..12fb240 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -643,4 +643,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  		     void *buf, int len, int write);
>  
> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> +
>  #endif
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
