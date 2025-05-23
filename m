Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7576AAC2826
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 19:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA2010E066;
	Fri, 23 May 2025 17:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g/2sew1v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C765F10E066
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 17:06:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7B2D629CD;
 Fri, 23 May 2025 17:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3CEC4CEE9;
 Fri, 23 May 2025 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748020014;
 bh=kTO86Yr9yECuI+Z75YE9dgiAuo/kBDUAB7RAsNdQ800=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/2sew1vcli3jpNIWBW8Q5N8Jouc+ikqp2aImWnodkF6SkeE/rnilP0HbzQppzChx
 i7ZQrjegza3FhKBNYFyS1gBlpIyCINcMGDrLCmkl1wM4JwcyNanPeRYqVI1tdaSKqw
 BXs2dli6WyOfCcv5eC9MNCcaPPUiIk8o9SNP7IerM81Hqfv3kuswMEHgXjCx47uyDv
 Dlt6Lf3XUDalK41XOT12WylQjxohiqA+Y+SiisvqKex7lbdSs9KccQhBL/jzSG3Vwl
 oCja4RH2RP+5cVKogJjm82sgsPOPWAHR45wI1fv6sc9vdShx+2e/CciO4rizRXtM97
 il/xZnUT1/jbg==
Date: Fri, 23 May 2025 07:06:53 -1000
From: Tejun Heo <tj@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <aDCrLTNoWC8oSS7Z@slm.duckdns.org>
References: <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
 <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
 <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de476962-194f-4c77-aabb-559a74caf5ac@amd.com>
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

Hello, Christian.

On Fri, May 23, 2025 at 09:58:58AM +0200, Christian König wrote:
...
> > - There's a GPU workload which uses a sizable amount of system memory for
> >   the pool being discussed in this thread. This GPU workload is very
> >   important, so we want to make sure that other activities in the system
> >   don't bother it. We give it plenty of isolated CPUs and protect its memory
> >   with high enough memory.low.
> 
> That situation simply doesn't happen. See isolation is *not* a requirement
> for the pool.
...
> See the submission model of GPUs is best effort. E.g. you don't guarantee
> any performance isolation between processes whatsoever. If we would start
> to do this we would need to start re-designing the HW.

This is a radical claim. Let's table the rest of the discussion for now. I
don't know enough to tell whether this claim is true or not, but for this to
be true, the following should be true:

 Whether the GPU memory pool is reclaimed or not doesn't have noticeable
 performance implications on the GPU performance.

Is this true?

As for the scenario that I described above, I didn't just come up with it.
I'm only supporting from system side but that's based on what our ML folks
are doing right now. We have a bunch of lage machines with multiple GPUs
running ML workloads. The workloads can run for a long time spread across
many machines and they synchronize frequently, so any performance drop on
one GPU lowers utiliization on all involved GPUs which can go up to three
digits. For example, any scheduling disturbances on the submitting thread
propagates through the whole cluster and slows down all involved GPUs.

Also, because these machines are large on the CPU and memory sides too and
aren't doing whole lot other than managing the GPUs, people want to put on a
significant amount of CPU work on them which can easily create at least
moderate memory pressure. Is the claim that the combined write memory pool
doesn't have any meaningful impact on the GPU workload performance?

Thanks.

-- 
tejun
