Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9F488AAD
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 17:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345110E72F;
	Sun,  9 Jan 2022 16:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC510E72F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NB1Z0yHZKMGhriiPRaa97kHhXMlItl6eBPtBlgTrSL0=; b=aZhFpLgl0bi+fFeiXi/mu+RQU3
 xNNoOifq3UEPAQ4Jeg+bfAmiGix/Ps4fqYX2FEXZkmnIeYb4Ly+T/xYUwAy3VE/sPtKd3GCbKLD5N
 OL8IqpQoT8VCdXEmP3qHppmjl8i6bPyK927dOMGCjbGEVIPBVotUUKx4NRqxIZkoL30HN4jW6NVI6
 PIleImsRQrbp4i0BnqMgym6+mTiMZ/Fg4dUZaXQFz/ckPPMrpvhuwSlCjy1RSXYuACGUKpZhJXcMi
 PTNJQnI1ygT3OEd8doSDfBPtFzQP+81QdF0pbqP/yogUDUJ9pJ3fj9ZFsQfx7ZLgcHNoS4rnAJTxK
 cPL5o/Tg==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n6bPS-000C0e-I9; Sun, 09 Jan 2022 17:51:10 +0100
Date: Sun, 9 Jan 2022 15:50:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH RESEND v2 1/3] drm/vkms: refactor overlay plane creation
Message-ID: <20220109165044.vuq5cmxlejclkcsw@mail.igalia.com>
References: <20220107182809.141003-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wqwwygx25tnfipje"
Content-Disposition: inline
In-Reply-To: <20220107182809.141003-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wqwwygx25tnfipje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/07, Jos=E9 Exp=F3sito wrote:
> Move the logic to create an overlay plane to its own function.
> Refactor, no functional changes.
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vk=
ms_output.c
> index 04406bd3ff02..2e805b2d36ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -32,6 +32,21 @@ static const struct drm_connector_helper_funcs vkms_co=
nn_helper_funcs =3D {
>  	.get_modes    =3D vkms_conn_get_modes,
>  };
> =20
> +static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> +				  struct drm_crtc *crtc)
> +{
> +	struct vkms_plane *overlay;
> +
> +	overlay =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> +	if (IS_ERR(overlay))
> +		return PTR_ERR(overlay);
> +
> +	if (!overlay->base.possible_crtcs)
> +		overlay->base.possible_crtcs =3D drm_crtc_mask(crtc);
> +
> +	return 0;
> +}
> +
>  int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  {
>  	struct vkms_output *output =3D &vkmsdev->output;
> @@ -39,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int i=
ndex)
>  	struct drm_connector *connector =3D &output->connector;
>  	struct drm_encoder *encoder =3D &output->encoder;
>  	struct drm_crtc *crtc =3D &output->crtc;
> -	struct vkms_plane *primary, *cursor =3D NULL, *overlay =3D NULL;
> +	struct vkms_plane *primary, *cursor =3D NULL;
>  	int ret;
>  	int writeback;
> =20
> @@ -48,12 +63,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int =
index)
>  		return PTR_ERR(primary);
> =20
>  	if (vkmsdev->config->overlay) {
> -		overlay =3D vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> -		if (IS_ERR(overlay))
> -			return PTR_ERR(overlay);
> -
> -		if (!overlay->base.possible_crtcs)
> -			overlay->base.possible_crtcs =3D drm_crtc_mask(crtc);
> +		ret =3D vkms_add_overlay_plane(vkmsdev, index, crtc);
> +		if (ret)
> +			return ret;
lgtm, thanks!

Reviewed-by: Melissa Wen <mwen@igalia.com>
>  	}
> =20
>  	if (vkmsdev->config->cursor) {
> --=20
> 2.25.1
>=20

--wqwwygx25tnfipje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHbEmAACgkQwqF3j0dL
ehyaCg/+M1C59HICGAnfCqll4ijKGb4oBkbJzRZoz9Tj563Wm8AfnaU72zqCwMKG
2qth0O4blMQJUIZjVy65XJKYsPvXLcpHflH5wv18dUlDEXS+xVU2yRS95pdbe4mZ
ziBwhdy5MOc9j7lBVkpmtPX9l+u2GCnJ27uH+G7r/5sH2WKXBUjNTSq4YnQwwrJd
yVmCdSAlQ+MsAIWQLOKAgZrG4xTYuH6qiYjPGKeE4dIBQmKJJn6KtZTVRt2zOpwU
xisgfWSJTFbR+nhg6wtg0Cf+x5l5XhiF4oe2bg2wQj1mXAOdICMRPVGOxROMfqeM
wsw9XYppHroN6cYFOcDdPGXYwZxM5VlhjYO86Kl9SwOs5LuSlWWzm3MEfq6ZoCRp
oVZPSqm4d/AaLPoRpYI5A5ExRrJslrxv3rXlKffmaW1W3uN057DCL5b6R2yoMekO
lKr+8jG+sUuiE26W+w61TITWO7u2n4AkwsOk//RjIz5kln3NdHZv5H2AWG66bt5x
EcyXo0VtpNV04GGuTq+KvQDmeCM+c3/1vfxMr9ozio+e+5d6yq7pjLk1KjFWHWqx
ge4rAnTryYlQxB9FRU6jm8aDxD6RUrjK/VKt4ZNVS/k0lhmf6Ky9EjNbRzcZ/0Rx
OLMkVIOPY3fL84wW4ObE8V0qC6yiE1WAu7t5hoGN2dwqyf3kCJc=
=Yf6Q
-----END PGP SIGNATURE-----

--wqwwygx25tnfipje--
