Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A4525329
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 19:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29C510E413;
	Thu, 12 May 2022 17:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E77A10E413
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 17:04:59 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n24so7134636oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 10:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=chTQPE8s2XiI033YuqzMveiHeBofeKqYbLvthAkBmTo=;
 b=Ep4hhtVsOOvso0K4dDn5rqLsCgloqgBDkJIBretQ9s4UJqD5BY+MBB6oa1r4eLjk+t
 vM2tGcqz4sQfzLtff14nL3YYdLipq5/FU0mfGYLVlyLguGNbpbvmVvq31x8Wcd1Icw1e
 tOCvyAz/evcOx2MRPkcBsbyg7KsbSVHS2bYOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=chTQPE8s2XiI033YuqzMveiHeBofeKqYbLvthAkBmTo=;
 b=PQM6iC82Zc739DtZyRb4VUgHR02/eBjQp7nKfN7GaiT1zDOT75pRloS3v06Nyido3y
 F1oEZzBUkCq7YqAPg+eLKvb5Dk9g2X1Tv6B4nk1ApUc9o2vWYpsubypwO/Oxo1xcTGGt
 gynHrYm/uuJwnggssBjVt/WL7hR7LR4Fpc3yRr71+b/UdzaFHz9B63wZjjJylZHvjikv
 brG9Y09iOmmHGbjNafzffKtNP17N29w85vjxVwSrt1q2mkk5DqOiIkaoUYrquvK2YQYk
 K/l9LpcP7MkvOQvdB6qhuqEof9YYv+CsSedyvSuyi3Vrn6mwmnYTT5w/6vat+WIqNDCA
 Imcg==
X-Gm-Message-State: AOAM533W9JbTV8gW23McGiu6b4XvsJgdfdqzVnoSqUGEPhrcrg2h2sMt
 ZZYFBrjL9eOs2xSAouRltZRq5lRz3Cp5KRZe/P7d1g==
X-Google-Smtp-Source: ABdhPJzRyMZhGiuFkuqzg39xxxmhA96f9Tcd0cbFtk1OH5x7cRguRLX0Vl9KPPxWSrz95Xti0+3ONFcOVR+IlJ9RYpY=
X-Received: by 2002:a05:6808:1314:b0:326:e438:d8cd with SMTP id
 y20-20020a056808131400b00326e438d8cdmr5966587oiv.228.1652375098764; Thu, 12
 May 2022 10:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
 <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
 <Ynkb1U2nNWYPML88@phenom.ffwll.local>
 <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
 <Ynu1k5lH+xvqtObG@phenom.ffwll.local>
 <3429a12f-9fbe-b66b-dbbd-94a1df54714e@collabora.com>
 <YnwJ0kLwLS7RxuwS@phenom.ffwll.local>
 <0ae6fed7-b166-d2b8-0e42-84b94b777c20@collabora.com>
