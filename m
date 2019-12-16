Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82F120F88
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0986E110;
	Mon, 16 Dec 2019 16:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52406E110
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:32:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63223A34;
 Mon, 16 Dec 2019 17:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576513977;
 bh=agbyxhjy6sAkFI1RslTfmkPZBOUeeOk7dL3mWfJ3Wrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvJ3CRbrCwRY8+Wds5oI2vtVVgurAkq8iMkjmQ55cpKsilesb3IFwUeBaOZYt2lv0
 otWPb1KAznZGG0JmaC6nS0Yb5meShKzt2N80mmhwBBX71OpDJ37cAYve7hCpYDa6Rk
 Z4jckymqOpyN89F3ntrSKuW4R1F3kgrOqUro+k8s=
Date: Mon, 16 Dec 2019 18:32:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v21 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
Message-ID: <20191216163247.GB14502@pendragon.ideasonboard.com>
References: <20191216135834.27775-1-enric.balletbo@collabora.com>
 <20191216135834.27775-3-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216135834.27775-3-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Enric and Jitao,

Thank you for the patch.

On Mon, Dec 16, 2019 at 02:58:34PM +0100, Enric Balletbo i Serra wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [uli: followed API changes, removed FW update feature]
> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v21:
>  - Use devm_i2c_new_dummy_device and fix build issue using deprecated i2c_new_dummy
>  - Fix build issue due missing drm_bridge.h
>  - Do not remove in ps8640_remove device managed resources
> 
> Changes in v19:
>  - fixed return value of ps8640_probe() when no panel is found
> 
> Changes in v18:
>  - followed DRM API changes
>  - use DEVICE_ATTR_RO()
>  - remove firmware update code
>  - add SPDX identifier
> 
> Changes in v17:
>  - remove some unused head files.
>  - add macros for ps8640 pages.
>  - remove ddc_i2c client
>  - add mipi_dsi_device_register_full
>  - remove the manufacturer from the name and i2c_device_id
> 
> Changes in v16:
>  - Disable ps8640 DSI MCS Function.
>  - Rename gpios name more clearly.
>  - Tune the ps8640 power on sequence.
> 
> Changes in v15:
>  - Drop drm_connector_(un)register calls from parade ps8640.
>    The main DRM driver mtk_drm_drv now calls
>    drm_connector_register_all() after drm_dev_register() in the
>    mtk_drm_bind() function. That function should iterate over all
>    connectors and call drm_connector_register() for each of them.
>    So, remove drm_connector_(un)register calls from parade ps8640.
> 
> Changes in v14:
>  - update copyright info.
>  - change bridge_to_ps8640 and connector_to_ps8640 to inline function.
>  - fix some coding style.
>  - use sizeof as array counter.
>  - use drm_get_edid when read edid.
>  - add mutex when firmware updating.
> 
> Changes in v13:
>  - add const on data, ps8640_write_bytes(struct i2c_client *client, const u8 *data, u16 data_len)
>  - fix PAGE2_SW_REST tyro.
>  - move the buf[3] init to entrance of the function.
> 
> Changes in v12:
>  - fix hw_chip_id build warning
> 
> Changes in v11:
>  - Remove depends on I2C, add DRM depends
>  - Reuse ps8640_write_bytes() in ps8640_write_byte()
>  - Use timer check for polling like the routines in <linux/iopoll.h>
>  - Fix no drm_connector_unregister/drm_connector_cleanup when ps8640_bridge_attach fail
>  - Check the ps8640 hardware id in ps8640_validate_firmware
>  - Remove fw_version check
>  - Move ps8640_validate_firmware before ps8640_enter_bl
>  - Add ddc_i2c unregister when probe fail and ps8640_remove
> 
>  drivers/gpu/drm/bridge/Kconfig         |  11 +
>  drivers/gpu/drm/bridge/Makefile        |   1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c | 655 +++++++++++++++++++++++++
>  3 files changed, 667 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 4734f6993858..3e0a63011723 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -101,6 +101,17 @@ config DRM_PARADE_PS8622
>  	---help---
>  	  Parade eDP-LVDS bridge chip driver.
>  
> +config DRM_PARADE_PS8640
> +	tristate "Parade PS8640 MIPI DSI to eDP Converter"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	help
> +	  Choose this option if you have PS8640 for display
> +	  The PS8640 is a high-performance and low-power
> +	  MIPI DSI to eDP converter
> +
>  config DRM_SIL_SII8620
>  	tristate "Silicon Image SII8620 HDMI/MHL bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 1c0c92667ac4..91490c595b38 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> +obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
>  obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> new file mode 100644
> index 000000000000..ab896ceb1a42
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -0,0 +1,655 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016 MediaTek Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +//#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +//#include <asm/unaligned.h>

