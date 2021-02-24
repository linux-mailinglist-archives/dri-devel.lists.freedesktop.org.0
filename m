Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95232424C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4DD6EAE3;
	Wed, 24 Feb 2021 16:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A4C66EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:40:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B089101E;
 Wed, 24 Feb 2021 08:40:33 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 785453F70D;
 Wed, 24 Feb 2021 08:40:32 -0800 (PST)
Subject: Re: [PATCH v2 2/2] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210223155125.199577-1-nroberts@igalia.com>
 <20210223155125.199577-3-nroberts@igalia.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3a702319-af6e-f21f-903d-d3ebdd0028f6@arm.com>
Date: Wed, 24 Feb 2021 16:41:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223155125.199577-3-nroberts@igalia.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2021 15:51, Neil Roberts wrote:
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
> This fixes a bug in Panfrost which is using drm_gem_shmem_purge. Without
> this the mapping for the purged buffer can still be accessed which might
> mean it would access random pages from other buffers
> 
> v2: Don't check whether the unsigned page_offset is less than 0.
> 
> Cc: stable@vger.kernel.org
> Fixes: 17acb9f35ed7 ("drm/shmem: Add madvise state and purge helpers")
> Signed-off-by: Neil Roberts <nroberts@igalia.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index b26139b1dc35..5b5c095e86a9 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -527,15 +527,19 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>   	loff_t num_pages = obj->size >> PAGE_SHIFT;
>   	vm_fault_t ret;
>   	struct page *page;
> +	pgoff_t page_offset;
> +
> +	/* We don't use vmf->pgoff since that has the fake offset */
> +	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>   
>   	mutex_lock(&shmem->pages_lock);
>   
> -	if (vmf->pgoff >= num_pages ||
> +	if (page_offset >= num_pages ||
>   	    WARN_ON_ONCE(!shmem->pages) ||
>   	    shmem->madv < 0) {
>   		ret = VM_FAULT_SIGBUS;
>   	} else {
> -		page = shmem->pages[vmf->pgoff];
> +		page = shmem->pages[page_offset];
>   
>   		ret = vmf_insert_page(vma, vmf->address, page);
>   	}
> @@ -591,9 +595,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
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
