Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64874AB8BEA
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ED710E8F9;
	Thu, 15 May 2025 16:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="SH8Gw1z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B1C10E8F9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:09:02 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6066c02cd92so751722eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747325342; x=1747930142;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=91NKOSTv5YT/1qhPptldg9b2q5Yv92CmJPsNir2fXYw=;
 b=SH8Gw1z81nsvCyEGLRy9ty6MfzFCV9zdcTXLzqbb5Bi32UVvnDsEc4Chw6QPSucP+L
 uPj+GmcBjvAPZM03urE4BR7asLhZ5UH4nAIE23d0ueaOpuBgEAuPYjJbEcFIc+yWL4Aq
 iKop9DCYwpEtM2EedS/zbLJzqU3Y0MKj0c/GzNfPuL+gZe13y8TYdruIi0IMfvFn0Xbf
 ubWUtlsi+NG+6Zrq4TZSO/U7bNO9hz+hYOlJ38EjAId2Bl66oQY9ggGpFQkoW5SHjA6Y
 uFJ3mcxeb6z1T7UpU0wS6kSYrqUWR+gsKndtj/iL9dkPyI7URsqLf8doVTmpwe5L9+bS
 HhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325342; x=1747930142;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91NKOSTv5YT/1qhPptldg9b2q5Yv92CmJPsNir2fXYw=;
 b=ScNFhwo7tpKnyoYciR2/QpEX4oQY1Nn4e7LR+q2akdpx+ITLlfiST9PxDoG4sIAHxK
 sGt5njODkOn5FmLZXea5cbCWdJ8XOQzgzBAZ2yaSCkqa/MSYnEDBmjFPkKlN8l8msJXC
 +6pwV2mqjHN359oCI2+yvKiINCpgFHRLqUWsscdpu+hVdym+gnIojZ2NVbbAO9qZ5yzV
 BLoN4dMKgrqmtaWS9rs0HvD0N+XqoW0SaHV4aIaKipTkm78BG6zinzrvrqUKAiP5vL3G
 ZqB0x1H9k7hImCwq1ov1M+jM5abgQbYGHAzjuK89k5jvAAL9S78D8pi560wUCcbm9Xgg
 wI7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXWCfWzANT1XxSZI63Amz/1PLAS+0tJReMIAann2mCqNAX03iz0HbDbu9WOesIP3VTZudCVwU5lo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO9E0QNIDvBo4ij+t5+uVEJ7Mtlt4Wpn41rFNRQIYQyhrCE1hV
 z3MqhJGSzlXHawgblBrLnJnrP0hAbgtAOkLjJLx72TmsxCSHDjT2PXAQwa9xN3y+QFBQxeAWTMw
 tapU=
X-Gm-Gg: ASbGncsnbPRwq7pNqqDHqe3eKjkN09wZ0fG9+p9GYvjoQ8H5e/DGQd/Sv0jPgfV6Gbw
 zq3WZnWos0QF9XzKjkZSCv9dcA3fCS0ZiyM/V0BEmbL6wzXfDo2Njn9EyYqrgA793vHqUEeGdqx
 sQXIwxrWrDIvoXDOEfpu0EfdLfNYIi4dHF/01/GYrK5peGs5BkBn8uErmCtGO2Zy6dButYepsj8
 M7G9L2PjvhP7EmVc0wI0eKxQL2lSPLbhIuFomWMfhs1QzMlxo+/Vy6Y8sHRhI89AgiE2RQqaJdm
 Kb8YC5/NbWCeWXwZIb728Zfu9/6C/rtFDbHiVxJB7U1l3vjyLw==
X-Google-Smtp-Source: AGHT+IGpkpYl6XAu5rX0wJRFiMGQkB9re0fNH5Pwjd+2ZxwedWGAjP2jcG+V3KGtIv5tIrXRqvrUIA==
X-Received: by 2002:a05:620a:1726:b0:7c5:f696:f8e5 with SMTP id
 af79cd13be357-7cd4672499amr14457785a.14.1747325330931; 
 Thu, 15 May 2025 09:08:50 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7cd467bde34sm2281085a.8.2025.05.15.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 09:08:49 -0700 (PDT)
