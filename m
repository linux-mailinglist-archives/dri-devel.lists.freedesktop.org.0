Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71794316775
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 14:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5BE6EC7C;
	Wed, 10 Feb 2021 13:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF376EC7C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 13:06:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id y134so1797755wmd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=vWjBWvQGye13+7MEOsW3WY2wA0+N3oWZdpjvZSe2p7s=;
 b=UX+PcbmGXshC1SgIRJQjOu9U2SVaDM3DTuqb/lPCGbOnrC8AugwDoo1YFbbNb7oKvO
 SeR6Ed5M7bWiJfZnpidco12k1pU6EyW+bg8VMX3IvUezzmTCfI5dZBra4ArywFO4e3TM
 YFK26V3E7LwMWIg1+bm9MzIXUfzZIbdEmZNAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=vWjBWvQGye13+7MEOsW3WY2wA0+N3oWZdpjvZSe2p7s=;
 b=E+S3iTbuVzQavhfP5CnfBPoGILbb8HrGtBa0RK2uT+8pJcPqb05AlSmq0fIE92XtF7
 Ema4vGWfAcYx9IF+rLGoW4G0kh6tYQGj0FO/AqAV77wzubSLbeCFO63eP8uHZ9HKE9Bz
 UYePdOCwzfgpNeuG5l4PoVs6oIfkrXIAsATd8SHKm2MRsQI7475DIbrHyaicJV0AkIzW
 NMzCa4T45b3zPYd64MvyXTEdIO+auZnL5Fyx2LqZ+Lh3AYBgu2Q6kMhXrdNJdLiQHbXz
 H4PiqIZ4qSfHWjoX7UANa7V/apqnlphga6M2JfsTgZCN/fYsPr4i13C3oHZHtE+r6dEs
 hbMA==
X-Gm-Message-State: AOAM533Vm23RXhUzHM2L4bFKyf8iSB9Ln6bZFyeGeorFHynNgvzZEErm
 EOSGPYvKyv26y3vc/hRYOfWFhA==
X-Google-Smtp-Source: ABdhPJx2bij1PtQQiNnBQzdVawVUJd7fn89kx3OW6odklV2HyN/2m8qFAzjgG1FdmW0rSAcp45aIDg==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr2889601wmb.14.1612962408981; 
 Wed, 10 Feb 2021 05:06:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r16sm2680646wrt.68.2021.02.10.05.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 05:06:47 -0800 (PST)
Date: Wed, 10 Feb 2021 14:06:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC][PATCH v6 1/7] drm: Add a sharable drm page-pool
 implementation
Message-ID: <YCPaZc0+F+5C7FG4@phenom.ffwll.local>
Mail-Followup-To: Suren Baghdasaryan <surenb@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>,
 Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-2-john.stultz@linaro.org>
 <4471b3b0-603e-6dbb-8064-ff4a95afbba9@amd.com>
 <CALAqxLWZkUFvJX5r2OU2erW4tU3j=+u==VTyzYkt+95LwwVCUA@mail.gmail.com>
 <48225879-2fe1-22ac-daae-c61d52465aea@amd.com>
 <a9dd7f8a-ef30-9eb4-4834-37801d43b96f@amd.com>
 <CAJuCfpE-T4Cs_h6LfrgHE+T_iOVywU2oNzLquYETudOaBMauMQ@mail.gmail.com>
 <c7df099f-27f7-adc6-4e87-9903ac00cbea@amd.com>
 <CAKMK7uFu27RRpwPdNFuhd-Y5R8XiCNosET9BYtCnr3u30UDs0g@mail.gmail.com>
 <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpF2Q1qVkv75czc2AFRrp25eNz7hqmeO9Wx8e5VY7PvyJw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:16:51PM -0800, Suren Baghdasaryan wrote:
