Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEA07FDD02
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF5310E634;
	Wed, 29 Nov 2023 16:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B81A10E634
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 16:30:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B12651BF208;
 Wed, 29 Nov 2023 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701275417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/5phH+NWca6vO6DsnXe7wUBvA81AFYisV2L/kDFT6k=;
 b=G+h5r0nMmI6Ybe5EPT0HmDD1OzGDsoyQFXXcImKcuX1JkwKqU67CH3q9xLMU0JnVihJjnF
 2RJ4hjtsetiEjnXUXIH4omufcHIv6TRzcUyY3hORrrHHROdTmmkPVDqlaAsBT2d0ZTY2kn
 stoMxczfeNy1UBUdIG33or6OuHxWoFa9leyq7XbSZS9QH5yynWevf7h4g5kpaJg6gj0YUK
 FjtVwsG65OiUAdt31Pum3aGyk+E1D/PN5QSLLRM7qK4kaHik/9MDchNPZE3UCppObb/LMv
 mvoG9y0Xw28F71ypTxG31LuehTUaHJJ94mP9x0IdD96Rzqu5fs6etPvic+4fdA==
Date: Wed, 29 Nov 2023 17:30:15 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH 2/2] drm/tiny: Add driver for the sharp LS027B7DH01
 Memory LCD
Message-ID: <ZWdnFxr8RNvYFjXy@aptenodytes>
References: <cover.1701267411.git.mehdi.djait@bootlin.com>
 <71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cse+O5W+0oAb9vAR"
Content-Disposition: inline
In-Reply-To: <71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.belloni@bootlin.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 luca.ceresoli@bootlin.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cse+O5W+0oAb9vAR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mehdi,

See a few comments about this new driver below.

On Wed 29 Nov 23, 15:29, Mehdi Djait wrote:
> Introduce a DRM driver for the sharp LS027B7DH01 Memory LCD.
>=20
> LS027B7DH01 is a 2.7" 400x240 monochrome display connected to a SPI bus.
> The drivers

Typo here: "driver".

> implements the Multiple Lines Data Update Mode.

This sounds like a fancy vendor-specific way to say that you are updating a=
ll
the lines at once instead of a target crop rectangle. The wording could be
clarified here and you shouldn't assume people are familiar with the vendor=
's
terminology.

> External COM inversion is enabled using a PWM signal as input.

What is this external com inversion about and why should we care about it?

> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> ---
>  MAINTAINERS                              |   7 +
>  drivers/gpu/drm/tiny/Kconfig             |   8 +
>  drivers/gpu/drm/tiny/Makefile            |   1 +
>  drivers/gpu/drm/tiny/sharp-ls027b7dh01.c | 411 +++++++++++++++++++++++
>  4 files changed, 427 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 012df8ccf34e..fb859698bd3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6832,6 +6832,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
>  F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> =20
> +DRM DRIVER FOR SHARP LS027B7DH01 Memory LCD
> +M:	Mehdi Djait <mehdi.djait@bootlin.com>
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/sharp,ls027b7dh01.yaml
> +F:	drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> +
>  DRM DRIVER FOR SITRONIX ST7586 PANELS
>  M:	David Lechner <david@lechnology.com>
>  S:	Maintained
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f6889f649bc1..a2ade06403ca 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -186,6 +186,14 @@ config TINYDRM_REPAPER
> =20
>  	  If M is selected the module will be called repaper.
> =20
> +config TINYDRM_SHARP_LS027B7DH01
> +	tristate "DRM support for SHARP LS027B7DH01 display"
> +	depends on DRM && SPI
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	help
> +	  DRM driver for the SHARP LS027B7DD01 LCD display.
> +
>  config TINYDRM_ST7586
>  	tristate "DRM support for Sitronix ST7586 display panels"
>  	depends on DRM && SPI
> diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> index 76dde89a044b..b05df3afb231 100644
> --- a/drivers/gpu/drm/tiny/Makefile
> +++ b/drivers/gpu/drm/tiny/Makefile
> @@ -14,5 +14,6 @@ obj-$(CONFIG_TINYDRM_ILI9341)		+=3D ili9341.o
>  obj-$(CONFIG_TINYDRM_ILI9486)		+=3D ili9486.o
>  obj-$(CONFIG_TINYDRM_MI0283QT)		+=3D mi0283qt.o
>  obj-$(CONFIG_TINYDRM_REPAPER)		+=3D repaper.o
> +obj-$(CONFIG_TINYDRM_SHARP_LS027B7DH01)	+=3D sharp-ls027b7dh01.o

