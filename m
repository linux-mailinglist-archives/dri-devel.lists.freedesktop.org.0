Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9B3EA51D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 15:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0DD6E3F4;
	Thu, 12 Aug 2021 13:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D946E3F4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:05:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so4512633wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qr6f4k77kHnXw8xt8qMGKu5RU6zaq/z/nsP/XUbddOI=;
 b=S8XNQia+ZM5EbgOkxCHSGoHCjnu/BgLnrsRK8/FcxJUaM9sI8ReQ3TBIjptxBoo933
 Gp3yoqMG77GXguhWyTax/t84ClfnwMnixComvk24Dz32LRrxHGZj5MEEdMO1HBCy9l4L
 G4ymr21DFv88VV4M/m/ZzUDDzer4/v3JSNT7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qr6f4k77kHnXw8xt8qMGKu5RU6zaq/z/nsP/XUbddOI=;
 b=JlJBKG3Uf1TsWmNqoBk4hRtGlgSHpUp/r5RweCt3Pe2A5n9bOQqlw6A6vj2J7ReXhT
 iwQxe2qhpOm+SnStKDeyH9Go5JUrS6RurnrBcGveQgdDHTeof59kgG48LR8txk0PdzYe
 0SJi0g7WEvOsbNcdtyHkP9Yp7O4NNogKJ1h5sCb67dCPJJe0s2tGcC4nZtqWmVD4WHzU
 0XWb2OcbfYgokrDHbOMeaLhJU6mEf2ORTnDTvz2B0k11YM/emlSxx8hOrItLJVP+omLM
 cf90chPwbp4D9VswTYGElV3utQ4EmQP/jqnVdiug0BbDfKt/W7BVZTjRHAqJhiH4cJ+D
 tT1w==
X-Gm-Message-State: AOAM532iyFxFIZbaX4+aNu8206CHy0uK2YQvb3/5TJwl+vEkD5jYS7Cr
 moAufQH/IMKhLM7bTRLPuXC8XA==
X-Google-Smtp-Source: ABdhPJxiQHyS7qvybweMVTTp40D1ZYBnokPSEkDVj1mJeN/PbBMYt8p3DQ3M0FVsyRQmnVN/TIzmEw==
X-Received: by 2002:a05:600c:1c28:: with SMTP id
 j40mr3052396wms.104.1628773536306; 
 Thu, 12 Aug 2021 06:05:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k186sm11206897wme.45.2021.08.12.06.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:05:35 -0700 (PDT)
Date: Thu, 12 Aug 2021 15:05:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH v4 2/4] drm/shmem-helper: Switch to vmf_insert_pfn
Message-ID: <YRUcnaebyqhAcYLr@phenom.ffwll.local>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
 <20210713205153.1896059-3-daniel.vetter@ffwll.ch>
 <573242f9-a29e-73d9-3efb-51c436d636fd@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <573242f9-a29e-73d9-3efb-51c436d636fd@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Jul 22, 2021 at 08:22:43PM +0200, Thomas Zimmermann wrote:
