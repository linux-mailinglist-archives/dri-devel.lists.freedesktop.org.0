Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C200E760D0B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 10:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D9D10E3C1;
	Tue, 25 Jul 2023 08:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A610E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 08:32:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A006D6607108;
 Tue, 25 Jul 2023 09:32:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690273957;
 bh=fYsygSwR3iu7mxcj3ju5lzqiPYT3fINyEw+FYMQafkA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SqAm7vrvN+PEUv3NXhBV9qAufLRUwnMHxPkR/zPcTMYTi0rDj+BGxjPkT24pvyvNq
 86yrtnkmqodrtGKOry1iRuEckcwqkOT++jVk/FWwLbV3AD7oC4Owqe4J/A/dWrj5YT
 Uo7UiSA1pZd0uimOcLxrL8v5KoOyuXyvsEAA0S0AbXO/ayh5C1ZRl8kcqItBSeovvq
 wsAeWSoQJEB9RI1l1eKt4Z0DppvttCI7hqV6DKTCdKfLKQ09WVzQHC3sSPxqGoKBhF
 8PjVIWuwgHqY8o9TYeTfK7SFFhGj4KvpTFgK6LvtLmffobWFFfEQ7IaYkJi22+ta9D
 32iOWIcFyfODA==
Date: Tue, 25 Jul 2023 10:32:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 02/12] drm/shmem-helper: Add pages_pin_count field
Message-ID: <20230725103234.0c8923f1@collabora.com>
In-Reply-To: <20230725092709.51356f39@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-3-dmitry.osipenko@collabora.com>
 <20230725092709.51356f39@collabora.com>
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

On Tue, 25 Jul 2023 09:27:09 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Sun, 23 Jul 2023 02:47:36 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
> > And new pages_pin_count field to struct drm_gem_shmem_object that will
> > determine whether pages are evictable by memory shrinker. The pages will
> > be evictable only when pages_pin_count=0. This patch prepares code for
> > addition of the memory shrinker that will utilize the new field.
> > 
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 9 +++++++++
> >  include/drm/drm_gem_shmem_helper.h     | 9 +++++++++
> >  2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 267153853e2c..42ba201dda50 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -274,15 +274,24 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
> >  	dma_resv_assert_held(shmem->base.resv);
> >  
> >  	ret = drm_gem_shmem_get_pages(shmem);
> > +	if (!ret)
> > +		shmem->pages_pin_count++;
> >  
> >  	return ret;
> >  }
> >  
> >  static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> >  {
> > +	struct drm_gem_object *obj = &shmem->base;
> > +
> >  	dma_resv_assert_held(shmem->base.resv);
> >  
> > +	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_pin_count))
> > +		return;
> > +
> >  	drm_gem_shmem_put_pages(shmem);
> > +
> > +	shmem->pages_pin_count--;
> >  }
> >  
> >  /**
> > diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> > index bf0c31aa8fbe..7111f5743006 100644
> > --- a/include/drm/drm_gem_shmem_helper.h
> > +++ b/include/drm/drm_gem_shmem_helper.h
> > @@ -39,6 +39,15 @@ struct drm_gem_shmem_object {
> >  	 */
> >  	unsigned int pages_use_count;
> >  
> > +	/**
> > +	 * @pages_pin_count:
> > +	 *
> > +	 * Reference count on the pinned pages table.
> > +	 * The pages allowed to be evicted by memory shrinker
> > +	 * only when the count is zero.
> > +	 */
> > +	unsigned int pages_pin_count;  
> 
> Can we make it an atomic_t, so we can avoid taking the lock when the
> GEM has already been pinned. That's something I need to be able to grab
> a pin-ref in a path where the GEM resv lock is already held[1]. We could
> of course expose the locked version,

My bad, that's actually not true. The problem is not that I call
drm_gem_shmem_pin() with the resv lock already held, but that I call
drm_gem_shmem_pin() in a dma-signaling path where I'm not allowed to
take a resv lock. I know for sure pin_count > 0, because all GEM objects
mapped to a VM have their memory pinned right now, and this should
stand until we decide to add support for live-GEM eviction, at which
point we'll probably have a way to detect when a GEM is evicted, and
avoid calling drm_gem_shmem_pin() on it.

TLDR; I can't trade the atomic_t for a drm_gem_shmem_pin_locked(),
because that wouldn't solve my problem. The other solution would be to
add an atomic_t at the driver-GEM level, and only call
drm_gem_shmem_[un]pin() on 0 <-> 1 transitions, but I thought using an
atomic at the GEM-shmem level, to avoid locking when we can, would be
beneficial to the rest of the eco-system. Let me know if that's not an
option, and I'll go back to the driver-specific atomic_t.

> but in my case, I want to enforce
> the fact the GEM has been pinned before the drm_gem_shmem_pin() call in
> the section protected by the resv lock, so catching a "refcount 0 -> 1"
> situation would be useful. Beside, using an atomic to avoid the
> lock/unlock dance when refcount > 1 might be beneficial to everyone.
> 
> [1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/4420fa0d5768ebdc35b34d58d4ae5fad9fbb93f9
> 
> > +
> >  	/**
> >  	 * @madv: State for madvise
> >  	 *  
> 

