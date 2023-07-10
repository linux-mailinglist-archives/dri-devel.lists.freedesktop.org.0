Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3374D0B1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D928310E23C;
	Mon, 10 Jul 2023 08:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEA310E23C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:57:33 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D59626606FF7;
 Mon, 10 Jul 2023 09:57:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688979450;
 bh=FnvpISxdVnRNhrwPhxC+0k4bLKZXdcNEO4ygcToLl4k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lQ6Ano0wZyo/0ea6eiF7yfssoz0pBpgJA2cbeN8OOEXyLDDU27bOQHOxls1JILeAh
 Qmd4X8u6yL2LququxRfH02en4cYpF5j/G++5OhdOGCrEiMDXgJonEySFyz9krEgryZ
 UIWVKX0/jZqwwIJd0giS8pcYE+aFM6Vj+1nrCrFxuW+K1n1D2oBLozpCOEu8OkS706
 N0hgoqedUVSgP+nI7V4SBRjvd/hG62Cx6OiGxI2C4wHbHHijevJhqf9ren2X2Qqcxp
 ccn3ncP/ZirQZl1RvVI1gh4TnuM0kblWhqbNpIDrBJ+b0lcc58kqQ8sOUdray60c9R
 5bFyewUd8ADCQ==
Date: Mon, 10 Jul 2023 11:57:26 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v5] drm/vkms: Add support to 1D gamma LUT
Message-ID: <20230710115726.5962ae97.pekka.paalanen@collabora.com>
In-Reply-To: <20230709013835.161004-1-arthurgrillo@riseup.net>
References: <20230709013835.161004-1-arthurgrillo@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, mdaenzer@redhat.com,
 dri-devel@lists.freedesktop.org, victoria@system76.com, mwen@igalia.com,
 mairacanal@riseup.net, jadahl@redhat.com, uma.shankar@intel.com,
 sebastian.wick@redhat.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat,  8 Jul 2023 22:38:35 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Support a 1D gamma LUT with interpolation for each color channel on the
> VKMS driver. Add a check for the LUT length by creating
> vkms_atomic_check().
>=20
> Enable VKMS to run the test igt@kms_plane@pixel-format.
>=20
> Tested with:
> igt@kms_color@gamma
> igt@kms_color@legacy-gamma
> igt@kms_color@invalid-gamma-lut-sizes
>=20
> v2:
>     - Add interpolation between the values of the LUT (Simon Ser)
>=20
> v3:
>     - s/ratio/delta (Pekka)
>     - s/color_channel/channel_value (Pekka)
>     - s/lut_area/lut_channel
>     - Store the `drm_color_lut`, `lut_length`, and
>       `channel_value2index_ratio` inside a struct called `vkms_lut`
>       (Pekka)
>     - Pre-compute some constants values used through the LUT procedure
>       (Pekka)
>     - Change the switch statement to a cast to __u16* (Pekka)
>     - Make the apply_lut_to_channel_value return the computation result
>       (Pekka)
>=20
> v4:
>     - Add a comment explaining that `enum lut_area` depends on the
>       layout of `struct drm_color_lut` (Pekka)
>     - Remove unused variable (kernel test robot)
>=20
> v5:
>     - Mention that this will make it possible to run the test
>       igt@kms_plane@pixel-format (Ma=C3=ADra)
>     - s/had/has (Ma=C3=ADra)
>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
> ---
> Ma=C3=ADra asked me to run a benchmark on some IGT tests:
>=20
> Each test ran 100 times. The result with 'X' are tests that were not able=
 to
