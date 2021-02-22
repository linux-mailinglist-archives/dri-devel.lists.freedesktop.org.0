Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B3321D16
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2615B89DFB;
	Mon, 22 Feb 2021 16:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D183F89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:34:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id x16so14094079wmk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BYqBSh+RtOGP1AbAbL6ridYFs/D4712lyryymR5Pa9c=;
 b=eaBQVlYXISi5zl9J7BLQCJr2TWWU99w/uedGi9f6xcXo22AeSIp7L0dd3IIY43+xfZ
 Vvlt/YiSFi44cAbk4LUEGL8hUjceudH3t/6N/s9auO7ZcsouoiMZ3HiFP/phl3/ODMrU
 +yIb+EgOXtRXRMjHRf49H2LJijbUvIeQZMUf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BYqBSh+RtOGP1AbAbL6ridYFs/D4712lyryymR5Pa9c=;
 b=ceLLZ5ozCOtKnM9fbu2o19+9yttT74d7Wt2jeFuDdjYk00nxXmoBHBF0XIYHaOysFR
 IlcakjyjVdBpvZ6X/CiNvGcevnK0+C+fu64sdhQWTqEu//pvAt5quv2vXYdOPvXr3dQr
 IbJvUWxrWcYHrTZl8S7QCFsbkEgvlCLUWehKjDoTPf8BQXkeQ6tcsBiFFmhHerLgHt3r
 i00G37BtL9JiyqWS+fOs3ouM4TYkSz1/SE+k6AgtoRIyccuQ0SymiUSutCNE0KhjkUM2
 BmmiyrewitnjR+dEGOf4ou1gcili6MyJ1kCS3gqQia3gVCWUyAECoLtiZv56Xjn2LSPI
 DYCg==
X-Gm-Message-State: AOAM533JQB12sJuAMvvrhUo7leSeVTy6RLOE4KPdWKhgNrmpzzV6PiWQ
 Ux6WihgmdapqyhHMazdM0LzTRA==
X-Google-Smtp-Source: ABdhPJxWnZwVKISs5Gvna+rbo0tUawFe9j4tFr8dzPrnrJfseaXhp8z0m23nCHWfr40ob/8M+QsKYA==
X-Received: by 2002:a05:600c:2113:: with SMTP id
 u19mr6333277wml.30.1614011692591; 
 Mon, 22 Feb 2021 08:34:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e12sm28735850wrv.59.2021.02.22.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:34:52 -0800 (PST)
Date: Mon, 22 Feb 2021 17:34:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for
 devices with DMA support
Message-ID: <YDPdKoTewh6HMhVM@phenom.ffwll.local>
References: <20210222124328.27340-1-tzimmermann@suse.de>
 <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
 <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
 <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4246f9d2-2ce8-151a-fd92-8cf10510adec@suse.de>
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Dave Airlie <airlied@linux.ie>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>, Qiang Yu <yuq825@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 05:25:46PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 22.02.21 um 17:10 schrieb Daniel Vetter:
> > On Mon, Feb 22, 2021 at 2:24 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> > > =

> > > Hi
> > > =

> > > Am 22.02.21 um 14:09 schrieb Christian K=F6nig:
> > > > =

> > > > =

> > > > Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
> > > > > USB-based drivers cannot use DMA, so the importing of dma-buf att=
achments
> > > > > currently fails for udl and gm12u320. This breaks joining/mirrori=
ng of
> > > > > displays.
> > > > > =

> > > > > The fix is now a little series. To solve the issue on the importer
> > > > > side (i.e., the affected USB-based driver), patch 1 introduces a =
new
> > > > > PRIME callback, struct drm_driver.gem_prime_create_object, which =
creates
> > > > > an object and gives more control to the importing driver. Specifi=
cally,
> > > > > udl and gm12u320 can now avoid the creation of a scatter/gather t=
able
> > > > > for the imported pages. Patch 1 is self-contained in the sense th=
at it
> > > > > can be backported into older kernels.
> > > > =

> > > > Mhm, that sounds like a little overkill to me.
> > > > =

