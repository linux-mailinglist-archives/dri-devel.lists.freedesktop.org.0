Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC36D1436F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A040810E421;
	Mon, 12 Jan 2026 16:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UThJTTKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5280B10E421
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768237177;
 bh=OTu08QbRf5g0XMTPJ8gP2PEQflZLtZN4iLdt6rK1uTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UThJTTKkqmZlwVN+A41aJzwLmVdJmJDzVCKKqzkuxGBjnFmX61lvzlU2AhYLySl3u
 Rfh5C7pJPVScfnZS7Fhk4ihvyoGDIQ8fNPzqHg9fUx5GdxFacOaJ1rKxA5fvX/v6KU
 HqSCw3Dh47pIB8RYMDXmf0UBhm++hxTPqByoQdZBEgJW3ie9z5s+QrZXm2bTJ1/O1Z
 foj8OVrowJjncJx7kUW3ZPGTCS76sQbBNJM/umymwh6cDj/lBcgYdScLNQ5SVsv+//
 xRwxHyKzy5mI9T9Vvg/Bel/QmJ+wFZzV86D5CA5fjSNave10eKfXGp83oNNF+Kk3XO
 Yax14svlG2X0w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AF9817E13F1;
 Mon, 12 Jan 2026 17:59:37 +0100 (CET)
Date: Mon, 12 Jan 2026 17:59:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
Message-ID: <20260112175931.541cc086@fedora>
In-Reply-To: <3c1b791c-f2e6-4199-af6c-920f52f4870c@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
 <3c1b791c-f2e6-4199-af6c-920f52f4870c@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 12 Jan 2026 16:49:33 +0000
Steven Price <steven.price@arm.com> wrote:

> On 12/01/2026 14:39, Boris Brezillon wrote:
> > On Mon, 12 Jan 2026 12:33:33 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 09/01/2026 13:08, Boris Brezillon wrote:  
> >>> This will be used to order things by reclaimability.
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>>  drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++++--
> >>>  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> >>>  2 files changed, 45 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> >>> index 44f05bd957e7..458d22380e96 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> >>> @@ -484,6 +484,7 @@ static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
> >>>  	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
> >>>  			  refcount_read(&bo->cmap.vaddr_use_count));
> >>>  	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
> >>> +	drm_printf_indent(p, indent, "mmap_count=%u\n", refcount_read(&bo->cmap.mmap_count));
> >>>  }
> >>>  
> >>>  static int panthor_gem_pin_locked(struct drm_gem_object *obj)
> >>> @@ -600,6 +601,13 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
> >>>  	if (is_cow_mapping(vma->vm_flags))
> >>>  		return -EINVAL;
> >>>  
> >>> +	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> >>> +		dma_resv_lock(obj->resv, NULL);
> >>> +		if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
> >>> +			refcount_set(&bo->cmap.mmap_count, 1);
> >>> +		dma_resv_unlock(obj->resv);
> >>> +	}
> >>> +
> >>>  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> >>>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >>>  	if (should_map_wc(bo))
> >>> @@ -732,10 +740,42 @@ static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> >>>  	return blocking_page_setup(vmf, bo, page_offset, true);
> >>>  }
> >>>  
> >>> +static void panthor_gem_vm_open(struct vm_area_struct *vma)
> >>> +{
> >>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> >>> +
> >>> +	/* mmap_count must have been incremented at mmap time, so it can't be
> >>> +	 * zero here.
> >>> +	 */
> >>> +	if (!drm_gem_is_imported(&bo->base))
> >>> +		drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cmap.mmap_count));
> >>> +
> >>> +	drm_gem_vm_open(vma);
> >>> +}
> >>> +
> >>> +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> >>> +{
> >>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> >>> +
> >>> +	if (drm_gem_is_imported(&bo->base))
> >>> +		goto out;
> >>> +
> >>> +	if (refcount_dec_not_one(&bo->cmap.mmap_count))
> >>> +		goto out;
> >>> +
> >>> +	dma_resv_lock(bo->base.resv, NULL);
> >>> +	if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> >>> +		refcount_set(&bo->cmap.mmap_count, 0);
> >>> +	dma_resv_unlock(bo->base.resv);    
> >>
> >> I don't think this logic is safe. Holding the resv_lock doesn't protect
> >> against another thread doing a refcount_inc_not_zero() without holding
> >> the lock.
> >>
> >> I think you can just replace the if() part with a refcount_dec() call,
> >> the lock AFAICT is needed because the following patch wants to be sure
> >> that !!mmap_count is stable when resv_lock is held.  
> > 
> > I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 without
> > complaining :P.  
> 
> Yeah, I misread the refcount_dec() code the first time I looked at it.
> 
> >>
> >> I also feel you should invert the conditino for refcount_dec_not_one,
> >> leading to the following which I feel is easier to read:
> >>
> >> static void panthor_gem_vm_close(struct vm_area_struct *vma)
> >> {
> >> 	[...]
> >>
> >> 	if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> >> 		dma_resv_lock(bo->base.resv, NULL);
> >> 		refcount_dec(&bo->cmap.mmap_count);
> >> 		dma_resv_unlock(bo->base.resv);
> >> 	}  
> > 
> > The best I can do is:
> > 
> >  	if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> >  		dma_resv_lock(bo->base.resv, NULL);
> >  		if (!refcount_dec_not_one(&bo->cmap.mmap_count))  
> 
> The problem is here - if another thread does an increment from 1 to 2 at
> this point then we lose a reference count. And since you don't have to
> hold the lock for that we have a problem.

Okay, I see what you mean now. I was considering 0 -> 1, not 1 -> 2. So
we really need a

		if (refcount_dec_and_test(&bo->cmap.mmap_count))
			/* Do nothing */;

> 
> > 			refcount_set(&bo->cmap.mmap_count, 0);
> >  		dma_resv_unlock(bo->base.resv);
> >  	}
> > 
> > so we only take the lock when absolutely needed, but the 1 -> 0
> > transition still has to be done with "if (dec_not_one) set(0)".  
> 
> It's not the holding of the lock that's concerning me - it's the fact
> that the increment part might not be holding the lock.
> 
> Your suggestion of "(void)refcount_dec_and_test()" would work, but it's
> rather abusing the API. I can't help feeling this points to the refcount
> API being the wrong thing to be using...
> 
> Thanks,
> Steve
> 
> >>
> >> 	drm_gem_object_put(&bo->base);
> >> }  
> 

