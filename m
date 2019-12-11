Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BA11AB0D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325AD6EB33;
	Wed, 11 Dec 2019 12:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414966EB31
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:36:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so2457748wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PzIo/7Q35YMn7hqu2gyhjmIOlK0rB4TWN3eOKjhwRgA=;
 b=KTmzGyQlhvUpLrDS1bbfx86H9uvBOJsXGBJR4vGd7i6bDMCbOCLbMQNxur5X1yVIz2
 LGCoDW3r3DDmrbEk+6mGKT1WT8yziAX2Zd9KyxSeGGe3Zna3AHiKrAsdK/xp2XKGUvAz
 SSf/Q6anG/WrR0NYryOZPvdlwBPefMuv9hGuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=PzIo/7Q35YMn7hqu2gyhjmIOlK0rB4TWN3eOKjhwRgA=;
 b=PbE/JyYRrQAx1f+ma2ox5bk+G01BPjMlVTEeCPFn8fyO2TbogNZPwpQWxOkEPrZEmN
 B8Qd8koq/rPy8IgWo0CAakkh8Xa8DSMrnGl0ZL9Yl81bePm31iLWki+z8NPK6Ki0y4Cp
 oVAyyZ0uWLgq7djxhFwsjJRAuGy2wdpYwqzC1t3a6qDqpFZ6OLyvux4TCGJ6pNNQBGKw
 Qfv+2jddf9TrlREV9VBYxXE3PWS0XnBMXuPLmdy4kQMdgELWF/U37BQN1eMa4X9KYpWc
 HvZjzRFPCAU7nxBa1m7dwDNHIeFbrGbuoR1jmckL7Z+S4IkgwM7KzmFhPpc2TK9+Y1b2
 MH3A==
X-Gm-Message-State: APjAAAUMG5u9EOgIE1siLxYWdY4eJ3CQomPrG2Prmd/WS82kJLn4AhPP
 ZPOlP8X6iGKQFRQ4lNRFZX6MOg==
X-Google-Smtp-Source: APXvYqxEXxUWDtey3eMD1EC5zrNfQYCvUKw9iVpYTScQKTexusgNyu+PW7SoKPBIjtVjbZ8r+PoRyg==
X-Received: by 2002:a1c:9988:: with SMTP id b130mr3336357wme.22.1576067798701; 
 Wed, 11 Dec 2019 04:36:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id f207sm1600141wme.9.2019.12.11.04.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 04:36:37 -0800 (PST)
Date: Wed, 11 Dec 2019 13:36:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
Message-ID: <20191211123635.GY624164@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
 <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, gurchetansingh@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 11:07:25AM +0100, Thomas Zimmermann wrote:
> =

> =

> Am 11.12.19 um 10:58 schrieb Thomas Zimmermann:
> > Hi Gerd
> > =

> > Am 11.12.19 um 09:18 schrieb Gerd Hoffmann:
> >> Add caching field to drm_gem_shmem_object to specify the cachine
> >> attributes for mappings.  Add helper function to tweak pgprot
> >> accordingly.  Switch vmap and mmap functions to the new helper.
> >>
> >> Set caching to write-combine when creating the object so behavior
> >> doesn't change by default.  Drivers can override that later if
> >> needed.
> >>
> >> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > =

> > If you want to merge this patch, you have my
> > =

> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > Please see my comment below.
> > =

> >> ---
> >>  include/drm/drm_gem_shmem_helper.h     | 12 ++++++++++++
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 24 +++++++++++++++++++++---
> >>  2 files changed, 33 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_=
shmem_helper.h
> >> index 6748379a0b44..9d6e02c6205f 100644
> >> --- a/include/drm/drm_gem_shmem_helper.h
> >> +++ b/include/drm/drm_gem_shmem_helper.h
> >> @@ -17,6 +17,11 @@ struct drm_mode_create_dumb;
> >>  struct drm_printer;
> >>  struct sg_table;
> >>  =

> >> +enum drm_gem_shmem_caching {
> >> +	DRM_GEM_SHMEM_CACHED =3D 1,
> >> +	DRM_GEM_SHMEM_WC,
> >> +};
> >> +
> >>  /**
> >>   * struct drm_gem_shmem_object - GEM object backed by shmem
> >>   */
> >> @@ -83,6 +88,11 @@ struct drm_gem_shmem_object {
> >>  	 * The address are un-mapped when the count reaches zero.
> >>  	 */
> >>  	unsigned int vmap_use_count;
> >> +
> >> +	/**
> >> +	 * @caching: caching attributes for mappings.
> >> +	 */
> >> +	enum drm_gem_shmem_caching caching;
> >>  };
> >>  =