> > > > Drivers can already import the DMA-bufs all by them selves without =
the
> > > > help of the DRM functions. See amdgpu for an example.
> > > > =

> > > > Daniel also already noted to me that he sees the DRM helper as a bit
> > > > questionable middle layer.
> > > =

> > > And this bug proves that it is. :)
> > =

> > The trouble here is actually gem_bo->import_attach, which isn't really
> > part of the questionable midlayer, but fairly mandatory (only
> > exception is vmwgfx because not using gem) caching to make sure we
> > don't end up with duped imports and fun stuff like that.
> > =

> > And dma_buf_attach now implicitly creates the sg table already, so
> > we're already in game over land. I think we'd need to make
> > import_attach a union with import_buf or something like that, so that
> > you can do attachment-less importing.
> =

> Creating the sg table is not the problem; mapping it is. So dma_buf_attach
> shouldn't be a problem.

dma_buf_attach will create a cached sg-mapping for you if the exporter is
dynamic. Currently that's only the case for amdgpu, I guess you didn't
test with that.

So yeah dma_buf_attach is a problem already. And if we can't attach, the
entire obj->import_attach logic in drm_prime.c falls over, and we get all
kinds of fun with double import and re-export.

> > > > Have you thought about doing that instead?
> > > =

> > > There appears to be some useful code in drm_gem_prime_import_dev(). B=
ut
> > > if the general sentiment goes towards removing
> > > gem_prime_import_sg_table, we can work towards that as well.
> > =

> > I still think this part is a bit a silly midlayer for no good reason,
> > but I think that's orthogonal to the issue at hand here.
> > =

> > I'd suggest we first try to paper over the issue by using
> > prime_import_dev with the host controller (which hopefully is
> > dma-capable for most systems). And then, at leisure, try to untangle
> > the obj->import_attach issue.
> =

> I really don't want to do this. My time is also limited, and I''ll spend
> time papering over the thing. And then more time for the real fix. I'd
> rather pull drm_gem_prime_import_dev() in to USB drivers and avoid the
> dma_buf_map().

Yeah I understand, it's just (as usual :-/) more complex than it seems ...
-Daniel

> =

> Best regard
> Thomas
> =

> > -Daniel
> > =

> > > =

> > > Best regards
> > > Thomas
> > > =

> > > > =

> > > > Christian.
> > > > =

> > > > > =

> > > > > Patches 2 and 3 update SHMEM and CMA helpers to use the new callb=
ack.
> > > > > Effectively this moves the sg table setup from the PRIME helpers =
into
> > > > > the memory managers. SHMEM now supports devices without DMA suppo=
rt,
> > > > > so custom code can be removed from udl and g12u320.
> > > > > =

> > > > > Tested by joining/mirroring displays of udl and radeon under Gnom=
e/X11.
> > > > > =

> > > > > v2:
> > > > >      * move fix to importer side (Christian, Daniel)
> > > > >      * update SHMEM and CMA helpers for new PRIME callbacks
> > > > > =

> > > > > Thomas Zimmermann (3):
> > > > >     drm: Support importing dmabufs into drivers without DMA
> > > > >     drm/shmem-helper: Implement struct drm_driver.gem_prime_creat=
e_object
> > > > >     drm/cma-helper: Implement struct drm_driver.gem_prime_create_=
object
> > > > > =

> > > > >    drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++---=
--------
> > > > >    drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
> > > > >    drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------
> > > > >    drivers/gpu/drm/lima/lima_drv.c         |  2 +-
> > > > >    drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
> > > > >    drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
> > > > >    drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
> > > > >    drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
> > > > >    drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
> > > > >    drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
> > > > >    drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
> > > > >    include/drm/drm_drv.h                   | 12 +++++
> > > > >    include/drm/drm_gem_cma_helper.h        | 12 ++---
> > > > >    include/drm/drm_gem_shmem_helper.h      |  6 +--
> > > > >    14 files changed, 120 insertions(+), 88 deletions(-)
> > > > > =

> > > > > --
> > > > > 2.30.1
> > > > > =

> > > > =

> > > =

> > > --
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > (HRB 36809, AG N=FCrnberg)
> > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > =

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
