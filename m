Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8641D3066
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EBE6EB41;
	Thu, 14 May 2020 12:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1268A6EB42
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:55:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so3931008wra.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4wPXeNcLW4ZBVZEWneMiy/Djij00xCw9qJYjwl+CGqE=;
 b=TlmZAoVz4eyoh4PJ5nxYIRqEcULhdm7cVTrPW0yDrINXspysruIi+eIzbYUqZ/22mQ
 IYSvP/ZqNlBlQOg0FpP9AqMn2kyYk76XAoLHrhVV5BSHQrq5EZ4h8+fauC9I18s2py1n
 OTe8IZH950RXRTxiuuSd3F9QTNKoi+liHJbxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4wPXeNcLW4ZBVZEWneMiy/Djij00xCw9qJYjwl+CGqE=;
 b=HLXARx8LalB5kfLB6GDkyk//WGlanZQ7rlrKAdysWBrHtQBTP9NJxfeGv2Si2IW9LM
 aQ76mT9DulgO0KBLhx3yEouiociSZf5SwTELey8C4vcnkcrwWSiWFLgxw9vP3hZLcr2L
 yxMHn/FBt93fBT20eueywtZ4NKScZcemvGMHxjEPbk37IMRBUVHHzy4f4JL0nehShvU7
 Y/iDxcQhn5Sc+vT0Plp6pBYrXZ48PBXAEE/FBPVdCpwf7/5RBKzxyfrk+Mw5yt5zBp/g
 P5iVBcChfZaD2C6BEFnYr7rtkPJI578ynXKq77aqRmyIz/fotxAxpb8iXOwyU6MLp1ZN
 O9Ng==
X-Gm-Message-State: AOAM533ZqpulVoTIedOXM892PeyYzPreVnhy1MiOegp5D2lZ0kXX7/7p
 SeDUo1lT4VJhL7fFgw8ExMGzNw==
X-Google-Smtp-Source: ABdhPJyqveUs+SO5BZztKeocuJ5hqkU2HtoH28CqVbu2LlwfjKf3vX2hr1UXT5VOH8Nw00o6DfmnNg==
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr5059869wrx.243.1589460931619; 
 Thu, 14 May 2020 05:55:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w9sm4215099wrc.27.2020.05.14.05.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:55:30 -0700 (PDT)
Date: Thu, 14 May 2020 14:55:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 9/9] drm/shmem-helpers: Simplify dma-buf importing
Message-ID: <20200514125528.GA206103@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-10-daniel.vetter@ffwll.ch>
 <732e30cc-9169-c409-4ddc-50508ef36efc@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <732e30cc-9169-c409-4ddc-50508ef36efc@suse.de>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:44:02AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> > - Ditch the ->pages array
> > - Make it a private gem bo, which means no shmem object, which means
> >   fireworks if anyone calls drm_gem_object_get_pages. But we've just
> >   made sure that's all covered.
> > =

> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 59 ++++++++++----------------
> >  1 file changed, 23 insertions(+), 36 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index f7011338813e..8c7d4f422b7b 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -35,22 +35,12 @@ static const struct drm_gem_object_funcs drm_gem_sh=
mem_funcs =3D {
> >  	.mmap =3D drm_gem_shmem_mmap,
> >  };
> >  =

> > -/**
> > - * drm_gem_shmem_create - Allocate an object with the given size
> > - * @dev: DRM device
> > - * @size: Size of the object to allocate
> > - *
> > - * This function creates a shmem GEM object.
> > - *
> > - * Returns:
> > - * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded =
negative
> > - * error code on failure.
> > - */
> > -struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *d=
ev, size_t size)
> > +static struct drm_gem_shmem_object *
> > +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool priva=
te)
> >  {
> >  	struct drm_gem_shmem_object *shmem;
> >  	struct drm_gem_object *obj;
> > -	int ret;
> > +	int ret =3D 0;
> >  =

> >  	size =3D PAGE_ALIGN(size);
> >  =

> > @@ -64,7 +54,10 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
> >  	if (!obj->funcs)
> >  		obj->funcs =3D &drm_gem_shmem_funcs;
> >  =

> > -	ret =3D drm_gem_object_init(dev, obj, size);
> > +	if (private)
> > +		drm_gem_private_object_init(dev, obj, size);
> > +	else
> > +		ret =3D drm_gem_object_init(dev, obj, size);
> >  	if (ret)
> >  		goto err_free;
> >  =

> > @@ -96,6 +89,21 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(st=
ruct drm_device *dev, size_t
> >  =

> >  	return ERR_PTR(ret);
> >  }
> > +/**
> > + * drm_gem_shmem_create - Allocate an object with the given size
> > + * @dev: DRM device
> > + * @size: Size of the object to allocate
> > + *
> > + * This function creates a shmem GEM object.
> > + *
> > + * Returns:
> > + * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded =
negative
> > + * error code on failure.
> > + */
> > +struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *d=
ev, size_t size)
> > +{
> > +	return __drm_gem_shmem_create(dev, size, false);
> > +}
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >  =

