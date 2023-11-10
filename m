Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951D7E7B58
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EBF10E980;
	Fri, 10 Nov 2023 10:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B37110E980
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 10:17:43 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3764166073F9;
 Fri, 10 Nov 2023 10:17:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699611462;
 bh=tC5sjf8JC5T2/oyASwUzhHg2NFb01acCe9klcjlI0uY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kb0noODfQiq2ijYfkjrIhVkonAhY7ZXSwkp3IleOgNqmbC6Xh7oxHzauYZTlp7K20
 AOEOHxqbHMt82LZPUH1OObIXxPvulwwRsizpMT8zhQARfXv2HVB9iZujGcgrxxQyhx
 alQ58eOSwm6eX8s9rqhQs24/QH2Lw3aZSh20IhqfGFzUqgwpYORJWYEBf9R4FdzvMt
 Ari1bqARnv2H7VYbdEQom16EjWh4IvJWr/Wm4M2H85hrEIlOy/xu8rMLzRtyc+hLrl
 0tK0FkPF4cWKJLKDetHSVWuP/8IEdhOq9POq24Xjd2JtsXHzYyYhdcrPtHD6IsX4+x
 +coW0J+FRJuog==
Date: Fri, 10 Nov 2023 11:17:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 12/26] drm/shmem-helper: Make
 drm_gem_shmem_get_pages() public
Message-ID: <20231110111737.212f9454@collabora.com>
In-Reply-To: <20231029230205.93277-13-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-13-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:01:51 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> We're going to move away from having implicit get_pages() done by
> get_pages_sgt() to ease simplify refcnt handling. Drivers will manage

Nit: ease or simplify, not both.

> get/put_pages() by themselves. Expose the drm_gem_shmem_get_pages()
> in a public drm-shmem API.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 10 +++++++++-
>  include/drm/drm_gem_shmem_helper.h     |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 24ff2b99e75b..ca6f422c0dfc 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -227,7 +227,14 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  
> -static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +/*
> + * drm_gem_shmem_get_pages - Increase use count on the backing pages for a shmem GEM object
> + * @shmem: shmem GEM object
> + *
> + * This function Increases the use count and allocates the backing pages if
> + * use-count equals to zero.
> + */
> +int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  {
>  	int ret;
>  
> @@ -240,6 +247,7 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages);
>  
>  static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index e7b3f4c02bf5..45cd293e10a4 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -110,6 +110,7 @@ struct drm_gem_shmem_object {
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
>  void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
>  
> +int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
>  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);

