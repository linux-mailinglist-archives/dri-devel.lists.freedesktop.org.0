Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EACD826B82
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 11:20:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE6F10E20C;
	Mon,  8 Jan 2024 10:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0C10E20C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 10:20:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C035F60ED0;
 Mon,  8 Jan 2024 10:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E01C433C8;
 Mon,  8 Jan 2024 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704709253;
 bh=aZumgek3Jt+oVy0HocNYJbx+0jmDO/oyeCo5/CrzWLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iy0vNFRL5UOj0GV4G2EyZ+zbduoyIF6vRNqyM48qi2JjID/eX25rgahLnBGR+CXEB
 /Jr+hxVa7pnmgqHsgQovIuMOIXzPLvzSYuhshNQHeKRvhHwr/9JKAPgMefeFYywXFv
 Qix7hTqTj+MJnA+Z49+Chj7JD3Bw/xfMZEpjQVaiNR2kzs9KqH6jdZbS/w0H8LG/Ah
 tsoiwanjWDZ3udO8fWFWx4tl2vt/FzYz7ZvjN3gS//j13m79YARqfKCcp5+eg5VXgX
 S8K70YWL6mfw5n9JJNR3vX5IJ3RXXx4LRLKYZk81j2+P75lNM0IsIJTIs3oALgzVnX
 ZsotPTHyKb11w==
Date: Mon, 8 Jan 2024 11:20:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <zyzybbofx2mhl7pvpgzc33vq4u4zg6o6h6het6wwasprg4y7pt@vz4tvadsid4c>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f633texdo4vyemcb"
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-6-jfalempe@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f633texdo4vyemcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 04, 2024 at 05:00:49PM +0100, Jocelyn Falempe wrote:
> This was initialy done for imx6, but should work on most drivers
> using drm_fb_dma_helper.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_fb_dma_helper.c | 55 +++++++++++++++++++++++++++++
>  include/drm/drm_fb_dma_helper.h     |  4 +++
>  2 files changed, 59 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb=
_dma_helper.c
> index 3b535ad1b07c..caed2935df4f 100644
> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_plane.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> @@ -148,3 +149,57 @@ void drm_fb_dma_sync_non_coherent(struct drm_device =
*drm,
>  	}
>  }
>  EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
> +
> +#if defined(CONFIG_DRM_PANIC)
> +/**
> + * @dev: DRM device
> + * @drm_scanout_buffer: scanout buffer for the panic handler
> + * Returns: 0 or negative error code
> + *
> + * Generic get_scanout_buffer() implementation, for drivers that uses the
> + * drm_fb_dma_helper.
> + */
> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	struct drm_plane *plane;
> +	struct drm_gem_dma_object *dma_obj;
> +	struct drm_framebuffer *fb;
> +
> +	drm_for_each_primary_visible_plane(plane, dev) {
> +		fb =3D plane->state->fb;
> +		/* Only support linear modifier */
> +		if (fb->modifier !=3D DRM_FORMAT_MOD_LINEAR)
> +			continue;
> +
> +		/* Check if color format is supported */
> +		if (!drm_panic_is_format_supported(fb->format->format))
> +			continue;
> +
> +		dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);
> +
> +		/* Buffer should be accessible from the CPU */
> +		if (dma_obj->base.import_attach)
> +			continue;
> +
> +		/* Buffer should be already mapped to CPU */
> +		if (!dma_obj->vaddr)
> +			continue;
> +
> +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> +		sb->format =3D fb->format;
> +		sb->height =3D fb->height;
> +		sb->width =3D fb->width;
> +		sb->pitch =3D fb->pitches[0];
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +#else
> +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> +				     struct drm_scanout_buffer *sb)
> +{
> +	return 0;
> +}
> +#endif
> +EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);

Looks much better, thanks :)

I think we should be more vocal about the failure cases too. Maybe log
it through warn/pr_crit or whatever so that at least we have an idea
what went wrong in a post mortem.

Maxime

--f633texdo4vyemcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZvMggAKCRDj7w1vZxhR
xX9QAP9+pSaMdvO8sI9Q0h+1V2hI+jpX4KrR5N2Cuet30w4CFwEAzEQacN26FaIQ
eef77uzxl4RvJYWh4EBp2QsWSnSZUwo=
=AUSQ
-----END PGP SIGNATURE-----

--f633texdo4vyemcb--