Please remove commented-out headers.

> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define PAGE1_VSTART		0x6b
> +#define PAGE2_SPI_CFG3		0x82
> +#define I2C_TO_SPI_RESET	0x20
> +#define PAGE2_ROMADD_BYTE1	0x8e
> +#define PAGE2_ROMADD_BYTE2	0x8f
> +#define PAGE2_SWSPI_WDATA	0x90
> +#define PAGE2_SWSPI_RDATA	0x91
> +#define PAGE2_SWSPI_LEN		0x92
> +#define PAGE2_SWSPI_CTL		0x93
> +#define TRIGGER_NO_READBACK	0x05
> +#define TRIGGER_READBACK	0x01
> +#define PAGE2_SPI_STATUS	0x9e
> +#define SPI_READY		0x0c
> +#define PAGE2_GPIO_L		0xa6
> +#define PAGE2_GPIO_H		0xa7
> +#define PS_GPIO9		BIT(1)
> +#define PAGE2_IROM_CTRL		0xb0
> +#define IROM_ENABLE		0xc0
> +#define IROM_DISABLE		0x80
> +#define PAGE2_SW_RESET		0xbc
> +#define SPI_SW_RESET		BIT(7)
> +#define MPU_SW_RESET		BIT(6)
> +#define PAGE2_ENCTLSPI_WR	0xda
> +#define PAGE2_I2C_BYPASS	0xea
> +#define I2C_BYPASS_EN		0xd0
> +#define PAGE2_MCS_EN		0xf3
> +#define MCS_EN			BIT(0)
> +#define PAGE3_SET_ADD		0xfe
> +#define PAGE3_SET_VAL		0xff
> +#define VDO_CTL_ADD		0x13
> +#define VDO_DIS			0x18
> +#define VDO_EN			0x1c
> +#define PAGE4_REV_L		0xf0
> +#define PAGE4_REV_H		0xf1
> +#define PAGE4_CHIP_L		0xf2
> +#define PAGE4_CHIP_H		0xf3
> +
> +#define PAGE0_DP_CNTL		0
> +#define PAGE1_VDO_BDG		1
> +#define PAGE2_TOP_CNTL		2
> +#define PAGE3_DSI_CNTL1		3
> +#define PAGE4_MIPI_PHY		4
> +#define PAGE5_VPLL		5
> +#define PAGE6_DSI_CNTL2		6
> +#define PAGE7_SPI_CNTL		7
> +#define MAX_DEVS		0x8
> +
> +struct ps8640_info {
> +	u8 family_id;
> +	u8 variant_id;
> +	u16 version;
> +};
> +
> +struct ps8640 {
> +	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +	struct edid *edid;
> +	struct mipi_dsi_device *dsi;
> +	struct i2c_client *page[MAX_DEVS];
> +	struct regulator_bulk_data supplies[2];
> +	struct drm_panel *panel;
> +	struct gpio_desc *gpio_reset;
> +	struct gpio_desc *gpio_power_down;
> +	struct gpio_desc *gpio_mode_sel;
> +	bool enabled;
> +
> +	/* firmware file info */
> +	struct ps8640_info info;
> +	bool in_fw_update;
> +	/* for firmware update protect */
> +	struct mutex fw_mutex;

The last two fields are not used.

> +};
> +
> +static const u8 enc_ctrl_code[6] = { 0xaa, 0x55, 0x50, 0x41, 0x52, 0x44 };
> +static const u8 hw_chip_id[4] = { 0x00, 0x0a, 0x00, 0x30 };

