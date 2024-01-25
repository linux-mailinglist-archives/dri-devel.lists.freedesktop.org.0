Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275FA83BB3C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 09:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D3910F833;
	Thu, 25 Jan 2024 08:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F44310F833
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706169748;
 bh=VCbIeEvU+Hvu9heYcu0mfFKjK9KaE6zRVAxTGdJIkZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q67nKkqQfLucYoKDEQgXaAZ6lLe4cHno8b+SfamY1VURHam2v3QYTrx9UxEsPp2ZP
 yjvuyE0qNnMOsUu+u7+eZkJAOeV+jyKUPIaZw1WypsU+NxWrGptOmoXzc2M7WxtOJy
 ynbyBH7rxWqKGhGXQjk2N/9LJozmeviNv0nsRoyQ8GuwB67fLCBbyqTmX9sxcwvRG2
 51vt3qhXgP+aHZQj52bFSjs8y3jm1GmGmUNj32HSmOhpWWloTqXO23G5feYQ4H5BCU
 hURhKFykXadBi2Sh4ctyvOqhGRwPbyhj1CbPrr4Fmw7jOMnypJgdtg9E0wL9KKL+dP
 fR7xw00ttBJNg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 14E2537820AF;
 Thu, 25 Jan 2024 08:02:27 +0000 (UTC)
Date: Thu, 25 Jan 2024 09:02:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 14/30] drm/shmem-helper: Add drm_gem_shmem_put_pages()
Message-ID: <20240125090226.2f7f0de5@collabora.com>
In-Reply-To: <20240105184624.508603-15-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-15-dmitry.osipenko@collabora.com>
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

On Fri,  5 Jan 2024 21:46:08 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> We're going to move away from having implicit get_pages() done by
> get_pages_sgt() to ease simplify refcnt handling. Drivers will manage
> get/put_pages() by themselves. Add drm_gem_shmem_put_pages().
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 20 ++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index dc416a4bce1b..f5ed64f78648 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -218,6 +218,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>   * @shmem: shmem GEM object
>   *
>   * This function decreases the use count and puts the backing pages when use drops to zero.
> + * Caller must hold GEM's reservation lock.
>   */
>  void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  {
> @@ -228,6 +229,25 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  
> +/*
> + * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
> + * @shmem: shmem GEM object
> + *
> + * This function decreases the use count and puts the backing pages when use drops to zero.
> + * It's unlocked version of drm_gem_shmem_put_pages_locked(), caller must not hold
> + * GEM's reservation lock.
> + */
> +void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	if (refcount_dec_not_one(&shmem->pages_use_count))
> +		return;
> +
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	drm_gem_shmem_put_pages_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages);
> +
>  /*
>   * drm_gem_shmem_get_pages - Increase use count on the backing pages for a shmem GEM object
>   * @shmem: shmem GEM object
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 6dedc0739fbc..525480488451 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -111,6 +111,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>  void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
>  
>  int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
> +void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
>  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);

