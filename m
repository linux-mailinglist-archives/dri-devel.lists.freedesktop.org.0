Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C351665C9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CD36EE23;
	Thu, 20 Feb 2020 18:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E7C6EE29
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:05:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u6so5743155wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KrEu6t519DhDi/4czv4nTfUeWrxPftvMj6L9vzgwdpc=;
 b=Xrmtxf9zxFfE/fWbAtuQpdmSKvmosami2QEtZS+92t8OJWhBgqLVJPIyqiOvwobubC
 2g+q6dRA9/tH2RUVFwmIrjLbABBS3eSC2aKBGPrVipEGZSsaIMbMUvYc0rA8CJNNpyhz
 M+8+sSMOyuiOjSg+zaJHh4T2NkLdSNxUE4Mxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KrEu6t519DhDi/4czv4nTfUeWrxPftvMj6L9vzgwdpc=;
 b=Vq4H+LjsHyZbAQGIXjlAwJs4nORgkyI/ddnHC45ColLk6t9wt8PozpfQGNQtkMq/im
 kEoWDjqLksupcNMkTRoQThCvJYFSBR/F9bnbtuM92P1kkjIXcWbUIYChCEL2HCHH4Val
 KgubJfRf+dUvdw6/VgFTAs13luLkg/cjym3oBskk+hqbbiMv0s5hYE0SSSN6SYRofT+z
 yCkBZPzfTKJ43ej/1S7iarqXKh+Rq5seUSI6DzWGJexE8gX188xCSGm7G4sudcKQKDHN
 d4Q3TnttNJVtJmtI2MTIRUfPwcllfq2hcU4S2TedThALqMGUqTM01IO4wEJ1vdbG9gND
 YjCw==
X-Gm-Message-State: APjAAAXLgeA+oSR8Kw7UwOWpy16grUjKBTFWdttqM/WNBbMPY2HtlRHv
 +s2B9T/P7lZFpDwayE55NnJz8QOBtrc=
X-Google-Smtp-Source: APXvYqxvvuIbQ0wO6xGLKMFwO7gvq0NobJAo6KSaqM/08Hoo3veTtPNEE5bXfrP13Slc5sQPh5u6cg==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr46265344wrk.249.1582221902256; 
 Thu, 20 Feb 2020 10:05:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm412122wrv.63.2020.02.20.10.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:05:01 -0800 (PST)
Date: Thu, 20 Feb 2020 19:04:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Message-ID: <20200220180459.GS2363188@phenom.ffwll.local>
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
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

On Thu, Feb 20, 2020 at 10:39:06AM +0100, Thomas Hellstr=F6m (VMware) wrote:
> On 2/19/20 7:42 AM, Thomas Hellstr=F6m (VMware) wrote:
> > On 2/18/20 10:01 PM, Daniel Vetter wrote:
> > > On Tue, Feb 18, 2020 at 9:17 PM Thomas Hellstr=F6m (VMware)
> > > <thomas_os@shipmail.org> wrote:
> > > > On 2/17/20 6:55 PM, Daniel Vetter wrote:
> > > > > On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian K=F6nig wrote:
> > > > > > Implement the importer side of unpinned DMA-buf handling.
> > > > > > =

> > > > > > v2: update page tables immediately
> > > > > > =

> > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > ---
> > > > > > =A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66
> > > > > > ++++++++++++++++++++-
> > > > > > =A0=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c=A0 |=A0 6 ++
> > > > > > =A0=A0 2 files changed, 71 insertions(+), 1 deletion(-)
> > > > > > =

> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > index 770baba621b3..48de7624d49c 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > > > > > @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct
> > > > > > drm_device *dev, struct dma_buf *dma_buf)
> > > > > > =A0=A0=A0=A0=A0 return ERR_PTR(ret);
> > > > > > =A0=A0 }
> > > > > > =

