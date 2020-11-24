Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365EC2C290B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B42E6E3FE;
	Tue, 24 Nov 2020 14:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903FE6E3EF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:09:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a186so2550854wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=io53FKgW6KtrvZEyR87vDJgh7I2D9Zizjzc1DmNCuHQ=;
 b=I2QBjoSMgQCQxJ5tYJrgrWizW5QM1xzfrUCtyCMnLF9oWxTtFsWtfgL/A7Na+AENQr
 hIxaeM1HJz6f32AHHapsc9RPhTUwYK4odQzlPinQ2bdMJOLaKTDKl5Ec9IBBe3oiC8bW
 Our3yuj+771BVXJnOmq71hVix/oTvrfMnbZ2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=io53FKgW6KtrvZEyR87vDJgh7I2D9Zizjzc1DmNCuHQ=;
 b=d812GDsq6ZAzUTt91aW1xstm5ZUuSXY1aEJ4XmemWZZCUPvcuGcw9lVRrs+ooX11bY
 aKe2oJNJkM0i7JXPCLRqgVVlLv9eWzAv6+XELa0nRU/ZAwo8z3EBILiT/a3qDoiFt7fm
 YHuH3hZS7CO+dEXfNYKh/Y3vJmVmwnYBNoDHiIsNg7KWBdAIi+Rhbwq7/n7fOqrpmy0L
 kzJWIoaBuqXIpG9iwMCp8MgYVn2cHBp1UJFNgrZfAAgZ40tFBrn7fzeJe+NcFDmYsIJN
 gGXpvVi2oPhbKAmTv2qjMDRTBaJSNfkbZgkqewYQ06ULSt5zDblxnYc8mFtLZKCsGnWY
 Tong==
X-Gm-Message-State: AOAM530xNf2Oz//vejGNW3gBGQuL8XvvzJ8gKicmnMDU3mMo+cFmCXZT
 daZNuKnVEOhTbVFitD/yEHNHIg==
X-Google-Smtp-Source: ABdhPJxQybOyzWTCbAguwPQ7yKoqREeNLtYhCsdMMBqF4tx/PQEylvi7E5jR/rx5aer54pMK2XQfQg==
X-Received: by 2002:a1c:c205:: with SMTP id s5mr4763784wmf.122.1606226980787; 
 Tue, 24 Nov 2020 06:09:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c4sm28263835wrd.30.2020.11.24.06.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:09:39 -0800 (PST)
Date: Tue, 24 Nov 2020 15:09:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
Message-ID: <20201124140937.GK401619@phenom.ffwll.local>
References: <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 02:56:51PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 24.11.20 um 14:36 schrieb Christian K=F6nig:
> > Am 24.11.20 um 13:15 schrieb Thomas Zimmermann:
> > > [SNIP]
> > > > > > > First I wanted to put this into
> > > > > > > drm_gem_ttm_vmap/vunmap(), but then wondered why
> > > > > > > ttm_bo_vmap() doe not acquire the lock internally?
> > > > > > > I'd expect that vmap/vunmap are close together and
> > > > > > > do not overlap for the same BO.
> > > > > > =

> > > > > > We have use cases like the following during command submission:
> > > > > > =

> > > > > > 1. lock
> > > > > > 2. map
> > > > > > 3. copy parts of the BO content somewhere else or patch
> > > > > > it with additional information
> > > > > > 4. unmap
> > > > > > 5. submit BO to the hardware
> > > > > > 6. add hardware fence to the BO to make sure it doesn't move
> > > > > > 7. unlock
> > > > > > =

> > > > > > That use case won't be possible with vmap/vunmap if we
> > > > > > move the lock/unlock into it and I hope to replace the
> > > > > > kmap/kunmap functions with them in the near term.
> > > > > > =

> > > > > > > Otherwise, acquiring the reservation lock would
> > > > > > > require another ref-counting variable or per-driver
> > > > > > > code.
> > > > > > =

> > > > > > Hui, why that? Just put this into
> > > > > > drm_gem_ttm_vmap/vunmap() helper as you initially
> > > > > > planned.
> > > > > =

> > > > > Given your example above, step one would acquire the lock,
> > > > > and step two would also acquire the lock as part of the vmap
> > > > > implementation. Wouldn't this fail (At least during unmap or
> > > > > unlock steps) ?
> > > > =

> > > > Oh, so you want to nest them? No, that is a rather bad no-go.
> > > =

> > > I don't want to nest/overlap them. My question was whether that
> > > would be required. Apparently not.
> > > =

> > > While the console's BO is being set for scanout, it's protected from
> > > movement via the pin/unpin implementation, right?
> > =

> > Yes, correct.
> > =

> > > The driver does not acquire the resv lock for longer periods. I'm
> > > asking because this would prevent any console-buffer updates while
> > > the console is being displayed.
> > =

> > Correct as well, we only hold the lock for things like command
> > submission, pinning, unpinning etc etc....
> > =

> =

> Thanks for answering my questions.
> =

> > > =

> > > > =

> > > > You need to make sure that the lock is only taken from the FB
> > > > path which wants to vmap the object.
> > > > =

> > > > Why don't you lock the GEM object from the caller in the generic
> > > > FB implementation?
> > > =

> > > With the current blitter code, it breaks abstraction. if vmap/vunmap
> > > hold the lock implicitly, things would be easier.
> > =

> > Do you have a link to the code?
> =

> It's the damage blitter in the fbdev code. [1] While it flushes the shadow
> buffer into the BO, the BO has to be kept in place. I already changed it =
to
> lock struct drm_fb_helper.lock, but I don't think this is enough. TTM cou=
ld
> still evict the BO concurrently.

So I'm not sure this is actually a problem: ttm could try to concurrently
evict the buffer we pinned into vram, and then just skip to the next one.

Plus atm generic fbdev isn't used on any chip where we really care about
that last few mb of vram being useable for command submission (well atm
there's no driver using it).

Having the buffer pinned into system memory and trying to do a concurrent
modeset that tries to pull it in is the hard failure mode. And holding
fb_helper.lock fully prevents that.

So not really clear on what failure mode you're seeing here?

> There's no recursion taking place, so I guess the reservation lock could =
be
> acquired/release in drm_client_buffer_vmap/vunmap(), or a separate pair of
> DRM client functions could do the locking.

Given how this "do the right locking" is a can of worms (and I think it's
worse than what you dug out already) I think the fb_helper.lock hack is
perfectly good enough.

I'm also somewhat worried that starting to use dma_resv lock in generic
code, while many helpers/drivers still have their hand-rolled locking,
will make conversion over to dma_resv needlessly more complicated.
-Daniel

> =

> Best regards
> Thomas
> =

> [1] https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/drm_fb_=
helper.c?id=3Dac60f3f3090115d21f028bffa2dcfb67f695c4f2#n394
> =

> > =

> > Please note that the reservation lock you need to take here is part of
> > the GEM object.
> > =

> > Usually we design things in the way that the code needs to take a lock
> > which protects an object, then do some operations with the object and
> > then release the lock again.
> > =

> > Having in the lock inside the operation can be done as well, but
> > returning with it is kind of unusual design.
> > =

> > > Sorry for the noob questions. I'm still trying to understand the
> > > implications of acquiring these locks.
> > =

> > Well this is the reservation lock of the GEM object we are talking about
> > here. We need to take that for a couple of different operations,
> > vmap/vunmap doesn't sound like a special case to me.
> > =

> > Regards,
> > Christian.
> > =

> > > =

> > > Best regards
> > > Thomas
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer






-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
