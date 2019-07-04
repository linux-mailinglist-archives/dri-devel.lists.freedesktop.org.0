Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469C5FE61
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 00:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0362F6E338;
	Thu,  4 Jul 2019 22:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799856E338
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 22:23:48 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C83032184B;
 Thu,  4 Jul 2019 22:23:47 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id 51D9E3C08D5; Fri,  5 Jul 2019 00:23:45 +0200 (CEST)
Date: Fri, 5 Jul 2019 00:23:45 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [Patch v2 03/10] drm/omapdrm: using dev_get_drvdata directly
Message-ID: <20190704222345.2edt3xcpot56yxhj@earth.universe>
References: <20190704023557.4551-1-huangfq.daxian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190704023557.4551-1-huangfq.daxian@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562279028;
 bh=VuSNd+1cTwd98xuw2aAflgF+KDzs02Cx+PF7z1fVES8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nK/FnXJl/7n6j8G+Pi28CNob1W9l3uNn4IM9K9In+Fwz3sAz8bbYxBpiFiiWrrywn
 MnwVE7KJn9x4T3LtZ0Be+PVlRAPWLPMA0xRogsX+4Ii+vUWFoeF2q1ozeLUCOdgoAn
 k44V6CkPGYESJGsLzE9NrrAyYI5Q6Ke5D4ZAxxdI=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: , David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 no To-header on input <""@mail.ring0.de>
Content-Type: multipart/mixed; boundary="===============1905664887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1905664887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npowkfzrkjvkhl2r"
Content-Disposition: inline


--npowkfzrkjvkhl2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 04, 2019 at 10:35:57AM +0800, Fuqian Huang wrote:
> Several drivers cast a struct device pointer to a struct
> platform_device pointer only to then call platform_get_drvdata().
> To improve readability, these constructs can be simplified
> by using dev_get_drvdata() directly.
>=20
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---

Most of these instances no longer exist after my WIP patchset
converting omapdrm's DSI code to drm_panel. But that's no reason
to keep cleanups from being applied in the meantime:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Changes in v2:
>   - Make the commit message more clearly.
>=20
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gp=
u/drm/omapdrm/displays/panel-dsi-cm.c
> index 8edef8ef23b0..53240da139b1 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -407,8 +407,7 @@ static const struct backlight_ops dsicm_bl_ops =3D {
>  static ssize_t dsicm_num_errors_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> -	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct panel_drv_data *ddata =3D platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata =3D dev_get_drvdata(dev);
>  	struct omap_dss_device *src =3D ddata->src;
>  	u8 errors =3D 0;
>  	int r;
> @@ -439,8 +438,7 @@ static ssize_t dsicm_num_errors_show(struct device *d=
ev,
>  static ssize_t dsicm_hw_revision_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> -	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct panel_drv_data *ddata =3D platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata =3D dev_get_drvdata(dev);
>  	struct omap_dss_device *src =3D ddata->src;
>  	u8 id1, id2, id3;
>  	int r;
> @@ -506,8 +504,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
>  		struct device_attribute *attr,
>  		char *buf)
>  {
> -	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct panel_drv_data *ddata =3D platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata =3D dev_get_drvdata(dev);
>  	unsigned int t;
> =20
>  	mutex_lock(&ddata->lock);
> @@ -521,8 +518,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device=
 *dev,
>  		struct device_attribute *attr,
>  		const char *buf, size_t count)
>  {
> -	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct panel_drv_data *ddata =3D platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata =3D dev_get_drvdata(dev);
>  	struct omap_dss_device *src =3D ddata->src;
>  	unsigned long t;
>  	int r;
> @@ -553,8 +549,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device =
*dev,
>  		struct device_attribute *attr,
>  		char *buf)
>  {
> -	struct platform_device *pdev =3D to_platform_device(dev);
> -	struct panel_drv_data *ddata =3D platform_get_drvdata(pdev);
> +	struct panel_drv_data *ddata =3D dev_get_drvdata(dev);
>  	unsigned int t;
> =20
>  	mutex_lock(&ddata->lock);
> --=20
> 2.11.0
>=20

--npowkfzrkjvkhl2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0efG4ACgkQ2O7X88g7
+pryXQ/+MzjmTxMn4jix17AaoddfxsiTNWRHH1zxydcYU9EhTkHx7x0KSJs9flJ4
sMv8FSyUAF2hrID+I0y7Va5y7RTThEhKj/xOX3oGUcMQyjJoCqBCB/NL7wr2SXrl
5Rc7hDI4qYEQsFYUFFHidH1qiw9tUsOdd0QV+H/pjhRjouuubEHbVoR2fsAYosPH
5IShdwts2xG1bzPUqOmQyrzwFgwAzZEw3OLy0/nndyBzkMTQyHrGj6/xtjTIQ9to
vb8ZLHlY8P/X094lQLpsgvWeazcHYldCojSbGniRrE1CjhEFc8EhTtLuzn5WSlz0
W+mOEtDExZX1G0qayPf2FUvCS72eoPh3Z3I/GxxZVoQUPT02Ms2hMr02QS0AUttR
yZibIozlMwFcVb0CS5Hhesm2BTyfLlLeKxpSIg0vIPktCCHhZK2OIXquDM03wV0s
jc1vqlZ+hLOn1reTYbTf1A5Z3BVsCaWE/Etp2oy06AT9NbMKc/19lhzdH04ElJLd
bBFiHcJ5v1j+9yEf7mvenWHon1qF2jL909UqtjbBxVBwiWntdSkT5JluglzDOAFJ
WdTb1FNDjW+XSU3LzHs0GS8eOwhTnzmVYqzjdMPXlBCCVZXUO4LvkKyDbOdWUpXA
t7o7DWInhHvKkO3AmZNFNll5buReF5eyZQ+XlfCk7ftBWoIlwa8=
=B9Wc
-----END PGP SIGNATURE-----

--npowkfzrkjvkhl2r--

--===============1905664887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1905664887==--
