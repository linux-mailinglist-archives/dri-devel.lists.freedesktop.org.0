Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D573E31C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E510E228;
	Mon, 26 Jun 2023 15:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C77210E22F;
 Mon, 26 Jun 2023 15:21:54 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EACBC6607022;
 Mon, 26 Jun 2023 16:21:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687792912;
 bh=y9dE/H6+9X5B+ppGc3ep9xV5ibIvLd2Z5FCJbnQv1Lw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GzzsfEgFImqqvNgm7qsk1QLqfVKJCwfm+bCVEfHsux3lfyLrhxTovJ2J86HGsR2jI
 Sax2GGhIOjN+woowsS4gKrtj4pjPqrBVsf1wpdogUYl+6JVtnVxg1JPBPmNZvlAWxF
 YOCoJNVQwXlgSziFuzqAxhY5gPkfmjwFz8k2FBLJr9dfIpIr4LVF9Qi/b9NqEgXlNQ
 bw+76l2hpOAexorE+ALlzxa8Ncp0OWwG3xPNxSLP/NhAbjM+FtFSsyh32yweJOdNP+
 v/ozEvIEvXAsScM2q5PZ0U/VEqWu5W7SKbtz4vlQh+S9SM0AE/EavxhiYM7YPdIpcW
 FiN4lpJ9tdKGA==
Date: Mon, 26 Jun 2023 17:21:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v13 03/10] drm/shmem-helper: Add pages_pin_count field
Message-ID: <20230626172148.706a2534@collabora.com>
In-Reply-To: <20230626170420.45826ac7@collabora.com>
References: <20230314022659.1816246-1-dmitry.osipenko@collabora.com>
 <20230314022659.1816246-4-dmitry.osipenko@collabora.com>
 <20230626170420.45826ac7@collabora.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jun 2023 17:04:57 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hi Dmitry,
> 
> Sorry for chiming in only now :-/.
> 
> On Tue, 14 Mar 2023 05:26:52 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
> > And new pages_pin_count field to struct drm_gem_shmem_object that will
> > determine whether pages are evictable by memory shrinker. The pages will
> > be evictable only when pages_pin_count=0. This patch prepares code for
> > addition of the memory shrinker that will utilize the new field.
> > 
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++++
> >  include/drm/drm_gem_shmem_helper.h     | 9 +++++++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 4da9c9c39b9a..81d61791f874 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -277,6 +277,8 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
> >  	drm_WARN_ON(obj->dev, obj->import_attach);
> >  
> >  	ret = drm_gem_shmem_get_pages(shmem);
> > +	if (!ret)
> > +		shmem->pages_pin_count++;
> >  
> >  	return ret;
> >  }
> > @@ -289,7 +291,12 @@ static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> >  
> >  	drm_WARN_ON(obj->dev, obj->import_attach);
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
> > index 20ddcd799df9..7d823c9fc480 100644
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
> s/pages_pin_count/pin_count/ ?
> 
> And do we really need both pages_pin_count and pages_use_count. Looks
> like they both serve the same purpose, with one exception:
> pages_use_count is also incremented in the get_pages_sgt_locked() path,
> but you probably don't want it to prevent GEM eviction. Assuming
> your goal with this pin_count field is to check if a GEM object is
> evictable, it can be done with something like
> 
> bool
> drm_gem_shmem_is_evictable_locked(struct drm_gem_shmem_object *shmem)
> {
> 	dma_resv_assert_held(shmem->base.resv);
> 
> 	return shmem->pages_use_count == (shmem->sgt ? 1 : 0);
> }
> 
> I mean, I'm not against renaming pages_use_count into pin_count, but,
> unless I'm missing something, I don't see a good reason to keep both.

My bad, I think I found one place calling drm_gem_shmem_get_pages()
where we want pin_count and pages_use_count to differ:
drm_gem_shmem_mmap(). We certainly don't want userspace mappings to
prevent eviction.
