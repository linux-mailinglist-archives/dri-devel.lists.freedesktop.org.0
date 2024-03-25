Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21A889FD2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7B610E52A;
	Mon, 25 Mar 2024 12:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M37s5wTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C0210E874
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711370464;
 bh=FAsccTeZhucSZ59YuHB1ENsxOd0oCDKEebN1xlHLIp8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M37s5wTn9Hq7EmBlmH7ymwqvLOD22tK4CNg6PO7x9KYevSBWLtuh1SKmAWQfLCq1X
 Detxh++HweAFgQs76lNsxmXXIH28pLk6pVrz0Ew7N77KhJCrxVgVR22p6tZicqt9Si
 I5p9p0WksYZScjhW5z/Sul+w0CTrKgL13OwHyQtrLn2l6p+VY52svh+k1IPsmNNFoN
 vqo9wlK4bYmfidTeGhUY/AvEpyhzU7MQMhX+p40u/wSx5SUt77UW6boMARGTISnxMd
 ttm79XxiylJoYLsg55RdcZNAxSKuk7UiZWJKSNOaALRpDiOknKoK52qa9H5E0oc1VO
 cs//8d8pKuZAQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 609E73782046;
 Mon, 25 Mar 2024 12:41:03 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:41:01 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 08/16] drm/vkms: Avoid computing blending limits
 inside pre_mul_alpha_blend
Message-ID: <20240325144101.6d9fcf7e.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-8-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-8-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9APbTbiqXZhJVkw2EqE3nfe";
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

--Sig_/9APbTbiqXZhJVkw2EqE3nfe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:02 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
> different concepts (coordinate calculation and color management), extract
> the x_limit and x_dst computation outside of this helper.
> It also increases the maintainability by grouping the computation related
> to coordinates in the same place: the loop in `blend`.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------=
------
>  1 file changed, 19 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index da0651a94c9b..9254086f23ff 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u1=
6 alpha)
> =20
>  /**
>   * pre_mul_alpha_blend - alpha blending equation
> - * @frame_info: Source framebuffer's metadata
>   * @stage_buffer: The line with the pixels from src_plane
>   * @output_buffer: A line buffer that receives all the blends output
> + * @x_start: The start offset to avoid useless copy

I'd say just:

+ * @x_start: The start offset

It describes the parameter, and the paragraph below explains the why.

It would be explaining, that x_start applies to output_buffer, but
input_buffer is always read starting from 0.

> + * @count: The number of byte to copy

You named it pixel_count, and it counts pixels, not bytes. It's not a
copy but a blend into output_buffer.

>   *
> - * Using the information from the `frame_info`, this blends only the
> - * necessary pixels from the `stage_buffer` to the `output_buffer`
> - * using premultiplied blend formula.
> + * Using @x_start and @count information, only few pixel can be blended =
instead of the whole line
> + * each time.
>   *
>   * The current DRM assumption is that pixel color values have been alrea=
dy
>   * pre-multiplied with the alpha channel values. See more
>   * drm_plane_create_blend_mode_property(). Also, this formula assumes a
>   * completely opaque background.
>   */
> -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> -				struct line_buffer *stage_buffer,
> -				struct line_buffer *output_buffer)
> +static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
> +				struct line_buffer *output_buffer, int x_start, int pixel_count)
>  {
> -	int x_dst =3D frame_info->dst.x1;
> -	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> -	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> -			    stage_buffer->n_pixels);
> -
> -	for (int x =3D 0; x < x_limit; x++) {
> -		out[x].a =3D (u16)0xffff;
> -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> +	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> +	const struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> +
> +	for (int i =3D 0; i < pixel_count; i++) {
> +		out[i].a =3D (u16)0xffff;
> +		out[i].r =3D pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> +		out[i].g =3D pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> +		out[i].b =3D pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
>  	}
>  }
> =20
> @@ -183,7 +179,7 @@ static void blend(struct vkms_writeback_job *wb,
>  {
>  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
>  	u32 n_active_planes =3D crtc_state->num_active_planes;
> -	int y_pos;
> +	int y_pos, x_dst, x_limit;
> =20
>  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> =20
> @@ -201,14 +197,16 @@ static void blend(struct vkms_writeback_job *wb,
> =20
>  		/* The active planes are composed associatively in z-order. */
>  		for (size_t i =3D 0; i < n_active_planes; i++) {
> +			x_dst =3D plane[i]->frame_info->dst.x1;
> +			x_limit =3D min_t(size_t, drm_rect_width(&plane[i]->frame_info->dst),
> +					stage_buffer->n_pixels);

Are those input values to min_t() really of type size_t? Or why is
size_t here?

>  			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> =20
>  			if (!check_limit(plane[i]->frame_info, y_pos))
>  				continue;
> =20
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> -					    output_buffer);
> +			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, x_limit);

I thought it was a count, not a limit?

"Limit" sounds to me like "end", and end - start =3D count.

>  		}
> =20
>  		apply_lut(crtc_state, output_buffer);
>=20

The details aside, this is a good move.


Thanks,
pq

--Sig_/9APbTbiqXZhJVkw2EqE3nfe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBcN4ACgkQI1/ltBGq
qqf9IQ/+Pcr4R55GcjK2/Og2VmUsftfIGVQnY55IDdeFCDAoP/m/hxr25iWgVe2d
CHe5vBsPaBAl2SRTtjXZBtmImOFl8o2TgZKdAlLU0ydsWtSiXAj7wtKKbowglJwA
da6N7lDD5lx1ZjNE/+fujnk/mwt1M/0zSjkv69IuAGN8u5scN9DGPxTZ7ICNmrvK
5uWWNsK+eoIB7w/vTvDPo1nfth887BH8c9kFs36CxP/HVXe4+E/RevV2bSrw1xEP
9XYZKOf+humggSp4oiBmFBADlr9TAoMH/bLhQxWrQrYDz4puL7wqTNR3/zyTWx5X
bpD4XZSquJ2x+RrFZpnIiA6cUf6/SZZXUOvLcA9Y952M8SIRcdwoCCitf189zBoH
9NCxqdtOjXuOzoFsvxTsYP1BUHQHzDNqEdoGpbIHt0G0zjyQjExdC0GCUN4tV7r4
ylG/oqxmjpLGw6B4oRumOymvpRJAwmzz0XmbDO7a1rVOYXEFAtO5m77UN4vOR8T1
gesuTbEbDlyzJQ70+snWSsuIM0VHsdeXJAEeo0U4Ye3ExfDIu9NKNh4mk+jUg5vg
YsQI+Lrhv3l/IWj6y/Y6T4wu/LkXtvGUrmgsLKx1BidifbWjd9Ur4YT7FVAmHQIE
acXpdjAcONbS+L9HwaakNhCNSd3QmsOfypok9JdnY2Tf0/Bbwwc=
=ZLe8
-----END PGP SIGNATURE-----

--Sig_/9APbTbiqXZhJVkw2EqE3nfe--
