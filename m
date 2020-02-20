Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103541667FF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 21:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACAF6E8E7;
	Thu, 20 Feb 2020 20:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6D6E8E7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 20:08:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b17so3438603wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2R18gBeefFDn7PhQhknKi2vA9kbrotIjLif/qMcqs1E=;
 b=h3wrZuko9Z0tTphiCEiKhJPLboZaaQRDdNxpmVETaXXtKEG0b7kbi69nm2E1knuBJI
 xzF9/0ZvXNIGPQ977lECZ66IsQk9daQ/FLkh9FnXdliVRkxmMC5d+0qoyIkWlKSEIhpt
 5Ix1QXcNNVOO6ihpCy24vAC58abKim0ReeSWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2R18gBeefFDn7PhQhknKi2vA9kbrotIjLif/qMcqs1E=;
 b=qQMeRYEpGnyq4n+Msl6pIwBfwRJi7+1zxHzBKJeYKud8T3dUATyKhPDP3bKR3M6JVn
 H8/DK0fLcA9kDi/mFEXAohLKPw7qocPbkPXFWe00OzCNHQaBBKivE1oVidNyQ2/WfdU2
 Mol8knIKbzNu0Y2ms6krAfbJ1MUr1bWgWNd8LAWcBVVN2gvpRajlZ4UJd5rFO9J0JHY+
 bkitrtZxepyVCh4CWa//BA8H/5Chpwa3aeSjjQVROR+rOPXs1sj9ikgMyR6Iuv/bzQIf
 D9L6CKANxrgssOZBq4gny1579iEGZbGjhb9t4Hmp42bbbdReVOgg5Br5IoxMAn9J5kp3
 1LZA==
X-Gm-Message-State: APjAAAVqLQxoanTPypRCLVvhtYa+WnYjBeti0VCi9uG3wUt1o6nwSDWh
 pRd9Py95FKKuoeoMTviQAghDWg==
X-Google-Smtp-Source: APXvYqzSYcm1ZL8tLYGM+DG6teDYZMDC4wcfWZfvx5SIT6ZlUvTamimJE2dpMpEsZAk0tq7rC6BiqA==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr6648607wmg.16.1582229314153; 
 Thu, 20 Feb 2020 12:08:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g19sm485097wmh.36.2020.02.20.12.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:08:33 -0800 (PST)
Date: Thu, 20 Feb 2020 21:08:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Message-ID: <20200220200831.GA2363188@phenom.ffwll.local>
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 08:46:27PM +0100, Thomas Hellstr=F6m (VMware) wrote:
> On 2/20/20 7:04 PM, Daniel Vetter wrote:
> > On Thu, Feb 20, 2020 at 10:39:06AM +0100, Thomas Hellstr=F6m (VMware) w=
rote:
> > > On 2/19/20 7:42 AM, Thomas Hellstr=F6m (VMware) wrote:
> > > > On 2/18/20 10:01 PM, Daniel Vetter wrote:
> > > > > On Tue, Feb 18, 2020 at 9:17 PM Thomas Hellstr=F6m (VMware)
> > > > > <thomas_os@shipmail.org> wrote:
> > > > > > On 2/17/20 6:55 PM, Daniel Vetter wrote:
> > > > > > > On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian K=F6nig w=
rote:
> > > > > > > > Implement the importer side of unpinned DMA-buf handling.
> > > > > > > > =

> > > > > > > > v2: update page tables immediately
> > > > > > > > =

> > > > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > > > ---
> > > > > > > >  =A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66
> > > > > > > > ++++++++++++++++++++-
> > > > > > > >  =A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c=A0 |=A0 =
6 ++
> > > > > > > >  =A0=A0 2 files changed, 71 insertions(+), 1 deletion(-)
> > > > > > > > =

> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > index 770baba621b3..48de7624d49c 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > > > @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct
> > > > > > > > drm_device *dev, struct dma_buf *dma_buf)
> > > > > > > >  =A0=A0=A0=A0=A0 return ERR_PTR(ret);
> > > > > > > >  =A0=A0 }
> > > > > > > > =

