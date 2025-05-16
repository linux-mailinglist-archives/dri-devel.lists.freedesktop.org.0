Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F016ABA473
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 22:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40A710EB79;
	Fri, 16 May 2025 20:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="AV537H82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589510EB79
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 20:04:28 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6f8c2e87757so4273806d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 13:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747425868; x=1748030668;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8WVNeAvgjN69jytbH8Oyi2JZGwt4O3Tx5zhyeq1d3A8=;
 b=AV537H82xTNKGGLkvkd9GxHknMmoYINmPD+VvHoEpKgvHjg5ZPpU74OBctn6BecntN
 T+EY9yByuZD0+bXfh5D52GMQ+kVbM6fIM46BfYf7XVv+9hj9tH/CPmBj5KOM0+wuamcW
 vJlTO7rK+faBkM4t+PVUa3mtqw6rTgA7n7GHAkKpAJ+sqiIfZZpXYn1B18xXRZ+iVxut
 9x5C4+ds5x/C8s5I/BoQlRNhbp2bI1mWrYZX/4ExgurfofXSyH1rpTAAFKq7ZW6i7fzQ
 1wKh0VL052bQHNHFV/pBjXS97M94QLpf2xmUOyF1FZdbQztUPtAVyIjFEpIg0no6g6xN
 eolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747425868; x=1748030668;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8WVNeAvgjN69jytbH8Oyi2JZGwt4O3Tx5zhyeq1d3A8=;
 b=RyLWMK5bH9TyD8zAIQWuLNRRXnNVI5MgK0i72fFhBptZQchZwLaH8FQnJwuzNC5EC3
 cJm1bacEd7CA8SeOaPtL3Uu9GyqvMa+Z2w6BYxEbpqGuOaNzg21i/tGeNBMo4YEJ02bp
 CfW+wqlRvaLar3h8zg0y0N0dr7l88ksOaxt7CbfmgdEH1alIj2ZLFeDzU8KDXNsUGUsR
 FPLmeVkKY1hShvGLJTdTFK9dL37Ar5dJbGGqzhx1r7XxPokVlwQoZv2f+7SoO1CFM8wI
 c4ZAbCNtZUHb/F9zSeGwBEcooIlWFf5urI6zxZ0nUS/1thViTWv37mA8Fg/a+ZcKgMq2
 HFkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/hvHGECu0tmsAuKh55kDLNeomFlGjW3dgo8mmGeWN1AJw4oDkcB43OBgLJ3WJvygli0CSrWmUTag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKzKohB50lzK8BeQUtiICSIEspWap+rXNlq/fF3pehOOQZ32dt
 VlAX7amtEL7Snk+x3jFsneOxe7BJfGatGbjs0mAzoB/O0A79/rwDHFDacInepI50BJo=
X-Gm-Gg: ASbGnctzbAGcN7UpZPBvV1j05zje6WMO7RvfoSqKOgsPkTj1dCNXW3ukJpcHicH0K0Q
 rWplJrgHqz6HK990sDFfQuqcVFvvIBxUVw84pU81lxcG9OCasqP06iq3EEYLoRWQ1cZTiVoPmlQ
 Y6+mKjOziqRTK/1ANdvFj7X7gfwAvqfwBBrUEHDa5ZBh5AMCu9KCo0U7F0wNBqt8dZYK7Px/nKz
 x9KedTUsy2mPlHLzw/T9eiDC5cDXMsEOSSttz4HYvQyTmr8mbuV6sdsjA+gW5guvXnM7S2iJq/E
 0xGZCgSz9q8D4+51VoFP5Byqcsi5pIlHniSLj7JHfz//3nZ3ghY6OvkFmGdW
X-Google-Smtp-Source: AGHT+IHoSbYUjRY2GvaB1qQU1qbRqS+cGcuO/bhESiyT5BI93s8Li1RydfrUi/T/LchFh37Q3LKbyg==
X-Received: by 2002:a05:6214:2341:b0:6f2:b7cd:7cac with SMTP id
 6a1803df08f44-6f8b08aad53mr80048916d6.31.1747425867618; 
 Fri, 16 May 2025 13:04:27 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f8b08af48fsm16087966d6.47.2025.05.16.13.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 13:04:26 -0700 (PDT)
