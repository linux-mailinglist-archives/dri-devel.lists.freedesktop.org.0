Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7062B635
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5010E44B;
	Wed, 16 Nov 2022 09:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904F110E449
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:17:05 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ovEXX-0003ay-9Z; Wed, 16 Nov 2022 10:17:03 +0100
Message-ID: <a105ba6089f77f1c3b8310b06815cb733eb7841c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: switch to PFN mappings
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Date: Wed, 16 Nov 2022 10:17:02 +0100
In-Reply-To: <20220909092044.3441775-1-l.stach@pengutronix.de>
References: <20220909092044.3441775-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 09.09.2022 um 11:20 +0200 schrieb Lucas Stach:
> There is no reason to use page based mappings, as the established
> mappings are special driver mappings anyways and should not be
> handled like normal pages.
> 
> Be consistent with what other drivers do and use raw PFN based
> mappings.

Anyone up for reviewing this? Basically it moves etnaviv closer to what
all the other DRM drivers are doing.

Regards,
Lucas

> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index d45bf0368339..68e4446a94ad 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -130,7 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
>  {
>  	pgprot_t vm_page_prot;
>  
> -	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
> +	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>  
>  	vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  
> @@ -165,7 +165,8 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
>  	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> -	struct page **pages, *page;
> +	struct page **pages;
> +	unsigned long pfn;
>  	pgoff_t pgoff;
>  	int err;
>  
> @@ -189,12 +190,12 @@ static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
>  	/* We don't use vmf->pgoff since that has the fake offset: */
>  	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>  
> -	page = pages[pgoff];
> +	pfn = page_to_pfn(pages[pgoff]);
>  
>  	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
> -	     page_to_pfn(page), page_to_pfn(page) << PAGE_SHIFT);
> +	     pfn, pfn << PAGE_SHIFT);
>  
> -	return vmf_insert_page(vma, vmf->address, page);
> +	return vmf_insert_pfn(vma, vmf->address, pfn);
>  }
>  
>  int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset)


