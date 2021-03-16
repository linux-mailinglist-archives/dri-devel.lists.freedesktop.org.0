Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150633D269
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 12:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B796E34B;
	Tue, 16 Mar 2021 11:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6994C6E34B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 11:06:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso1211223wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6ArKL55/uySmcjAMI6K0hA/PqeiDazplBCA2cwvFD7Q=;
 b=VCy71aEdKaxXWdxpDNBH5d6mSRwmrai/8nxJmn2Rowzgzz5JcGd3RxbuyqcfMqCprc
 laCJ+dEA18u4QQvf+x8+me/j2ChtGsVKlxbWX+CD0ryx7P57IJJVriilKpkI3mx9lAeJ
 U6ZRUPsTkobP8Nmrh/iAFTdfsoAcn598eZE00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6ArKL55/uySmcjAMI6K0hA/PqeiDazplBCA2cwvFD7Q=;
 b=fA9dSPkpBnQAsyxG2b81Vyb8wFNOv6+RN9Ij/i+uUWBsi/7XJwTYVl4vWtmbouaHaS
 atTCxwF/zNPqPKacRhro1vJDimDxm2ggJFIpTDHeu43HY2SeRPVuAM8YT5SzfHS0ZOdJ
 7onWejU3aofVdyRbisVYi/hiqKlAQrRJFFG4fEHhYqXOj4fhG47H71af0RH7Z+FOIcSm
 EVcrIakriaMf7sjbe82cl4bVqbzAN/qsdcdAJnF0zibmOdskVIrYyFTZ5hSvWUhZYZ41
 SNIg8yHCPc/kqJwwA3w37nGCncRfv+FJMml0WbPmz5TmC4NDonYymym3LtBQ03KROc4F
 V97g==
X-Gm-Message-State: AOAM533A8K6eyB7BoryIl9df8PPgo4n4zCa+3qfM54WtFbxtkFa60+ej
 k5haKEfDq3yM0GS/NpWq5NFL3w==
X-Google-Smtp-Source: ABdhPJzEN79HUP0SkiyDdF0LLq6pNvPc9P4QsP9dK8cRPjKrqwp0+bRRJNNwfxOi8Rw/BJGmo37S/g==
X-Received: by 2002:a7b:c1c9:: with SMTP id a9mr4058576wmj.145.1615892805876; 
 Tue, 16 Mar 2021 04:06:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m14sm2680653wmi.27.2021.03.16.04.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 04:06:45 -0700 (PDT)
Date: Tue, 16 Mar 2021 12:06:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
Message-ID: <YFCRQ2LzDzPUvce0@phenom.ffwll.local>
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
 <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
 <daafc050-33ca-90b9-0caa-c59397707291@gmail.com>
 <6654281b-5fb4-5d5f-779e-677cc2d54bb9@shipmail.org>
 <YFB6H/QBKfbQ+evn@phenom.ffwll.local>
 <eac45ab1-9f94-e438-716d-45861fd857a3@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eac45ab1-9f94-e438-716d-45861fd857a3@shipmail.org>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 11:38:53AM +0100, Thomas Hellstr=F6m (Intel) wrote:
> Hi,
> =

> On 3/16/21 10:27 AM, Daniel Vetter wrote:
> > On Mon, Mar 15, 2021 at 08:00:30PM +0100, Thomas Hellstr=F6m (Intel) wr=
ote:
> > > On 3/15/21 7:47 PM, Christian K=F6nig wrote:
> > > > =

> > > > Am 15.03.21 um 18:08 schrieb Thomas Hellstr=F6m (Intel):
> > > > > On 3/15/21 11:26 AM, Christian K=F6nig wrote:
> > > > > > =

> > > > > > Am 13.03.21 um 19:29 schrieb Thomas Hellstr=F6m (Intel):
> > > > > > > Hi, Christian
> > > > > > > =

