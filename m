Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A2A75E4F8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 23:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D90010E04F;
	Sun, 23 Jul 2023 21:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E16210E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 21:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GshofuGfB5p4EMzKeq9f7ZVdut7msmz0zC7bn5wMv9Y=; b=in81YV3AaW0zv58Pg794+36hFj
 7XOti55Bkj5D3zePnEHV/3XW1tr7UmuE1TDGjo+5854zMUYSrJGOe8JrFipRcHAdk+ztN8OtICy0p
 cd6HJ59bxNnuzU9V6Tqdc7032nhZUS31S+9Fuv1hsP7ZvBJf9dtuvSPNpVnEJoA9VBLSsKTo5O5dh
 GN3e7X84DLpGhkcM+eLLDT5XxQ4Vza5s+P5cSpcZppVp9Dt4rFda74PKbbrwJ4PD/U8taTkVNeg5F
 pBzvninmAwgurEYz3Ujos5VeLbMn5hgaOU/0ZnJf5WpebW8cJ0/PJhaTndcPobaaimreFSUa1ZciL
 2zndImnQ==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qNgCv-002hJ4-5b; Sun, 23 Jul 2023 23:01:37 +0200
Date: Sun, 23 Jul 2023 20:00:44 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2] drm/vkms: Implement all blend mode properties
Message-ID: <20230723210044.xwhbpxlyeu5wjphb@mail.igalia.com>
References: <20230723150132.130100-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c7fzbol5o4jsbfqa"
Content-Disposition: inline
In-Reply-To: <20230723150132.130100-1-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c7fzbol5o4jsbfqa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/23, Ma=EDra Canal wrote:
> Following the DRM assumption, VKMS currently assumes that the alpha is
> pre-multiplied. Moreover, it doesn't support the alpha property.
>=20
> So, first, implement the alpha property to VKMS and then, the blend
> mode property. In order to support all possible supported modes,
> change the pre_mul_blend_channel() function to check the plane blend
> mode and apply the correct blend formula, following the DRM
> convention, using the proper plane alpha value.
>=20
> Tested with igt@kms_plane_alpha_blend.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>=20
> v1 -> v2: https://lore.kernel.org/dri-devel/20230428122751.24271-1-mcanal=
@igalia.com/T/
>=20
> * Rebased on top of drm-misc-next.
>=20
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++++----------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
>  drivers/gpu/drm/vkms/vkms_plane.c    |  9 +++++
>  3 files changed, 42 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index d170a8e89b95..68a476461824 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,33 +12,47 @@
>=20
>  #include "vkms_drv.h"
>=20
> -static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> +static u16 blend_channel(struct vkms_frame_info *frame_info, u16 src, u1=
6 dst, u16 alpha)
>  {
>  	u32 new_color;
>=20
> -	new_color =3D (src * 0xffff + dst * (0xffff - alpha));
> +	switch (frame_info->pixel_blend_mode) {
> +	case DRM_MODE_BLEND_PIXEL_NONE:
> +		new_color =3D 0xffff * frame_info->alpha * src
> +			+ (0xfffe0001 - 0xffff * frame_info->alpha) * dst;
> +		break;
> +	case DRM_MODE_BLEND_COVERAGE:
> +		new_color =3D alpha * frame_info->alpha * src
> +			+ (0xfffe0001 - alpha * frame_info->alpha) * dst;
> +		break;
> +	case DRM_MODE_BLEND_PREMULTI:
> +	default:
> +		new_color =3D 0xffff * frame_info->alpha * src
> +			+ (0xfffe0001 - alpha * frame_info->alpha) * dst;

Hi Ma=EDra,

First, thank you for keep working on this feature and sorry for feedback
delay.

I didn't complete understand this 0xfffe0001 calculation. Could you
describe a little more (adding a comment here) each formula that you are
using here?

Also, as we are changing pixels of both outputs that are part of the
comparisons, but we just compare the CRC (not pixel by pixel). Did you
verify a sample of the pixels resulted from this calculation to check if
they make sense?

IIRC, we don't have a negative test for this property in
kms_plane_alpha_blend. In this sense, did you verify if the test fail
when setting a property value but using a different equation that not
correspond to the pixel blend mode setup? Overall the change makes
sense, but I tried some invalid scenarios and didn't get the expected
result.

Melissa

> +		break;
> +	}
>=20
> -	return DIV_ROUND_CLOSEST(new_color, 0xffff);
> +	return DIV_ROUND_CLOSEST(new_color, 0xfffe0001);
>  }
>=20
>  /**
> - * pre_mul_alpha_blend - alpha blending equation
> + * alpha_blend - alpha blending equation
>   * @frame_info: Source framebuffer's metadata
>   * @stage_buffer: The line with the pixels from src_plane
>   * @output_buffer: A line buffer that receives all the blends output
>   *
>   * Using the information from the `frame_info`, this blends only the
>   * necessary pixels from the `stage_buffer` to the `output_buffer`
> - * using premultiplied blend formula.
> + * using the adequate blend formula depending on the plane blend mode
> + * (see blend_channel()).
>   *
> - * The current DRM assumption is that pixel color values have been alrea=
dy
> - * pre-multiplied with the alpha channel values. See more
> - * drm_plane_create_blend_mode_property(). Also, this formula assumes a
> - * completely opaque background.
> + * By default, the current DRM assumption is that pixel color values have
> + * been already pre-multiplied with the alpha channel values. See more
> + * drm_plane_create_blend_mode_property().
>   */
> -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> -				struct line_buffer *stage_buffer,
> -				struct line_buffer *output_buffer)
> +static void alpha_blend(struct vkms_frame_info *frame_info,
> +			struct line_buffer *stage_buffer,
> +			struct line_buffer *output_buffer)
>  {
>  	int x_dst =3D frame_info->dst.x1;
>  	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> @@ -48,9 +62,9 @@ static void pre_mul_alpha_blend(struct vkms_frame_info =
*frame_info,
>=20
>  	for (int x =3D 0; x < x_limit; x++) {
>  		out[x].a =3D (u16)0xffff;
> -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> +		out[x].r =3D blend_channel(frame_info, in[x].r, out[x].r, in[x].a);
> +		out[x].g =3D blend_channel(frame_info, in[x].g, out[x].g, in[x].a);
> +		out[x].b =3D blend_channel(frame_info, in[x].b, out[x].b, in[x].a);
>  	}
>  }
>=20
> @@ -98,7 +112,7 @@ static void fill_background(const struct pixel_argb_u1=
6 *background_color,
>   * @stage_buffer: The line with the pixels from plane being blend to the=
 output
>   * @row_size: The size, in bytes, of a single row
>   *
> - * This function blends the pixels (Using the `pre_mul_alpha_blend`)
> + * This function blends the pixels (Using the `alpha_blend()`)
>   * from all planes, calculates the crc32 of the output from the former s=
tep,
>   * and, if necessary, convert and store the output to the writeback buff=
er.
>   */
> @@ -126,8 +140,7 @@ static void blend(struct vkms_writeback_job *wb,
>  				continue;
>=20
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> -					    output_buffer);
> +			alpha_blend(plane[i]->frame_info, stage_buffer, output_buffer);
>  		}
>=20
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index d25e0aae91f2..20e2c520885e 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -28,6 +28,8 @@ struct vkms_frame_info {
>  	struct drm_rect src, dst;
>  	struct drm_rect rotated;
>  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> +	u16 alpha;
> +	u16 pixel_blend_mode;
>  	unsigned int rotation;
>  	unsigned int offset;
>  	unsigned int pitch;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index e5c625ab8e3e..891aa566acda 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -113,6 +113,8 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>  	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
>  	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
> +	frame_info->alpha =3D new_state->alpha;
> +	frame_info->pixel_blend_mode =3D new_state->pixel_blend_mode;
>  	frame_info->fb =3D fb;
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->=
map));
>  	drm_framebuffer_get(frame_info->fb);
> @@ -212,6 +214,13 @@ struct vkms_plane *vkms_plane_init(struct vkms_devic=
e *vkmsdev,
>=20
>  	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>=20
> +	drm_plane_create_alpha_property(&plane->base);
> +
> +	drm_plane_create_blend_mode_property(&plane->base,
> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					     BIT(DRM_MODE_BLEND_PREMULTI)   |
> +					     BIT(DRM_MODE_BLEND_COVERAGE));
> +
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
>=20
> --
> 2.41.0
>=20

--c7fzbol5o4jsbfqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmS9lPEACgkQwqF3j0dL
ehz8NQ//Y04n/bMeS3jkwFxfqYiVv8ktZ4P1Sg9u8T6haQVMjemOy9AXNIE8J++B
4ccv7O8fU4Jy+tkZacPAdJiag8zt5u2ubMqMMvQYlaNbALObJ85j47OzI5CiU/1a
gixvL44WeUqjBXARwKRVV2s3jjfSaWis6ATGMQwdijMwrFjRH10JPHtOq0boFnLv
BMDRtyxAHVkKaym8m9wlOOnZFHzkl6sK5KK1D0/hHBi+ZdXNMZyimwMaSZwT+4bx
nC+FB5oyiO02rLlw57ZG1ZtHc0ldaW9ALCQtOTwdBt5g9e1sdBniw4LWgu6GgHk3
kIS8al9fNlQgPCqup9ZIKCthYZEoR+93RVUpuYvo+n1jDrWOUux911hkak8Qz2c2
LE7mU69TtCjqwmbyBhD0DlbANnb21ClkVfI9pjfm3yaOy6/L56+7+KxINLwEh1bg
iQRRZxYkv9K3cj6D6dQBC86e0GXYfp5mwksB8VdURHWpIqC3o9TQ2Pjpc4ST3b5W
LU5nVEnpz9cdus6qIyTDxpVkeqouO1h2iHkqoV8iyAcXqGcYCKmVRcp0rlBdWMHe
vxqrIX33AdjWO7F2oxzuGzCZDfe5DiFZdN98pvFbGwAXatwxGymPEikVWPP6Wkgw
yE33gawZtkLq5v4ZXVhinZ55btZObL3cCLreUJLR3NvToNRCwxM=
=qhB7
-----END PGP SIGNATURE-----

--c7fzbol5o4jsbfqa--
