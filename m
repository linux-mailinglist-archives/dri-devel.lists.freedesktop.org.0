Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D36A88111
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADAD10E5A4;
	Mon, 14 Apr 2025 13:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="RwkEBhad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2710E5A4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:04:15 +0000 (UTC)
Date: Mon, 14 Apr 2025 09:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744635841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=013VCEGBseMYx1I6gUwg2OHJ3SM8uQ36oc0kd7nu8zA=;
 b=RwkEBhadVRwvTMYA+H3LacAqX20Xj+RKODE+y5zgB12gS6WIYeHcgKkE85UXK9+IrXB7PQ
 yRjeHv0/XqE+QOrju8dTO1Q5Sc8wJnC3xJii+vkQ/YG1oMYNb+nyORF3sKq5vIF4lbI4eT
 LxBR6lRO/p4WpGaKC3GzroVzjLIiSx/5V5PnhmlF0mkD+xS/drEa6rivPdmk/86xzQbmsI
 U5g3sCHKuVr0CkaCUAh0VQAdtCCr1zqkVvVKGqXYShhUt5y6M9USB6QC9NPfRiUGLF5xQb
 xA0f4PQ1L+g0cY0ZfQDf+Flctpo9FRAQnh90nciIE8LT+3Vt4pcvJdBodT55MQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
Message-ID: <Z_0HuzvbMV3vybWe@blossom>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
 <20250414132206.728eacb3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414132206.728eacb3@collabora.com>
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

> Actually, CSF stands in the way of re-allocating memory to other
> contexts, because once we've allocated memory to a tiler heap, the FW
> manages this pool of chunks, and recycles them. Mesa can intercept
> the "returned chunks" and collect those chunks instead of re-assiging
> then to the tiler heap through a CS instruction (which goes thought
> the FW internallu), but that involves extra collaboration between the
> UMD, KMD and FW which we don't have at the moment. Not saying never,
> but I'd rather fix things gradually (first the blocking alloc in the
> fence-signalling path, then the optimization to share the extra mem
> reservation cost among contexts by returning the chunks to the global
> kernel pool rather than directly to the heap).
> 
> This approach should work fine with JM GPUs where the tiler heap is
> entirely managed by the KMD though.

I really think CSF should be relying on the simple heuristics with
incremental-rendering, unless you can prove that's actually a
performance issue in practice. (On Imagination/Apple parts, it almost
never is and we rely entirely on this approach. It's ok - it really is.
For simple 2D workloads, the initial heap allocation is fine. For 3D
scenes, we need very few frames to get the right size. this doesn't
cause stutters in practice.)

For JM .. yes, this discussion remains relevant of course.
