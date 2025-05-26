Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EDAC4594
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 01:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A0B10E3EF;
	Mon, 26 May 2025 23:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="IVfyk5Dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03FB10E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 23:49:31 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-23461842024so12112605ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 16:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1748303370; x=1748908170;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AXwyJdi2Z7FErjZCvW2qksaaTSldIRPNKjI60yd21xM=;
 b=IVfyk5DvmTnD+W0ddBfPotySJeWLw8mWQJHrm2gAIhifhDIOifDnYzj25zCiU8uQ7E
 LU6t8HNVhqTjG/NCf2CUuHTRJ21N1sMeCx2Qv4qHmQXEQq4b/uYyGQJAr3SAdRD1ICPE
 StU/vVUPP5rjE91IbfDkBz9Ik0dPEE/mOBDPMQRhd6uSu3XSQujNuwpi8XmfB7BEyIGE
 Q/tQ9RqeWROLUi/LgPCSt2UeR5s1hFw2vMvnG1LbuuKD/hA7paESbnKONDAZJr5MEo8+
 UBUXvZ6HD+BxQZk+u0OufaEW1xHETz2nMS6NgB5I81h+AhRmkcE/0g+o5HUSYFDvjLqg
 AZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748303370; x=1748908170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXwyJdi2Z7FErjZCvW2qksaaTSldIRPNKjI60yd21xM=;
 b=iJol/umxqFE7IsZ52SpaEbrkrKO7KYL3lUopNjzXe0kGHtYsOPf3nT6X7XkqDxBLI+
 dMAg7b0NAgng5GiHVzGVNX5nDeMtNIpj+MfmgIiJHdJNdpNrmnXGsZIZuOZ/aHRIbRbX
 2EtaQ8G8Ll16zfuNttfpVmhEohBoW8UjprHDdmRrX9XZp6qYG6gElw/ywMS4KsNvN0c7
 9QVlfdB2zIoGgg1eHqc1wXksJsdOBD42T4LAp5vHU9UUmpYCj7jzBCGwSB6HF+kQKDDZ
 9wq9PfFa9dbkA5Er7As/6/ssmqLTIlKphWnlh45Vretq2AQMr/MmkyOZGnki7CECVHPf
 fv5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW62glTs9jp9ku9KOXMabebkEiNU1L4gFqgOUAs+ADmYJQdvwBD4D9Ua2QfFWj8uhmvB32SKYLVnxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyolt5XQh1ZWUV55fkRXMjdESc8jX9zUdvhH8lXHBDEWNjUjx52
 vYFOXGAmAZVd+u798MnC3Zsw4lHFro5QfMoaAZ8HrM1G7cDBNmwW67T4+2JrfNrToFo=
X-Gm-Gg: ASbGncvBSEY5C4pzgEKKQ66bHKBEeJKHLaoAx0e+V2HKU6NtPN7cjd/adicDv0Hp3Gi
 byXSHrldpQ+bbaLNXUbKy/DNh00xrj/cvVZLJp2WCHyQ4yG+lUX7d3gmCrso3krggDVHshkJt5V
 UbBDm+uYNZU3gfdwZDQ6rv9rxR6uSkYGXQVZPRHlRDvSjlt+LkhY4P65yWQT/4KazQOEik6I6hd
 l6/HPnToj8HrCEoAHIx2ndAnXyxF+WBQNa4SiPi2adbpDq/xAfm4vrZFb/v8TVW+Mz2s0f5UaoL
 9ucbYiOpi18S01x07V3gw3Kn30hZqRrmTGoUWQ4X7r3mm1N6ceqGnjbUDyG5TtIo0VOY3QVyFnT
 epIzGVsU/iFZHs4Kk2iwXj8a4bww=
X-Google-Smtp-Source: AGHT+IFR4C1gnyUZXOZSUw3Jf6eeIp0mOeXOxCZz96DUj0/QhDL0BDLfZ6ck7kCpD/XAYiNnRLMzYw==
X-Received: by 2002:a17:903:1a30:b0:223:fabd:4f99 with SMTP id
 d9443c01a7336-23414f334a2mr159947665ad.5.1748303370555; 
 Mon, 26 May 2025 16:49:30 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au.
 [49.180.184.88]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23452e810basm27313695ad.40.2025.05.26.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 16:49:29 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
 (envelope-from <david@fromorbit.com>) id 1uJhZP-00000008ZlC-1Gw0;
 Tue, 27 May 2025 09:49:27 +1000
Date: Tue, 27 May 2025 09:49:27 +1000
From: Dave Chinner <david@fromorbit.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, kasong@tencent.com,
 nphamcs@gmail.com
Subject: Re: list_lru operation for new child memcg?
Message-ID: <aDT-B0EqqDeqXYFh@dread.disaster.area>
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
 <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
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

