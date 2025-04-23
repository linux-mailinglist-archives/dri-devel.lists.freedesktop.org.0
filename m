Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7545A98D94
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1339010E6C3;
	Wed, 23 Apr 2025 14:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="OE6kOqpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B901F10E6C3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:47:29 +0000 (UTC)
Date: Wed, 23 Apr 2025 10:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745419647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aE83gvByxzvNq/zEJS/qb+ZXbmR6NJ9um1vbepENvWU=;
 b=OE6kOqptrHm0s434qsbF6EUrqAe5wSJOef2tUjzzh3zGeKuW1LjVUJmzvSl/Db4xmqgUri
 8HRd25guVevg/xsm73QBd8LhlPV/6xt0oZQvPzMOkP8DQZsiPKJFKXrYeD9n88wCNF34Du
 YLYAQz/6nQxFAQhWK+OhlTPVMamTYYh3TgmWfYWLxvM9I3vcPof98MbYvJ3n+3sn5PO90X
 ypm8/H68eKSjOCWnYc9ntuB/pYqb+SC2V3kYoqI+2FkQgAYNNuCVW45MBQC3KhsTG0xfYV
 X5udHGqBW3zL6c6u6CpMc287irtTzQ0kXhMJvSzM9/kSrAuKva+PN+jefpvKSg==
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
Message-ID: <aAj9eRRXS-kHE_hH@blossom>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418122524.410448-1-boris.brezillon@collabora.com>
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

Steven wanted non-Mali eyes, so with my Imaginapple hat on...

> +All lot of embedded GPUs are using tile-based rendering instead of immediate

s/All lot of/Many/

> +- Complex geometry pipelines: if you throw geometry/tesselation/mesh shaders
> +  it gets even trickier to guess the number of primitives from the number
> +  of vertices passed to the vertex shader.

Tessellation, yes. Geometry shaders, no. Geometry shaders must declare
the maximum # of vertices they output, so by themselves geometry shaders
don't make the problem much harder - unless you do an indirect draw with
a GS, the emulated GS draw can still be direct.

But I guess "even trickier" is accurate still...

> +For all these reasons, the tiler usually allocates memory dynamically, but
> +DRM has not been designed with this use case in mind. Drivers will address
> +these problems differently based on the functionality provided by their
> +hardware, but all of them almost certainly have to deal with this somehow.
> +
> +The easy solution is to statically allocate a huge buffer to pick from when
> +tiler memory is needed, and fail the rendering when this buffer is depleted.
> +Some drivers try to be smarter to avoid reserving a lot of memory upfront.
> +Instead, they start with an almost empty buffer and progressively populate it
> +when the GPU faults on an address sitting in the tiler buffer range.

This all seems very Mali-centric. Imaginapple has had partial renders
since forever.

> +More and more hardware vendors don't bother providing hardware support for
> +geometry/tesselation/mesh stages

I wouldn't say that... Mali is the only relevant hardware that has *no*
hardware support for any of geom/tess/mesh. All the desktop vendors +
Qualcomm have full hardware support, Apple has hardware mesh on m3+,
Broadcom has geom/tess, and I think Imagination has geom/tess on certain
parts.

And I don't know of any vendors (except possibly Imagination) that
removed hardware support, because it turns out having hardware support
for core API features is a good thing actually. It doesn't need to look
like "put the API in hardware" but some sort of hardware acceleration
(like AMD's NGG) solves the problems in this doc and more.

So... just "Some hardware vendors omit hardware support for
geometry/tessellation/mesh stages".

> This being said, the same +"start small, grow on-demand" can be
> applied to avoid over-allocating memory +upfront.

[citation needed], if we overflow that buffer we're screwed and hit
device_loss, and that's unacceptable in normal usage.

> +The problem with on-demand allocation is that suddenly, GPU accesses can
> +fail on OOM, and the DRM components (drm_gpu_scheduler and drm_gem mostly)
> +were not designed for that.

It's not the common DRM scheduler that causes this problem, it
fundamentally violates the kernel-wide dma_fence contract: signalling a
dma-fence must not block on a fallible memory allocation, full stop.
Nothing we do in DRM will change that contract (and it's not obvious to
me that kbase is actually correct in all the corner cases).

> +The second trick to try to avoid over-allocation, even with this
> +sub-optimistic estimate, is to have a shared pool of memory that can be
> +used by all GPU contexts when they need tiler/geometry memory. This
> +implies returning chunks to this pool at some point, so other contexts
> +can re-use those. Details about what this global memory pool implementation
> +would look like is currently undefined, but it needs to be filled to
> +guarantee that pre-allocation requests for on-demand buffers used by a
> +GPU job can be satisfied in the fault handler path.

How do we clean memory between contexts? This is a security issue.
Either we need to pin physical pages to single processes, or we need to
zero pages when returning pages to the shared pool. Zeroing on the
CPU side is an option but the performance hit may be unacceptable
depending how it's implemented. Alternatively we can require userspace to
clean up after itself on the gpu (with a compute shader) but that's
going to burn memory b/w in the happy path where we have lots of memory
free.

> For GL +drivers, the UMD is in control of the context recreation, so
> it can easily +record the next buffer size to use.

I'm /really/ skeptical of this. Once we hit a device loss in GL, it's
game over, and I'm skeptical of any plan that expects userspace to
magically recover, especially as soon as side effects are introduced
(including transform feedback which is already gles3.0 required).
