Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D425083BB36
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D53F10F216;
	Thu, 25 Jan 2024 08:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5B810F833
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 08:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706169771;
 bh=KjWB9RCuIPpmEs3LKhKafBGiLd5pPNJQhI+Vkrsfhqw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SDYER/GQtO7GxHnYozVA17JhDttmQFnSL1vR+asI6U58wi16Yh10w0v0ecFTQCIvp
 nwAMz7eNLo+8tYXVeHr4JYp1Tc2JCqPIrunyrRd4lB7Kh9oVXtW2MfAf59g51J4qRJ
 Y1L4QgTNFxUu2+qjNglCzdN2fMqOHSaFZdeSRCM+O9T5zOydqF6eyedyPPg+tCnl5N
 Cn9i38v3IWQ3+NAgbfOuS2HqmLVEBe0BCGIfn+tDXqip/zPWTuECDXnJiFeWNO9ZPY
 PCygTJM7f9ewAlCXJdM9qLuabjB3g9oN9ALtq9a6S929QIhqXoiKIAIjrvHOs+nuhG
 kR0mWitbgaEjg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AEEC937820C2;
 Thu, 25 Jan 2024 08:02:50 +0000 (UTC)
Date: Thu, 25 Jan 2024 09:02:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 15/30] drm/shmem-helper: Avoid lockdep warning when
 pages are released
Message-ID: <20240125090249.5f05959d@collabora.com>
In-Reply-To: <20240105184624.508603-16-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-16-dmitry.osipenko@collabora.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Jan 2024 21:46:09 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> All drivers will be moved to get/put pages explicitly and then the last
> put_pages() will be invoked during gem_free() time by some drivers.
> We can't touch reservation lock when GEM is freed because that will cause
> a spurious warning from lockdep when shrinker support will be added.
> Lockdep doesn't know that fs_reclaim isn't functioning for a freed object,
> and thus, can't deadlock. Release pages directly without taking reservation
> lock if GEM is freed and its refcount is zero.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index f5ed64f78648..c7357110ca76 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -242,6 +242,22 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  	if (refcount_dec_not_one(&shmem->pages_use_count))
>  		return;
>  
> +	/*
> +	 * Destroying the object is a special case because acquiring
> +	 * the obj lock can cause a locking order inversion between
> +	 * reservation_ww_class_mutex and fs_reclaim.
> +	 *
> +	 * This deadlock is not actually possible, because no one should
> +	 * be already holding the lock when GEM is released.  Unfortunately
> +	 * lockdep is not aware of this detail.  So when the refcount drops
> +	 * to zero, we pretend it is already locked.
> +	 */
> +	if (!kref_read(&shmem->base.refcount)) {
> +		if (refcount_dec_and_test(&shmem->pages_use_count))
> +			drm_gem_shmem_free_pages(shmem);
> +		return;
> +	}
> +
>  	dma_resv_lock(shmem->base.resv, NULL);
>  	drm_gem_shmem_put_pages_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);

