Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27615A0B304
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE3410E5E0;
	Mon, 13 Jan 2025 09:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HMSIxxhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E210E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:35:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C2AF5C10AE;
 Mon, 13 Jan 2025 09:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53901C4CED6;
 Mon, 13 Jan 2025 09:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736760956;
 bh=JXvKg+yAQPpbhkfyw/7s/6FQ8o0I4eRr96Nnlm+Ndfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMSIxxhXNcvw7kQRH2Wx1ke5IHAaR3qUWcOpP26Iyk8dgihl1PcBeO8hObfBGaU4z
 beuIxI9kt3BoHGZ2ij9ImQR03ZPk5XGBjcIqSRxxTj1mXtrMEqWgHfHqWzfgqcyT4O
 7TIutcLVCfttM7OhagkLo2WRTMg/vy29NMqZVWpFu03I3jY2HZV8n1JEG2v5BhRWqR
 bNzXvXCMZtJGU0/GsvTIxh9Pc3yQgJDapVRZLXweqv+W48V/EwYEknVxNUiJNZIcA0
 xjk63o2qkjxNS4sz3dGuXPm5rgBHG3H93JLmWRMMGpSSDQviaEEn0xC9Yk2SPttyPZ
 5M5pcgSJVIuTQ==
Date: Mon, 13 Jan 2025 10:35:54 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
Message-ID: <20250113-piquant-lizard-of-strength-ee5760@houat>
References: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2gmo7y2gphsjm3cq"
Content-Disposition: inline
In-Reply-To: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
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


--2gmo7y2gphsjm3cq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/display: hdmi: Do not read EDID on disconnected
 connectors
MIME-Version: 1.0

On Sat, Jan 11, 2025 at 12:04:09AM +0200, Cristian Ciocaltea wrote:
> The recently introduced hotplug event handler in the HDMI Connector
> framework attempts to unconditionally read the EDID data, leading to a
> bunch of non-harmful, yet quite annoying DDC/I2C related errors being
> reported.
>=20
> Ensure the operation is performed only for connectors having the status
> connected or unknown.
>=20
> Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d5=
6db3221a00085b0 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_c=
onnector *connector,
>  	const struct drm_edid *drm_edid;
> =20
>  	if (status =3D=3D connector_status_disconnected) {
> +		drm_edid_connector_update(connector, NULL);

Why is this needed? It's not mentionned in your commit log.

>  		// TODO: also handle CEC and scramber, HDMI sink disconnected.
>  		drm_connector_hdmi_audio_plugged_notify(connector, false);
> +		return;
>  	}
> =20
>  	if (connector->hdmi.funcs->read_edid)

Maxime

--2gmo7y2gphsjm3cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4TeeQAKCRAnX84Zoj2+
dmb6AYCd9cXRpjKshMnpXyURxDVqUkm2EQnmIvckP3BOcJuQjQATSGZlhiM7OimB
n0Kr6nEBgNG7q9x5ZLwiujEtFlyzajgESKABpI7gUz3HNO+qkjVjKN14L2+Qf4gn
fBmAWOLMXA==
=y3YI
-----END PGP SIGNATURE-----

--2gmo7y2gphsjm3cq--
