Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD0A348F7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B7F10E04F;
	Thu, 13 Feb 2025 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PaQPiaHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5924B10E04F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:06:00 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5450cf0cb07so948108e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739462758; x=1740067558; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dg+HfwFG+VHbQ5o6FfDwJZkH9GwsABmGIUSqNL9D1BQ=;
 b=PaQPiaHZcEWr/Br1uX3WuGHZszzl61R44+Dls8oq5vXCG8AbSI8xCutoGJe7a5JxZe
 LeN5XBI8rgEAxqcPJ3lBokd2YLqCYWUsZ90sY3EplJC9U3IH7nCBkYmMmtEGrks4n5Fx
 4gQOxh5vgPN72L0WnMk796ssgmnysNmHf8UOIzb9pDBTdJ0HvMYO7PK9Ryci5bvdpSn7
 75k0WdIs8fjxIOnQnoYi/F3/9mjZWwpZGFMPmK21TPkCrokrDv6R5dgqV0M/9B/XWBeE
 wq/7bSJG33JzvYrRH0+1U/fXzDybno2a2LVcnBhd+9sP3flk/gWcDQm25OUX+KtoaocD
 bfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739462758; x=1740067558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg+HfwFG+VHbQ5o6FfDwJZkH9GwsABmGIUSqNL9D1BQ=;
 b=OKYNPIAyMkXI1oFQxusmuVarMr47tWrYZES31execlTGwsLkkFWTIr0i4vNIRHyu7f
 EOcHoevurEFR1b1iV8GK267fVSdtZagWZtXNBSQb8jETba9jQhcJYjNXfa9M298mtd7B
 lEK5qb0G9I97b3eUO9tWZ2ywWVUv9m+9cUEXtIuZ2XJk2R7OmhoL9+eAXLAu1fdEKJkk
 4mCfChG/RodkEflGx4i5mvzEwLsLDlfKz/HNQRbm/6+LM2WYntb2eVDsrDSpL2QLgDFi
 tVY1cD5yfKmyLsy52Luun0JpVUSs5ndKS79TnFXtB/L6gUkT9g78CVwPkBvscy5eIagy
 eVcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZZDYNYXmi1TLmnHSZ5HJRYybw9EhMojoB1g8a2nRQG2LCVuBJtJpvGpIVK+PQMOjQ/pW+/K2NZsc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs+XQRkt73IXJDVvOfqPbR6arvXcjnrA6/Q63ZXUOIL2+PnGKQ
 8I4B2p7WxTDKd/0icNbNeEx81ZgZIKCaUAOivmPGNWZ1F4ATsxoBOAPlR38p71Y=
X-Gm-Gg: ASbGncsEugt7j9aPTi+aNOf7l2cYFGkM9QCho7wLgSDm58a7tJyIpebAcJomTy359th
 kzyarwZT5DeMr8iyFEtfswrzNDmTbDPSEQmhIRSDWrlN41W5afKHI0GQbTmUcUurJhAqZvnFzMl
 jR4fVqCvxVp/ZMOj1Jhbht+jmh+KYRQEJyVGL/RaDao1SgKRhMVLsb29NCTq+PDQmRQt+xCsTZ4
 FIHMD29hBwFHbFStbOmo81oJrjOlNvnHvPF6VNJNbxUE5Es26nwevqUZrxTuMRxN2WTcR5fpu44
 9UQh+B1xZDdisZrdP7O67NLHMUvS+bk4vam7Ltu304BEn0RoXPRuKMkX6kMDzQtIsz1+Dk4=
X-Google-Smtp-Source: AGHT+IEDjAnuRiNjM6A8ZUUSOQcmNUkFyR/1Zqur4/UnnhkxYXVotYEvjcdAYlVRKoX/t7Q0UIdy2A==
X-Received: by 2002:ac2:4e91:0:b0:545:c1e:6603 with SMTP id
 2adb3069b0e04-545181859f0mr2163620e87.50.1739462757779; 
 Thu, 13 Feb 2025 08:05:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10c709sm213796e87.184.2025.02.13.08.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:05:57 -0800 (PST)
