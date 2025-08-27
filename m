Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96158B37F44
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 11:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A2D10E796;
	Wed, 27 Aug 2025 09:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oMZF7Wu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAEA10E796
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 09:52:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F199601FC;
 Wed, 27 Aug 2025 09:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B83EC4CEEB;
 Wed, 27 Aug 2025 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756288328;
 bh=LpOqfLYoRw0FyeTEv/gpwk2Xvxc7IYE6DXD3WPBFp7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMZF7Wu7ZiE49V0oWeffzxtElEq4FVNlBjyzu+wrTIDJKjArePfe+jxi6tSEHaD0z
 4bq4IjQfeISBplxRDXBDgn2Z4J1xstl8MY85SwOj4vZ8u3dS3wKaxWGic8eZyPPIWs
 XVk1xxwOblK/AOoUTLY89VqphLe+f4/JFSngEOIZjOEQywrMV7m4as9YRZt46CbpHX
 xj/ay0qNZ55yGukG99wplWuF8GO8HOvU/D3D9XjiPZwltkV4e2nNO1ZoEHyRBHZHBc
 N9v/OmZb9nE4ilJpCRvm5wcK5J1f+JGJEbDRaPf+/8QkcDRPtTpdISIqpcdyxlfvUu
 xdcxsMhFn2CUw==
Date: Wed, 27 Aug 2025 11:52:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
Message-ID: <20250827-imperial-amigurumi-malkoha-b99a9d@houat>
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="m4pbn5rycqraharh"
Content-Disposition: inline
In-Reply-To: <20250821095228.648156-4-jfalempe@redhat.com>
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


--m4pbn5rycqraharh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
MIME-Version: 1.0

Hi,

On Thu, Aug 21, 2025 at 11:49:07AM +0200, Jocelyn Falempe wrote:
> This is a bit hacky, but very handy if you want to customize the
> panic screen.
> It allows to dump the generated images to the logs, and then a python
> script can convert it to .png files. It makes it easy to check how
> the panic screen will look on different resolutions, without having
> to crash a VM.
> To not pollute the logs, it uses a monochrome framebuffer, compress
> it with zlib, and base64 encode it.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig.debug          |  14 ++++
>  drivers/gpu/drm/tests/drm_panic_test.c | 111 +++++++++++++++++++++++++
>  scripts/kunitpanic2png.py              |  53 ++++++++++++
>  3 files changed, 178 insertions(+)
>  create mode 100755 scripts/kunitpanic2png.py
>=20
> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
> index 05dc43c0b8c5..d8ae85132d32 100644
> --- a/drivers/gpu/drm/Kconfig.debug
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -84,6 +84,20 @@ config DRM_KUNIT_TEST
> =20
>  	  If in doubt, say "N".
> =20
> +config DRM_PANIC_KUNIT_TEST_DUMP
> +	bool "Enable screen dump to logs in KUnit tests for drm_panic"
> +	default n
> +	depends on DRM && DRM_PANIC && DRM_KUNIT_TEST
> +	select ZLIB_DEFLATE
> +	help
> +	  This allows to dump the panic screen to the KUnit tests logs.
> +	  It's possible with a small python script to write pngs from the logs.
> +
> +	  This is only to help developers customizing the drm_panic screen,
> +	  checking the result for different resolutions.
> +
> +	  If in doubt, say "N"
> +
>  config DRM_TTM_KUNIT_TEST
>  	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>  	default n
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tes=
ts/drm_panic_test.c
> index 46ff3e5e0e5d..8cddb845aea9 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -115,24 +115,135 @@ static void drm_test_panic_screen_user_page(struct=
 kunit *test)
>  	kfree(pages);
>  }
> =20
> +#ifdef CONFIG_DRM_PANIC_KUNIT_TEST_DUMP
> +#include <linux/base64.h>
> +#include <linux/delay.h>
> +#include <linux/zlib.h>
> +
> +#define LINE_LEN 128
> +
> +#define COMPR_LEVEL 6
> +#define WINDOW_BITS 12
> +#define MEM_LEVEL 4
> +
> +static int compress_image(u8 *src, int size, u8 *dst)
> +{
> +	struct z_stream_s stream;
> +
> +	stream.workspace =3D kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, ME=
M_LEVEL),
> +				   GFP_KERNEL);
> +
> +	if (zlib_deflateInit2(&stream, COMPR_LEVEL, Z_DEFLATED, WINDOW_BITS,
> +			      MEM_LEVEL, Z_DEFAULT_STRATEGY) !=3D Z_OK)
> +		return -EINVAL;
> +
> +	stream.next_in =3D src;
> +	stream.avail_in =3D size;
> +	stream.total_in =3D 0;
> +	stream.next_out =3D dst;
> +	stream.avail_out =3D size;
> +	stream.total_out =3D 0;
> +
> +	if (zlib_deflate(&stream, Z_FINISH) !=3D Z_STREAM_END)
> +		return -EINVAL;
> +
> +	if (zlib_deflateEnd(&stream) !=3D Z_OK)
> +		return -EINVAL;
> +
> +	kfree(stream.workspace);
> +
> +	return stream.total_out;
> +}
> +
> +static void dump_image(u8 *fb, unsigned int width, unsigned int height)
> +{
> +	int len =3D 0;
> +	char *dst;
> +	char *compressed;
> +	int sent =3D 0;
> +	int stride =3D DIV_ROUND_UP(width, 8);
> +	int size =3D stride * height;
> +
> +	compressed =3D vzalloc(size);
> +	if (!compressed)
> +		return;
> +	len =3D compress_image(fb, size, compressed);
> +	if (len < 0) {
> +		pr_err("Compression failed %d", len);
> +		return;
> +	}
> +
> +	dst =3D vzalloc(4 * DIV_ROUND_UP(len, 3) + 1);
> +	if (!dst)
> +		return;
> +
> +	len =3D base64_encode(compressed, len, dst);
> +
> +	pr_info("KUNIT PANIC IMAGE DUMP START %dx%d", width, height);
> +	while (len > 0) {
> +		char save =3D dst[sent + LINE_LEN];
> +
> +		dst[sent + LINE_LEN] =3D 0;
> +		pr_info("%s", dst + sent);
> +		dst[sent + LINE_LEN] =3D save;
> +		sent +=3D LINE_LEN;
> +		len -=3D LINE_LEN;
> +	}
> +	pr_info("KUNIT PANIC IMAGE DUMP END");

The kunit test output format is defined, and we should probably use a
diagnostic line for this:
https://docs.kernel.org/dev-tools/ktap.html#diagnostic-lines

We should probably cc the kunit maintainers about this too.

Maxime

--m4pbn5rycqraharh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7VRgAKCRAnX84Zoj2+
drzeAX45PbUY/F0HXyeVyHBnyRMCqJulGBnEHPVlMEVPeu79ECyBP3qAVW4+TVjK
7KUbZ3IBgMbFMWhd8rEjCMvkcHPFmLCJIz/KJjcp+I/S/VzWya1itYdHnljscRi/
lfhkdBuQxA==
=sbbK
-----END PGP SIGNATURE-----

--m4pbn5rycqraharh--
