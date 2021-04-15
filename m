Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B12360F6B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 17:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65D6EA7B;
	Thu, 15 Apr 2021 15:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148766EA7B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 15:51:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a4so23813394wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MGiHtE8/yfABoinXgWtVP7iqRkDrLGvrC4r2GFI/mbQ=;
 b=BfmJKrmJIQI8Hy42RZ5KMzNXs4Lzh6/KtQCS/R94LSl/sA73AAtcFG0OwMshb4z9sy
 BDv4xH1kIIPmge4qLJTxkb5vZ4C+JmVQDNGq3eQLnHfro+QexUpBDf/taEVbziWQ88JD
 5g5+yoBT6EKCZOnc6p0PBDW4tn38Aw8X3h628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MGiHtE8/yfABoinXgWtVP7iqRkDrLGvrC4r2GFI/mbQ=;
 b=VXH/TO6mL62Zdpvxr/aFHx7poQDPI28gufqHTZtpFt0cPU8NIav6GLg+Oybti46RPT
 rCP1oc/3H3RZ4utQUIkimxvjcc5rUv5kfe9h8CbgEcsyTt63v6VgJCiv/0nrGhXSOliw
 ecVE1qqVWIctqd3aOiyQoG970BnBlo36eUrjY81JuX4BXyxviDemYmkPG/rJNBA4GuUv
 HWsqY4hqFPJLgOtB80fh3mqqrfvof768lJ9xJq+3/S9gD8tPa1xABlwHKMeQ8uUKDykX
 wdgueaWjQhiPJhzIQt4NcIEiQHu77G+nQvEFb/EzgtAh6H6BEuEIdTw2TpCu6h7uerRd
 5MOA==
X-Gm-Message-State: AOAM530NDUEkq2EWfkV+4efwnwgTeaU3sslxFlxJ6HmfytnJBVD9KDOE
 MOFRXuU4kbSJs+eFjVzCJzTttkKSSqqGoA==
X-Google-Smtp-Source: ABdhPJzjS2Eqn1eevE3iAeiRlFhuGoG6yvQJXj0l9lYuqfSyFpx8o3PFfFmCWDQGzcQowM/cRO04+g==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr4110953wrp.208.1618501900805; 
 Thu, 15 Apr 2021 08:51:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g132sm3547371wmg.42.2021.04.15.08.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:51:40 -0700 (PDT)
Date: Thu, 15 Apr 2021 17:51:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [Linaro-mm-sig] [RFC] Cross-driver ww transaction lock lists
Message-ID: <YHhhCpusF3Iizn+n@phenom.ffwll.local>
References: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
 <d5ad41b9-0248-285b-8873-b8010e7c8c27@amd.com>
 <YHhBqNKukDlZ2Cld@phenom.ffwll.local>
 <d3960d8e-c9c6-11b4-f7e1-d2340b57ec87@shipmail.org>
 <CAKMK7uHe4oiS6wyfgF_N2vEcYiQ7EPeHvjjhRyMObmYnDC+T3A@mail.gmail.com>
 <9154fb85-55bb-57c0-4451-79ec607ea87d@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9154fb85-55bb-57c0-4451-79ec607ea87d@shipmail.org>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 05:40:24PM +0200, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 4/15/21 4:40 PM, Daniel Vetter wrote:
> > On Thu, Apr 15, 2021 at 4:02 PM Thomas Hellstr=F6m (Intel)
> > <thomas_os@shipmail.org> wrote:
> > > =

> > > On 4/15/21 3:37 PM, Daniel Vetter wrote:
> > > > On Tue, Apr 13, 2021 at 09:57:06AM +0200, Christian K=F6nig wrote:
> > > > > Am 13.04.21 um 09:50 schrieb Thomas Hellstr=F6m:
> > > > > > Hi!
> > > > > > =

> > > > > > During the dma_resv conversion of the i915 driver, we've been u=
sing ww
> > > > > > transaction lock lists to keep track of ww_mutexes that are loc=
ked
> > > > > > during the transaction so that they can be batch unlocked at su=
itable
> > > > > > locations. Including also the LMEM/VRAM eviction we've ended up=
 with
> > > > > > two static lists per transaction context; one typically unlocke=
d at the
> > > > > > end of transaction and one initialized before and unlocked afte=
r each
> > > > > > buffer object validate. This enables us to do sleeping locking =
at
> > > > > > eviction and keep objects locked on the eviction list until we
> > > > > > eventually succeed allocating memory (modulo minor flaws of cou=
rse).
> > > > > > =

> > > > > > It would be beneficial with the i915 TTM conversion to be able =
to
> > > > > > introduce a similar functionality that would work in ttm but al=
so
> > > > > > cross-driver in, for example move_notify. It would also be bene=
ficial
> > > > > > to be able to put any dma_resv ww mutex on the lists, and not r=
equire
> > > > > > it to be embedded in a particular object type.
> > > > > > =

> > > > > > I started scetching on some utilities for this. For TTM, for ex=
ample,
> > > > > > the idea would be to pass a list head for the ww transaction lo=
ck list
> > > > > > in the ttm_operation_ctx. A function taking a ww_mutex could th=
en
> > > > > > either attach a grabbed lock to the list for batch unlocking, o=
r be
> > > > > > responsible for unlocking when the lock's scope is exited. It's=
 also
