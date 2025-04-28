Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E5A9E89E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1198B10E1D8;
	Mon, 28 Apr 2025 06:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BunLmojY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A7510E1F3;
 Mon, 28 Apr 2025 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QE8DCSwcscmJrYhE5fqUCRzRLE3AEMMS/ax1OCdFi7A=; b=BunLmojYHNB3GOvpqihN5LoOY4
 +bpjrtskhwSeqqY53WK1Pxv8iEYZMYeD/gMkLSy7r93KHgDWUa1DaKab2lEfigKCCKXIeZ5R/vLa9
 r6A5uhWEhTbMpyWuAFER7GaGiuFmGNjvqq977Ti4jWv3BffqHeqsCmlNg4FET9brKQr6d30n11pFl
 1Hw+R0Ktqr5Anvqt7wn3ODKtzIbvE6Qlzc1KyR3vtrjxKJNlR5QuWg/0I0TdW7aoD0VrXOu4igTWd
 iVppKRoC4xiTrB8j1103jtZ/CFS9V7XJSKAc0EoSLqCE93IsWaciMhQ5G8A5zVFRxcJouKAwpyGlA
 +bsSrxGw==;
Received: from [159.147.214.238] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u9IOb-009ePp-Uy; Mon, 28 Apr 2025 08:55:17 +0200
Message-ID: <123343432f17913452ba9cbef6161837cc3c07d8.camel@igalia.com>
Subject: Re: [PATCH] drm/doc: Start documenting aspects specific to
 tile-based renderers
From: Iago Toral <itoral@igalia.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Christian Koenig <christian.koenig@amd.com>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Date: Mon, 28 Apr 2025 08:55:07 +0200
In-Reply-To: <20250418122524.410448-1-boris.brezillon@collabora.com>
References: <20250418122524.410448-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Hi,

Pitching in to describe the situation for v3d:

El vie, 18-04-2025 a las 14:25 +0200, Boris Brezillon escribi=C3=B3:

(...)
> +For all these reasons, the tiler usually allocates memory
> dynamically, but
> +DRM has not been designed with this use case in mind. Drivers will
> address
> +these problems differently based on the functionality provided by
> their
> +hardware, but all of them almost certainly have to deal with this
> somehow.
> +
> +The easy solution is to statically allocate a huge buffer to pick
> from when
> +tiler memory is needed, and fail the rendering when this buffer is
> depleted.
> +Some drivers try to be smarter to avoid reserving a lot of memory
> upfront.
> +Instead, they start with an almost empty buffer and progressively
> populate it
> +when the GPU faults on an address sitting in the tiler buffer range.
> This
> +works okay most of the time but it falls short when the system is
> under
> +memory pressure, because the memory request is not guaranteed to be
> satisfied.
> +In that case, the driver either fails the rendering, or, if the
> hardware
> +allows it, it tries to flush the primitives that have been processed
> and
> +triggers a fragment job that will consume those primitives and free
> up some
> +memory to be recycled and make further progress on the tiling step.
> This is
> +usually referred as partial/incremental rendering (it might have
> other names).

In our case, user space allocates some memory up front hoping to avoid
running out of memory during tiling, but if the tiler does run out of
memory we get an interrupt and the tiler hw will stop and wait for the
kernel driver to write back an address where more memory is made
available (via register write), which we will try to allocate at that
point. This can happen any number of times until the tiler job
completes

I am not sure that we are handling allocation failure on this path=20
nicely at the moment since we don't try to fail and cancel the job,
that's maybe something we should fix, although I don't personally
recall any reports of us running into this situation either.


> +
> +Compute based emulation of geometry stages
> +------------------------------------------
> +
> +More and more hardware vendors don't bother providing hardware
> support for
> +geometry/tesselation/mesh stages, since those can be emulated with
> compute
> +shaders. But the same problem we have with tiler memory exists with
> those
> +intermediate compute-emulated stages, because transient data shared
> between
> +stages need to be stored in memory for the next stage to consume,
> and this
> +bubbles up until the tiling stage is reached, because ultimately,
> what the
> +tiling stage will need to process is a set of vertices it can turn
> into
> +primitives, like would happen if the application had emulated the
> geometry,
> +tesselation or mesh stages with compute.
> +
> +Unlike tiling, where the hardware can provide a fallback to recycle
> memory,
> +there is no way the intermediate primitives can be flushed up to the
> framebuffer,
> +because it's a purely software emulation here. This being said, the
> same
> +"start small, grow on-demand" can be applied to avoid over-
> allocating memory
> +upfront.

FWIW, v3d has geometry and tessellation hardware.


> +
> +On-demand memory allocation
> +---------------------------
> +
> +As explained in previous sections, on-demand allocation is a central
> piece
> +of tile-based renderer if we don't want to over-allocate, which is
> bad for
> +integrated GPUs who share their memory with the rest of the system.
> +
> +The problem with on-demand allocation is that suddenly, GPU accesses
> can
> +fail on OOM, and the DRM components (drm_gpu_scheduler and drm_gem
> mostly)
> +were not designed for that. Those are assuming that buffers memory
> is
> +populated at job submission time, and will stay around for the job
> lifetime.
> +If a GPU fault happens, it's the user fault, and the context can be
> flagged
> +unusable. On-demand allocation is usually implemented as allocation-
> on-fault,
> +and the dma_fence contract prevents us from blocking on allocations
> in that
> +path (GPU fault handlers are in the dma-fence signalling path).

As I described above, v3d is not quite an allocation-on-fault mechanism
but rather, we get a dedicated interrupt from the hw when it needs more
memory, which I believe happens a bit before it completely runs out of
memory actually. Maybe that changes the picture since we don't exactly
use a fault handler?

Iago
