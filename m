Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95351FBC71
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 19:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C856E8E1;
	Tue, 16 Jun 2020 17:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8A6E91F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 17:10:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x6so21524088wrm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rH/JzXWDqwAk3BLrVvVQqXAo+ppeFoiKWYiRM4VfD0I=;
 b=IpO5JeHKFb731DILaUWHdUGCYAOttZLrbhATlzOUOp+9T6vO5HskfYpzfIn1UhYpOu
 a6lYMwmCGS3LAfCMXrH5uQ08K0BRI6/ByJJB7S7D9TpboERf2n78xYNMsrdHCJwmwBe3
 lmU8OZTwdcaVlAyTJjU2nnjrVohz9k8pQIpNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rH/JzXWDqwAk3BLrVvVQqXAo+ppeFoiKWYiRM4VfD0I=;
 b=e8ZKg5E8VNZSRGzsWF/HWyh67qpNcrGplqGQ7Hou/61hJRnkJhVg7Cr7fiiQkYAzKY
 T1THOllUn8fzMwhBiAiEcnQFxZKJgHHIv3HY+tIP27vRtcmf5u1rtmgMvE9fxMQcFdyk
 cbFsKZERcCgy++KW+WE8VosoKaLJ3YiWzOeLHsbMKle3iB7K0G9oPvEEb/e6VUeqFPdU
 ol9mqf3ljZETb728jFq18SkU8EDD1H9FdcsE1gTITg4nBebKT2G5lN3pIEFXCR1M+pRe
 Nph4lM5Mh6Vz2h2tQey837J14QMhXdfO95IhVQGYoWeL57tVMuwMVw9Irxw+lWEGyRoG
 kMBw==
X-Gm-Message-State: AOAM530JBAw+hlJ2tv8dxvm8HPSv44zddNHS4xEpgm04b/6A00gadH+z
 /hoYq3TKrgN0cejHUlRIQNmJxw==
X-Google-Smtp-Source: ABdhPJwUqafY54okg1vnxUw6SX9ejULIg0cx+SHrNVGZwFUKo3b2FOldbdi5p071JNlCSvAsviOanA==
X-Received: by 2002:adf:f205:: with SMTP id p5mr4383068wro.302.1592327426008; 
 Tue, 16 Jun 2020 10:10:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm4778003wmc.1.2020.06.16.10.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:10:25 -0700 (PDT)
Date: Tue, 16 Jun 2020 19:10:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Fix obj->filp derefence
Message-ID: <20200616171023.GP20149@phenom.ffwll.local>
References: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
 <a1290884-8cca-f1a1-a05b-8d5c3e323506@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1290884-8cca-f1a1-a05b-8d5c3e323506@suse.de>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 02:10:10PM +0200, Thomas Zimmermann wrote:
> Hi,
> =

> as discussed on IRC, we still need this patch.
> =

> Am 15.06.20 um 17:10 schrieb Daniel Vetter:
> > I broke that in my refactoring:
> > =

> > commit 7d2cd72a9aa3df3604cafd169a2d4a525afb68ca
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Fri May 29 16:05:42 2020 +0200
> > =

> >     drm/shmem-helpers: Simplify dma-buf importing
> > =

> > Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index 0a7e3b664bc2..3e7ee407a17c 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -70,15 +70,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size=
_t size, bool private)
> >  	mutex_init(&shmem->vmap_lock);
> >  	INIT_LIST_HEAD(&shmem->madv_list);
> >  =

> > -	/*
> > -	 * Our buffers are kept pinned, so allocating them
> > -	 * from the MOVABLE zone is a really bad idea, and
> > -	 * conflicts with CMA. See comments above new_inode()
> > -	 * why this is required _and_ expected if you're
> > -	 * going to pin these pages.
> > -	 */
> > -	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> > -			     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > +	if (!private) {
> =

> I would test for (obj->filp) here, because it's what the branch depends
> on. Your choice. In any case

I was pondering this too, on one hand it's the thing we're using, otoh
it's a direct consequence of the private flag, and the private flag has a
bit the clearer control flow I think - the obj->filp is clear that it's a
NULL check, but it's a lot less clear _why_ it is ok to have obj->filp =3D=
=3D
NULL. Checking for private makes this a bit clearer imo.

But yeah I considered both options. Maybe we should improve the comment in
a follow-up patch? I want to land the bugfix meanwhile, to close the
regression.

> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for testing and reviewing!
-Daniel

> =

> =

> > +		/*
> > +		 * Our buffers are kept pinned, so allocating them
> > +		 * from the MOVABLE zone is a really bad idea, and
> > +		 * conflicts with CMA. See comments above new_inode()
> > +		 * why this is required _and_ expected if you're
> > +		 * going to pin these pages.
> > +		 */
> > +		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> > +				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > +	}
> >  =

> >  	return shmem;
> >  =

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
