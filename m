Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506383BB0C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 08:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFE710F82A;
	Thu, 25 Jan 2024 07:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AB910F836
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706169305;
 bh=pyMEcKtVJxb7T/GxClE/3Bz1lwTzPFpnniWDjB5Fa5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zBWcBxnJsGwrfch37UMhqu8LOsolJ/KVQkSJosUgJJGDb13zcIFPsx6HODmWPyU8f
 9Snas5pyoGFXvJxIG8IDHGvtHbNhq2E9pcEdcrwauBNR10UF4BXpcmcBpKtl8eA10W
 eGtHePMNgsNf/tLNUwustb7V3WUku1kt6gubqx1HQu4eIFXO1tl0DZhkvxuOPpbKb5
 F8LZNWLndzD6mX7VsvSNG8t8zZ721d38yKCLaiDKcTqkijAeVgOqfnf6TR3ryfd7S7
 7lOI/jnhRkZwApt5Q7OsiAfZ01w21/IPJZ1uUhRowWTgHeQo8Rrl00L40pUw4slIu+
 0Raekb75VHLsQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 460243781FC7;
 Thu, 25 Jan 2024 07:55:04 +0000 (UTC)
Date: Thu, 25 Jan 2024 08:55:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 03/30] drm/gem: Document locking rule of vmap and
 evict callbacks
Message-ID: <20240125085502.3207ee29@collabora.com>
In-Reply-To: <20240105184624.508603-4-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-4-dmitry.osipenko@collabora.com>
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

On Fri,  5 Jan 2024 21:45:57 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> The vmap/vunmap/evict GEM callbacks are always invoked with a held GEM's
> reservation lock. Document this locking rule for clarity.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  include/drm/drm_gem.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index f835fdee6a5e..021f64371056 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -156,7 +156,8 @@ struct drm_gem_object_funcs {
>  	 * @vmap:
>  	 *
>  	 * Returns a virtual address for the buffer. Used by the
> -	 * drm_gem_dmabuf_vmap() helper.
> +	 * drm_gem_dmabuf_vmap() helper. Called with a held GEM reservation
> +	 * lock.
>  	 *
>  	 * This callback is optional.
>  	 */
> @@ -166,7 +167,8 @@ struct drm_gem_object_funcs {
>  	 * @vunmap:
>  	 *
>  	 * Releases the address previously returned by @vmap. Used by the
> -	 * drm_gem_dmabuf_vunmap() helper.
> +	 * drm_gem_dmabuf_vunmap() helper. Called with a held GEM reservation
> +	 * lock.
>  	 *
>  	 * This callback is optional.
>  	 */
> @@ -189,7 +191,8 @@ struct drm_gem_object_funcs {
>  	 * @evict:
>  	 *
>  	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
> -	 * helper. Returns 0 on success, -errno otherwise.
> +	 * helper. Returns 0 on success, -errno otherwise. Called with a held
> +	 * GEM reservation lock.
>  	 *
>  	 * This callback is optional.
>  	 */

