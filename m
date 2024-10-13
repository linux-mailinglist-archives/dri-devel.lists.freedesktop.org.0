Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F999BCC9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 01:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2D210E25C;
	Sun, 13 Oct 2024 23:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fo/ZiJ0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA0510E25C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 23:58:39 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fac6b3c220so46318431fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 16:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728863917; x=1729468717; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XF7zktIpoqfDes469lShZX/thZO8oaKe9d1Y1nOb/ys=;
 b=fo/ZiJ0XQNCrgCsWkY1U03HEvl0byJDPjQc7OVAsfbGybMZKKWIm611hMcXgGqHfCS
 Qm4brYU6VA+iTLaprm2yHlnwkp7ftrZl5DUmfZzJ83uZNJT5EAsd0Ou1CJmq0gEDJ9wW
 97nuS866Pmx+OCqm5HMeTVot30Tu/oUu60CrHhu5juTN/T6j69q0z8fdMaUzTmNtX/jP
 nIvr5XeoIEwo10cyn9SD9MNlCjkD2m8vw6tEiTF1cwQVxBfyOJALRsPkJPVsUR99Nh3r
 0lqxr0APzv+RlwnI7hpymzv2T00xVvI2Qbq8lyXQ0JHiCo5jpqihIQ8cXPBOy0qmeIrH
 O+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728863917; x=1729468717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XF7zktIpoqfDes469lShZX/thZO8oaKe9d1Y1nOb/ys=;
 b=s1jyiOqAgj6mc6M54f60oH6wPlbUDKHtoqLibbKcy3eDwl05b3cwafOE++OKRZfuIF
 woev6srqTgIkGPvXSLOvNl9uXvR2pBYtiJg5XCuT+klRNi7nWg32SBjfW0z+Bjp4GUju
 KzdR93z1K3lFFSnTMV+mSxXJvBH9oM2aLgFjLTlYx3nklVSflD/pARWZpAC4NGhHbKwP
 Z0B+H3uyR4wAt4IkbjvwIdjfmFImcpX/fN44PCtxBgc/goX3L/BOv2PSqh/n8QbGoSpb
 qJvT1DH3GI63JwXC7Et6alAUGsjmO1m2dn+UsS/st71Mx7+WyXPdw2veETuKMI+nlpZL
 tN1A==
X-Gm-Message-State: AOJu0Ywuk3310iLZgjuuqt+byQiZJ5NuA+2cvM5ZlsytFqjOug7VyNN5
 pKXQTCObuR5nySc/JmRbv1A1ldDPqvDs+KWUCRPHcsy6G3X2gBeVa3niUfnpr00=
X-Google-Smtp-Source: AGHT+IF1ex0WQK3jdMI7w0YsSG3JMtE6/tumlQLrIsJ0Mc9EZgoU7rvwkj2lfzUf8Or3IlyX1sWAwg==
X-Received: by 2002:a2e:a988:0:b0:2fb:4db1:1ab7 with SMTP id
 38308e7fff4ca-2fb4db11f32mr7851361fa.39.1728863916755; 
 Sun, 13 Oct 2024 16:58:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb4a265e73sm3571991fa.105.2024.10.13.16.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 16:58:35 -0700 (PDT)
Date: Mon, 14 Oct 2024 02:58:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <hdgh3mto5b2alygxxxv55km4yucjdnldd3zxxecqwm552ltk2q@z7tea4374gi2>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
 <78fb51c5-4568-4f91-a25f-e4ea4bfbd7ee@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fb51c5-4568-4f91-a25f-e4ea4bfbd7ee@nxp.com>
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

