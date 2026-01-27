Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sADeG5rEeGmltAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:58:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2C953E2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FDB10E577;
	Tue, 27 Jan 2026 13:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="KKzs1nK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAD510E577
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kdnlZ37lmKmZVNr3z6aMCYrl4A2jHiwhyr3lXYvek2E=; b=KKzs1nK7CqxQ6Lu8ymAWaKEtRP
 wEq3oCMfpzb7+LRqUaJnsVtkkr3PwQ6g7FeZDECp6Zoqrs00SzriOJ893+QxxSyNXY9KSDykrXeUm
 qGGGDghmEL0KUmoykXPqPvlng3/8OrwDYMI+vw4vplrX3s+xMmPNHoLkOBUddll3I6XO7PO0YJU9J
 2tnbiQ//BSfvLb1yPcE1A29VWYDq/BQv1SO4ahwsKnxSOVhlIo2VhNm6LQOe6cTpFV/sb43+gcdob
 p33KcORvPtmaE7IZJKfAu3gz5qbMkSNhE52wVJuXPPnnEPXeeKRcDatyshuHFkLG/EJYmm8QBp9Lj
 bEuL+Lwg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vkjaX-00000007WS2-3JcC;
 Tue, 27 Jan 2026 13:58:37 +0000
Date: Tue, 27 Jan 2026 13:58:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: boris.brezillon@collabora.com, loic.molinari@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, frank.binns@imgtec.com,
 matt.coster@imgtec.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/3] drm/gem-shmem: Map pages in mmap fault handler
Message-ID: <aXjEjaYsqo6oIsAl@casper.infradead.org>
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127132938.429288-2-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[willy@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0CF2C953E2
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 02:16:36PM +0100, Thomas Zimmermann wrote:
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

It would feel more natural to me to have this function return vm_fault_t
instead of a bool.  What do you think?

> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
> +	struct page *page = pages[page_offset];
> +	vm_fault_t ret;

[...]

> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
> -		ret = VM_FAULT_NOPAGE;
> -		goto out;
> +	page = pages[page_offset];

Can page_offset have changed at this point?

> +	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
> +		ret = VM_FAULT_NOPAGE;
> +	} else {
> +		struct folio *folio = page_folio(page);
> +
> +		get_page(page);

folio_get(folio);

> -	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +	vm_flags_mod(vma, VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);

Just so you know, this is going to change observable behaviour, maybe
in a good way.  For example, we'll now be able to do O_DIRECT I/O to
this range and ptrace accesses.  I think everything will be fine, but
VM_PFNMAP does prohibit some things which are now allowed.
