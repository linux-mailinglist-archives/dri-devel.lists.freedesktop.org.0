Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488E31EB7A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 16:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971586E83A;
	Thu, 18 Feb 2021 15:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0587F6E83A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 15:26:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364F3ED1;
 Thu, 18 Feb 2021 07:26:00 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D313F73D;
 Thu, 18 Feb 2021 07:25:59 -0800 (PST)
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20210217165910.3820374-1-nroberts@igalia.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
Date: Thu, 18 Feb 2021 15:26:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217165910.3820374-1-nroberts@igalia.com>
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2021 16:59, Neil Roberts wrote:
> When mmapping the shmem, it would previously adjust the pgoff in the
> vm_area_struct to remove the fake offset that is added to be able to
> identify the buffer. This patch removes the adjustment and makes the
> fault handler use the vm_fault address to calculate the page offset
> instead. Although using this address is apparently discouraged, several
> DRM drivers seem to be doing it anyway.
> 
> The problem with removing the pgoff is that it prevents
> drm_vma_node_unmap from working because that searches the mapping tree
> by address. That doesn't work because all of the mappings are at offset
> 0. drm_vma_node_unmap is being used by the shmem helpers when purging
> the buffer.
> 
> It looks like panfrost is using drm_gem_shmem_purge so this might fix a
> potential bug there.
> 
> Signed-off-by: Neil Roberts <nroberts@igalia.com>

As the test robot points out pgoff_t is unsigned, so the <0 test makes 
no sense. But apart from that it looks good to me.

I think this is worth a "Fixes:" line too - as you point out 
drm_vma_node_unmap() won't be working correctly - which means we're 
potentially leaving user space with pages pointing to freed memory - not 
good! 17acb9f35ed7 is my best guess at the commit that introduced this.

Steve

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 9825c378dfa6..4b14157f1962 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -526,11 +526,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>   	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>   	loff_t num_pages = obj->size >> PAGE_SHIFT;
>   	struct page *page;
> +	pgoff_t page_offset;
>   
> -	if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
> +	/* We don't use vmf->pgoff since that has the fake offset */
> +	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +
> +	if (page_offset < 0 || page_offset >= num_pages ||
> +	    WARN_ON_ONCE(!shmem->pages))
>   		return VM_FAULT_SIGBUS;
>   
> -	page = shmem->pages[vmf->pgoff];
> +	page = shmem->pages[page_offset];
>   
>   	return vmf_insert_page(vma, vmf->address, page);
>   }
> @@ -581,9 +586,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>   	struct drm_gem_shmem_object *shmem;
>   	int ret;
>   
> -	/* Remove the fake offset */
> -	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
> -
>   	if (obj->import_attach) {
>   		/* Drop the reference drm_gem_mmap_obj() acquired.*/
>   		drm_gem_object_put(obj);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
