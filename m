Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA2HJoPPeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:45:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC695EEF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804D810E0B9;
	Tue, 27 Jan 2026 14:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PBsVC6sE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115A210E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769525117;
 bh=t4KCn5AVvj1rVtR81P9mAeQidZIfz5aUPhgtLJ6zXvs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBsVC6sEXH+SbnMLH2IJ5M7Wj/ZkkJugxUmVjUgiIFeib4qz4FNcyPA92uoQ3ajSZ
 3Euln0XLHJYw7BibSC/+Ar+jArLoJW4pNQBNaXkHOjfE3xbOI10lW+Qm4LMPesljc3
 k/DqO4TgiXTL2/+5CvGdMCsk6KH7CVvRMSqVuzozY9LP85K8b+ogc2izUSk3qvuH5K
 xy1Tc7gvhawgH3rV63/lNiPTNrfp3yOlNMl0kksWhba7fIpux8fx+3oS9Mx8Yfg8iT
 HUyi5F01xUzfl5wilK1Ite8lN7VI0OXDNDz5/6WsEcYYiIbakKSBOQoP8I7+CgS58o
 ie4Lm3IEF+uOw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 15E1617E0182;
 Tue, 27 Jan 2026 15:45:17 +0100 (CET)
Date: Tue, 27 Jan 2026 15:45:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, frank.binns@imgtec.com, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/3] drm/gem-shmem: Map pages in mmap fault handler
Message-ID: <20260127154511.6e2b9008@fedora>
In-Reply-To: <20260127132938.429288-2-tzimmermann@suse.de>
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-2-tzimmermann@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:loic.molinari@collabora.com,m:willy@infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 00EC695EEF
X-Rspamd-Action: no action

Hello Thomas,

On Tue, 27 Jan 2026 14:16:36 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Gem-shmem operates on pages instead of I/O memory ranges, so use them
> for mmap. This will allow for tracking page dirty/accessed flags. If
> hugepage support is available, insert the page's folio if possible.
> Otherwise fall back to mapping individual pages.
> 
> As the PFN is no longer required for hugepage mappings, simplify the
> related code and make it depend on CONFIG_TRANSPARENT_HUGEPAGE. Prepare
> for tracking folio status.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 58 ++++++++++++++++----------
>  1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 3871a6d92f77..b6ddabbfcc52 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -553,17 +553,18 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
>  				      struct page *page)
>  {
> -#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> -	unsigned long pfn = page_to_pfn(page);
> -	unsigned long paddr = pfn << PAGE_SHIFT;
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	phys_addr_t paddr = page_to_phys(page);
>  	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
>  
> -	if (aligned &&
> -	    pmd_none(*vmf->pmd) &&
> -	    folio_test_pmd_mappable(page_folio(page))) {
> -		pfn &= PMD_MASK >> PAGE_SHIFT;
> -		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
> -			return true;
> +	if (aligned && pmd_none(*vmf->pmd)) {
> +		struct folio *folio = page_folio(page);
> +
> +		if (folio_test_pmd_mappable(folio)) {
> +			/* Read-only mapping; split upon write fault */
> +			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE)
> +				return true;
> +		}
>  	}
>  #endif
>  
> @@ -576,13 +577,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>  	loff_t num_pages = obj->size >> PAGE_SHIFT;
> -	vm_fault_t ret;
>  	struct page **pages = shmem->pages;
> -	pgoff_t page_offset;
> -	unsigned long pfn;
> -
> -	/* Offset to faulty address in the VMA. */
> -	page_offset = vmf->pgoff - vma->vm_pgoff;
> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
> +	struct page *page = pages[page_offset];
> +	vm_fault_t ret;
>  
>  	dma_resv_lock(shmem->base.resv, NULL);
>  
> @@ -590,21 +588,35 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
>  	    shmem->madv < 0) {
>  		ret = VM_FAULT_SIGBUS;
> -		goto out;
> +		goto err_dma_resv_unlock;
>  	}
>  
> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
> -		ret = VM_FAULT_NOPAGE;
> -		goto out;
> +	page = pages[page_offset];
> +	if (!page) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto err_dma_resv_unlock;
>  	}
>  
> -	pfn = page_to_pfn(pages[page_offset]);
> -	ret = vmf_insert_pfn(vma, vmf->address, pfn);
> +	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
> +		ret = VM_FAULT_NOPAGE;
> +	} else {
> +		struct folio *folio = page_folio(page);
> +
> +		get_page(page);
> +
> +		folio_lock(folio);
> +
> +		vmf->page = page;
> +		ret = VM_FAULT_LOCKED;
> +	}
>  
> - out:
>  	dma_resv_unlock(shmem->base.resv);
>  
>  	return ret;
> +
> +err_dma_resv_unlock:
> +	dma_resv_unlock(shmem->base.resv);
> +	return ret;

Why do we need an error path that's exactly the same as the success
path?

>  }
>  
>  static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
> @@ -691,7 +703,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  	if (ret)
>  		return ret;
>  
> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	if (shmem->map_wc)
>  		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);

The rest looks reasonable, if everyone is happy with the less
restrictive aspect that !PFNMAP implies, as mentioned by Matthew.