Date: Fri, 16 May 2025 16:04:23 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250516200423.GE720744@cmpxchg.org>
References: <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 16, 2025 at 07:42:08PM +0200, Christian König wrote:
> On 5/16/25 18:41, Johannes Weiner wrote:
> >>> Listen, none of this is even remotely new. This isn't the first cache
> >>> we're tracking, and it's not the first consumer that can outlive the
> >>> controlling cgroup.
> >>
> >> Yes, I knew about all of that and I find that extremely questionable
> >> on existing handling as well.
> > 
> > This code handles billions of containers every day, but we'll be sure
> > to consult you on the next redesign.
> 
> Well yes, please do so. I'm working on Linux for around 30 years now and halve of that on device memory management.
> 
> And the subsystems I maintain is used by literally billion Android devices and HPC datacenters
> 
> One of the reasons we don't have a good integration between device memory and cgroups is because specific requirements have been ignored while designing cgroups.
> 
> That cgroups works for a lot of use cases doesn't mean that it does for all of them.
> 
> >> Memory pools which are only used to improve allocation performance
> >> are something the kernel handles transparently and are completely
> >> outside of any cgroup tracking whatsoever.
> > 
> > You're describing a cache. It doesn't matter whether it's caching CPU
> > work, IO work or network packets.
> 
> A cache description doesn't really fit this pool here.
> 
> The memory properties are similar to what GFP_DMA or GFP_DMA32
> provide.
>
> The reasons we haven't moved this into the core memory management is
> because it is completely x86 specific and only used by a rather
> specific group of devices.

I fully understand that. It's about memory properties.

What I think you're also saying is that the best solution would be
that you could ask the core MM for pages with a specific property, and
it would hand you pages that were previously freed with those same
properties. Or, if none such pages are on the freelists, it would grab
free pages with different properties and convert them on the fly.

For all intents and purposes, this free memory would then be trivially
fungible between drm use, non-drm use, and different cgroups - except
for a few CPU cycles when converting but that's *probably* negligible?
And now you could get rid of the "hack" in drm and didn't have to hang
on to special-property pages and implement a shrinker at all.

So far so good.

But that just isn't the implementation of today. And the devil is very
much in the details with this:

Your memory attribute conversions are currently tied to a *shrinker*.

This means the conversion doesn't trivially happen in the allocator,
it happens from *reclaim context*.

Now *your* shrinker is fairly cheap to run, so I do understand when
you're saying in exasperation: We give this memory back if somebody
needs it for other purposes. What *is* the big deal?

The *reclaim context* is the big deal. The problem is *all the other
shrinkers that run at this time as well*. Because you held onto those
pages long enough that they contributed to a bonafide, general memory
shortage situation. And *that* has consequences for other cgroups.

> > What matters is what it takes to recycle those pages for other
> > purposes - especially non-GPU purposes.
> 
> Exactly that, yes. From the TTM pool pages can be given back to the
> core OS at any time. It's just a bunch of extra CPU cycles.
>
> > And more importantly, *what other memory in other cgroups they
> > displace in the meantime*.
> 
> What do you mean with that?
> 
> Other cgroups are not affected by anything the allocating cgroup
> does, except for the extra CPU overhead while giving pages back to
> the core OS, but that is negligible we haven't even optimized this
> code path.

I hope the answer to this question is apparent now.

But to illustrate the problem better, let's consider the following
container setup.

A system has 10G of memory. You run two cgroups on it that each have a
a limit of 5G:

             system (10G)
            /      \
           A (5G)   B (5G)

Let's say A is running some database and is using its full 5G.

B is first doing some buffered IO, instantiating up to 5G worth of
file cache. Since the file cache is cgroup-aware, those pages will go
onto the private LRU list of B. And they will remain there until those
cache pages are fully reclaimed.

B then malloc()s. Because it's at the cgroup limit, it's forced into
cgroup reclaim on its private LRUs, where it recycles some of its old
page cache to satisfy the heap request.

A was not affected by anything that occurred in B.

---

Now let's consider the same starting scenario, but instead B is
interacting with the gpu driver and creates 5G worth of ttm objects.

Once its done with them, you put the pages into the pool and uncharge
the memory from B.

Now B mallocs() again. The cgroup is not maxed out - it's empty in
fact. So no cgroup reclaim happens.

However, at this point, A has 5G allocated, and there are still 5G in
the drm driver. The *system itself* is out of memory now.

So B enters *global* reclaim to find pages for its heap request.

It invokes all the shrinkers and runs reclaim on all cgroups.

In the process, it will claw back some pages from ttm; but it will
*also* reclaim all kinds of caches, maybe even swap stuff, from A!

Now *A* starts faulting due to the pages that were stolen and tries to
allocate. But memory is still full, because B backfilled it with heap.

So now *A* goes into global reclaim as well: it takes some pages from
the ttm pool, some from B, *and some from itself*.

It can take several iterations of this until the ttm pool has been
fully drained, and A has all its memory faulted back in and is running
at full speed again.

In this scenario, A was directly affected, potentially quite severely,
by B's actions.

This is the definition of containment failure.

Consider two aggravating additions to this scenario:

1. While A *could* in theory benefit from the pool pages too, let's
   say it never interacts with the GPU at all. So it's paying the cost
   for something that *only benefits B*.

2. B is malicious. It does the above sequence - interact with ttm, let
   the pool escape its cgroup, then allocate heap - rapidly over and
   over again. It effectively DoSes A.

---

So as long as the pool is implemented as it is today, it should very
much be per cgroup.

Reclaim lifetime means it can displace other memory with reclaim
lifetime.

You cannot assume other cgroups benefit from this memory.

You cannot trust other cgroups to play nice.