Those two variables are not used.

> +
> +static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> +{
> +	return container_of(e, struct ps8640, bridge);
> +}
> +
> +static inline struct ps8640 *connector_to_ps8640(struct drm_connector *e)
> +{
> +	return container_of(e, struct ps8640, connector);
> +}
> +
> +static int ps8640_read(struct i2c_client *client, u8 reg, u8 *data,
> +		       u16 data_len)
> +{
> +	int ret;
> +	struct i2c_msg msgs[] = {
> +		{
> +		 .addr = client->addr,
> +		 .flags = 0,
> +		 .len = 1,
> +		 .buf = &reg,
> +		},
> +		{
> +		 .addr = client->addr,
> +		 .flags = I2C_M_RD,
> +		 .len = data_len,
> +		 .buf = data,
> +		}
> +	};
> +
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +
> +	if (ret == 2)
> +		return 0;
> +	if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}

Isn't this equivalent to i2c_smbus_read_i2c_block_data() ?
> +
> +static int ps8640_write_bytes(struct i2c_client *client, const u8 *data,
> +			      u16 data_len)
> +{
> +	int ret;
> +	struct i2c_msg msg;
> +
> +	msg.addr = client->addr;
> +	msg.flags = 0;
> +	msg.len = data_len;
> +	msg.buf = (u8 *)data;
> +
> +	ret = i2c_transfer(client->adapter, &msg, 1);
> +	if (ret == 1)
> +		return 0;
> +	if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;
> +}
> +
> +static int ps8640_write_byte(struct i2c_client *client, u8 reg, u8 data)
> +{
> +	u8 buf[] = { reg, data };
> +
> +	return ps8640_write_bytes(client, buf, sizeof(buf));
> +}

And this to i2c_smbus_write_byte_data() ?

