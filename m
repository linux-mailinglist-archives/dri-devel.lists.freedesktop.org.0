Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON38BphQg2kalQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:58:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9EE6B91
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 14:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DA910E64C;
	Wed,  4 Feb 2026 13:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TzHv6l84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6695D10E133
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770213521;
 bh=k5UMXWgwFCcfrE3dxMlUTv7lURRvMh1vxVEAuRt2VgA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TzHv6l84ETnKx77sOQfP3C3p+0DEvzf0uI9mXUiO7YSl3w1FLFLvDz0IuvB5U+DMo
 sdUrTp2ykoSXEIpOtVJ+KQzZS2Aqgt61+uy53TvsLfkP9xrUmYydC6lZSA62FoRKA7
 8mCAbwxqMmAM/WdWLvrCuusWXhv63dBgAd67KU03aL/sPT1RXZkqTu7LVEq06zQ3dl
 TLilyt4k2t8pZrrSDUwWGbCHTCYYssFyhodIXA/mXvMYOHo3rogBLGi+vZpdc/zzSP
 XoemwdNDnx36fXM3P0XKWmzVFFgAFM0t14NsfMqkuwy4p2MpPJI+ioaWW+qI/TyKGB
 8ulU6EQCuYkcA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6EBDA17E13D3;
 Wed,  4 Feb 2026 14:58:41 +0100 (CET)
Date: Wed, 4 Feb 2026 14:58:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/4] drm/gem-shmem: Return vm_fault_t from
 drm_gem_shmem_try_map_pmd()
Message-ID: <20260204145835.2e98630c@fedora>
In-Reply-To: <20260204114341.195143-2-tzimmermann@suse.de>
References: <20260204114341.195143-1-tzimmermann@suse.de>
 <20260204114341.195143-2-tzimmermann@suse.de>
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
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 92B9EE6B91
X-Rspamd-Action: no action

On Wed,  4 Feb 2026 12:39:29 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Return the exact VM_FAULT_ mask from drm_gem_shmem_try_map_pmd(). Gives
> the caller better insight into the result. Return 0 if nothing was done.
> 
> If the caller sees VM_FAULT_NOPAGE, drm_gem_shmem_try_map_pmd() added a
> PMD entry to the page table. As before, return early from the page-fault
> handler in that case.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Matthew Wilcox <willy@infradead.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 3871a6d92f77..e7316dc7e921 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -550,8 +550,8 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  
> -static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
> -				      struct page *page)
> +static vm_fault_t drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
> +					    struct page *page)
>  {
>  #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>  	unsigned long pfn = page_to_pfn(page);
> @@ -562,12 +562,11 @@ static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
>  	    pmd_none(*vmf->pmd) &&
>  	    folio_test_pmd_mappable(page_folio(page))) {
>  		pfn &= PMD_MASK >> PAGE_SHIFT;
> -		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
> -			return true;
> +		return vmf_insert_pfn_pmd(vmf, pfn, false);
>  	}
>  #endif
>  
> -	return false;
> +	return 0;
>  }
>  
>  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> @@ -593,10 +592,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  		goto out;
>  	}
>  
> -	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
> -		ret = VM_FAULT_NOPAGE;
> +	ret = drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset]);
> +	if (ret == VM_FAULT_NOPAGE)
>  		goto out;
> -	}
>  
>  	pfn = page_to_pfn(pages[page_offset]);
>  	ret = vmf_insert_pfn(vma, vmf->address, pfn);