On Tue, May 27, 2025 at 08:30:22AM +1000, Dave Airlie wrote:
> On Tue, 27 May 2025 at 08:08, Dave Chinner <david@fromorbit.com> wrote:
> >
> > On Tue, May 27, 2025 at 06:32:30AM +1000, Dave Airlie wrote:
> > > Hey all,
> > >
> > > Hope someone here can help me work this out, I've been studying
> > > list_lru a bit this week for possible use in the GPU driver memory
> > > pool code.
> > >
> > > I understand that when a cgroup goes away, it's lru resources get
> > > reparented into the parent resource, however I'm wondering about
> > > operation in the opposite direction and whether this is possible or
> > > something we'd like to add.
> >
> > It's possible, but you need to write the code yourself.
> >
> > You might want to look at the zswap code, it has a memcg-aware
> > global object LRU that charges individual entries to the memcg that
> > use space in the pool.
> >
> > > Scenario:
> > > 1. Toplevel cgroup - empty LRU
> > > 2. Child cgroup A created, adds a bunch of special pages to the LRU
> > > 3. Child cgroup A dies, pages in lru list get reparented to toplevel cgroup
> > > 4. Child cgroup B created. Now if B wants to get special pages from
> > > the pool, is it possible for B to get access to the LRU from the
> > > toplevel cgroup automatically?
> > >
> > > Ideally B would takes pages from the
> > > parent LRU, and put them back into it's LRU, and then reuse the ones
> > > from it's LRU, and only finally allocate new special pages once it has
> > > none and the parent cgroup has none as well.
> >
> > The list_lru has nothing to do with what context gets a new
> > reference to the objects on the LRU. This is something that your
> > pool object lookup/allocation interface would do.
> >
> > If your lookup interface is cgroup aware, it can look up the parent,
> > search it's pool and dequeue from the LRU via:
> >
> >         parent_memcg = parent_mem_cgroup(child_memcg);
> >         <lookup object>
> >         list_lru_del(<object> ..., parent_memcg);
> >
> > parent_memcg). When the child is done with it, it can add it back to
> > it's own LRU via:
> >
> >         list_lru_add(...., child_memcg).
> 
> Thanks Dave,
> 
> So this seems like something that would need to recurse up to the root
> cgroup, which makes me wonder if generic code could/should provide it.
> 
> list_lru_walk_node already does a bit of policy here, where it walks
> the non-memcg lru, then walks the per-memcg ones,

That's a part of the  generic "walk everything in the LRU" API
functionality for list_lru. It isn't policy at all - if a caller
wants to iterate the entire LRU (e.g. to purge it), we have to walk
all the memcgs to do that. i.e. the memcg walk is an API
implementation detail required for correct behaviour of memcg-aware
list_lrus.

It also isn't an ordered scan at all - it iterates the memcgs by
increasing memcg ID and so should be considered a random order scan
in terms of cgroup heirarchy. The xarray index is maintained
internally by the list_lru infrastructure to optimise reparenting
and "walk everything" operations - it only tracks which memcgs
actually have objects stored in this list_lru.  It is not intended
to be in any way ordered or visible externally.

Note that the "non-memcg" lru is actually the root memcg in a
list_lru that is configured with memcg support. Hence doing a
heirarchical top-down walk will walk the "non-memcg" LRU first.
e.g. see drop_slab_node() for the iteration, and how shrink_slab()
specifically handles the root memcg differently to redirect it at
the "non-memcg" shrinker control configuration that passes a NULL
memcg and hence operates on the "non-memcg" LRU.

This tight integration between the shrinkers and list_lru comes
about from two things: memcg support can be compiled out of the
kernel, and there are shrinkers and list_lrus that are not memcg
aware. In both these cases we do not track object in or iterate
memcgs. The code is written this way because it has to support both
static compile time memcg disablement and dynamic runtime selection
of memcg-awareness in the list_lru.

> I kinda need that but in reverse, where it walks the memcg, then its
> ancestors, then the non-memcg lru, just wondering if that makes sense
> in common code like list_lru_walk_node does?

Iterating cgroups in a specific order is not generic list_lru
functionality. Iterating cgroups is quite complex and requires
locking and reference counting to do correctly. e.g. look at
the top down heirarchy walk implemented by mem_cgroup_iter().

That sort of complexity does not belong in list_lru - if you need to
walk memcgs in a specific order, you should do so externally by
following all the croup specific rules for access and lifetimes.
Then you can use the list_lru node/memcg aware APIs to do perform
the list_lru manipulations you need to perform on the specific
internal list_lru list you have already guaranteed will exist and be
safe to access.

> > > I'm just not seeing where the code for 4 happens, but I'm not fully
> > > across this all yet either,
> >
> > You won't find it, because it doesn't do 4) at all - that's consumer
> > side functionality, not generic functionality. If you want to have a
> > pool that is owned by a parent memcg and charge/track it to a child
> > memcg on allocation, then you need to write the pool management code
> > that performs this management. The APIs are there to build this sort
> > of thing, but it's not generic functionality the list_lru provides.
> 
> I have the pool bits, just wasn't sure how generic the code to
> traverse the memcg lrus from the child to the root to see if any level
> has some pages in it's lru.

Once you have your node/cgroup iteration sorted, you can call
list_lru_count_one(lru, nid, memcg) to quickly and safely check if
the LRU for that {node, memcg} LRU contains anything.  If it does,
then you can traverse it.

This two-phase "low overhead count/costly scan" API is how
memcg-aware shrinkers efficiently skip empty LRUs. The actual
node/memcg iteration is completely external to list_lru, the
list-lru infrastructure simply provides efficient APIs to filter
which {node, memcg} tuples need to be worked on.

> I can write it in the consumer, but I do
> think it's quite like list_lru_walk_node just with a different
> allocation strategy.

I disagree - specifically ordered memcg traversal is not something
that the list_lru implementation is currently doing, nor should it
be doing.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
