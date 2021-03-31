Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCFC34EC57
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 17:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155706E91F;
	Tue, 30 Mar 2021 15:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AAD6E91F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 15:27:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 43F631F4594F
Subject: Re: [PATCH v5 2/2] drm/bridge: anx7688: Add ANX7688 bridge driver
 support
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210305124351.15079-1-dafna.hirschfeld@collabora.com>
 <20210305124351.15079-3-dafna.hirschfeld@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <5ba237ee-e5a0-6e33-4c2f-491bbd2b27c4@collabora.com>
Date: Tue, 30 Mar 2021 17:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305124351.15079-3-dafna.hirschfeld@collabora.com>
Content-Language: en-US
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
Cc: chunkuang.hu@kernel.org, jernej.skrabec@siol.net, drinkcat@chromium.org,
 jonas@kwiboo.se, airlied@linux.ie, dafna3@gmail.com, narmstrong@baylibre.com,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,

Thank you for your patch and to work on this.

On 5/3/21 13:43, Dafna Hirschfeld wrote:
> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> This driver adds support for the ANX7688 HDMI to DP converter block of the
> ANX7688 device.
> 
> For our use case, the only reason the Linux kernel driver is necessary is
> to reject resolutions that require more bandwidth than what is available
> on the DP side. DP bandwidth and lane count are reported by the bridge via
> 2 registers and, as far as we know, only chips that have a firmware
> version greater than 0.85 support these two registers.
> 

Maybe we should mention that this driver can be extended to support the typec
controller part which is not implemented right now because due our hardware
configuration we can't test.


> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> [The driver is OF only so should depends on CONFIG_OF]
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [convert the driver to be a i2c driver]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  11 ++
>  drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
>  .../drm/bridge/analogix/analogix-anx7688.c    | 186 ++++++++++++++++++

You put the binding in bindings/usb/analogix,anx7688.yaml, which I think is the
right place. So to be coherent that should go under usb/typec. But we only
implemented the HDMI to DP bridge part (port0) because is what we can really test.

But this chip is more a typec controller than a bridge, so maybe it should be
placed there.


