Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD457F7297
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 12:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E2D10E1BC;
	Fri, 24 Nov 2023 11:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9412B10E1BC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 11:21:05 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 442C066073AD;
 Fri, 24 Nov 2023 11:21:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700824864;
 bh=OZpGtMQbmVQunCfJrLeAe542D7ZOanapr4svoI3JwA8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ewNPCOKrH1GyEL3hqBPY48UMHQ+Sz5zv9mFwIXjamzLJRDlRzqQmMrHwqq1B1VVHK
 i9QkoYQDRL9GKu1XX5/XXtzp8tfBUrQ4Q05xvBz/fN9VrJdNDVQY3iNZYg6FFiY3J/
 Q0ZoUcQ6/xMfEbebVoTz+Zr9bX15038jTZiixL3GpkqwvV3u9436gdA9YnYqkYkMzG
 l8Fga9KtCvkB5E5kPPELIua1dlS8oO7WFje+/0vp18587VWVhqnfG3FOtRhz6dKNVB
 YupFft+R/HIk2w7q/3Q7anP2tj2ddWn6HqdSZjsF7iBrsGPQ0CD9LgJmol9JQ+2By9
 PtP2EOZk4kDag==
Date: Fri, 24 Nov 2023 12:20:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v18 08/26] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <20231124122059.244250c7@collabora.com>
In-Reply-To: <zdgmrdfugffy6ogvws3yatcebigylkalfiip2ch3cwgvjs5r65@hgakb26hmhsb>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-9-dmitry.osipenko@collabora.com>
 <zdgmrdfugffy6ogvws3yatcebigylkalfiip2ch3cwgvjs5r65@hgakb26hmhsb>
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Steven Price <steven.price@arm.com>, virtualization@lists.linux-foundation.org,
 Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 11:47:57 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Oct 30, 2023 at 02:01:47AM +0300, Dmitry Osipenko wrote:
> > Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> > lock if pages_use_count is non-zero, leveraging from atomicity of the
> > refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 6e02643ed87e..41b749bedb11 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> >  
> > +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> > +{
> > +	int ret;
> > +
> > +	if (refcount_inc_not_zero(&shmem->pages_use_count))
> > +		return 0;
> > +
> > +	dma_resv_lock(shmem->base.resv, NULL);
> > +	ret = drm_gem_shmem_get_pages_locked(shmem);
> > +	dma_resv_unlock(shmem->base.resv);
> > +
> > +	return ret;
> > +}
> > +  
> 
> Wait, so the locked suffix is to indicate that we need to take the lock
> before we call it? I think that's the opposite to all(?) the naming
> convention we have

If you grep for "_locked(" and "_unlocked(" in the DRM sub-tree, you'll
see it's actually mixed, with maybe a few more helpers suffixed
_locked() than we have suffixed with _unlocked().

> 
> Especially since the function name doesn't describe what the function
> does anymore, but the context in which to call it.

Well, that's the same for "_unlocked", and we do have to pick one of
the _locked/_unlocked pattern if we want to expose both flavors.

> I'm sure if I was to
> use it, I would have gotten it wrong, or at the very least been very
> confused about it.

I personally find both equally confusing tbh, but we do have cases
where we need to expose the exact same functionality without the extra
locking. I do have a slight preference for _locked though, because it's
two characters shorter ;-).
