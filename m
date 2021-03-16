Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBFC33D0B9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 10:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610A589998;
	Tue, 16 Mar 2021 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED389998
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 09:28:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d15so10064241wrv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rBuxRnP6S3d+Aux8B2gvSNqUdsDTpMq7Yi+jjjMSooM=;
 b=dBriHMOlTXYuYh7KjLkQ66VbZnkoM3s4hCyVPvpaF+3Y8Qi4CClyDCyXUSb/tTb7tb
 XWUP2HoaL5motOBRCTHq8PLYCsU0rKtF+lIrW+8H6OJ/dev+QkXT3Ohy9DRUoT/phweX
 tkv5nq/qlwxXbiu8Mtfu+5aSC/jWI42BxPyy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rBuxRnP6S3d+Aux8B2gvSNqUdsDTpMq7Yi+jjjMSooM=;
 b=WKCCP0uU8xe6TDUNsfX35kyCgORyOVhzhQafnGNWWrQGmQ8YA/yxerUXY1QOAT1v1Q
 CVu4v70JeNKhImNZ5cPd/ANOV5So6KmfzP7Ekf+ppMC6nPIYtraLaktNq1oRMU6bSZtz
 YfVumddO+ieHwT5/4bguNG5C3ZRlARuMEGayJZlsFZNoRzCsew3G5IDDckQs1vfn4In8
 V0/5KL/HKjSDbsupYgY2h0AoAITAQ+ZtIjN15V2wZBaaqICAaQTiX5V4kA3zGF/ZkIyA
 erVnAwlLsWqYoA8xhZf5wxg6ldUY+hty/7okS1aYNmpuRuR1xdQuTwcXKxQImi0l2pOU
 /g/Q==
X-Gm-Message-State: AOAM53183D2AzlMXdzAbzTrJi8Q5VEv9KqLkfqU1ceV3+L19Iigswlpg
 XnbtOoe1JcFLjiDxSBVtACWrnrheuPxIXC35
X-Google-Smtp-Source: ABdhPJz0ZO/+s344xhyILLPONfNZKFhCmCEhOfFCf096N5D4v4lBpIqy1IVC6M5xjaisNUg2qxP/fw==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr3811075wru.197.1615886881856; 
 Tue, 16 Mar 2021 02:28:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w131sm2688288wmb.8.2021.03.16.02.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 02:28:01 -0700 (PDT)
Date: Tue, 16 Mar 2021 10:27:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
Message-ID: <YFB6H/QBKfbQ+evn@phenom.ffwll.local>
References: <20210312093810.2202-1-christian.koenig@amd.com>
 <acdb06fe-1024-ef2e-0c56-c4fa61b13cec@shipmail.org>
 <15996529-b536-28aa-644c-c57e67788c97@gmail.com>
 <cbe846bc-4b1f-fc6c-52a5-b84505a5b748@shipmail.org>
 <daafc050-33ca-90b9-0caa-c59397707291@gmail.com>
 <6654281b-5fb4-5d5f-779e-677cc2d54bb9@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6654281b-5fb4-5d5f-779e-677cc2d54bb9@shipmail.org>
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

On Mon, Mar 15, 2021 at 08:00:30PM +0100, Thomas Hellstr=F6m (Intel) wrote:
> =

> On 3/15/21 7:47 PM, Christian K=F6nig wrote:
> > =

> > =

> > Am 15.03.21 um 18:08 schrieb Thomas Hellstr=F6m (Intel):
> > > =

> > > On 3/15/21 11:26 AM, Christian K=F6nig wrote:
> > > > =

> > > > =

> > > > Am 13.03.21 um 19:29 schrieb Thomas Hellstr=F6m (Intel):
> > > > > Hi, Christian
> > > > > =

> > > > > On 3/12/21 10:38 AM, Christian K=F6nig wrote:
> > > > > > We seem to have some more driver bugs than thought.
> > > > > > =

> > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > ---
> > > > > > =A0 include/drm/ttm/ttm_bo_api.h | 6 ++++--
> > > > > > =A0 1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > > =

