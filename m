Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CD599BCD5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 02:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1DA10E261;
	Mon, 14 Oct 2024 00:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARJKeWPB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B043110E261
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:07:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso1187479e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728864422; x=1729469222; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YS7CrsGmlH6p7gQsygFDCB+/U2CAx5SmNiPdJ62FrMM=;
 b=ARJKeWPBVdgS75JYXFnWT+Hoax/Ln29aJrHtg6sWuoVKHKUSMwMcgV+BOobDL6fU4G
 ZQaLmvv6D9O8Snn40ABe1cuQKcmBdM6ke4JuY+hSNlo9MZR4h9Wzqph7/sRyvsqvSrq/
 SS9rcfcGxMfEbpjNX0QjeyMLWH2AFvBv8omPLmlmepNm22jsT/dTQ99CNFIrRT5n7WAP
 bI7gyREx7hLei/qAfaqSj8jPsnoUqMzcpDXv2q889OlRTcW9LQR9Rq875OT3phL/lkb4
 /jusYhHXcdYSHvzP99f5PC5kJPHI44nKvYUdFbL6+MgFDdUqGUBjz6wKGfHasKwrV3T8
 xGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728864422; x=1729469222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YS7CrsGmlH6p7gQsygFDCB+/U2CAx5SmNiPdJ62FrMM=;
 b=BYd+fYED4I858N/YtdL2ZWx/3QwJ08gCEfSgC6CQT1thkU/bp0w/Emp6eGpYTd/J4I
 j2udbFD0gQ7XRN8eI3pni8TWi7O7Suq+WWCEhSI6lu5qNEpEhtI+a2iZkF8Iofogduvn
 lFi6XIMun1YH+vvMiTnZ1xBGuh0zSLXHznJ+vpBwA5NHWulZ83vAlNWdFlFyN/9USaYZ
 8wQ6R1x8+tHB2xqcgZZW1MD35WvgBonn8rMSbYrsoM+K+fK03mQBxYtV1FddyLZiwMrK
 wex2a7KPPyU+peB3nSivIyt78vbmz6dto97gK5kSiWWJXVWN7ZV2+S+tztygqJZF2lzi
 gdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwZmSio3ucfl1g+8ziLIvOCXOPFyNWvM22RmMykOE8MPJV8BDf2k3qTwZt0cEZ2BaN3aZHolSbLqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuCtIzq4u8cpSHmmgyrpLu1q9CyPVotu74Z6P00ivk+ICaB5hT
 JW48aJW3w/+B1O1k7BZ5AZ7/FAnupABbXevdxHGCUEHZBbvXGc2TJsdKxOtrwJg=
X-Google-Smtp-Source: AGHT+IH5/CmO+8AGRIJuxDQASYCY1I5dk2nKHJtOegN3V/O4JBnVEfWTi/By5klIlGQYfOdyzACzOg==
X-Received: by 2002:a05:6512:398f:b0:539:e88f:23a1 with SMTP id
 2adb3069b0e04-539e88f2686mr1514693e87.44.1728864421698; 
 Sun, 13 Oct 2024 17:07:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e4590265sm866897e87.190.2024.10.13.17.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 17:07:01 -0700 (PDT)
Date: Mon, 14 Oct 2024 03:06:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liu Ying <victor.liu@nxp.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, 
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>, 
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Message-ID: <73k57zpmbbaup37iaoi7lejp6hq3af3nn5amt2bhbe7fpx4m22@n62lid6hw2cl>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-7-victor.liu@nxp.com>
 <cr24b75meaq25dcs35rffzmyrfu44sajy7r6jilyvavsbs6guw@ncr7rvu2yyft>
 <TY3PR01MB1134691372F08F04BC4404A7F867B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134691372F08F04BC4404A7F867B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