>  3 files changed, 198 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index 024ea2a570e7..323327aabc38 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -11,6 +11,17 @@ config DRM_ANALOGIX_ANX6345
>  	  ANX6345 transforms the LVTTL RGB output of an
>  	  application processor to eDP or DisplayPort.
>  
> +config DRM_ANALOGIX_ANX7688
> +	tristate "Analogix ANX7688 bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  ANX7688 is an ultra-low power 4K Ultra-HD (4096x2160p60)
> +	  mobile HD transmitter designed for portable
> +	  devices. The ANX7688 converts HDMI 2.0 to
> +	  DisplayPort 1.3 Ultra-HD.
> +
>  config DRM_ANALOGIX_ANX78XX
>  	tristate "Analogix ANX78XX bridge"
>  	select DRM_ANALOGIX_DP
> diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> index 44da392bb9f9..8f2272b8b732 100644
> --- a/drivers/gpu/drm/bridge/analogix/Makefile
> +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> @@ -2,5 +2,6 @@
>  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
>  obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
>  obj-$(CONFIG_DRM_ANALOGIX_ANX7625) += anx7625.o
> +obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
>  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> new file mode 100644
> index 000000000000..85a4b1a23035
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ANX7688 HDMI->DP bridge driver
> + *
> + * Copyright 2020 Google LLC
> + */
> +
> +#include <linux/types.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>
> +
> +/* Register addresses */
> +#define ANX7688_VENDOR_ID_REG		0x00
> +#define ANX7688_DEVICE_ID_REG		0x02
> +
> +#define ANX7688_FW_VERSION_REG		0x80
> +
> +#define ANX7688_DP_BANDWIDTH_REG	0x85
> +#define ANX7688_DP_LANE_COUNT_REG	0x86
> +
> +#define ANX7688_VENDOR_ID		0x1f29
> +#define ANX7688_DEVICE_ID		0x7688
> +
> +/* First supported firmware version (0.85) */
> +#define ANX7688_MINIMUM_FW_VERSION	0x0085
> +
> +static const struct regmap_config anx7688_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +struct anx7688 {
> +	struct i2c_client *client;
> +	struct regmap *regmap;
> +	struct drm_bridge bridge;
> +	bool filter;
> +};
> +
> +static inline struct anx7688 *
> +bridge_to_anx7688(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct anx7688, bridge);
> +}
> +
> +static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
> +				      const struct drm_display_mode *mode,
> +				      struct drm_display_mode *adjusted_mode)
> +{
> +	struct anx7688 *anx = bridge_to_anx7688(bridge);
> +	int totalbw, requiredbw;
> +	u8 dpbw, lanecount;
> +	u8 regs[2];
> +	int ret;
> +
> +	if (!anx->filter)
> +		return true;
> +
> +	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
> +	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
> +	if (ret < 0) {
> +		DRM_ERROR("Failed to read bandwidth/lane count\n");
> +		return false;
> +	}
> +	dpbw = regs[0];
> +	lanecount = regs[1];
> +
> +	/* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
> +	if (dpbw > 0x19 || lanecount > 2) {
> +		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
> +			  lanecount);
> +		return false;
> +	}
> +
> +	/* Compute available bandwidth (kHz) */
> +	totalbw = dpbw * lanecount * 270000 * 8 / 10;
> +
> +	/* Required bandwidth (8 bpc, kHz) */
> +	requiredbw = mode->clock * 8 * 3;
> +
> +	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
> +		      totalbw, dpbw, lanecount, requiredbw);
> +
> +	if (totalbw == 0) {
> +		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
> +		return true;
> +	}
> +
> +	return totalbw >= requiredbw;
> +}
> +
> +static const struct drm_bridge_funcs anx7688_bridge_funcs = {
> +	.mode_fixup = anx7688_bridge_mode_fixup,
> +};
> +
> +static int anx7688_bridge_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct anx7688 *anx7688;
> +	u16 vendor, device, fw_version;
> +	u8 buffer[4];
> +	int ret;
> +
> +	anx7688 = devm_kzalloc(dev, sizeof(*anx7688), GFP_KERNEL);
> +	if (!anx7688)
> +		return -ENOMEM;
> +
> +	anx7688->client = client;
> +	i2c_set_clientdata(client, anx7688);
> +
> +	anx7688->regmap = devm_regmap_init_i2c(client, &anx7688_regmap_config);
> +
> +	/* Read both vendor and device id (4 bytes). */
> +	ret = regmap_bulk_read(anx7688->regmap, ANX7688_VENDOR_ID_REG,
> +			       buffer, 4);
> +	if (ret) {
> +		dev_err(dev, "Failed to read chip vendor/device id\n");
> +		return ret;
> +	}
> +
> +	vendor = (u16)buffer[1] << 8 | buffer[0];
> +	device = (u16)buffer[3] << 8 | buffer[2];
> +	if (vendor != ANX7688_VENDOR_ID || device != ANX7688_DEVICE_ID) {
> +		dev_err(dev, "Invalid vendor/device id %04x/%04x\n",
> +			vendor, device);
> +		return -ENODEV;
> +	}
> +
> +	ret = regmap_bulk_read(anx7688->regmap, ANX7688_FW_VERSION_REG,
> +			       buffer, 2);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to read firmware version\n");
> +		return ret;
> +	}
> +
> +	fw_version = (u16)buffer[0] << 8 | buffer[1];
> +	dev_info(dev, "ANX7688 firmware version 0x%04x\n", fw_version);
> +
> +	anx7688->bridge.of_node = dev->of_node;
> +
> +	/* FW version >= 0.85 supports bandwidth/lane count registers */
> +	if (fw_version >= ANX7688_MINIMUM_FW_VERSION)
> +		anx7688->filter = true;
> +	else
> +		/* Warn, but not fail, for backwards compatibility */
> +		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
> +			 fw_version);
> +
> +	anx7688->bridge.funcs = &anx7688_bridge_funcs;
> +	drm_bridge_add(&anx7688->bridge);
> +
> +	return 0;
> +}
> +
> +static int anx7688_bridge_remove(struct i2c_client *client)
> +{
> +	struct anx7688 *anx7688 = i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&anx7688->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id anx7688_bridge_match_table[] = {
> +	{ .compatible = "analogix,anx7688", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, anx7688_bridge_match_table);
> +
> +static struct i2c_driver anx7688_bridge_driver = {
> +	.probe_new = anx7688_bridge_probe,
> +	.remove = anx7688_bridge_remove,
> +	.driver = {
> +		.name = "anx7688-bridge",
> +		.of_match_table = anx7688_bridge_match_table,
> +	},
> +};
> +
> +module_i2c_driver(anx7688_bridge_driver);
> +
> +MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
> +MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
> +MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
> +MODULE_LICENSE("GPL");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
