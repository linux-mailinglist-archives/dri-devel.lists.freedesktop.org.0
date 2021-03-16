Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF4D33D0DD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 10:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D789829;
	Tue, 16 Mar 2021 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F9789829
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 09:32:48 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v15so10079807wrx.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mHGu/5ZK3gXCx4dgZQO6YqVr4qZthMZoodHsWHtbrgg=;
 b=Dguc1uXlkKAlC0wQhABHlAL7Z9iWHzralUL72BgTT8PpTzFt4olqBF+f3OvqUwFH7I
 g17rbZoIPhEGgGVA4OzFl+44OQ6I83p1lObOjlgMpA7HyXzw0btAKvdkrVI17iTMaP2i
 GBUv3tC/JOe7xoMSGAium0AichNkcexmrJYwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mHGu/5ZK3gXCx4dgZQO6YqVr4qZthMZoodHsWHtbrgg=;
 b=WZUSriv3VU9yTi3bKHltGwGdEzYZJDuW5wfbtRwCb7s+6a/ts3Vsyrygi4oP/G1JwF
 8/3XELNi4vU2NzxUQGo/r9CbhpduT/lxs8F36KNv//HAu9yNrYdRjD3GdWOgvl/0VC15
 j4CJcHpdvxb5uEqUU2lmm1Sg3nkU6JsKgLGE6JBP41nv6QBe2kk+wY4SUKSHkR7PW9SQ
 u5e4sxbrW3/E+slKnd2+7koDEjWKPwKQtiI/mkzG13tbVBjdjn1d3BHWMa4k6EacVKx+
 +CrVuSwZjT3zC9DBDfq8gDINU74gZIdufqo/+9ANh0bXo4xtlNdX1Pi2ACtDrBNLWV0M
 GfqQ==
X-Gm-Message-State: AOAM531rB8HjRbDsOcp4Vs6Do6HSA/xwM/8xKG19dLcLxLHm1hIHQrkh
 HqcZLYstfFCDtRlB5iWzzTw7iFmm8Ej9Q54w
X-Google-Smtp-Source: ABdhPJypIeRC7MQIfPpgc5RFtSkrGFKscokLCcwSDpikct/a5KgNG4Sp6Mr+WZP3EPyZ1DyN0woHDQ==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr3836768wrw.328.1615887167039; 
 Tue, 16 Mar 2021 02:32:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s16sm21403116wru.91.2021.03.16.02.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 02:32:46 -0700 (PDT)
Date: Tue, 16 Mar 2021 10:32:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: nuke the ih reentrant lock
Message-ID: <YFB7PKZUZcj5zTLZ@phenom.ffwll.local>
References: <20210312135906.3262-1-christian.koenig@amd.com>
 <YEt08RhEI23VPS4g@phenom.ffwll.local>
 <e5ed96e2-8252-4a3a-593a-24551edaa1e8@gmail.com>
 <YEt8RlrR86vkqiyZ@phenom.ffwll.local>
 <YEt8hSb4TMzXEb4a@phenom.ffwll.local>
 <3ec207d7-6a7a-91ec-95ce-8b1a95b7210f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ec207d7-6a7a-91ec-95ce-8b1a95b7210f@gmail.com>
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

On Fri, Mar 12, 2021 at 03:50:35PM +0100, Christian K=F6nig wrote:
> Am 12.03.21 um 15:36 schrieb Daniel Vetter:
> > On Fri, Mar 12, 2021 at 03:35:50PM +0100, Daniel Vetter wrote:
> > > On Fri, Mar 12, 2021 at 03:27:58PM +0100, Christian K=F6nig wrote:
> > > > =

> > > > Am 12.03.21 um 15:04 schrieb Daniel Vetter:
> > > > > On Fri, Mar 12, 2021 at 02:59:06PM +0100, Christian K=F6nig wrote:
> > > > > > Interrupts on are non-reentrant on linux. This is just an ancie=
nt
> > > > > > leftover from radeon where irq processing was kicked of from di=
fferent
> > > > > > places.
> > > > > > =

> > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > Man you tricked me into grepping this on radeon and it looks horr=
ible.
> > > > > atomic_t is unordered in linux, so whatever was built there for r=
adeon
> > > > > does not wokr like a lock. It's missing all the barriers afiui. G=
ood
> > > > > riddance at least for amdgpu.
> > > > Hui? atomic_xchg() is perfectly ordered as far as I know.
> > > Oh right, if atomic_ returns a value it's fully ordered. Nice tour in=
to
> > > memory-barriers.txt. It's the atomic_t operations that don't return
> > > anything which are fully unordered, and I mixed that up.
> > > =

