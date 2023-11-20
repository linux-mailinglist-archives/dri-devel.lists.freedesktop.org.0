Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883057F11CA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 12:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C89810E39C;
	Mon, 20 Nov 2023 11:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8F10E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 11:19:48 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BEA596602F20;
 Mon, 20 Nov 2023 11:19:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700479186;
 bh=9Gwt+Qw+/yGw48nLIGTTalAMKfLuy5O3oivlggeeOJc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WKW8Ft04Mf+mcif9h+B4Gbv7Uv1AnLixSwzYD400y1F9obOi4Cjy4mwF5bbTtRVMG
 LSkNVjwKcBAOjA+YTEv57Y8yHAbfSUAuOXNxDPdMMrmfKNcxEAks/mSiXO7HRocI0l
 uclMX9uo8I4qR3VFGwrkxXdPaW4Vqc404FxlWOBLZoMhCiD9wWxmvvfFobDlOhKzQG
 V6VmLfpEo9LmSpUnniS8zzMNilnX0J9CXXhRtVZiQcJXpG2fWiJMWO1ac3fglBCJ8n
 f47mDePdZ+xgN0lJnnZJRDGxtLSx9KdTtxipKdu1Uyx8/pXQJCo5HbSAgyTibvPL6I
 IatXnRx2n+4Rg==
Date: Mon, 20 Nov 2023 12:19:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 11/26] drm/shmem-helper: Prepare
 drm_gem_shmem_free() to shrinker addition
Message-ID: <20231120121942.4eef9e03@collabora.com>
In-Reply-To: <bd2308d6-38e5-6042-3da8-fb436f67a88e@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-12-dmitry.osipenko@collabora.com>
 <20231110111601.5d6bd1ab@collabora.com>
 <bd2308d6-38e5-6042-3da8-fb436f67a88e@collabora.com>
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

On Mon, 20 Nov 2023 14:02:29 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 11/10/23 13:16, Boris Brezillon wrote:
> > On Mon, 30 Oct 2023 02:01:50 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> Prepare drm_gem_shmem_free() to addition of memory shrinker support
> >> to drm-shmem by adding and using variant of put_pages() that doesn't
> >> touch reservation lock. Reservation shouldn't be touched because lockdep
> >> will trigger a bogus warning about locking contention with fs_reclaim
> >> code paths that can't happen during the time when GEM is freed and
> >> lockdep doesn't know about that.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 35 +++++++++++++-------------
> >>  1 file changed, 18 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index 08b5a57c59d8..24ff2b99e75b 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -128,6 +128,22 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
> >>  }
> >>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> >>  
> >> +static void
> >> +drm_gem_shmem_free_pages(struct drm_gem_shmem_object *shmem)
> >> +{
> >> +	struct drm_gem_object *obj = &shmem->base;
> >> +
> >> +#ifdef CONFIG_X86
> >> +	if (shmem->map_wc)
> >> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> >> +#endif
> >> +
> >> +	drm_gem_put_pages(obj, shmem->pages,
> >> +			  shmem->pages_mark_dirty_on_put,
> >> +			  shmem->pages_mark_accessed_on_put);
> >> +	shmem->pages = NULL;
> >> +}
> >> +
> >>  /**
> >>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
> >>   * @shmem: shmem GEM object to free
> >> @@ -142,8 +158,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  	if (obj->import_attach) {
> >>  		drm_prime_gem_destroy(obj, shmem->sgt);
> >>  	} else {
> >> -		dma_resv_lock(shmem->base.resv, NULL);
> >> -
> >>  		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
> >>  
> >>  		if (shmem->sgt) {
> >> @@ -157,8 +171,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>    
> > If you drop the dma_resv_lock/unlock(), you should also replace the
> > drm_gem_shmem_put_pages_locked() by a drm_gem_shmem_free_pages() in this
> > commit.  
> 
> drm_gem_shmem_put_pages_locked() is exported by a later patch of this
> series, it's not worthwhile to remove this function

I'm not talking about removing drm_gem_shmem_put_pages_locked(), but
replacing the drm_gem_shmem_put_pages_locked() call you have in
drm_gem_shmem_free() by a drm_gem_shmem_free_pages(), so you don't end
up with a lockdep warning when you stop exactly here in the patch
series, which is important if we want to keep things bisectable.