> > > > > > possible to create sublists if so desired. I believe the below =
would be
> > > > > > sufficient to cover the i915 functionality.
> > > > > > =

> > > > > > Any comments and suggestions appreciated!
> > > > > ah yes Daniel and I haven been discussing something like this for=
 years.
> > > > > =

> > > > > I also came up with rough implementation, but we always ran into =
lifetime
> > > > > issues.
> > > > > =

> > > > > In other words the ww_mutexes which are on the list would need to=
 be kept
> > > > > alive until unlocked.
> > > > > =

> > > > > Because of this we kind of backed up and said we would need this =
on the GEM
> > > > > level instead of working with dma_resv objects.
> > > > Yeah there's a few funny concerns here that make this awkward:
> > > > - For simplicity doing these helpers at the gem level should make t=
hings a
> > > >     bit easier, because then we have a standard way to drop the ref=
erence.
> > > >     It does mean that the only thing you can lock like this are gem=
 objects,
> > > >     but I think that's fine. At least for a first cut.
> > > > =

> > > > - This is a bit awkward for vmwgfx, but a) Zack has mentioned he's =
looking
> > > >     into adopting gem bo internally to be able to drop a pile of co=
de and
> > > >     stop making vmwgfx the only special-case we have b) drivers whi=
ch don't
> > > >     need this won't need this, so should be fine.
> > > > =

> > > >     The other awkward thing I guess is that ttm would need to use t=
he
> > > >     embedded kref from the gem bo, but that should be transparent I=
 think.
> > > > =

> > > > - Next up is dma-buf: For i915 we'd like to do the same eviction tr=
ick
> > > >     also through p2p dma-buf callbacks, so that this works the same=
 as
> > > >     eviction/reservation within a gpu. But for these internal bo yo=
u might
> > > >     not have a dma-buf, so we can't just lift the trick to the dma-=
buf
> > > >     level. But I think if we pass e.g. a struct list_head and a cal=
lback to
> > > >     unreference/unlock all the buffers in there to the exporter, pl=
us
> > > >     similar for the slowpath lock, then that should be doable witho=
ut
> > > >     glorious layering inversions between dma-buf and gem.
> > > > =

> > > >     I think for dma-buf it should even be ok if this requires that =
we
> > > >     allocate an entire structure with kmalloc or something, allocat=
ing
> > > >     memory while holding dma_resv is ok.
> > > Yes, the thing here with the suggested helpers is that you would just
> > > embed a trans_lockitem struct in the gem object (and defines the gem
> > > object ops). Otherwise and for passing to dma-buf this is pretty much
> > > exactly what you are suggesting, but the huge benefit of encapsulating
> > > the needed members like this is that when we need to change something=
 we
> > > change it in just one place.
> > > =

> > > For anything that doesn't have a gem object (dma-buf, vmwgfx or
> > > whatever) you have the choice of either allocating a struct
> > > trans_lockitem or embed it wherever you prefer. In particular, this is
> > > beneficial where you have a single dma-resv class ww-mutex sitting
> > > somewhere in the way and you don't want to needlessly have a gem obje=
ct
> > > that embeds it.
> > The thing is, everyone who actually uses dma_resv_lock has a
> > gem_buffer_object underneath. So it feels a bit like flexibility for
> > no real need, and I think it would make it slightly more awkard for
> > gem drivers to neatly integrate into their cs path. The lockitem
> > struct works, but it is a bit cumbersome.
> =

> Well that's partly because of it's impossible to use a standalone ww_mutex
> in a locking transaction that can only add gem objects to the list :/.
> Already in the i915 driver we have and may want to add various places whe=
re
> we have dead gem objects sitting because of this.
> =

> Also, more importantly, If we pass a list down the dma-buf move_notify(),=
 a
> trans_lockitem is pretty much exactly what we expect back (except of cour=
se
> for the private pointer). It would be odd if we'd expect all list items to
> be gem objects when it's a dma-buf interface?
> =

> > =

> > Also if we add some wrappers to e.g. add a gem_bo to the ctx, then if
> > we decide to slip the lockitem in there, we still only need to touch
> > the helper code, and not all drivers.
> =

> Well, yes assuming we always have an embedding gem object for a dma_resv
> that might be true, but either way I don't really expect the gem helpers =
to
> look very different. We will need the ops anyway and a specialized context
> so if the only thing we're debating is whether or not to embed a struct in
> the gem object, unless you really insist on using the gem object initiall=
y,
> I suggest we try this and if it becomes awkward, just
> s/trans_lockitem/drm_gem_object/

Hm yeah I think you convinced me this is a bit a bikeshed :-) Maybe call
it dma_resv_lockitem or so if we go with top-level generic solution. And
then embed it wheterever we feel like.

The annoying thing with tha generic thing is that I'd like to avoid the
full callback pointer in all the gem objects, but maybe another ptr really
doesn't matter on this if we add a linked list anyway ...
-Daniel

> =

> /Thomas
> =

> =

> > -Daniel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
