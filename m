Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7693BC03
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 07:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBF010E529;
	Thu, 25 Jul 2024 05:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="crF8gCOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr
 [80.12.242.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4C110E458
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:20:26 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id WqtpsLSEM4i5oWqtqsHWIN; Thu, 25 Jul 2024 07:20:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1721884824;
 bh=hwMuyIhmJ32IPBMOuuKYD6ayMobgt9HzyZEdivUOslI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=crF8gCOyFd9ePukIrq8yVymD89VPtc5iLZnAllVp6Qc31UGbCRCi5dhCzW4YJY2tM
 4Pv5JINi+tvyh460w48mGEsuLnoLXTG/ZjTcLuKnkxaGQKfFMPNaNtjR+1I3jxvgy/
 yyyy9/q/i4hEY43w6KR4DrkAbXrxx21K4ZYcZlpsNttwQ3n7c3UberhGv5oalF/xLv
 stZrJDmYFt1h7CwGaF9O+ao5IuWXFGunCD4AnC4271UKOcgsQkJnQ3NUy+7HWRYAis
 V/EVABEAP6P/qymyJF/5fiJP5u/xRCest38q+Usj43Wb48RznfPdW2yHXQo26UKFp3
 ENSIxIm9SJxWQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 25 Jul 2024 07:20:24 +0200
X-ME-IP: 90.11.132.44
Message-ID: <b21dbdbe-c779-4593-9a6a-892ef1298adb@wanadoo.fr>
Date: Thu, 25 Jul 2024 07:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/tiny: Add driver for Sharp Memory LCD
To: lanzano.alex@gmail.com
Cc: airlied@gmail.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mehdi.djait@bootlin.com,
 mripard@kernel.org, robh@kernel.org, tzimmermann@suse.de
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-3-lanzano.alex@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240725004734.644986-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 25/07/2024 à 02:47, Alex Lanzano a écrit :
> Add support for the monochrome Sharp Memory LCDs.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   MAINTAINERS                         |   8 +
>   drivers/gpu/drm/tiny/Kconfig        |  20 +
>   drivers/gpu/drm/tiny/Makefile       |   1 +
>   drivers/gpu/drm/tiny/sharp-memory.c | 742 ++++++++++++++++++++++++++++
>   4 files changed, 771 insertions(+)
>   create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
> 

Hi,

below a few comments, mostly cosmetic and 2 more interesting things 
related to error handling at the end.

Hope it helps.

CJ

...

> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> new file mode 100644
> index 000000000000..5e61e348ce3a
> --- /dev/null
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -0,0 +1,742 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <linux/kernel.h>

Is it really needed?

> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/spi/spi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/bitrev.h>
> +#include <linux/pwm.h>
> +#include <linux/mutex.h>

Nitpick: usually, alphabetical order is preferred.

> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_dma_helper.h>

...

> +static inline void sharp_memory_set_tx_buffer_addresses(uint8_t *buffer,
> +							struct drm_rect clip,
> +							uint32_t pitch)
> +{
> +	for (uint32_t line = 0; line < clip.y2; ++line)
> +		buffer[line * pitch] = line + 1;
> +

Nitpick: No need for an empty line.

> +}
> +
> +static void sharp_memory_set_tx_buffer_data(uint8_t *buffer,
> +					    struct drm_framebuffer *fb,
> +					    struct drm_rect clip,
> +					    uint32_t pitch,
> +					    struct drm_format_conv_state *fmtcnv_state)
> +{
> +	int ret;
> +	struct iosys_map dst, vmap;
> +	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> +	if (ret)
> +		return;
> +
> +

Nitpick: No need for 2 newlines.

> +	iosys_map_set_vaddr(&dst, buffer);
> +	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
> +
> +	drm_fb_xrgb8888_to_mono(&dst, &pitch, &vmap, fb, &clip, fmtcnv_state);
> +
> +	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> +}

...

> +static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
> +					     struct drm_atomic_state *state)
> +{
> +

Nitpick: No need for an empty line.

> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *plane_state = plane->state;
> +	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
> +	struct sharp_memory_device *smd;
> +	struct drm_rect rect;
> +
> +	smd = container_of(plane, struct sharp_memory_device, plane);
> +	if (!smd->crtc.state->active)
> +		return;
> +
> +
> +	if (drm_atomic_helper_damage_merged(old_state, plane_state, &rect))
> +		sharp_memory_fb_dirty(plane_state->fb, &rect, &fmtcnv_state);
> +
> +	drm_format_conv_state_release(&fmtcnv_state);
> +}

...

> +static void sharp_memory_crtc_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct pwm_state pwm_state;
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 1);
> +
> +

Nitpick: No need for 2 newlines.

> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> +						  smd, "sw_vcom_signal");
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_get_state(smd->pwm_vcom_signal, &pwm_state);
> +		pwm_state.period =    1000000000;
> +		pwm_state.duty_cycle = 100000000;
> +		pwm_state.enabled = true;
> +		pwm_apply_state(smd->pwm_vcom_signal, &pwm_state);
> +		break;
> +	}
> +}
> +
> +static void sharp_memory_crtc_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 0);
> +
> +

Nitpick: No need for 2 newlines.

> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		kthread_stop(smd->sw_vcom_signal);
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_disable(smd->pwm_vcom_signal);
> +		break;
> +	}
> +}

...

> +static const struct drm_connector_funcs sharp_memory_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +

Nitpick: No need for an empty line.