> > > > > > > On 3/12/21 10:38 AM, Christian K=F6nig wrote:
> > > > > > > > We seem to have some more driver bugs than thought.
> > > > > > > > =

> > > > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > > > ---
> > > > > > > >  =A0 include/drm/ttm/ttm_bo_api.h | 6 ++++--
> > > > > > > >  =A0 1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > > > > =

> > > > > > > > diff --git a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > index 4fb523dfab32..df9fe596e7c5 100644
> > > > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > > > @@ -603,9 +603,11 @@ static inline void
> > > > > > > > ttm_bo_pin(struct ttm_buffer_object *bo)
> > > > > > > >  =A0 static inline void ttm_bo_unpin(struct ttm_buffer_obje=
ct *bo)
> > > > > > > >  =A0 {
> > > > > > > >  =A0=A0=A0=A0=A0 dma_resv_assert_held(bo->base.resv);
> > > > > > > > -=A0=A0=A0 WARN_ON_ONCE(!bo->pin_count);
> > > > > > > >  =A0=A0=A0=A0=A0 WARN_ON_ONCE(!kref_read(&bo->kref));
> > > > > > > > -=A0=A0=A0 --bo->pin_count;
> > > > > > > > +=A0=A0=A0 if (bo->pin_count)
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 --bo->pin_count;
> > > > > > > > +=A0=A0=A0 else
> > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 WARN_ON_ONCE(true);
> > > > > > > >  =A0 }
> > > > > > > >  =A0 =A0 int ttm_mem_evict_first(struct ttm_device *bdev,
> > > > > > > Since I now have been staring for half a year at the code of
> > > > > > > the driver that made pinning an art, I have a couple of
> > > > > > > suggestions here, Could we use an atomic for pin_count,
> > > > > > > allowing unlocked unpinning but require the lock only for
> > > > > > > pin_count transition 0->1, (but unlocked for
> > > > > > > pin_if_already_pinned). In particular I think vmwgfx would
> > > > > > > benefit from unlocked unpins. Also if the atomic were a
> > > > > > > refcount_t, that would probably give you the above
> > > > > > > behaviour?
> > > > > > Nope, I've considered this as well while moving the pin count i=
nto TTM.
> > > > > > =

> > > > > > The problem is that you not only need the BO reserved for 0->1
> > > > > > transitions, but also for 1->0 transitions to move the BO on the
> > > > > > LRU correctly.
> > > > > Ah, and there is no way to have us know the correct LRU list with=
out
> > > > > reservation?
> > > > Not really, there is always the chance that CPU A is reducing the c=
ount
> > > > from 1->0 while CPU B is doing 0->1 and you end up with a LRU status
> > > > which doesn't match the pin count.
> > > > =

> > > > We could try to do something like a loop updating the LRU status un=
til
> > > > it matches the pin count, but the implications of that are usually
> > > > really nasty.
> > > > =

> > > OK, yeah I was more thinking along the lines of protecting the LRU st=
atus
> > > with the global lru lock and unpin would then be
> > > =

> > > if (refcount_dec_and_lock(&bo->pin_count, &ttm_glob.lru_lock)) {
> > >  =A0=A0=A0 add_to_relevant_lrus(bo, bo->lru_status);
> > >  =A0=A0=A0 spin_unlock(&ttm_glob.lru_lock);
> > > }
> > > =

> > > But looking at ttm_bo_move_to_lru_tail() I realize that's not really =
trivial
> > > anymore. I hope it's doable at some point though.
> > > =

> > > But meanwhile, perhaps TTM needs to accept and pave over that drivers=
 are in
> > > fact destroying pinned buffers?
> > Do we have more trouble than the very fancy tricks vmwgfx does? If so I
> > think we could do a small helper that like ttm_dont_check_unpin() to sh=
ut
> > it up. Since vmwgfx drivers tend to not be loaded with any other drivers
> > that shouldn't reduce any test coverage. And allows vmwgfx folks to fig=
ure
> > out what to do - maybe you do need your own in-house pin/unpin for these
> > special bo?
> > =

> > I did try to parse your reply in the other thread, and tbh I didn't gro=
ck
> > it.
> =

> Not sure if you mean the description was unclear or if you thought it was=
 a
> bad idea, but in case the former, what I mean is

My unclarity is on what you explained in the vmwgfx thread about how
vmwgfx uses its pin/unpin and why. That was full of vmwgfx concepts I
don't know about. This here looks reasonably clear to me, but it does have
the race Christian sees I think.

> static void ttm_bo_pin(struct ttm_buffer_object *bo)
> {
> =

> dma_resv_assert_held()=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 // No surprises if an evictor
> determined that this object is not pinned.
> =

> =A0=A0=A0 if (!refcount_inc_not_zero(&bo->pin_count)) { // Could be made
> ttm_bo_pin_if_pinned() and exported if there are users
> =A0=A0=A0 =A0=A0=A0 spin_lock(&ttm_glob.lru_lock);=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 // Don't race with unpin
> 1->0
> =A0=A0=A0 =A0=A0=A0 if (refcount_read(&bo->pin_count) =3D=3D 0 && bo->lru)
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ttm_bo_del_from_lru(bo);
> =A0=A0=A0 =A0=A0=A0 refcount_inc(&bo->pin_count);
> =A0=A0=A0 =A0=A0=A0 spin_unlock(&ttm_glob.lru_lock);
> =A0=A0=A0 }
> }
> =

> static void ttm_bo_unpin(struct ttm_buffer_object *bo)
> {
> =A0=A0=A0 if (refcount_dec_and_lock(&bo->pin_count, &ttm_glob.lru_lock)) {
> =A0=A0=A0 =A0=A0=A0 ttm_bo_move_to_lru_tail(bo, bo->lru_mem_type, bo->lru=
_prio,
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 NULL);
> =A0=A0=A0 =A0=A0=A0 spin_unlock(&ttm_glob.lru_lock);
> =A0=A0=A0 }
> }
> =

> In addition, bo->lru_mem_type and bo->lru_prio would need to be protected=
 by
> the lru lock, and updated together with the LRU list position, which would
> be the extra complexity in fastpaths. Wouldn't that resolve the pin - lru
> inconsistency?
> =

> But yeah if vmwgfx is the only driver hitting trouble because of this, th=
en
> I agree let's leave it for when / if it becomes needed. Having had that
> requirement in the Intel driver would have complicated the dma_resv work
> quite a lot.

Yeah I know i915 does a lot of unpin in interesting places, and that's
part of why I'm worried. I've seen some bugfixes fly by that dropped
dma_resv_lock around unpin to fix really scary looking stalls
(rcu_synchronize vs other stuff and lockdep did not catch it). And once I
see that kind of stuff I'm heavily leaning towards simpler locking we can
grasp, just to be able to stay on top of the bugs. Because the bugfix did
not come with any clear explanation for why not taking dma_resv_lock
actually helps, or any other clear and in-depth locking analysis.

I think we also still have some temporary pin/unpin flying about, but
maybe those are all gone now.

So i915 gem code and what I've seen there is part of the reasons why I
think we shouldn't make unpin lockless. It just doesn't look like it leads
to very managable code. Plus for most drivers pin/unpin really is only
something for display, and the locking shouldn't matter at all from a perf
pov.
-Daniel


> =

> /Thomas
> =

> =

> > =

> > Also I think a comment why we need dma_resv (maybe in the kerneldoc for
> > pin count), i.e. that it's needed to keep lru state in sync with pin st=
ate
> > would be really good?
> > -Daniel
> > =

> > > /Thomas
> > > =

> > > =

> > > =

> > > =

> > > =

> > > > Christian.
> > > > =

> > > > > /Thomas
> > > > > =

> > > > > =

> > > > > > Christian.
> > > > > > =

> > > > > > > /Thomas
> > > > > > > =

> > > > > > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
