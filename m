Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6CD1324B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5610E3EC;
	Mon, 12 Jan 2026 14:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bMcGgibK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F51410E3EC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768228326;
 bh=IDdL8KCjhVpaZ+ePlKNCVCHmcyiOkeq4Y88xMWoWFXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bMcGgibKQQ3ET99DjeJvHfVMPcZL+Nygb3nAc2sZza4vAOcbNuhFHHjT5Omro5khm
 W9Ypx41NsjmZ5UrBVt+YdtAHuimpQcb6xMqQXveusL5g4EKYhX9q7bAfWymGmfz6WU
 0j8xGBQ8B9S1T1FNPlQgUyBVDR/iDpK/i0Ua4/n+skgIU1RcVTG06ckjXG8u46i5Sx
 IGEf/MEtBOSWShgQuwRFfvRD0NwkOqDWOumVF8uQl7IcmBLAVOeGZVpSibX3tYHQ7W
 gfZj4NDduhFjhyDTn+sIdf3+iN4bWe6MH0ZvLPjhEGKne9P6b7zZng0T0MfMO5BanR
 Xaqo5KOPfEteQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E937817E13F1;
 Mon, 12 Jan 2026 15:32:05 +0100 (CET)
Date: Mon, 12 Jan 2026 15:32:00 +0100
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
Subject: Re: [PATCH v1 6/9] drm/panthor: Lazily allocate pages on mmap()
Message-ID: <20260112153200.30fd4e3e@fedora>
In-Reply-To: <37e36106-8d62-4915-a0e1-c7b283e0ff17@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-7-boris.brezillon@collabora.com>
 <37e36106-8d62-4915-a0e1-c7b283e0ff17@arm.com>
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

On Mon, 12 Jan 2026 12:15:13 +0000
Steven Price <steven.price@arm.com> wrote:

> On 09/01/2026 13:07, Boris Brezillon wrote:
> > Defer pages allocation until their first access.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gem.c | 119 ++++++++++++++++----------
> >  1 file changed, 75 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 0e52c7a07c87..44f05bd957e7 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -600,15 +600,6 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
> >  	if (is_cow_mapping(vma->vm_flags))
> >  		return -EINVAL;
> >  
> > -	dma_resv_lock(obj->resv, NULL);
> > -	ret = panthor_gem_backing_get_pages_locked(bo);
> > -	if (!ret)
> > -		ret = panthor_gem_prep_for_cpu_map_locked(bo);
> > -	dma_resv_unlock(obj->resv);
> > -
> > -	if (ret)
> > -		return ret;
> > -
> >  	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> >  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >  	if (should_map_wc(bo))
> > @@ -628,82 +619,122 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
> >  	return res;
> >  }
> >  
> > -static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
> > +static vm_fault_t insert_page(struct vm_fault *vmf, struct page *page)
> >  {
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	vm_fault_t ret;
> > +
> >  #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> >  	unsigned long pfn = page_to_pfn(page);
> >  	unsigned long paddr = pfn << PAGE_SHIFT;
> > -	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
> > +	bool aligned = (vmf->address & ~PMD_MASK) == (paddr & ~PMD_MASK);
> >  
> >  	if (aligned &&
> >  	    pmd_none(*vmf->pmd) &&
> >  	    folio_test_pmd_mappable(page_folio(page))) {
> >  		pfn &= PMD_MASK >> PAGE_SHIFT;
> > -		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
> > -			return true;
> > +		ret = vmf_insert_pfn_pmd(vmf, pfn, false);
> > +		if (ret == VM_FAULT_NOPAGE)
> > +			return VM_FAULT_NOPAGE;
> >  	}
> >  #endif
> >  
> > -	return false;
> > +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> >  }
> >  
> > -static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> > +static vm_fault_t nonblocking_page_setup(struct vm_fault *vmf, pgoff_t page_offset)
> >  {
> >  	struct vm_area_struct *vma = vmf->vma;
> > -	struct drm_gem_object *obj = vma->vm_private_data;
> >  	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> > -	loff_t num_pages = obj->size >> PAGE_SHIFT;
> >  	vm_fault_t ret;
> > -	pgoff_t page_offset;
> > -	unsigned long pfn;
> >  
> > -	/* Offset to faulty address in the VMA. */
> > -	page_offset = vmf->pgoff - vma->vm_pgoff;
> > +	if (!dma_resv_trylock(bo->base.resv))
> > +		return VM_FAULT_RETRY;
> >  
> > -	dma_resv_lock(bo->base.resv, NULL);
> > +	if (bo->backing.pages)
> > +		ret = insert_page(vmf, bo->backing.pages[page_offset]);
> > +	else
> > +		ret = VM_FAULT_RETRY;
> >  
> > -	if (page_offset >= num_pages ||
> > -	    drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
> > -		ret = VM_FAULT_SIGBUS;
> > -		goto out;
> > +	dma_resv_unlock(bo->base.resv);
> > +	return ret;
> > +}
> > +
> > +static vm_fault_t blocking_page_setup(struct vm_fault *vmf,
> > +				      struct panthor_gem_object *bo,
> > +				      pgoff_t page_offset, bool mmap_lock_held)
> > +{
> > +	vm_fault_t ret;
> > +	int err;
> > +
> > +	if (vmf->flags & FAULT_FLAG_INTERRUPTIBLE) {
> > +		err = dma_resv_lock_interruptible(bo->base.resv, NULL);
> > +		if (err)
> > +			return mmap_lock_held ? VM_FAULT_NOPAGE : VM_FAULT_RETRY;  
> 
> I'm not sure about this. First FAULT_FLAG_INTERRUPTIBLE is currently
> only used by userfaultfd AFAICT.

And GUP, which admittedly, only seems possible if one tries to map a
userpage in kernel space, and we don't support that (yet?).

> Second returning VM_FAULT_NOPAGE seems
> wrong - that's for the case were we've inserted a pte but in this case
> we haven't.

Got this from [1], and remember going through the fault handler API
with Akash, and finding something describing this case.

> 
> Otherwise I couldn't spot any issues staring at the code, but I might
> have missed something. mm code is always hard to follow!

It is, indeed, which is why I'm glad to have a new pair of eyes looking
at this ;-).

Thanks,

Boris

[1]https://elixir.bootlin.com/linux/v6.18.4/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L116