> run because of the absence of gamma LUT.
>=20
> +--------------------------------------------------+-----------+---------=
--------+---------------+
> | Test                                             |  No LUT   | Unoptimi=
zed LUT | Optimized LUT |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_rotation@primary-rotation-180            | 174.298s  |    181.1=
30s     |   178.800s    |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@pixel-format                       |    X      |    1420.=
453s    |   1218.229s   |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@pixel-format-source-clamping       |    X      |    704.2=
36s     |   612.318s    |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-position-covered             | 12.535s   |    12.86=
4s      |   12.025s     |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-position-hole                | 11.752s   |    12.87=
3s      |   11.202s     |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-position-hole-dpms           | 15.188s   |    15.23=
8s      |   15.652s     |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-panning-top-left             | 10.797s   |    11.87=
3s      |   11.041s     |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-bottom-right                 | 10.764s   |    11.61=
3s      |   10.053s     |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_plane@plane-panning-bottom-right-suspend | 2011.344s |    2009.=
410s    |   2011.496s   |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_cursor_crc@cursor-onscreen-512x5112      | 359.209s  |    337.8=
30s     |   308.168s    |
> + -------------------------------------------------+-----------+---------=
--------+---------------+
> | igt@kms_color@gamma                              |    X      |    137.7=
02s     |   118.139s    |
> + -------------------------------------------------+-----------+---------=
--------+---------------+

Hi Arthur,

comparing "No LUT" with "Optimized LUT", both have essentially the same
numbers where "No LUT" has a number to begin with. This is good,
because it means that adding the new feature does not penalize cases
where the new feature is not used. On the other hand, there is a small
chance that these measurements could be dominated by something we do
not expect, meaning that they are not measuring what we are interested
in. The cases where "Optimized LUT" is faster than "No LUT" hint that
there could be significant overhead and variance included in the
measurements, because adding this feature should not make anything
faster AFAICT.

It's impossible to evalute the difference between "Unoptimized LUT" vs.
"Optimized LUT" other than it is in the right direction at least,
because we have no idea how much of the total time is spent doing
unrelated work like initializing IGT for example.

In summary, this looks good, even though one cannot say how good.


Thanks,
pq