> > > > IIRC Alex added this for R600 because we had boards where interrupt=
s where
> > > > sporadically swallowed during driver startup and we had to kick of =
ring
> > > > buffer processing manually.
> > > > =

> > > > Anyway we have a fence processing fallback timer in amdgpu instead =
and that
> > > > stuff is probably unused on any modern hardware.
> > > Ah yes that stuff. Kinda annoying we have these old dma_fence around =
where
> > > dma_fence_wait doesn't really work that well, but oh well.
> > Argh I'm not awake. dma_fence_wait() works well on these, but the gener=
ic
> > cb stuff (which is used in ever more place) doesn't, because it misses =
the
> > fallback timer the ->wait does.
> =

> That's not what I meant. See amdgpu_fence_schedule_fallback().
> =

> As soon as somebody requested a dma_fence to be signaled we start a 500ms
> timeout for fence processing which is cleared as soon as we see the first
> interrupt.
> =

> That is necessary because some motherboards have the ugly behavior of
> swallowing approx ~0.1% if all MSI interrupts after some idle time.
> =

> No idea where exactly that comes from, but I have the feeling that this w=
as
> the same bug Alex tried to handle on R6xx over 10 years ago with kicking =
of
> interrupt processing manually after enabling interrupts for the first tim=
e.

That's the same thing I mean. I think at least on radeon this is handled
by periodically waking up in the ->wait callback, but unfortunately that
doesn't take care of any of the callback based fence waiters. Maybe
there's a different reason on radeon for the lost interrupts, but I
thought consequences are the same. I think i915 also had some hacks like
that, not sure why it still has a ->wait callback tbh. Maybe that's still
needed for handling the gpu recovery flow on gen2/3, which is rather
non-standard and violates dma_fence nesting rules a bit. But oh well,
that's real old stuff.
-Daniel

> =

> Regards,
> Christian.
> =

> > -Daniel
> > =

> > > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Thanks,
> > > > Christian.
> > > > =

> > > > > > ---
> > > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
> > > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     | 5 -----
> > > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h     | 1 -
> > > > > >    3 files changed, 7 deletions(-)
> > > > > > =

> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > index a15f1b604733..886625fb464b 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > > > @@ -3284,7 +3284,6 @@ int amdgpu_device_init(struct amdgpu_devi=
ce *adev,
> > > > > >    	/* mutex initialization are all done here so we
> > > > > >    	 * can recall function without having locking issues */
> > > > > > -	atomic_set(&adev->irq.ih.lock, 0);
> > > > > >    	mutex_init(&adev->firmware.mutex);
> > > > > >    	mutex_init(&adev->pm.mutex);
> > > > > >    	mutex_init(&adev->gfx.gpu_clock_mutex);
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_ih.c
> > > > > > index 1024065f1f03..faaa6aa2faaf 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> > > > > > @@ -228,10 +228,6 @@ int amdgpu_ih_process(struct amdgpu_device=
 *adev, struct amdgpu_ih_ring *ih)
> > > > > >    	wptr =3D amdgpu_ih_get_wptr(adev, ih);
> > > > > >    restart_ih:
> > > > > > -	/* is somebody else already processing irqs? */
> > > > > > -	if (atomic_xchg(&ih->lock, 1))
> > > > > > -		return IRQ_NONE;
> > > > > > -
> > > > > >    	DRM_DEBUG("%s: rptr %d, wptr %d\n", __func__, ih->rptr, wpt=
r);
> > > > > >    	/* Order reading of wptr vs. reading of IH ring data */
> > > > > > @@ -244,7 +240,6 @@ int amdgpu_ih_process(struct amdgpu_device =
*adev, struct amdgpu_ih_ring *ih)
> > > > > >    	amdgpu_ih_set_rptr(adev, ih);
> > > > > >    	wake_up_all(&ih->wait_process);
> > > > > > -	atomic_set(&ih->lock, 0);
> > > > > >    	/* make sure wptr hasn't changed while processing */
> > > > > >    	wptr =3D amdgpu_ih_get_wptr(adev, ih);
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_ih.h
> > > > > > index 87ec6d20dbe0..0649b59830a5 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.h
> > > > > > @@ -64,7 +64,6 @@ struct amdgpu_ih_ring {
> > > > > >    	bool                    enabled;
> > > > > >    	unsigned		rptr;
> > > > > > -	atomic_t		lock;
> > > > > >    	struct amdgpu_ih_regs	ih_regs;
> > > > > >    	/* For waiting on IH processing at checkpoint. */
> > > > > > -- =

> > > > > > 2.25.1
> > > > > > =

> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > -- =

> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