> Hi,
> 
> I'm not knowledgeable enougth to give this a full review. If you can just
> answer my questions, fell free to add an
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> to the patch. :)
> 
> Am 13.07.21 um 22:51 schrieb Daniel Vetter:
> > We want to stop gup, which isn't the case if we use vmf_insert_page
> 
> What is gup?
> 
> > and VM_MIXEDMAP, because that does not set pte_special.
> > 
> > v2: With this shmem gem helpers now definitely need CONFIG_MMU (0day)
> > 
> > v3: add more depends on MMU. For usb drivers this is a bit awkward,
> > but really it's correct: To be able to provide a contig mapping of
> > buffers to userspace on !MMU platforms we'd need to use the cma
> > helpers for these drivers on those platforms. As-is this wont work.
> > 
> > Also not exactly sure why vm_insert_page doesn't go boom, because that
> > definitely wont fly in practice since the pages are non-contig to
> > begin with.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >   drivers/gpu/drm/Kconfig                | 2 +-
> >   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
> >   drivers/gpu/drm/gud/Kconfig            | 2 +-
> >   drivers/gpu/drm/tiny/Kconfig           | 4 ++--
> >   drivers/gpu/drm/udl/Kconfig            | 1 +
> >   5 files changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > index 0d372354c2d0..314eefa39892 100644
> > --- a/drivers/gpu/drm/Kconfig
> > +++ b/drivers/gpu/drm/Kconfig
> > @@ -211,7 +211,7 @@ config DRM_KMS_CMA_HELPER
> >   config DRM_GEM_SHMEM_HELPER
> >   	bool
> > -	depends on DRM
> > +	depends on DRM && MMU
> >   	help
> >   	  Choose this if you need the GEM shmem helper functions
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index d5e6d4568f99..296ab1b7c07f 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -542,7 +542,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> >   	} else {
> >   		page = shmem->pages[page_offset];
> > -		ret = vmf_insert_page(vma, vmf->address, page);
> > +		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> >   	}
> >   	mutex_unlock(&shmem->pages_lock);
> > @@ -612,7 +612,7 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> >   		return ret;
> >   	}
> > -	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
> > +	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND;
> >   	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >   	if (shmem->map_wc)
> >   		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
> > index 1c8601bf4d91..9c1e61f9eec3 100644
> > --- a/drivers/gpu/drm/gud/Kconfig
> > +++ b/drivers/gpu/drm/gud/Kconfig
> > @@ -2,7 +2,7 @@
> >   config DRM_GUD
> >   	tristate "GUD USB Display"
> > -	depends on DRM && USB
> > +	depends on DRM && USB && MMU
> >   	select LZ4_COMPRESS
> >   	select DRM_KMS_HELPER
> >   	select DRM_GEM_SHMEM_HELPER
> 
> I'm a kconfig noob, so this is rather a question than a review comment:
> 
> 
> 
> If DRM_GEM_SHMEM_HELPER already depends on MMU, this select will fail on
> non-MMU platforms? Why does the driver also depend on MMU? Simply to make
> the item disappear in menuconfig?

I totally missed this somehow. vmf_insert_pfn functions only exists for
MMU based system. So we can't compile vgem without that. And yes it just
makes it disappear.

tbh I'm not sure it even worked with the old code, because on !MMU
platforms it's the mmap's implementation job to make sure the pages are
physically contiguous. There's another mmap related callback which should
return the physical address where the memory starts.

The cma helpers otoh should work on !MMU platforms, because they will give
us a physically contig memory region.
-Daniel

> 
> Best regards
> Thomas
> 
> > diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> > index 5593128eeff9..c11fb5be7d09 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -44,7 +44,7 @@ config DRM_CIRRUS_QEMU
> >   config DRM_GM12U320
> >   	tristate "GM12U320 driver for USB projectors"
> > -	depends on DRM && USB
> > +	depends on DRM && USB && MMU
> >   	select DRM_KMS_HELPER
> >   	select DRM_GEM_SHMEM_HELPER
> >   	help
> > @@ -53,7 +53,7 @@ config DRM_GM12U320
> >   config DRM_SIMPLEDRM
> >   	tristate "Simple framebuffer driver"
> > -	depends on DRM
> > +	depends on DRM && MMU
> >   	select DRM_GEM_SHMEM_HELPER
> >   	select DRM_KMS_HELPER
> >   	help
> > diff --git a/drivers/gpu/drm/udl/Kconfig b/drivers/gpu/drm/udl/Kconfig
> > index 1f497d8f1ae5..c744175c6992 100644
> > --- a/drivers/gpu/drm/udl/Kconfig
> > +++ b/drivers/gpu/drm/udl/Kconfig
> > @@ -4,6 +4,7 @@ config DRM_UDL
> >   	depends on DRM
> >   	depends on USB
> >   	depends on USB_ARCH_HAS_HCD
> > +	depends on MMU
> >   	select DRM_GEM_SHMEM_HELPER
> >   	select DRM_KMS_HELPER
> >   	help
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
