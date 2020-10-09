Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254A2883C3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FDB6EC6A;
	Fri,  9 Oct 2020 07:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614BD6EC6A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:39:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q5so8844965wmq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=sZlqTMev2axK+L8QGskQUcRRkpAH5XMokNBhQ4hT94w=;
 b=XGJKzicdcgyNT9WCo6lHE+Vhl0zKfbFtnO27PfqmkWZzYDv/lwI+6M2JJ9/FIh19d/
 WsK/Rn1Y5JEjxqP87VBCQWwW26vBL+Yo3YOedeQFFjO+9sYhFuw9vkaMAS9g8dOgob8h
 ZPJzNUZId2DdTQmzNKrQPOFFa/ZtxXVoI+C5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=sZlqTMev2axK+L8QGskQUcRRkpAH5XMokNBhQ4hT94w=;
 b=qEHDktSHzanAkwC7TTheVDZh2+q2mgilhcwxxBpAqeVhD2Rtw0ssFr3BUfmE7o/biL
 wFB60sXt17s/nxqfGCI4UcuYsT1FTxtT9XIaMr8GR4yjG1axhaQD/UpGqpx8v1OSljZq
 DTJ33zLs4lG54qiGCsi3r7Y08hnaYcnnZmRBuEn0af5BNtxDSuEh5THD8R3IgB+3TLo4
 1LLEnA3ar8zi4pDvnMbjVT7BO00LKxEu26hAYDllfEfbVEph0gwlGx+wQ3KuY1er/1gN
 PwpfyjdWrZ8oFsWZ+lpFbPLy+lRpkPJSu9kyLTnDpjy4uc+bj6tOk3mEUrl3gkOEUxON
 Avuw==
X-Gm-Message-State: AOAM531gEoR014h94DRhcBq85Z0GsjoMubFP697K+M5J8Rct3ZVrN4iT
 +FsRYEMj/9upIUNz0dOetRv4Ww==
X-Google-Smtp-Source: ABdhPJwB+SCHsXIZFePeBmx2efSXKhvBZ14ZjEzhpHqw9aTG5M5yCwGybld1pOeJ58R6vQhlWGEVvQ==
X-Received: by 2002:a1c:2d4:: with SMTP id 203mr13145932wmc.144.1602229142898; 
 Fri, 09 Oct 2020 00:39:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o186sm10546307wmb.12.2020.10.09.00.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:39:02 -0700 (PDT)
Date: Fri, 9 Oct 2020 09:39:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/4] mm: introduce vma_set_file function v2
Message-ID: <20201009073900.GL438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008141211.GG438822@phenom.ffwll.local>
 <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fc28dfa-4bae-bee1-5aca-4e3c6e88b994@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:16:49AM +0200, Christian K=F6nig wrote:
> Am 08.10.20 um 16:12 schrieb Daniel Vetter:
> > On Thu, Oct 08, 2020 at 01:23:39PM +0200, Christian K=F6nig wrote:
> > > Add the new vma_set_file() function to allow changing
> > > vma->vm_file with the necessary refcount dance.
> > > =

> > > v2: add more users of this.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-buf.c                  | 16 +++++-----------
> > >   drivers/gpu/drm/etnaviv/etnaviv_gem.c      |  4 +---
> > >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  3 +--
> > >   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++--
> > >   drivers/gpu/drm/msm/msm_gem.c              |  4 +---
> > >   drivers/gpu/drm/omapdrm/omap_gem.c         |  3 +--
> > >   drivers/gpu/drm/vgem/vgem_drv.c            |  3 +--
> > >   drivers/staging/android/ashmem.c           |  5 ++---
> > >   include/linux/mm.h                         |  2 ++
> > >   mm/mmap.c                                  | 16 ++++++++++++++++
> > >   10 files changed, 32 insertions(+), 28 deletions(-)
> > > =

> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index a6ba4d598f0e..e4316aa7e0f4 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -1163,20 +1163,14 @@ int dma_buf_mmap(struct dma_buf *dmabuf, stru=
ct vm_area_struct *vma,
> > >   		return -EINVAL;
> > >   	/* readjust the vma */
> > > -	get_file(dmabuf->file);
> > > -	oldfile =3D vma->vm_file;
> > > -	vma->vm_file =3D dmabuf->file;
> > > +	oldfile =3D vma_set_file(vma, dmabuf->file);
> > >   	vma->vm_pgoff =3D pgoff;
> > >   	ret =3D dmabuf->ops->mmap(dmabuf, vma);
> > > -	if (ret) {
> > > -		/* restore old parameters on failure */
> > > -		vma->vm_file =3D oldfile;
> > > -		fput(dmabuf->file);
> > > -	} else {
> > > -		if (oldfile)
> > > -			fput(oldfile);
> > > -	}
> > > +	/* restore old parameters on failure */
> > > +	if (ret)
> > > +		vma_set_file(vma, oldfile);
> > I think these two lines here are cargo-cult: If this fails, the mmap fa=
ils
> > and therefore the vma structure is kfreed. No point at all in restoring
> > anything.
> =

> This was explicitly added with this patch to fix a problem:
> =

> commit 495c10cc1c0c359871d5bef32dd173252fc17995
> Author: John Sheu <sheu@google.com>
> Date:=A0=A0 Mon Feb 11 17:50:24 2013 -0800
> =

> =A0=A0=A0 CHROMIUM: dma-buf: restore args on failure of dma_buf_mmap
> =

> =A0=A0=A0 Callers to dma_buf_mmap expect to fput() the vma struct's vm_fi=
le
> =A0=A0=A0 themselves on failure.=A0 Not restoring the struct's data on fa=
ilure
> =A0=A0=A0 causes a double-decrement of the vm_file's refcount.
> =

> > With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> Can I keep that even with the error handling working? :)

Hm good find, I should have looked at git history myself.

I just noticed this here in the patch because everyone else does not do
this. But looking at the mmap_region() code in mmap.c we seem to indeed
have this problem for the error path:

unmap_and_free_vma:
	vma->vm_file =3D NULL;
	fput(file);

Note that the success path does things correctly (a bit above):

	file =3D vma->vm_file;
out:

So it indeed looks like dma-buf is the only one that does this fully
correctly. So maybe we should do a follow-up patch to change the
mmap_region exit code to pick up whatever vma->vm_file was set instead,
and fput that?

Anyway I correct, r-b: as-is.

Cheers, Daniel

> =

> Christian.
> =

> > =

