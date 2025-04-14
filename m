Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7DCA8822E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C8B10E5D7;
	Mon, 14 Apr 2025 13:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V7fyV8Js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67C210E5D3;
 Mon, 14 Apr 2025 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744637468;
 bh=6gOo4FOMZVhhngoKPJuzni4Tvmt4DnOshcJFnFNxdGY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V7fyV8Jsmv2HRRNo8yTZpZi+/C/t1TSYscE9yxQRPohGsDzM4HeqAWwe4qnyiqY0E
 FScbbpuzmV7iSHqbEUO8gd/N+seSItINGhfoSSP3rlJ6mDre/xtkR2CPkx6c9gOil5
 lNy6baepyEdlbsS2jlG5M6H1C6RFUXc2Nqjkev4RNor19yKIjHy3s2q+a99/USGnSc
 VC/5xngmNoz7P5K8GcZ3iIq7fOyMJaXNzKVXKuLAROzwY9aiHLJqzqjsIKGnTctL/4
 /3B1aHkqobDUfz0Rd8aaYFGqfblbmYCfzEIwwbwRew3RzCUeZfBUwzNFnUVfIUeLOi
 NcCsRuifFFdnw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D0C917E1034;
 Mon, 14 Apr 2025 15:31:07 +0200 (CEST)
Date: Mon, 14 Apr 2025 15:31:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, lima@lists.freedesktop.org, Qiang Yu
 <yuq825@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, kernel@collabora.com, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Erik Faye-Lund
 <erik.faye-lund@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250414153101.57d231ba@collabora.com>
In-Reply-To: <Z_0HuzvbMV3vybWe@blossom>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
 <20250414132206.728eacb3@collabora.com> <Z_0HuzvbMV3vybWe@blossom>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 14 Apr 2025 09:03:55 -0400
Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:

> > Actually, CSF stands in the way of re-allocating memory to other
> > contexts, because once we've allocated memory to a tiler heap, the FW
> > manages this pool of chunks, and recycles them. Mesa can intercept
> > the "returned chunks" and collect those chunks instead of re-assiging
> > then to the tiler heap through a CS instruction (which goes thought
> > the FW internallu), but that involves extra collaboration between the
> > UMD, KMD and FW which we don't have at the moment. Not saying never,
> > but I'd rather fix things gradually (first the blocking alloc in the
> > fence-signalling path, then the optimization to share the extra mem
> > reservation cost among contexts by returning the chunks to the global
> > kernel pool rather than directly to the heap).
> > 
> > This approach should work fine with JM GPUs where the tiler heap is
> > entirely managed by the KMD though.  
> 
> I really think CSF should be relying on the simple heuristics with
> incremental-rendering, unless you can prove that's actually a
> performance issue in practice. (On Imagination/Apple parts, it almost
> never is and we rely entirely on this approach. It's ok - it really is.
> For simple 2D workloads, the initial heap allocation is fine. For 3D
> scenes, we need very few frames to get the right size. this doesn't
> cause stutters in practice.)

Yep I agree, hence the "let's try the simple thing first and let's see
if we actually need the more complex stuff later". My hope is that we'll
never need it, but I hate to make definitive statements, because it
usually bites me back when I do :P.

> 
> For JM .. yes, this discussion remains relevant of course.

I'm still trying to see if we can emulate/have incremental-rendering on
JM hardware, so it really becomes a Lima-only issue. According to Erik,
predicting how much heap is needed is much more predictible on Utgard
(no indirect draws, simpler binning hierarchy, and other details he
mentioned which I forgot).
