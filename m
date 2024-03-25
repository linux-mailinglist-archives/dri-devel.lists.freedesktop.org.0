Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2888993E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7710E6EF;
	Mon, 25 Mar 2024 10:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="q6Y9Sx92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8788510E6EF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711361127;
 bh=F/f8iWLSiEsDNxk54E+r/EMd/MjnEq37LBR1vtRVtxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q6Y9Sx921Sy2UZaQUJrT7vWNl+9CbBXW31WwKsN7Gn0jukFA2py7kCoCspnzZr8Jf
 r23NRvlJOr7BaGcpj9UhAa3XCzh6X2mUlxWxzSkhfo5MeMBsOxitk8HtFiCToo/q6T
 tNNJwCD+urJuHywuK/d1K4rFqhTgVnQcCkn/al+NI7xK95Y/zvtwGPeau7RdWTOvdT
 P86uKL7g5Lw/1x/5Qs5lfMprlYGpBp5gbvPk6N6pj74/o7PSk0HfbOvZOhR2XBjuWa
 um/jI6xNydI+zunTGt68s/0VoTo15H/7vjUmW37BThFgqmvIkzanZiFsIZtBAdOOMN
 OTCgcA/sxXRUw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5CDA03782046;
 Mon, 25 Mar 2024 10:05:27 +0000 (UTC)
Date: Mon, 25 Mar 2024 11:05:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Don't use virt_to_pfn()
Message-ID: <20240325110525.726ec32f@collabora.com>
In-Reply-To: <5566e7e4-7c35-4939-9676-a739c96b8aa5@arm.com>
References: <20240318145119.368582-1-steven.price@arm.com>
 <5566e7e4-7c35-4939-9676-a739c96b8aa5@arm.com>
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

On Mon, 18 Mar 2024 15:11:42 +0000
Robin Murphy <robin.murphy@arm.com> wrote:

> On 18/03/2024 2:51 pm, Steven Price wrote:
> > virt_to_pfn() isn't available on x86 (except to xen) so breaks
> > COMPILE_TEST builds. Avoid its use completely by instead storing the
> > struct page pointer allocated in panthor_device_init() and using
> > page_to_pfn() instead.
> > 
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_device.c | 10 ++++++----
> >   drivers/gpu/drm/panthor/panthor_device.h |  2 +-
> >   2 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index 69deb8e17778..3c30da03fa48 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -154,6 +154,7 @@ int panthor_device_init(struct panthor_device *ptdev)
> >   {
> >   	struct resource *res;
> >   	struct page *p;
> > +	u32 *dummy_page_virt;
> >   	int ret;
> >   
> >   	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> > @@ -172,9 +173,10 @@ int panthor_device_init(struct panthor_device *ptdev)
> >   	if (!p)
> >   		return -ENOMEM;
> >   
> > -	ptdev->pm.dummy_latest_flush = page_address(p);
> > +	ptdev->pm.dummy_latest_flush = p;
> > +	dummy_page_virt = page_address(p);
> >   	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> > -				       ptdev->pm.dummy_latest_flush);
> > +				       dummy_page_virt);  
> 
> Nit: I was about to say I'd be inclined to switch the callback to 
> __free_page() instead, but then I realise there's no real need to be 
> reinventing that in the first place:
> 
> 	dummy_page_virt = (void *)devm_get_free_pages(ptdev->base.dev,
> 					GFP_KERNEL | GFP_ZERO, 0);
> 	if (!dummy_page_virt)
> 		return -ENOMEM;
> 
> 	ptdev->pm.dummy_latest_flush = virt_to_page(dummy_page_virt);

Queued to drm-misc-next after turning the free_page() into a
__free_page() in panthor_device_free_page(). If other drivers need to
allocate pages that are attached to the drm_device, we might want to
consider adding a drmm_get_free_pages() helper to drm_managed.h, but I
think we're the only ones to need that right now.

> 
> Cheers,
> Robin.
> 
> >   	if (ret)
> >   		return ret;
> >   
> > @@ -184,7 +186,7 @@ int panthor_device_init(struct panthor_device *ptdev)
> >   	 * happens while the dummy page is mapped. Zero cannot be used because
> >   	 * that means 'always flush'.
> >   	 */
> > -	*ptdev->pm.dummy_latest_flush = 1;
> > +	*dummy_page_virt = 1;
> >   
> >   	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
> >   	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> > @@ -353,7 +355,7 @@ static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
> >   		if (active)
> >   			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
> >   		else
> > -			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
> > +			pfn = page_to_pfn(ptdev->pm.dummy_latest_flush);
> >   		break;
> >   
> >   	default:
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 51c9d61b6796..c84c27dcc92c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -160,7 +160,7 @@ struct panthor_device {
> >   		 * Used to replace the real LATEST_FLUSH page when the GPU
> >   		 * is suspended.
> >   		 */
> > -		u32 *dummy_latest_flush;
> > +		struct page *dummy_latest_flush;
> >   	} pm;
> >   };
> >     

