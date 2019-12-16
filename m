Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76191210EA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DBC6E836;
	Mon, 16 Dec 2019 17:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B3A6E836
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 62C98291731
Message-ID: <bb97505cfadae364afa14605793affe4a7d69ffa.camel@collabora.com>
Subject: Re: [PATCH v21 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Date: Mon, 16 Dec 2019 14:07:05 -0300
In-Reply-To: <20191216135834.27775-3-enric.balletbo@collabora.com>
References: <20191216135834.27775-1-enric.balletbo@collabora.com>
 <20191216135834.27775-3-enric.balletbo@collabora.com>
Organization: Collabora
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2019-12-16 at 14:58 +0100, Enric Balletbo i Serra wrote:
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

Commented stuff should gone.

> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +//#include <asm/unaligned.h>

Ditto.

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

Unused macro.

> +#define PAGE1_VDO_BDG		1
> +#define PAGE2_TOP_CNTL		2
> +#define PAGE3_DSI_CNTL1		3
> +#define PAGE4_MIPI_PHY		4

Ditto... maybe others as well?

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
> +};
> +
> +static const u8 enc_ctrl_code[6] = { 0xaa, 0x55, 0x50, 0x41, 0x52, 0x44 };
> +static const u8 hw_chip_id[4] = { 0x00, 0x0a, 0x00, 0x30 };
> +

More unused stuff. Left-overs?

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

I was gonna say you should avoid transmitting data
in the stack, but then I noticed the I2C core doesn't
complaint about it (doesn't use object_is_on_stack).

Wolfram, does the I2C accept stacked (possibly non-DMA-able) objects?

> +	return ps8640_write_bytes(client, buf, sizeof(buf));
> +}
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

Hm, isn't this too verbose?

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

I believe it's cleaner to use this idiom:

        unsigned long timeout = jiffies + msecs_to_jiffies(YOUR_DRIVER_TIMEOUT);
        
        while (time_is_after_jiffies(timeout)) {
                ....
        }

> +
> +	msleep(50);
> +
> +	ps8640_read(page1, PAGE1_VSTART, &vstart, 1);
> +	DRM_INFO("PS8640 PAGE1.0x6B = 0x%x\n", vstart);
> +

Ditto, isn't this too verbose?

I stopped reviewing at this point. It sounds like this driver
could use some love. (Not sure how this driver stood twenty reviews :-))

Thanks,
Ezequiel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
