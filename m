Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF7A8B2E1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141210E89A;
	Wed, 16 Apr 2025 08:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="luaCl+2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17310E882
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744790412;
 bh=/fHxSrJ80jYTrdplvpC70E5py4kCj1dPyPgVzWeojhQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=luaCl+2+dV1Cb/krJl73Sz5QoMVXzUA0v9IIMcWiLxf+4YihbmCpdGvmuk24gZTI7
 mxeJ7gxjqRHn7YIjCknM61daJedGr/JBUUSBOJRNpQ2X2oThW/10Nhn7d7IqohZnXY
 AKrs6yvBo9+Tc/HTnvh6rSGr62uRIpeIMvaA6jhp0ED2KJTKflzxMCULblvI0IdDmY
 xwbTssqSaT8+hWCxyWCOLA3SFAtVikKofZbPNlL72UgRZEnRNZJy0XrmdVydyYp5hs
 fNUYDW4sOCJYob9jVcNHUqXpqLVc0qbT0ucP7TwoZwqhpmjT8/8LYPanq/ZCqnnsqK
 EbkNqwkvHE7lA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4479417E00AC;
 Wed, 16 Apr 2025 10:00:12 +0200 (CEST)
Date: Wed, 16 Apr 2025 10:00:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, Sumit
 Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <20250416100007.2b253254@collabora.com>
In-Reply-To: <20250416065820.26076-1-tzimmermann@suse.de>
References: <20250416065820.26076-1-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Apr 2025 08:57:45 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Test struct drm_gem_object.import_attach to detect imported objects.
>=20
> During object clenanup, the dma_buf field might be NULL. Testing it in
> an object's free callback then incorrectly does a cleanup as for native

Just pointing it for completeness: this happens even outside the free
callback, because the GEM handle lifetime (time userspace holds this
GEM object) might differ from the GEM lifetime itself (KMD might have
refs to the GEM after the handle is released).

> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

Also happens when the GEM handle is released, which is the case we were
hitting in Panthor.

>=20
> v3:
> - only test for import_attach (Boris)

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> v2:
> - use import_attach.dmabuf instead of dma_buf (Christian)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> Reported-by: Andy Yan <andyshrk@163.com>
> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Corem=
ail.andyshrk@163.com/
> Tested-by: Andy Yan <andyshrk@163.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  include/drm/drm_gem.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..a3133a08267c 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memor=
y_stats(struct drm_gem_obje
>   */
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
> -	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv !=3D obj);
> +	return !!obj->import_attach;
>  }
> =20
>  #ifdef CONFIG_LOCKDEP