> > > > > > +/**
> > > > > > + * amdgpu_dma_buf_move_notify - &attach.move_notify implementa=
tion
> > > > > > + *
> > > > > > + * @attach: the DMA-buf attachment
> > > > > > + *
> > > > > > + * Invalidate the DMA-buf attachment, making sure that
> > > > > > the we re-create the
> > > > > > + * mapping before the next use.
> > > > > > + */
> > > > > > +static void
> > > > > > +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> > > > > > +{
> > > > > > +=A0=A0=A0 struct drm_gem_object *obj =3D attach->importer_priv;
> > > > > > +=A0=A0=A0 struct ww_acquire_ctx *ticket =3D dma_resv_locking_c=
tx(obj->resv);
> > > > > > +=A0=A0=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > > > > > +=A0=A0=A0 struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->t=
bo.bdev);
> > > > > > +=A0=A0=A0 struct ttm_operation_ctx ctx =3D { false, false };
> > > > > > +=A0=A0=A0 struct ttm_placement placement =3D {};
> > > > > > +=A0=A0=A0 struct amdgpu_vm_bo_base *bo_base;
> > > > > > +=A0=A0=A0 int r;
> > > > > > +
> > > > > > +=A0=A0=A0 if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > +
> > > > > > +=A0=A0=A0 r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx);
> > > > > > +=A0=A0=A0 if (r) {
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_ERROR("Failed to invalid=
ate DMA-buf
> > > > > > import (%d))\n", r);
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > > +=A0=A0=A0 }
> > > > > > +
> > > > > > +=A0=A0=A0 for (bo_base =3D bo->vm_bo; bo_base; bo_base =3D bo_=
base->next) {
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct amdgpu_vm *vm =3D bo_=
base->vm;
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dma_resv *resv =3D vm=
->root.base.bo->tbo.base.resv;
> > > > > > +
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ticket) {
> > > > > Yeah so this is kinda why I've been a total pain about the
> > > > > exact semantics
> > > > > of the move_notify hook. I think we should flat-out require
> > > > > that importers
> > > > > _always_ have a ticket attach when they call this, and that
> > > > > they can cope
> > > > > with additional locks being taken (i.e. full EDEADLCK) handling.
> > > > > =

> > > > > Simplest way to force that contract is to add a dummy 2nd
> > > > > ww_mutex lock to
> > > > > the dma_resv object, which we then can take #ifdef
> > > > > CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).
> > > > > =

> > > > > Now the real disaster is how we handle deadlocks. Two issues:
> > > > > =

> > > > > - Ideally we'd keep any lock we've taken locked until the
> > > > > end, it helps
> > > > > =A0=A0=A0 needless backoffs. I've played around a bit with that
> > > > > but not even poc
> > > > > =A0=A0=A0 level, just an idea:
> > > > > =

> > > > > https://cgit.freedesktop.org/~danvet/drm/commit/?id=3Db1799c5a0f0=
2df9e1bb08d27be37331255ab7582
> > > > > =

> > > > > =

> > > > > =A0=A0=A0 Idea is essentially to track a list of objects we had to
> > > > > lock as part of
> > > > > =A0=A0=A0 the ttm_bo_validate of the main object.
> > > > > =

> > > > > - Second one is if we get a EDEADLCK on one of these
> > > > > sublocks (like the
> > > > > =A0=A0=A0 one here). We need to pass that up the entire callchain,
> > > > > including a
> > > > > =A0=A0=A0 temporary reference (we have to drop locks to do the
> > > > > ww_mutex_lock_slow
> > > > > =A0=A0=A0 call), and need a custom callback to drop that temporar=
y reference
> > > > > =A0=A0=A0 (since that's all driver specific, might even be
> > > > > internal ww_mutex and
> > > > > =A0=A0=A0 not anything remotely looking like a normal dma_buf).
> > > > > This probably
> > > > > =A0=A0=A0 needs the exec util helpers from ttm, but at the
> > > > > dma_resv level, so that
> > > > > =A0=A0=A0 we can do something like this:
> > > > > =

> > > > > struct dma_resv_ticket {
> > > > > =A0=A0=A0=A0=A0=A0 struct ww_acquire_ctx base;
> > > > > =

> > > > > =A0=A0=A0=A0=A0=A0 /* can be set by anyone (including other drive=
rs)
> > > > > that got hold of
> > > > > =A0=A0=A0=A0=A0=A0=A0 * this ticket and had to acquire some new l=
ock. This
> > > > > lock might
> > > > > =A0=A0=A0=A0=A0=A0=A0 * protect anything, including driver-intern=
al stuff, and isn't
> > > > > =A0=A0=A0=A0=A0=A0=A0 * required to be a dma_buf or even just a d=
ma_resv. */
> > > > > =A0=A0=A0=A0=A0=A0 struct ww_mutex *contended_lock;
> > > > > =

> > > > > =A0=A0=A0=A0=A0=A0 /* callback which the driver (which might be a=
 dma-buf exporter
> > > > > =A0=A0=A0=A0=A0=A0=A0 * and not matching the driver that started =
this
> > > > > locking ticket)
> > > > > =A0=A0=A0=A0=A0=A0=A0 * sets together with @contended_lock, for t=
he main
> > > > > driver to drop
> > > > > =A0=A0=A0=A0=A0=A0=A0 * when it calls dma_resv_unlock on the cont=
ended_lock. */
> > > > > =A0=A0=A0=A0=A0=A0 void (drop_ref*)(struct ww_mutex *contended_lo=
ck);
> > > > > };
> > > > > =