> +
> +static void ps8640_get_mcu_fw_version(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE5_VPLL];
> +	u8 fw_ver[2];
> +
> +	ps8640_read(client, 0x4, fw_ver, sizeof(fw_ver));
> +	ps_bridge->info.version = (fw_ver[0] << 8) | fw_ver[1];
> +
> +	DRM_INFO_ONCE("ps8640 rom fw version %d.%d\n", fw_ver[0], fw_ver[1]);
> +}
> +
> +static int ps8640_bridge_unmute(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +	u8 vdo_ctrl_buf[3] = { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_EN };
> +
> +	return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
> +}
> +
> +static int ps8640_bridge_mute(struct ps8640 *ps_bridge)
> +{
> +	struct i2c_client *client = ps_bridge->page[PAGE3_DSI_CNTL1];
> +	u8 vdo_ctrl_buf[3] = { PAGE3_SET_ADD, VDO_CTL_ADD, VDO_DIS };
> +
> +	return ps8640_write_bytes(client, vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
> +}
> +
> +static void ps8640_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
> +	struct i2c_client *page1 = ps_bridge->page[PAGE1_VDO_BDG];
> +	int err;
> +	u8 set_vdo_done, mcs_en, vstart;
> +	ktime_t timeout;
> +
> +	if (ps_bridge->in_fw_update)
> +		return;
> +
> +	if (ps_bridge->enabled)
> +		return;
> +
> +	err = drm_panel_prepare(ps_bridge->panel);
> +	if (err < 0) {
> +		DRM_ERROR("failed to prepare panel: %d\n", err);
> +		return;
> +	}
> +
> +	err = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
> +				    ps_bridge->supplies);
> +	if (err < 0) {
> +		DRM_ERROR("cannot enable regulators %d\n", err);
> +		goto err_panel_unprepare;
> +	}
> +
> +	gpiod_set_value(ps_bridge->gpio_power_down, 1);
> +	gpiod_set_value(ps_bridge->gpio_reset, 0);
> +	usleep_range(2000, 2500);
> +	gpiod_set_value(ps_bridge->gpio_reset, 1);
> +
> +	/*
> +	 * Wait for the ps8640 embed mcu ready
> +	 * First wait 200ms and then check the mcu ready flag every 20ms
> +	 */
> +	msleep(200);
> +
> +	timeout = ktime_add_ms(ktime_get(), 200);
> +	for (;;) {
> +		err = ps8640_read(client, PAGE2_GPIO_H, &set_vdo_done, 1);
> +		if (err < 0) {
> +			DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", err);
> +			goto err_regulators_disable;
> +		}
> +		if ((set_vdo_done & PS_GPIO9) == PS_GPIO9)
> +			break;
> +		if (ktime_compare(ktime_get(), timeout) > 0)
> +			break;
> +		msleep(20);
> +	}
> +
> +	msleep(50);
> +
> +	ps8640_read(page1, PAGE1_VSTART, &vstart, 1);
> +	DRM_INFO("PS8640 PAGE1.0x6B = 0x%x\n", vstart);
> +
> +	/**
> +	 * The Manufacturer Command Set (MCS) is a device dependent interface
> +	 * intended for factory programming of the display module default
> +	 * parameters. Once the display module is configured, the MCS shall be
> +	 * disabled by the manufacturer. Once disabled, all MCS commands are
> +	 * ignored by the display interface.
> +	 */
> +	ps8640_read(client, PAGE2_MCS_EN, &mcs_en, 1);
> +	ps8640_write_byte(client, PAGE2_MCS_EN, mcs_en & ~MCS_EN);
> +
> +	if (ps_bridge->info.version == 0)
> +		ps8640_get_mcu_fw_version(ps_bridge);
> +
> +	err = ps8640_bridge_unmute(ps_bridge);
> +	if (err)
> +		DRM_ERROR("failed to enable unmutevideo: %d\n", err);
> +
> +	/* Switch access edp panel's edid through i2c */
> +	ps8640_write_byte(client, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
> +	ps_bridge->enabled = true;
> +
> +	return;
> +
> +err_regulators_disable:
> +	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +			       ps_bridge->supplies);
> +err_panel_unprepare:
> +	drm_panel_unprepare(ps_bridge->panel);
> +}
> +
> +static void ps8640_enable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	err = drm_panel_enable(ps_bridge->panel);
> +	if (err < 0)
> +		DRM_ERROR("failed to enable panel: %d\n", err);
> +}
> +
> +static void ps8640_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	err = drm_panel_disable(ps_bridge->panel);
> +	if (err < 0)
> +		DRM_ERROR("failed to disable panel: %d\n", err);
> +}
> +
> +static void ps8640_post_disable(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	int err;
> +
> +	if (ps_bridge->in_fw_update)
> +		return;
> +
> +	if (!ps_bridge->enabled)
> +		return;
> +
> +	ps_bridge->enabled = false;
> +
> +	err = ps8640_bridge_mute(ps_bridge);
> +	if (err < 0)
> +		DRM_ERROR("failed to unmutevideo: %d\n", err);
> +
> +	gpiod_set_value(ps_bridge->gpio_reset, 0);
> +	gpiod_set_value(ps_bridge->gpio_power_down, 0);
> +	err = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> +				     ps_bridge->supplies);
> +	if (err < 0)
> +		DRM_ERROR("cannot disable regulators %d\n", err);
> +
> +	err = drm_panel_unprepare(ps_bridge->panel);
> +	if (err)
> +		DRM_ERROR("failed to unprepare panel: %d\n", err);
> +}
> +
> +static int ps8640_get_modes(struct drm_connector *connector)
> +{
> +	struct ps8640 *ps_bridge = connector_to_ps8640(connector);
> +	struct edid *edid;
> +	int num_modes = 0;
> +	bool power_off;
> +
> +	if (ps_bridge->edid)
> +		return drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +	power_off = !ps_bridge->enabled;
> +	ps8640_pre_enable(&ps_bridge->bridge);
> +
> +	edid = drm_get_edid(connector, ps_bridge->page[0]->adapter);
> +	if (!edid)
> +		goto out;
> +
> +	ps_bridge->edid = edid;
> +	drm_connector_update_edid_property(connector, ps_bridge->edid);
> +	num_modes = drm_add_edid_modes(connector, ps_bridge->edid);
> +
> +out:
> +	if (power_off)
> +		ps8640_post_disable(&ps_bridge->bridge);
> +
> +	return num_modes;
> +}
> +
> +static const struct drm_connector_helper_funcs ps8640_connector_helper_funcs = {
> +	.get_modes = ps8640_get_modes,
> +};
> +
> +static enum drm_connector_status ps8640_detect(struct drm_connector *connector,
> +					       bool force)
> +{
> +	return connector_status_connected;
> +}
> +
> +static const struct drm_connector_funcs ps8640_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.detect = ps8640_detect,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +int ps8640_bridge_attach(struct drm_bridge *bridge)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +	struct device *dev = &ps_bridge->page[0]->dev;
> +	struct device_node *in_ep, *dsi_node = NULL;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host = NULL;
> +	int ret;
> +	const struct mipi_dsi_device_info info = { .type = "ps8640",
> +						   .channel = 0,
> +						   .node = NULL,
> +						 };
> +
> +	ret = drm_connector_init(bridge->dev, &ps_bridge->connector,
> +				 &ps8640_connector_funcs,
> +				 DRM_MODE_CONNECTOR_eDP);
> +
> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector with drm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&ps_bridge->connector,
> +				 &ps8640_connector_helper_funcs);
> +
> +	ps_bridge->connector.dpms = DRM_MODE_DPMS_ON;
> +	drm_connector_attach_encoder(&ps_bridge->connector,
> +				     bridge->encoder);
> +
> +	if (ps_bridge->panel)
> +		drm_panel_attach(ps_bridge->panel, &ps_bridge->connector);

