Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8AB2EFD9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E3310E894;
	Thu, 21 Aug 2025 07:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pB7CCaxA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1A910E891
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:36:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A46095C6550;
 Thu, 21 Aug 2025 07:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3684C4CEED;
 Thu, 21 Aug 2025 07:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755761799;
 bh=Eo5YMJYbmgQg2bC0J3ToTc3e2+A7HXfcxWf0OWKuNdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pB7CCaxAMBi+yKG7eEFjwWvSOZ+nS5BLXlDYKUAB4QMmk9HCmIQIFyHrU1kiai+mQ
 tZ6Tl6LziMqqs1Y06HaopyMIQZHghkQyy18pA7k9Fo9Yx0Fy7ckxn5gcXKCig2u66y
 INtht0otG6SnOzesfSqxiPl+HKjg44HFPJP4ljQKk3+KaR8TKMkQ7v8Cg7K//8vezo
 768fO+ST36XEZDHAr80gDDx7jgGV4nYrgpbncW551rrAlhaAO4tQZAmwm2F55IFYMz
 gDuP2elAfGqX6dyYTGbyGFo2VJj+uGlUrPRLYBOaWHfOokzI9hslOJhRwjo7O5Uqec
 h/CuWlWD7plcQ==
Date: Thu, 21 Aug 2025 09:36:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <20250821-ivory-pegasus-of-aurora-c5c400@kuoka>
References: <20250820144128.17603-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.51b271ba-97e3-4830-97f9-7b6b4e0d202f@emailsignatures365.codetwo.com>
 <20250820144128.17603-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820144128.17603-3-mike.looijmans@topic.nl>
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