Date: Thu, 15 May 2025 12:08:42 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <20250515160842.GA720744@cmpxchg.org>
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
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

On Thu, May 15, 2025 at 10:55:51AM +0200, Christian König wrote:
> On 5/15/25 05:02, Dave Airlie wrote:
> >> I have to admit I'm pretty clueless about the gpu driver internals and
> >> can't really judge how feasible this is. But from a cgroup POV, if you
> >> want proper memory isolation between groups, it seems to me that's the
> >> direction you'd have to take this in.
> > 
> > Thanks for this insight, I think you have definitely shown me where
> > things need to go here, and I agree that the goal should be to make
> > the pools and the shrinker memcg aware is the proper answer,
> > unfortunately I think we are long way from that at the moment, but
> > I'll need to do a bit more research. I wonder if we can agree on some
> > compromise points in order to move things forward from where they are
> > now.
> > 
> > Right now we have 0 accounting for any system memory allocations done
> > via GPU APIs, never mind the case where we have pools and evictions.
> > 
> > I think I sort of see 3 stages:
> > 1. Land some sort of accounting so you can at least see the active GPU
> > memory usage globally, per-node and per-cgroup - this series mostly
> > covers that, modulo any other feedback I get.
> > 2. Work on making the ttm subsystem cgroup aware and achieve the state
> > where we can shrink inside the cgroup first.
> > 3. Work on what to do with evicted memory for VRAM allocations, and
> > how best to integrate with dmem to possibly allow userspace to define
> > policy for this.
> > 
> >> Ah, no need to worry about it. The name is just a historical memcgism,
> >> from back when we first started charging "kernel" allocations, as
> >> opposed to the conventional, pageable userspace memory. It's no longer
> >> a super meaningful distinction, tbh.
> >>
> >> You can still add a separate counter for GPU memory.
> > 
> > Okay that's interesting, so I guess the only question vs the bespoke
> > ones is whether we use __GFP_ACCOUNT and whether there is benefit in
> > having page->memcg set.
> > 
> >>
> >> I agree this doesn't need to be a goal in itself. It would just be a
> >> side effect of charging through __GFP_ACCOUNT and uncharging inside
> >> __free_pages(). What's more important is that the charge lifetime is
> >> correlated with the actual memory allocation.
> > 
> > How much flexibility to do we have to evolve here, like if we start
> > with where the latest series I posted gets us (maybe with a CONFIG
> > option), then work on memcg aware shrinkers for the pools, then with
> > that in place it might make more sense to account across the complete
> > memory allocation. I think I'm also not sure if passing __GFP_ACCOUNT
> > to the dma allocators is supported, which is also something we need to
> > do, and having the bespoke API allows that to be possible.
> 
> Stop for a second.
> 
> As far as I can see the shrinker for the TTM pool should *not* be
> memcg aware. Background is that pages who enter the pool are
> considered freed by the application.

They're not free from a system POV until they're back in the page
allocator.

> The only reason we have the pool is to speed up allocation of
> uncached and write combined pages as well as work around for
> performance problems of the coherent DMA API.
> 
> The shrinker makes sure that the pages can be given back to the core
> memory management at any given time.

That's work. And it's a direct result of some cgroup having allocated
this memory. Why should somebody else have to clean it up?

The shrinker also doesn't run in isolation. It's invoked in the
broader context of there being a memory shortage, along with all the
other shrinkers in the system, along with file reclaim, and
potentially even swapping.

Why should all of this be externalized to other containers?

For proper memory isolation, the cleanup cost needs to be carried by
the cgroup that is responsible for it in the first place - not some
other container that's just trying to read() a file or malloc().

This memory isn't special. The majority of memcg-tracked memory is
shrinkable/reclaimable. In every single case it stays charged until
the shrink work has been completed, and the pages are handed back to
the allocator.
