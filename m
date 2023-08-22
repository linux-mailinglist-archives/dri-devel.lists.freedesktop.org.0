Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61788783E85
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDE010E2FC;
	Tue, 22 Aug 2023 11:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFAE10E2FC;
 Tue, 22 Aug 2023 11:03:00 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B3AFE660716C;
 Tue, 22 Aug 2023 12:02:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692702178;
 bh=UyunNXH6yKkBRuDdt6M7ZhaEIltdGhdy1lKxS6KpIOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z0uxHeKpZ/rm04D78lJJ1jd8/j2KyeoDzq5Cizt0ZFgU5uk2Jcqhi4Fo9r5ubhHwC
 /sOhVFIe7HjMpASac9+AlikiC2Qnt6+VLTwkA9L+P0nrCw19rbNVO0bgzABBJN2qkA
 FtS7ZTAY67vR6dmnl0axj01FHuQVL/Hg3Az1tD578/CfJUlcE27ixTxGL39Ad+6lr7
 VTgKVXdi7vs/Na+tcDUUWFA/SMBygxvPSqLBPfcXhMOKBnaz01st5/TPUiIpfTqSZ6
 C+lDAE+OgJ9j1wYUeT8cKoua5preu7r3AmCJb32RJogVXXR42xYVTtxf8JBgzfe4sM
 vJPvu2RNK6Hnw==
Date: Tue, 22 Aug 2023 14:02:42 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Message-ID: <20230822140242.162a843a.pekka.paalanen@collabora.com>
In-Reply-To: <20230810160314.48225-8-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PZG.R8OI8.zo.YkIvbKeWBU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/PZG.R8OI8.zo.YkIvbKeWBU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Aug 2023 15:02:47 -0100
Melissa Wen <mwen@igalia.com> wrote:

