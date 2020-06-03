Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E81ED05C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 14:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B782D89BC2;
	Wed,  3 Jun 2020 12:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8885E89BC2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 12:57:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r15so1943475wmh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p3J7CIPvEW/4/DOD3MuRieDrllJtb4tW38npIrPN1TE=;
 b=Ev2653EI84v6RzIG/SV4taBZHLLnlj7mawboc4BX8Azkq8c8mBdKz85Hz9vJhifdHm
 9naBj9PfmpG0V81dbx6ijUm1XP2V+iWNRuUU1UosKrhPF9smbVl9gU7MvBvOuyN4RXkN
 gnfrDAnrglderblFv3yKw0FeXCuIxAqLpHd2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p3J7CIPvEW/4/DOD3MuRieDrllJtb4tW38npIrPN1TE=;
 b=Gb5bF8Fd5Rmv6tw5cmg2nOQvjM/0UbKi+VSC94pPf8oYR/vH62RgHoLv/c7jZzW3Aa
 6WZDhv5atSQXB67CBe/QzTpsCkFuZLACR0tx5u1AxFp+8qpyQyP3blBEEgDyesv5Pqql
 RSU9kpaMD42CPDQTm3StglUsNJUkd6BiYurLsCLID9iErJWp4lSb/vpprL03/n4jw/TI
 9Q7vPWssZjXHod6UfvcFGESISfdZxSvxm0Kzv2RizCV+higrIc8/mRbDwIETp+jAtX12
 OywYsvf4eb3hmmZJnTyEyVSqj7+BWOuKXwKbS3PrzNWLr4dL+m/keDnQmMf3fvWYeesi
 ksxA==
X-Gm-Message-State: AOAM533QoNUvcsc29BljkrR9rO/cKwAvRMhQip2dKupZKupKiZemDRZG
 WuZjwa9gxa/76veQ8qEi2QBbUA==
X-Google-Smtp-Source: ABdhPJyF+v4LoeoY0PURDaxDAUixFn1hffa5ChPGjQhX3hqDLaF98U4Q5Ny34cuWkL2qQwdEC11BtA==
X-Received: by 2002:a05:600c:10cf:: with SMTP id
 l15mr8553162wmd.10.1591189057097; 
 Wed, 03 Jun 2020 05:57:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v7sm2889022wme.46.2020.06.03.05.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 05:57:36 -0700 (PDT)
Date: Wed, 3 Jun 2020 14:57:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
Message-ID: <20200603125734.GM20149@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
 <1f21209e-c041-7203-af94-5e71d9ee9234@suse.de>
 <20200514124757.GY206103@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514124757.GY206103@phenom.ffwll.local>
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 02:47:57PM +0200, Daniel Vetter wrote:
> On Thu, May 14, 2020 at 09:25:18AM +0200, Thomas Zimmermann wrote:
> > Hi,
> > =

> > given the upcoming removal of this file, I don't know if you really want
> > to merge this patch. If so, please see my comment on patch 6 and
> =

> Yeah I can wait for your patch to land, I just looked at that series. I'm
> kinda just keeping this around as a reminder locally.

Still applied cleanly to drm-misc-next, so I applied it.
-Daniel

> -Daniel
> =

> > =

> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > =

> > Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> > > There's no direct harm, because for the shmem helpers these are noops
> > > on imported buffers. The trouble is in the locks these take - I want
> > > to change dma_buf_vmap locking, and so need to make sure that we only
> > > ever take certain locks on one side of the dma-buf interface: Either
> > > for exporters, or for importers.
> > > =

> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > >  drivers/gpu/drm/udl/udl_gem.c | 22 ++++++++++++----------
> > >  1 file changed, 12 insertions(+), 10 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_=
gem.c
> > > index b6e26f98aa0a..c68d3e265329 100644
> > > --- a/drivers/gpu/drm/udl/udl_gem.c
> > > +++ b/drivers/gpu/drm/udl/udl_gem.c
> > > @@ -46,29 +46,31 @@ static void *udl_gem_object_vmap(struct drm_gem_o=
bject *obj)
> > >  	if (shmem->vmap_use_count++ > 0)
> > >  		goto out;
> > >  =

> > > -	ret =3D drm_gem_shmem_get_pages(shmem);
> > > -	if (ret)
> > > -		goto err_zero_use;
> > > -
> > > -	if (obj->import_attach)
> > > +	if (obj->import_attach) {
> > >  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
> > > -	else
> > > +	} else {
> > > +		ret =3D drm_gem_shmem_get_pages(shmem);
> > > +		if (ret)
> > > +			goto err;
> > > +
> > >  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> > >  				    VM_MAP, PAGE_KERNEL);
> > >  =

> > > +		if (!shmem->vaddr)
> > > +			drm_gem_shmem_put_pages(shmem);
> > > +	}
> > > +
> > >  	if (!shmem->vaddr) {
> > >  		DRM_DEBUG_KMS("Failed to vmap pages\n");
> > >  		ret =3D -ENOMEM;
> > > -		goto err_put_pages;
> > > +		goto err;
> > >  	}
> > >  =

> > >  out:
> > >  	mutex_unlock(&shmem->vmap_lock);
> > >  	return shmem->vaddr;
> > >  =

> > > -err_put_pages:
> > > -	drm_gem_shmem_put_pages(shmem);
> > > -err_zero_use:
> > > +err:
> > >  	shmem->vmap_use_count =3D 0;
> > >  	mutex_unlock(&shmem->vmap_lock);
> > >  	return ERR_PTR(ret);
> > > =

> > =

> > -- =

> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > (HRB 36809, AG N=FCrnberg)
> > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > =

> =

> =

> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
