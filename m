Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14CAC14FC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E872510E197;
	Thu, 22 May 2025 19:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EODVfA5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B7310E082
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 34B28A4F16E;
 Thu, 22 May 2025 19:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7763FC4CEE4;
 Thu, 22 May 2025 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747943471;
 bh=DFUCJtl+L58Pj5bTViEhxoTPuRVbbHuWRPjzQaORv1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EODVfA5cjMTS33Uwal4E9GFZbFhGr1i450nJ++XjjSqQs+EiL9tYMdNvztifWtPsW
 Wo90bOgrqtIZtEcCCSOLRIuDQZX+p98Oh4ucQdMz+KyS889c1+bWPNAXLPIprOoCbO
 1oNy78Y5mehLpWpxcYwfdX5Klhdjhlv9HHHz+BCXbhClCkA7QLUN+nvDlvlaT8IyNp
 j1YElZUWm89PHmz6b4i6DALedFYJc6KGfvSij5Aj9RR5vlfdFV1eAuSMnxvHueQ7OM
 OJORIbykFGJMXweofo+11WjqZRVTOX7xzvB6XN+EiGDQp9w4HdDnknhWIhzYfpFHbe
 6TEHUJ8/bD6Zw==
Date: Thu, 22 May 2025 09:51:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
Message-ID: <aC-ALtcs8RF1yZ1y@slm.duckdns.org>
References: <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
 <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
 <20250515160842.GA720744@cmpxchg.org>
 <bba93237-9266-4e25-a543-e309eb7bb4ec@amd.com>
 <20250516145318.GB720744@cmpxchg.org>
 <5000d284-162c-4e63-9883-7e6957209b95@amd.com>
 <20250516164150.GD720744@cmpxchg.org>
 <eff07695-3de2-49b7-8cde-19a1a6cf3161@amd.com>
 <20250516200423.GE720744@cmpxchg.org>
 <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txLaTjfjgC_h9PLR4H-LKpC9_Fet7=HYBpyeoCL6yAQJg@mail.gmail.com>
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

Hello,

On Sat, May 17, 2025 at 06:25:02AM +1000, Dave Airlie wrote:
> I think this is where we have 2 options:
> (a) moving this stuff into core mm and out of shrinker context
> (b) fix our shrinker to be cgroup aware and solve that first.
> 
> The main question I have for Christian, is can you give me a list of
> use cases that this will seriously negatively effect if we proceed
> with (b).

This thread seems to have gone a bit haywire and we may be losing some
context. I'm not sure not doing (b) is an option for acceptable isolation. I
think Johannes already raised the issue but please consider the following
scenario:

- There's a GPU workload which uses a sizable amount of system memory for
  the pool being discussed in this thread. This GPU workload is very
  important, so we want to make sure that other activities in the system
  don't bother it. We give it plenty of isolated CPUs and protect its memory
  with high enough memory.low.

- Because most CPUs are largely idling while GPU is busy, there are plenty
  of CPU cycles which can be used without impacting the GPU workload, so we
  decide to do some data preprocessing which involves scanning large data
  set creating memory usage which is mostly streaming but still has enough
  look backs to promote them in the LRU lists.

IIUC, in the shared pool model, the GPU memory which isn't currently being
used would sit outside the cgroup, and thus outside the protection of
memory.low. Again, IIUC, you want to make this pool priority reclaimed
because reclaiming is nearly free and you don't want to create undue
pressure on other reclaimable resources.

However, what would happen in the above scenario under such implementation
is that the GPU workload would keep losing its memory pool to the background
memory pressure created by the streaming memory usage. It's also easy to
expand on scenarios like this with other GPU workloads with differing
priorities and memory allotments and so on.

There may be some basic misunderstanding here. If a resource is worth
caching, that usually indicates that there's some significant cost
associated with un-caching the resource. It doesn't matter whether that cost
is on the creation or destruction path. Here, the alloc path is expensive
and free path is nearly free. However, this doesn't mean that we can get
free isolation while bunching them together for immediate reclaim as others
would be able to force you into alloc operations that you wouldn't need
otherwise. If someone else can make you pay for something that you otherwise
wouldn't, that resource is not isolated.

Thanks.

-- 
tejun
