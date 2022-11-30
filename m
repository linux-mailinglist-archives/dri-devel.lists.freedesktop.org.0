Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4D63D78E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F210E46B;
	Wed, 30 Nov 2022 14:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B485D10E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:06:15 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so2039684pjc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+w1CB5xGwRz+sGqhDvoeBpotJLJv3AvOhdkFgNyxWw=;
 b=MD5v08Ibj5XNOKlKXscF8lS0TL4Amkkm0ESrPONzMB7T7EefzMF8nPzvfw10V8JfHL
 0CtMsriBCkR4v6Qult+ueTCvoBGhmw+xEBqjOqTaPht1S9JrQ8XYAWWMIlqe8UooRrYJ
 Z1nwazl7vUaqagUTf2w90722cXkh3p83UyiZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+w1CB5xGwRz+sGqhDvoeBpotJLJv3AvOhdkFgNyxWw=;
 b=Y1FIT1hWD8CszGIJtCYi9CtH7+4RLKPMOb089HohReFfuKu3NjFkqLQkk/0lRPtMJ8
 J5VLyo7o3HGSk8VJeyg44pDWgYXCP7tycMwO4Odi1wvs+TfHPHUFc26l2BTKtPbiWWLL
 GUC4bjYU26YyfbMTnw4frJuIG5XEM2zpk13swpwiQeKpHOYRyfe4YYeG3dW7QF8qZHdD
 DO2w9enRtx6O7USHXLFIu8DOJtRkUfSvbtVPnNJ54F/nuBmiwgnydx2H0CIo5NBYgHja
 6EheeWeQ+qr6iSA6xNbo885Z8sZrGdnFeu/Gvn7YRQwJ+FMJNo8b05XyyN3c7bZdHD4d
 utYg==
X-Gm-Message-State: ANoB5plVXRl6eKWjNlE/CFJVngE7DXmrG5RwSBgrwBxIKKz/8XlQap/A
 k6EVPAmU3sB5jPpLVevKVX3BubXCo21R18BByq+ZXA==
X-Google-Smtp-Source: AA0mqf6Cge/4u+9gze2KtWfVZZyLFzbW2NVD+mbREm2cL/+UzrqplcEE41lrFeXbYJn9cZjDjnXT/j+9vxjPiXW1DwQ=
X-Received: by 2002:a17:902:820c:b0:189:505b:73dd with SMTP id
 x12-20020a170902820c00b00189505b73ddmr35150355pln.143.1669817175110; Wed, 30
 Nov 2022 06:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
 <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
In-Reply-To: <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Nov 2022 15:06:03 +0100
Message-ID: <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 14:03, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 29/11/2022 18:05, Matthew Auld wrote:
> > On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> + Matt
> >>
> >> On 25/11/2022 10:21, Christian K=C3=B6nig wrote:
> >>> TTM is just wrapping core DMA functionality here, remove the mid-laye=
r.
> >>> No functional change.
> >>>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
> >>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_ttm.c
> >>> index 5247d88b3c13..d409a77449a3 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_ob=
ject *obj,
> >>>    static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
> >>>    {
> >>>        struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> >>> -     int err;
> >>> +     long err;
> >>>
> >>>        WARN_ON_ONCE(obj->mm.madv =3D=3D I915_MADV_WILLNEED);
> >>>
> >>> -     err =3D ttm_bo_wait(bo, true, false);
> >>> -     if (err)
> >>> +     err =3D dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOO=
KKEEP,
> >>> +                                 true, 15 * HZ);
> >>
> >> This 15 second stuck out a bit for me and then on a slightly deeper lo=
ok
> >> it seems this timeout will "leak" into a few of i915 code paths. If we
> >> look at the difference between the legacy shmem and ttm backend I am n=
ot
> >> sure if the legacy one is blocking or not - but if it can block I don'=
t
> >> think it would have an arbitrary timeout like this. Matt your thoughts=
?
> >
> > Not sure what is meant by leak here, but the legacy shmem must also
> > wait/block when unbinding each VMA, before calling truncate. It's the
>
> By "leak" I meant if 15s timeout propagates into some code paths visible
> from userspace which with a legacy backend instead have an indefinite
> wait. If we have that it's probably not very good to have this
> inconsistency, or to apply an arbitrary timeout to those path to start wi=
th.
>
> > same story for the ttm backend, except slightly more complicated in
> > that there might be no currently bound VMA, and yet the GPU could
> > still be accessing the pages due to async unbinds, kernel moves etc,
> > which the wait here (and in i915_ttm_shrink) is meant to protect
> > against. If the wait times out it should just fail gracefully. I guess
> > we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
> > matters though.
>
> Right, depends if it can leak or not to userspace and diverge between
> backends.

Generally lock_timeout() is a design bug. It's either
lock_interruptible (or maybe lock_killable) or try_lock, but
lock_timeout is just duct-tape. I haven't dug in to figure out what
should be here, but it smells fishy.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
