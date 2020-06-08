Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E981F1BA5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 17:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826CF6E94F;
	Mon,  8 Jun 2020 15:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138F089FEA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 15:04:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so17752731wrn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qag/XLrfJrO4qr99aXURor3BjUeml4bjYWndZWXHYbY=;
 b=YZZE2XepXIZcxhyMQ50212tmNk1Y7yJvSkOhgxRNFQBz37BfZELqcDePEvYstycHMH
 yvXI3d3zZbroDDwjbKaR7NhfyYYh+0SIpldMMu72v70omqKwdKm6r5s8DRaECtOWWU+G
 0Aps3lBRi559Dmf6+aTLyMJTGasRgTx4lXE9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qag/XLrfJrO4qr99aXURor3BjUeml4bjYWndZWXHYbY=;
 b=j2Tkd9MyHqWTEASqAGOpZBpPLUzEYRf7RXgmgJ2RWnZPZBadBxuO3efSGXO3m3W1FA
 1LJFaJJT9/Qv8Bad4CWSRwWPd00jQVukAlyVgx0H33wrhRA7iclc/uMROaPv6f7Z48i9
 ozDYzFZnpq/Fpu4AeUm4K0K8n94vfHql9z15OCedyFxuCHzHl4FCAQFLaT6WBFWix++f
 t73rMD7ELr/FlaW1Ydear9DeCpclLtpaGxovTpiR3BIRbn2J/+7eJ9oS1H22oHsOs9Ja
 Xu1K3an2plrb/D12Sabtoc5Zdrmva4SBvRjU9BrmuWVIHbukchI7YYyr69F08rQBj6d1
 BWSQ==
X-Gm-Message-State: AOAM530zNE3CCsxVIbQMmY71bDkgLEeyDSu7YgQ/GSXafONLKnR7H6hI
 FPVmw2tZ8rR0lWJS5dDNQXxC9w==
X-Google-Smtp-Source: ABdhPJwnA7WXyEuUnjQyiibtyO+3SUeVQbYwLbrECFLGmgO0ty1UXUB8cVx1TGJnNgT9V9dIfsi+1g==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr25063323wrp.426.1591628653669; 
 Mon, 08 Jun 2020 08:04:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k26sm23112023wmi.27.2020.06.08.08.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:04:12 -0700 (PDT)
Date: Mon, 8 Jun 2020 17:04:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/9] drm/shmem-helpers: Ensure get_pages is not called on
 imported dma-buf
Message-ID: <20200608150410.GY20149@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-9-daniel.vetter@ffwll.ch>
 <41b3f24c-de0c-9390-6b8c-e71ceadb6d07@suse.de>
 <20200603131209.GN20149@phenom.ffwll.local>
 <37f561a1-c0fc-57c9-4759-9fca5ae46a4d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37f561a1-c0fc-57c9-4759-9fca5ae46a4d@suse.de>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 04:40:26PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 03.06.20 um 15:12 schrieb Daniel Vetter:
> > On Thu, May 14, 2020 at 09:30:04AM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> >>> Just a bit of light paranoia. Also sprinkle this check over
> >>> drm_gem_shmem_get_sg_table, which should only be called when
> >>> exporting, same for the pin/unpin functions, on which it relies to
> >>> work correctly.
> >>>
> >>> Cc: Gerd Hoffmann <kraxel@redhat.com>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm=
/drm_gem_shmem_helper.c
> >>> index 117a7841e284..f7011338813e 100644
> >>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>> @@ -170,6 +170,8 @@ int drm_gem_shmem_get_pages(struct drm_gem_shmem_=
object *shmem)
> >>>  {
> >>>  	int ret;
> >>>  =

> >>> +	WARN_ON(shmem->base.import_attach);
> >>> +
> >>>  	ret =3D mutex_lock_interruptible(&shmem->pages_lock);
> >>>  	if (ret)
> >>>  		return ret;
> >>> @@ -225,6 +227,8 @@ int drm_gem_shmem_pin(struct drm_gem_object *obj)
> >>>  {
> >>>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >>>  =

> >>> +	WARN_ON(shmem->base.import_attach);
> >>> +
> >>
> >> I don't understand this change. If a driver pins pages it now has to
> >> check that the pages are not imported?
> > =

> > Nope. There's two classes of functions in the helpers, and I'm trying to
> > unconfuse them:
> > =

> > - stuff used to implement gem_funcs. These are obviously only ever used=
 on
> >   native objects, never on imported ones (on imported ones we try to
> >   forward through the dma-buf layer to the exporter). drm_gem_shmem_pin=
 is
> >   only used in that role to implement gem_funcs->pin. Calling it on an
> >   imported buffer is indeed a bug.
> > =

> > - the other set of functions are for drivers to do their stuff. The
> >   interface which (implicitly) pins stuff into places is various set of
> >   get_pages, which do have different paths for native and imported
> >   objects.
> =

> Thanks for explaining. Patch is

Thanks for taking a look at all this, last 2 patches now also merged to
drm-misc-next.
-Daniel

> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> > =

> > Apologies that I missed your question here, I merged all the patches
> > leading up to this one for now.
> > =

> > Thanks, Daniel
> > =

> >>
> >>
> >>>  	return drm_gem_shmem_get_pages(shmem);
> >>>  }
> >>>  EXPORT_SYMBOL(drm_gem_shmem_pin);
> >>> @@ -240,6 +244,8 @@ void drm_gem_shmem_unpin(struct drm_gem_object *o=
bj)
> >>>  {
> >>>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >>>  =

> >>> +	WARN_ON(shmem->base.import_attach);
> >>> +
> >>>  	drm_gem_shmem_put_pages(shmem);
> >>>  }
> >>>  EXPORT_SYMBOL(drm_gem_shmem_unpin);
> >>> @@ -510,6 +516,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_=
struct *vma)
> >>>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >>>  	int ret;
> >>>  =

> >>> +	WARN_ON(shmem->base.import_attach);
> >>> +
> >>>  	ret =3D drm_gem_shmem_get_pages(shmem);
> >>>  	WARN_ON_ONCE(ret !=3D 0);
> >>>  =

> >>> @@ -611,6 +619,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struc=
t drm_gem_object *obj)
> >>>  {
> >>>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >>>  =

> >>> +	WARN_ON(shmem->base.import_attach);
> >>> +
> >>>  	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
> >>>
> >>
> >> -- =

> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> >> (HRB 36809, AG N=FCrnberg)
> >> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> >>
> > =

> > =

> > =

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