It would be nice if you could use the panel bridge API to let the bridge
core handle the panel enable/disable automatically.

> +
> +	/* port@0 is ps8640 dsi input port */
> +	in_ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
> +	if (in_ep) {
> +		dsi_node = of_graph_get_remote_port_parent(in_ep);
> +		of_node_put(in_ep);
> +	}
> +
> +	if (dsi_node) {
> +		host = of_find_mipi_dsi_host_by_node(dsi_node);
> +		of_node_put(dsi_node);
> +		if (!host) {
> +			ret = -ENODEV;
> +			goto err;
> +		}
> +	}
> +

If !in_ep you will end up here with host == NULL and crash. How about
getting the DSI host at probe time to ensure that the DT is correct, and
register the device here ?

> +	dsi = mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "failed to create dsi device\n");
> +		ret = PTR_ERR(dsi);
> +		goto err;
> +	}
> +
> +	ps_bridge->dsi = dsi;
> +
> +	dsi->host = host;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +				     MIPI_DSI_MODE_VIDEO_SYNC_PULSE;

That's a weird alignment.

> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 4;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		goto err_dsi_attach;
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	mipi_dsi_device_unregister(dsi);
> +err:
> +	if (ps_bridge->panel)
> +		drm_panel_detach(ps_bridge->panel);
> +	drm_connector_cleanup(&ps_bridge->connector);
> +	return ret;
> +}
> +
> +static const struct drm_bridge_funcs ps8640_bridge_funcs = {
> +	.attach = ps8640_bridge_attach,
> +	.disable = ps8640_disable,
> +	.post_disable = ps8640_post_disable,
> +	.pre_enable = ps8640_pre_enable,
> +	.enable = ps8640_enable,
> +};
> +
> +/* Firmware Version is returned as Major.Minor */
> +static ssize_t fw_version_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
> +	struct ps8640_info *info = &ps_bridge->info;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%u.%u\n", info->version >> 8,
> +			 info->version & 0xff);
> +}
> +
> +/* Hardware Version is returned as FamilyID.VariantID */
> +static ssize_t hw_version_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct ps8640 *ps_bridge = dev_get_drvdata(dev);
> +	struct ps8640_info *info = &ps_bridge->info;
> +
> +	return scnprintf(buf, PAGE_SIZE, "ps%u.%u\n", info->family_id,
> +			 info->variant_id);
> +}
> +
> +static DEVICE_ATTR_RO(fw_version);
> +static DEVICE_ATTR_RO(hw_version);
> +
> +static struct attribute *ps8640_attrs[] = {
> +	&dev_attr_fw_version.attr,
> +	&dev_attr_hw_version.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group ps8640_attr_group = {
> +	.attrs = ps8640_attrs,
> +};
> +
> +static void ps8640_remove_sysfs_group(void *data)
> +{
> +	struct ps8640 *ps_bridge = data;
> +
> +	sysfs_remove_group(&ps_bridge->page[0]->dev.kobj, &ps8640_attr_group);
> +}
> +
> +static int ps8640_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *panel_node = NULL;
> +	struct device_node *port, *out_ep;
> +	struct ps8640 *ps_bridge;
> +	int ret;
> +	u32 i;
> +
> +	ps_bridge = devm_kzalloc(dev, sizeof(*ps_bridge), GFP_KERNEL);
> +	if (!ps_bridge)
> +		return -ENOMEM;
> +
> +	/* port@1 is ps8640 output port */
> +	port = of_graph_get_port_by_id(np, 1);
> +	if (port) {
> +		out_ep = of_get_child_by_name(port, "endpoint");
> +		of_node_put(port);
> +		if (out_ep) {
> +			panel_node = of_graph_get_remote_port_parent(out_ep);
> +			of_node_put(out_ep);
> +		}
> +	}
> +	if (panel_node) {
> +		ps_bridge->panel = of_drm_find_panel(panel_node);
> +		of_node_put(panel_node);
> +		if (IS_ERR(ps_bridge->panel))
> +			return PTR_ERR(ps_bridge->panel);
> +	}

How about replacing all that with

	ret = drm_of_find_panel_or_bridge(np, 1, 0, &ps_bridge->panel, NULL);
	if (ret < 0)
		return ret;

> +
> +	mutex_init(&ps_bridge->fw_mutex);
> +	ps_bridge->supplies[0].supply = "vdd33";
> +	ps_bridge->supplies[1].supply = "vdd12";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
> +				      ps_bridge->supplies);
> +	if (ret) {
> +		dev_info(dev, "failed to get regulators: %d\n", ret);

You may want to condition this line with ret != -EPROBE_DEFER to avoid
flooding the kernel log with messages related to probe deferral.

> +		return ret;
> +	}
> +
> +	ps_bridge->gpio_mode_sel = devm_gpiod_get_optional(&client->dev,
> +							   "mode-sel",
> +							   GPIOD_OUT_HIGH);
> +	if (IS_ERR(ps_bridge->gpio_mode_sel)) {
> +		ret = PTR_ERR(ps_bridge->gpio_mode_sel);
> +		dev_err(dev, "cannot get mode-sel %d\n", ret);

Same here and for the other GPIOs below.

By the way what is mode-sel used for ? It's not documented properly in
the DT bindings (I think it should, but I can't reply to the bindings
patch as it hasn't reached my mailbox yet for some reason), and isn't
used in the driver except here.

> +		return ret;
> +	}
> +
> +	ps_bridge->gpio_power_down = devm_gpiod_get(&client->dev, "sleep",

I wonder if the bindings should name the GPIO "powerdown".

> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(ps_bridge->gpio_power_down)) {
> +		ret = PTR_ERR(ps_bridge->gpio_power_down);
> +		dev_err(dev, "cannot get sleep: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Request the reset pin low to avoid the bridge being
> +	 * initialized prematurely

The polarity is wrong in DT then. Requesting the GPIO low should
deassert reset, in drivers all GPIO descriptors should be handled as
active high. Same for the sleep GPIO.

> +	 */
> +	ps_bridge->gpio_reset = devm_gpiod_get(&client->dev, "reset",
> +					       GPIOD_OUT_LOW);
> +	if (IS_ERR(ps_bridge->gpio_reset)) {
> +		ret = PTR_ERR(ps_bridge->gpio_reset);
> +		dev_err(dev, "cannot get reset: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
> +	ps_bridge->bridge.of_node = dev->of_node;
> +
> +	ps_bridge->page[0] = client;
> +
> +	/*
> +	 * ps8640 uses multiple addresses, use dummy devices for them
> +	 * page[0]: for DP control
> +	 * page[1]: for VIDEO Bridge
> +	 * page[2]: for control top
> +	 * page[3]: for DSI Link Control1
> +	 * page[4]: for MIPI Phy
> +	 * page[5]: for VPLL
> +	 * page[6]: for DSI Link Control2
> +	 * page[7]: for spi rom mapping
> +	 */
> +	for (i = 1; i < MAX_DEVS; i++) {

Maybe ARRAY_SIZE(ps_bridge->page) instead of MAX_DEVS ?

> +		ps_bridge->page[i] = devm_i2c_new_dummy_device(&client->dev,
> +							     client->adapter,
> +							     client->addr + i);

I think i2c_new_ancillary_device() is now preferred over the new dummy
device function.

> +		if (IS_ERR(ps_bridge->page[i])) {
> +			dev_err(dev, "failed i2c dummy device, address%02x\n",
> +				client->addr + i);
> +			return PTR_ERR(ps_bridge->page[i]);
> +		}
> +	}
> +
> +	i2c_set_clientdata(client, ps_bridge);
> +
> +	ret = sysfs_create_group(&client->dev.kobj, &ps8640_attr_group);
> +	if (ret) {
> +		dev_err(dev, "failed to create sysfs entries: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action(dev, ps8640_remove_sysfs_group, ps_bridge);
> +	if (ret) {
> +		dev_err(dev, "failed to add sysfs cleanup action: %d\n", ret);
> +		return ret;
> +	}

How about calling ps8640_remove_sysfs_group() in ps8640_remove() instead
? Otherwise the sysfs group will be removed after ps8640_remove()
returns, which could race with userspace accessing the sysfs attributes.

> +
> +	drm_bridge_add(&ps_bridge->bridge);
> +
> +	return 0;
> +}
> +
> +static int ps8640_remove(struct i2c_client *client)
> +{
> +	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&ps_bridge->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ps8640_i2c_table[] = {
> +	{ "ps8640", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ps8640_i2c_table);
> +
> +static const struct of_device_id ps8640_match[] = {
> +	{ .compatible = "parade,ps8640" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ps8640_match);
> +
> +static struct i2c_driver ps8640_driver = {
> +	.id_table = ps8640_i2c_table,

If the device is only used on DT platforms (I can't judge that) you can
drop this and only specify the of_match_table.

> +	.probe = ps8640_probe,

You should use .probe_new, that's the recommended way forward for I2C
drivers.

> +	.remove = ps8640_remove,
> +	.driver = {
> +		.name = "ps8640",
> +		.of_match_table = ps8640_match,
> +	},
> +};
> +module_i2c_driver(ps8640_driver);
> +
> +MODULE_AUTHOR("Jitao Shi <jitao.shi@mediatek.com>");
> +MODULE_AUTHOR("CK Hu <ck.hu@mediatek.com>");
> +MODULE_DESCRIPTION("PARADE ps8640 DSI-eDP converter driver");
> +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
