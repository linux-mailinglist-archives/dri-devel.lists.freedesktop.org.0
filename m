Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71918400CD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215B10E3AB;
	Mon, 29 Jan 2024 09:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B6010E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706518874;
 bh=dbkjy2ApaTrI1tg/tWH38LMmQK4tCXE60dntBSxmttQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ztfJnuwvtxR+aEZAbUN8CqdwOda9dMtDLZ6GehCc/+Hb4ioDyu05MEAFy3XbJS6Xx
 Wia8ikiEZhRQ0W41vTYLg+0yN3+8CcQ8wIbCGhCoJiUM5pw8GQ676E0UdbRAKrNW+L
 5U/BNcePpl9wgSIXGLx/nhVkOu9D4O0INrpkBY1JWHjn3ujB0cLH05/8jwQ22kLgur
 EPb0TWuVsd253crwfMq44kOnXEx+bTxdZb3IdZehMrt3UZOVvQT8J9WiJkvZosVCTK
 zeaLjXK9U1Biw+z1njFMa0OZBkQGgmWUVk7jMaqMrAsSXVobkwVby0gct/b1qqO7Xm
 OjIjyQX7gWmSA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A4F137814A4;
 Mon, 29 Jan 2024 09:01:13 +0000 (UTC)
Date: Mon, 29 Jan 2024 10:01:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Message-ID: <20240129100112.35c73f18@collabora.com>
In-Reply-To: <20240105184624.508603-23-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
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

On Fri,  5 Jan 2024 21:46:16 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> +/**
> + * drm_gem_shmem_swapin_locked() - Moves shmem GEM back to memory and enables
> + *                                 hardware access to the memory.
> + * @shmem: shmem GEM object
> + *
> + * This function moves shmem GEM back to memory if it was previously evicted
> + * by the memory shrinker. The GEM is ready to use on success.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_gem_shmem_swapin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	int err;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (!shmem->evicted)
> +		return 0;

Shouldn't we have a drm_gem_shmem_shrinker_update_lru_locked() even if
the object wasn't evicted, such that idle->busy transition moves the BO
to the list tail?

> +
> +	err = drm_gem_shmem_acquire_pages(shmem);
> +	if (err)
> +		return err;
> +
> +	shmem->evicted = false;
> +
> +	drm_gem_shmem_shrinker_update_lru_locked(shmem);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_swapin_locked);
> +