On Wed, Aug 20, 2025 at 04:40:35PM +0200, Mike Looijmans wrote:
> The tmds181 and sn65dp159 are "retimers" and hence can be considered
> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
> FPGA into a valid HDMI signal, and it will typically be inserted
> between an encoder and hdmi-connector.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
> Changes in v3:
> Lower-case hex values and use defines for EYESCAN registers
> Remove equalizer code (unlikely to be used)
> Remove attributes (no longer useful, undocumented)
> Fix build for 6.17 kernel
> Use devm_drm_bridge_alloc
> Sort includes and add linux/bitfield.h
> Check chip type and complain on mismatch
> 
> Changes in v2:
> Use atomic_enable/disable
> Use #defines for bit fields in registers
> Allow HDMI 2 compliance
> Filter modes on clock range
> Use cross-over pixel frequency instead of manual overides
> Devicetree bindings according to standards
> 
>  drivers/gpu/drm/bridge/Kconfig      |  11 +
>  drivers/gpu/drm/bridge/Makefile     |   1 +
>  drivers/gpu/drm/bridge/ti-tmds181.c | 409 ++++++++++++++++++++++++++++
>  3 files changed, 421 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a..753177fc9b50 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> +config DRM_TI_TMDS181
> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
> +	  The SN65DP159 provides output into a cable (source) whereas the
> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
> +	  can be set up as source or sink though.
> +
>  config DRM_TI_TPD12S015
>  	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 245e8a27e3fc..f4b5089e903c 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TDP158) += ti-tdp158.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> +obj-$(CONFIG_DRM_TI_TMDS181) += ti-tmds181.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
>  obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge/ti-tmds181.c
> new file mode 100644
> index 000000000000..8ac3eb808d5b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
> + *
> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
> + *
> + * based on code
> + * Copyright (C) 2007 Hans Verkuil
> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/retimer");
> +MODULE_AUTHOR("Mike Looijmans");
> +MODULE_LICENSE("GPL");
> +
> +#define TMDS181_REG_ID		0
> +#define TMDS181_REG_REV		0x8
> +#define TMDS181_REG_CTRL9	0x9
> +/* Registers A and B have a volatile bit, but we don't use it, so cache is ok */
> +#define TMDS181_REG_CTRLA	0xa
> +#define TMDS181_REG_CTRLB	0xb
> +#define TMDS181_REG_CTRLC	0xc
> +#define TMDS181_REG_EQUALIZER	0xd
> +/* EYESCAN registers don't appear to deserve separate names */
> +#define TMDS181_REG_EYESCAN_E	0xe
> +#define TMDS181_REG_EYESCAN_F	0xf
> +#define TMDS181_REG_EYESCAN_15	0x15
> +#define TMDS181_REG_EYESCAN_17	0x17
> +#define TMDS181_REG_EYESCAN_1F	0x1f
> +#define TMDS181_REG_AUX		0x20
> +
> +
> +#define TMDS181_CTRL9_SIG_EN			BIT(4)
> +#define TMDS181_CTRL9_PD_EN			BIT(3)
> +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
> +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
> +
> +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
> +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
> +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
> +#define TMDS181_CTRLA_EQ_EN			BIT(4)
> +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
> +#define TMDS181_CTRLA_APPLY			BIT(2)
> +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
> +
> +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
> +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
> +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
> +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
> +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
> +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
> +
> +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
> +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
> +
> +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
> +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
> +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
> +
> +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
> +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
> +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
> +
> +/* Above this data rate HDMI2 standards apply (TX termination) */
> +#define HDMI2_PIXEL_RATE_KHZ	340000
> +
> +enum tmds181_chip {
> +	tmds181,
> +	dp159,
> +};
> +
> +struct tmds181_data {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct drm_bridge *next_bridge;
> +	struct drm_bridge bridge;
> +	u32 retimer_threshold_khz;
> +};
> +
> +static inline struct tmds181_data *
> +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct tmds181_data, bridge);
> +}
> +
> +static int tmds181_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
> +			  enum drm_bridge_attach_flags flags)
> +{
> +	struct tmds181_data *data = drm_bridge_to_tmds181_data(bridge);
> +
> +	return drm_bridge_attach(encoder, data->next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_info *info,
> +		   const struct drm_display_mode *mode)
> +{
> +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clock */
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
> +	if (mode->crtc_clock > 350000)
> +		return MODE_CLOCK_HIGH;
> +
> +	/*
> +	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
> +	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
> +	 */
> +	if (mode->clock > 600000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static void tmds181_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
> +{
> +	struct tmds181_data *data = drm_bridge_to_tmds181_data(bridge);
> +	const struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	unsigned int val;
> +
> +	/*
> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> +	 * from the bridge to the encoder, to the connector and to the CRTC.
> +	 */
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	mode = &crtc_state->adjusted_mode;
> +
> +	/* Set retimer/redriver mode based on pixel clock */
> +	val = mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_FUNC_MODE : 0;
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
> +			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
> +
> +	/* Configure TX termination based on pixel clock */
> +	val = mode->clock > HDMI2_PIXEL_RATE_KHZ ?
> +				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
> +				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
> +			   TMDS181_CTRLB_TX_TERM_CTL,
> +			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
> +
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
> +			   TMDS181_CTRL9_PD_EN, 0);
> +}
> +
> +static void tmds181_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
> +{
> +	struct tmds181_data *data = drm_bridge_to_tmds181_data(bridge);
> +
> +	/* Set the PD_EN bit */
> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
> +			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
> +}
> +
> +static const struct drm_bridge_funcs tmds181_bridge_funcs = {
> +	.attach		= tmds181_attach,
> +	.mode_valid	= tmds181_mode_valid,
> +	.atomic_enable	= tmds181_enable,
> +	.atomic_disable	= tmds181_disable,
> +
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +};
> +
> +static const u8 tmds181_id_tmds181[8] __nonstring = "TMDS181 ";
> +static const u8 tmds181_id_dp159[8]   __nonstring = "DP159   ";
> +
> +static int tmds181_check_id(struct tmds181_data *data, enum tmds181_chip *chip)
> +{
> +	int ret;
> +	int retry;
> +	u8 buffer[8];
> +
> +	for (retry = 0; retry < 20; ++retry) {
> +		ret = regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
> +				       sizeof(buffer));
> +		if (!ret)
> +			break;
> +
> +		/* Compensate for very long OE power-up delays due to the cap */
> +		usleep_range(5000, 10000);
> +	}
> +
> +	if (ret) {
> +		dev_err(&data->client->dev, "I2C read ID failed\n");
> +		return ret;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) == 0) {
> +		if (*chip != tmds181) {
> +			dev_warn(&data->client->dev, "Detected: TMDS181\n");
> +			*chip = tmds181;
> +		}
> +		return 0;
> +	}
> +
> +	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) == 0) {
> +		if (*chip != dp159) {
> +			dev_warn(&data->client->dev, "Detected: DP159\n");
> +			*chip = dp159;
> +		}
> +		return 0;
> +	}
> +
> +	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer), buffer);
> +
> +	return -ENODEV;
> +}
> +
> +static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	/* IBERT result and status registers, not used yet */
> +	case TMDS181_REG_EYESCAN_15:
> +	case TMDS181_REG_EYESCAN_17 ... TMDS181_REG_EYESCAN_1F:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config tmds181_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.max_register = TMDS181_REG_AUX,
> +	.volatile_reg = tmds181_regmap_is_volatile,
> +};
> +
> +static int tmds181_probe(struct i2c_client *client)
> +{
> +	struct tmds181_data *data;
> +	struct gpio_desc *oe_gpio;
> +	enum tmds181_chip chip;
> +	int ret;
> +	u32 param;
> +	u8 val;
> +
> +	/* Check if the adapter supports the needed features */
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return -EIO;
> +
> +	data = devm_drm_bridge_alloc(&client->dev, struct tmds181_data, bridge,
> +				     &tmds181_bridge_funcs);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	data->client = client;
> +	i2c_set_clientdata(client, data);
> +	data->regmap = devm_regmap_init_i2c(client, &tmds181_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	/* The "OE" pin acts as a reset */
> +	oe_gpio = devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW);
> +	if (IS_ERR(oe_gpio)) {
> +		ret = PTR_ERR(oe_gpio);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&client->dev, "failed to acquire 'oe' gpio\n");

Heh, nice...

> +		return ret;
> +	}

...

> +
> +static const struct i2c_device_id tmds181_id[] = {
> +	{ "tmds181", tmds181 },
> +	{ "sn65dp159", dp159 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tmds181_id);
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id tmds181_of_match[] = {
> +	{ .compatible = "ti,tmds181", .data = (void *)tmds181 },
> +	{ .compatible = "ti,sn65dp159", .data = (void *)dp159 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tmds181_of_match);
> +#endif
> +
> +static struct i2c_driver tmds181_driver = {
> +	.driver = {
> +		.owner = THIS_MODULE,

Nice coincidence - this stars in one of my talks on OSSE
(https://sched.co/25VoV) as my litmus test for crazy old, vendor code.
Please come to the session if you are around or just check the slides
afterwards.

The open-coding dev_err_probe() is another great example.

Best regards,
Krzysztof

