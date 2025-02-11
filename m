Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E0A3093E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 11:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1841510E657;
	Tue, 11 Feb 2025 10:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SdFCpyez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108510E657
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 10:57:42 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B84666DF;
 Tue, 11 Feb 2025 11:56:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739271383;
 bh=rXNWF+B4kwUEpWlnCMhGNlm/d4imQeJ14yQC52ax6jk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SdFCpyezXSalsZLCJUKEIzkk8Id/5kTGREg0HHZgMdUuHBJGOWOOEByyL8rC4cKSz
 r03lM/ufMLdLgObp3d9U30qhJUwImERmuDHcOf6KmbbDPXgCFPnvmPegDdYv7FLpEz
 wefOrpOBb6u7a94D5+s0yS6IZwGELZK8tVDlq1yk=
Message-ID: <09e0616d-e135-41d7-bf5d-3f5c8535a0d5@ideasonboard.com>
Date: Tue, 11 Feb 2025 12:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>
References: <20250209160925.380348-1-aradhya.bhatia@linux.dev>
 <20250209160925.380348-4-aradhya.bhatia@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250209160925.380348-4-aradhya.bhatia@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 09/02/2025 18:09, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The AM62x and AM62Px SoCs feature 2 OLDI TXes each, which makes it
> possible to connect them in dual-link or cloned single-link OLDI display
> modes. The current OLDI support in tidss_dispc.c can only support for
> a single OLDI TX, connected to a VP and doesn't really support
> configuration of OLDIs in the other modes. The current OLDI support in
> tidss_dispc.c also works on the principle that the OLDI output can only
> be served by one, and only one, DSS video-port. This isn't the case in
> the AM62Px SoC, where there are 2 DSS controllers present that share the
> OLDI TXes.
> 
> Having their own devicetree and their own bridge entity will help
> support the various display modes and sharing possiblilities of the OLDI
> hardware.
> 
> For all these reasons, add support for the OLDI TXes as DRM bridges.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>   drivers/gpu/drm/tidss/Makefile           |   3 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c      |  20 +-
>   drivers/gpu/drm/tidss/tidss_dispc.h      |   4 +
>   drivers/gpu/drm/tidss/tidss_dispc_regs.h |  14 +
>   drivers/gpu/drm/tidss/tidss_drv.c        |   9 +
>   drivers/gpu/drm/tidss/tidss_drv.h        |   5 +
>   drivers/gpu/drm/tidss/tidss_oldi.c       | 558 +++++++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_oldi.h       |  51 +++
>   8 files changed, 662 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
>   create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h
> 
> diff --git a/drivers/gpu/drm/tidss/Makefile b/drivers/gpu/drm/tidss/Makefile
> index 312645271014..b6d6becf1683 100644
> --- a/drivers/gpu/drm/tidss/Makefile
> +++ b/drivers/gpu/drm/tidss/Makefile
> @@ -7,6 +7,7 @@ tidss-y := tidss_crtc.o \
>   	tidss_irq.o \
>   	tidss_plane.o \
>   	tidss_scale_coefs.o \
> -	tidss_dispc.o
> +	tidss_dispc.o \
> +	tidss_oldi.o
>   
>   obj-$(CONFIG_DRM_TIDSS) += tidss.o
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 1ad711f8d2a8..8631a89e6155 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -466,6 +466,25 @@ static u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
>   	return ioread32(base + reg);
>   }
>   
> +void tidss_configure_oldi(struct tidss_device *tidss, u32 hw_videoport,
> +			  u32 oldi_cfg)
> +{
> +	u32 count = 0;
> +	u32 oldi_reset_bit = BIT(5 + hw_videoport);
> +
> +	dispc_vp_write(tidss->dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
> +
> +	if (oldi_cfg != 0) {
> +		while (!(oldi_reset_bit & dispc_read(tidss->dispc, DSS_SYSSTATUS)) &&
> +		       count < 10000)
> +			count++;
> +
> +		if (!(oldi_reset_bit & dispc_read(tidss->dispc, DSS_SYSSTATUS)))
> +			dev_warn(tidss->dispc->dev, "%s: timeout waiting OLDI reset done\n",
> +				 __func__);
> +	}
> +}

The timeout sounds like an error. Better to return an error value, and 
handle it in tidss_oldi_config()?

You could also

if (!oldi_cfg)
	return 0;

But would it actually be nicer to have a separate void function for 
disabling?

> +
>   /*
>    * TRM gives bitfields as start:end, where start is the higher bit
>    * number. For example 7:0
> @@ -1310,7 +1329,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
>    * Calculate the percentage difference between the requested pixel clock rate
>    * and the effective rate resulting from calculating the clock divider value.
>    */
> -static
>   unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>   {
>   	int r = rate / 100, rr = real_rate / 100;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 086327d51a90..fab248f2055a 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -94,6 +94,10 @@ extern const struct dispc_features dispc_am62a7_feats;
>   extern const struct dispc_features dispc_am65x_feats;
>   extern const struct dispc_features dispc_j721e_feats;
>   
> +void tidss_configure_oldi(struct tidss_device *tidss, u32 hw_videoport,
> +			  u32 oldi_cfg);
> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate);
> +
>   void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
>   dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> index 13feedfe5d6d..03f7098029e6 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
> @@ -226,6 +226,20 @@ enum dispc_common_regs {
>   #define DISPC_VP_DSS_DMA_THREADSIZE		0x170 /* J721E */
>   #define DISPC_VP_DSS_DMA_THREADSIZE_STATUS	0x174 /* J721E */
>   
> +/* OLDI Config Bits (DISPC_VP_DSS_OLDI_CFG) */
> +#define OLDI_ENABLE		BIT(0)
> +#define OLDI_MAP		(BIT(1) | BIT(2) | BIT(3))
> +#define OLDI_SRC		BIT(4)
> +#define OLDI_CLONE_MODE		BIT(5)
> +#define OLDI_MASTERSLAVE	BIT(6)
> +#define OLDI_DEPOL		BIT(7)
> +#define OLDI_MSB		BIT(8)
> +#define OLDI_LBEN		BIT(9)
> +#define OLDI_LBDATA		BIT(10)
> +#define OLDI_DUALMODESYNC	BIT(11)
> +#define OLDI_SOFTRST		BIT(12)
> +#define OLDI_TPATCFG		BIT(13)
> +
>   /*
>    * OLDI IO_CTRL register offsets. On AM654 the registers are found
>    * from CTRL_MMR0, there the syscon regmap should map 0x14 bytes from
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 7c8fd6407d82..27b9f86f1eb2 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -24,6 +24,7 @@
>   #include "tidss_drv.h"
>   #include "tidss_kms.h"
>   #include "tidss_irq.h"
> +#include "tidss_oldi.h"
>   
>   /* Power management */
>   
> @@ -148,6 +149,10 @@ static int tidss_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	ret = tidss_oldi_init(tidss);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init OLDI\n");
> +
>   	pm_runtime_enable(dev);
>   
>   	pm_runtime_set_autosuspend_delay(dev, 1000);
> @@ -204,6 +209,8 @@ static int tidss_probe(struct platform_device *pdev)
>   	pm_runtime_dont_use_autosuspend(dev);
>   	pm_runtime_disable(dev);
>   
> +	tidss_oldi_deinit(tidss);
> +
>   	return ret;
>   }
>   
> @@ -228,6 +235,8 @@ static void tidss_remove(struct platform_device *pdev)
>   	pm_runtime_dont_use_autosuspend(dev);
>   	pm_runtime_disable(dev);
>   
> +	tidss_oldi_deinit(tidss);
> +
>   	/* devm allocated dispc goes away with the dev so mark it NULL */
>   	dispc_remove(tidss);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..6c0fe1d989ee 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -11,8 +11,10 @@
>   
>   #define TIDSS_MAX_PORTS 4
>   #define TIDSS_MAX_PLANES 4
> +#define TIDSS_MAX_OLDI_TXES 2
>   
>   typedef u32 dispc_irq_t;
> +struct tidss_oldi;
>   
>   struct tidss_device {
>   	struct drm_device ddev;		/* DRM device for DSS */
> @@ -27,6 +29,9 @@ struct tidss_device {
>   	unsigned int num_planes;
>   	struct drm_plane *planes[TIDSS_MAX_PLANES];
>   
> +	unsigned int num_oldis;
> +	struct tidss_oldi *oldis[TIDSS_MAX_OLDI_TXES];
> +
>   	unsigned int irq;
>   
>   	spinlock_t wait_lock;	/* protects the irq masks */
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> new file mode 100644
> index 000000000000..4af13a01f546
> --- /dev/null
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -0,0 +1,558 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2024 - Texas Instruments Incorporated
> + *
> + * Aradhya Bhatia <a-bhatia1@ti.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +
> +#include "tidss_dispc.h"
> +#include "tidss_dispc_regs.h"
> +#include "tidss_oldi.h"
> +
> +struct tidss_oldi {
> +	struct tidss_device	*tidss;
> +	struct device		*dev;
> +
> +	struct drm_bridge	bridge;
> +	struct drm_bridge	*next_bridge;
> +
> +	enum tidss_oldi_link_type link_type;
> +	const struct oldi_bus_format *bus_format;
> +	u32 oldi_instance;
> +	u32 companion_instance;
> +	u32 parent_vp;
> +
> +	struct clk *serial;
> +	struct regmap *io_ctrl;
> +};
> +
> +static const struct oldi_bus_format oldi_bus_formats[] = {
> +	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,	18, SPWG_18,	MEDIA_BUS_FMT_RGB666_1X18 },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,	24, SPWG_24,	MEDIA_BUS_FMT_RGB888_1X24 },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,	24, JEIDA_24,	MEDIA_BUS_FMT_RGB888_1X24 },
> +};
> +
> +#define OLDI_IDLE_CLK_HZ	25000000 /*25 MHz */
> +
> +static inline struct tidss_oldi *
> +drm_bridge_to_tidss_oldi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct tidss_oldi, bridge);
> +}
> +
> +static int tidss_oldi_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +
> +	if (!oldi->next_bridge) {
> +		dev_err(oldi->dev,
> +			"%s: OLDI%u Failure attach next bridge\n",
> +			__func__, oldi->oldi_instance);
> +		return -ENODEV;
> +	}
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(oldi->dev,
> +			"%s: OLDI%u DRM_BRIDGE_ATTACH_NO_CONNECTOR is mandatory.\n",
> +			__func__, oldi->oldi_instance);
> +		return -EINVAL;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder, oldi->next_bridge,
> +				 bridge, flags);
> +}
> +
> +static int
> +tidss_oldi_set_serial_clk(struct tidss_oldi *oldi, unsigned long rate)
> +{
> +	unsigned long new_rate;
> +	int ret;
> +
> +	ret = clk_set_rate(oldi->serial, rate);
> +	if (ret) {
> +		dev_err(oldi->dev,
> +			"OLDI%u: failed to set serial clk rate to %lu Hz\n",
> +			 oldi->oldi_instance, rate);
> +		return ret;
> +	}
> +
> +	new_rate = clk_get_rate(oldi->serial);
> +
> +	if (dispc_pclk_diff(rate, new_rate) > 5)
> +		dev_warn(oldi->dev,
> +			 "OLDI%u Clock rate %lu differs over 5%% from requested %lu\n",
> +			 oldi->oldi_instance, new_rate, rate);
> +
> +	dev_dbg(oldi->dev, "OLDI%u: new rate %lu Hz (requested %lu Hz)\n",
> +		oldi->oldi_instance, clk_get_rate(oldi->serial), rate);
> +
> +	return 0;
> +}
> +
> +static void tidss_oldi_tx_power(struct tidss_oldi *oldi, bool enable)
> +{
> +	u32 mask;
> +
> +	/*
> +	 * The power control bits are Active Low, and remain powered off by
> +	 * default. That is, the bits are set to 1. To power on the OLDI TXes,
> +	 * the bits must be cleared to 0. Since there are cases where not all
> +	 * OLDI TXes are being used, the power logic selectively powers them
> +	 * on.
> +	 * Setting the variable 'val' to particular bit masks, makes sure that
> +	 * the unrequired OLDI TXes remain powered off.
> +	 */
> +
> +	if (enable) {
> +		switch (oldi->link_type) {
> +		case OLDI_MODE_SINGLE_LINK:
> +			/* Power-on only the required OLDI TX's IO*/
> +			mask = OLDI_PWRDOWN_TX(oldi->oldi_instance) | OLDI_PWRDN_BG;
> +			break;
> +		case OLDI_MODE_CLONE_SINGLE_LINK:
> +		case OLDI_MODE_DUAL_LINK:
> +			/* Power-on both the OLDI TXes' IOs */
> +			mask = OLDI_PWRDOWN_TX(oldi->oldi_instance) |
> +			       OLDI_PWRDOWN_TX(oldi->companion_instance) |
> +			       OLDI_PWRDN_BG;
> +			break;
> +		default:
> +			/*
> +			 * This code execution should never reach here as any
> +			 * OLDI with an unsupported OLDI mode would never get
> +			 * registered in the first place.
> +			 * However, power-off the OLDI in concern just in case.
> +			 */
> +			mask = OLDI_PWRDOWN_TX(oldi->oldi_instance);
> +			enable = false;
> +			break;
> +		}
> +	} else {
> +		switch (oldi->link_type) {
> +		case OLDI_MODE_CLONE_SINGLE_LINK:
> +		case OLDI_MODE_DUAL_LINK:
> +			mask = OLDI_PWRDOWN_TX(oldi->oldi_instance) |
> +			       OLDI_PWRDOWN_TX(oldi->companion_instance) |
> +			       OLDI_PWRDN_BG;
> +			break;
> +		case OLDI_MODE_SINGLE_LINK:
> +		default:
> +			mask = OLDI_PWRDOWN_TX(oldi->oldi_instance);
> +			break;
> +		}
> +	}
> +
> +	regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, enable ? 0 : mask);
> +}
> +
> +static int tidss_oldi_config(struct tidss_oldi *oldi)
> +{
> +	const struct oldi_bus_format *bus_fmt = NULL;
> +	u32 oldi_cfg = 0;
> +
> +	bus_fmt = oldi->bus_format;
> +
> +	/*
> +	 * MASTERSLAVE and SRC bits of OLDI Config are always set to 0.
> +	 */
> +
> +	if (bus_fmt->data_width == 24)
> +		oldi_cfg |= OLDI_MSB;
> +	else if (bus_fmt->data_width != 18)
> +		dev_warn(oldi->dev,
> +			 "OLDI%u: DSS port width %d not supported\n",
> +			 oldi->oldi_instance, bus_fmt->data_width);
> +
> +	oldi_cfg |= OLDI_DEPOL;
> +
> +	oldi_cfg = (oldi_cfg & (~OLDI_MAP)) | (bus_fmt->oldi_mode_reg_val << 1);
> +
> +	oldi_cfg |= OLDI_SOFTRST;
> +
> +	oldi_cfg |= OLDI_ENABLE;
> +
> +	switch (oldi->link_type) {
> +	case OLDI_MODE_SINGLE_LINK:
> +		/* All configuration is done for this mode.  */
> +		break;
> +
> +	case OLDI_MODE_CLONE_SINGLE_LINK:
> +		oldi_cfg |= OLDI_CLONE_MODE;
> +		break;
> +
> +	case OLDI_MODE_DUAL_LINK:
> +		/* data-mapping field also indicates dual-link mode */
> +		oldi_cfg |= BIT(3);
> +		oldi_cfg |= OLDI_DUALMODESYNC;
> +		break;
> +
> +	default:
> +		dev_err(oldi->dev, "OLDI%u: Unsupported mode.\n",
> +			oldi->oldi_instance);
> +		return -EINVAL;
> +	}
> +
> +	tidss_configure_oldi(oldi->tidss, oldi->parent_vp, oldi_cfg);
> +
> +	return 0;
> +}
> +
> +static void tidss_oldi_atomic_pre_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_bridge_state)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_display_mode *mode;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	/* Configure the OLDI params*/
> +	tidss_oldi_config(oldi);
> +
> +	/* Set the OLDI serial clock (7 times the pixel clock) */
> +	tidss_oldi_set_serial_clk(oldi, mode->clock * 7 * 1000);
> +
> +	/* Enable OLDI IO power */
> +	tidss_oldi_tx_power(oldi, true);
> +}
> +
> +static void tidss_oldi_atomic_post_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +
> +	/* Disable OLDI IO power */
> +	tidss_oldi_tx_power(oldi, false);
> +
> +	/* Set the OLDI serial clock to IDLE Frequency */
> +	tidss_oldi_set_serial_clk(oldi, OLDI_IDLE_CLK_HZ);
> +
> +	/* Clear OLDI Config */
> +	tidss_configure_oldi(oldi->tidss, oldi->parent_vp, 0);
> +}
> +
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						 struct drm_bridge_state *bridge_state,
> +						 struct drm_crtc_state *crtc_state,
> +						 struct drm_connector_state *conn_state,
> +						 u32 output_fmt,
> +						 unsigned int *num_input_fmts)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +	u32 *input_fmts;
> +	int i;
> +
> +	*num_input_fmts = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(oldi_bus_formats); i++)
> +		if (oldi_bus_formats[i].bus_fmt == output_fmt)
> +			break;
> +
> +	if (i == ARRAY_SIZE(oldi_bus_formats))
> +		return NULL;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = oldi_bus_formats[i].input_bus_fmt;
> +	oldi->bus_format = &oldi_bus_formats[i];
> +
> +	return input_fmts;
> +}
> +
> +static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
> +	.attach		= tidss_oldi_bridge_attach,

Looks like an extra tab there?

Other than those two cosmetic issues, I think this looks fine. I also 
tested on AM62-SK.

However, one more thing. We'll have a separate OLDI bridge, but we still 
will have the old OLDI code for AM65x in the tidss_dispc.c. And to mix 
things up, we will have some new OLDI code there too 
(tidss_configure_oldi). Could you check the AM65x specific code and 
perhaps rename the functions to am65x or such, to make this clearer. 
Perhaps also the DISPC_VP_OLDI should be DISPC_VP_OLDI_AM65X, as that VP 
type shouldn't be used for anything else.

  Tomi

