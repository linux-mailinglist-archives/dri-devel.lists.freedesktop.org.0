Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BEB1CD8A3
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E756E43F;
	Mon, 11 May 2020 11:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CCA6E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:37:44 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so18807659wmh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ONEtdIkAc0XGrzdJ+vZ9El01kQJP8dEySAsiTgZYuB0=;
 b=QZBHN+27NsrB4jrWbRtmq8kKBtqYQxFjmxlehkFzC5xw+yq5qTaio7B1Q39/mwwPH2
 6giK0t+F0BCXOCLRtwvWmQpwooKyIfJXVcj17eaJUsEsOD6rKWb6iGLviL+9raxm0TdI
 BQGuS3FAy/rQHbA2qUa3HWuMgpuXiIx7krzoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ONEtdIkAc0XGrzdJ+vZ9El01kQJP8dEySAsiTgZYuB0=;
 b=O4WEFKFb853pr+vuv/kUUj3ptAiRwb8HoyVde4xHMe1vhOb4xmPQ1jv4wPz1TfBhac
 HluXkr0LuYa09Gzo5jxm+i7I+T3Me1I80al8dAdsEJAIpn9SO7YYpda/7Zc04TgvsXuQ
 DfurDaY1daCO4Y28APnj4nfMr3xHXQR3epfJp9lWZM+fLIyJRxCHwxyaY1XqiXuz06ed
 Ztsa3TodEaFRlZURrQQH/QrHzaSGQK5GupBScSYksO4vDIKvcuyIR8Bq6OTUbkYTXpvU
 50dTB+OQkUxLMfGdpaMcpTyVbtq/E40P7aCJI5RDQ6Sz5k+P/pJ+zXl3JfdoaFJiTyRO
 ItTw==
X-Gm-Message-State: AGi0PuaP5mWiAWZa1d5XNLRuMDigHEG5Xs9/jpeawE42v77B8kItfvnt
 V/o8Ytwkl+xD4k9L3NwUq8inBA==
X-Google-Smtp-Source: APiQypLW21qp23JdQwUR+Xp+ib17FxstPFRyP2ifSuL9uprRmR3mzz72pX06eak3SJYySbt7OOPzVw==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr32404977wmj.21.1589197062995; 
 Mon, 11 May 2020 04:37:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w15sm16625890wrl.73.2020.05.11.04.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 04:37:42 -0700 (PDT)
Date: Mon, 11 May 2020 13:37:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/9] drm/udl: Don't call get/put_pages on imported dma-buf
Message-ID: <20200511113740.GE206103@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-6-daniel.vetter@ffwll.ch>
 <d34c53ef-1cba-9559-8169-66535d06b6cf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d34c53ef-1cba-9559-8169-66535d06b6cf@suse.de>
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

On Mon, May 11, 2020 at 01:23:38PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> > There's no direct harm, because for the shmem helpers these are noops
> > on imported buffers. The trouble is in the locks these take - I want
> > to change dma_buf_vmap locking, and so need to make sure that we only
> > ever take certain locks on one side of the dma-buf interface: Either
> > for exporters, or for importers.
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/udl/udl_gem.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/udl/udl_gem.c b/drivers/gpu/drm/udl/udl_ge=
m.c
> > index b6e26f98aa0a..c68d3e265329 100644
> > --- a/drivers/gpu/drm/udl/udl_gem.c
> > +++ b/drivers/gpu/drm/udl/udl_gem.c
> > @@ -46,29 +46,31 @@ static void *udl_gem_object_vmap(struct drm_gem_obj=
ect *obj)
> =

> It's still not clear to me why this function exists in the first place.
> It's the same code as the default implementation, except that it doesn't
> support cached mappings.
> =

> I don't see why udl is special. I'd suggest to try to use the original
> shmem function and remove this one. Same for the mmap code.

tbh no idea, could be that the usb code is then a bit too inefficient at
uploading stuff if it needs to cache flush.

But then on x86 at least everything (except real gpus) is coherent, so
cached mappings should be faster.

No idea, but also don't have the hw so not going to touch udl that much.
-Daniel

> =

> Best regards
> Thomas
> =

> >  	if (shmem->vmap_use_count++ > 0)
> >  		goto out;
> >  =

> > -	ret =3D drm_gem_shmem_get_pages(shmem);
> > -	if (ret)
> > -		goto err_zero_use;
> > -
> > -	if (obj->import_attach)
> > +	if (obj->import_attach) {
> >  		shmem->vaddr =3D dma_buf_vmap(obj->import_attach->dmabuf);
> > -	else
> > +	} else {
> > +		ret =3D drm_gem_shmem_get_pages(shmem);
> > +		if (ret)
> > +			goto err;
> > +
> >  		shmem->vaddr =3D vmap(shmem->pages, obj->size >> PAGE_SHIFT,
> >  				    VM_MAP, PAGE_KERNEL);
> >  =

> > +		if (!shmem->vaddr)
> > +			drm_gem_shmem_put_pages(shmem);
> > +	}
> > +
> >  	if (!shmem->vaddr) {
> >  		DRM_DEBUG_KMS("Failed to vmap pages\n");
> >  		ret =3D -ENOMEM;
> > -		goto err_put_pages;
> > +		goto err;
> >  	}
> >  =

> >  out:
> >  	mutex_unlock(&shmem->vmap_lock);
> >  	return shmem->vaddr;
> >  =

> > -err_put_pages:
> > -	drm_gem_shmem_put_pages(shmem);
> > -err_zero_use:
> > +err:
> >  	shmem->vmap_use_count =3D 0;
> >  	mutex_unlock(&shmem->vmap_lock);
> >  	return ERR_PTR(ret);
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
