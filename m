Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7EA4BB68
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA710E3B4;
	Mon,  3 Mar 2025 09:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pMATi7pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BB610E3B4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:57:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6114C611EB;
 Mon,  3 Mar 2025 09:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C52CC4CEE4;
 Mon,  3 Mar 2025 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740995850;
 bh=masdkjIvRxkSHVpoGmD/vxKS9OGmtwfKgMWJNuBko8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pMATi7pgtFHEMF95Ep8Hq/lRVkYkPMKrdoJat2qzXzK3PD+NxGWZMI92zkhZl4QpX
 zQ5UjTb2GB3Ia8IbHD2IkLk+KHYmTJa5rAaoqeqbSpuQqprLOT9JTQcKNefuynuj3q
 FOq+P4ddLtdRMmWJ+pzGQNnsl3Jf/ju0PX7T9h8B2JlbAm/O2UQz14dit12rjzt9wf
 k4Sop0uBgUrOqgmB3OeuCrGeS5REAgA5WbRDUxz+CwQQFPEjy2chm1vxyvWiLY+XpX
 n+wqUubPD1CpSMY0nDAq8w3vyNIsrGQXYrm3XFP525Azg/pCMYwCgbAlEKoQql3Lfq
 07oGYxbBTdSiw==
Date: Mon, 3 Mar 2025 10:57:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
Message-ID: <20250303-lyrical-cherry-goose-c871d1@houat>
References: <20250228094457.239442-1-tzimmermann@suse.de>
 <20250228094457.239442-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dn55hlm57r2rsjj3"
Content-Disposition: inline
In-Reply-To: <20250228094457.239442-2-tzimmermann@suse.de>
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


--dn55hlm57r2rsjj3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
MIME-Version: 1.0

Hi Thomas,

On Fri, Feb 28, 2025 at 10:32:51AM +0100, Thomas Zimmermann wrote:
> Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
> peripheral busses, such as USB, often cannot perform DMA by themselves.
> Without DMA-capable device PRIME import fails. DRM drivers for USB
> devices already use a separate DMA device for dma-buf imports. Make the
> mechanism generally available.
>=20
> Add the field dma_dev to struct drm_device to refer to the device's DMA
> device. For USB this should be the USB controller. Use dma_dev in the
> PRIME import helpers, if set.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_drv.c   |  2 ++
>  drivers/gpu/drm/drm_prime.c |  2 +-
>  include/drm/drm_device.h    | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..f8c3c9f77d22 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -654,6 +654,8 @@ static void drm_dev_init_release(struct drm_device *d=
ev, void *res)
>  {
>  	drm_fs_inode_free(dev->anon_inode);
> =20
> +	put_device(dev->dma_dev);
> +	dev->dma_dev =3D NULL;
>  	put_device(dev->dev);
>  	/* Prevent use-after-free in drm_managed_release when debugging is
>  	 * enabled. Slightly awkward, but can't really be helped. */
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..258858f2f8dd 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -1004,7 +1004,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
>  {
> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
> +	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
>  }
>  EXPORT_SYMBOL(drm_gem_prime_import);
> =20
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 6ea54a578cda..a24cac4b2077 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -64,6 +64,23 @@ struct drm_device {
>  	/** @dev: Device structure of bus-device */
>  	struct device *dev;
> =20
> +	/**
> +	 * @dma_dev:
> +	 *
> +	 * Device for DMA operations. Only required if the device @dev
> +	 * cannot perform DMA by itself. Should be NULL otherwise.
> +	 *
> +	 * Devices on USB and other peripheral busses cannot perform DMA
> +	 * by themselves. The @dma_dev field should point the bus controller
> +	 * that does DMA on behalve of such a device. Required for importing
> +	 * buffers via dma-buf.
> +	 *
> +	 * If set, the DRM driver has to acquire a reference on the DMA
> +	 * device, which will be owned and released automatically by the
> +	 * DRM core.
> +	 */
> +	struct device *dma_dev;
> +

It looks good to me in general, but this is also useful with ARM
platform is general. On those, the DRM device is bound to a virtual
device (and thus can't do DMA), but the HW accesses will be done by
one or more HW controllers that are part of the overall DRM driver.

Thus, we typically have to make hacks to copy to the virtual device DMA
setup from the actual device doing the DMA accesses.

See for example
https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/vc4/vc4_drv=
=2Ec#L313
https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/sun4i/sun4i=
_backend.c#L797

It's probably worth documenting.

Maxime

--dn55hlm57r2rsjj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8V9AwAKCRAnX84Zoj2+
dqBsAX9kn3/xsjTRvbTS3WrcDIcggrH6OzfK+2SqmnITOVo/W5nda+3VCnVq2wKx
dX3tLKkBf0TxOT/J+oR6vaxKUmoFQV3IXLpypiKL0Yn3GJigDs5iOfVBUZ987pZ2
GRu90IBfxg==
=ZZvI
-----END PGP SIGNATURE-----

--dn55hlm57r2rsjj3--
