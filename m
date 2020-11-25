Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8412C4542
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059446EA2F;
	Wed, 25 Nov 2020 16:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066D6EA2F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:32:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so2531483wmd.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nBrO9nv1B1gyQCR7huherqy/ZakAicmiSzUs8NEZ6N4=;
 b=j0sAignAWpzqmJlmMp24fhf4E1P+BGw9y9KFTmi6ef70BIMF9Nz2rcS97Pj5wi0aj9
 KRqWu6HCkalZ0rCYrb5+QTe6cFr0hJZw7IqYoCyodYPEnzV1IxGJdJFZT1VePIfFgQQV
 DaFqkmVxbdjI+2AAdhBaQNS3KX3/wXsxFiQcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nBrO9nv1B1gyQCR7huherqy/ZakAicmiSzUs8NEZ6N4=;
 b=FrbvBA+R1zR5/3TrlDzYg7OLsTcEqXi104NnSGaGC5TnonEhjK6znKH07JeoVN+NIK
 rYeHfrow4AH2P9e/cOZTSeLSJkG6RQke7JCHPz2FGNETGLsv28IrQCK827kB4JCLEDNB
 IU21EJISo3owUzy9LKEjNftKMqTBIUXYdDFim8OJ4OHc/ugVy1OU3Zf1oRsSzxZ6K+ZG
 VhrphFdMslO5R+Y9H8fBDK2RmEuHhfPw0hvtgS4scIo0XEYGwAuV+5ubh16ovnAED7uY
 z+v3iHttiJ0vm3sS5gvG8c400R50HV3jz/vhucN60zd/EF3TN7fPIM8AA2JW1rNTm//e
 ESyQ==
X-Gm-Message-State: AOAM531ZXQylsrvFwMQlkHg8Db9cYrPvjE8Ingn4bMAQk6cL6bMcdqaH
 zF7oJ7aSbAatArZcATA5/f2HHQ==
X-Google-Smtp-Source: ABdhPJyXObaftNXrs7sJvvMP37m6AMUeh8xZurf9v2L/qW66uc3ZRQTniVGf7x1/iQ2eIL4HRO7DOg==
X-Received: by 2002:a7b:c349:: with SMTP id l9mr4959269wmj.129.1606321974192; 
 Wed, 25 Nov 2020 08:32:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 90sm5400218wrl.60.2020.11.25.08.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:32:53 -0800 (PST)
Date: Wed, 25 Nov 2020 17:32:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
Message-ID: <20201125163251.GY401619@phenom.ffwll.local>
References: <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
 <20201124140937.GK401619@phenom.ffwll.local>
 <278a4498-bdde-402a-1cea-668e9683f7eb@suse.de>
 <2f8a252a-5413-4b75-a367-f6233121e36e@amd.com>
 <20201125103645.GU401619@phenom.ffwll.local>
 <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd9dff4a-ec16-46d8-d892-b06dad5c11d3@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 12:38:01PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 25.11.20 um 11:36 schrieb Daniel Vetter:
> > On Wed, Nov 25, 2020 at 11:13:13AM +0100, Christian K=F6nig wrote:
> > > Am 25.11.20 um 09:37 schrieb Thomas Zimmermann:
> > > > Hi
> > > > =

> > > > Am 24.11.20 um 15:09 schrieb Daniel Vetter:
> > > > > On Tue, Nov 24, 2020 at 02:56:51PM +0100, Thomas Zimmermann wrote:
> > > > > > Hi
> > > > > > =

> > > > > > Am 24.11.20 um 14:36 schrieb Christian K=F6nig:
> > > > > > > Am 24.11.20 um 13:15 schrieb Thomas Zimmermann:
> > > > > > > > [SNIP]
> > > > > > > > > > > > First I wanted to put this into
> > > > > > > > > > > > drm_gem_ttm_vmap/vunmap(), but then wondered why
> > > > > > > > > > > > ttm_bo_vmap() doe not acquire the lock internally?
> > > > > > > > > > > > I'd expect that vmap/vunmap are close together and
> > > > > > > > > > > > do not overlap for the same BO.
> > > > > > > > > > > =

> > > > > > > > > > > We have use cases like the following during command s=
ubmission:
> > > > > > > > > > > =

> > > > > > > > > > > 1. lock
> > > > > > > > > > > 2. map
> > > > > > > > > > > 3. copy parts of the BO content somewhere else or pat=
ch
> > > > > > > > > > > it with additional information
> > > > > > > > > > > 4. unmap
> > > > > > > > > > > 5. submit BO to the hardware
> > > > > > > > > > > 6. add hardware fence to the BO to make sure it doesn=
't move
> > > > > > > > > > > 7. unlock
> > > > > > > > > > > =

