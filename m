Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561792FB45A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0F56E05F;
	Tue, 19 Jan 2021 08:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F26D6E05F;
 Tue, 19 Jan 2021 08:41:15 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id f1so6388287edr.12;
 Tue, 19 Jan 2021 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jbajsnWmLsh7AuXO6S3iYEH0pskMB7HpIyTwepG9y2I=;
 b=JUhJbQDNG3FW30vUGs0cNiOv+Ka793mRlKgtS8/h6wO5vPng9mLLHGJXWve8Jqf9E6
 laavNC5vJ1BoN4BTdbcmRPLnB/cgbBj9Mj8lqmli8rsBF64/5yd/DL5dq0SUqavEMuaQ
 O28ax3/GTjMutH60/Aogc0HSYda4BqnTAIYFewmiC56kza+FILSpTR54X4XP50DfB1cd
 we1ljBBShoKtrjs0qwCc8O/pJyMuU5b8bNGGkslTsCX0WHZGNLx64STKGXbMkDGpfUaq
 /pozZU/Vm63JLjoHti636qUNtmUGjFjvn3ASJVjlNEFTdC7e0+Ya9WjK8C85YFlAbKUx
 hMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jbajsnWmLsh7AuXO6S3iYEH0pskMB7HpIyTwepG9y2I=;
 b=oOOVuZzWK/BP2dwZGQAqoRwvw9wJC1ah2cIqL6mQPluBNnOAwFwwszdIQMlgkQ/MES
 7e33cJBO+1iKlM8H2OBeLlrXrQCXEjXzkBXl86+FktgXNnLncE5fcf111E0Bp6V6a+1J
 LhKKZ0nJag++lMIrrVGhBY5PP8Tw5yGj+i6JdgYYvJVouINLrFVkjwbVGkl7XlqI3Nza
 w+OvLIK+dMatU2QcYqMkPDXFC1hn5m6av17cv+mduM9LI/wHAApnmRq2lOKuGI9zTqig
 QQW1n0R+wXkJfN1tCdPTo7wDGXVYh0yvWMxxa4v4b5ZUbxZTS+rNVce7SBX3nTrXowD4
 16Ww==
X-Gm-Message-State: AOAM5315M+M8nyGl6c+cZIEyyr2r7ITydz3aDCsxufRtCgXYGWrfxQQm
 iZKHCiKBbZ9Ka/QM7eksFbx1DIEwQhQ=
X-Google-Smtp-Source: ABdhPJy+uZ21KND8s92muaO/U+I+dXCTHOywyNQg/AzfxI+gL28iIPKdUagKgALRbRusTXmtioPbZQ==
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr693034edd.158.1611045673851; 
 Tue, 19 Jan 2021 00:41:13 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y59sm12316376ede.59.2021.01.19.00.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 00:41:13 -0800 (PST)
Subject: Re: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process
 dummy page.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c881825-dc9a-67dd-7b73-21f583a05e96@gmail.com>
Date: Tue, 19 Jan 2021 09:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.01.21 um 22:01 schrieb Andrey Grodzovsky:
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
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 82 ++++++++++++++++++++++++++++++++++++++++-
>   include/drm/ttm/ttm_bo_api.h    |  2 +
>   2 files changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 6dc96cf..ed89da3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -34,6 +34,8 @@
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/drm_vma_manager.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
>   #include <linux/mm.h>
>   #include <linux/pfn_t.h>
>   #include <linux/rbtree.h>
> @@ -380,25 +382,103 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
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

This is superfluous and probably quite harmful here because we wait for 
the hardware to do something.

We map a dummy page instead of the real BO content to the whole range 
anyway, so no need to wait for the real BO content to show up.

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

Maybe rename the variable to num_pages. I was confused for a moment why 
we still prefault.

Alternative you can just drop i and do "for (addr = vma->vm_start; addr 
< vma->vm_end; addr += PAGE_SIZE)".

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

This should probably be modified to either always return the error or 
always ignore it.

Apart from that looks good to me.

Christian.

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
> +
>   vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	pgprot_t prot;
>   	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	struct drm_device *ddev = bo->base.dev;
>   	vm_fault_t ret;
> +	int idx;
>   
>   	ret = ttm_bo_vm_reserve(bo, vmf);
>   	if (ret)
>   		return ret;
>   
>   	prot = vma->vm_page_prot;
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +	if (drm_dev_enter(ddev, &idx)) {
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +		drm_dev_exit(idx);
> +	} else {
> +		ret = ttm_bo_vm_dummy_page(vmf, prot);
> +	}
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
>   
>   	dma_resv_unlock(bo->base.resv);
>   
>   	return ret;
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_fault);
>   
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e17be32..12fb240 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -643,4 +643,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		     void *buf, int len, int write);
>   
> +vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> +
>   #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
