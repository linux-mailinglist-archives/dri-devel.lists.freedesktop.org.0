Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7B855066
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 18:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A71610E4FD;
	Wed, 14 Feb 2024 17:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ze/yCpcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EE410E4FD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707932022;
 bh=i0FUp+GiwyJKrR5UQ+BmdgMqs4ue1B/A9hkZbtoD1YE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ze/yCpcnAq+aVkqR2QLb9G9sNlZrMZhf0g/m0oe7VZhqP4lsAuAotR6nC4zpeInfG
 hNB610YvsZ7gGtBak1h99/Y/L8arlAXgSEPKOiz/YEa9z/lEoB39ggr2D4ZMRTAwFO
 js+QvU2+77mq++YxSsLvqLgbk8wlHToTxgXt+8kcddY5axeDzbtoivfhn1+Wgnl45T
 pLQEDu32nTBBtWYXmMFrzcu0F5bjaGQYKyFxK0LnvJCElVoSy3V39LoVOetqhsAFHG
 ks8DpVfzXJ41FWqkomSUbUf+a1zVFN4IS4q1c9fVQJ2saclut/ci9B7cjvw4oL7rYP
 Kb5OzhmBEd87A==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 67E643781FEF;
 Wed, 14 Feb 2024 17:33:41 +0000 (UTC)
Date: Wed, 14 Feb 2024 18:33:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Robin Murphy
 <robin.murphy@arm.com>, kernel@collabora.com, Heiko Stuebner
 <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v4 09/14] drm/panthor: Add the heap logical block
Message-ID: <20240214183339.1f690c9d@collabora.com>
In-Reply-To: <e43ec7bb-1104-40b4-a031-3b6fa7be1eb4@arm.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <20240122163047.1954733-10-boris.brezillon@collabora.com>
 <e43ec7bb-1104-40b4-a031-3b6fa7be1eb4@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 12 Feb 2024 11:40:55 +0000
Steven Price <steven.price@arm.com> wrote:

> On 22/01/2024 16:30, Boris Brezillon wrote:
> > Tiler heap growing requires some kernel driver involvement: when the
> > tiler runs out of heap memory, it will raise an exception which is
> > either directly handled by the firmware if some free heap chunks are
> > available in the heap context, or passed back to the kernel otherwise.
> > The heap helpers will be used by the scheduler logic to allocate more
> > heap chunks to a heap context, when such a situation happens.
> > 
> > Heap context creation is explicitly requested by userspace (using
> > the TILER_HEAP_CREATE ioctl), and the returned context is attached to a
> > queue through some command stream instruction.
> > 
> > All the kernel does is keep the list of heap chunks allocated to a
> > context, so they can be freed when TILER_HEAP_DESTROY is called, or
> > extended when the FW requests a new chunk.
> > 
> > v4:
> > - Rework locking to allow concurrent calls to panthor_heap_grow()
> > - Add a helper to return a heap chunk if we couldn't pass it to the
> >   FW because the group was scheduled out
> > 
> > v3:
> > - Add a FIXME for the heap OOM deadlock
> > - Use the panthor_kernel_bo abstraction for the heap context and heap
> >   chunks
> > - Drop the panthor_heap_gpu_ctx struct as it is opaque to the driver
> > - Ensure that the heap context is aligned to the GPU cache line size
> > - Minor code tidy ups
> > 
> > Co-developed-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> It looks fine, but there's a confusing FIXME comment:
> 
> > +	/* FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation, which
> > +	 * relies on blocking allocations (both for the BO itself, and backing
> > +	 * memory), which might cause a deadlock because we're called from a context
> > +	 * where we hold the panthor scheduler lock, thus preventing job cleanups
> > +	 * that could free up some memory. The jobs themselves will timeout, but
> > +	 * we'll still be blocked there. The only solution here is to implement
> > +	 * something similar to shmem_sg_alloc_table() in i915, so we can do
> > +	 * non-blocking allocations, and just kill the job when we run out-of-memory
> > +	 * for the tiler context.
> > +	 */  
> 
> Whereas at the call site (group_process_tiler_oom()) there's the comment:
> 
> > 		/* We do the allocation without holding the scheduler lock to avoid
> > 		 * blocking the scheduling.
> > 		 */  
> 
> AFAICT that FIXME comment can just be deleted now. Assuming you agree
> then with that change:

The FIXME is no longer accurate indeed, but I'd like to keep a FIXME
here to reflect the fact the solution we have is not the one we want, as
it prevents the GPU from immediately falling back to the user provided
OOM exception handler, or killing the job if there's no way it can
reclaim tiler memory.

How about:

FIXME: panthor_alloc_heap_chunk() triggers a kernel BO creation, which
goes through the blocking allocation path. Ultimately, we want
a non-blocking allocation, so we can immediately report to the FW when
the system is running out of memory. In that case, the FW can call a
user-provided exception handler, which might try to free some tiler
memory by issuing an intermediate fragment job. If the exception handler
can't do anything, it will flag the queue as faulty so the job that
triggered this tiler chunk allocation and all further jobs in this
queue fail immediately instead of having to wait for the job
timeout.

> 
> Reviewed-by: Steven Price <steven.price@arm.com>
