Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF4CA61336
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55D710E9F8;
	Fri, 14 Mar 2025 13:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQtpx3E+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E911C10E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 13:57:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91FF35C3FEF;
 Fri, 14 Mar 2025 13:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B050AC4CEE3;
 Fri, 14 Mar 2025 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741960672;
 bh=Dt1Y8+HCCvJEAhz4M2H2OErQcY12lGpLspMVP4VqwZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQtpx3E+tS4Dlx3xwEiFpYOs9qiXnhVjzOFJHQ8s8oZvbbUQZgmh01jgrDkPX25m9
 RInTIjA7/oxQkBu1FhzzODu6ZQcSDwil3a82YTEHbR5SR67/YdvMiB+NMMY25suby/
 ZhjnYK4qxWj7/vqsQX4s0MVJ5Wu+nLPShVhrr4U9jvV8j+Uz73b+UL0EZiNms1ZlYi
 YyoKMPvjQDIkjphskAYDJqIqdFOWW9lODhojVcln4LwqXOsMJRwaAExp9pLhyaCVWo
 eqS0eI39KMxJAfqRkmBod37YtGkRw+n2ezKFxdWyE+KBT4emsVws+qphMg8u0dyX8h
 +UedhBSRIOyPw==
Date: Fri, 14 Mar 2025 14:57:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Message-ID: <20250314-abstract-brainy-parrot-2a6b93@houat>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-4-fbdb94f02562@collabora.com>
 <20250311-hypersonic-mature-leopard-d3afdc@houat>
 <c6f4233f-4a66-44c2-b962-9c80352bb7e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="a4qbuepxhsh2smfz"
Content-Disposition: inline
In-Reply-To: <c6f4233f-4a66-44c2-b962-9c80352bb7e1@collabora.com>
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


--a4qbuepxhsh2smfz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 08:59:00PM +0200, Cristian Ciocaltea wrote:
> >> +static int
> >> +hdmi_compute_config(const struct drm_connector *connector,
> >> +		    struct drm_connector_state *conn_state,
> >> +		    const struct drm_display_mode *mode)
> >> +{
> >> +	unsigned int max_bpc =3D clamp_t(unsigned int,
> >> +				       conn_state->max_bpc,
> >> +				       8, connector->max_bpc);
> >> +	int ret;
> >> +
> >> +	ret =3D hdmi_try_format(connector, conn_state, mode, max_bpc,
> >> +			      HDMI_COLORSPACE_RGB);
> >> +	if (!ret)
> >> +		return 0;
> >> +
> >> +	if (connector->ycbcr_420_allowed)
> >> +		ret =3D hdmi_try_format(connector, conn_state, mode, max_bpc,
> >> +				      HDMI_COLORSPACE_YUV420);
> >=20
> > I think that's conditioned on a few more things:
>=20
> I've actually expected this! :-)
>=20
> You've already raised some points during v1, but I preferred to restart t=
he
> discussion on updated code instead - sorry for taking so long to respin t=
he
> series.  In particular, I worked on [1] to improve handling of
> ycbcr_420_allowed flag and fix some consistency issues with
> HDMI_COLORSPACE_YUV420 advertised in drm_bridge->supported_formats.  Hence
> I assumed it's now safe to rely exclusively on this flag to indicate the
> connector is YUV420 capable, without doing any additional checks.
>=20
> >   - That the driver supports HDMI 2.0
>=20
> Probably I'm missing something obvious here, but is this necessary to
> actually double-check ycbcr_420_allowed has been set correctly?
>
> E.g. for bridges with DRM_BRIDGE_OP_HDMI set in drm_bridge->ops, the
> framework does already adjust ycbcr_420_allowed, hence any additional
> verification would be redundant.  When not making use of the framework,
> drivers are not expected to set the flag if they are not HDMI 2.0 complia=
nt
> or not supporting YUV420, right? Are there any other use cases we need to
> handle?

That's what I answered Dmitry as well, we can definitely make
ycbcr_420_allowed conditional on HDMI 2.0 support being implemented.
We'd have to check that it's properly set through
drmm_connector_hdmi_init tests too I guess.

> >   - That the display is an HDMI output
>=20
> I think this should be handled by sink_supports_format_bpc() via:
>=20
>     if (!info->is_hdmi &&
>         (format !=3D HDMI_COLORSPACE_RGB || bpc !=3D 8)) {
>             drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc=
\n");
>             return false;
>     }

Yeah, that makes sense.

> >   - That the mode is allowed YUV420 by the sink EDIDs
>=20
> And that would be handled via the changes introduced by "drm/connector:
> hdmi: Add support for YUV420 format verification".

ACK

Maxime

--a4qbuepxhsh2smfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9Q13QAKCRAnX84Zoj2+
dsmRAX9EtHDl6YO84MrS7lWMqfxMSH7FqkJGWWjBG6CB3xEsWUhENGQdsu1i9CQX
Gz8E/jcBfRgCnXTYItB4Ie2LNz81tFtHp/b1Sgk4pgsVeZhg0DuHPINrum340EhC
2PS0Q6HgeQ==
=BGna
-----END PGP SIGNATURE-----

--a4qbuepxhsh2smfz--
