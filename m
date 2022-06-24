Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECD55A293
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02F210EFBC;
	Fri, 24 Jun 2022 20:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373F10EFBC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:23:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id c13so4957967eds.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rM6StsZ/3rmWNZ6eG3nFC9QNenxnUOTVwI/HAfEm2EQ=;
 b=VYViBveaMX2iHovNjImE8ft1aL8oby/bDvJodcDA4y4Eo+tutY1hGinHsM3aKTvLEE
 UKfzf6+eCMmxZ49Ku37S9pc+tHn/uh5pXrCXh3E8Ggw/FSYRFeIyB8RDclfGgyvtHmNh
 MqpcvSiLK6jgmcJHZD8u3uLJ1nBF6f8mOUmtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rM6StsZ/3rmWNZ6eG3nFC9QNenxnUOTVwI/HAfEm2EQ=;
 b=4bIVH5UlWcTyGgFZ+deTW8FszE9Omu8/NoswvACPjn2+0r7rJ1A8EgNlGEnNHVIztn
 2xqlfx6xIB6GN50zTyUYQetYnWoGobv7Pal34H8QQDX/oAfGuj0XQrfQ7+gB4kEsquLY
 XocoLJ1cMtR9QX+SQX+OU8k5jGRYhL1OIOfZcS41W+pOfvxX3Y10LcGK/DE+IPe9ackc
 J+4dFbcPjCuW6E+EYWXspcxaPv3AA57YxnSSjUlzr4fhp9NuFl3KLQha6VDU2wqXTOsj
 Vo+Nql9+aK0RC6A2d+JFYEVsYQ0F81n/4/lxlsDDapYnFQhkD3DdtW2ddNzps8uBE5hJ
 XR+w==
X-Gm-Message-State: AJIora/nUwL8oUpD7+4z3rU0Zr+PJiZo20QwUt53ZcA4aIj6TAgD3zt7
 pvVyyod7sajBcQfNQf4hRzPbow==
X-Google-Smtp-Source: AGRyM1uJnErMjUto5d2AkMD9qcjjZpgW235kvjYxoK3tSLlU8a0umCcexISHAvYdIuLK226BGQhyeA==
X-Received: by 2002:a05:6402:4248:b0:435:9150:ccfb with SMTP id
 g8-20020a056402424800b004359150ccfbmr1101365edb.374.1656102232134; 
 Fri, 24 Jun 2022 13:23:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b007094f98788csm1630637ejm.113.2022.06.24.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 13:23:51 -0700 (PDT)
Date: Fri, 24 Jun 2022 22:23:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
Message-ID: <YrYdVRMjK4YS33hO@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel@collabora.com
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-18-dmitry.osipenko@collabora.com>
 <CAF6AEGt61t2truYDCxm17hqUPV-UdEdHjLs+6vmj5RPoPuVBYg@mail.gmail.com>
 <3bb3dc53-69fc-8cdb-ae37-583b9b2660a3@collabora.com>
 <CAF6AEGus7R_i7RMWGmbawVi62xCk5mhLTWGq2QEkcWY+XaJBAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGus7R_i7RMWGmbawVi62xCk5mhLTWGq2QEkcWY+XaJBAQ@mail.gmail.com>
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
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 08:18:04AM -0700, Rob Clark wrote:
> On Mon, Jun 20, 2022 at 7:09 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> >
> > On 6/19/22 20:53, Rob Clark wrote:
> > ...
> > >> +static unsigned long
> > >> +drm_gem_shmem_shrinker_count_objects(struct shrinker *shrinker,
> > >> +                                    struct shrink_control *sc)
> > >> +{
> > >> +       struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
> > >> +       struct drm_gem_shmem_object *shmem;
> > >> +       unsigned long count = 0;
> > >> +
> > >> +       if (!mutex_trylock(&gem_shrinker->lock))
> > >> +               return 0;
> > >> +
> > >> +       list_for_each_entry(shmem, &gem_shrinker->lru_evictable, madv_list) {
> > >> +               count += shmem->base.size;
> > >> +
> > >> +               if (count >= SHRINK_EMPTY)
> > >> +                       break;
> > >> +       }
> > >> +
> > >> +       mutex_unlock(&gem_shrinker->lock);
> > >
> > > As I mentioned on other thread, count_objects, being approximate but
> > > lockless and fast is the important thing.  Otherwise when you start
> > > hitting the shrinker on many threads, you end up serializing them all,
> > > even if you have no pages to return to the system at that point.
> >
> > Daniel's point for dropping the lockless variant was that we're already
> > in trouble if we're hitting shrinker too often and extra optimizations
> > won't bring much benefits to us.
> 
> At least with zram swap (which I highly recommend using even if you
> are not using a physical swap file/partition), swapin/out is actually
> quite fast.  And if you are leaning on zram swap to fit 8GB of chrome
> browser on a 4GB device, the shrinker gets hit quite a lot.  Lower
> spec (4GB RAM) chromebooks can be under constant memory pressure and
> can quite easily get into a situation where you are hitting the
> shrinker on many threads simultaneously.  So it is pretty important
> for all shrinkers in the system (not just drm driver) to be as
> concurrent as possible.  As long as you avoid serializing reclaim on
> all the threads, performance can still be quite good, but if you don't
> performance will fall off a cliff.
> 
> jfwiw, we are seeing pretty good results (iirc 40-70% increase in open
> tab counts) with the combination of eviction + multigen LRU[1] +
> sizing zram swap to be 2x physical RAM
> 
> [1] https://lwn.net/Articles/856931/
> 
> > Alright, I'll add back the lockless variant (or will use yours
> > drm_gem_lru) in the next revision. The code difference is very small
> > after all.
> >
> > ...
> > >> +               /* prevent racing with the dma-buf importing/exporting */
> > >> +               if (!mutex_trylock(&gem_shrinker->dev->object_name_lock)) {
> > >> +                       *lock_contention |= true;
> > >> +                       goto resv_unlock;
> > >> +               }
> > >
> > > I'm not sure this is a good idea to serialize on object_name_lock.
> > > Purgeable buffers should never be shared (imported or exported).  So
> > > at best you are avoiding evicting and immediately swapping back in, in
> > > a rare case, at the cost of serializing multiple threads trying to
> > > reclaim pages in parallel.
> >
> > The object_name_lock shouldn't cause contention in practice. But objects
> > are also pinned on attachment, hence maybe this lock is indeed
> > unnecessary.. I'll re-check it.
> 
> I'm not worried about contention with export/import/etc, but
> contention between multiple threads hitting the shrinker in parallel.
> I guess since you are using trylock, it won't *block* the other
> threads hitting shrinker, but they'll just end up looping in
> do_shrink_slab() because they are hitting contention.
> 
> I'd have to do some experiments to see how it works out in practice,
> but my gut feel is that it isn't a good idea

Yeah trylock on anything else than the object lock is No Good in the
shrinker. And it really shouldn't be needed, since import/export should
pin stuff as needed. Which should be protected by the dma_resv object
lock. If not, we need to fix that.

Picking a random drm-internal lock like this is definitely no good design.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
