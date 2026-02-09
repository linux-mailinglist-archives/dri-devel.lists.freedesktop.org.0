Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAN7Jn/uiWn4EQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A11103C6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102C210E0D6;
	Mon,  9 Feb 2026 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Kjz94qS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C15810E0D6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770647162;
 bh=Ai1JsGYjgTlQrc8eHRH5768OPEiwDY59ubtKITTwQmM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kjz94qS9b1XfBmF8cr96hN0kMuxaGtIwA3eZJoiUF+nrcz6ssLOHR4NwypNNeGLYE
 x5ypN6Sn7uiu3tuB959nEx5vPsxPhMjWzr5bBENEh2S/fgX3Rd4n3EXosnVtrB08UH
 RMCT88SgNOmIWAUHVLW+H44kFZwgp0FRNrbitmOUbYamcnwe+fVG2b0JJiO6XmXakG
 K0wLFtZI1bngLjI7IZHWICbog1Id7gG9tUrGGb7Wn6vRuUZVKFeN6mcd+0xz5E/Hbr
 YnYspRIsly78xk4/LB3yNvrmhTuwrVN2DBR0LEwW2QzTPyr6p8MOKDCdrzIRufgBT6
 Gop3C1/1K/W4g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 824D017E140E;
 Mon,  9 Feb 2026 15:26:01 +0100 (CET)
Date: Mon, 9 Feb 2026 15:25:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 4/6] drm/gem-shmem: Refactor drm_gem_shmem_try_map_pmd()
Message-ID: <20260209152556.636825c6@fedora>
In-Reply-To: <20260209133241.238813-5-tzimmermann@suse.de>
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-5-tzimmermann@suse.de>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,kvack.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: EC8A11103C6
X-Rspamd-Action: no action

On Mon,  9 Feb 2026 14:27:13 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> The current mmap page-fault handler requires some changes before it
> can track folio access.
> 
> Call to folio_test_pmd_mappable() into the mmap page-fault handler
> before calling drm_gem_shmem_try_map_pmd(). The folio will become
> useful for tracking the access status.
> 
> Also rename drm_gem_shmem_try_map_pmd() to _try_insert_pfn_pmd()
> and only pass the page fault and page-frame number. The new name and
> parameters make it similar to vmf_insert_pfn_pmd().
> 
> No functional changes. If PMD mapping fails or is not supported,
> insert a regular PFN as before.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index ab8e331005f9..c3a054899ba3 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -550,17 +550,14 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  
> -static vm_fault_t drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
> -					    struct page *page)
> +static vm_fault_t drm_gem_shmem_try_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn)
>  {
>  #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> -	unsigned long pfn = page_to_pfn(page);
>  	unsigned long paddr = pfn << PAGE_SHIFT;
> -	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
> +	bool aligned = (vmf->address & ~PMD_MASK) == (paddr & ~PMD_MASK);
>  
> -	if (aligned &&
> -	    pmd_none(*vmf->pmd) &&
> -	    folio_test_pmd_mappable(page_folio(page))) {
> +	if (aligned && pmd_none(*vmf->pmd)) {
> +		/* Read-only mapping; split upon write fault */
>  		pfn &= PMD_MASK >> PAGE_SHIFT;
>  		return vmf_insert_pfn_pmd(vmf, pfn, false);
>  	}
> @@ -580,6 +577,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	struct page **pages = shmem->pages;
>  	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
>  	struct page *page;
> +	struct folio *folio;
>  	unsigned long pfn;
>  
>  	dma_resv_lock(obj->resv, NULL);
> @@ -591,15 +589,16 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	page = pages[page_offset];
>  	if (drm_WARN_ON_ONCE(dev, !page))
>  		goto out;
> -
> -	ret = drm_gem_shmem_try_map_pmd(vmf, vmf->address, page);
> -	if (ret == VM_FAULT_NOPAGE)
> -		goto out;
> +	folio = page_folio(page);
>  
>  	pfn = page_to_pfn(page);
> -	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>  
> - out:
> +	if (folio_test_pmd_mappable(folio))
> +		ret = drm_gem_shmem_try_insert_pfn_pmd(vmf, pfn);
> +	if (ret != VM_FAULT_NOPAGE)
> +		ret = vmf_insert_pfn(vma, vmf->address, pfn);
> +
> +out:
>  	dma_resv_unlock(obj->resv);
>  
>  	return ret;