On Sat, Oct 12, 2024 at 06:01:30PM +0800, Liu Ying wrote:
> On 10/12/2024, Dmitry Baryshkov wrote:
> > On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> >> Add basic HDMI video output support. Currently, only RGB888 output
> >> pixel format is supported.  At the LVDS input side, the driver
> >> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> >> mapping.
> >>
> >> Product link:
> >> https://www.ite.com.tw/en/product/cate1/IT6263
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >> v2:
> >> * Add AVI inforframe support.  (Maxime)
> > 
> > Maxime asked to wire up the HDMI Connector framework. I have pushed the
> > patch that converts lt9611.c driver. Please implement similar changes in
> > your driver.
> 
> Hmm, didn't fully get the meaning of "the new HDMI bridge infrastructure"
> maxime asked.  Ok, will take a look at lt9611.c.
> 
> > 
> >> * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> >> * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> >> * Check number of LVDS link data lanes.  (Biju)
> >>
> >>  drivers/gpu/drm/bridge/Kconfig      |   8 +
> >>  drivers/gpu/drm/bridge/Makefile     |   1 +
> >>  drivers/gpu/drm/bridge/ite-it6263.c | 919 ++++++++++++++++++++++++++++
> >>  3 files changed, 928 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> >>
> >> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >> index 3eb955333c80..93f99682a090 100644
> >> --- a/drivers/gpu/drm/bridge/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/Kconfig
> >> @@ -90,6 +90,14 @@ config DRM_FSL_LDB
> >>  	help
> >>  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
> >>  
> >> +config DRM_ITE_IT6263
> >> +	tristate "ITE IT6263 LVDS/HDMI bridge"
> >> +	depends on OF
> >> +	select DRM_KMS_HELPER
> >> +	select REGMAP_I2C
> >> +	help
> >> +	  ITE IT6263 LVDS to HDMI bridge chip driver.
> >> +
> >>  config DRM_ITE_IT6505
> >>  	tristate "ITE IT6505 DisplayPort bridge"
> >>  	depends on OF
> >> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> >> index 7df87b582dca..f3776dd473fd 100644
> >> --- a/drivers/gpu/drm/bridge/Makefile
> >> +++ b/drivers/gpu/drm/bridge/Makefile
> >> @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
> >>  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> >>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
> >>  obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
> >> +obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
> >>  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> >>  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> >>  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> >> new file mode 100644
> >> index 000000000000..9b3318792f15
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> >> @@ -0,0 +1,919 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright 2024 NXP
> >> + */
> >> +
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/delay.h>
> >> +#include <linux/gpio/consumer.h>
> >> +#include <linux/hdmi.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/media-bus-format.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/regmap.h>
> >> +#include <linux/regulator/consumer.h>
> >> +
> >> +#include <drm/drm_atomic.h>
> >> +#include <drm/drm_atomic_helper.h>
> >> +#include <drm/drm_atomic_state_helper.h>
> >> +#include <drm/drm_bridge.h>
> >> +#include <drm/drm_connector.h>
> >> +#include <drm/drm_crtc.h>
> >> +#include <drm/drm_edid.h>
> >> +#include <drm/drm_of.h>
> >> +#include <drm/drm_probe_helper.h>
> >> +
> >> +/* -----------------------------------------------------------------------------
> >> + * LVDS registers
> >> + */
> >> +
> >> +/* LVDS software reset registers */
> >> +#define LVDS_REG_05			0x05
> >> +#define  REG_SOFT_P_RST			BIT(1)
> >> +
> >> +/* LVDS system configuration registers */
> >> +/* 0x0b */
> >> +#define LVDS_REG_0B			0x0b
> >> +#define  REG_SSC_PCLK_RF		BIT(0)
> >> +#define  REG_LVDS_IN_SWAP		BIT(1)
> >> +
> >> +/* LVDS test pattern gen control registers */
> >> +/* 0x2c */
> >> +#define LVDS_REG_2C			0x2c
> >> +#define  REG_COL_DEP			GENMASK(1, 0)
> >> +#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
> >> +#define  OUT_MAP			BIT(4)
> >> +#define  JEIDA				0
> >> +#define  REG_DESSC_ENB			BIT(6)
> >> +#define  DMODE				BIT(7)
> >> +#define  DISO				BIT(7)
> >> +#define  SISO				0
> >> +
> >> +#define LVDS_REG_3C			0x3c
> >> +#define LVDS_REG_3F			0x3f
> >> +#define LVDS_REG_47			0x47
> >> +#define LVDS_REG_48			0x48
> >> +#define LVDS_REG_4F			0x4f
> >> +#define LVDS_REG_52			0x52
> >> +
> >> +/* -----------------------------------------------------------------------------
> >> + * HDMI registers are separated into three banks:
> >> + * 1) HDMI register common bank: 0x00 ~ 0x2f
> >> + */
> >> +
> >> +/* HDMI genernal registers */
> >> +#define HDMI_REG_SW_RST			0x04
> >> +#define  SOFTREF_RST			BIT(5)
> >> +#define  SOFTA_RST			BIT(4)
> >> +#define  SOFTV_RST			BIT(3)
> >> +#define  AUD_RST			BIT(2)
> >> +#define  HDCP_RST			BIT(0)
> >> +#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
> >> +					 AUD_RST | HDCP_RST)
> >> +
> >> +#define HDMI_REG_SYS_STATUS		0x0e
> >> +#define  HPDETECT			BIT(6)
> >> +#define  TXVIDSTABLE			BIT(4)
> >> +
> >> +#define HDMI_REG_BANK_CTRL		0x0f
> >> +#define  REG_BANK_SEL			BIT(0)
> >> +
> >> +/* HDMI System DDC control registers */
> >> +#define HDMI_REG_DDC_MASTER_CTRL	0x10
> >> +#define  MASTER_SEL_HOST		BIT(0)
> >> +
> >> +#define HDMI_REG_DDC_HEADER		0x11
> >> +
> >> +#define HDMI_REG_DDC_REQOFF		0x12
> >> +#define HDMI_REG_DDC_REQCOUNT		0x13
> >> +#define HDMI_REG_DDC_EDIDSEG		0x14
> >> +
> >> +#define HDMI_REG_DDC_CMD		0x15
> >> +#define  DDC_CMD_EDID_READ		0x3
> >> +#define  DDC_CMD_FIFO_CLR		0x9
> >> +
> >> +#define HDMI_REG_DDC_STATUS		0x16
> >> +#define  DDC_DONE			BIT(7)
> >> +#define  DDC_NOACK			BIT(5)
> >> +#define  DDC_WAITBUS			BIT(4)
> >> +#define  DDC_ARBILOSE			BIT(3)
> >> +#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
> >> +
> >> +#define HDMI_DDC_FIFO_BYTES		32
> >> +#define HDMI_REG_DDC_READFIFO		0x17
> >> +#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
> >> +#define HDMI_REG_LVDS_PORT_EN		0x1e
> >> +#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
> >> +
> >> +/* -----------------------------------------------------------------------------
> >> + * 2) HDMI register bank0: 0x30 ~ 0xff
> >> + */
> >> +
> >> +/* HDMI AFE registers */
> >> +#define HDMI_REG_AFE_DRV_CTRL		0x61
> >> +#define  AFE_DRV_PWD			BIT(5)
> >> +#define  AFE_DRV_RST			BIT(4)
> >> +
> >> +#define HDMI_REG_AFE_XP_CTRL		0x62
> >> +#define  AFE_XP_GAINBIT			BIT(7)
> >> +#define  AFE_XP_ER0			BIT(4)
> >> +#define  AFE_XP_RESETB			BIT(3)
> >> +
> >> +#define HDMI_REG_AFE_ISW_CTRL		0x63
> >> +
> >> +#define HDMI_REG_AFE_IP_CTRL		0x64
> >> +#define  AFE_IP_GAINBIT			BIT(7)
> >> +#define  AFE_IP_ER0			BIT(3)
> >> +#define  AFE_IP_RESETB			BIT(2)
> >> +
> >> +/* HDMI input data format registers */
> >> +#define HDMI_REG_INPUT_MODE		0x70
> >> +#define  IN_RGB				0x00
> >> +
> >> +/* HDMI general control registers */
> >> +#define HDMI_REG_HDMI_MODE		0xc0
> >> +#define  TX_HDMI_MODE			BIT(0)
> >> +
> >> +#define HDMI_REG_GCP			0xc1
> >> +#define  AVMUTE				BIT(0)
> >> +#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
> >> +#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
> >> +
> >> +#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
> >> +#define  ENABLE_PKT			BIT(0)
> >> +#define  REPEAT_PKT			BIT(1)
> >> +
> >> +/* -----------------------------------------------------------------------------
> >> + * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
> >> + */
> >> +
> >> +/* AVI packet registers */
> >> +#define HDMI_REG_AVI_DB1		0x158
> >> +#define HDMI_REG_AVI_DB2		0x159
> >> +#define HDMI_REG_AVI_DB3		0x15a
> >> +#define HDMI_REG_AVI_DB4		0x15b
> >> +#define HDMI_REG_AVI_DB5		0x15c
> >> +#define HDMI_REG_AVI_CSUM		0x15d
> >> +#define HDMI_REG_AVI_DB6		0x15e
> >> +#define HDMI_REG_AVI_DB7		0x15f
> >> +#define HDMI_REG_AVI_DB8		0x160
> >> +#define HDMI_REG_AVI_DB9		0x161
> >> +#define HDMI_REG_AVI_DB10		0x162
> >> +#define HDMI_REG_AVI_DB11		0x163
> >> +#define HDMI_REG_AVI_DB12		0x164
> >> +#define HDMI_REG_AVI_DB13		0x165
> >> +
> >> +#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 + 1)
> >> +#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6 + 1)
> >> +
> >> +#define MAX_PIXEL_CLOCK_KHZ		150000
> >> +#define HIGH_PIXEL_CLOCK_KHZ		80000
> >> +
> >> +struct it6263 {
> >> +	struct device *dev;
> >> +	struct i2c_client *hdmi_i2c;
> >> +	struct i2c_client *lvds_i2c;
> >> +	struct regmap *hdmi_regmap;
> >> +	struct regmap *lvds_regmap;
> >> +	struct drm_bridge bridge;
> >> +	struct drm_bridge *next_bridge;
> >> +	struct drm_connector connector;
> >> +	struct gpio_desc *reset_gpio;
> >> +	u8 lvds_link_num_dlanes;
> >> +	bool lvds_dual_link;
> >> +	bool lvds_link12_swap;
> >> +};
> >> +
> >> +static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
> >> +{
> >> +	return container_of(bridge, struct it6263, bridge);
> >> +}
> >> +
> >> +static inline struct it6263 *connector_to_it6263(struct drm_connector *conn)
> >> +{
> >> +	return container_of(conn, struct it6263, connector);
> >> +}
> >> +
> >> +static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	switch (reg) {
> >> +	case HDMI_REG_SW_RST:
> >> +	case HDMI_REG_BANK_CTRL:
> >> +	case HDMI_REG_DDC_MASTER_CTRL:
> >> +	case HDMI_REG_DDC_HEADER:
> >> +	case HDMI_REG_DDC_REQOFF:
> >> +	case HDMI_REG_DDC_REQCOUNT:
> >> +	case HDMI_REG_DDC_EDIDSEG:
> >> +	case HDMI_REG_DDC_CMD:
> >> +	case HDMI_REG_LVDS_PORT:
> >> +	case HDMI_REG_LVDS_PORT_EN:
> >> +	case HDMI_REG_AFE_DRV_CTRL:
> >> +	case HDMI_REG_AFE_XP_CTRL:
> >> +	case HDMI_REG_AFE_ISW_CTRL:
> >> +	case HDMI_REG_AFE_IP_CTRL:
> >> +	case HDMI_REG_INPUT_MODE:
> >> +	case HDMI_REG_HDMI_MODE:
> >> +	case HDMI_REG_GCP:
> >> +	case HDMI_REG_PKT_GENERAL_CTRL:
> >> +	case HDMI_REG_AVI_DB1:
> >> +	case HDMI_REG_AVI_DB2:
> >> +	case HDMI_REG_AVI_DB3:
> >> +	case HDMI_REG_AVI_DB4:
> >> +	case HDMI_REG_AVI_DB5:
> >> +	case HDMI_REG_AVI_CSUM:
> >> +	case HDMI_REG_AVI_DB6:
> >> +	case HDMI_REG_AVI_DB7:
> >> +	case HDMI_REG_AVI_DB8:
> >> +	case HDMI_REG_AVI_DB9:
> >> +	case HDMI_REG_AVI_DB10:
> >> +	case HDMI_REG_AVI_DB11:
> >> +	case HDMI_REG_AVI_DB12:
> >> +	case HDMI_REG_AVI_DB13:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >> +static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	if (it6263_hdmi_writeable_reg(dev, reg))
> >> +		return true;
> >> +
> >> +	switch (reg) {
> >> +	case HDMI_REG_SYS_STATUS:
> >> +	case HDMI_REG_DDC_STATUS:
> >> +	case HDMI_REG_DDC_READFIFO:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >> +static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	switch (reg) {
> >> +	case HDMI_REG_SW_RST:
> >> +	case HDMI_REG_SYS_STATUS:
> >> +	case HDMI_REG_DDC_STATUS:
> >> +	case HDMI_REG_DDC_READFIFO:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >> +static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
> >> +	.range_min = 0x00,
> >> +	.range_max = HDMI_REG_AVI_DB13,
> >> +	.selector_reg = HDMI_REG_BANK_CTRL,
> >> +	.selector_mask = REG_BANK_SEL,
> >> +	.selector_shift = 0,
> >> +	.window_start = 0x00,
> >> +	.window_len = 0x100,
> >> +};
> >> +
> >> +static const struct regmap_config it6263_hdmi_regmap_config = {
> >> +	.name = "it6263-hdmi",
> >> +	.reg_bits = 8,
> >> +	.val_bits = 8,
> >> +	.writeable_reg = it6263_hdmi_writeable_reg,
> >> +	.readable_reg = it6263_hdmi_readable_reg,
> >> +	.volatile_reg = it6263_hdmi_volatile_reg,
> >> +	.max_register = HDMI_REG_AVI_DB13,
> >> +	.ranges = &it6263_hdmi_range_cfg,
> >> +	.num_ranges = 1,
> >> +	.cache_type = REGCACHE_MAPLE,
> >> +};
> >> +
> >> +static bool it6263_lvds_writeable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	switch (reg) {
> >> +	case LVDS_REG_05:
> >> +	case LVDS_REG_0B:
> >> +	case LVDS_REG_2C:
> >> +	case LVDS_REG_3C:
> >> +	case LVDS_REG_3F:
> >> +	case LVDS_REG_47:
> >> +	case LVDS_REG_48:
> >> +	case LVDS_REG_4F:
> >> +	case LVDS_REG_52:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >> +static bool it6263_lvds_readable_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	return it6263_lvds_writeable_reg(dev, reg);
> >> +}
> >> +
> >> +static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int reg)
> >> +{
> >> +	return reg == LVDS_REG_05;
> >> +}
> >> +
> >> +static const struct regmap_config it6263_lvds_regmap_config = {
> >> +	.name = "it6263-lvds",
> >> +	.reg_bits = 8,
> >> +	.val_bits = 8,
> >> +	.writeable_reg = it6263_lvds_writeable_reg,
> >> +	.readable_reg = it6263_lvds_readable_reg,
> >> +	.volatile_reg = it6263_lvds_volatile_reg,
> >> +	.max_register = LVDS_REG_52,
> >> +	.cache_type = REGCACHE_MAPLE,
> >> +};
> >> +
> >> +static const char * const it6263_supplies[] = {
> >> +	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
> >> +	"avcc", "anvdd", "apvdd"
> >> +};
> >> +
> >> +static int it6263_parse_dt(struct it6263 *it)
> >> +{
> >> +	struct device *dev = it->dev;
> >> +	struct device_node *port0, *port1;
> >> +	int ret;
> >> +
> >> +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
> >> +				  &it->lvds_link_num_dlanes);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> >> +			ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> >> +	if (IS_ERR(it->next_bridge))
> >> +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> >> +				     "failed to get next bridge\n");
> >> +
> >> +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
> >> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> >> +	if (port0 && port1) {
> >> +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> >> +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> >> +			it->lvds_dual_link = true;
> >> +			it->lvds_link12_swap = true;
> > 
> > This is a nice name for the propery in the Dual Link LVDS case:
> > 
> > ite,lvds-link-swap
> 
> Swapping LVDS link1&2 is implied by the dual-lvds-{even,odd}-pixels
> properties that DT writers specify in port@0 and port@1.
> 
> The DT writers don't need to use a dedicated property like
> ite,lvds-link-swap to explicitly indicate the swap.

Ack

> 
> > 
> > 
> >> +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> >> +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> >> +			it->lvds_dual_link = true;
> >> +		}
> >> +
> >> +		if (!it->lvds_dual_link) {
> >> +			dev_err(dev,
> >> +				"failed to get LVDS dual link pixel order\n");
> >> +			ret = -EINVAL;
> >> +		}
> >> +	} else if (port1) {
> >> +		ret = -EINVAL;
> >> +		dev_err(dev, "single input LVDS port1 is not supported\n");
> >> +	} else if (!port0) {
> >> +		ret = -EINVAL;
> >> +		dev_err(dev, "no input LVDS port\n");
> >> +	}
> >> +
> >> +	of_node_put(port0);
> >> +	of_node_put(port1);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static inline void it6263_hw_reset(struct it6263 *it)
> >> +{
> >> +	if (!it->reset_gpio)
> >> +		return;
> >> +
> >> +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> >> +	fsleep(1000);
> >> +	gpiod_set_value_cansleep(it->reset_gpio, 1);
> >> +	/* The chip maker says the low pulse should be at least 40ms. */
> >> +	fsleep(40000);
> >> +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> >> +	/* addtional time to wait the high voltage to be stable */
> >> +	fsleep(5000);
> >> +}
> >> +
> >> +static inline int it6263_lvds_set_i2c_addr(struct it6263 *it)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
> >> +			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
> >> +}
> >> +
> >> +static inline void it6263_lvds_reset(struct it6263 *it)
> >> +{
> >> +	/* AFE PLL reset */
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
> >> +	fsleep(1000);
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
> >> +
> >> +	/* software pixel clock domain reset */
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
> >> +			  REG_SOFT_P_RST);
> >> +	fsleep(1000);
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
> >> +	fsleep(10000);
> >> +}
> >> +
> >> +static inline void it6263_lvds_set_interface(struct it6263 *it)
> >> +{
> >> +	/* color depth */
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> >> +	/* output mapping */
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> >> +
> >> +	if (it->lvds_dual_link) {
> >> +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> >> +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
> >> +	} else {
> >> +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
> >> +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
> >> +	}
> >> +}
> >> +
> >> +static inline void it6263_lvds_set_afe(struct it6263 *it)
> >> +{
> >> +	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
> >> +	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
> >> +	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
> >> +	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
> >> +	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
> >> +
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
> >> +			  REG_SSC_PCLK_RF);
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
> >> +			  REG_DESSC_ENB);
> >> +}
> >> +
> >> +static inline void it6263_lvds_sys_cfg(struct it6263 *it)
> >> +{
> >> +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
> >> +			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0);
> >> +}
> >> +
> >> +static inline void it6263_lvds_config(struct it6263 *it)
> >> +{
> >> +	it6263_lvds_reset(it);
> >> +	it6263_lvds_set_interface(it);
> >> +	it6263_lvds_set_afe(it);
> >> +	it6263_lvds_sys_cfg(it);
> >> +}
> >> +
> >> +static inline void it6263_hdmi_config(struct it6263 *it)
> >> +{
> >> +	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
> >> +	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
> >> +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
> >> +			  HDMI_COLOR_DEPTH_24);
> >> +}
> >> +
> >> +static enum drm_connector_status it6263_detect(struct it6263 *it)
> >> +{
> >> +	unsigned int val;
> >> +
> >> +	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
> >> +	if (val & HPDETECT)
> >> +		return connector_status_connected;
> >> +	else
> >> +		return connector_status_disconnected;
> >> +}
> >> +
> >> +static enum drm_connector_status
> >> +it6263_connector_detect(struct drm_connector *connector, bool force)
> >> +{
> >> +	struct it6263 *it = connector_to_it6263(connector);
> >> +
> >> +	return it6263_detect(it);
> >> +}
> >> +
> >> +static const struct drm_connector_funcs it6263_connector_funcs = {
> >> +	.detect = it6263_connector_detect,
> >> +	.fill_modes = drm_helper_probe_single_connector_modes,
> >> +	.destroy = drm_connector_cleanup,
> >> +	.reset = drm_atomic_helper_connector_reset,
> >> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> >> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> >> +};
> >> +
> >> +static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
> >> +{
> >> +	struct it6263 *it = data;
> >> +	struct regmap *regmap = it->hdmi_regmap;
> >> +	unsigned int start = (block % 2) * EDID_LENGTH;
> >> +	unsigned int segment = block >> 1;
> >> +	unsigned int count, val;
> >> +	int ret;
> >> +
> >> +	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
> >> +	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
> >> +	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
> >> +
> >> +	while (len) {
> >> +		/* clear DDC FIFO */
> >> +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
> >> +
> >> +		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
> >> +					       val, val & DDC_DONE,
> >> +					       2000, 10000);
> >> +		if (ret) {
> >> +			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
> >> +
> >> +		/* fire the read command */
> >> +		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
> >> +		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
> >> +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
> >> +
> >> +		start += count;
> >> +		len -= count;
> >> +
> >> +		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
> >> +					       val & (DDC_DONE | DDC_ERROR),
> >> +					       20000, 250000);
> >> +		if (ret && !(val & DDC_ERROR)) {
> >> +			dev_err(it->dev, "failed to read EDID:%d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		if (val & DDC_ERROR) {
> >> +			dev_err(it->dev, "DDC error\n");
> >> +			return -EIO;
> >> +		}
> >> +
> >> +		/* cache to buffer */
> >> +		for (; count > 0; count--) {
> >> +			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
> >> +			*(buf++) = val;
> >> +		}
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int it6263_connector_get_modes(struct drm_connector *connector)
> >> +{
> >> +	struct it6263 *it = connector_to_it6263(connector);
> >> +	const struct drm_edid *drm_edid;
> >> +	int count;
> >> +
> >> +	drm_edid = drm_edid_read_custom(connector, it6263_read_edid, it);
> >> +
> >> +	drm_edid_connector_update(connector, drm_edid);
> >> +	count = drm_edid_connector_add_modes(connector);
> >> +
> >> +	drm_edid_free(drm_edid);
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static const struct drm_connector_helper_funcs it6263_connector_helper_funcs = {
> >> +	.get_modes = it6263_connector_get_modes,
> >> +};
> >> +
> >> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> >> +				      struct drm_bridge_state *bridge_state,
> >> +				      struct drm_crtc_state *crtc_state,
> >> +				      struct drm_connector_state *conn_state)
> >> +{
> >> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > 
> > Use drm_atomic_helper_connector_hdmi_check().
> 
> Will take a look at this.
> 
> > 
> > Implement .hdmi_tmds_char_rate_valid(). Also, I think, single and dual
> 
> Will take a look at this.
> 
> > link LVDS have different max clock rates. Please correct me if I'm
> > wrong.
> 
> Yes, I think so too.  But, I don't know the exact max clock rates.
> IT6263 data sheet only says LVDS RX supports clock rate up to
> 150MHz.

Is this the mode clock or the LVDS link clock rate?

> 
> > 
> >> +
> >> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
> >> +}
> >> +
> >> +static void
> >> +it6263_bridge_atomic_disable(struct drm_bridge *bridge,
> >> +			     struct drm_bridge_state *old_bridge_state)
> >> +{
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +
> >> +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
> >> +	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
> >> +	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
> >> +		     AFE_DRV_RST | AFE_DRV_PWD);
> >> +}
> >> +
> >> +static void
> >> +it6263_hdmi_avi_infoframe_configure(struct it6263 *it,
> >> +				    struct drm_connector *connector,
> >> +				    const struct drm_display_mode *mode)
> > 
> > -> .hdmi_write_infoframe() , .hdmi_clear_infoframe().
> 
> 
> Will take a look at them.
> 
> > 
> >> +{
> >> +	struct hdmi_avi_infoframe frame;
> >> +	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
> >> +	int ret;
> >> +
> >> +	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
> >> +	if (ret) {
> >> +		dev_err(it->dev, "failed to setup AVI infoframe: %d\n", ret);
> >> +		return;
> >> +	}
> >> +
> >> +	ret = hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
> >> +	if (ret < 0) {
> >> +		dev_err(it->dev, "failed to pack infoframe: %d\n", ret);
> >> +		return;
> >> +	}
> >> +
> >> +	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
> >> +	ret = regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB1,
> >> +				&buf[HDMI_INFOFRAME_HEADER_SIZE],
> >> +				HDMI_AVI_DB_CHUNK1_SIZE);
> >> +	if (ret) {
> >> +		dev_err(it->dev, "failed to write the 1st AVI infoframe data byte chunk: %d\n",
> >> +			ret);
> >> +		return;
> >> +	}
> >> +
> >> +	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
> >> +	ret = regmap_bulk_write(it->hdmi_regmap, HDMI_REG_AVI_DB6,
> >> +				&buf[HDMI_INFOFRAME_HEADER_SIZE +
> >> +				     HDMI_AVI_DB_CHUNK1_SIZE],
> >> +				HDMI_AVI_DB_CHUNK2_SIZE);
> >> +	if (ret) {
> >> +		dev_err(it->dev, "failed to write the 2nd AVI infoframe data byte chunk: %d\n",
> >> +			ret);
> >> +		return;
> >> +	}
> >> +
> >> +	ret = regmap_write(it->hdmi_regmap, HDMI_REG_AVI_CSUM, buf[3]);
> >> +	if (ret)
> >> +		dev_err(it->dev, "failed to set AVI infoframe checksum: %d\n",
> >> +			ret);
> >> +}
> >> +
> >> +static void
> >> +it6263_bridge_atomic_enable(struct drm_bridge *bridge,
> >> +			    struct drm_bridge_state *old_bridge_state)
> >> +{
> >> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +	const struct drm_crtc_state *crtc_state;
> >> +	struct regmap *regmap = it->hdmi_regmap;
> >> +	const struct drm_display_mode *mode;
> >> +	struct drm_connector *connector;
> >> +	bool is_stable = false;
> >> +	struct drm_crtc *crtc;
> >> +	unsigned int val;
> >> +	bool pclk_high;
> >> +	int i, ret;
> >> +
> >> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> >> +							     bridge->encoder);
> >> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> >> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> >> +	mode = &crtc_state->adjusted_mode;
> >> +
> >> +	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
> >> +
> >> +	it6263_hdmi_avi_infoframe_configure(it, connector, mode);
> > 
> > drm_atomic_helper_connector_hdmi_update_infoframes
> 
> Will take a look at this.
> 
> > 
> >> +
> >> +	/* HDMI AFE setup */
> >> +	pclk_high = mode->clock > HIGH_PIXEL_CLOCK_KHZ ? true : false;
> >> +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
> >> +	if (pclk_high)
> >> +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> >> +			     AFE_XP_GAINBIT | AFE_XP_RESETB);
> >> +	else
> >> +		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
> >> +			     AFE_XP_ER0 | AFE_XP_RESETB);
> >> +	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
> >> +	if (pclk_high)
> >> +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> >> +			     AFE_IP_GAINBIT | AFE_IP_RESETB);
> >> +	else
> >> +		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
> >> +			     AFE_IP_ER0 | AFE_IP_RESETB);
> >> +
> >> +	/* HDMI software video reset */
> >> +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
> >> +	fsleep(1000);
> >> +	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
> >> +
> >> +	/* reconfigure LVDS and retry several times in case video is instable */
> >> +	for (i = 0; i < 3; i++) {
> >> +		ret = regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
> >> +					       val & TXVIDSTABLE,
> >> +					       20000, 500000);
> >> +		if (!ret) {
> >> +			is_stable = true;
> >> +			break;
> >> +		}
> >> +
> >> +		it6263_lvds_config(it);
> >> +	}
> >> +
> >> +	if (!is_stable)
> >> +		dev_warn(it->dev, "failed to wait for video stable\n");
> >> +
> >> +	/* HDMI AFE reset release and power up */
> >> +	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
> >> +
> >> +	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
> >> +
> >> +	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
> >> +}
> >> +
> >> +static enum drm_mode_status
> >> +it6263_bridge_mode_valid(struct drm_bridge *bridge,
> >> +			 const struct drm_display_info *info,
> >> +			 const struct drm_display_mode *mode)
> >> +{
> >> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? MODE_CLOCK_HIGH : MODE_OK;
> > 
> >         rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> >         return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
> 
> Will look into the two lines.
> 
> > 
> >> +}
> >> +
> >> +static int it6263_bridge_attach(struct drm_bridge *bridge,
> >> +				enum drm_bridge_attach_flags flags)
> >> +{
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +	int ret;
> >> +
> >> +	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
> >> +				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> >> +		return 0;
> >> +
> >> +	it->connector.polled = DRM_CONNECTOR_POLL_CONNECT |
> >> +			       DRM_CONNECTOR_POLL_DISCONNECT;
> >> +
> > 
> > Please strongly consider dropping this and using drm_bridge_connector in
> > the host driver.
> 
> I can't afford to make i.MX8MP imx-lcdif KMS use drm_bridge_connector
> currently.  Maybe the Renesas RZ/G3E SMARC EVK Biju tested v1 patch
> set with is also not using drm_bridge_connector.  I hope we can leave
> it as-is for now.

At least you can use drm_bridge_connector in this driver rather than
open-coding yet another connector implementation wich doesn't work with
the next bridges.

> 
> > 
> >> +	ret = drm_connector_init(bridge->dev, &it->connector,
> >> +				 &it6263_connector_funcs,
> >> +				 DRM_MODE_CONNECTOR_HDMIA);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	drm_connector_helper_add(&it->connector,
> >> +				 &it6263_connector_helper_funcs);
> >> +	drm_connector_attach_encoder(&it->connector, bridge->encoder);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
> >> +{
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +
> >> +	return it6263_detect(it);
> >> +}
> >> +
> >> +static const struct drm_edid *
> >> +it6263_bridge_edid_read(struct drm_bridge *bridge,
> >> +			struct drm_connector *connector)
> >> +{
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +
> >> +	return drm_edid_read_custom(connector, it6263_read_edid, it);
> >> +}
> >> +
> >> +static u32 *
> >> +it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >> +					struct drm_bridge_state *bridge_state,
> >> +					struct drm_crtc_state *crtc_state,
> >> +					struct drm_connector_state *conn_state,
> >> +					u32 output_fmt,
> >> +					unsigned int *num_input_fmts)
> >> +{
> >> +	struct it6263 *it = bridge_to_it6263(bridge);
> >> +	u32 *input_fmts;
> >> +
> >> +	*num_input_fmts = 0;
> >> +
> >> +	if (it->lvds_link_num_dlanes == 3)
> >> +		return NULL;
> >> +
> >> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> >> +	if (!input_fmts)
> >> +		return NULL;
> >> +
> >> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> >> +	*num_input_fmts = 1;
> >> +
> >> +	return input_fmts;
> >> +}
> >> +
> >> +static const struct drm_bridge_funcs it6263_bridge_funcs = {
> >> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> >> +	.attach = it6263_bridge_attach,
> >> +	.mode_valid = it6263_bridge_mode_valid,
> >> +	.atomic_disable = it6263_bridge_atomic_disable,
> >> +	.atomic_enable = it6263_bridge_atomic_enable,
> >> +	.atomic_check = it6263_bridge_atomic_check,
> >> +	.detect = it6263_bridge_detect,
> >> +	.edid_read = it6263_bridge_edid_read,
> >> +	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
> >> +};
> >> +
> >> +static int it6263_probe(struct i2c_client *client)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct it6263 *it;
> >> +	int ret;
> >> +
> >> +	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
> >> +	if (!it)
> >> +		return -ENOMEM;
> >> +
> >> +	it->dev = dev;
> >> +	it->hdmi_i2c = client;
> >> +
> >> +	it->hdmi_regmap = devm_regmap_init_i2c(client,
> >> +					       &it6263_hdmi_regmap_config);
> >> +	if (IS_ERR(it->hdmi_regmap))
> >> +		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
> >> +				     "failed to init I2C regmap for HDMI\n");
> >> +
> >> +	it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> >> +	if (IS_ERR(it->reset_gpio))
> >> +		return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
> >> +				     "failed to get reset gpio\n");
> >> +
> >> +	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
> >> +					     it6263_supplies);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "failed to get power supplies\n");
> >> +
> >> +	ret = it6263_parse_dt(it);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	it6263_hw_reset(it);
> >> +
> >> +	ret = it6263_lvds_set_i2c_addr(it);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
> >> +
> >> +	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
> >> +						 LVDS_INPUT_CTRL_I2C_ADDR);
> >> +	if (IS_ERR(it->lvds_i2c))
> >> +		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
> >> +			      "failed to allocate I2C device for LVDS\n");
> >> +
> >> +	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
> >> +					       &it6263_lvds_regmap_config);
> >> +	if (IS_ERR(it->lvds_regmap))
> >> +		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
> >> +				     "failed to init I2C regmap for LVDS\n");
> >> +
> >> +	it6263_lvds_config(it);
> >> +	it6263_hdmi_config(it);
> >> +
> >> +	i2c_set_clientdata(client, it);
> >> +
> >> +	it->bridge.funcs = &it6263_bridge_funcs;
> >> +	it->bridge.of_node = dev->of_node;
> >> +	it->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > 
> >   | DRM_BRIDGE_OP_HDMI
> 
> Will take a look at this.
> 
> > 
> > BTW: No HPD IRQ support?
> IT6263 chip doesn't support HPD IRQ.

