Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DB7AE6F4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258B010E35B;
	Tue, 26 Sep 2023 07:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3810E35B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:35:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CEAD6607314;
 Tue, 26 Sep 2023 08:35:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695713720;
 bh=ab+8nbg2PMrVtNGAFD8Asd2z04FE9VRGE9dAy3ZJWiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EI4lEbMsblThRUsetRRTEVZS6rHCA3vJIXb1uCRxHLX79NVHdT/02VtREn6TgfRDy
 Fxp7/8tj66psqFO3hANj0kQICCl2dWRebmmjMEhuBRg3LCIkIRK7hf35x3MA+Wltpt
 zVPYZ4sxgJ5/Bi8EFVCwVXE4VB1lCxqi/2r/7xIb9OG1jkLwsoFR/9l1I5YLa41Jts
 uoF21hLGsi0ieIcb6BffTw8yFwBi84WlRE1YxG252ayEMNY29+aU0Br2bA3n9SRPJC
 ht6ras1sy5Q0PMAtFkNlnkD3jmCTA5djdeTl1z74L6CVqOC7cRbZo+WtUH25YWIlr6
 6QH8jTeAROGcQ==
Date: Tue, 26 Sep 2023 09:35:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
Message-ID: <20230926093517.11a172ad@collabora.com>
In-Reply-To: <454c464e-4534-7ec3-6d38-49b7df83c7be@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
 <454c464e-4534-7ec3-6d38-49b7df83c7be@collabora.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sep 2023 03:30:35 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 9/15/23 11:46, Boris Brezillon wrote:
> > The naming becomes quite confusing, with drm_gem_shmem_unpin_locked()
> > and drm_gem_shmem_unpin_pages_locked(). By the look of it, it seems to
> > do exactly the opposite of drm_gem_shmem_swapin_locked(), except for
> > the missing ->evicted = true, which we can move here anyway, given
> > drm_gem_shmem_purge_locked() explicitly set it to false anyway. The
> > other thing that's missing is the
> > drm_gem_shmem_update_pages_state_locked(), but it can also be moved
> > there I think, if the the ->madv update happens before the
> > drm_gem_shmem_unpin_pages_locked() call in
> > drm_gem_shmem_purge_locked().
> > 
> > So, how about renaming this function drm_gem_shmem_swapout_locked()?  
> 
> The swapout name would be misleading to me because pages aren't moved to
> swap, but allowed to be moved. I'll rename it to
> drm_gem_shmem_shrinker_unpin_locked().

If you go this way, I would argue that drm_gem_shmem_swapin_locked() is
just as incorrect as drm_gem_shmem_swapout_locked(), in that
drm_gem_get_pages() might just return pages that were flagged
reclaimable but never reclaimed/swapped-out. I do think that having
some symmetry in the naming makes more sense than being 100% accurate.

> 
> >>  {
> >>  	struct drm_gem_object *obj = &shmem->base;
> >>  	struct drm_device *dev = obj->dev;
> >>  
> >>  	dma_resv_assert_held(shmem->base.resv);
> >>  
> >> -	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
> >> +	if (shmem->evicted)
> >> +		return;
> >>  
> >>  	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);  
> > Are we sure we'll always have sgt != NULL? IIRC, if the GEM is only
> > mmap-ed in userspace, get_sgt() is not necessarily called by the driver
> > (needed to map in GPU space), and we have a potential NULL deref here.
> > Maybe that changed at some point in the series, and sgt is
> > unconditionally populated when get_pages() is called now.  
> 
> The sgt is always set in this function because it's part of shrinker and
> shrinker doesn't touch GEMs without sgt.

Okay, that's questionable. Why would we not want to reclaim BOs that
are only mapped in userspace (sgt == NULL && pages_use_count > 0 &&
pages_pin_count == 0)? I agree that creating such a BO would be
pointless (why create a buffer through DRM if it's not passed to the
GPU), but that's still something the API allows...

> 
> >> +	__drm_gem_shmem_release_pages(shmem);  
> > Make sure you drop the implicit pages_use_count ref the sgt had, this
> > way you can still tie the necessity to drop the pages to sgt != NULL in
> > drm_gem_shmem_free().  
> 
> This will require further refcnt re-initialization when pages are
> restored if it's dropped to zero. I don't see how this will improve
> anything.

Sorry to disagree, but I do think it matters to have a clear ownership
model, and if I look at the code (drm_gem_shmem_get_pages_sgt_locked()),
the sgt clearly owns a reference to the pages it points to.