Date: Thu, 13 Feb 2025 18:05:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <lo2nohiqj7e64oydmfk5yng53ge2jw3mfrba4rf3cyjrw7qf7a@iqb7fv6o33qp>
References: <20250213135605.157650-1-clamor95@gmail.com>
 <20250213135605.157650-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213135605.157650-3-clamor95@gmail.com>
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

On Thu, Feb 13, 2025 at 03:56:05PM +0200, Svyatoslav Ryhel wrote:
> SSD2825 is an innovative and cost-effective MIPI Bridge Chip solution
> targeting high resolution smartphones. It can convert 24bit RGB
> interface into 4-lane MIPI-DSI interface to drive extremely high
> resolution display modules of up to 800 x 1366, while supporting AMOLED,
> a-si LCD or LTPS advanced panel technologies for smartphone applications.

Nit: I don't think that 800x1366 is considered high-res nowadays. Please
consider rewriting the text in a non-marketing way.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  13 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/ssd2825.c | 741 +++++++++++++++++++++++++++++++
>  3 files changed, 755 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ssd2825.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa..74aec32d0f3b 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -306,6 +306,19 @@ config DRM_SIMPLE_BRIDGE
>  	  Support for non-programmable DRM bridges, such as ADI ADV7123, TI
>  	  THS8134 and THS8135 or passive resistor ladder DACs.
>  
> +config DRM_SOLOMON_SSD2825
> +	tristate "SSD2825 RGB/DSI bridge"
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> +	help
> +	  Say Y here if you want support for the Solomon SSD2825 RGB/DSI
> +	  SPI bridge driver.
> +
> +	  Say M here if you want to support this hardware as a module.
> +	  The module will be named "solomon-ssd2825".
> +
>  config DRM_THINE_THC63LVD1024
>  	tristate "Thine THC63LVD1024 LVDS decoder bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97304b429a53..c621ab3fa3a9 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
>  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> +obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
>  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> diff --git a/drivers/gpu/drm/bridge/ssd2825.c b/drivers/gpu/drm/bridge/ssd2825.c
> new file mode 100644
> index 000000000000..823f6dc023a5
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ssd2825.c
> @@ -0,0 +1,741 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <video/mipi_display.h>
> +#include <video/videomode.h>
> +
> +#define SSD2825_DEVICE_ID_REG			0xb0
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_1	0xb1
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_2	0xb2
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_3	0xb3
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_4	0xb4
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_5	0xb5
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_6	0xb6
> +#define   SSD2825_NON_BURST			BIT(2)
> +#define   SSD2825_BURST				BIT(3)
> +#define   SSD2825_PCKL_HIGH			BIT(13)
> +#define   SSD2825_HSYNC_HIGH			BIT(14)
> +#define   SSD2825_VSYNC_HIGH			BIT(15)
> +#define SSD2825_CONFIGURATION_REG		0xb7
> +#define   SSD2825_CONF_REG_HS			BIT(0)
> +#define   SSD2825_CONF_REG_CKE			BIT(1)
> +#define   SSD2825_CONF_REG_SLP			BIT(2)
> +#define   SSD2825_CONF_REG_VEN			BIT(3)
> +#define   SSD2825_CONF_REG_HCLK			BIT(4)
> +#define   SSD2825_CONF_REG_CSS			BIT(5)
> +#define   SSD2825_CONF_REG_DCS			BIT(6)
> +#define   SSD2825_CONF_REG_REN			BIT(7)
> +#define   SSD2825_CONF_REG_ECD			BIT(8)
> +#define   SSD2825_CONF_REG_EOT			BIT(9)
> +#define   SSD2825_CONF_REG_LPE			BIT(10)
> +#define SSD2825_VC_CTRL_REG			0xb8
> +#define SSD2825_PLL_CTRL_REG			0xb9
> +#define SSD2825_PLL_CONFIGURATION_REG		0xba
> +#define SSD2825_CLOCK_CTRL_REG			0xbb
> +#define SSD2825_PACKET_SIZE_CTRL_REG_1		0xbc
> +#define SSD2825_PACKET_SIZE_CTRL_REG_2		0xbd
> +#define SSD2825_PACKET_SIZE_CTRL_REG_3		0xbe
> +#define SSD2825_PACKET_DROP_REG			0xbf
> +#define SSD2825_OPERATION_CTRL_REG		0xc0
> +#define SSD2825_MAX_RETURN_SIZE_REG		0xc1
> +#define SSD2825_RETURN_DATA_COUNT_REG		0xc2
> +#define SSD2825_ACK_RESPONSE_REG		0xc3
> +#define SSD2825_LINE_CTRL_REG			0xc4
> +#define SSD2825_INTERRUPT_CTRL_REG		0xc5
> +#define SSD2825_INTERRUPT_STATUS_REG		0xc6
> +#define SSD2825_ERROR_STATUS_REG		0xc7
> +#define SSD2825_DATA_FORMAT_REG			0xc8
> +#define SSD2825_DELAY_ADJ_REG_1			0xc9
> +#define SSD2825_DELAY_ADJ_REG_2			0xca
> +#define SSD2825_DELAY_ADJ_REG_3			0xcb
> +#define SSD2825_DELAY_ADJ_REG_4			0xcc
> +#define SSD2825_DELAY_ADJ_REG_5			0xcd
> +#define SSD2825_DELAY_ADJ_REG_6			0xce
> +#define SSD2825_HS_TX_TIMER_REG_1		0xcf
> +#define SSD2825_HS_TX_TIMER_REG_2		0xd0
> +#define SSD2825_LP_RX_TIMER_REG_1		0xd1
> +#define SSD2825_LP_RX_TIMER_REG_2		0xd2
> +#define SSD2825_TE_STATUS_REG			0xd3
> +#define SSD2825_SPI_READ_REG			0xd4
> +#define   SSD2825_SPI_READ_REG_RESET		0xfa
> +#define SSD2825_PLL_LOCK_REG			0xd5
> +#define SSD2825_TEST_REG			0xd6
> +#define SSD2825_TE_COUNT_REG			0xd7
> +#define SSD2825_ANALOG_CTRL_REG_1		0xd8
> +#define SSD2825_ANALOG_CTRL_REG_2		0xd9
> +#define SSD2825_ANALOG_CTRL_REG_3		0xda
> +#define SSD2825_ANALOG_CTRL_REG_4		0xdb
> +#define SSD2825_INTERRUPT_OUT_CTRL_REG		0xdc
> +#define SSD2825_RGB_INTERFACE_CTRL_REG_7	0xdd
> +#define SSD2825_LANE_CONFIGURATION_REG		0xde
> +#define SSD2825_DELAY_ADJ_REG_7			0xdf
> +#define SSD2825_INPUT_PIN_CTRL_REG_1		0xe0
> +#define SSD2825_INPUT_PIN_CTRL_REG_2		0xe1
> +#define SSD2825_BIDIR_PIN_CTRL_REG_1		0xe2
> +#define SSD2825_BIDIR_PIN_CTRL_REG_2		0xe3
> +#define SSD2825_BIDIR_PIN_CTRL_REG_3		0xe4
> +#define SSD2825_BIDIR_PIN_CTRL_REG_4		0xe5
> +#define SSD2825_BIDIR_PIN_CTRL_REG_5		0xe6
> +#define SSD2825_BIDIR_PIN_CTRL_REG_6		0xe7
> +#define SSD2825_BIDIR_PIN_CTRL_REG_7		0xe8
> +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_1	0xe9
> +#define SSD2825_CABC_BRIGHTNESS_CTRL_REG_2	0xea
> +#define SSD2825_CABC_BRIGHTNESS_STATUS_REG	0xeb
> +#define SSD2825_READ_REG			0xff
> +
> +#define SSD2825_COM_BYTE			0x00
> +#define SSD2825_DAT_BYTE			0x01
> +
> +#define	SSD2828_LP_CLOCK_DIVIDER(n)		(((n) - 1) & 0x3f)
> +#define SSD2825_LP_MIN_CLK			5000 /* KHz */
> +#define SSD2825_REF_MIN_CLK			2000 /* KHz */
> +
> +static const char * const ssd2825_supplies[] = {
> +	"dvdd", "avdd", "vddio"
> +};
> +
> +struct ssd2825_dsi_output {
> +	struct mipi_dsi_device *dev;
> +	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
> +};
> +
> +struct ssd2825_priv {
> +	struct spi_device *spi;
> +	struct device *dev;
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ssd2825_supplies)];
> +
> +	struct clk *tx_clk;
> +
> +	int enabled;
> +
> +	struct mipi_dsi_host dsi_host;
> +	struct drm_bridge bridge;
> +	struct ssd2825_dsi_output output;
> +
> +	u32 pd_lines;		/* number of Parallel Port Input Data Lines */
> +	u32 dsi_lanes;		/* number of DSI Lanes */
> +
> +	/* Parameters for PLL programming */
> +	u32 pll_freq_kbps;	/* PLL in kbps */
> +	u32 nibble_freq_khz;	/* PLL div by 4 */
> +
> +	u32 hzd;		/* HS Zero Delay in ns*/
> +	u32 hpd;		/* HS Prepare Delay is ns */
> +};
> +
> +static inline struct ssd2825_priv *dsi_host_to_ssd2825(struct mipi_dsi_host
> +							 *host)
> +{
> +	return container_of(host, struct ssd2825_priv, dsi_host);
> +}
> +
> +static inline struct ssd2825_priv *bridge_to_ssd2825(struct drm_bridge
> +						     *bridge)
> +{
> +	return container_of(bridge, struct ssd2825_priv, bridge);
> +}
> +
> +static int ssd2825_write_raw(struct ssd2825_priv *priv, u8 high_byte, u8 low_byte)
> +{
> +	struct spi_device *spi = priv->spi;
> +	u8 tx_buf[2];
> +
> +	/*
> +	 * Low byte is the value, high byte defines type of
> +	 * write cycle, 0 for command and 1 for data.
> +	 */
> +	tx_buf[0] = low_byte;
> +	tx_buf[1] = high_byte;
> +
> +	return spi_write(spi, tx_buf, 2);
> +}
> +
> +static int ssd2825_write_reg(struct ssd2825_priv *priv, u8 reg, u16 command)
> +{
> +	u8 datal = (command & 0x00FF);
> +	u8 datah = (command & 0xFF00) >> 8;
> +	int ret;
> +
> +	/* Command write cycle */
> +	ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> +	if (ret)
> +		return ret;
> +
> +	/* Data write cycle bits 7-0 */
> +	ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datal);
> +	if (ret)
> +		return ret;
> +
> +	/* Data write cycle bits 15-8 */
> +	ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, datah);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ssd2825_write_dsi(struct ssd2825_priv *priv, const u8 *command, int len)
> +{
> +	int ret, i;
> +
> +	ret = ssd2825_write_reg(priv, SSD2825_PACKET_SIZE_CTRL_REG_1, len);
> +	if (ret)
> +		return ret;
> +
> +	ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, SSD2825_PACKET_DROP_REG);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = ssd2825_write_raw(priv, SSD2825_DAT_BYTE, command[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ssd2825_read_raw(struct ssd2825_priv *priv, u8 cmd, u16 *data)
> +{
> +	struct spi_device *spi = priv->spi;
> +	struct spi_message msg;
> +	struct spi_transfer xfer[2];
> +	u8 tx_buf[2];
> +	u8 rx_buf[2];
> +	int ret;
> +
> +	memset(&xfer, 0, sizeof(xfer));
> +
> +	tx_buf[1] = (cmd & 0xFF00) >> 8;
> +	tx_buf[0] = (cmd & 0x00FF);
> +
> +	xfer[0].tx_buf = tx_buf;
> +	xfer[0].bits_per_word = 9;
> +	xfer[0].len = 2;
> +
> +	xfer[1].rx_buf = rx_buf;
> +	xfer[1].bits_per_word = 16;
> +	xfer[1].len = 2;
> +
> +	spi_message_init(&msg);
> +	spi_message_add_tail(&xfer[0], &msg);
> +	spi_message_add_tail(&xfer[1], &msg);
> +
> +	ret = spi_sync(spi, &msg);
> +	if (ret)
> +		dev_err(&spi->dev, "spi_sync_read failed %d\n", ret);
> +
> +	*data = rx_buf[1] | (rx_buf[0] << 8);
> +
> +	return 0;
> +}
> +
> +static int ssd2825_read_reg(struct ssd2825_priv *priv, u8 reg, u16 *data)
> +{
> +	int ret;
> +
> +	/* Reset the read register */
> +	ret = ssd2825_write_reg(priv, SSD2825_SPI_READ_REG, SSD2825_SPI_READ_REG_RESET);
> +	if (ret)
> +		return ret;
> +
> +	/* Push the address to read */
> +	ret = ssd2825_write_raw(priv, SSD2825_COM_BYTE, reg);
> +	if (ret)
> +		return ret;
> +
> +	/* Perform a reading cycle */
> +	ret = ssd2825_read_raw(priv, SSD2825_SPI_READ_REG_RESET, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int ssd2825_dsi_host_attach(struct mipi_dsi_host *host,
> +				   struct mipi_dsi_device *dev)
> +{
> +	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	struct device_node *ep;
> +	int ret;
> +
> +	if (dev->lanes > 4) {
> +		dev_err(priv->dev, "unsupported number of data lanes(%u)\n",
> +			dev->lanes);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * ssd2825 supports both Video and Pulse mode, but the driver only
> +	 * implements Video (event) mode currently
> +	 */
> +	if (!(dev->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> +		dev_err(priv->dev, "Only MIPI_DSI_MODE_VIDEO is supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0, &panel,
> +					  &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	priv->output.dev = dev;
> +	priv->output.bridge = bridge;
> +	priv->output.panel = panel;
> +
> +	priv->dsi_lanes = dev->lanes;
> +
> +	/* get input ep (port0/endpoint0) */
> +	ret = -EINVAL;
> +	ep = of_graph_get_endpoint_by_regs(host->dev->of_node, 0, 0);
> +	if (ep) {
> +		ret = of_property_read_u32(ep, "bus-width", &priv->pd_lines);
> +
> +		of_node_put(ep);
> +	}
> +
> +	if (ret)
> +		priv->pd_lines = mipi_dsi_pixel_format_to_bpp(dev->format);
> +
> +	drm_bridge_add(&priv->bridge);
> +
> +	return 0;
> +}
> +
> +static int ssd2825_dsi_host_detach(struct mipi_dsi_host *host,
> +				   struct mipi_dsi_device *dev)
> +{
> +	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> +
> +	drm_bridge_remove(&priv->bridge);
> +	if (priv->output.panel)
> +		drm_panel_bridge_remove(priv->output.bridge);
> +
> +	return 0;
> +}
> +
> +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> +					 const struct mipi_dsi_msg *msg)
> +{
> +	struct ssd2825_priv *priv = dsi_host_to_ssd2825(host);
> +	u8 buf = *(u8 *)msg->tx_buf;
> +	u16 config;
> +	int ret;
> +
> +	if (!priv->enabled) {
> +		dev_err(priv->dev, "Bridge is not enabled\n");
> +		return -ENODEV;
> +	}

No. See include/drm/drm_mipi_dsi.h:

 * Also note that those callbacks can be called no matter the state the
 * host is in. Drivers that need the underlying device to be powered to
 * perform these operations will first need to make sure it's been
 * properly enabled.


> +
> +	if (msg->rx_len) {
> +		dev_warn(priv->dev, "MIPI rx is not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &config);
> +	if (ret)
> +		return ret;
> +
> +	switch (msg->type) {
> +	case MIPI_DSI_DCS_SHORT_WRITE:
> +	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> +	case MIPI_DSI_DCS_LONG_WRITE:
> +		config |= SSD2825_CONF_REG_DCS;
> +		break;
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> +	case MIPI_DSI_GENERIC_LONG_WRITE:
> +		config &= ~SSD2825_CONF_REG_DCS;
> +		break;
> +	case MIPI_DSI_DCS_READ:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> +	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> +	default:
> +		return 0;
> +	}
> +
> +	ret = ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> +	if (ret)
> +		return ret;
> +
> +	ret = ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> +	if (ret)
> +		return ret;
> +
> +	ret = ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> +	if (ret)
> +		return ret;

Do you need any kind of locking in case there are two simultaneous
transfer operations?

> +
> +	if (buf == MIPI_DCS_SET_DISPLAY_ON) {
> +		ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> +				  SSD2825_CONF_REG_HS | SSD2825_CONF_REG_VEN |
> +				  SSD2825_CONF_REG_DCS | SSD2825_CONF_REG_ECD |
> +				  SSD2825_CONF_REG_EOT);

Most of these flags should be set depending on the
mipi_dsi_device.mode_flags.

> +		ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> +		ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);

It looks like this should be a part of the .atomic_enable() callback.

> +	}
> +
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops ssd2825_dsi_host_ops = {
> +	.attach = ssd2825_dsi_host_attach,
> +	.detach = ssd2825_dsi_host_detach,
> +	.transfer = ssd2825_dsi_host_transfer,
> +};
> +
> +static void ssd2825_hw_reset(struct ssd2825_priv *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +}
> +
> +/*
> + * PLL configuration register settings.
> + *
> + * See the "PLL Configuration Register Description" in the SSD2825 datasheet.
> + */
> +static u16 construct_pll_config(struct ssd2825_priv *priv,
> +				u32 desired_pll_freq_kbps, u32 reference_freq_khz)
> +{
> +	u32 div_factor = 1, mul_factor, fr = 0;
> +
> +	while (reference_freq_khz / (div_factor + 1) >= SSD2825_REF_MIN_CLK)
> +		div_factor++;
> +	if (div_factor > 31)
> +		div_factor = 31;
> +
> +	mul_factor = DIV_ROUND_UP(desired_pll_freq_kbps * div_factor,
> +				  reference_freq_khz);
> +
> +	priv->pll_freq_kbps = reference_freq_khz * mul_factor / div_factor;
> +	priv->nibble_freq_khz = priv->pll_freq_kbps / 4;
> +
> +	if (priv->pll_freq_kbps >= 501000)
> +		fr = 3;
> +	else if (priv->pll_freq_kbps >= 251000)
> +		fr = 2;
> +	else if (priv->pll_freq_kbps >= 126000)
> +		fr = 1;
> +
> +	return (fr << 14) | (div_factor << 8) | mul_factor;
> +}
> +
> +static u32 ssd2825_to_ns(u32 khz)
> +{
> +	return (1000 * 1000 / khz);
> +}
> +
> +static int ssd2825_setup_pll(struct ssd2825_priv *priv,
> +			     const struct drm_display_mode *mode)
> +{
> +	u16 pll_config, lp_div;
> +	u32 nibble_delay, pclk_mult, tx_freq_khz;
> +	u8 hzd, hpd;
> +
> +	tx_freq_khz = clk_get_rate(priv->tx_clk) / 1000;
> +	pclk_mult = priv->pd_lines / priv->dsi_lanes + 1;
> +	pll_config = construct_pll_config(priv, pclk_mult * mode->clock,
> +					  tx_freq_khz);
> +
> +	lp_div = priv->pll_freq_kbps / (SSD2825_LP_MIN_CLK * 8);
> +
> +	nibble_delay = ssd2825_to_ns(priv->nibble_freq_khz);
> +
> +	hzd = priv->hzd / nibble_delay;
> +	hpd = (priv->hpd - 4 * nibble_delay) / nibble_delay;
> +
> +	/* Disable PLL */
> +	ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0000);
> +	ssd2825_write_reg(priv, SSD2825_LINE_CTRL_REG, 0x0001);
> +
> +	/* Set delays */
> +	dev_dbg(priv->dev, "SSD2825_DELAY_ADJ_REG_1 0x%x\n", (hzd << 8) | hpd);

drm_dbg_driver() ?

> +	ssd2825_write_reg(priv, SSD2825_DELAY_ADJ_REG_1, (hzd << 8) | hpd);
> +
> +	/* Set PLL coeficients */
> +	dev_dbg(priv->dev, "SSD2825_PLL_CONFIGURATION_REG 0x%x\n", pll_config);
> +	ssd2825_write_reg(priv, SSD2825_PLL_CONFIGURATION_REG, pll_config);
> +
> +	/* Clock Control Register */
> +	dev_dbg(priv->dev, "SSD2825_CLOCK_CTRL_REG 0x%x\n",
> +		SSD2828_LP_CLOCK_DIVIDER(lp_div));
> +	ssd2825_write_reg(priv, SSD2825_CLOCK_CTRL_REG,
> +			  SSD2828_LP_CLOCK_DIVIDER(lp_div));
> +
> +	/* Enable PLL */
> +	ssd2825_write_reg(priv, SSD2825_PLL_CTRL_REG, 0x0001);
> +	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +
> +	return 0;
> +}
> +
> +static void ssd2825_bridge_pre_enable(struct drm_bridge *bridge)

Is there a reason not to use the .atomic versions?

> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	int ret;
> +
> +	if (priv->enabled)
> +		return;
> +
> +	/* Power Sequence */
> +	ret = clk_prepare_enable(priv->tx_clk);
> +	if (ret < 0)
> +		dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
> +	if (ret < 0)
> +		dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
> +
> +	usleep_range(1000, 2000);
> +
> +	ssd2825_hw_reset(priv);
> +
> +	priv->enabled = true;
> +}
> +
> +static void ssd2825_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	struct mipi_dsi_device *dsi_dev = priv->output.dev;
> +	unsigned long mode_flags = dsi_dev->mode_flags;
> +	const struct drm_display_mode *mode =
> +		&bridge->encoder->crtc->state->adjusted_mode;

If you'd used atomic callbacks, you could have gone through the state to
get corresponding data. Your main driver can be atomic, in which case
you should not be using encoder->crtc and crtc->state.

> +	struct device *dev = priv->dev;
> +	u8 pixel_format;
> +
> +	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> +		dev_warn_once(dev,
> +			      "Non-continuous mode unimplemented, falling back to continuous\n");
> +		mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	}
> +
> +	if (mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +		dev_warn_once(dev,
> +			      "Burst mode unimplemented, falling back to simple\n");
> +		mode_flags &= ~MIPI_DSI_MODE_VIDEO_BURST;

This should be declined earlier, e.g. in the dsi_attach.

> +	}
> +
> +	/* Perform SW reset */
> +	ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> +
> +	switch (dsi_dev->format) {
> +	case MIPI_DSI_FMT_RGB565:
> +		pixel_format = 0x00;
> +		break;
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		pixel_format = 0x01;
> +		break;
> +	case MIPI_DSI_FMT_RGB666:
> +		pixel_format = 0x02;
> +		break;
> +	case MIPI_DSI_FMT_RGB888:
> +	default:
> +		pixel_format = 0x03;
> +		break;
> +	}
> +
> +	/* Set panel timings */
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> +			  ((mode->vtotal - mode->vsync_end) << 8) |
> +			  (mode->htotal - mode->hsync_end));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> +			  ((mode->vtotal - mode->vsync_start) << 8) |
> +			  (mode->htotal - mode->hsync_start));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> +			  ((mode->vsync_start - mode->vdisplay) << 8) |
> +			  (mode->hsync_start - mode->hdisplay));
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->hdisplay);
> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->vdisplay);

