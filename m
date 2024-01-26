Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741683D7BD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 11:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0E410E67D;
	Fri, 26 Jan 2024 10:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3380010E67D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706264310;
 bh=hqYTK0EsC3o/io3T1zeWVHK+9pLIv8eop9reCP1H12I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ionVzzYUVohq/prvhL2Jplfp6RkWMX6N92pnga5WmXEKfX3WWE3wisdops+KV3ifp
 Uy5+PNmkF5un43C8farXeu6d+mw/XXMFTa98cPOyEm3NUm+NQKX+R0usEfm+yjMQH7
 khbw3xEeIDeVPaZKmrCynwWqSZpQ8Oc02kg3PrHM1X2oQ8dpeIENT27v27zWpVX2i/
 WQroAxJl0yGuCyjeLxf+oFMJh6VulBj4FrURTI1vV2T8AWII+/P76KkX9I5zEaC6P4
 zYwV4SGEyo23NTgEBHBcWqv359YkS3edA2waZUh4Gg+h+o2W0wxJH43MTurEDDpU2u
 SOvR1OO9/OPJw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 420D63782072;
 Fri, 26 Jan 2024 10:18:29 +0000 (UTC)
Date: Fri, 26 Jan 2024 11:18:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <20240126111827.70f8726c@collabora.com>
In-Reply-To: <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Jan 2024 18:24:04 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:
> > Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> > lock if pages_use_count is non-zero, leveraging from atomicity of the
> > refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> > 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index cacf0f8c42e2..1c032513abf1 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> >  
> > +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> > +{
> > +	int ret;  
> 
> Just random drive-by comment: a might_lock annotation here might be good,
> or people could hit some really interesting bugs that are rather hard to
> reproduce ...

Actually, being able to acquire a ref in a dma-signalling path on an
object we know for sure already has refcount >= 1 (because we previously
acquired a ref in a path where dma_resv_lock() was allowed), was the
primary reason I suggested moving to this atomic-refcount approach.

In the meantime, drm_gpuvm has evolved in a way that allows me to not
take the ref in the dma-signalling path (the gpuvm_bo object now holds
the ref, and it's acquired/released outside the dma-signalling path).

Not saying we shouldn't add this might_lock(), but others might have
good reasons to have this function called in a path where locking
is not allowed.
