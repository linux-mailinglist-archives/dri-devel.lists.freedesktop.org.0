Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA40339021
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9346F637;
	Fri, 12 Mar 2021 14:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449146F637
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:35:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o16so1899016wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R8BLT8KTqNAU5mw1Jy9JcSlrsQmr6RMt6KyTnra98zM=;
 b=J1ioB+IZdT+Tn0Yz1wSHvp8Ce0FEyr9KeqGKGX8Xg1gPOV+ksuQhz3j9k77dp/y9VM
 QqvetkQjB7f29Favksb+DdEitsaq1rDXx7/878XaPAaxX4SASp5voPGsmJYPn5M34fTC
 Im3tqfxVsCJxN+i3T6uCaNsZ1sqyyUfdTXyA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R8BLT8KTqNAU5mw1Jy9JcSlrsQmr6RMt6KyTnra98zM=;
 b=KLBKxgkDR0cqVtRK5Fp3cAkNtn38i39bTuH/qjB7Ydqbzsov1ebK+VlxVQZg3HFNU4
 7DrnZtUWNPnY1rm8w8S+qpl2c8pOWE4bzP/59iyxSPbcgJ12uzm5h2hXAU0vIwIQY1Id
 My34ZO9aregs9Nm0UKx7f2Bmqi5IA998Y5iSs2phqTbo6Fjr0WZpoICMc14IS0oLOcGm
 XJQzx18cZgLeQX2rEguCJx9bOm66EnXkEeaF+GTPwhosUaEdhBEtb5J4DL/gJvl/GlOx
 /ZxcjIwLPdMWmX6PYBj8SwX4U6DfU/mn0etW8KgfT6JDqsSL79wM4O0+gbEJZoVXpdXU
 2iTg==
X-Gm-Message-State: AOAM5322Fq+lvH5bi0pFE8PLb/sQEMWUY99xqrTJyvdEqNqHlQz57b63
 J89B3G78khLQ5YaJk2GmRfv+RA==
X-Google-Smtp-Source: ABdhPJz4+/C5bjIj9RxkpV04x2f9ngMkVouMwj51ZwY+2qD/7DLHL64KYMcN5cJ3EIjEzv3/tVySig==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr14575471wrw.334.1615559752883; 
 Fri, 12 Mar 2021 06:35:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 91sm8630165wrl.20.2021.03.12.06.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:35:52 -0800 (PST)
Date: Fri, 12 Mar 2021 15:35:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: nuke the ih reentrant lock
Message-ID: <YEt8RlrR86vkqiyZ@phenom.ffwll.local>
References: <20210312135906.3262-1-christian.koenig@amd.com>
 <YEt08RhEI23VPS4g@phenom.ffwll.local>
 <e5ed96e2-8252-4a3a-593a-24551edaa1e8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5ed96e2-8252-4a3a-593a-24551edaa1e8@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 03:27:58PM +0100, Christian K=F6nig wrote:
> =

> =

> Am 12.03.21 um 15:04 schrieb Daniel Vetter:
> > On Fri, Mar 12, 2021 at 02:59:06PM +0100, Christian K=F6nig wrote:
> > > Interrupts on are non-reentrant on linux. This is just an ancient
> > > leftover from radeon where irq processing was kicked of from different
> > > places.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Man you tricked me into grepping this on radeon and it looks horrible.
> > atomic_t is unordered in linux, so whatever was built there for radeon
> > does not wokr like a lock. It's missing all the barriers afiui. Good
> > riddance at least for amdgpu.
> =

> Hui? atomic_xchg() is perfectly ordered as far as I know.

Oh right, if atomic_ returns a value it's fully ordered. Nice tour into
memory-barriers.txt. It's the atomic_t operations that don't return
anything which are fully unordered, and I mixed that up.

> IIRC Alex added this for R600 because we had boards where interrupts where
> sporadically swallowed during driver startup and we had to kick of ring
> buffer processing manually.
> =

> Anyway we have a fence processing fallback timer in amdgpu instead and th=
at
> stuff is probably unused on any modern hardware.

Ah yes that stuff. Kinda annoying we have these old dma_fence around where
dma_fence_wait doesn't really work that well, but oh well.
-Daniel

> =

> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> Thanks,
> Christian.
> =

> > =

> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     | 5 -----
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h     | 1 -
> > >   3 files changed, 7 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_device.c
> > > index a15f1b604733..886625fb464b 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -3284,7 +3284,6 @@ int amdgpu_device_init(struct amdgpu_device *ad=
ev,
> > >   	/* mutex initialization are all done here so we
> > >   	 * can recall function without having locking issues */
> > > -	atomic_set(&adev->irq.ih.lock, 0);
> > >   	mutex_init(&adev->firmware.mutex);
> > >   	mutex_init(&adev->pm.mutex);
> > >   	mutex_init(&adev->gfx.gpu_clock_mutex);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ih.c
> > > index 1024065f1f03..faaa6aa2faaf 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> > > @@ -228,10 +228,6 @@ int amdgpu_ih_process(struct amdgpu_device *adev=
, struct amdgpu_ih_ring *ih)
> > >   	wptr =3D amdgpu_ih_get_wptr(adev, ih);
> > >   restart_ih:
> > > -	/* is somebody else already processing irqs? */
> > > -	if (atomic_xchg(&ih->lock, 1))
> > > -		return IRQ_NONE;
> > > -
> > >   	DRM_DEBUG("%s: rptr %d, wptr %d\n", __func__, ih->rptr, wptr);
> > >   	/* Order reading of wptr vs. reading of IH ring data */
> > > @@ -244,7 +240,6 @@ int amdgpu_ih_process(struct amdgpu_device *adev,=
 struct amdgpu_ih_ring *ih)
> > >   	amdgpu_ih_set_rptr(adev, ih);
> > >   	wake_up_all(&ih->wait_process);
> > > -	atomic_set(&ih->lock, 0);
> > >   	/* make sure wptr hasn't changed while processing */
> > >   	wptr =3D amdgpu_ih_get_wptr(adev, ih);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ih.h
> > > index 87ec6d20dbe0..0649b59830a5 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> > > @@ -64,7 +64,6 @@ struct amdgpu_ih_ring {
> > >   	bool                    enabled;
> > >   	unsigned		rptr;
> > > -	atomic_t		lock;
> > >   	struct amdgpu_ih_regs	ih_regs;
> > >   	/* For waiting on IH processing at checkpoint. */
> > > -- =

> > > 2.25.1
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
