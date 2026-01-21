Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHWvNEPocGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:52:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F017E58C73
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559FE10E848;
	Wed, 21 Jan 2026 14:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QUA60o6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4545B10E84D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769007165;
 bh=N24Snn6yt4t5SMjnI8JX3TeVPoTDsDZd9NcANfm1Xd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QUA60o6TTPgYefJ2jdz4MWEQgmekbM6RrAGTEYToAcjCdm5kRbqMl/gFqYRdeqr1g
 4DKYuccD4ozRXC9j1HvV322/+GNZ8iWgWJqmB7AukB0GROJmUPzBlJJ60sDwFGhBz7
 mvI28yuZXwGwTHqS7hm69D4gwc7wMbdaV8p9nmbHE8GFFfsHuGly0l3BGAZBbB3qB3
 Y0GasVw2Hpyt0xq6YJsUhqSpbjxEcWKM9eA+dTb0+Wx+7sSQ7ZE+trbDC/506x0joN
 VbG8w6SYgmQo9MeVLsLzOM88wUlzc/TitWPyy2DL00/Dx4IEpagX9uT/5o5y7CSe1N
 8WUeEc9vI+yTA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9417A17E0182;
 Wed, 21 Jan 2026 15:52:44 +0100 (CET)
Date: Wed, 21 Jan 2026 15:52:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P
 Oommen <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260121155238.2a6c0274@fedora>
In-Reply-To: <714d2b72-67df-4590-9943-6289886c0a89@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <714d2b72-67df-4590-9943-6289886c0a89@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akash.goel@arm.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:url,arm.com:email]
X-Rspamd-Queue-Id: F017E58C73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 11:49:34 +0000
Akash Goel <akash.goel@arm.com> wrote:

> Hi Boris,
> 
> On 1/9/26 13:08, Boris Brezillon wrote:
> > From: Akash Goel <akash.goel@arm.com>
> > 
> > This implementation is losely based on the MSM shrinker, and it's
> > relying on the drm_gpuvm eviction/validation infrastructure.
> > 
> > Right now we only support swapout/eviction, but we could add an extra
> > flag to specify when buffer content doesn't need to be preserved to
> > avoid the swapout/swapin dance.
> > 
> > Locking is a bit of a nightmare, but using _trylock() all the way in
> > the reclaim path seems to make lockdep happy. And yes, we might be
> > missing opportunities to reclaim when the system is under heavy GPU
> > load/heavy memory pressure/heavy GPU VM activity, but that's better
> > than no reclaim at all.
> > 
> > Signed-off-by: Akash Goel <akash.goel@arm.com>
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_device.c |  11 +-
> >   drivers/gpu/drm/panthor/panthor_device.h |  73 ++++
> >   drivers/gpu/drm/panthor/panthor_gem.c    | 427 ++++++++++++++++++++++-
> >   drivers/gpu/drm/panthor/panthor_gem.h    |  67 ++++
> >   drivers/gpu/drm/panthor/panthor_mmu.c    | 338 +++++++++++++++++-
> >   drivers/gpu/drm/panthor/panthor_mmu.h    |   8 +
> >   6 files changed, 901 insertions(+), 23 deletions(-)
> >   
> 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index f35e52b9546a..bc348aa9634e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -14,6 +14,7 @@
> >   #include <linux/spinlock.h>
> >   
> >   #include <drm/drm_device.h>
> > +#include <drm/drm_gem.h>
> >   #include <drm/drm_mm.h>
> >   #include <drm/gpu_scheduler.h>
> >   #include <drm/panthor_drm.h>
> > @@ -157,6 +158,78 @@ struct panthor_device {
> >   	/** @devfreq: Device frequency scaling management data. */
> >   	struct panthor_devfreq *devfreq;
> >   
> >   
> > +static bool is_gpu_mapped(struct panthor_gem_object *bo,
> > +			  enum panthor_gem_reclaim_state *state)
> > +{
> > +	struct drm_gpuvm *vm = NULL;
> > +	struct drm_gpuvm_bo *vm_bo;
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +		if (!vm) {
> > +			*state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> > +			vm = vm_bo->vm;
> > +		} else if (vm != vm_bo->vm) {
> > +			*state = PANTHOR_GEM_GPU_MAPPED_SHARED;
> > +			break;
> > +		}
> > +	}
> > +
> > +	return !!vm;
> > +}
> > +
> > +static enum panthor_gem_reclaim_state
> > +panthor_gem_evaluate_reclaim_state_locked(struct panthor_gem_object *bo)
> > +{
> > +	enum panthor_gem_reclaim_state gpu_mapped_state;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +	lockdep_assert_held(&bo->base.gpuva.lock);
> > +
> > +	/* If pages have not been allocated, there's nothing to reclaim. */
> > +	if (!bo->backing.pages)
> > +		return PANTHOR_GEM_UNRECLAIMABLE;
> > +
> > +	/* If memory is pinned, we prevent reclaim. */
> > +	if (refcount_read(&bo->backing.pin_count))
> > +		return PANTHOR_GEM_UNRECLAIMABLE;
> > +
> > +	if (is_gpu_mapped(bo, &gpu_mapped_state))
> > +		return gpu_mapped_state;
> > +
> > +	if (refcount_read(&bo->cmap.mmap_count) && bo->backing.pages)
> > +		return PANTHOR_GEM_MMAPPED;
> > +
> > +	return PANTHOR_GEM_UNUSED;
> > +}
> > +
> > +void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
> > +					     enum panthor_gem_reclaim_state *old_statep)
> > +{
> > +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> > +	enum panthor_gem_reclaim_state old_state = bo->reclaim_state;
> > +	enum panthor_gem_reclaim_state new_state;
> > +	bool was_gpu_mapped, is_gpu_mapped;
> > +
> > +	if (old_statep)
> > +		*old_statep = old_state;
> > +
> > +	new_state = panthor_gem_evaluate_reclaim_state_locked(bo);
> > +	if (new_state == old_state)
> > +		return;
> > +
> > +	was_gpu_mapped = old_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
> > +			 old_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> > +	is_gpu_mapped = new_state == PANTHOR_GEM_GPU_MAPPED_SHARED ||
> > +			new_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE;
> > +
> > +	if (is_gpu_mapped && !was_gpu_mapped)
> > +		ptdev->reclaim.gpu_mapped_count += bo->base.size >> PAGE_SHIFT;
> > +	else if (!is_gpu_mapped && was_gpu_mapped)
> > +		ptdev->reclaim.gpu_mapped_count -= bo->base.size >> PAGE_SHIFT;
> > +
> > +	switch (new_state) {
> > +	case PANTHOR_GEM_UNUSED:
> > +		drm_gem_lru_move_tail(&ptdev->reclaim.unused, &bo->base);
> > +		break;
> > +	case PANTHOR_GEM_MMAPPED:
> > +		drm_gem_lru_move_tail(&ptdev->reclaim.mmapped, &bo->base);
> > +		break;
> > +	case PANTHOR_GEM_GPU_MAPPED_PRIVATE:
> > +		panthor_vm_update_bo_reclaim_lru_locked(bo);
> > +		break;
> > +	case PANTHOR_GEM_GPU_MAPPED_SHARED:
> > +		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
> > +		break;
> > +	case PANTHOR_GEM_UNRECLAIMABLE:
> > +		drm_gem_lru_remove(&bo->base);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	bo->reclaim_state = new_state;
> > +}
> > +
> >   static void
> >   panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
> >   {
> > @@ -153,8 +249,12 @@ static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
> >   		return 0;
> >   
> >   	ret = panthor_gem_backing_get_pages_locked(bo);
> > -	if (!ret)
> > +	if (!ret) {
> >   		refcount_set(&bo->backing.pin_count, 1);
> > +		mutex_lock(&bo->base.gpuva.lock);
> > +		panthor_gem_update_reclaim_state_locked(bo, NULL);
> > +		mutex_unlock(&bo->base.gpuva.lock);
> > +	}
> >   
> >   	return ret;
> >   }
> > @@ -167,8 +267,12 @@ static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
> >   	/* We don't release anything when pin_count drops to zero.
> >   	 * Pages stay there until an explicit cleanup is requested.
> >   	 */
> > -	if (!refcount_dec_not_one(&bo->backing.pin_count))
> > +	if (!refcount_dec_not_one(&bo->backing.pin_count)) {
> >   		refcount_set(&bo->backing.pin_count, 0);
> > +		mutex_lock(&bo->base.gpuva.lock);
> > +		panthor_gem_update_reclaim_state_locked(bo, NULL);
> > +		mutex_unlock(&bo->base.gpuva.lock);
> > +	}
> >   }
> >   
> >   static void
> > @@ -531,6 +635,49 @@ void panthor_gem_unpin(struct panthor_gem_object *bo)
> >   	dma_resv_unlock(bo->base.resv);
> >   }
> >   
> > +
> > +static void panthor_gem_evict_locked(struct panthor_gem_object *bo)
> > +{
> > +	dma_resv_assert_held(bo->base.resv);
> > +	lockdep_assert_held(&bo->base.gpuva.lock);
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
> > +		return;
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, refcount_read(&bo->backing.pin_count)))
> > +		return;
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
> > +		return;
> > +
> > +	panthor_gem_dev_map_cleanup(bo);
> > +	panthor_gem_backing_cleanup(bo);
> > +	panthor_gem_update_reclaim_state_locked(bo, NULL);
> > +}
> > +  
> 
> > +
> > +static bool should_wait(enum panthor_gem_reclaim_state reclaim_state)
> > +{
> > +	return reclaim_state == PANTHOR_GEM_GPU_MAPPED_PRIVATE ||
> > +	       reclaim_state == PANTHOR_GEM_GPU_MAPPED_SHARED;
> > +}
> > +
> > +bool panthor_gem_try_evict(struct drm_gem_object *obj,
> > +			   struct ww_acquire_ctx *ticket)
> > +{
> > +	/*
> > +	 * Track last locked entry for unwinding locks in error and
> > +	 * success paths
> > +	 */
> > +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> > +	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
> > +	enum panthor_gem_reclaim_state old_state;
> > +	int ret = 0;
> > +
> > +	/* To avoid potential lock ordering issue between bo_gpuva and
> > +	 * mapping->i_mmap_rwsem, unmap the pages from CPU side before
> > +	 * acquring the bo_gpuva lock. As the bo_resv lock is held, CPU
> > +	 * page fault handler won't be able to map in the pages whilst
> > +	 * eviction is in progress.
> > +	 */
> > +	drm_vma_node_unmap(&bo->base.vma_node, bo->base.dev->anon_inode->i_mapping);
> > +
> > +	/* We take this lock when walking the list to prevent
> > +	 * insertion/deletion.
> > +	 */
> > +	/* We can only trylock in that path, because
> > +	 * - allocation might happen while some of these locks are held
> > +	 * - lock ordering is different in other paths
> > +	 *     vm_resv -> bo_resv -> bo_gpuva
> > +	 *     vs
> > +	 *     bo_resv -> bo_gpuva -> vm_resv
> > +	 *
> > +	 * If we fail to lock that's fine, we back off and will get
> > +	 * back to it later.
> > +	 */
> > +	if (!mutex_trylock(&bo->base.gpuva.lock))
> > +		return false;
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > +		struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
> > +
> > +		if (resv == obj->resv)
> > +			continue;
> > +
> > +		if (!dma_resv_trylock(resv)) {
> > +			ret = -EDEADLK;
> > +			goto out_unlock;
> > +		}
> > +
> > +		last_locked = vm_bo;
> > +	}
> > +
> > +	/* Update the state before trying to evict the buffer, if the state was
> > +	 * updated to something that's harder to reclaim (higher value in the
> > +	 * enum), skip it (will be processed when the relevant LRU is).
> > +	 */
> > +	panthor_gem_update_reclaim_state_locked(bo, &old_state);
> > +	if (old_state < bo->reclaim_state) {
> > +		ret = -EAGAIN;
> > +		goto out_unlock;
> > +	}
> > +
> > +	/* Wait was too long, skip. */
> > +	if (should_wait(bo->reclaim_state) &&
> > +	    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false, 10) <= 0) {
> > +		ret = -ETIMEDOUT;
> > +		goto out_unlock;
> > +	}
> > +
> > +	/* Couldn't teardown the GPU mappings? Skip. */
> > +	ret = panthor_vm_evict_bo_mappings_locked(bo);
> > +	if (ret)
> > +		goto out_unlock;
> > +
> > +	/* If everything went fine, evict the object. */
> > +	panthor_gem_evict_locked(bo);
> > +
> > +out_unlock:
> > +	if (last_locked) {
> > +		drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > +			struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
> > +
> > +			if (resv == obj->resv)
> > +				continue;
> > +
> > +			dma_resv_unlock(resv);
> > +
> > +			if (last_locked == vm_bo)
> > +				break;
> > +		}
> > +	}
> > +	mutex_unlock(&bo->base.gpuva.lock);
> > +
> > +	return ret == 0;
> > +}  
> 
> 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 3290e0b5facb..ffd821b3be46 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0 or MIT
> >   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> >   /* Copyright 2023 Collabora ltd. */
> > +/* Copyright 2025 ARM Limited. All rights reserved. */
> >   
> >   #include <drm/drm_debugfs.h>
> >   #include <drm/drm_drv.h>
> > @@ -131,6 +132,9 @@ struct panthor_vma {
> >   	 * Only map related flags are accepted.
> >   	 */
> >   	u32 flags;
> > +
> > +	/** @evicted: True if the VMA has been evicted. */
> > +	bool evicted;
> >   };
> >   
> >   /**
> >   
> > +void panthor_vm_update_bo_reclaim_lru_locked(struct panthor_gem_object *bo)
> > +{
> > +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> > +	struct panthor_vm *vm = NULL;
> > +	struct drm_gpuvm_bo *vm_bo;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +	lockdep_assert_held(&bo->base.gpuva.lock);
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +		/* We're only supposed to have one vm_bo in the list if we get there. */
> > +		drm_WARN_ON(&ptdev->base, vm);
> > +		vm = container_of(vm_bo->vm, struct panthor_vm, base);
> > +
> > +		mutex_lock(&ptdev->reclaim.lock);
> > +		drm_gem_lru_move_tail_locked(&vm->reclaim.lru, &bo->base);
> > +		if (list_empty(&vm->reclaim.lru_node))
> > +			list_move(&vm->reclaim.lru_node, &ptdev->reclaim.vms);
> > +		mutex_unlock(&ptdev->reclaim.lock);
> > +	}
> > +}
> > +
> > +int panthor_vm_evict_bo_mappings_locked(struct panthor_gem_object *bo)
> > +{
> > +	struct drm_gpuvm_bo *vm_bo;
> > +
> > +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> > +		struct panthor_vm *vm = container_of(vm_bo->vm, struct panthor_vm, base);
> > +		struct drm_gpuva *va;
> > +
> > +		if (!mutex_trylock(&vm->op_lock))
> > +			return -EDEADLK;
> > +
> > +		drm_gpuvm_bo_evict(vm_bo, true);
> > +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> > +			struct panthor_vma *vma = container_of(va, struct panthor_vma, base);
> > +
> > +			panthor_vm_lock_region(vm, va->va.addr, va->va.range);
> > +			panthor_vm_unmap_pages(vm, va->va.addr, va->va.range);  
> 
> On further testing, I ran into a kernel warning issue.
> 
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/iommu/io-pgtable-arm.c#L641
> 
> https://elixir.bootlin.com/linux/v6.18-rc5/source/drivers/gpu/drm/panthor/panthor_mmu.c#L930
> 
> Call trace:
>   __arm_lpae_unmap+0x570/0x5c8 (P)
>   __arm_lpae_unmap+0x144/0x5c8
>   __arm_lpae_unmap+0x144/0x5c8
>   arm_lpae_unmap_pages+0xe8/0x120
>   panthor_vm_unmap_pages+0x1f0/0x3f8 [panthor]
>   panthor_vm_evict_bo_mappings_locked+0xf4/0x1d8 [panthor]
>   panthor_gem_try_evict+0x190/0x7c8 [panthor]
>   drm_gem_lru_scan+0x388/0x698
> 
> Following sequence leads to the kernel warnings.
> 
> - BO is mapped to GPU and is in GPU_MAPPED_PRIVATE state.
> 
> - Shrinker callback gets invoked and that BO is evicted. As a result BO 
> is moved to UNRECLAIMABLE state.
> 
> - Userspace accesses the evicted BO and panthor_gem_fault() gets the 
> backing pages again. BO is moved back to GPU_MAPPED_PRIVATE state (even 
> though technically the BO is still in evicted state, both vm_bo->evicted 
> and vma->evicted are TRUE.
> 
> - Shrinker callback is invoked again and tries to evict the same BO.
> 
> - panthor_vm_evict_bo_mappings_locked() calls panthor_vm_unmap_pages() 
> and the kernel warnings are emiited as PTEs are already invalid.

Yep, it looks like the other side of the problem pointed out by Steve:
CPU mappings can make the buffer reclaimable again, but those are still
evicted from the VM PoV.

> 
> 
> Made the following change locally to avoid the warning.
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c 
> b/drivers/gpu/drm/panthor/panthor_mmu.c
> index ffd821b3be46..e0a1dda1675f 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2344,6 +2344,8 @@ int panthor_vm_evict_bo_mappings_locked(struct 
> panthor_gem_object *bo)
>                  drm_gpuvm_bo_for_each_va(va, vm_bo) {
>                          struct panthor_vma *vma = container_of(va, 
> struct panthor_vma, base);
> 
> +                       if (vma->evicted)
> +                               continue;
>                          panthor_vm_lock_region(vm, va->va.addr, 
> va->va.range);
>                          panthor_vm_unmap_pages(vm, va->va.addr, 
> va->va.range);
>                          panthor_vm_unlock_region(vm);
> 
> 
> 
> Do you think we can also update is_gpu_mapped() so that an evicted BO 
> moves to MMAPPED state, instead of GPU_MAPPED_PRIVATE state, on CPU 
> access ?.
> 
> Not sure if the following change makes sense.
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c 
> b/drivers/gpu/drm/panthor/panthor_gem.c
> index 6e91c5022d0d..8a8411fed195 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -125,6 +125,8 @@ static bool is_gpu_mapped(struct panthor_gem_object *bo,
>          struct drm_gpuvm_bo *vm_bo;
> 
>          drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +               if (vm_bo->evicted)
> +                       continue;
>                  if (!vm) {
>                          *state = PANTHOR_GEM_GPU_MAPPED_PRIVATE;
>                          vm = vm_bo->vm;
> 
> 
> Please let me know.

Yep, this looks correct. I'll add that to my list of fixups.

Thanks,

Boris