> > > +
> > >   	return ret;
> > >   }
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/=
etnaviv/etnaviv_gem.c
> > > index 312e9d58d5a7..10ce267c0947 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > @@ -145,10 +145,8 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_g=
em_object *etnaviv_obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > > -		get_file(etnaviv_obj->base.filp);
> > >   		vma->vm_pgoff =3D 0;
> > > -		vma->vm_file  =3D etnaviv_obj->base.filp;
> > > +		vma_set_file(vma, etnaviv_obj->base.filp);
> > >   		vma->vm_page_prot =3D vm_page_prot;
> > >   	}
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu=
/drm/i915/gem/i915_gem_dmabuf.c
> > > index fec0e1e3dc3e..8ce4c9e28b87 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > @@ -119,8 +119,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *d=
ma_buf, struct vm_area_struct *
> > >   	if (ret)
> > >   		return ret;
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file =3D get_file(obj->base.filp);
> > > +	vma_set_file(vma, obj->base.filp);
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_mman.c
> > > index 3d69e51f3e4d..c9d5f1a38af3 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -893,8 +893,8 @@ int i915_gem_mmap(struct file *filp, struct vm_ar=
ea_struct *vma)
> > >   	 * requires avoiding extraneous references to their filp, hence why
> > >   	 * we prefer to use an anonymous file for their mmaps.
> > >   	 */
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file =3D anon;
> > > +	vma_set_file(vma, anon);
> > > +	fput(anon);
> > >   	switch (mmo->mmap_type) {
> > >   	case I915_MMAP_TYPE_WC:
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_=
gem.c
> > > index de915ff6f4b4..a71f42870d5e 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > > @@ -223,10 +223,8 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > > -		get_file(obj->filp);
> > >   		vma->vm_pgoff =3D 0;
> > > -		vma->vm_file  =3D obj->filp;
> > > +		vma_set_file(vma, obj->filp);
> > >   		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> > >   	}
> > > diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/oma=
pdrm/omap_gem.c
> > > index 979d53a93c2b..0d4542ff1d7d 100644
> > > --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> > > +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> > > @@ -564,9 +564,8 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
> > >   		 * address_space (so unmap_mapping_range does what we want,
> > >   		 * in particular in the case of mmap'd dmabufs)
> > >   		 */
> > > -		fput(vma->vm_file);
> > >   		vma->vm_pgoff =3D 0;
> > > -		vma->vm_file  =3D get_file(obj->filp);
> > > +		vma_set_file(vma, obj->filp);
> > >   		vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> > >   	}
> > > diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/v=
gem_drv.c
> > > index fa54a6d1403d..ea0eecae5153 100644
> > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > @@ -397,8 +397,7 @@ static int vgem_prime_mmap(struct drm_gem_object =
*obj,
> > >   	if (ret)
> > >   		return ret;
> > > -	fput(vma->vm_file);
> > > -	vma->vm_file =3D get_file(obj->filp);
> > > +	vma_set_file(vma, obj->filp);
> > >   	vma->vm_flags |=3D VM_DONTEXPAND | VM_DONTDUMP;
> > >   	vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->vm=
_flags));
> > > diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/andro=
id/ashmem.c
> > > index 10b4be1f3e78..a51dc089896e 100644
> > > --- a/drivers/staging/android/ashmem.c
> > > +++ b/drivers/staging/android/ashmem.c
> > > @@ -450,9 +450,8 @@ static int ashmem_mmap(struct file *file, struct =
vm_area_struct *vma)
> > >   		vma_set_anonymous(vma);
> > >   	}
> > > -	if (vma->vm_file)
> > > -		fput(vma->vm_file);
> > > -	vma->vm_file =3D asma->file;
> > > +	vma_set_file(vma, asma->file);
> > > +	fput(asma->file);
> > >   out:
> > >   	mutex_unlock(&ashmem_mutex);
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index ca6e6a81576b..a558602afe1b 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -2693,6 +2693,8 @@ static inline void vma_set_page_prot(struct vm_=
area_struct *vma)
> > >   }
> > >   #endif
> > > +struct file *vma_set_file(struct vm_area_struct *vma, struct file *f=
ile);
> > > +
> > >   #ifdef CONFIG_NUMA_BALANCING
> > >   unsigned long change_prot_numa(struct vm_area_struct *vma,
> > >   			unsigned long start, unsigned long end);
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 40248d84ad5f..d3c3c510f643 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -136,6 +136,22 @@ void vma_set_page_prot(struct vm_area_struct *vm=
a)
> > >   	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
> > >   }
> > > +/*
> > > + * Change backing file, only valid to use during initial VMA setup.
> > > + */
> > > +struct file *vma_set_file(struct vm_area_struct *vma, struct file *f=
ile)
> > > +{
> > > +	if (file)
> > > +	        get_file(file);
> > > +
> > > +	swap(vma->vm_file, file);
> > > +
> > > +	if (file)
> > > +		fput(file);
> > > +
> > > +	return file;
> > > +}
> > > +
> > >   /*
> > >    * Requires inode->i_mapping->i_mmap_rwsem
> > >    */
> > > -- =

> > > 2.17.1
> > > =

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