> On Tue, Feb 9, 2021 at 12:03 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Feb 9, 2021 at 6:46 PM Christian K=F6nig <christian.koenig@amd.=
com> wrote:
> > >
> > >
> > >
> > > Am 09.02.21 um 18:33 schrieb Suren Baghdasaryan:
> > > > On Tue, Feb 9, 2021 at 4:57 AM Christian K=F6nig <christian.koenig@=
amd.com> wrote:
> > > >> Am 09.02.21 um 13:11 schrieb Christian K=F6nig:
> > > >>> [SNIP]
> > > >>>>>> +void drm_page_pool_add(struct drm_page_pool *pool, struct pag=
e *page)
> > > >>>>>> +{
> > > >>>>>> +     spin_lock(&pool->lock);
> > > >>>>>> +     list_add_tail(&page->lru, &pool->items);
> > > >>>>>> +     pool->count++;
> > > >>>>>> +     atomic_long_add(1 << pool->order, &total_pages);
> > > >>>>>> +     spin_unlock(&pool->lock);
> > > >>>>>> +
> > > >>>>>> +     mod_node_page_state(page_pgdat(page),
> > > >>>>>> NR_KERNEL_MISC_RECLAIMABLE,
> > > >>>>>> +                         1 << pool->order);
> > > >>>>> Hui what? What should that be good for?
> > > >>>> This is a carryover from the ION page pool implementation:
> > > >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.gi=
t%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_page_pool.c%3Fh%3Dv5.10%=
23n28&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cdccccff8edcd4d147a5=
b08d8cd20cff2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374848881149235=
80%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9%2BIBC0tezSV6Ci4S3kWfW%2BQvJm4mdunn3=
dF6C0kyfCw%3D&amp;reserved=3D0
> > > >>>>
> > > >>>>
> > > >>>> My sense is it helps with the vmstat/meminfo accounting so folks=
 can
> > > >>>> see the cached pages are shrinkable/freeable. This maybe falls u=
nder
> > > >>>> other dmabuf accounting/stats discussions, so I'm happy to remov=
e it
> > > >>>> for now, or let the drivers using the shared page pool logic han=
dle
> > > >>>> the accounting themselves?
> > > >> Intentionally separated the discussion for that here.
> > > >>
> > > >> As far as I can see this is just bluntly incorrect.
> > > >>
> > > >> Either the page is reclaimable or it is part of our pool and freea=
ble
> > > >> through the shrinker, but never ever both.
> > > > IIRC the original motivation for counting ION pooled pages as
> > > > reclaimable was to include them into /proc/meminfo's MemAvailable
> > > > calculations. NR_KERNEL_MISC_RECLAIMABLE defined as "reclaimable
> > > > non-slab kernel pages" seems like a good place to account for them =
but
> > > > I might be wrong.
> > >
> > > Yeah, that's what I see here as well. But exactly that is utterly non=
sense.
> > >
> > > Those pages are not "free" in the sense that get_free_page could retu=
rn
> > > them directly.
> >
> > Well on Android that is kinda true, because Android has it's
> > oom-killer (way back it was just a shrinker callback, not sure how it
> > works now), which just shot down all the background apps. So at least
> > some of that (everything used by background apps) is indeed
> > reclaimable on Android.
> >
> > But that doesn't hold on Linux in general, so we can't really do this
> > for common code.
> >
> > Also I had a long meeting with Suren, John and other googles
> > yesterday, and the aim is now to try and support all the Android gpu
> > memory accounting needs with cgroups. That should work, and it will
> > allow Android to handle all the Android-ism in a clean way in upstream
> > code. Or that's at least the plan.
> >
> > I think the only thing we identified that Android still needs on top
> > is the dma-buf sysfs stuff, so that shared buffers (which on Android
> > are always dma-buf, and always stay around as dma-buf fd throughout
> > their lifetime) can be listed/analyzed with full detail.
> >
> > But aside from this the plan for all the per-process or per-heap
> > account, oom-killer integration and everything else is planned to be
> > done with cgroups.
> =

> Until cgroups are ready we probably will need to add a sysfs node to
> report the total dmabuf pool size and I think that would cover our
> current accounting need here.
> As I mentioned, not including dmabuf pools into MemAvailable would
> affect that stat and I'm wondering if pools should be considered as
> part of MemAvailable or not. Since MemAvailable includes SReclaimable
> I think it makes sense to include them but maybe there are other
> considerations that I'm missing?

On Android, yes, on upstream, not so much. Because upstream doesn't have
the android low memory killer cleanup up all the apps, so effectively we
can't reclaim that memory, and we shouldn't report it as such.
-Daniel

> =

> > Android (for now) only needs to account overall gpu
> > memory since none of it is swappable on android drivers anyway, plus
> > no vram, so not much needed.
> >
> > Cheers, Daniel
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > >> In the best case this just messes up the accounting, in the worst =
case
> > > >> it can cause memory corruption.
> > > >>
> > > >> Christian.
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
