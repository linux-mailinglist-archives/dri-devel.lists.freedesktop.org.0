Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F98A87BFCF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2F10E529;
	Thu, 14 Mar 2024 15:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lp2A1u66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE4110E529;
 Thu, 14 Mar 2024 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710429837;
 bh=VNcT3RuFVLB5eXXbqaDWJMjkWNlBbyMqSBKU6p8wgjU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lp2A1u66JEpyrSUvs29wUITPceJmETVaB78xpcnLqIZSzr9EWBk4GtZGg/P1GugmO
 B9/4q1Un0O3e61gY6a1il0Jkj24pr5bCoIdTLoESOxDY0hUoh8zMhonkGmy9Cq1xsp
 aYZyTxP4ZJOEpDpNC3sAlDuPKndGeiVY1cqi3mTSt8WjO9TiaXwfP+zDlHIMlcoSRk
 WvgPLRKRXBFF5QT8C88hh+ggt+N8p5aulDc49tHeL6sZTvIXXjG8oLxgM8j4CpPMUL
 T144cmH6hCRHjwVKaurp38/+bcHzNNO+6ilRD62FUKZkDnMJtjMHa6DH8N0fa9R0Xs
 BQn8Yl6iJrmJw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 192B1378209A;
 Thu, 14 Mar 2024 15:23:57 +0000 (UTC)
Date: Thu, 14 Mar 2024 17:23:39 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <wayland-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH v4 23/42] drm/vkms: add 3x4 matrix in color pipeline
Message-ID: <20240314172339.4cbf3a7b.pekka.paalanen@collabora.com>
In-Reply-To: <20240226211100.100108-24-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-24-harry.wentland@amd.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Zg0taUTa7H5G5hF=l+3vTq";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9Zg0taUTa7H5G5hF=l+3vTq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Feb 2024 16:10:37 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> We add two 3x4 matrices into the VKMS color pipeline. The reason
> we're adding matrices is so that we can test that application
> of a matrix and its inverse yields an output equal to the input
> image.

You will test also cases where the matrix configuration will not
produce output equal to input, right?

Otherwise one can accidentally pass the matrix test by ignoring all
matrices.

> One complication with the matrix implementation has to do with
> the fact that the matrix entries are in signed-magnitude fixed
> point, whereas the drm_fixed.h implementation uses 2s-complement.
> The latter one is the one that we want for easy addition and
> subtraction, so we convert all entries to 2s-complement.
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
>  include/drm/drm_colorop.h            |  2 ++
>  3 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/v=
kms_colorop.c
> index d2db366da6d3..a0e54b2c1f7a 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -35,7 +35,37 @@ const int vkms_initialize_color_pipeline(struct drm_pl=
ane *plane, struct drm_pro
> =20
>  	prev_op =3D op;
> =20
> -	/* 2nd op: 1d curve */
> +	/* 2nd op: 3x4 matrix */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_ctm_3x4_init(dev, op, plane);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op =3D op;
> +
> +	/* 3rd op: 3x4 matrix */
> +	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret =3D drm_colorop_ctm_3x4_init(dev, op, plane);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op =3D op;
> +
> +	/* 4th op: 1d curve */
>  	op =3D kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>  	if (!op) {
>  		DRM_ERROR("KMS: Failed to allocate colorop\n");
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index d2101fa55aa3..8bbfce651526 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,6 +164,30 @@ static void apply_lut(const struct vkms_crtc_state *=
crtc_state, struct line_buff
>  	}
>  }
> =20
> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct =
drm_color_ctm_3x4 *matrix)
> +{
> +	s64 rf, gf, bf;
> +
> +	rf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b=
)) +
> +	     drm_sm2fixp(matrix->matrix[3]);

It would be nice if the driver had its private data for the matrix
colorop state, so it could convert the matrix only once when userspace
sets it.


Thanks,
pq

> +
> +	gf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b=
)) +
> +	     drm_sm2fixp(matrix->matrix[7]);
> +
> +	bf =3D drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel-=
>r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g=
)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->=
b)) +
> +	     drm_sm2fixp(matrix->matrix[11]);
> +
> +	pixel->r =3D drm_fixp2int(rf);
> +	pixel->g =3D drm_fixp2int(gf);
> +	pixel->b =3D drm_fixp2int(bf);
> +}
> +
>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_color=
op *colorop)
>  {
>  	/* TODO is this right? */
> @@ -185,6 +209,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixe=
l, struct drm_colorop *colo
>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state-=
>curve_1d_type);
>  				break;
>  		}
> +	} else if (colorop->type =3D=3D DRM_COLOROP_CTM_3X4) {
> +		if (colorop_state->data)
> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->d=
ata->data);
>  	}
> =20
>  }
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 4aee29e161d6..8710e550790c 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -224,6 +224,8 @@ int drm_colorop_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> =20
>  int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop=
 *colorop,
>  			      struct drm_plane *plane, u64 supported_tfs);
> +int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop =
*colorop,
> +			     struct drm_plane *plane);
> =20
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);


--Sig_/9Zg0taUTa7H5G5hF=l+3vTq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXzFnsACgkQI1/ltBGq
qqeW2hAAkswLaQZrCXe7Zsbze3mzvHrny69Hpvsuxej/HZMCJ9b5/9YHa6S4d/M4
7TWZpELcfMvIPMKKX+uuPCEl5jrBJ8r/dJkYxLl8ItL1hPTkPXk0kP64cI19qetL
VrpnplA2o5pGScHvA6uVY8hbtHfd5DzyTw59BtCi6ci4Jhof4m12WLLpo6Fw6WdT
Q1JC+0mqqdbU5Hqo+XmTIZOBv8KklksIWwGMZmnlj0V9sJ9thNKkebaFfWUR3/wu
QFe7y/bvuMZSPZVCSJIHzvEuyCEozsT9AHulFGARgAv/60ojbSWGsdAZQWNP3DIv
yXVgo4HqQX8PWABD7JwfCjrb5LFJTJw5E4HXyN/TYr0Hq85Ch5zx5VqF59sSca9I
pb7W1dVn4Mo8d8envYipWPwLUzFbTry8R+3+flbG7ELVp46T7NvX0dmp/31w9qNp
FrpXiNqIbaAhT7WkrgEEVdZjE6l3MwGxj6AJwgxck3nv7oOyLshvvVJ6v2mOKSIw
ulY3N7pGF+q44SRlwoSdFmzNl+aA69ebpTQhjMsmqu53ZpWCAganHN8II3LjEL/I
XW16zjrQWhCIQkK4fyAhkY3O1PQ8JyzAlmp2D4DDcAcjSpM3imJXzI8wIJv3jahT
7oM+T3K6tfxFz9iZ4iEwvMOWJTojjZCv4j7vsOb4sb/50jhc/k8=
=91hl
-----END PGP SIGNATURE-----

--Sig_/9Zg0taUTa7H5G5hF=l+3vTq--