Please check that the mode fits into corresponding bit fields in
.mode_valid().

> +	ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6,
> +			  SSD2825_HSYNC_HIGH | SSD2825_VSYNC_HIGH |
> +			  SSD2825_PCKL_HIGH | SSD2825_NON_BURST |

These flags should come from drm_display_mode

> +			  pixel_format);
> +
> +	ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->lanes - 1);
> +	ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> +
> +	/* Call PLL configuration */
> +	ssd2825_setup_pll(priv, mode);
> +
> +	usleep_range(10000, 11000);
> +
> +	/* Initial DSI configuration register set */
> +	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> +			  SSD2825_CONF_REG_CKE | SSD2825_CONF_REG_DCS |
> +			  SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT);
> +	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +}
> +
> +static void ssd2825_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +	int ret;
> +
> +	if (!priv->enabled)
> +		return;
> +
> +	msleep(100);
> +
> +	/* Exit DSI configuration register set */
> +	ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG,
> +			  SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT);
> +	ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> +
> +	/* HW disable */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(priv->supplies),
> +				     priv->supplies);
> +	if (ret < 0)
> +		dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
> +
> +	clk_disable_unprepare(priv->tx_clk);
> +
> +	priv->enabled = false;
> +}
> +
> +static int ssd2825_bridge_attach(struct drm_bridge *bridge,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, priv->output.bridge, bridge,
> +				 flags);
> +}
> +
> +static enum drm_mode_status
> +ssd2825_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{

No resulution / clock limitations?

> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs ssd2825_bridge_funcs = {
> +	.attach = ssd2825_bridge_attach,
> +	.mode_valid = ssd2825_bridge_mode_valid,
> +	.pre_enable = ssd2825_bridge_pre_enable,
> +	.enable = ssd2825_bridge_enable,
> +	.disable = ssd2825_bridge_disable,
> +};
> +
> +static int ssd2825_probe(struct spi_device *spi)
> +{
> +	struct ssd2825_priv *priv;
> +	struct device *dev = &spi->dev;
> +	struct device_node *np = dev->of_node;
> +	int i, ret;
> +
> +	/* Driver supports only this mode for now */
> +	spi->bits_per_word = 9;
> +
> +	ret = spi_setup(spi);
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, priv);
> +	priv->spi = spi;
> +
> +	dev_set_drvdata(dev, priv);
> +	priv->dev = dev;
> +
> +	priv->tx_clk = devm_clk_get_optional(dev, "tx_clk");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "can't retrieve bridge tx_clk\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(priv->supplies); ++i)
> +		priv->supplies[i].supply = ssd2825_supplies[i];

You can use devm_regulator_bulk_get_const() instead.

> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(priv->supplies),
> +				      priv->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ret = device_property_read_u32(dev, "solomon,hs-zero-delay-ns", &priv->hzd);
> +	if (ret)
> +		/* If no hs-zero-delay is set by device tree, use the default 133 ns */
> +		priv->hzd = 133;
> +
> +	ret = device_property_read_u32(dev, "solomon,hs-prep-delay-ns", &priv->hpd);
> +	if (ret)
> +		/* If no hs-prep-delay is set by device tree, use the default 40 ns */
> +		priv->hzd = 40;
> +
> +	priv->dsi_host.dev = dev;
> +	priv->dsi_host.ops = &ssd2825_dsi_host_ops;
> +
> +	priv->bridge.funcs = &ssd2825_bridge_funcs;
> +	priv->bridge.of_node = np;
> +
> +	return mipi_dsi_host_register(&priv->dsi_host);
> +}
> +
> +static void ssd2825_remove(struct spi_device *spi)
> +{
> +	struct ssd2825_priv *priv = spi_get_drvdata(spi);
> +
> +	mipi_dsi_host_unregister(&priv->dsi_host);
> +}
> +
> +static const struct of_device_id ssd2825_of_match[] = {
> +	{ .compatible = "solomon,ssd2825" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ssd2825_of_match);
> +
> +static struct spi_driver ssd2825_driver = {
> +	.driver = {
> +		.name = "ssd2825",
> +		.of_match_table = ssd2825_of_match,
> +	},
> +	.probe = ssd2825_probe,
> +	.remove = ssd2825_remove,
> +};
> +module_spi_driver(ssd2825_driver);
> +
> +MODULE_DESCRIPTION("Solomon SSD2825 RGB to MIPI-DSI bridge driver SPI");
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
