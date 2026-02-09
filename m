Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCL/HvbqiWn1EAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:11:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137521101B8
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CAD10E3FE;
	Mon,  9 Feb 2026 14:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="N4ASDskM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33A10E3FE
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770646258;
 bh=XsTT1aouWN0PI0Cgpb6lDz1G8jjSfhV7436FJ8s5GG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N4ASDskMiPY2popv+86n5/fBaI+hHHWoWPPwXCdlbFGLIlrriRsIxHeCUwwIL/Eu2
 TDLigTyyaNj1q5chJhPcwbEupmfGnVuiHtMBK5dfAcBB95+UU6ouzABSa+tYpaDoOB
 pHn4cpQiSyGUo0wz6B4NncABL4NvKyvi4vqAn3mxq5gfzfsqroam4YoFGBv+5H/rV0
 M0L/bKN8O/aBz7+esuH69FdPVHIqBvOJ1A5GieFxfO0RIENvnPq28HOsSiC02LvdIb
 kNPhdwpW/+X+SRLJwjcpJou0aXcKHGDj+r/JlmFqQoOwRtfPFSeW8K7E60myI2m8g/
 ACIOlbVHSgMwA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A88B117E137B;
 Mon,  9 Feb 2026 15:10:57 +0100 (CET)
Date: Mon, 9 Feb 2026 15:10:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 2/6] drm/gem-shmem: Test for existence of page in
 mmap fault handler
Message-ID: <20260209151053.397844d9@fedora>
In-Reply-To: <20260209133241.238813-3-tzimmermann@suse.de>
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-3-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 137521101B8
X-Rspamd-Action: no action

On Mon,  9 Feb 2026 14:27:11 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Not having a page pointer in the mmap fault handler is an error. Test
> for this situation and return VM_FAULT_SIGBUS if so. Also replace several
> lookups of the page with a local variable.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 5bced7db0f1f..3ee54c24e535 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -574,31 +574,31 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> +	struct drm_device *dev = obj->dev;
>  	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>  	loff_t num_pages = obj->size >> PAGE_SHIFT;
> -	vm_fault_t ret;
> +	vm_fault_t ret = VM_FAULT_SIGBUS;
>  	struct page **pages = shmem->pages;
> -	pgoff_t page_offset;
> +	pgoff_t page_offset = vmf->pgoff - vma->vm_pgoff; /* page offset within VMA */
> +	struct page *page;
>  	unsigned long pfn;
>  
> -	/* Offset to faulty address in the VMA. */
> -	page_offset = vmf->pgoff - vma->vm_pgoff;
> -
>  	dma_resv_lock(obj->resv, NULL);
>  
> -	if (page_offset >= num_pages ||
> -	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
> -	    shmem->madv < 0) {
> -		ret = VM_FAULT_SIGBUS;
> +	if (page_offset >= num_pages || drm_WARN_ON_ONCE(dev, !shmem->pages) ||
> +	    shmem->madv < 0)
> +		goto out;
> +
> +	page = pages[page_offset];
> +	if (drm_WARN_ON_ONCE(dev, !page))
>  		goto out;
> -	}
>  
> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
> +	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, page)) {
>  		ret = VM_FAULT_NOPAGE;
>  		goto out;
>  	}
>  
> -	pfn = page_to_pfn(pages[page_offset]);
> +	pfn = page_to_pfn(page);
>  	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>  
>   out:

