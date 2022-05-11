Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92841523D1A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630B10E37A;
	Wed, 11 May 2022 19:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C8310E37A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 19:09:10 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i27so5913689ejd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=M2DykjHAMdlStYb5EmcYSUR1Pkzo63PzxwPMaZ8LvFo=;
 b=RyFGCFRtSxjZc9mIoytVCXq/YWGjqf+7X1f1onqM7tbKpLpI5ilS0HD3W+wryYO3eA
 OxxE2IpBo99CuN/f3UvdN2TyQdKnAWqhafI0mCX9WQ2GKArXjz3PpjvEofURYxNFo5Yb
 zCYHi0yxeD9Ub457ewESExxn2/2ovvErrm4A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=M2DykjHAMdlStYb5EmcYSUR1Pkzo63PzxwPMaZ8LvFo=;
 b=AYstuBqYM2NMMqr9F1S99MWtufzvcKHo4DSpm+V7txhnTphOZSe0w7b/9qs07aAwQ8
 pIT6Xn+IHxz7rI+feAa3JK5e1iODVP5pllh+YJbUONzkGqV+oMTw5zSIChyowui2E411
 OR8XCLtlmlDbIXPPMACEbq4WCz5BKoqYOSiH5RTKRtNa3eGP1dRvu6OoEYV/kQhuEAyP
 WKHnttB9ik/T4WKX/f4xmUl36r1XBhQUyOJ3UmQfiOTqvuAaH2cdJWU7X+6bWygTaUCT
 R8eBxewA33LRxqpFMFg1XBDB97JeHurNYkUEOOWnv+8EwUyW5x+pEo0EnyRscaU2MAit
 5CPg==
X-Gm-Message-State: AOAM532LPhQ3gMS9u1NCjI7AdTsTsmBe84P/xvn7kwpQZPovFnTGkKhT
 lV8qhHQjyv61A03yIL4X+Uvc8Q==
X-Google-Smtp-Source: ABdhPJw9Nd8vnPYqEL0MNAFmVh+U7IZ/wircjNLfEqm8Te3y/rY6G1oUIM7+PpLhbG8Z+WzygG5ebQ==
X-Received: by 2002:a17:907:2d07:b0:6f4:36fe:f1c with SMTP id
 gs7-20020a1709072d0700b006f436fe0f1cmr26449179ejc.383.1652296149389; 
 Wed, 11 May 2022 12:09:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a056402134d00b0042617ba63d6sm1528596edw.96.2022.05.11.12.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 12:09:08 -0700 (PDT)
Date: Wed, 11 May 2022 21:09:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Message-ID: <YnwJ0kLwLS7RxuwS@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
 <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
 <Ynkb1U2nNWYPML88@phenom.ffwll.local>
 <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
 <Ynu1k5lH+xvqtObG@phenom.ffwll.local>
 <3429a12f-9fbe-b66b-dbbd-94a1df54714e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3429a12f-9fbe-b66b-dbbd-94a1df54714e@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 07:06:18PM +0300, Dmitry Osipenko wrote:
> On 5/11/22 16:09, Daniel Vetter wrote:
> >>>>> I'd like to ask you to reduce the scope of the patchset and build the
> >>>>> shrinker only for virtio-gpu. I know that I first suggested to build
> >>>>> upon shmem helpers, but it seems that it's easier to do that in a later
> >>>>> patchset.
> >>>> The first version of the VirtIO shrinker didn't support memory eviction.
> >>>> Memory eviction support requires page fault handler to be aware of the
> >>>> evicted pages, what should we do about it? The page fault handling is a
> >>>> part of memory management, hence to me drm-shmem is already kinda a MM.
> >>> Hm I still don't get that part, why does that also not go through the
> >>> shmem helpers?
> >> The drm_gem_shmem_vm_ops includes the page faults handling, it's a
> >> helper by itself that is used by DRM drivers.
> >>
> >> I could try to move all the shrinker logic to the VirtIO and re-invent
> >> virtio_gem_shmem_vm_ops, but what is the point of doing this for each
> >> driver if we could have it once and for all in the common drm-shmem code?
> >>
> >> Maybe I should try to factor out all the shrinker logic from drm-shmem
> >> into a new drm-shmem-shrinker that could be shared by drivers? Will you
> >> be okay with this option?
> > I think we're talking past each another a bit. I'm only bringing up the
> > purge vs eviction topic we discussed in the other subthread again.
> 
> Thomas asked to move the whole shrinker code to the VirtIO driver and
> I's saying that this is not a great idea to me, or am I misunderstanding
> the Thomas' suggestion? Thomas?

I think it was just me creating a confusion here.

fwiw I do also think that shrinker in shmem helpers makes sense, just in
case that was also lost in confusion.

> >>> I'm still confused why drivers need to know the difference
> >>> between evition and purging. Or maybe I'm confused again.
> >> Example:
> >>
> >> If userspace uses IOV addresses, then these addresses must be kept
> >> reserved while buffer is evicted.
> >>
> >> If BO is purged, then we don't need to retain the IOV space allocated
> >> for the purged BO.
> > Yeah but is that actually needed by anyone? If userspace fails to allocate
> > another bo because of lack of gpu address space then it's very easy to
> > handle that:
> > 
> > 1. Make a rule that "out of gpu address space" gives you a special errno
> > code like ENOSPC
> > 
> > 2. If userspace gets that it walks the list of all buffers it marked as
> > purgeable and nukes them (whether they have been evicted or not). Then it
> > retries the bo allocation.
> > 
> > Alternatively you can do step 2 also directly from the bo alloc ioctl in
> > step 1. Either way you clean up va space, and actually a lot more (you
> > potentially nuke all buffers marked as purgeable, not just the ones that
> > have been purged already) and only when va cleanup is actually needed
> > 
> > Trying to solve this problem at eviction time otoh means:
> > - we have this difference between eviction and purging
> > - it's still not complete, you still need to glue step 2 above into your
> >   driver somehow, and once step 2 above is glued in doing additional
> >   cleanup in the purge function is just duplicated logic
> > 
> > So at least in my opinion this isn't the justification we need. And we
> > should definitely not just add that complication "in case, for the
> > future", if we don't have a real need right now. Adding it later on is
> > easy, removing it later on because it just gets in the way and confuses is
> > much harder.
> 
> The IOVA space is only one example.
> 
> In case of the VirtIO driver, we may have two memory allocation for a
> BO. One is the shmem allcation in guest and the other is in host's vram.
> If we will only release the guest's memory on purge, then the vram will
> remain allocated until BO is destroyed, which unnecessarily sub-optimal.

Hm but why don't you just nuke the memory on the host side too when you
evict? Allowing the guest memory to be swapped out while keeping the host
memory allocation alive also doesn't make a lot of sense for me. Both can
be recreated (I guess at least?) on swap-in.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
