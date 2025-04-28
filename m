Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A16A9F299
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 15:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405610E004;
	Mon, 28 Apr 2025 13:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="J+6cTvA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B2110E004
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:45:44 +0000 (UTC)
Date: Mon, 28 Apr 2025 09:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745847932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zoNo9gkIIs0YsF9ZKck9yXc6pBysUjf+qFYhWH0k6XU=;
 b=J+6cTvA4hzFmGUxX3EOq0gdOwRmCbjf9hhGCJ7zO+Q78aE5Q4pAWxAzDMJOjVjXiNJPC+D
 vollZk+DiNurq/Xhv14gjXWDoaIZrasKQ5PZvxG45v2Ip5uCtc7jm+WIU2BN/SML1e0sZg
 vhQN6mg5q6mYS6cCbXlLru2Zj5Vug/6oasUdjT2hweKqiE5ofGzNh3LtOKrWSZgKuMFxpR
 MuasI6oUbOzXRFDF6fJW0bu5Dm37LH5clk+W2b4u3DTRPSLrMa0mMOvpZyhrEj851+vKaL
 YHmcCq31lXQwxDQey5lqFmAI2H44teRcgCcdV6NiySTI781AAlqj5yQcSDyAew==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
Message-ID: <aA-GdrALle7FC_5e@blossom>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
 <aAj9eRRXS-kHE_hH@blossom> <20250428094204.5b128a96@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428094204.5b128a96@collabora.com>
X-Migadu-Flow: FLOW_OUT
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

> BTW, is there a piece of doc explaining the rational behind this
> dma_fence contract, or is it just the usual informal knowledge shared
> among DRM devs over IRC/email threads :-) ?
> 
> To be honest, I'm a bit unhappy with this "it's part of the dma_fence
> contract" explanation, because I have a hard time remembering all the
> details that led to these set of rules myself, so I suspect it's even
> harder for new comers to reason about this. To me, it's one of the
> reasons people fail to understand/tend to forget what the
> problems/limitations are, and end up ignoring them (intentionally or
> not).
> 
> FWIW, this is what I remember, but I'm sure there's more:
> 
> 1. dma_fence must signal in finite time, so unbounded waits in the
>    fence signalling path path is not good, and that's what happens with
>    GFP_KERNEL allocations
> 2. if you're blocked in your GPU fault handler, that means you can't
>    process further faults happening on other contexts
> 3. GPU drivers are actively participating in the memory reclaim
>    process, which leads to deadlocks if the memory allocation in the
>    fault handler is waiting on the very same GPU job fence that's
>    waiting for its memory allocation to be satisfied
> 
> I'd really love if someone (Sima, Alyssa and/or Christian?) could sum it
> up, so I can put the outcome of this discussion in some kernel doc
> entry (or maybe it'd be better if this was one of you submitting a
> patch for that ;-)). If it's already documented somewhere, I'll just
> have to eat my hat and accept your RTFM answer :-).

https://www.kernel.org/doc/html/next/driver-api/dma-buf.html#dma-fence-cross-driver-contract

Specifically

  Drivers are allowed to call dma_fence_wait() from their shrinker
  callbacks. This means any code required for fence completion cannot
  allocate memory with GFP_KERNEL.

Concretely:

* Job requires memory allocation to signal a fence
* We're in a low memory situation, so the shrinker is invoked
* The shrinker can't free memory until the job finishes
* Deadlock!

Possibly we could relax the contract to let us reclaim non-graphics
memory, but that's not my department.