> >  /**
> > @@ -115,7 +123,6 @@ void drm_gem_shmem_free_object(struct drm_gem_objec=
t *obj)
> >  	if (obj->import_attach) {
> >  		shmem->pages_use_count--;
> >  		drm_prime_gem_destroy(obj, shmem->sgt);
> > -		kvfree(shmem->pages);
> >  	} else {
> >  		if (shmem->sgt) {
> >  			dma_unmap_sg(obj->dev->dev, shmem->sgt->sgl,
> > @@ -371,7 +378,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *f=
ile_priv,
> >  	struct drm_gem_shmem_object *shmem;
> >  	int ret;
> >  =

> > -	shmem =3D drm_gem_shmem_create(dev, size);
> > +	shmem =3D __drm_gem_shmem_create(dev, size, true);
> >  	if (IS_ERR(shmem))
> >  		return shmem;
> >  =

> > @@ -695,36 +702,16 @@ drm_gem_shmem_prime_import_sg_table(struct drm_de=
vice *dev,
> >  				    struct sg_table *sgt)
> >  {
> >  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
> > -	size_t npages =3D size >> PAGE_SHIFT;
> >  	struct drm_gem_shmem_object *shmem;
> > -	int ret;
> >  =

> >  	shmem =3D drm_gem_shmem_create(dev, size);
> >  	if (IS_ERR(shmem))
> >  		return ERR_CAST(shmem);
> >  =

> > -	shmem->pages =3D kvmalloc_array(npages, sizeof(struct page *), GFP_KE=
RNEL);
> > -	if (!shmem->pages) {
> > -		ret =3D -ENOMEM;
> > -		goto err_free_gem;
> > -	}
> > -
> > -	ret =3D drm_prime_sg_to_page_addr_arrays(sgt, shmem->pages, NULL, npa=
ges);
> > -	if (ret < 0)
> > -		goto err_free_array;
> > -
> >  	shmem->sgt =3D sgt;
> > -	shmem->pages_use_count =3D 1; /* Permanently pinned from our point of=
 view */
> =

> This counter protected drm_gem_shmem_get_pages() from being executed on
> imported buffers. I guess that previous patches sorted out all the
> instances where this could occur. If so, the current patch looks
> correct. I'm not sure, if the overall code is really better than what we
> have ATM, but anyway

The goal was to clearly sort these cases out, iirc we had callers of
get_pages doing the wrong thing, but I tried to review them all. Some got
removed while this series was hanging around in my tree somewhere.

What I wanted to do in the end is replace all mutex_lock with
dma_resv_lock, which now should be doable. Except I need to audit all the
drivers, and some want _locked variant since they are already holding the
lock. That's roughly the point where I gave up on this eandeavour, at
least for now.

But if we'd get there then all the various helpers we have (cma, shmem,
vram) would more or less properly use dma_resv_lock as their protectiong
concept. That's kinda neat since with the dynamic dma-buf stuff
dma_resv_lock really becomes _the_ buffer lock for drivers, so some
motivation to move towards that.

Anyway if you don't feel like this is all that useful without the
dma_resv_lock work on top, I guess I can merge up to the doc patch and
leave the others out. Not sure myself, thoughts?

Thanks for taking a look.
-Daniel

> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> >  =

> >  	DRM_DEBUG_PRIME("size =3D %zu\n", size);
> >  =

> >  	return &shmem->base;
> > -
> > -err_free_array:
> > -	kvfree(shmem->pages);
> > -err_free_gem:
> > -	drm_gem_object_put_unlocked(&shmem->base);
> > -
> > -	return ERR_PTR(ret);
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
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





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
