Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE7A8A0D0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F8D10E351;
	Tue, 15 Apr 2025 14:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nAZFsoFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F41D10E351
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744726788;
 bh=dgp++Cs6W5q5h7MD0VTVdEsM0Lu3z7/pIHAVL7SrCWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nAZFsoFu5UixEaV59cW6odqB2rul+Pc17rw0Qcyz8SkH1ot6IGqAkpl3vNFUBNkIW
 gB1Sai912BUoUIKyEg6fUJYgGpnzfX0XXhvGsC75jFp5JY8Sgp2PIoO3YktqOeJ0wF
 gLLKa29qG17gVVgsH7pipVgpWL5Ql0Ddp3bWjict2TOPlSRYIZeJMnzI0+e11LOpy0
 mKFsjbETMCQY34AiFkePu8ujWZ7V+Ns+tgiAJG0KGfACPph3Rw3cvWPGsaEZPsa6/Y
 hfs5Jyh4u3rjtgFNRRu93uk3CFRz9Jy523SdA3vz//BruoA4g0PL96UfzCmzUyRP7j
 mIcz5xaFkLnTw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F4A017E1134;
 Tue, 15 Apr 2025 16:19:48 +0200 (CEST)
Date: Tue, 15 Apr 2025 16:19:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com
Cc: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com,
 andyshrk@163.com, christian.koenig@amd.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <20250415161943.7c51c388@collabora.com>
In-Reply-To: <20250415140256.299550-1-tzimmermann@suse.de>
References: <20250415140256.299550-1-tzimmermann@suse.de>
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

On Tue, 15 Apr 2025 16:02:20 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Test struct drm_gem_object.import_attach.dmabuf to detect imported
> objects. Warn if the stored state is inconsistent.
>=20
> During object clenaup, the dma_buf field might be NULL. Testing it in
> an object's free callback then incorrectly does a cleanup as for native
> objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
> clears the dma_buf field in drm_gem_object_exported_dma_buf_free().
>=20
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
>  include/drm/drm_gem.h | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..464b9c7feec0 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -579,6 +579,21 @@ static inline bool drm_gem_object_is_shared_for_memo=
ry_stats(struct drm_gem_obje
>  	return (obj->handle_count > 1) || obj->dma_buf;
>  }
> =20
> +/**
> + * drm_gem_owns_dma_buf() - Tests if GEM object backs a DMA-buffer object
> + * @obj: the GEM object
> + * @obj: the DMA buffer
> + *
> + * Returns:
> + * True if the DMA buffer refers to the GEM object's buffer.
> + */
> +static inline bool drm_gem_owns_dma_buf(const struct drm_gem_object *obj,
> +					const struct dma_buf *dma_buf)
> +{
> +	/* The dma-buf's priv field points to the original GEM object. */
> +	return dma_buf->priv =3D=3D obj;
> +}
> +
>  /**
>   * drm_gem_is_imported() - Tests if GEM object's buffer has been imported
>   * @obj: the GEM object
> @@ -588,8 +603,15 @@ static inline bool drm_gem_object_is_shared_for_memo=
ry_stats(struct drm_gem_obje
>   */
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
> -	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv !=3D obj);
> +	const struct dma_buf *dma_buf =3D NULL;
> +
> +	if (!obj->import_attach)
> +		return false;
> +
> +	dma_buf =3D obj->import_attach->dmabuf;
> +
> +	/* Warn if we somehow reimported our own buffer. */
> +	return !drm_WARN_ON_ONCE(obj->dev, !dma_buf || drm_gem_owns_dma_buf(obj=
, dma_buf));

I'm honestly not sure I see the point of checking
obj->import_attach->dmabuf. If obj->import_attach !=3D NULL, we're sure
it's a foreign buffer already, otherwise we would get the original GEM
object which has ->import_attach=3DNULL. So why not go for a simple

	return obj->import_attach !=3D NULL;

check, and extend the check when you get to implement imports without
import attachments (not sure what those would look like BTW).