> >>  #define to_drm_gem_shmem_obj(obj) \
> >> @@ -130,6 +140,8 @@ drm_gem_shmem_prime_import_sg_table(struct drm_dev=
ice *dev,
> >>  =

> >>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *o=
bj);
> >>  =

> >> +pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pg=
prot_t prot);
> >> +
> >>  /**
> >>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations
> >>   *
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
> >> index a421a2eed48a..5bb94e130a50 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -76,6 +76,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
> >>  	mutex_init(&shmem->pages_lock);
> >>  	mutex_init(&shmem->vmap_lock);
> >>  	INIT_LIST_HEAD(&shmem->madv_list);
> >> +	shmem->caching =3D DRM_GEM_SHMEM_WC;
> >>  =

> >>  	/*
> >>  	 * Our buffers are kept pinned, so allocating them
> >> @@ -256,9 +257,11 @@ static void *drm_gem_shmem_vmap_locked(struct drm=
_gem_shmem_object *shmem)
> >>  =

> >>  	if (obj->import_attach)
> >>  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
> >> -	else
> >> +	else {
> >> +		pgprot_t prot =3D drm_gem_shmem_caching(shmem, PAGE_KERNEL);
> >>  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> >> -				    VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> >> +				    VM_MAP, prot);
> >> +	}
> >>  =

> >>  	if (!shmem->vaddr) {
> >>  		DRM_DEBUG_KMS("Failed to vmap pages\n");
> >> @@ -540,7 +543,8 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma)
> >>  	}
> >>  =

> >>  	vma->vm_flags |=3D VM_MIXEDMAP | VM_DONTEXPAND;
> >> -	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm_f=
lags));
> >> +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> >> +	vma->vm_page_prot =3D drm_gem_shmem_caching(shmem, vma->vm_page_prot=
);
> >>  	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
> >>  	vma->vm_ops =3D &drm_gem_shmem_vm_ops;
> >>  =

> >> @@ -683,3 +687,17 @@ drm_gem_shmem_prime_import_sg_table(struct drm_de=
vice *dev,
> >>  	return ERR_PTR(ret);
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
> >> +
> >> +pgprot_t drm_gem_shmem_caching(struct drm_gem_shmem_object *shmem, pg=
prot_t prot)
> >> +{
> >> +	switch (shmem->caching) {
> >> +	case DRM_GEM_SHMEM_CACHED:
> >> +		return prot;
> >> +	case DRM_GEM_SHMEM_WC:
> >> +		return pgprot_writecombine(prot);
> >> +	default:
> >> +		WARN_ON_ONCE(1);
> >> +		return prot;
> >> +	}
> >> +}
> >> +EXPORT_SYMBOL_GPL(drm_gem_shmem_caching);
> > =

> > Two reason why I'd reconsider this design.
> > =

> > I don't like switch statements new the bottom of the call graph. The
> > code ends up with default warnings, such as this one.
> > =

> > Udl has different caching flags for imported and 'native' buffers. This
> > would require a new constant and additional code here.
> > =

> > What do you think about turning this function into a callback in struct
> > shmem_funcs? The default implementation would be for WC, virtio would
> > use CACHED. The individual implementations could still be located in the
> > shmem code. Udl would later provide its own code.
> =

> On a second thought, all this might be over-engineered and v1 of the
> patchset was the correct approach. You can add my

The udl use-case should be covered already, simply set the flag correctly
at create/import time? It's per-object ...

btw on why udl does this: Imported bo are usually rendered by real hw, and
reading it uncached/wc is the more defensive setting. It would be kinda
nice if dma-buf would expose this, but I fear dma-api maintainers would
murder us if we even just propose that ... so it's a mess right now.

btw the issue extends to dma access by devices too, e.g. both i915 and
amdgpu can select the coherency mode at runtime (using e.g. the pcie
no-snoop transaction mode), and we have similar uncoordinated hacks in
there too, like in udl.
-Daniel

> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> if you prefer to merge v1.
> =

> > =

> > Best regards
> > Thomas
> > =

> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
