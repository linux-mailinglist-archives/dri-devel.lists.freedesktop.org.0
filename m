Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3A7697C0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9594810E295;
	Mon, 31 Jul 2023 13:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0110E295
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:35:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D19F6606FD9;
 Mon, 31 Jul 2023 14:35:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690810555;
 bh=fSMcySe3529Rsza7CghbwZLPVsnFpOjB0fUjYOJUHGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i7az6YSJdry61SaWB5mqcppW5hGRzeUPF9Re/v1j9Avn7QlKeLq5MHKbtRcJIq5+3
 sjo7ztfFOogRmqdGysyz5Frj12axf9fvX9fOsMvfXczYHurrdEjZRupvIrS+dGNT8N
 +gFYn5M0QQwPAS0MfH9vJJXHeRJMCEjOw8TW/CTbR+kpPTRrFtBZhtqmiKhtTWziQx
 j10sOIgvuwQQhxy0KLEUqKTRXdi8LpV2wa4f94kNxymP7D1seI7ZFSuLyb4SQkj8cw
 z/sJoowlMRAbs+1wfzb4cs82ZUcZrtlw5SHwNHL83RTeIkUoUORn6Y+ltOam5Ekz1I
 8Tv/fBVRIINqQ==
Date: Mon, 31 Jul 2023 15:35:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 02/12] drm/shmem-helper: Add pages_pin_count field
Message-ID: <20230731153551.7365daa4@collabora.com>
In-Reply-To: <4c5fa735-9bfd-f92a-8deb-888c7368f89e@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-3-dmitry.osipenko@collabora.com>
 <20230725092709.51356f39@collabora.com>
 <20230725103234.0c8923f1@collabora.com>
 <4c5fa735-9bfd-f92a-8deb-888c7368f89e@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Danilo Krummrich <dakr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Danilo, to confirm my understanding of the gpuva remap operation is
correct.

On Mon, 31 Jul 2023 15:27:31 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 7/25/23 11:32, Boris Brezillon wrote:
> >> Can we make it an atomic_t, so we can avoid taking the lock when the
> >> GEM has already been pinned. That's something I need to be able to grab
> >> a pin-ref in a path where the GEM resv lock is already held[1]. We could
> >> of course expose the locked version,  
> > My bad, that's actually not true. The problem is not that I call
> > drm_gem_shmem_pin() with the resv lock already held, but that I call
> > drm_gem_shmem_pin() in a dma-signaling path where I'm not allowed to
> > take a resv lock. I know for sure pin_count > 0, because all GEM objects
> > mapped to a VM have their memory pinned right now, and this should
> > stand until we decide to add support for live-GEM eviction, at which
> > point we'll probably have a way to detect when a GEM is evicted, and
> > avoid calling drm_gem_shmem_pin() on it.
> > 
> > TLDR; I can't trade the atomic_t for a drm_gem_shmem_pin_locked(),
> > because that wouldn't solve my problem. The other solution would be to
> > add an atomic_t at the driver-GEM level, and only call
> > drm_gem_shmem_[un]pin() on 0 <-> 1 transitions, but I thought using an
> > atomic at the GEM-shmem level, to avoid locking when we can, would be
> > beneficial to the rest of the eco-system. Let me know if that's not an
> > option, and I'll go back to the driver-specific atomic_t.  
> 
> Could you please explain why do you need to pin GEM in a signal handler?
> This is not something drivers usually do or need to do. You likely also
> shouldn't need to detect that GEM is evicted in yours driver. I'd expect
> that Panthor shouldn't differ from Panfrost in regards to how GEM memory
> management is done and Panfrost doesn't need to do anything special.

Panthor VM management is completely different, and the case I'm
referring to is 'asynchronous VM_BIND': mapping a GEM object to a GPU VM
asynchronously, so we can make it depend on other operations, encoded as
syncobjs passed to the VM_BIND operation.

Here is the workflow we have for this use case:

1. Create + push a VM_BIND job to the VM_BIND queue (a drm_sched_entity
that's taking care of asynchronous VM map/unmap operations). Because
this operation is asynchronous, and the execution itself happens in a
dma-signaling path (drm_sched::run_job()), we need to pre-allocate the
MMU page tables for the worst case scenario, and make sure the GEM pages
are pinned at job creation time.

2. The VM operation itself is executed when all dependencies are met
(drm_sched calls run_job()). In case of a map operation, we call
drm_gpuva_sm_map(), which might split the map operation into
remap+unamp+map ones if the region being mapped is covering a region
that was previously mapped to a different GEM object or a different
portion of the same GEM object (see the gpuva_mgr doc [1]). A
remap operation is just a way to split an existing mapping in 2 mappings
covering the left/right side of the previous mapping, plus a hole in
the middle. This means that our VM mapping object (drm_gpuva), which
was pointing to a GEM object that had its pages pinned, is now turned
into 2 mapping objects, and we need to make sure those 2 mappings own a
reference to the pages, otherwise we'll have an unbalanced refcount
when we release those 2 mappings further down the road.

3. Release resources attached to mappings that were removed (that
includes releasing the ref we had on GEM pages) and free the mapping
objects. We do that asynchronously, outside of the dma-signaling path.

> 
> Note that patch #14 makes locked pin/unpin functions public and turns
> the unlocked variants into helpers, you'll be able to experiment with
> these funcs in the Panthor driver.

Unfortunately, those won't help. I really need a way to increment the
refcount without holding the lock, because we're in a dma-signaling
path when we call drm_gpuva_sm_map(). Note that I could live with a
drm_shmem_gem_pin_if_already_pinned() variant that would return NULL if
pin_count == 0 instead of trying to acquire the lock, but I'd still
need this refcount to be an atomic_t.

As I said, an alternative to this approach would be to have a separate
atomic refcount at the panthor_gem_object level, but I feel like we'd
just be duplicating something that exists already.

[1]https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuva_mgr.c#n67
