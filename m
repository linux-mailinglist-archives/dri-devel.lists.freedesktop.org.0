Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C927F71F9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A3D10E19E;
	Fri, 24 Nov 2023 10:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114FD10E19E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:48:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D29F62133;
 Fri, 24 Nov 2023 10:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34B5C433C8;
 Fri, 24 Nov 2023 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822880;
 bh=LSo0ZQQHC/IsC9xQJ/PVzcvZKxNomMboWXtQ7MmvXeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T1APQeHx8vfRJIlPG7GCFaf26wYHmGOanpVv73ATBPXRTYdco3PosME2XpLWX4mus
 WG3RqeBA0h6xhaUz1FF2VGA+Dd4KqTDlshUwOPsGD2Ru7FLvxwT4rhFnFrZOUQLuk9
 x706MGYMsRvtF40qvFhJcUDZ8OfNy9HHbXSIj3UV/gwXqazNAwmqH286hIBptKtgn+
 HOC2w3FqnnzPMwpm/iJBbt5vh95z1ALZUExRdQC8Z4YzoEfFH1xhDVhWErhMniP21X
 cS/HZ/3fSdc3NK4RW1w2jVK/qGxidNoKfAILkBTVjiCw/bbqMSZHcyYLvFTZ2qmxqi
 baEGyJBJAjMeQ==
Date: Fri, 24 Nov 2023 11:47:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 08/26] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <zdgmrdfugffy6ogvws3yatcebigylkalfiip2ch3cwgvjs5r65@hgakb26hmhsb>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-9-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i4hob2pzcy5qf62n"
Content-Disposition: inline
In-Reply-To: <20231029230205.93277-9-dmitry.osipenko@collabora.com>
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i4hob2pzcy5qf62n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 02:01:47AM +0300, Dmitry Osipenko wrote:
> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservati=
on
> lock if pages_use_count is non-zero, leveraging from atomicity of the
> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 6e02643ed87e..41b749bedb11 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_s=
hmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> =20
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	int ret;
> +
> +	if (refcount_inc_not_zero(&shmem->pages_use_count))
> +		return 0;
> +
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	ret =3D drm_gem_shmem_get_pages_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
> +
> +	return ret;
> +}
> +

Wait, so the locked suffix is to indicate that we need to take the lock
before we call it? I think that's the opposite to all(?) the naming
convention we have

Especially since the function name doesn't describe what the function
does anymore, but the context in which to call it. I'm sure if I was to
use it, I would have gotten it wrong, or at the very least been very
confused about it.

Maxime

--i4hob2pzcy5qf62n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWB/XQAKCRDj7w1vZxhR
xTOjAP4kvIUjsI4/bd6ZVYnMdk1Vochj+P/U8iB648tf1v7cIgEAnBJRt077kVOy
hzkjMQ1cHLWctzPgwzfxAIRy1scsxQs=
=GYdZ
-----END PGP SIGNATURE-----

--i4hob2pzcy5qf62n--