On Sun, Oct 13, 2024 at 10:27:39AM +0000, Biju Das wrote:
> Hi Dmitry Baryshkov,
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Saturday, October 12, 2024 9:45 AM
> > Subject: Re: [PATCH v2 6/9] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
> > 
> > On Sat, Oct 12, 2024 at 03:35:40PM +0800, Liu Ying wrote:
> > > Add basic HDMI video output support. Currently, only RGB888 output
> > > pixel format is supported.  At the LVDS input side, the driver
> > > supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> > > mapping.
> > >
> > > Product link:
> > > https://www.ite.com.tw/en/product/cate1/IT6263
> > >
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2:
> > > * Add AVI inforframe support.  (Maxime)
> > 
> > Maxime asked to wire up the HDMI Connector framework. I have pushed the patch that converts lt9611.c
> > driver. Please implement similar changes in your driver.
> > 
> > > * Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
> > > * Rename it6263_reset() to it6263_hw_reset().  (Biju)
> > > * Check number of LVDS link data lanes.  (Biju)
> > >
> > >  drivers/gpu/drm/bridge/Kconfig      |   8 +
> > >  drivers/gpu/drm/bridge/Makefile     |   1 +
> > >  drivers/gpu/drm/bridge/ite-it6263.c | 919
> > > ++++++++++++++++++++++++++++
> > >  3 files changed, 928 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig
> > > b/drivers/gpu/drm/bridge/Kconfig index 3eb955333c80..93f99682a090
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -90,6 +90,14 @@ config DRM_FSL_LDB
> > >  	help
> > >  	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
> > >
> > > +config DRM_ITE_IT6263
> > > +	tristate "ITE IT6263 LVDS/HDMI bridge"
> > > +	depends on OF
> > > +	select DRM_KMS_HELPER
> > > +	select REGMAP_I2C
> > > +	help
> > > +	  ITE IT6263 LVDS to HDMI bridge chip driver.
> > > +
> > >  config DRM_ITE_IT6505
> > >  	tristate "ITE IT6505 DisplayPort bridge"
> > >  	depends on OF
> > > diff --git a/drivers/gpu/drm/bridge/Makefile
> > > b/drivers/gpu/drm/bridge/Makefile index 7df87b582dca..f3776dd473fd
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
> > >  obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> > >  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
> > >  obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
> > > +obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
> > >  obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
> > >  obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o diff --git
> > > a/drivers/gpu/drm/bridge/ite-it6263.c
> > > b/drivers/gpu/drm/bridge/ite-it6263.c
> > > new file mode 100644
> > > index 000000000000..9b3318792f15
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > > @@ -0,0 +1,919 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright 2024 NXP
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bits.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/hdmi.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/media-bus-format.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +#include <drm/drm_atomic.h>
> > > +#include <drm/drm_atomic_helper.h>
> > > +#include <drm/drm_atomic_state_helper.h> #include <drm/drm_bridge.h>
> > > +#include <drm/drm_connector.h> #include <drm/drm_crtc.h> #include
> > > +<drm/drm_edid.h> #include <drm/drm_of.h> #include
> > > +<drm/drm_probe_helper.h>
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * LVDS registers
> > > + */
> > > +
> > > +/* LVDS software reset registers */
> > > +#define LVDS_REG_05			0x05
> > > +#define  REG_SOFT_P_RST			BIT(1)
> > > +
> > > +/* LVDS system configuration registers */
> > > +/* 0x0b */
> > > +#define LVDS_REG_0B			0x0b
> > > +#define  REG_SSC_PCLK_RF		BIT(0)
> > > +#define  REG_LVDS_IN_SWAP		BIT(1)
> > > +
> > > +/* LVDS test pattern gen control registers */
> > > +/* 0x2c */
> > > +#define LVDS_REG_2C			0x2c
> > > +#define  REG_COL_DEP			GENMASK(1, 0)
> > > +#define  BIT8				FIELD_PREP(REG_COL_DEP, 2)
> > > +#define  OUT_MAP			BIT(4)
> > > +#define  JEIDA				0
> > > +#define  REG_DESSC_ENB			BIT(6)
> > > +#define  DMODE				BIT(7)
> > > +#define  DISO				BIT(7)
> > > +#define  SISO				0
> > > +
> > > +#define LVDS_REG_3C			0x3c
> > > +#define LVDS_REG_3F			0x3f
> > > +#define LVDS_REG_47			0x47
> > > +#define LVDS_REG_48			0x48
> > > +#define LVDS_REG_4F			0x4f
> > > +#define LVDS_REG_52			0x52
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * HDMI registers are separated into three banks:
> > > + * 1) HDMI register common bank: 0x00 ~ 0x2f  */
> > > +
> > > +/* HDMI genernal registers */
> > > +#define HDMI_REG_SW_RST			0x04
> > > +#define  SOFTREF_RST			BIT(5)
> > > +#define  SOFTA_RST			BIT(4)
> > > +#define  SOFTV_RST			BIT(3)
> > > +#define  AUD_RST			BIT(2)
> > > +#define  HDCP_RST			BIT(0)
> > > +#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
> > > +					 AUD_RST | HDCP_RST)
> > > +
> > > +#define HDMI_REG_SYS_STATUS		0x0e
> > > +#define  HPDETECT			BIT(6)
> > > +#define  TXVIDSTABLE			BIT(4)
> > > +
> > > +#define HDMI_REG_BANK_CTRL		0x0f
> > > +#define  REG_BANK_SEL			BIT(0)
> > > +
> > > +/* HDMI System DDC control registers */
> > > +#define HDMI_REG_DDC_MASTER_CTRL	0x10
> > > +#define  MASTER_SEL_HOST		BIT(0)
> > > +
> > > +#define HDMI_REG_DDC_HEADER		0x11
> > > +
> > > +#define HDMI_REG_DDC_REQOFF		0x12
> > > +#define HDMI_REG_DDC_REQCOUNT		0x13
> > > +#define HDMI_REG_DDC_EDIDSEG		0x14
> > > +
> > > +#define HDMI_REG_DDC_CMD		0x15
> > > +#define  DDC_CMD_EDID_READ		0x3
> > > +#define  DDC_CMD_FIFO_CLR		0x9
> > > +
> > > +#define HDMI_REG_DDC_STATUS		0x16
> > > +#define  DDC_DONE			BIT(7)
> > > +#define  DDC_NOACK			BIT(5)
> > > +#define  DDC_WAITBUS			BIT(4)
> > > +#define  DDC_ARBILOSE			BIT(3)
> > > +#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
> > > +
> > > +#define HDMI_DDC_FIFO_BYTES		32
> > > +#define HDMI_REG_DDC_READFIFO		0x17
> > > +#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
> > > +#define HDMI_REG_LVDS_PORT_EN		0x1e
> > > +#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * 2) HDMI register bank0: 0x30 ~ 0xff  */
> > > +
> > > +/* HDMI AFE registers */
> > > +#define HDMI_REG_AFE_DRV_CTRL		0x61
> > > +#define  AFE_DRV_PWD			BIT(5)
> > > +#define  AFE_DRV_RST			BIT(4)
> > > +
> > > +#define HDMI_REG_AFE_XP_CTRL		0x62
> > > +#define  AFE_XP_GAINBIT			BIT(7)
> > > +#define  AFE_XP_ER0			BIT(4)
> > > +#define  AFE_XP_RESETB			BIT(3)
> > > +
> > > +#define HDMI_REG_AFE_ISW_CTRL		0x63
> > > +
> > > +#define HDMI_REG_AFE_IP_CTRL		0x64
> > > +#define  AFE_IP_GAINBIT			BIT(7)
> > > +#define  AFE_IP_ER0			BIT(3)
> > > +#define  AFE_IP_RESETB			BIT(2)
> > > +
> > > +/* HDMI input data format registers */
> > > +#define HDMI_REG_INPUT_MODE		0x70
> > > +#define  IN_RGB				0x00
> > > +
> > > +/* HDMI general control registers */
> > > +#define HDMI_REG_HDMI_MODE		0xc0
> > > +#define  TX_HDMI_MODE			BIT(0)
> > > +
> > > +#define HDMI_REG_GCP			0xc1
> > > +#define  AVMUTE				BIT(0)
> > > +#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
> > > +#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
> > > +
> > > +#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
> > > +#define  ENABLE_PKT			BIT(0)
> > > +#define  REPEAT_PKT			BIT(1)
> > > +
> > > +/*
> > > +---------------------------------------------------------------------
> > > +--------
> > > + * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)  */
> > > +
> > > +/* AVI packet registers */
> > > +#define HDMI_REG_AVI_DB1		0x158
> > > +#define HDMI_REG_AVI_DB2		0x159
> > > +#define HDMI_REG_AVI_DB3		0x15a
> > > +#define HDMI_REG_AVI_DB4		0x15b
> > > +#define HDMI_REG_AVI_DB5		0x15c
> > > +#define HDMI_REG_AVI_CSUM		0x15d
> > > +#define HDMI_REG_AVI_DB6		0x15e
> > > +#define HDMI_REG_AVI_DB7		0x15f
> > > +#define HDMI_REG_AVI_DB8		0x160
> > > +#define HDMI_REG_AVI_DB9		0x161
> > > +#define HDMI_REG_AVI_DB10		0x162
> > > +#define HDMI_REG_AVI_DB11		0x163
> > > +#define HDMI_REG_AVI_DB12		0x164
> > > +#define HDMI_REG_AVI_DB13		0x165
> > > +
> > > +#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 + 1)
> > > +#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6 + 1)
> > > +
> > > +#define MAX_PIXEL_CLOCK_KHZ		150000
> > > +#define HIGH_PIXEL_CLOCK_KHZ		80000
> > > +
> > > +struct it6263 {
> > > +	struct device *dev;
> > > +	struct i2c_client *hdmi_i2c;
> > > +	struct i2c_client *lvds_i2c;
> > > +	struct regmap *hdmi_regmap;
> > > +	struct regmap *lvds_regmap;
> > > +	struct drm_bridge bridge;
> > > +	struct drm_bridge *next_bridge;
> > > +	struct drm_connector connector;
> > > +	struct gpio_desc *reset_gpio;
> > > +	u8 lvds_link_num_dlanes;
> > > +	bool lvds_dual_link;
> > > +	bool lvds_link12_swap;
> > > +};
> > > +
> > > +static inline struct it6263 *bridge_to_it6263(struct drm_bridge
> > > +*bridge) {
> > > +	return container_of(bridge, struct it6263, bridge); }
> > > +
> > > +static inline struct it6263 *connector_to_it6263(struct drm_connector
> > > +*conn) {
> > > +	return container_of(conn, struct it6263, connector); }
> > > +
> > > +static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned
> > > +int reg) {
> > > +	switch (reg) {
> > > +	case HDMI_REG_SW_RST:
> > > +	case HDMI_REG_BANK_CTRL:
> > > +	case HDMI_REG_DDC_MASTER_CTRL:
> > > +	case HDMI_REG_DDC_HEADER:
> > > +	case HDMI_REG_DDC_REQOFF:
> > > +	case HDMI_REG_DDC_REQCOUNT:
> > > +	case HDMI_REG_DDC_EDIDSEG:
> > > +	case HDMI_REG_DDC_CMD:
> > > +	case HDMI_REG_LVDS_PORT:
> > > +	case HDMI_REG_LVDS_PORT_EN:
> > > +	case HDMI_REG_AFE_DRV_CTRL:
> > > +	case HDMI_REG_AFE_XP_CTRL:
> > > +	case HDMI_REG_AFE_ISW_CTRL:
> > > +	case HDMI_REG_AFE_IP_CTRL:
> > > +	case HDMI_REG_INPUT_MODE:
> > > +	case HDMI_REG_HDMI_MODE:
> > > +	case HDMI_REG_GCP:
> > > +	case HDMI_REG_PKT_GENERAL_CTRL:
> > > +	case HDMI_REG_AVI_DB1:
> > > +	case HDMI_REG_AVI_DB2:
> > > +	case HDMI_REG_AVI_DB3:
> > > +	case HDMI_REG_AVI_DB4:
> > > +	case HDMI_REG_AVI_DB5:
> > > +	case HDMI_REG_AVI_CSUM:
> > > +	case HDMI_REG_AVI_DB6:
> > > +	case HDMI_REG_AVI_DB7:
> > > +	case HDMI_REG_AVI_DB8:
> > > +	case HDMI_REG_AVI_DB9:
> > > +	case HDMI_REG_AVI_DB10:
> > > +	case HDMI_REG_AVI_DB11:
> > > +	case HDMI_REG_AVI_DB12:
> > > +	case HDMI_REG_AVI_DB13:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int
> > > +reg) {
> > > +	if (it6263_hdmi_writeable_reg(dev, reg))
> > > +		return true;
> > > +
> > > +	switch (reg) {
> > > +	case HDMI_REG_SYS_STATUS:
> > > +	case HDMI_REG_DDC_STATUS:
> > > +	case HDMI_REG_DDC_READFIFO:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int
> > > +reg) {
> > > +	switch (reg) {
> > > +	case HDMI_REG_SW_RST:
> > > +	case HDMI_REG_SYS_STATUS:
> > > +	case HDMI_REG_DDC_STATUS:
> > > +	case HDMI_REG_DDC_READFIFO:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
> > > +	.range_min = 0x00,
> > > +	.range_max = HDMI_REG_AVI_DB13,
> > > +	.selector_reg = HDMI_REG_BANK_CTRL,
> > > +	.selector_mask = REG_BANK_SEL,
> > > +	.selector_shift = 0,
> > > +	.window_start = 0x00,
> > > +	.window_len = 0x100,
> > > +};
> > > +
> > > +static const struct regmap_config it6263_hdmi_regmap_config = {
> > > +	.name = "it6263-hdmi",
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.writeable_reg = it6263_hdmi_writeable_reg,
> > > +	.readable_reg = it6263_hdmi_readable_reg,
> > > +	.volatile_reg = it6263_hdmi_volatile_reg,
> > > +	.max_register = HDMI_REG_AVI_DB13,
> > > +	.ranges = &it6263_hdmi_range_cfg,
> > > +	.num_ranges = 1,
> > > +	.cache_type = REGCACHE_MAPLE,
> > > +};
> > > +
> > > +static bool it6263_lvds_writeable_reg(struct device *dev, unsigned
> > > +int reg) {
> > > +	switch (reg) {
> > > +	case LVDS_REG_05:
> > > +	case LVDS_REG_0B:
> > > +	case LVDS_REG_2C:
> > > +	case LVDS_REG_3C:
> > > +	case LVDS_REG_3F:
> > > +	case LVDS_REG_47:
> > > +	case LVDS_REG_48:
> > > +	case LVDS_REG_4F:
> > > +	case LVDS_REG_52:
> > > +		return true;
> > > +	default:
> > > +		return false;
> > > +	}
> > > +}
> > > +
> > > +static bool it6263_lvds_readable_reg(struct device *dev, unsigned int
> > > +reg) {
> > > +	return it6263_lvds_writeable_reg(dev, reg); }
> > > +
> > > +static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int
> > > +reg) {
> > > +	return reg == LVDS_REG_05;
> > > +}
> > > +
> > > +static const struct regmap_config it6263_lvds_regmap_config = {
> > > +	.name = "it6263-lvds",
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.writeable_reg = it6263_lvds_writeable_reg,
> > > +	.readable_reg = it6263_lvds_readable_reg,
> > > +	.volatile_reg = it6263_lvds_volatile_reg,
> > > +	.max_register = LVDS_REG_52,
> > > +	.cache_type = REGCACHE_MAPLE,
> > > +};
> > > +
> > > +static const char * const it6263_supplies[] = {
> > > +	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
> > > +	"avcc", "anvdd", "apvdd"
> > > +};
> > > +
> > > +static int it6263_parse_dt(struct it6263 *it) {
> > > +	struct device *dev = it->dev;
> > > +	struct device_node *port0, *port1;
> > > +	int ret;
> > > +
> > > +	ret = of_property_read_u8(dev->of_node, "ite,lvds-link-num-data-lanes",
> > > +				  &it->lvds_link_num_dlanes);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to get LVDS link number of data lanes: %d\n",
> > > +			ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
> > > +	if (IS_ERR(it->next_bridge))
> > > +		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
> > > +				     "failed to get next bridge\n");
> > > +
> > > +	port0 = of_graph_get_port_by_id(dev->of_node, 0);
> > > +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> > > +	if (port0 && port1) {
> > > +		if (of_property_read_bool(port0, "dual-lvds-even-pixels") &&
> > > +		    of_property_read_bool(port1, "dual-lvds-odd-pixels")) {
> > > +			it->lvds_dual_link = true;
> > > +			it->lvds_link12_swap = true;
> > 
> > This is a nice name for the propery in the Dual Link LVDS case:
> > 
> > ite,lvds-link-swap
> > 
> > 
> > > +		} else if (of_property_read_bool(port0, "dual-lvds-odd-pixels") &&
> > > +			   of_property_read_bool(port1, "dual-lvds-even-pixels")) {
> > > +			it->lvds_dual_link = true;
> > > +		}
> > > +
> > > +		if (!it->lvds_dual_link) {
> > > +			dev_err(dev,
> > > +				"failed to get LVDS dual link pixel order\n");
> > > +			ret = -EINVAL;
> > > +		}
> > > +	} else if (port1) {
> > > +		ret = -EINVAL;
> > > +		dev_err(dev, "single input LVDS port1 is not supported\n");
> > > +	} else if (!port0) {
> > > +		ret = -EINVAL;
> > > +		dev_err(dev, "no input LVDS port\n");
> > > +	}
> > > +
> > > +	of_node_put(port0);
> > > +	of_node_put(port1);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static inline void it6263_hw_reset(struct it6263 *it) {
> > > +	if (!it->reset_gpio)
> > > +		return;
> > > +
> > > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > > +	fsleep(1000);
> > > +	gpiod_set_value_cansleep(it->reset_gpio, 1);
> > > +	/* The chip maker says the low pulse should be at least 40ms. */
> > > +	fsleep(40000);
> > > +	gpiod_set_value_cansleep(it->reset_gpio, 0);
> > > +	/* addtional time to wait the high voltage to be stable */
> > > +	fsleep(5000);
> > > +}
> > > +
> > > +static inline int it6263_lvds_set_i2c_addr(struct it6263 *it) {
> > > +	int ret;
> > > +
> > > +	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
> > > +			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
> > > +}
> > > +
> > > +static inline void it6263_lvds_reset(struct it6263 *it) {
> > > +	/* AFE PLL reset */
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
> > > +	fsleep(1000);
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
> > > +
> > > +	/* software pixel clock domain reset */
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
> > > +			  REG_SOFT_P_RST);
> > > +	fsleep(1000);
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
> > > +	fsleep(10000);
> > > +}
> > > +
> > > +static inline void it6263_lvds_set_interface(struct it6263 *it) {
> > > +	/* color depth */
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> > > +	/* output mapping */
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> > > +
> > > +	if (it->lvds_dual_link) {
> > > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> > > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
> > > +	} else {
> > > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
> > > +		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
> > > +	}
> > > +}
> > > +
> > > +static inline void it6263_lvds_set_afe(struct it6263 *it) {
> > > +	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
> > > +	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
> > > +	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
> > > +	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
> > > +	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
> > > +
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
> > > +			  REG_SSC_PCLK_RF);
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
> > > +			  REG_DESSC_ENB);
> > > +}
> > > +
> > > +static inline void it6263_lvds_sys_cfg(struct it6263 *it) {
> > > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
> > > +			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0); }
> > > +
> > > +static inline void it6263_lvds_config(struct it6263 *it) {
> > > +	it6263_lvds_reset(it);
> > > +	it6263_lvds_set_interface(it);
> > > +	it6263_lvds_set_afe(it);
> > > +	it6263_lvds_sys_cfg(it);
> > > +}
> > > +
> > > +static inline void it6263_hdmi_config(struct it6263 *it) {
> > > +	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
> > > +	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
> > > +	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
> > > +			  HDMI_COLOR_DEPTH_24);
> > > +}
> > > +
> > > +static enum drm_connector_status it6263_detect(struct it6263 *it) {
> > > +	unsigned int val;
> > > +
> > > +	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
> > > +	if (val & HPDETECT)
> > > +		return connector_status_connected;
> > > +	else
> > > +		return connector_status_disconnected; }
> > > +
> > > +static enum drm_connector_status
> > > +it6263_connector_detect(struct drm_connector *connector, bool force)
> > > +{
> > > +	struct it6263 *it = connector_to_it6263(connector);
> > > +
> > > +	return it6263_detect(it);
> > > +}
> > > +
> > > +static const struct drm_connector_funcs it6263_connector_funcs = {
> > > +	.detect = it6263_connector_detect,
> > > +	.fill_modes = drm_helper_probe_single_connector_modes,
> > > +	.destroy = drm_connector_cleanup,
> > > +	.reset = drm_atomic_helper_connector_reset,
> > > +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > +};
> > > +
> > > +static int it6263_read_edid(void *data, u8 *buf, unsigned int block,
> > > +size_t len) {
> > > +	struct it6263 *it = data;
> > > +	struct regmap *regmap = it->hdmi_regmap;
> > > +	unsigned int start = (block % 2) * EDID_LENGTH;
> > > +	unsigned int segment = block >> 1;
> > > +	unsigned int count, val;
> > > +	int ret;
> > > +
> > > +	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
> > > +	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
> > > +	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
> > > +
> > > +	while (len) {
> > > +		/* clear DDC FIFO */
> > > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
> > > +
> > > +		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
> > > +					       val, val & DDC_DONE,
> > > +					       2000, 10000);
> > > +		if (ret) {
> > > +			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
> > > +			return ret;
> > > +		}
> > > +
> > > +		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
> > > +
> > > +		/* fire the read command */
> > > +		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
> > > +		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
> > > +		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
> > > +
> > > +		start += count;
> > > +		len -= count;
> > > +
> > > +		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
> > > +					       val & (DDC_DONE | DDC_ERROR),
> > > +					       20000, 250000);
> > > +		if (ret && !(val & DDC_ERROR)) {
> > > +			dev_err(it->dev, "failed to read EDID:%d\n", ret);
> > > +			return ret;
> > > +		}
> > > +
> > > +		if (val & DDC_ERROR) {
> > > +			dev_err(it->dev, "DDC error\n");
> > > +			return -EIO;
> > > +		}
> > > +
> > > +		/* cache to buffer */
> > > +		for (; count > 0; count--) {
> > > +			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
> > > +			*(buf++) = val;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int it6263_connector_get_modes(struct drm_connector
> > > +*connector) {
> > > +	struct it6263 *it = connector_to_it6263(connector);
> > > +	const struct drm_edid *drm_edid;
> > > +	int count;
> > > +
> > > +	drm_edid = drm_edid_read_custom(connector, it6263_read_edid, it);
> > > +
> > > +	drm_edid_connector_update(connector, drm_edid);
> > > +	count = drm_edid_connector_add_modes(connector);
> > > +
> > > +	drm_edid_free(drm_edid);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static const struct drm_connector_helper_funcs it6263_connector_helper_funcs = {
> > > +	.get_modes = it6263_connector_get_modes, };
> > > +
> > > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > > +				      struct drm_bridge_state *bridge_state,
> > > +				      struct drm_crtc_state *crtc_state,
> > > +				      struct drm_connector_state *conn_state) {
> > > +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > 
> > Use drm_atomic_helper_connector_hdmi_check().
> > 
> > Implement .hdmi_tmds_char_rate_valid(). Also, I think, single and dual link LVDS have different max
> > clock rates. Please correct me if I'm wrong.
> 
> I guess this rate will be same for both links in dual lvds mode.
> For single link, it supports only link0.
> We cannot operate link1 its Own.
> 
> From ITE point the max rate is rate corresponding to 1080p(148-150MHz)
> 
> single and dual link LVDS have different max clock rates, but that constraint is
> in SoC side?? ITE HW manual does not mention about this.

Huh? I checked the datasheet, version 0.8.
It specifies LVDS clock rate (not the mode clock) up to 150 MHz and HDMI
rate up to 225 MHz. Please check both constraints.

> 
> > 
> > > +
> > > +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0; }
> > > +

[...]

> > > +
> > > +	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
> > > +					       &it6263_lvds_regmap_config);
> > > +	if (IS_ERR(it->lvds_regmap))
> > > +		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
> > > +				     "failed to init I2C regmap for LVDS\n");
> > > +
> > > +	it6263_lvds_config(it);
> > > +	it6263_hdmi_config(it);
> > > +
> > > +	i2c_set_clientdata(client, it);
> > > +
> > > +	it->bridge.funcs = &it6263_bridge_funcs;
> > > +	it->bridge.of_node = dev->of_node;
> > > +	it->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> > 
> >   | DRM_BRIDGE_OP_HDMI
> > 
> > BTW: No HPD IRQ support?
> 
> Renesas SMARC RZ/G3E this signal is internal. No dedicted IRQ line 
> Populated for this signal. I don't know about NXP and any other platforms
> has HPD wired to test the HPD IRQ support.
> 
> Maybe go with poll method now and add hot plug support,
> when we have platform with HPD to test.

I'm fine with this. According to the datasheet it doesn't seem to have
the IRQ pin at all. It's just surprising to me. It's be nice to mention
that HW doesn't support HPD IRQ either before setting it->bridge.ops or
in the commit message.


-- 
With best wishes
Dmitry
