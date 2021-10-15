Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC442EF68
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 13:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A97B6E288;
	Fri, 15 Oct 2021 11:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3076E288
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 11:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0832A1F45170
Received: by earth.universe (Postfix, from userid 1000)
 id 6C5533C0CA8; Fri, 15 Oct 2021 13:11:39 +0200 (CEST)
Date: Fri, 15 Oct 2021 13:11:39 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Qing Wang <wangqing@vivo.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel: replace snprintf in show functions with
 sysfs_emit
Message-ID: <20211015111139.ozarnvcdxscbaqv4@earth.universe>
References: <1634280490-4429-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hjbcwzdrasw4w5wv"
Content-Disposition: inline
In-Reply-To: <1634280490-4429-1-git-send-email-wangqing@vivo.com>
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


--hjbcwzdrasw4w5wv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 14, 2021 at 11:48:10PM -0700, Qing Wang wrote:
> show() must not use snprintf() when formatting the value to be
> returned to user space.
>=20
> Fix the following coccicheck warning:
> drivers/gpu/drm/panel/panel-dsi-cm.c:251: WARNING: use scnprintf or sprin=
tf.
> drivers/gpu/drm/panel/panel-dsi-cm.c:271: WARNING: use scnprintf or sprin=
tf.
>=20
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
>=20
> Signed-off-by: Qing Wang <wangqing@vivo.com>
> ---

The patch subject could be more specific (this updates just one panel drive=
r).
Otherwise:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/panel/panel-dsi-cm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel=
/panel-dsi-cm.c
> index 5fbfb71..a8efb06 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -248,7 +248,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
>  	if (r)
>  		return r;
> =20
> -	return snprintf(buf, PAGE_SIZE, "%d\n", errors);
> +	return sysfs_emit(buf, "%d\n", errors);
>  }
> =20
>  static ssize_t hw_revision_show(struct device *dev,
> @@ -268,7 +268,7 @@ static ssize_t hw_revision_show(struct device *dev,
>  	if (r)
>  		return r;
> =20
> -	return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x\n", id1, id2, id3);
> +	return sysfs_emit(buf, "%02x.%02x.%02x\n", id1, id2, id3);
>  }
> =20
>  static DEVICE_ATTR_RO(num_dsi_errors);
> --=20
> 2.7.4
>=20

--hjbcwzdrasw4w5wv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmFpYeAACgkQ2O7X88g7
+pqF3Q/9EyuHJojPY6XsvFJV1LlEU9OhxJwuZNxPCgqyUwIoA13xgR7a+bMXjJQr
7ubu9mgUmmzwvKONNy6cQmPjM7rs3+omXsFBtwW1B3ug9V8wMXMNCT4vQCvwEDnP
rZsBt+StoPE0XwCk97D/IXxXMktKf+zlMB7Mb5s46q8bytI+7MlwLJ0Z6xonqujg
0j9hKTgusPVmzlhrUnRxDB6U8feGsLKfLgNqN4/u9ilZpU4tLUWuBabY8u/lq1JO
7kFbGALUE/PDM425vJx0G6iAwiI5qnTwDL36LbIP08KsuHdKWkk3nIe2YDNlMhpe
/nqvz7ft4QFLyx0Q1DdI6zth+ESo5J+/9PLLc358Py6uHxnSlmBSVBMC70goxl4E
ib+W/ukWKHndW2DL5jrtWSF9EkIpcG6byGQe4XFM9iCTfzxC1iSVVz3nogHyF8cJ
4enMNzofkeINKZWhLQNG074ZjuegWZYLqa0k5J+NZruYFS5TlUXOHjMcSK3YereW
20YV294iTiNvkl4YnBmzVK3gOzq4XHsqqni5krnSv7VWHJdMHolLJKcrqRrPBJmu
2KC+umSD1b3EgwVS94SE4hnMU0lOw/liWTHt9WZ+mvdpE7kl8UD+nYFvU4sgZphZ
3e2aOrK7xGGZbAJMPAkIcD4QUYcTSaXrwWILphH+gjqlzNI+Bvc=
=c90X
-----END PGP SIGNATURE-----

--hjbcwzdrasw4w5wv--