> > > > > > > > > > > That use case won't be possible with vmap/vunmap if we
> > > > > > > > > > > move the lock/unlock into it and I hope to replace the
> > > > > > > > > > > kmap/kunmap functions with them in the near term.
> > > > > > > > > > > =

> > > > > > > > > > > > Otherwise, acquiring the reservation lock would
> > > > > > > > > > > > require another ref-counting variable or per-driver
> > > > > > > > > > > > code.
> > > > > > > > > > > =

> > > > > > > > > > > Hui, why that? Just put this into
> > > > > > > > > > > drm_gem_ttm_vmap/vunmap() helper as you initially
> > > > > > > > > > > planned.
> > > > > > > > > > =

> > > > > > > > > > Given your example above, step one would acquire the lo=
ck,
> > > > > > > > > > and step two would also acquire the lock as part of the=
 vmap
> > > > > > > > > > implementation. Wouldn't this fail (At least during unm=
ap or
> > > > > > > > > > unlock steps) ?
> > > > > > > > > =

> > > > > > > > > Oh, so you want to nest them? No, that is a rather bad no=
-go.
> > > > > > > > =

> > > > > > > > I don't want to nest/overlap them. My question was whether =
that
> > > > > > > > would be required. Apparently not.
> > > > > > > > =

> > > > > > > > While the console's BO is being set for scanout, it's prote=
cted from
> > > > > > > > movement via the pin/unpin implementation, right?
> > > > > > > =

> > > > > > > Yes, correct.
> > > > > > > =

> > > > > > > > The driver does not acquire the resv lock for longer period=
s. I'm
> > > > > > > > asking because this would prevent any console-buffer update=
s while
> > > > > > > > the console is being displayed.
> > > > > > > =

> > > > > > > Correct as well, we only hold the lock for things like command
> > > > > > > submission, pinning, unpinning etc etc....
> > > > > > > =

> > > > > > =

> > > > > > Thanks for answering my questions.
> > > > > > =

> > > > > > > > =

> > > > > > > > > =

> > > > > > > > > You need to make sure that the lock is only taken from th=
e FB
> > > > > > > > > path which wants to vmap the object.
> > > > > > > > > =

> > > > > > > > > Why don't you lock the GEM object from the caller in the =
generic
> > > > > > > > > FB implementation?
> > > > > > > > =

> > > > > > > > With the current blitter code, it breaks abstraction. if vm=
ap/vunmap
> > > > > > > > hold the lock implicitly, things would be easier.
> > > > > > > =

> > > > > > > Do you have a link to the code?
> > > > > > =

> > > > > > It's the damage blitter in the fbdev code. [1] While it flushes
> > > > > > the shadow
> > > > > > buffer into the BO, the BO has to be kept in place. I already
> > > > > > changed it to
> > > > > > lock struct drm_fb_helper.lock, but I don't think this is
> > > > > > enough. TTM could
> > > > > > still evict the BO concurrently.
> > > > > =

> > > > > So I'm not sure this is actually a problem: ttm could try to
> > > > > concurrently
> > > > > evict the buffer we pinned into vram, and then just skip to the n=
ext
> > > > > one.
> > > > > =