Looks like other drivers in this directory don't include the vendor name as
a prefix so it would be best to do the same for consistency.

On the other hand it looks like drm/panel does it always. While the two are
not consistent with eachother, I think it's best to keep local consistency,
so align with what other files are doing in the same directory.

>  obj-$(CONFIG_TINYDRM_ST7586)		+=3D st7586.o
>  obj-$(CONFIG_TINYDRM_ST7735R)		+=3D st7735r.o
> diff --git a/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c b/drivers/gpu/drm/t=
iny/sharp-ls027b7dh01.c
> new file mode 100644
> index 000000000000..2f58865a5c78
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/sharp-ls027b7dh01.c
> @@ -0,0 +1,411 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Sharp LS027B7DH01 Memory Display Driver
> + *
> + * Copyright (C) 2023 Andrew D'Angelo
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + *
> + * The Sharp Memory LCD requires an alternating signal to prevent the bu=
ildup of
> + * a DC bias that would result in a Display that no longer can be update=
d. Two
> + * modes for the generation of this signal are supported:
> + *
> + * Software, EXTMODE =3D Low: toggling the BIT(1) of the Command and wri=
ting it at
> + * least once a second to the display.
> + *
> + * Hardware, EXTMODE =3D High: the alternating signal should be supplied=
 on the
> + * EXTCOMIN pin.
> + *
> + * In this driver the Hardware mode is implemented with a PWM signal.
> + */

I would put this comment in a more significant place than in the first head=
er
block. For instance around the place you are dealing with this feature.

> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/pwm.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fb_dma_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#define CMD_WRITE BIT(0)
> +#define CMD_CLEAR BIT(2)
> +
> +struct sharp_ls027b7dh01 {
> +	struct spi_device *spi;
> +
> +	struct drm_device drm;
> +	struct drm_connector connector;
> +	struct drm_simple_display_pipe pipe;
> +	const struct drm_display_mode *display_mode;
> +
> +	struct gpio_desc *enable_gpio;
> +	struct pwm_device *extcomin_pwm;
> +
> +	u8 *write_buf;
> +};
> +
> +static inline struct sharp_ls027b7dh01 *drm_to_priv(struct drm_device *d=
rm)
> +{
> +	return container_of(drm, struct sharp_ls027b7dh01, drm);
> +}
> +
> +/**
> + * sharp_ls027b7dh01_add_headers - Add the Sharp LS027B7DH01 specific he=
aders
> + * @write_buf: Buffer to write
> + * @clip: DRM clip rectangle area to write
> + * @dst_pitch: Pitch of the write buffer
> + *

Why are you providing in-tree documentation for this function and not any o=
ther
function? The rest of the comment is important but you can drop the part ab=
ove.

> + * This function adds the SHARP LS027B7DH01 specific headers to the buff=
er for
> + * the Multiple Lines Write Mode:
> + * - The first byte will contain the write command.
> + * - Every line data starts with the line number and ends with a dummy z=
ero
> + *   trailer byte. It should be noted here that the line numbers are ind=
exed
> + *   from 1.
> + *
> + * Returns the size of the buffer to write to the display.
> + */
> +static size_t sharp_ls027b7dh01_add_headers(u8 *write_buf,
> +					    const struct drm_rect *clip,
> +					    const unsigned int dst_pitch)
> +{
> +	u8 line_num =3D clip->y1 + 1;
> +	unsigned int lines =3D drm_rect_height(clip);
> +	unsigned int y;
> +
> +	write_buf[0] =3D CMD_WRITE;
> +	write_buf[1] =3D line_num++;
> +
> +	for (y =3D 1; y < lines; y++) {
> +		write_buf[y * dst_pitch] =3D 0;
> +		write_buf[y * dst_pitch + 1] =3D line_num++;
> +	}
> +
> +	write_buf[lines * dst_pitch] =3D 0;
> +	write_buf[lines * dst_pitch + 1] =3D 0;
> +
> +	return lines * dst_pitch + 2;
> +}
> +
> +static int sharp_ls027b7dh01_prepare_buf(struct sharp_ls027b7dh01 *priv,
> +					 u8 *write_buf,
> +					 size_t *data_len,
> +					 struct drm_framebuffer *fb,
> +					 const struct drm_rect *clip)
> +{
> +	struct drm_gem_dma_object *dma_obj;
> +	struct iosys_map dst, vmap;
> +	unsigned int dst_pitch;
> +	int ret;
> +
> +	/* Leave 2 bytes to hold the line number and the trailer dummy byte. */
> +	dst_pitch =3D (drm_rect_width(clip) / 8) + 2;

What happens if the drm_rect_width() is not dividable by 8?
Sounds like a case for DIV_ROUND_UP (and it should be tested to ensure that
this is what the hardware expects).

> +
> +	dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return ret;
> +
> +	iosys_map_set_vaddr(&dst, &write_buf[2]);
> +	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
> +
> +	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, clip);
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +
> +	*data_len =3D sharp_ls027b7dh01_add_headers(write_buf, clip, dst_pitch);
> +
> +	return 0;
> +}
> +
> +static int sharp_ls027b7dh01_fb_damaged(struct drm_framebuffer *fb,
> +					const struct drm_rect *rect)
> +{
> +	struct drm_rect clip;
> +	struct sharp_ls027b7dh01 *priv;
> +	size_t data_len;
> +	int drm_index;
> +	int ret;
> +
> +	clip.x1 =3D 0;
> +	clip.x2 =3D fb->width;
> +	clip.y1 =3D rect->y1;
> +	clip.y2 =3D rect->y2;
> +
> +	priv =3D drm_to_priv(fb->dev);
> +
> +	if (!drm_dev_enter(fb->dev, &drm_index))
> +		return -ENODEV;
> +
> +	ret =3D sharp_ls027b7dh01_prepare_buf(priv, priv->write_buf, &data_len,=
 fb, &clip);
> +	if (ret)
> +		goto exit;
> +
> +	ret =3D spi_write(priv->spi, priv->write_buf, data_len);
> +
> +exit:
> +	drm_dev_exit(drm_index);
> +
> +	return ret;
> +}
> +
> +static void sharp_ls027b7dh01_pipe_update(struct drm_simple_display_pipe=
 *pipe,
> +					  struct drm_plane_state *old_state)
> +{
> +	struct drm_plane_state *state =3D pipe->plane.state;
> +	struct drm_rect rect;
> +
> +	if (!pipe->crtc.state->active)
> +		return;
> +
> +	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> +		sharp_ls027b7dh01_fb_damaged(state->fb, &rect);
> +}
> +
> +static void sharp_ls027b7dh01_pipe_disable(struct drm_simple_display_pip=
e *pipe)
> +{
> +	struct sharp_ls027b7dh01 *priv;
> +
> +	priv =3D drm_to_priv(pipe->crtc.dev);
> +	gpiod_set_value(priv->enable_gpio, 0);
> +}
> +
> +static int sharp_ls027b7dh01_clear_display(struct sharp_ls027b7dh01 *pri=
v)
> +{
> +	u8 clear_buf[2] =3D { CMD_CLEAR, 0 };
> +
> +	return spi_write(priv->spi, clear_buf, sizeof(clear_buf));
> +}
> +
> +static int sharp_ls027b7dh01_pwm_enable(struct sharp_ls027b7dh01 *priv)
> +{
> +	struct device *dev =3D &priv->spi->dev;
> +	struct pwm_state pwmstate;
> +
> +	priv->extcomin_pwm =3D devm_pwm_get(dev, NULL);

You should almost certainly do that just once in probe, not every time you =
want
to enable the pwm. This might increase some internal refcount which won't be
balanced.

> +	if (IS_ERR(priv->extcomin_pwm)) {
> +		dev_err(dev, "Could not get EXTCOMIN pwm\n");
> +		return PTR_ERR(priv->extcomin_pwm);
> +	}
> +
> +	pwm_init_state(priv->extcomin_pwm, &pwmstate);
> +	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
> +	pwm_apply_state(priv->extcomin_pwm, &pwmstate);
> +
> +	pwm_enable(priv->extcomin_pwm);
> +
> +	return 0;
> +}
> +
> +static void sharp_ls027b7dh01_pipe_enable(struct drm_simple_display_pipe=
 *pipe,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_plane_state *plane_state)