> > > > > > > > +/**
> > > > > > > > + * amdgpu_dma_buf_move_notify - &attach.move_notify implem=
entation
> > > > > > > > + *
> > > > > > > > + * @attach: the DMA-buf attachment
> > > > > > > > + *
> > > > > > > > + * Invalidate the DMA-buf attachment, making sure that
> > > > > > > > the we re-create the
> > > > > > > > + * mapping before the next use.
> > > > > > > > + */
> > > > > > > > +static void
> > > > > > > > +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *atta=
ch)
> > > > > > > > +{
> > > > > > > > +=A0=A0=A0 struct drm_gem_object *obj =3D attach->importer_=
priv;
> > > > > > > > +=A0=A0=A0 struct ww_acquire_ctx *ticket =3D dma_resv_locki=
ng_ctx(obj->resv);
> > > > > > > > +=A0=A0=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > > > > > > > +=A0=A0=A0 struct amdgpu_device *adev =3D amdgpu_ttm_adev(b=
o->tbo.bdev);
> > > > > > > > +=A0=A0=A0 struct ttm_operation_ctx ctx =3D { false, false =
};
> > > > > > > > +=A0=A0=A0 struct ttm_placement placement =3D {};
> > > > > > > > +=A0=A0=A0 struct amdgpu_vm_bo_base *bo_base;
> > > > > > > > +=A0=A0=A0 int r;
> > > > > > > > +
> > > > > > > > +=A0=A0=A0 if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > > +
> > > > > > > > +=A0=A0=A0 r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx=
);
> > > > > > > > +=A0=A0=A0 if (r) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_ERROR("Failed to inv=
alidate DMA-buf
> > > > > > > > import (%d))\n", r);
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > > > +=A0=A0=A0 }
> > > > > > > > +
> > > > > > > > +=A0=A0=A0 for (bo_base =3D bo->vm_bo; bo_base; bo_base =3D=
 bo_base->next) {
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct amdgpu_vm *vm =3D=
 bo_base->vm;
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dma_resv *resv =
=3D vm->root.base.bo->tbo.base.resv;
> > > > > > > > +
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ticket) {
> > > > > > > Yeah so this is kinda why I've been a total pain about the
> > > > > > > exact semantics
> > > > > > > of the move_notify hook. I think we should flat-out require
> > > > > > > that importers
> > > > > > > _always_ have a ticket attach when they call this, and that
> > > > > > > they can cope
> > > > > > > with additional locks being taken (i.e. full EDEADLCK) handli=
ng.
> > > > > > > =

> > > > > > > Simplest way to force that contract is to add a dummy 2nd
> > > > > > > ww_mutex lock to
> > > > > > > the dma_resv object, which we then can take #ifdef
> > > > > > > CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
> > > > > > > =

> > > > > > > Now the real disaster is how we handle deadlocks. Two issues:
> > > > > > > =

> > > > > > > - Ideally we'd keep any lock we've taken locked until the
> > > > > > > end, it helps
> > > > > > >  =A0=A0=A0 needless backoffs. I've played around a bit with t=
hat
> > > > > > > but not even poc
> > > > > > >  =A0=A0=A0 level, just an idea:
> > > > > > > =

> > > > > > > https://cgit.freedesktop.org/~danvet/drm/commit/?id=3Db1799c5=
a0f02df9e1bb08d27be37331255ab7582
> > > > > > > =

> > > > > > > =

> > > > > > >  =A0=A0=A0 Idea is essentially to track a list of objects we =
had to
> > > > > > > lock as part of
> > > > > > >  =A0=A0=A0 the ttm_bo_validate of the main object.
> > > > > > > =

> > > > > > > - Second one is if we get a EDEADLCK on one of these
> > > > > > > sublocks (like the
> > > > > > >  =A0=A0=A0 one here). We need to pass that up the entire call=
chain,
> > > > > > > including a
> > > > > > >  =A0=A0=A0 temporary reference (we have to drop locks to do t=
he
> > > > > > > ww_mutex_lock_slow
> > > > > > >  =A0=A0=A0 call), and need a custom callback to drop that tem=
porary reference
> > > > > > >  =A0=A0=A0 (since that's all driver specific, might even be
> > > > > > > internal ww_mutex and
> > > > > > >  =A0=A0=A0 not anything remotely looking like a normal dma_bu=
f).
> > > > > > > This probably
> > > > > > >  =A0=A0=A0 needs the exec util helpers from ttm, but at the
> > > > > > > dma_resv level, so that
> > > > > > >  =A0=A0=A0 we can do something like this:
> > > > > > > =

> > > > > > > struct dma_resv_ticket {
> > > > > > >  =A0=A0=A0=A0=A0=A0 struct ww_acquire_ctx base;
> > > > > > > =

> > > > > > >  =A0=A0=A0=A0=A0=A0 /* can be set by anyone (including other =
drivers)
> > > > > > > that got hold of
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * this ticket and had to acquire some =
new lock. This
> > > > > > > lock might
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * protect anything, including driver-i=
nternal stuff, and isn't
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * required to be a dma_buf or even jus=
t a dma_resv. */
> > > > > > >  =A0=A0=A0=A0=A0=A0 struct ww_mutex *contended_lock;
> > > > > > > =

> > > > > > >  =A0=A0=A0=A0=A0=A0 /* callback which the driver (which might=
 be a dma-buf exporter
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * and not matching the driver that sta=
rted this
> > > > > > > locking ticket)
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * sets together with @contended_lock, =
for the main
> > > > > > > driver to drop
> > > > > > >  =A0=A0=A0=A0=A0=A0=A0 * when it calls dma_resv_unlock on the=
 contended_lock. */
> > > > > > >  =A0=A0=A0=A0=A0=A0 void (drop_ref*)(struct ww_mutex *contend=
ed_lock);
> > > > > > > };
> > > > > > > =

> > > > > > > This is all supremely nasty (also ttm_bo_validate would need =
to be
> > > > > > > improved to handle these sublocks and random new objects
> > > > > > > that could force
> > > > > > > a ww_mutex_lock_slow).
> > > > > > > =

> > > > > > Just a short comment on this:
> > > > > > =

> > > > > > Neither the currently used wait-die or the wound-wait algorithm
> > > > > > *strictly* requires a slow lock on the contended lock. For
> > > > > > wait-die it's
> > > > > > just very convenient since it makes us sleep instead of spinnin=
g with
> > > > > > -EDEADLK on the contended lock. For wound-wait IIRC one could j=
ust
> > > > > > immediately restart the whole locking transaction after an
> > > > > > -EDEADLK, and
> > > > > > the transaction would automatically end up waiting on the conte=
nded
> > > > > > lock, provided the mutex lock stealing is not allowed. There is=
 however
> > > > > > a possibility that the transaction will be wounded again on ano=
ther
> > > > > > lock, taken before the contended lock, but I think there are wa=
ys to
> > > > > > improve the wound-wait algorithm to reduce that probability.
> > > > > > =

> > > > > > So in short, choosing the wound-wait algorithm instead of wait-=
die and
> > > > > > perhaps modifying the ww mutex code somewhat would probably help
> > > > > > passing
> > > > > > an -EDEADLK up the call chain without requiring passing the con=
tended
> > > > > > lock, as long as each locker releases its own locks when receiv=
ing an
> > > > > > -EDEADLK.
> > > > > Hm this is kinda tempting, since rolling out the full backoff tri=
cker
> > > > > across driver boundaries is going to be real painful.
> > > > > =

> > > > > What I'm kinda worried about is the debug/validation checks we're
> > > > > losing with this. The required backoff has this nice property that
> > > > > ww_mutex debug code can check that we've fully unwound everything=
 when
> > > > > we should, that we've blocked on the right lock, and that we're
> > > > > restarting everything without keeling over. Without that I think =
we
> > > > > could end up with situations where a driver in the middle feels l=
ike
> > > > > handling the EDEADLCK, which might go well most of the times (the
> > > > > deadlock will probably be mostly within a given driver, not acros=
s).
> > > > > Right up to the point where someone creates a deadlock across dri=
vers,
> > > > > and the lack of full rollback will be felt.
> > > > > =

> > > > > So not sure whether we can still keep all these debug/validation
> > > > > checks, or whether this is a step too far towards clever tricks.
> > > > I think we could definitely find a way to keep debugging to make su=
re
> > > > everything is unwound before attempting to restart the locking
> > > > transaction. But the debug check that we're restarting on the conte=
nded
> > > > lock only really makes sense for wait-die, (and we could easily kee=
p it
> > > > for wait-die). The lock returning -EDEADLK for wound-wait may actua=
lly
> > > > not be the contending lock but an arbitrary lock that the wounded
> > > > transaction attempts to take after it is wounded.
> > > > =

> > > > So in the end IMO this is a tradeoff between added (possibly severe)
> > > > locking complexity into dma-buf and not being able to switch back to
> > > > wait-die efficiently if we need / want to do that.
> > > > =

> > > > /Thomas
> > > And as a consequence an interface *could* be:
> > > =

> > > *) We introduce functions
> > > =

