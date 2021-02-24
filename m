Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AED32423C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A836EAD8;
	Wed, 24 Feb 2021 16:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 248B36EAE3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:39:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1077731B;
 Wed, 24 Feb 2021 08:39:17 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0028D3F70D;
 Wed, 24 Feb 2021 08:39:15 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/shmem-helper: Check for purged buffers in fault
 handler
To: Neil Roberts <nroberts@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210223155125.199577-1-nroberts@igalia.com>
 <20210223155125.199577-2-nroberts@igalia.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3b720672-d21d-dde5-4d7d-c2c8cd00c4b5@arm.com>
Date: Wed, 24 Feb 2021 16:39:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223155125.199577-2-nroberts@igalia.com>
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
> When a buffer is madvised as not needed and then purged, any attempts to
> access the buffer from user-space should cause a bus fault. This patch
> adds a check for that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 17acb9f35ed7 ("drm/shmem: Add madvise state and purge helpers")
> Signed-off-by: Neil Roberts <nroberts@igalia.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 9825c378dfa6..b26139b1dc35 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -525,14 +525,24 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>   	struct drm_gem_object *obj = vma->vm_private_data;
>   	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>   	loff_t num_pages = obj->size >> PAGE_SHIFT;
> +	vm_fault_t ret;
>   	struct page *page;
>   
> -	if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
> -		return VM_FAULT_SIGBUS;
> +	mutex_lock(&shmem->pages_lock);
> +
> +	if (vmf->pgoff >= num_pages ||
> +	    WARN_ON_ONCE(!shmem->pages) ||
> +	    shmem->madv < 0) {
> +		ret = VM_FAULT_SIGBUS;
> +	} else {
> +		page = shmem->pages[vmf->pgoff];
>   
> -	page = shmem->pages[vmf->pgoff];
> +		ret = vmf_insert_page(vma, vmf->address, page);
> +	}
>   
> -	return vmf_insert_page(vma, vmf->address, page);
> +	mutex_unlock(&shmem->pages_lock);
> +
> +	return ret;
>   }
>   
>   static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