> > > > > This is all supremely nasty (also ttm_bo_validate would need to be
> > > > > improved to handle these sublocks and random new objects
> > > > > that could force
> > > > > a ww_mutex_lock_slow).
> > > > > =

> > > > Just a short comment on this:
> > > > =

> > > > Neither the currently used wait-die or the wound-wait algorithm
> > > > *strictly* requires a slow lock on the contended lock. For
> > > > wait-die it's
> > > > just very convenient since it makes us sleep instead of spinning wi=
th
> > > > -EDEADLK on the contended lock. For wound-wait IIRC one could just
> > > > immediately restart the whole locking transaction after an
> > > > -EDEADLK, and
> > > > the transaction would automatically end up waiting on the contended
> > > > lock, provided the mutex lock stealing is not allowed. There is how=
ever
> > > > a possibility that the transaction will be wounded again on another
> > > > lock, taken before the contended lock, but I think there are ways to
> > > > improve the wound-wait algorithm to reduce that probability.
> > > > =

> > > > So in short, choosing the wound-wait algorithm instead of wait-die =
and
> > > > perhaps modifying the ww mutex code somewhat would probably help
> > > > passing
> > > > an -EDEADLK up the call chain without requiring passing the contend=
ed
> > > > lock, as long as each locker releases its own locks when receiving =
an
> > > > -EDEADLK.
> > > Hm this is kinda tempting, since rolling out the full backoff tricker
> > > across driver boundaries is going to be real painful.
> > > =

> > > What I'm kinda worried about is the debug/validation checks we're
> > > losing with this. The required backoff has this nice property that
> > > ww_mutex debug code can check that we've fully unwound everything when
> > > we should, that we've blocked on the right lock, and that we're
> > > restarting everything without keeling over. Without that I think we
> > > could end up with situations where a driver in the middle feels like
> > > handling the EDEADLCK, which might go well most of the times (the
> > > deadlock will probably be mostly within a given driver, not across).
> > > Right up to the point where someone creates a deadlock across drivers,
> > > and the lack of full rollback will be felt.
> > > =

> > > So not sure whether we can still keep all these debug/validation
> > > checks, or whether this is a step too far towards clever tricks.
> > =

> > I think we could definitely find a way to keep debugging to make sure
> > everything is unwound before attempting to restart the locking
> > transaction. But the debug check that we're restarting on the contended
> > lock only really makes sense for wait-die, (and we could easily keep it
> > for wait-die). The lock returning -EDEADLK for wound-wait may actually
> > not be the contending lock but an arbitrary lock that the wounded
> > transaction attempts to take after it is wounded.
> > =

> > So in the end IMO this is a tradeoff between added (possibly severe)
> > locking complexity into dma-buf and not being able to switch back to
> > wait-die efficiently if we need / want to do that.
> > =

> > /Thomas
> =

> And as a consequence an interface *could* be:
> =

> *) We introduce functions
> =

> void ww_acquire_relax(struct ww_acquire_ctx *ctx);
> int ww_acquire_relax_interruptible(struct ww_acquire_ctx *ctx);
> =

> that can be used instead of ww_mutex_lock_slow() in the absence of a
> contending lock to avoid spinning on -EDEADLK. While trying to take the
> contending lock is probably the best choice there are various second best
> approaches that can be explored, for example waiting on the contending
> acquire to finish or in the wound-wait case, perhaps do nothing. These
> functions will also help us keep the debugging.

Hm ... I guess this could work. Trouble is, it only gets rid of the
slowpath locking book-keeping headaches, we still have quite a few others.

> *) A function returning -EDEADLK to a caller *must* have already released
> its own locks.

So this ties to another question, as in should these callbacks have to
drops the locks thei acquire (much simpler code) or not (less thrashing,
if we drop locks we might end up in a situation where threads thrash
around instead of realizing quicker that they're actually deadlocking and
one of them should stop and back off).

But keeping locks locked means massive amounts of book-keeping in dma_resv
layer, so goes all downhill from there.

> *) move_notify() explicitly takes a struct ww_acquire_ctx * to make sure
> there is no ambiguity. (I think it would be valuable if we could do the s=
ame
> for ttm_bo_validate()).

Yeah I think more explicit locking ctx would be really good no matter
what. Implicitly fishing the acquire_ctx out of the lock for the object
you're called on is kinda nasty.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