> > > void ww_acquire_relax(struct ww_acquire_ctx *ctx);
> > > int ww_acquire_relax_interruptible(struct ww_acquire_ctx *ctx);
> > > =

> > > that can be used instead of ww_mutex_lock_slow() in the absence of a
> > > contending lock to avoid spinning on -EDEADLK. While trying to take t=
he
> > > contending lock is probably the best choice there are various second =
best
> > > approaches that can be explored, for example waiting on the contending
> > > acquire to finish or in the wound-wait case, perhaps do nothing. These
> > > functions will also help us keep the debugging.
> > Hm ... I guess this could work. Trouble is, it only gets rid of the
> > slowpath locking book-keeping headaches, we still have quite a few othe=
rs.
> > =

> > > *) A function returning -EDEADLK to a caller *must* have already rele=
ased
> > > its own locks.
> > So this ties to another question, as in should these callbacks have to
> > drops the locks thei acquire (much simpler code) or not (less thrashing,
> > if we drop locks we might end up in a situation where threads thrash
> > around instead of realizing quicker that they're actually deadlocking a=
nd
> > one of them should stop and back off).
> =

> Hmm.. Could you describe such a thrashing case with an example?

Ignoring cross device fun and all that, just a simplified example of why
holding onto locks you've acquired for eviction is useful, at least in a
slow path.

- one thread trying to do an execbuf with a huge bo

vs.

- an entire pile of thread that try to do execbuf with just a few small bo

First thread is in the eviction loop, selects a bo, wins against all the
other thread since it's been doing this forever already, gets the bo moved
out, unlocks.

Since it's competing against lots of other threads with small bo, it'll
have to do that a lot of times. Often enough to create a contiguous hole.
If you have a smarter allocator that tries to create that hole more
actively, just assume that the single huge bo is a substantial part of
total vram.

The other threads will be quicker in cramming new stuff in, even if they
occasionally lose the ww dance against the single thread. So the big
thread livelocks.

If otoh the big thread would keep onto all the locks, eventually it have
the entire vram locked, and every other thread is guaranteed to lose
against it in the ww dance and queue up behind. And it could finally but
its huge bo into vram and execute.

Vary example for multi-gpu and more realism, but that's roughly it.

Aside, a lot of the stuff Christian has been doing in ttm is to improve
the chances that the competing threads will hit one of the locked objects
of the big thread, and at least back off a bit. That's at least my
understanding of what's been happening.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