In-Reply-To: <0ae6fed7-b166-d2b8-0e42-84b94b777c20@collabora.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 12 May 2022 19:04:47 +0200
Message-ID: <CAKMK7uGS3PSwbkW7gj1hd2pz591HwY6Gbb=P_X4N5KOM5+X85w@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 12 May 2022 at 13:36, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 5/11/22 22:09, Daniel Vetter wrote:
> > On Wed, May 11, 2022 at 07:06:18PM +0300, Dmitry Osipenko wrote:
> >> On 5/11/22 16:09, Daniel Vetter wrote:
> >>>>>>> I'd like to ask you to reduce the scope of the patchset and build the
> >>>>>>> shrinker only for virtio-gpu. I know that I first suggested to build
> >>>>>>> upon shmem helpers, but it seems that it's easier to do that in a later
> >>>>>>> patchset.
> >>>>>> The first version of the VirtIO shrinker didn't support memory eviction.
> >>>>>> Memory eviction support requires page fault handler to be aware of the
> >>>>>> evicted pages, what should we do about it? The page fault handling is a
> >>>>>> part of memory management, hence to me drm-shmem is already kinda a MM.
> >>>>> Hm I still don't get that part, why does that also not go through the
> >>>>> shmem helpers?
> >>>> The drm_gem_shmem_vm_ops includes the page faults handling, it's a
> >>>> helper by itself that is used by DRM drivers.
> >>>>
> >>>> I could try to move all the shrinker logic to the VirtIO and re-invent
> >>>> virtio_gem_shmem_vm_ops, but what is the point of doing this for each
> >>>> driver if we could have it once and for all in the common drm-shmem code?
> >>>>
> >>>> Maybe I should try to factor out all the shrinker logic from drm-shmem
> >>>> into a new drm-shmem-shrinker that could be shared by drivers? Will you
> >>>> be okay with this option?
> >>> I think we're talking past each another a bit. I'm only bringing up the
> >>> purge vs eviction topic we discussed in the other subthread again.
> >>
> >> Thomas asked to move the whole shrinker code to the VirtIO driver and
> >> I's saying that this is not a great idea to me, or am I misunderstanding
> >> the Thomas' suggestion? Thomas?
> >
> > I think it was just me creating a confusion here.
> >
> > fwiw I do also think that shrinker in shmem helpers makes sense, just in
> > case that was also lost in confusion.
>
> Okay, good that we're on the same page now.
>
> >>>>> I'm still confused why drivers need to know the difference
> >>>>> between evition and purging. Or maybe I'm confused again.
> >>>> Example:
> >>>>
> >>>> If userspace uses IOV addresses, then these addresses must be kept
> >>>> reserved while buffer is evicted.
> >>>>
> >>>> If BO is purged, then we don't need to retain the IOV space allocated
> >>>> for the purged BO.
> >>> Yeah but is that actually needed by anyone? If userspace fails to allocate
> >>> another bo because of lack of gpu address space then it's very easy to
> >>> handle that:
> >>>
> >>> 1. Make a rule that "out of gpu address space" gives you a special errno
> >>> code like ENOSPC
> >>>
> >>> 2. If userspace gets that it walks the list of all buffers it marked as
> >>> purgeable and nukes them (whether they have been evicted or not). Then it
> >>> retries the bo allocation.
> >>>
> >>> Alternatively you can do step 2 also directly from the bo alloc ioctl in
> >>> step 1. Either way you clean up va space, and actually a lot more (you
> >>> potentially nuke all buffers marked as purgeable, not just the ones that
> >>> have been purged already) and only when va cleanup is actually needed
> >>>
> >>> Trying to solve this problem at eviction time otoh means:
> >>> - we have this difference between eviction and purging
> >>> - it's still not complete, you still need to glue step 2 above into your
> >>>   driver somehow, and once step 2 above is glued in doing additional
> >>>   cleanup in the purge function is just duplicated logic
> >>>
> >>> So at least in my opinion this isn't the justification we need. And we
> >>> should definitely not just add that complication "in case, for the
> >>> future", if we don't have a real need right now. Adding it later on is
> >>> easy, removing it later on because it just gets in the way and confuses is
> >>> much harder.
> >>
> >> The IOVA space is only one example.
> >>
> >> In case of the VirtIO driver, we may have two memory allocation for a
> >> BO. One is the shmem allcation in guest and the other is in host's vram.
> >> If we will only release the guest's memory on purge, then the vram will
> >> remain allocated until BO is destroyed, which unnecessarily sub-optimal.
> >
> > Hm but why don't you just nuke the memory on the host side too when you
> > evict? Allowing the guest memory to be swapped out while keeping the host
> > memory allocation alive also doesn't make a lot of sense for me. Both can
> > be recreated (I guess at least?) on swap-in.
>
> Shouldn't be very doable or at least worth the efforts. It's userspace
> that manages data uploading, kernel only provides transport for the
> virtio-gpu commands.
>
> Drivers are free to use the same function for both purge() and evict()
> callbacks if they want. Getting rid of the purge() callback creates more
> problems than solves, IMO.

Hm this still sounds pretty funny and defeats the point of
purgeable/evictable buffers a bit I think. But also I guess we'd
pushed this bikeshed to the max, so I think if you make ->purge
optional and just call ->evict if that's not present, and document it
all in the kerneldoc, then I think that's good.

I just don't think that encouraging drivers to distinguish between
evict/purge is a good idea for almost all of them.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
