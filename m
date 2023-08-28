Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE96378AE93
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB1A10E28C;
	Mon, 28 Aug 2023 11:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073AC10E14E;
 Mon, 28 Aug 2023 11:16:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D4F5F6600873;
 Mon, 28 Aug 2023 12:16:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693221411;
 bh=BlJFXTWexWp6mvkGqWMB8M7CVKV2UlUeerfJzGgXkj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Liu0JclTWTa5GwqIj76KMimjJxucjirjetPeMy/4zi/a7zAYY4bZ3rgno8MzwEZzP
 U3CSKmxm5Cuh5UugQRoA9rE10Fl8VkICVV6Mh7BypkX1us9S2LaQKA9LPIfx5IkyPD
 /mIL+3xjmSy4cFgwXl9ckAVZ4DUzWJOG0WLA1+/kexc5NoPto0b14XIARubx8ljK59
 OKYdqNFjnDhYYFy95JblbGvPDYTS+sL5EAfoCZyDUd5nTxTTbTeUQ5HoyXdOTt4Yzf
 c4Lj5EKxVLsHN5D8x0bx3uSxTFytFnMC3vvCvjqYkua/A3o6BkeK/l2c3OUc+0yqqY
 kPtPA5MfPbOaw==
Date: Mon, 28 Aug 2023 13:16:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 01/23] drm/shmem-helper: Fix UAF in error path when
 freeing SGT of imported GEM
Message-ID: <20230828131647.18888896@collabora.com>
In-Reply-To: <20230827175449.1766701-2-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-2-dmitry.osipenko@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Aug 2023 20:54:27 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Freeing drm-shmem GEM right after creating it using
> drm_gem_shmem_prime_import_sg_table() frees SGT of the imported dma-buf
> and then dma-buf frees this SGT second time.
> 
> The v3d_prime_import_sg_table() is example of a error code path where
> dma-buf's SGT is freed by drm-shmem and then it's freed second time by
> dma_buf_unmap_attachment() in drm_gem_prime_import_dev().
> 
> Add drm-shmem GEM flag telling that this is imported SGT shall not be
> treated as own SGT, fixing the use-after-free bug.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
>  include/drm/drm_gem_shmem_helper.h     | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index a783d2245599..78d9cf2355a5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -141,7 +141,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  
>  	if (obj->import_attach) {
>  		drm_prime_gem_destroy(obj, shmem->sgt);
> -	} else {
> +	} else if (!shmem->imported_sgt) {
>  		dma_resv_lock(shmem->base.resv, NULL);
>  
>  		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> @@ -758,6 +758,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  		return ERR_CAST(shmem);
>  
>  	shmem->sgt = sgt;
> +	shmem->imported_sgt = true;


I feel like adding more fields that can be used to do the is_imported()
check is going to be even more confusing. Can we instead have

	/* drm_gem_shmem_prime_import_sg_table() can be called from a
	 * driver specific ->import_sg_table() implementations that
	 * have extra failable initialization steps. Assign
	 * drm_gem_object::import_attach here (even though it's
	 * assigned in drm_gem_prime_import_dev()), so we don't end up
	 * with driver error paths calling drm_gem_shmem_free() with an
	 * imported sg_table assigned to drm_gem_shmem_object::sgt and
	 * drm_gem_object::import_attach left uninitialized.
	 */
	shmem->base.import_attach = attach;

here?

>  
>  	drm_dbg_prime(dev, "size = %zu\n", size);
>  
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index bf0c31aa8fbe..ec70a98a8fe1 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
>  	 */
>  	unsigned int vmap_use_count;
>  
> +	/**
> +	 * @imported_sgt:
> +	 *
> +	 * True if SG table belongs to imported dma-buf.
> +	 */
> +	bool imported_sgt : 1;
> +
>  	/**
>  	 * @pages_mark_dirty_on_put:
>  	 *

