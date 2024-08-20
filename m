Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52C957EAE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 08:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554E610E4CC;
	Tue, 20 Aug 2024 06:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HWC5TqqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A0210E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 06:53:13 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id gIjssdXOQTL2BgIjssJOaf; Tue, 20 Aug 2024 08:53:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724136791;
 bh=r+NEjsLvfF0LYn/90F9XiGHWYEhepMWCgKxGhwj1wdQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=HWC5TqqGMbfqd/RxPAp3dLknUiYiw5OHnFMUtVCk+zjfsf7TLfNk4GAF+Yqh33zgD
 ABe09WU7orCmhnw4lAR32QCYY7CS3XcEH/ArUofyV10ZysQ600p8TC9kMNi9hS0eon
 /AAbxrC6b5oCxpJRVF7oFJ+K3kxlw44r1Gnxa9/MsuKbcMeGqymJFOrL6dlsDHS0U5
 sTkVKc0R5KYufZ0Po9Q8rNQfd3wOm2tEUrrqF6KUxa/ToO8yEArm4DPDFbqhJ8Lis8
 f8aqxfbJO43mV8J+FHs+tD5DHv6EQw9EXEDZHy07BNivdn/tRg9XhgedSRvkem5DvF
 5chNGqbO88lXw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 20 Aug 2024 08:53:11 +0200
X-ME-IP: 90.11.132.44
Message-ID: <3c8359ae-9a12-41c8-9799-86de9024fcd4@wanadoo.fr>
Date: Tue, 20 Aug 2024 08:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 2/2] drm/tiny: Add driver for Sharp Memory LCD
To: lanzano.alex@gmail.com
Cc: airlied@gmail.com, christophe.jaillet@wanadoo.fr, conor+dt@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mehdi.djait@bootlin.com, mripard@kernel.org, robh@kernel.org,
 tzimmermann@suse.de
References: <20240819214943.1610691-1-lanzano.alex@gmail.com>
 <20240819214943.1610691-3-lanzano.alex@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240819214943.1610691-3-lanzano.alex@gmail.com>
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

Le 19/08/2024 à 23:49, Alex Lanzano a écrit :
> Add support for the monochrome Sharp Memory LCDs.

Hi,

a few nitpick below, should thre be a v5.

...

> +struct sharp_memory_device {
> +	struct drm_device drm;
> +	struct spi_device *spi;
> +
> +	const struct drm_display_mode *mode;
> +
> +	struct drm_crtc crtc;
> +	struct drm_plane plane;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +
> +	struct gpio_desc *enable_gpio;
> +
> +	struct task_struct *sw_vcom_signal;
> +	struct pwm_device *pwm_vcom_signal;
> +
> +	enum sharp_memory_vcom_mode vcom_mode;
> +	u8 vcom;
> +
> +	u32 pitch;
> +	u32 tx_buffer_size;
> +	u8 *tx_buffer;
> +
> +	/* When vcom_mode == "software" a kthread is used to
> +	 * periodically send a 'maintain display' message over
> +	 * spi. This mutex ensures tx_buffer access and spi bus
> +	 * usage is synchronized in this case

This comment could take only 3 lines and still be with < 80 lines.
A dot could also be added at the end of the 2nd sentence.

> +	 */
> +	struct mutex tx_mutex;
> +};

...

> +static int sharp_memory_probe(struct spi_device *spi)
> +{
> +	int ret;
> +	struct device *dev;
> +	struct sharp_memory_device *smd;
> +	struct drm_device *drm;
> +	const char *vcom_mode_str;
> +
> +	ret = spi_setup(spi);
> +	if (ret < 0)
> +		return dev_err_probe(&spi->dev, ret, "Failed to setup spi device\n");
> +
> +	dev = &spi->dev;

If done earlier (when dev is declared?), it could already be used in the 
dev_err_probe() just above?

> +	if (!dev->coherent_dma_mask) {
> +		ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to set dma mask\n");
> +	}
> +
> +	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
> +				 struct sharp_memory_device, drm);
> +	if (!smd)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, smd);
> +
> +	smd->spi = spi;
> +	drm = &smd->drm;
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> +
> +	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (!smd->enable_gpio)
> +		dev_warn(dev, "Enable gpio not defined\n");
> +
> +	/*
> +	 * VCOM is a signal that prevents DC bias from being built up in
> +	 * the panel resulting in pixels being forever stuck in one state.
> +	 *
> +	 * This driver supports three different methods to generate this
> +	 * signal depending on EXTMODE pin:
> +	 *
> +	 * software (EXTMODE = L) - This mode uses a kthread to
> +	 * periodically send a "maintain display" message to the display,
> +	 * toggling the vcom bit on and off with each message
> +	 *
> +	 * external (EXTMODE = H) - This mode relies on an external
> +	 * clock to generate the signal on the EXTCOMM pin
> +	 *
> +	 * pwm (EXTMODE = H) - This mode uses a pwm device to generate
> +	 * the signal on the EXTCOMM pin
> +	 *
> +	 */
> +	if (device_property_read_string(&spi->dev, "sharp,vcom-mode", &vcom_mode_str))

just dev?

> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unable to find sharp,vcom-mode node in device tree\n");
> +
> +	if (!strcmp("software", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
> +
> +	} else if (!strcmp("external", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
> +
> +	} else if (!strcmp("pwm", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
> +		ret = sharp_memory_init_pwm_vcom_signal(smd);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to initialize external COM signal\n");
> +	} else {
> +		return dev_err_probe(dev, -EINVAL, "Invalid value set for vcom-mode\n");
> +	}
> +
> +	drm->mode_config.funcs = &sharp_memory_mode_config_funcs;
> +	smd->mode = spi_get_device_match_data(spi);
> +
> +	smd->pitch = (SHARP_ADDR_PERIOD + smd->mode->hdisplay + SHARP_DUMMY_PERIOD) / 8;
> +	smd->tx_buffer_size = (SHARP_MODE_PERIOD +
> +			       (SHARP_ADDR_PERIOD + (smd->mode->hdisplay) + SHARP_DUMMY_PERIOD) *
> +			       smd->mode->vdisplay) / 8;
> +
> +	smd->tx_buffer = devm_kzalloc(&spi->dev, smd->tx_buffer_size, GFP_KERNEL);

Just dev?

> +	if (!smd->tx_buffer)
> +		return -ENOMEM;
> +
> +	mutex_init(&smd->tx_mutex);
> +
> +	drm->mode_config.min_width = smd->mode->hdisplay;
> +	drm->mode_config.max_width = smd->mode->hdisplay;
> +	drm->mode_config.min_height = smd->mode->vdisplay;
> +	drm->mode_config.max_height = smd->mode->vdisplay;
> +
> +	ret = sharp_memory_pipe_init(drm, smd, sharp_memory_formats,
> +				     ARRAY_SIZE(sharp_memory_formats),
> +				     NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialize display pipeline.\n");
> +
> +	drm_plane_enable_fb_damage_clips(&smd->plane);
> +	drm_mode_config_reset(drm);
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register drm device.\n");
> +
> +	drm_fbdev_dma_setup(drm, 0);
> +
> +	return 0;
> +}

...

CJ