>=20
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 86 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +
>  drivers/gpu/drm/vkms/vkms_drv.c      | 20 ++++++-
>  drivers/gpu/drm/vkms/vkms_drv.h      |  9 +++
>  4 files changed, 117 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 906d3df40cdb..e3a79dcd2e38 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_fixed.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <linux/minmax.h>
> @@ -89,6 +90,73 @@ static void fill_background(const struct pixel_argb_u1=
6 *background_color,
>  		output_buffer->pixels[i] =3D *background_color;
>  }
> =20
> +// lerp(a, b, t) =3D a + (b - a) * t
> +static u16 lerp_u16(u16 a, u16 b, s64 t)
> +{
> +	s64 a_fp =3D drm_int2fixp(a);
> +	s64 b_fp =3D drm_int2fixp(b);
> +
> +	s64 delta =3D drm_fixp_mul(b_fp - a_fp,  t);
> +
> +	return drm_fixp2int(a_fp + delta);
> +}
> +
> +static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_v=
alue)
> +{
> +	s64 color_channel_fp =3D drm_int2fixp(channel_value);
> +
> +	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
> +}
> +
> +/*
> + * This enum is related to the positions of the variables inside
> + * `struct drm_color_lut`, so the order of both needs to be the same.
> + */
> +enum lut_channel {
> +	LUT_RED =3D 0,
> +	LUT_GREEN,
> +	LUT_BLUE,
> +	LUT_RESERVED
> +};
> +
> +static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, =
u16 channel_value,
> +				      enum lut_channel channel)
> +{
> +	s64 lut_index =3D get_lut_index(lut, channel_value);
> +
> +	/*
> +	 * This checks if `struct drm_color_lut` has any gap added by the compi=
ler
> +	 * between the struct fields.
> +	 */
> +	static_assert(sizeof(struct drm_color_lut) =3D=3D sizeof(__u16) * 4);
> +
> +	u16 *floor_lut_value =3D (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	u16 *ceil_lut_value =3D (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index=
)];
> +
> +	u16 floor_channel_value =3D floor_lut_value[channel];
> +	u16 ceil_channel_value =3D ceil_lut_value[channel];
> +
> +	return lerp_u16(floor_channel_value, ceil_channel_value,
> +			lut_index & DRM_FIXED_DECIMAL_MASK);
> +}
> +
> +static void apply_lut(const struct vkms_crtc_state *crtc_state, struct l=
ine_buffer *output_buffer)
> +{
> +	if (!crtc_state->gamma_lut.base)
> +		return;
> +
> +	if (!crtc_state->gamma_lut.lut_length)
> +		return;
> +
> +	for (size_t x =3D 0; x < output_buffer->n_pixels; x++) {
> +		struct pixel_argb_u16 *pixel =3D &output_buffer->pixels[x];
> +
> +		pixel->r =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>r, LUT_RED);
> +		pixel->g =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>g, LUT_GREEN);
> +		pixel->b =3D apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel-=
>b, LUT_BLUE);
> +	}
> +}
> +
>  /**
>   * @wb_frame_info: The writeback frame buffer metadata
>   * @crtc_state: The crtc state
> @@ -128,6 +196,8 @@ static void blend(struct vkms_writeback_job *wb,
>  					    output_buffer);
>  		}
> =20
> +		apply_lut(crtc_state, output_buffer);
> +
>  		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
>  		if (wb)
> @@ -242,6 +312,22 @@ void vkms_composer_worker(struct work_struct *work)
>  	crtc_state->frame_start =3D 0;
>  	crtc_state->frame_end =3D 0;
>  	crtc_state->crc_pending =3D false;
> +
> +	if (crtc->state->gamma_lut) {
> +		s64 max_lut_index_fp;
> +		s64 u16_max_fp =3D drm_int2fixp(0xffff);
> +
> +		crtc_state->gamma_lut.base =3D (struct drm_color_lut *)crtc->state->ga=
mma_lut->data;
> +		crtc_state->gamma_lut.lut_length =3D
> +			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
> +		max_lut_index_fp =3D drm_int2fixp(crtc_state->gamma_lut.lut_length  - =
1);
> +		crtc_state->gamma_lut.channel_value2index_ratio =3D drm_fixp_div(max_l=
ut_index_fp,
> +									       u16_max_fp);
> +
> +	} else {
> +		crtc_state->gamma_lut.base =3D NULL;
> +	}
> +
>  	spin_unlock_irq(&out->composer_lock);
> =20
>  	/*
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 515f6772b866..61e500b8c9da 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -290,6 +290,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm=
_crtc *crtc,
> =20
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> =20
> +	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> +	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
> +
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index e3c9c9571c8d..dd0af086e7fa 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -120,9 +120,27 @@ static const struct drm_driver vkms_driver =3D {
>  	.minor			=3D DRIVER_MINOR,
>  };
> =20
> +static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_s=
tate *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +	int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
> +			continue;
> +
> +		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
> +		    > VKMS_LUT_SIZE)
> +			return -EINVAL;
> +	}
> +
> +	return drm_atomic_helper_check(dev, state);
> +}
> +
>  static const struct drm_mode_config_funcs vkms_mode_funcs =3D {
>  	.fb_create =3D drm_gem_fb_create,
> -	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_check =3D vkms_atomic_check,
>  	.atomic_commit =3D drm_atomic_helper_commit,
>  };
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 5f1a0a44a78c..f16b5d7b81ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -23,6 +23,8 @@
> =20
>  #define NUM_OVERLAY_PLANES 8
> =20
> +#define VKMS_LUT_SIZE 256
> +
>  struct vkms_frame_info {
>  	struct drm_framebuffer *fb;
>  	struct drm_rect src, dst;
> @@ -65,6 +67,12 @@ struct vkms_plane {
>  	struct drm_plane base;
>  };
> =20
> +struct vkms_color_lut {
> +	struct drm_color_lut *base;
> +	size_t lut_length;
> +	s64 channel_value2index_ratio;
> +};
> +
>  /**
>   * vkms_crtc_state - Driver specific CRTC state
>   * @base: base CRTC state
> @@ -80,6 +88,7 @@ struct vkms_crtc_state {
>  	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
>  	struct vkms_writeback_job *active_writeback;
> +	struct vkms_color_lut gamma_lut;
> =20
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;