> +{
> +	struct sharp_ls027b7dh01 *priv;
> +	int ret, drm_idx;
> +
> +	priv =3D drm_to_priv(pipe->crtc.dev);
> +
> +	if (!drm_dev_enter(pipe->crtc.dev, &drm_idx))
> +		return;
> +
> +	gpiod_set_value(priv->enable_gpio, 1);
> +

Does the panel documentation specify some delay between setting the enable =
GPIO
and communicating with it? It's rarely instantaneous.

> +	ret =3D sharp_ls027b7dh01_clear_display(priv);
> +	if (ret)
> +		goto exit;
> +
> +	sharp_ls027b7dh01_pwm_enable(priv);
> +
> +exit:
> +	drm_dev_exit(drm_idx);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs sharp_ls027b7dh01_pipe=
_funcs =3D {
> +	.enable =3D sharp_ls027b7dh01_pipe_enable,
> +	.disable =3D sharp_ls027b7dh01_pipe_disable,
> +	.update =3D sharp_ls027b7dh01_pipe_update,
> +};
> +
> +static int sharp_ls027b7dh01_connector_get_modes(struct drm_connector *c=
onnector)
> +{
> +	struct sharp_ls027b7dh01 *priv =3D drm_to_priv(connector->dev);
> +
> +	return drm_connector_helper_get_modes_fixed(connector, priv->display_mo=
de);
> +}
> +
> +static const struct drm_connector_helper_funcs sharp_ls027b7dh01_connect=
or_hfuncs =3D {
> +	.get_modes =3D sharp_ls027b7dh01_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs sharp_ls027b7dh01_connector_func=
s =3D {
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D drm_connector_cleanup,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static const struct drm_mode_config_funcs sharp_ls027b7dh01_mode_config_=
funcs =3D {
> +	.fb_create =3D drm_gem_fb_create_with_dirty,
> +	.atomic_check =3D drm_atomic_helper_check,
> +	.atomic_commit =3D drm_atomic_helper_commit,
> +};
> +
> +static const uint32_t sharp_ls027b7dh01_formats[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const struct drm_display_mode sharp_ls027b7dh01_mode =3D {
> +	DRM_SIMPLE_MODE(400, 240, 59, 35),
> +};
> +
> +DEFINE_DRM_GEM_DMA_FOPS(sharp_ls027b7dh01_fops);
> +
> +static const struct drm_driver sharp_ls027b7dh01_drm_driver =3D {
> +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.fops			=3D &sharp_ls027b7dh01_fops,
> +	DRM_GEM_DMA_DRIVER_OPS_VMAP,
> +	.name			=3D "sharp_ls027b7dh01",
> +	.desc			=3D "Sharp ls027b7dh01 Memory LCD",
> +	.date			=3D "20231129",
> +	.major			=3D 1,
> +	.minor			=3D 0,
> +};
> +
> +static int sharp_ls027b7dh01_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct sharp_ls027b7dh01 *priv;
> +	struct drm_device *drm;
> +	unsigned int write_buf_size;
> +	int ret;
> +
> +	if (!dev->coherent_dma_mask) {
> +		ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
> +	}

Is there a particular need for this? I don't see where you're dealing with
DMA at all.

> +
> +	priv =3D devm_drm_dev_alloc(dev, &sharp_ls027b7dh01_drm_driver,
> +				  struct sharp_ls027b7dh01, drm);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	spi_set_drvdata(spi, priv);
> +	priv->spi =3D spi;
> +
> +	priv->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->enable_gpio),
> +				     "Failed to get GPIO 'enable'\n");
> +
> +	drm =3D &priv->drm;
> +	ret =3D drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.funcs =3D &sharp_ls027b7dh01_mode_config_funcs;
> +	priv->display_mode =3D &sharp_ls027b7dh01_mode;

It's a bit redundant to store it in priv if there's just one mode supported.

> +
> +	/*
> +	 * write_buf_size:
> +	 *
> +	 * hdisplay * vdisplay / 8 =3D> 1 bit per Pixel.
> +	 * 2 * vdisplay =3D> line number byte + trailer dummy byte for every li=
ne.
> +	 * 2 =3D> write command byte + final trailer dummy byte.
> +	 */
> +	write_buf_size =3D priv->display_mode->hdisplay * priv->display_mode->v=
display / 8
> +			 + 2 * priv->display_mode->vdisplay + 2;

Same issue about priv->display_mode->hdisplay * priv->display_mode->vdisplay
being dividable by 8. In your case you just have a single mode which doesn't
have the issue, but this code looks generic laid out like this, so it should
take care of all possible cases.
> +
> +	priv->write_buf =3D devm_kzalloc(dev, write_buf_size, GFP_KERNEL);
> +	if (!priv->write_buf)
> +		return -ENOMEM;
> +
> +	drm->mode_config.min_width =3D priv->display_mode->hdisplay;
> +	drm->mode_config.max_width =3D priv->display_mode->hdisplay;
> +	drm->mode_config.min_height =3D priv->display_mode->vdisplay;
> +	drm->mode_config.max_height =3D priv->display_mode->vdisplay;
> +
> +	ret =3D drm_connector_init(drm, &priv->connector,
> +				 &sharp_ls027b7dh01_connector_funcs,
> +				 DRM_MODE_CONNECTOR_SPI);
> +	if (ret)
> +		return ret;
> +
> +	drm_connector_helper_add(&priv->connector,
> +				 &sharp_ls027b7dh01_connector_hfuncs);
> +
> +	ret =3D drm_simple_display_pipe_init(drm, &priv->pipe,
> +					   &sharp_ls027b7dh01_pipe_funcs,
> +					   sharp_ls027b7dh01_formats,
> +					   ARRAY_SIZE(sharp_ls027b7dh01_formats),
> +					   NULL, &priv->connector);
> +	if (ret)
> +		return ret;
> +
> +	drm_plane_enable_fb_damage_clips(&priv->pipe.plane);
> +	drm_mode_config_reset(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	drm_fbdev_generic_setup(drm, 0);
> +
> +	return 0;
> +}
> +
> +static void sharp_ls027b7dh01_remove(struct spi_device *spi)
> +{
> +	struct sharp_ls027b7dh01 *priv =3D spi_get_drvdata(spi);
> +
> +	drm_dev_unplug(&priv->drm);
> +	drm_atomic_helper_shutdown(&priv->drm);
> +}
> +
> +static void sharp_ls027b7dh01_shutdown(struct spi_device *spi)
> +{
> +	struct sharp_ls027b7dh01 *priv =3D spi_get_drvdata(spi);
> +
> +	drm_atomic_helper_shutdown(&priv->drm);
> +}
> +
> +static const struct spi_device_id sharp_ls027b7dh01_ids[] =3D {
> +	{ "ls027b7dh01" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(spi, sharp_ls027b7dh01_ids);
> +
> +static const struct of_device_id sharp_ls027b7dh01_of_match[] =3D {
> +	{ .compatible =3D "sharp,ls027b7dh01", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sharp_ls027b7dh01_of_match);
> +
> +static struct spi_driver sharp_ls027b7dh01_spi_driver =3D {
> +	.probe =3D sharp_ls027b7dh01_probe,
> +	.remove =3D sharp_ls027b7dh01_remove,
> +	.shutdown =3D sharp_ls027b7dh01_shutdown,
> +	.id_table =3D sharp_ls027b7dh01_ids,
> +	.driver =3D {
> +		.name =3D "sharp-ls027b7dh01",
> +		.of_match_table =3D sharp_ls027b7dh01_of_match,
> +	},
> +};
> +module_spi_driver(sharp_ls027b7dh01_spi_driver);
> +
> +MODULE_AUTHOR("Andrew D'Angelo");
> +MODULE_AUTHOR("Mehdi Djait <mehdi.djait@bootlin.com>");
> +MODULE_DESCRIPTION("Sharp LS027B7DH01 Driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.41.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--cse+O5W+0oAb9vAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVnZxcACgkQ3cLmz3+f
v9FXfAf/ayQh1/Bg+MOBLRNugsZ2W5amRyftieRigbI+AQRoac2Kt2Nr5hsg7kBD
HGdOsmEYBtbEUYwJQdqRjODFnhE/vKV3YjJfhkVANyVrHNX7HKu5IiNswIWFONsH
bs+Kyg8vOBE1vi6dgtpBdPTiBAw81XN7NuLQnoMwTAXYu7OjOOCrEYHH/6WQaPi6
cHu6MYhxK7HymH0nVpfmdyrpXYQn+p1OFCvKBRx82tb95ibSE9x3Lxcn0miakpdQ
G2K7NrquhC+HmKwEQHYQcQxUfYwb3dcQNDrPKRQnDUPc/ustIiFq9CiSDqG0nckY
17dnHaNJGeM1FRHb9OgUBdQx1Ysycw==
=PO4i
-----END PGP SIGNATURE-----

--cse+O5W+0oAb9vAR--