> > > > > > diff --git a/include/drm/ttm/ttm_bo_api.h
> > > > > > b/include/drm/ttm/ttm_bo_api.h
> > > > > > index 4fb523dfab32..df9fe596e7c5 100644
> > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > @@ -603,9 +603,11 @@ static inline void
> > > > > > ttm_bo_pin(struct ttm_buffer_object *bo)
> > > > > > =A0 static inline void ttm_bo_unpin(struct ttm_buffer_object *b=
o)
> > > > > > =A0 {
> > > > > > =A0=A0=A0=A0=A0 dma_resv_assert_held(bo->base.resv);
> > > > > > -=A0=A0=A0 WARN_ON_ONCE(!bo->pin_count);
> > > > > > =A0=A0=A0=A0=A0 WARN_ON_ONCE(!kref_read(&bo->kref));
> > > > > > -=A0=A0=A0 --bo->pin_count;
> > > > > > +=A0=A0=A0 if (bo->pin_count)
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 --bo->pin_count;
> > > > > > +=A0=A0=A0 else
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 WARN_ON_ONCE(true);
> > > > > > =A0 }
> > > > > > =A0 =A0 int ttm_mem_evict_first(struct ttm_device *bdev,
> > > > > =

> > > > > Since I now have been staring for half a year at the code of
> > > > > the driver that made pinning an art, I have a couple of
> > > > > suggestions here, Could we use an atomic for pin_count,
> > > > > allowing unlocked unpinning but require the lock only for
> > > > > pin_count transition 0->1, (but unlocked for
> > > > > pin_if_already_pinned). In particular I think vmwgfx would
> > > > > benefit from unlocked unpins. Also if the atomic were a
> > > > > refcount_t, that would probably give you the above
> > > > > behaviour?
> > > > =

> > > > Nope, I've considered this as well while moving the pin count into =
TTM.
> > > > =

> > > > The problem is that you not only need the BO reserved for 0->1
> > > > transitions, but also for 1->0 transitions to move the BO on the
> > > > LRU correctly.
> > > =

> > > Ah, and there is no way to have us know the correct LRU list without
> > > reservation?
> > =

> > Not really, there is always the chance that CPU A is reducing the count
> > from 1->0 while CPU B is doing 0->1 and you end up with a LRU status
> > which doesn't match the pin count.
> > =

> > We could try to do something like a loop updating the LRU status until
> > it matches the pin count, but the implications of that are usually
> > really nasty.
> > =

> OK, yeah I was more thinking along the lines of protecting the LRU status
> with the global lru lock and unpin would then be
> =

> if (refcount_dec_and_lock(&bo->pin_count, &ttm_glob.lru_lock)) {
> =A0=A0=A0 add_to_relevant_lrus(bo, bo->lru_status);
> =A0=A0=A0 spin_unlock(&ttm_glob.lru_lock);
> }
> =

> But looking at ttm_bo_move_to_lru_tail() I realize that's not really triv=
ial
> anymore. I hope it's doable at some point though.
> =

> But meanwhile, perhaps TTM needs to accept and pave over that drivers are=
 in
> fact destroying pinned buffers?

Do we have more trouble than the very fancy tricks vmwgfx does? If so I
think we could do a small helper that like ttm_dont_check_unpin() to shut
it up. Since vmwgfx drivers tend to not be loaded with any other drivers
that shouldn't reduce any test coverage. And allows vmwgfx folks to figure
out what to do - maybe you do need your own in-house pin/unpin for these
special bo?

I did try to parse your reply in the other thread, and tbh I didn't grock
it.

Also I think a comment why we need dma_resv (maybe in the kerneldoc for
pin count), i.e. that it's needed to keep lru state in sync with pin state
would be really good?
-Daniel

> =

> /Thomas
> =

> =

> =

> =

> =

> > Christian.
> > =

> > > =

> > > /Thomas
> > > =

> > > =

> > > > =

> > > > Christian.
> > > > =

> > > > > =

> > > > > /Thomas
> > > > > =

> > > > > =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