ack

> 
> > 
> >> +	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> >> +	drm_bridge_add(&it->bridge);
> > 
> > devm_drm_bridge_add()
> 
> Will try to use this.  Thanks.
> 
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void it6263_remove(struct i2c_client *client)
> >> +{
> >> +	struct it6263 *it = i2c_get_clientdata(client);
> >> +
> >> +	drm_bridge_remove(&it->bridge);
> > 
> > Remove, it becomes unused with the devm_ function.
> > 
> >> +}
> >> +
> >> +static const struct of_device_id it6263_of_match[] = {
> >> +	{ .compatible = "ite,it6263", },
> >> +	{ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, it6263_of_match);
> >> +
> >> +static const struct i2c_device_id it6263_i2c_ids[] = {
> >> +	{ "it6263", 0 },
> >> +	{ }
> >> +};
> >> +MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
> >> +
> >> +static struct i2c_driver it6263_driver = {
> >> +	.probe = it6263_probe,
> >> +	.remove = it6263_remove,
> >> +	.driver = {
> >> +		.name = "it6263",
> >> +		.of_match_table = it6263_of_match,
> >> +	},
> >> +	.id_table = it6263_i2c_ids,
> >> +};
> >> +module_i2c_driver(it6263_driver);
> >> +
> >> +MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
> >> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> >> +MODULE_LICENSE("GPL");
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry
