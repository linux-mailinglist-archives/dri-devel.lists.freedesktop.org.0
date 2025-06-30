Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE964AED534
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0D010E1FD;
	Mon, 30 Jun 2025 07:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hK2MG/y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6110E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 07:07:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E894FA52610;
 Mon, 30 Jun 2025 07:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16416C4CEE3;
 Mon, 30 Jun 2025 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751267273;
 bh=KcZ4zWW5lodhi1meEhBLKNd5QpZdHD6vUuWeW21cOgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hK2MG/y/Iw3887a5c/sEIz65XBDtcLZGk4r6wPMSyCayRzLJHrNBX86V7MoUbJUlW
 9uMc+axFzu7wnF+/kFmfMIga+gnB4Np6RgAHS2kd4uvSwsgvaIrOsMmJw4SjIyKhGG
 dY8XAiVE00O1OSjAVgWPjHq/O5heflG4z8zq+ZoEF9VWS6CN4C+dm2kF58cUPLeWFs
 /ifJC6hFzWQ+CIxvh6v49Lzccy69jzYS32JoS01tFdItGymg+AqIZkuOmc7Qov7iPO
 2kSoXSZDyMuU7FjpoxB5GzQF5gWfo2+lJBhp185Kj7cAbE3FTelrGw1isUh6FQS2fA
 +X/LCJ/KqavBQ==
Date: Mon, 30 Jun 2025 09:07:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
Message-ID: <20250630-venomous-sheep-of-control-dece32@houat>
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2qd32z6lhky5r2jd"
Content-Disposition: inline
In-Reply-To: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
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


--2qd32z6lhky5r2jd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
MIME-Version: 1.0

Hi,

On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> DRM checks EDID block count against allocated size in drm_edid_valid
> function. We have to allocate the right EDID size instead of the max
> size to prevent the EDID to be reported as invalid.
>=20
> Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 8a9079c2ed5c..5a81d1bfc815 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(str=
uct anx7625_data *ctx)
>  		return NULL;
>  	}
> =20
> -	ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
> +	ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num * ONE_BLOCK_=
SIZE);
>  	kfree(edid_buf);

Do we need to cache the whole EDIDs? AFAIU, it's only ever used to get
the manufacturer name, which fits into a u32 / 4 u8. We should probably
just cache that.

Maxime

--2qd32z6lhky5r2jd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGI3xgAKCRAnX84Zoj2+
drvjAYC+ESfwxY/plmv4eNrGvEXvmnE6xrSlZbfF9sHmlZlT33ETA63fx56HbNTM
H8dbHD8Bf3gItJLZJNwkhrNByk3UfNwBcbfN6X8rCNTG3US6uM6srcfj6JYyfwFV
a3aVt6/Wqw==
=SuXV
-----END PGP SIGNATURE-----

--2qd32z6lhky5r2jd--
