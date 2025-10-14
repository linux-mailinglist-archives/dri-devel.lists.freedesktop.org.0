Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6241BDA6D3
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA010E646;
	Tue, 14 Oct 2025 15:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eFgPZ+MS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7CB10E647
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:36:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D589B44128;
 Tue, 14 Oct 2025 15:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B3FC4CEE7;
 Tue, 14 Oct 2025 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760456210;
 bh=/YUfdjKdfeGtY1dZaR19OtPFxA8hHN01woXntI4SbQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eFgPZ+MSp9EfV49h7v9dUh3B4dbfJLm5MnG5joDRmsP6pDZ5uBh3I1ZdLizN+CZ3q
 m1cxb6a3Qyddv+sTPqRAJTPq0cPmKbdoygtpT28ovBv14fKS/SRsRVrF4vNPVfJXoF
 5gmoEwcTxNU34P2IhcW8qlg/SnWBlTBeiAV0mLYHQqE385qmTzTQPEdWWtpnKaHUQN
 872Qg9omEw1frzwiHv7v/AHwgVORsViBV+e19uSGRaQVTc4zS1mzWYq6VG5hD0pyOK
 tA+8pw06CzsT3B4YjCHmn8wxq1isynN02Z/G97cruOhKEghlPWTCRsunDhQ3pODG31
 wqNiJW119uQvQ==
Date: Tue, 14 Oct 2025 17:36:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Bajjuri Praneeth <praneeth@ti.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 thomas.petazzoni@bootlin.com, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
Message-ID: <p4u2goyadub3dfuz4empf3g7a44b2ausy4hjjkcwj7nzgeochx@xztpij2i2lao>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4iewvzq6u4fbr2dv"
Content-Disposition: inline
In-Reply-To: <20251014143229.559564-1-kory.maincent@bootlin.com>
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


--4iewvzq6u4fbr2dv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
MIME-Version: 1.0

On Tue, Oct 14, 2025 at 04:32:28PM +0200, Kory Maincent wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
>=20
> The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> should only be called when the device has been successfully registered.
> Currently, these functions are called unconditionally in tilcdc_fini(),
> which causes warnings during probe deferral scenarios.
>=20
> [    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_stat=
e_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
> ...
> [    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_ge=
t_crtc_state+0x68/0x108
> [    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_=
all+0x90/0x1c8
> [    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shut=
down+0x90/0x144
> [    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [ti=
lcdc]
> [    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [t=
ilcdc]
>=20
> Fix this by moving both drm_kms_helper_poll_fini() and
> drm_atomic_helper_shutdown() inside the priv->is_registered conditional
> block, ensuring they only execute after successful device registration.
>=20
> Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/=
remove time for misc drivers")
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc=
/tilcdc_drv.c
> index 7caec4d38ddf..2031267a3490 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -172,11 +172,11 @@ static void tilcdc_fini(struct drm_device *dev)
>  	if (priv->crtc)
>  		tilcdc_crtc_shutdown(priv->crtc);
> =20
> -	if (priv->is_registered)
> +	if (priv->is_registered) {
>  		drm_dev_unregister(dev);
> -
> -	drm_kms_helper_poll_fini(dev);
> -	drm_atomic_helper_shutdown(dev);
> +		drm_kms_helper_poll_fini(dev);
> +		drm_atomic_helper_shutdown(dev);
> +	}
>  	tilcdc_irq_uninstall(dev);
>  	drm_mode_config_cleanup(dev);

I don't think that's the right fix. tilcdc_fini is pretty complex
because it gets called from multiple locations with various level of
initialisation.

This is done because tilcdc_init is using a bunch of deprecated
functions with better alternatives now, and those would make the job of
tilcdc_fini much easier.

That's what we should be focusing on.

Maxime

--4iewvzq6u4fbr2dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaO5uCwAKCRAnX84Zoj2+
dr+eAX42SDkP/0toMISYSvfTyiOHtxzqHbO1OxqawFccTWPPAa41BPko8DDctGGp
70sAZ7kBgKUUeVJsaKqB2Kz6eCBBvqBNFu2wItXPGUN9HecAePzPPjHm1sXdLJSP
RsAMCvDnWA==
=mxvO
-----END PGP SIGNATURE-----

--4iewvzq6u4fbr2dv--
