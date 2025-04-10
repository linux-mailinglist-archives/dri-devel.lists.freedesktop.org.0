Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B08A84BC1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 20:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF9D10E14B;
	Thu, 10 Apr 2025 18:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="qQJCrNXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF59210E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 18:01:18 +0000 (UTC)
Date: Thu, 10 Apr 2025 14:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744308075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoviVuI0h3lNdEsuykhD4ZWFcIm9PVbHbSa+aNX4IIA=;
 b=qQJCrNXJ0kczHJduW8KOskelx2AV3wziwuJdcBzfNNLeBweMhOqWYGpodLbbMiuHPtMEk9
 fERId0AiteE3kiy9IgkQpeBMB9X5VkNxotikbqNmgSiH6ocUGgSfAczooPqZVA5UUxJxak
 qpykq00Wjqt9/drOYk66TqNeR8jHKPcIrcNe0FNFuEeR0vA1tZbEoxGONxmXLUlraJ2SXW
 ddeyyCXdRVe7X8ukLO/zBJBwnR3ZoXeNTa6D5QkuPozE8NvsI3Nhw2ZNiUSVyxuGiODWp+
 V+IUq1zdIOqjoqtCahfQgpzQuKa2E+EDYH8CQhton67Uv5EyzFEzI3KsEC5Tug==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 kernel@collabora.com, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <Z_gHX5AqQkhbXOjd@blossom>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410192054.24a592a5@collabora.com>
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

> > > In Panfrost and Lima, we don't have this concept of "incremental
> > > rendering", so when we fail the allocation, we just fail the GPU job
> > > with an unhandled GPU fault.  
> > 
> > To be honest I think that this is enough to mark those two drivers as
> > broken.  It's documented that this approach is a no-go for upstream
> > drivers.
> > 
> > How widely is that used?
> 
> It exists in lima and panfrost, and I wouldn't be surprised if a similar
> mechanism was used in other drivers for tiler-based GPUs (etnaviv,
> freedreno, powervr, ...), because ultimately that's how tilers work:
> the amount of memory needed to store per-tile primitives (and metadata)
> depends on what the geometry pipeline feeds the tiler with, and that
> can't be predicted. If you over-provision, that's memory the system won't
> be able to use while rendering takes place, even though only a small
> portion might actually be used by the GPU. If your allocation is too
> small, it will either trigger a GPU fault (for HW not supporting an
> "incremental rendering" mode) or under-perform (because flushing
> primitives has a huge cost on tilers).

Yes and no.

Although we can't allocate more memory for /this/ frame, we know the
required size is probably constant across its lifetime. That gives a
simple heuristic to manage the tiler heap efficiently without
allocations - even fallible ones - in the fence signal path:

* Start with a small fixed size tiler heap
* Try to render, let incremental rendering kick in when it's too small.
* When cleaning up the job, check if we used incremental rendering.
* If we did - double the size of the heap the next time we submit work.

The tiler heap still grows dynamically - it just does so over the span
of a couple frames. In practice that means a tiny hit to startup time as
we dynamically figure out the right size, incurring extra flushing at
the start, without needing any "grow-on-page-fault" heroics.

This should solve the problem completely for CSF/panthor. So it's only
hardware that architecturally cannot do incremental rendering (older
Mali: panfrost/lima) where we need this mess.