> +};
> +
> +static const struct drm_mode_config_funcs sharp_memory_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};

...

> +static int sharp_memory_pipe_init(struct drm_device *dev,
> +				  struct sharp_memory_device *smd,
> +				  const uint32_t *formats, unsigned int format_count,
> +				  const uint64_t *format_modifiers)
> +{
> +	int ret;
> +	struct drm_encoder *encoder = &smd->encoder;
> +	struct drm_plane *plane = &smd->plane;
> +	struct drm_crtc *crtc = &smd->crtc;
> +	struct drm_connector *connector = &smd->connector;
> +
> +	drm_plane_helper_add(plane, &sharp_memory_plane_helper_funcs);
> +	ret = drm_universal_plane_init(dev, plane, 0,
> +				       &sharp_memory_plane_funcs,
> +				       formats, format_count,
> +				       format_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ret;
> +
> +
> +	drm_crtc_helper_add(crtc, &sharp_memory_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(dev, crtc, plane, NULL,
> +					&sharp_memory_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +

Nitpick: No need for 2 newlines. (here and 2 other time just below)

> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drm_encoder_init(dev, encoder, &sharp_memory_encoder_funcs,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
> +
> +
> +	ret = drm_connector_init(&smd->drm, &smd->connector,
> +				 &sharp_memory_connector_funcs,
> +				 DRM_MODE_CONNECTOR_SPI);
> +	if (ret)
> +		return ret;
> +
> +
> +	drm_connector_helper_add(&smd->connector,
> +				 &sharp_memory_connector_hfuncs);
> +
> +	return drm_connector_attach_encoder(connector, encoder);
> +}
> +
> +static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
> +{
> +	struct pwm_state state;
> +	struct device *dev = &smd->spi->dev;
> +
> +	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> +	if (IS_ERR(smd->pwm_vcom_signal)) {
> +		dev_err(dev, "Could not get pwm device\n");
> +		return PTR_ERR(smd->pwm_vcom_signal);

Called from probe() opnly,so could be return  dev_err_probe().

> +	}
> +
> +	pwm_init_state(smd->pwm_vcom_signal, &state);
> +	state.enabled = false;
> +	pwm_apply_state(smd->pwm_vcom_signal, &state);
> +
> +	return 0;
> +}
> +
> +static int sharp_memory_probe(struct spi_device *spi)
> +{
> +	int ret;
> +	struct device *dev;
> +	struct sharp_memory_device *smd;
> +	enum sharp_memory_model model;
> +	struct drm_device *drm;
> +
> +	ret = spi_setup(spi);
> +	if (ret < 0)
> +		return dev_err_probe(&spi->dev, ret, "Failed to setup spi device\n");
> +
> +	dev = &spi->dev;
> +	if (!dev->coherent_dma_mask) {
> +		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
> +	}
> +
> +	smd = devm_drm_dev_alloc(&spi->dev, &sharp_memory_drm_driver,
> +				 struct sharp_memory_device, drm);
> +
> +	spi_set_drvdata(spi, smd);
> +
> +	smd->spi = spi;
> +	drm = &smd->drm;
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> +
> +

Nitpick: No need for 2 newlines.

> +	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (smd->enable_gpio == NULL)
> +		dev_warn(&spi->dev, "Enable gpio not defined\n");
> +
> +

Nitpick: No need for 2 newlines.

> +	/*
> +	 * VCOM is a signal that prevents DC bias from being built up in
> +	 * the panel resulting in pixels being forever stuck in one state.
> +	 *
> +	 * This driver supports three different methods to generate this
> +	 * signal depending on EXTMODE pin:
> +	 *
> +	 * SOFTWARE_VCOM (EXTMODE = L) - This method uses a kthread to
> +	 * periodically send a "maintain display" message to the display,
> +	 * toggling the vcom bit on and off with each message
> +	 *
> +	 * EXTERNAL_VCOM (EXTMODE = H) - This method relies on an external
> +	 * clock to generate the signal on the EXTCOMM pin
> +	 *
> +	 * PWM_VCOM (EXTMODE = H) - This method uses a pwm device to generate
> +	 * the signal on the EXTCOMM pin
> +	 *
> +	 */
> +	smd->vcom = 0;
> +	if (device_property_read_u32(&spi->dev, "vcom-mode", &smd->vcom_mode))
> +		return dev_err_probe(dev, ret, "Unable to find vcom-mode node in device tree\n");

ret is 0 at this point, so we return 'sucess'.
Is it what is expected?

> +
> +

Nitpick: No need for 2 newlines.

> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		/* No init is needed for these two modes */
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		ret = sharp_memory_init_pwm_vcom_signal(smd);

...

> +	smd->tx_buffer_size = (SHARP_MODE_PERIOD +
> +			       (SHARP_ADDR_PERIOD + (smd->mode->hdisplay) + SHARP_DUMMY_PERIOD) *
> +			       smd->mode->vdisplay) / 8;
> +
> +	smd->tx_buffer = devm_kzalloc(&spi->dev, smd->tx_buffer_size, GFP_KERNEL);

Error handling?

> +
> +	mutex_init(&smd->tx_mutex);
> +
> +	drm->mode_config.min_width = smd->mode->hdisplay;
> +	drm->mode_config.max_width = smd->mode->hdisplay;
> +	drm->mode_config.min_height = smd->mode->vdisplay;
> +	drm->mode_config.max_height = smd->mode->vdisplay;

...

CJ

