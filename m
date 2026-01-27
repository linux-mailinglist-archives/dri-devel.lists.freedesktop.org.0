Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKrKKlLfeGkGtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:52:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22897202
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29EB10E592;
	Tue, 27 Jan 2026 15:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q/qL2+gL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F5310E592
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769529164;
 bh=Ma9DUQK/UE5KKiJVITo3EgKsfU16YIafflssOe2kpFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q/qL2+gLej/GQpukA/veuC+5qzdUsML/gqM+1q8cw8b+dcy1RhJb6HbGJumTlmiw4
 fWyvYjHkwS2hNODt1/xc4m1QGf2BN441uY3RDzIQp3c2/oPL/y+imFySjWNiXORJXF
 32gsNg3wa3d/M8jGCmmU4W+wbOIzehGzxclt9IG2YmJ4sF18nECXULAicvq4E3kv36
 myQ5kilkTToaX13twmBXrfSFaVYtVQgcJjKMk24FzheJgd0u3zg88M0gd5aUDYPFPk
 95E5ssq/GWaAlad4AVoOKV0tSr/T+S3/7iUv9grTzTVjmu17xOFYNDFArFk7TEVoz6
 J5IBpGjDh5SqQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B0D717E012E;
 Tue, 27 Jan 2026 16:52:44 +0100 (CET)
Date: Tue, 27 Jan 2026 16:52:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, frank.binns@imgtec.com, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/3] drm/gem-shmem: Track folio accessed/dirty status in
 mmap
Message-ID: <20260127165239.78f3dde6@fedora>
In-Reply-To: <20260127132938.429288-3-tzimmermann@suse.de>
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-3-tzimmermann@suse.de>
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 1A22897202
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 14:16:37 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Invoke folio_mark_accessed() in mmap page faults to add the folio to
> the memory manager's LRU list. Userspace invokes mmap to get the memory
> for software rendering. Later compositors will do the same to create the
> final on-screen image, so keeping the pages in LRU makes sense. Avoids
> paging out graphics buffers when under memory pressure.
> 
> In page_mkwrite, further invoke the folio_mark_dirty() to add the folio
> for writeback, should the underlying file be paged out from system memory.
> This rarely happens in practice, yet it would corrupt the buffer content.
> 
> This has little effect on a system's hardware-accelerated rendering, which
> only mmaps for an initial setup of textures, meshes, shaders, etc.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index b6ddabbfcc52..30cd34d3a111 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -562,8 +562,10 @@ static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
>  
>  		if (folio_test_pmd_mappable(folio)) {
>  			/* Read-only mapping; split upon write fault */
> -			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE)
> +			if (vmf_insert_folio_pmd(vmf, folio, false) == VM_FAULT_NOPAGE) {
> +				folio_mark_accessed(folio);
>  				return true;
> +			}
>  		}
>  	}
>  #endif
> @@ -605,6 +607,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  		get_page(page);
>  
>  		folio_lock(folio);
> +		folio_mark_accessed(folio);
>  
>  		vmf->page = page;
>  		ret = VM_FAULT_LOCKED;
> @@ -653,10 +656,23 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
>  	drm_gem_vm_close(vma);
>  }
>  
> +static vm_fault_t drm_gem_shmem_page_mkwrite(struct vm_fault *vmf)
> +{
> +	struct folio *folio = page_folio(vmf->page);
> +
> +	file_update_time(vmf->vma->vm_file);
> +
> +	folio_lock(folio);
> +	folio_mark_dirty(folio);
> +
> +	return VM_FAULT_LOCKED;
> +}
> +
>  const struct vm_operations_struct drm_gem_shmem_vm_ops = {
>  	.fault = drm_gem_shmem_fault,
>  	.open = drm_gem_shmem_vm_open,
>  	.close = drm_gem_shmem_vm_close,
> +	.page_mkwrite = drm_gem_shmem_page_mkwrite,
>  };
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
>  