> > > > > Plus atm generic fbdev isn't used on any chip where we really car=
e about
> > > > > that last few mb of vram being useable for command submission (we=
ll atm
> > > > > there's no driver using it).
> > > > =

> > > > Well, this is the patchset for radeon. If it works out, amdgpu and
> > > > nouveau are natural next choices. Especially radeon and nouveau sup=
port
> > > > cards with low- to medium-sized VRAM. The MiBs wasted on fbdev cert=
ainly
> > > > matter.
> > > > =

> > > > > =

> > > > > Having the buffer pinned into system memory and trying to do a
> > > > > concurrent
> > > > > modeset that tries to pull it in is the hard failure mode. And ho=
lding
> > > > > fb_helper.lock fully prevents that.
> > > > > =

> > > > > So not really clear on what failure mode you're seeing here?
> > > > =

> > > > Imagine the fbdev BO is in VRAM, but not pinned. (Maybe Xorg or Way=
land
> > > > is running.) The fbdev BO is a few MiBs and not in use, so TTM would
> > > > want to evict it if memory gets tight.
> > > > =

> > > > What I have in mind is a concurrent modeset that requires the memor=
y. If
> > > > we do a concurrent damage blit without protecting against eviction,
> > > > things go boom. Same for concurrent 3d graphics with textures, model
> > > > data, etc.
> > > =

> > > Completely agree.
> > > =

> > > This needs proper lock protection of the memory mapped buffer. Relyin=
g on
> > > that some other code isn't run because we have some third part locks =
taken
> > > is not sufficient here.
> > =

> > We are still protected by the pin count in this scenario. Plus, with
> > current drivers we always pin the fbdev buffer into vram, so occasional=
ly
> > failing to move it out isn't a regression.
> =

> Why is this protected by the pin count? The counter should be zero in this
> scenario. Otherwise, we could not evict the fbdev BO on all those systems
> where that's a hard requirement (e.g., ast).

Ah yes, I mixed that up.

I guess full locking is required :-/ I'm not exactly sure how to make this
happen with the current plethora of helpers ... I think we need an
_locked version of vmap/vunmap callbacks in drm_gem_object_funcs.

And then document that if the callers of the _locked version wants a
permanent mapping, it also needs to pin it. Plus I guess ideally implement
the unlocked/permanent versions in terms of that, so that drivers only
have to implement one or the other.

That should give us at least some way forward to gradually conver all the
drivers and helpers over to dma_resv locking.
-Daniel

> The pin count is currently maintained by the vmap implementation in vram
> helpers. Calling vmap is an implicit pin; calling vunmap is an implicit
> unpin. This prevents eviction in the damage worker. But now I was told th=
an
> pinning is only for BOs that are controlled by userspace and internal use=
rs
> should acquire the resv lock. So vram helpers have to be fixed, actually.
> =

> In vram helpers, unmapping does not mean eviction. The unmap operation on=
ly
> marks the BO as unmappable. The real unmap happens when the eviction takes
> place. This avoids many modifications to the page tables. IOW an unpinned,
> unmapped BO will remain in VRAM until the memory is actually needed.
> =

> Best regards
> Thomas
> =

> > =

> > So I'm still not seeing how this can go boom.
> > =

> > Now long term it'd be nice to cut everything over to dma_resv locking, =
but
> > the issue there is that beyond ttm, none of the helpers (and few of the
> > drivers) use dma_resv. So this is a fairly big uphill battle. Quick
> > interim fix seems like the right solution to me.
> > -Daniel
> > =

> > > =

> > > Regards,
> > > Christian.
> > > =

> > > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > > =

> > > > > > There's no recursion taking place, so I guess the reservation
> > > > > > lock could be
> > > > > > acquired/release in drm_client_buffer_vmap/vunmap(), or a
> > > > > > separate pair of
> > > > > > DRM client functions could do the locking.
> > > > > =

> > > > > Given how this "do the right locking" is a can of worms (and I th=
ink
> > > > > it's
> > > > > worse than what you dug out already) I think the fb_helper.lock h=
ack is
> > > > > perfectly good enough.
> > > > > =

> > > > > I'm also somewhat worried that starting to use dma_resv lock in g=
eneric
> > > > > code, while many helpers/drivers still have their hand-rolled loc=
king,
> > > > > will make conversion over to dma_resv needlessly more complicated.
> > > > > -Daniel
> > > > > =

> > > > > > =

> > > > > > Best regards
> > > > > > Thomas
> > > > > > =

> > > > > > [1] https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/d=
rm/drm_fb_helper.c?id=3Dac60f3f3090115d21f028bffa2dcfb67f695c4f2#n394
> > > > > > =

> > > > > > > =

> > > > > > > Please note that the reservation lock you need to take here i=
s part of
> > > > > > > the GEM object.
> > > > > > > =

> > > > > > > Usually we design things in the way that the code needs to ta=
ke a lock
> > > > > > > which protects an object, then do some operations with the ob=
ject and
> > > > > > > then release the lock again.
> > > > > > > =

> > > > > > > Having in the lock inside the operation can be done as well, =
but
> > > > > > > returning with it is kind of unusual design.
> > > > > > > =

> > > > > > > > Sorry for the noob questions. I'm still trying to understan=
d the
> > > > > > > > implications of acquiring these locks.
> > > > > > > =

> > > > > > > Well this is the reservation lock of the GEM object we are
> > > > > > > talking about
> > > > > > > here. We need to take that for a couple of different operatio=
ns,
> > > > > > > vmap/vunmap doesn't sound like a special case to me.
> > > > > > > =

> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > =

> > > > > > > > =

> > > > > > > > Best regards
> > > > > > > > Thomas
> > > > > > > =

> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > =

> > > > > > -- =

> > > > > > Thomas Zimmermann
> > > > > > Graphics Driver Developer
> > > > > > SUSE Software Solutions Germany GmbH
> > > > > > Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> > > > > > (HRB 36809, AG N=FCrnberg)
> > > > > > Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> > > > > =

> > > > > =

> > > > > =

> > > > > =

> > > > > =

> > > > > =

> > > > =

> > > =

> > =

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
