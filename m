Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906787EBB2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3868F10EBD3;
	Mon, 18 Mar 2024 15:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="0KtRVOKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57B510EBD3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710774553;
 bh=iw8RLP+57lSzz2/XcRNL53C/05RUReh85K6q3MlmL40=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0KtRVOKtDyE5trADOruzao6Az6mFJvrJT8i5tx7VysgZSkLQYUURX/vqBguffGdH+
 9tstj8X1eBB/lfztYqsWd9wYZQUCZ29R8TXn82chBLcsZ7kuyux1dh7MArNxYpbGCA
 Rzup7oQhM28j202oKBqC0AsnBxrqJospjJZMpOLdZMF5uzviGNvBNgIIRlziZ1TqMU
 vGt5TtFCEsTzsf9zj7yLSSL164/hjLjvmt9O/9H/8SFqQ/FpLrrvoDbF2kUGolZzbS
 dew7YfC7IKLogcOYOLuK0d5uqjxDMuLi1zE8QadktgWGZbwENhGYSfd+3to/936Ynv
 YWPLKRYavoZoA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4BD8537811D1;
 Mon, 18 Mar 2024 15:09:13 +0000 (UTC)
Date: Mon, 18 Mar 2024 16:09:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panthor: Don't use virt_to_pfn()
Message-ID: <20240318160911.16ba951f@collabora.com>
In-Reply-To: <20240318145119.368582-1-steven.price@arm.com>
References: <20240318145119.368582-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 18 Mar 2024 14:51:19 +0000
Steven Price <steven.price@arm.com> wrote:

> virt_to_pfn() isn't available on x86 (except to xen) so breaks
> COMPILE_TEST builds. Avoid its use completely by instead storing the
> struct page pointer allocated in panthor_device_init() and using
> page_to_pfn() instead.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks,

Boris

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 10 ++++++----
>  drivers/gpu/drm/panthor/panthor_device.h |  2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 69deb8e17778..3c30da03fa48 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -154,6 +154,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  {
>  	struct resource *res;
>  	struct page *p;
> +	u32 *dummy_page_virt;
>  	int ret;
>  
>  	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> @@ -172,9 +173,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (!p)
>  		return -ENOMEM;
>  
> -	ptdev->pm.dummy_latest_flush = page_address(p);
> +	ptdev->pm.dummy_latest_flush = p;
> +	dummy_page_virt = page_address(p);
>  	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> -				       ptdev->pm.dummy_latest_flush);
> +				       dummy_page_virt);
>  	if (ret)
>  		return ret;
>  
> @@ -184,7 +186,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	 * happens while the dummy page is mapped. Zero cannot be used because
>  	 * that means 'always flush'.
>  	 */
> -	*ptdev->pm.dummy_latest_flush = 1;
> +	*dummy_page_virt = 1;
>  
>  	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
>  	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> @@ -353,7 +355,7 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
>  		if (active)
>  			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
>  		else
> -			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
> +			pfn = page_to_pfn(ptdev->pm.dummy_latest_flush);
>  		break;
>  
>  	default:
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 51c9d61b6796..c84c27dcc92c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -160,7 +160,7 @@ struct panthor_device {
>  		 * Used to replace the real LATEST_FLUSH page when the GPU
>  		 * is suspended.
>  		 */
> -		u32 *dummy_latest_flush;
> +		struct page *dummy_latest_flush;
>  	} pm;
>  };
>  