> Instead of relying on color block names to get the transfer function
> intention regarding encoding pixel's luminance, define supported
> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
> includes pure gamma or standardized transfer functions.
>=20
> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++----
>  2 files changed, 67 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index c749c9cb3d94..f6251ed89684 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_ip_b=
lock;
> =20
>  enum amdgpu_transfer_function {
>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
> -	AMDGPU_TRANSFER_FUNCTION_BT709,
> -	AMDGPU_TRANSFER_FUNCTION_PQ,
> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
>  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
>  	AMDGPU_TRANSFER_FUNCTION_UNITY,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
> +        AMDGPU_TRANSFER_FUNCTION_COUNT
>  };
> =20
>  struct dm_plane_state {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 56ce008b9095..cc2187c0879a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
>  }
> =20
>  #ifdef AMD_PRIVATE_COLOR
> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_lis=
t[] =3D {
> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
> +static const char * const
> +amdgpu_transfer_function_names[] =3D {
> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		=3D "Default",
> +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		=3D "Linear",

Hi,

if the below is identity, then what is linear? Is there a coefficient
(multiplier) somewhere? Offset?

> +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		=3D "Unity",

Should "Unity" be called "Identity"?

Doesn't unity mean that the output is always 1.0 regardless of input?

> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		=3D "sRGB EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		=3D "BT.709 EOTF",

BT.709 says about "Overall opto-electronic transfer characteristics at
source":

	In typical production practice the encoding function of image
	sources is adjusted so that the final picture has the desired
	look, as viewed on a reference monitor having the reference
	decoding function of Recommendation ITU-R BT.1886, in the
	reference viewing environment defined in Recommendation ITU-R
	BT.2035.

IOW, typically people tweak the encoding function instead of using
BT.709 OETF as is, which means that inverting the BT.709 OETF produces
something slightly unknown. The note about BT.1886 means that that
something is also not quite how it's supposed to be turned into light.

Should this enum item be "BT.709 inverse OETF" and respectively below a
"BT.709 OETF"?

What curve does the hardware actually implement?

The others seem fine to me.


Thanks,
pq

> +	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		=3D "PQ EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		=3D "Gamma 2.2 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		=3D "Gamma 2.4 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		=3D "Gamma 2.6 EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	=3D "sRGB inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF]	=3D "BT.709 inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		=3D "PQ inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	=3D "Gamma 2.2 inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	=3D "Gamma 2.4 inv_EOTF",
> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	=3D "Gamma 2.6 inv_EOTF",
>  };
> =20
> +static const u32 amdgpu_eotf =3D
> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
> +
> +static struct drm_property *
> +amdgpu_create_tf_property(struct drm_device *dev,
> +			  const char *name,
> +			  u32 supported_tf)
> +{
> +	u32 transfer_functions =3D supported_tf |
> +				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
> +				 BIT(AMDGPU_TRANSFER_FUNCTION_LINEAR) |
> +				 BIT(AMDGPU_TRANSFER_FUNCTION_UNITY);
> +	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
> +	int i, len;
> +
> +	len =3D 0;
> +	for (i =3D 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
> +		if ((transfer_functions & BIT(i)) =3D=3D 0)
> +			continue;
> +
> +		enum_list[len].type =3D i;
> +		enum_list[len].name =3D amdgpu_transfer_function_names[i];
> +		len++;
> +	}
> +
> +	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
> +					name, enum_list, len);
> +}
> +
>  int
>  amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>  {
> @@ -116,11 +157,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_devi=
ce *adev)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_lut_size_property =3D prop;
> =20
> -	prop =3D drm_property_create_enum(adev_to_drm(adev),
> -					DRM_MODE_PROP_ENUM,
> -					"AMD_PLANE_DEGAMMA_TF",
> -					amdgpu_transfer_function_enum_list,
> -					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
> +	prop =3D amdgpu_create_tf_property(adev_to_drm(adev),
> +					 "AMD_PLANE_DEGAMMA_TF",
> +					 amdgpu_eotf);
>  	if (!prop)
>  		return -ENOMEM;
>  	adev->mode_info.plane_degamma_tf_property =3D prop;


--Sig_/PZG.R8OI8.zo.YkIvbKeWBU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTkldIACgkQI1/ltBGq
qqeZHBAAggmhp9b3YkDDkS5T4pQcYvtaav3vbIiRwMCOVugngwZHyJGQu+C98kul
0SZgGPij759vtde+yShP3FMlaWC9q+Hq+MxFONFXQCfy/blJ4PT8R7lxkha2S9/A
cwy9s9f4SoICFFDLhXC9PBlE6rmLtBXast0uCDIaKunhgvuoMbFGn0X37by67kf4
27f3CKSzoZbwffBT5IiIqJSCzAps4T04Jn3GqhcBF+s0ANqOtU07xf5r7w9Tdbdf
hvW9YMGk0jGlgtLHdmWBlvQcb08ZQBPaMwCGwaNdT35W+5QmkJV1ehfm8OU7p2vu
gndToMgf6Wdm8LAKHgq9FhOBGFCZ0wQGIROaHGRW3xu7/f84QM8k6TwXLeNd4dQV
IBXi6eY+wR14mA4EjiHAs5fjqYiHw/AI4TIMLr+PwoO5XeSMwTTzdjjOTk60MUft
hcS6MoqN85wOC7JIgG2l6YFO3SLT1QVhA80WL9pQis1JNlADmtS6VhchVIQXJxtN
0ucedOr8lOWzrDQsSbreyJyayRJCojjmGlUck2YzkfVwDCm/nTuF63qACZWk/nbW
1fmfRla4UNf6ZB3zFTaEsdcCtGXHEVMs/goF8PVuLZ6Fvs/OPGCxY7i8D5+rQJv7
3cRFuuIwYnY28FZ8PUgxtC4a5WltxXejasdA3GJ91nl9us1mLMc=
=z/pU
-----END PGP SIGNATURE-----

--Sig_/PZG.R8OI8.zo.YkIvbKeWBU--
