Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29691A779
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 15:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9F10E182;
	Thu, 27 Jun 2024 13:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UCIceEh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EEC10E182
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 13:11:51 +0000 (UTC)
Received: from [192.168.88.20] (91-158-144-210.elisa-laajakaista.fi
 [91.158.144.210])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51A2D593;
 Thu, 27 Jun 2024 15:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1719493885;
 bh=CbMO8dUUnXvuK9y8QPj3EQeauQtLNS1jftjx5CWgje4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UCIceEh8koC7m+7T+ITdttrPTCbNPD2P49Vxs4ZcC3uNaT6KrFuY9JWa0ZbMxtHx/
 zE0WEt0TnkAWLPlNAMx2DN55v2aFCBC3j5H4jwYKFD6L0j5XcAI4UeKclUGKnMdj2f
 yJ1kme3Uxj314TP/O2HDEbUvb3W8H9X31TA7bYWA=
Message-ID: <704ca6ba-b270-4e5e-be13-c8ba642e8b85@ideasonboard.com>
Date: Thu, 27 Jun 2024 16:11:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/tidss: Add OLDI bridge support
To: Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-5-a-bhatia1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240511193055.1686149-5-a-bhatia1@ti.com>
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

On 11/05/2024 22:30, Aradhya Bhatia wrote:
> Up till now, the OLDI support in tidss was integrated within the tidss dispc.
> This was fine till the OLDI was one-to-mapped with the DSS video-port (VP).
> The AM62 and AM62P SoCs have 2 OLDI TXes that can support dual-lvds / lvds-clone
> modes.
> 
> Add OLDI TXes as separate DRM bridge entities to better support the new LVDS
> configurations.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> Note:
> 
> The OLDI configuration should happen before the video-port configuration takes
> place in tidss_crtc_atomic_enable hook. I have posted a patch allowing DRM
> bridges to get enabled before the CRTC of that bridge is enabled[0]. This patch
> uses the bridge hooks introduced in [0], and hence will not compile without [0].
> 
> [0]: Dependency Patch: Introduce early_enable / late_disable drm bridge APIs
> https://lore.kernel.org/all/20240511153051.1355825-7-a-bhatia1@ti.com/
> 
> ---
>   drivers/gpu/drm/tidss/Makefile      |   3 +-
>   drivers/gpu/drm/tidss/tidss_dispc.c |  11 +-
>   drivers/gpu/drm/tidss/tidss_dispc.h |   4 +
>   drivers/gpu/drm/tidss/tidss_drv.c   |  13 +-
>   drivers/gpu/drm/tidss/tidss_drv.h   |   4 +
>   drivers/gpu/drm/tidss/tidss_oldi.c  | 568 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_oldi.h  |  73 ++++
>   7 files changed, 673 insertions(+), 3 deletions(-)
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
> index 1ad711f8d2a8..4961da3989c0 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -466,6 +466,16 @@ static u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
>   	return ioread32(base + reg);
>   }
>   
> +u32 tidss_get_status(struct tidss_device *tidss)
> +{
> +	return dispc_read(tidss->dispc, DSS_SYSSTATUS);
> +}
> +
> +void tidss_configure_oldi(struct tidss_device *tidss, u32 hw_videoport, u32 val)
> +{
> +	return dispc_vp_write(tidss->dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, val);
> +}
> +
>   /*
>    * TRM gives bitfields as start:end, where start is the higher bit
>    * number. For example 7:0
> @@ -1310,7 +1320,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
>    * Calculate the percentage difference between the requested pixel clock rate
>    * and the effective rate resulting from calculating the clock divider value.
>    */
> -static
>   unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>   {
>   	int r = rate / 100, rr = real_rate / 100;
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
> index 086327d51a90..800a73457aff 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
> @@ -94,6 +94,10 @@ extern const struct dispc_features dispc_am62a7_feats;
>   extern const struct dispc_features dispc_am65x_feats;
>   extern const struct dispc_features dispc_j721e_feats;
>   
> +u32 tidss_get_status(struct tidss_device *tidss);
> +void tidss_configure_oldi(struct tidss_device *tidss, u32 hw_videoport, u32 val);
> +unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate);
> +
>   void dispc_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask);
>   dispc_irq_t dispc_read_and_clear_irqstatus(struct dispc_device *dispc);
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index d15f836dca95..fd90e8498cc2 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -23,6 +23,7 @@
>   #include "tidss_drv.h"
>   #include "tidss_kms.h"
>   #include "tidss_irq.h"
> +#include "tidss_oldi.h"
>   
>   /* Power management */
>   
> @@ -140,10 +141,17 @@ static int tidss_probe(struct platform_device *pdev)
>   
>   	spin_lock_init(&tidss->wait_lock);
>   
> +	ret = tidss_oldi_init(tidss);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to init OLDI (%d)\n", ret);
> +		return ret;
> +	}
> +
>   	ret = dispc_init(tidss);
>   	if (ret) {
>   		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> -		return ret;
> +		goto err_oldi_deinit;
>   	}
>   
>   	pm_runtime_enable(dev);
> @@ -202,6 +210,9 @@ static int tidss_probe(struct platform_device *pdev)
>   	pm_runtime_dont_use_autosuspend(dev);
>   	pm_runtime_disable(dev);
>   
> +err_oldi_deinit:
> +	tidss_oldi_deinit(tidss);

Shouldn't this be called tidss_remove()?

> +
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..4ccdc177d171 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -11,6 +11,7 @@
>   
>   #define TIDSS_MAX_PORTS 4
>   #define TIDSS_MAX_PLANES 4
> +#define TIDSS_MAX_OLDI_TXES 2
>   
>   typedef u32 dispc_irq_t;
>   
> @@ -27,6 +28,9 @@ struct tidss_device {
>   	unsigned int num_planes;
>   	struct drm_plane *planes[TIDSS_MAX_PLANES];
>   
> +	unsigned int num_oldis;
> +	struct tidss_oldi *oldis[TIDSS_MAX_OLDI_TXES];

You should probably have "struct tidss_oldi;" in this file.

> +
>   	unsigned int irq;
>   
>   	spinlock_t wait_lock;	/* protects the irq masks */
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> new file mode 100644
> index 000000000000..fd96ca815542
> --- /dev/null
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 - Texas Instruments Incorporated
> + *
> + * Aradhya Bhatia <a-bhati1@ti.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "tidss_drv.h"
> +#include "tidss_oldi.h"
> +
> +struct tidss_oldi {
> +	struct tidss_device	*tidss;
> +	struct device		*dev;
> +
> +	struct drm_bridge	bridge;
> +	struct drm_bridge	*next_bridge;
> +
> +	struct drm_panel *panel;
> +
> +	enum tidss_oldi_link_type link_type;
> +	const struct oldi_bus_format *bus_format;
> +	u32 oldi_instance;
> +	u32 parent_vp;
> +
> +	struct clk *s_clk;
> +	struct regmap *io_ctrl;
> +};
> +
> +static const struct oldi_bus_format oldi_bus_formats[] = {
> +	{ MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,	18, SPWG_18,	MEDIA_BUS_FMT_RGB666_1X18 },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,	24, SPWG_24,	MEDIA_BUS_FMT_RGB888_1X24 },
> +	{ MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,	24, JEIDA_24,	MEDIA_BUS_FMT_RGB888_1X24 },
> +};
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
> +			"%s: OLDI%d Failure attach next bridge\n",
> +			__func__, oldi->oldi_instance);

Here and in other places: the oldi_instance is unsigned, so %u.

> +		return -ENODEV;
> +	}
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(oldi->dev,
> +			"%s: OLDI%d DRM_BRIDGE_ATTACH_NO_CONNECTOR is mandatory.\n",
> +			__func__, oldi->oldi_instance);
> +		return -EINVAL;
> +	}
> +
> +	return drm_bridge_attach(bridge->encoder, oldi->next_bridge,
> +				 bridge, flags);
> +}
> +
> +static int
> +oldi_set_serial_clk(struct tidss_oldi *oldi, unsigned long rate)

This should be "tidss_oldi_set_serial_clk".

> +{
> +	unsigned long new_rate;
> +	int ret;
> +
> +	ret = clk_set_rate(oldi->s_clk, rate);
> +	if (ret) {
> +		dev_err(oldi->dev,
> +			"OLDI%d: failed to set serial clk rate to %lu Hz\n",
> +			 oldi->oldi_instance, rate);
> +		return ret;
> +	}
> +
> +	new_rate = clk_get_rate(oldi->s_clk);
> +
> +	if (dispc_pclk_diff(rate, new_rate) > 5)
> +		dev_warn(oldi->dev,
> +			 "OLDI%d Clock rate %lu differs over 5%% from requested %lu\n",
> +			 oldi->oldi_instance, new_rate, rate);
> +
> +	dev_dbg(oldi->dev, "OLDI%d: new rate %lu Hz (requested %lu Hz)\n",
> +		oldi->oldi_instance, clk_get_rate(oldi->s_clk), rate);
> +
> +	return 0;
> +}
> +
> +static void tidss_oldi_tx_power(struct tidss_oldi *oldi, bool power)
> +{
> +	u32 val = 0, mask;

Unnecessary initialization.

Isn't the val variable unnecessary? You could just:

regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, power ? 0 : mask);

Oh, hmm, wait... You sometimes turn off the oldis, even if power == true 
(the default cases)? I guess that's for the OLDI_MODE_UNSUPPORTED case. 
But why is tidss_oldi_tx_power() even called in that scenario?

Also, I think usually "power" would be named "enable".

> +
> +	if (WARN_ON(!oldi->io_ctrl))

if oldi->io_ctrl == NULL, hasn't the probe already failed and this can 
never be called? The WARN_ON(), and the whole if() feels unnecessary to me.

> +		return;
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
> +	if (power) {
> +		val = 0;
> +		switch (oldi->link_type) {
> +		case OLDI_MODE_SINGLE_LINK:
> +			if (oldi->oldi_instance == OLDI(0))
> +				mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_BG;
> +			else if (oldi->oldi_instance == OLDI(1))
> +				mask = OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
> +
> +			break;
> +		case OLDI_MODE_CLONE_SINGLE_LINK:
> +		case OLDI_MODE_DUAL_LINK:
> +			mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
> +			break;
> +		default:
> +			if (oldi->oldi_instance == OLDI(0))
> +				mask = OLDI_PWRDN_TX(0);
> +			else if (oldi->oldi_instance == OLDI(1))
> +				mask = OLDI_PWRDN_TX(1);
> +
> +			val = mask;
> +			break;
> +		}
> +	} else {
> +		switch (oldi->link_type) {
> +		case OLDI_MODE_CLONE_SINGLE_LINK:
> +		case OLDI_MODE_DUAL_LINK:
> +			mask = OLDI_PWRDN_TX(0) | OLDI_PWRDN_TX(1) | OLDI_PWRDN_BG;
> +			break;
> +		case OLDI_MODE_SINGLE_LINK:
> +		default:
> +			if (oldi->oldi_instance == OLDI(0))
> +				mask = OLDI_PWRDN_TX(0);
> +			else if (oldi->oldi_instance == OLDI(1))
> +				mask = OLDI_PWRDN_TX(1);
> +
> +			break;
> +		}
> +		val = mask;
> +	}
> +
> +	regmap_update_bits(oldi->io_ctrl, OLDI_PD_CTRL, mask, val);
> +}
> +
> +static int tidss_oldi_config(struct tidss_oldi *oldi)
> +{
> +	const struct oldi_bus_format *bus_fmt = NULL;
> +	u32 oldi_reset_bit = BIT(5);
> +	int count = 0;
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
> +			 "OLDI%d: DSS port width %d not supported\n",
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
> +		dev_err(oldi->dev, "OLDI%d: Unsupported mode.\n",
> +			oldi->oldi_instance);
> +		return -EINVAL;
> +	}
> +
> +	tidss_configure_oldi(oldi->tidss, oldi->parent_vp, oldi_cfg);

If you expose this kind of function, I think you might as well move the 
below while loop into that function, and return an error code from 
tidss_configure_oldi. Then you don't need to expose tidss_get_status().

To handle the other call to tidss_configure_oldi() where you pass 0 as 
the oldi_cfg, you could either skip the while loop for oldi_cfg == 0 
(are you sure you don't need to wait in that case too?), or have a 
separate function in tidss for disabling oldi.

But looking at the AM62a TRM, this doesn't seem to follow the steps. It has:

4. Software checks that the PLLs are stable and locked.

5. Release OLDITX_SW_RST = 1 (by configuring DSS0_VP_DSS_OLDI_CFG[12] 
SOFTRST register bit).

But you set the OLDITX_SW_RST while configuring.

> +	while (!(oldi_reset_bit & tidss_get_status(oldi->tidss)) &&
> +	       count < 10000)
> +		count++;
> +
> +	if (!(oldi_reset_bit & tidss_get_status(oldi->tidss)))
> +		dev_warn(oldi->dev, "%s: OLDI%d timeout waiting OLDI reset done\n",
> +			 __func__, oldi->oldi_instance);
> +
> +	return 0;
> +}
> +
> +static void tidss_oldi_atomic_early_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
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
> +	/* Enable the OLDI serial clock (7 times the pixel clock) */

This doesn't enable the clk, just sets the rate.

> +	oldi_set_serial_clk(oldi, mode->clock * 7 * 1000);
> +
> +	/* Enable OLDI IO power */
> +	tidss_oldi_tx_power(oldi, true);
> +}
> +
> +static void tidss_oldi_atomic_late_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
> +{
> +	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
> +
> +	/* Disable OLDI IO power */
> +	tidss_oldi_tx_power(oldi, false);
> +
> +	/* Disable OLDI clock by setting IDLE Frequency */

And this doesn't disable the clock...

What is the reason to change the freq at disable time anyway, if the 
power and OLDI are disabled?

> +	oldi_set_serial_clk(oldi, OLDI_IDLE_CLK_HZ);
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
> +static int tidss_oldi_atomic_check(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	/*
> +	 * There might be flags negotiation supported in future but
> +	 * set the bus flags in atomic_check statically for now.
> +	 */
> +
> +	/* Not sure what this is required for, at the moment */

Do you mean that this is required (for OLDI to work) but you don't know 
why, or that this is not required?

> +	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
> +	.attach		= tidss_oldi_bridge_attach,
> +	.atomic_check	= tidss_oldi_atomic_check,
> +	.atomic_early_enable = tidss_oldi_atomic_early_enable,
> +	.atomic_late_disable = tidss_oldi_atomic_late_disable,
> +	.atomic_get_input_bus_fmts = tidss_oldi_atomic_get_input_bus_fmts,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +static int get_oldi_mode(struct device_node *oldi_tx)
> +{
> +	struct device_node *companion;
> +	struct device_node *port0, *port1;
> +	int pixel_order;
> +
> +	/*
> +	 * Find if the OLDI is paired with another OLDI for combined OLDI
> +	 * operation (dual-lvds or clone).
> +	 */
> +	companion = of_parse_phandle(oldi_tx, "ti,companion-oldi", 0);
> +	if (!companion) {
> +		if (of_property_read_bool(oldi_tx, "ti,secondary-oldi"))
> +			return OLDI_MODE_SECONDARY;
> +
> +		/*
> +		 * The OLDI TX does not have a companion, nor is it a
> +		 * secondary OLDI. It will operate independently.
> +		 */
> +		return OLDI_MODE_SINGLE_LINK;
> +	}
> +
> +	/*
> +	 * We need to work out if the sink is expecting us to function in
> +	 * dual-link mode. We do this by looking at the DT port nodes we are
> +	 * connected to, if they are marked as expecting even pixels and
> +	 * odd pixels than we need to enable vertical stripe output.
> +	 */
> +	port0 = of_graph_get_port_by_id(oldi_tx, 1);
> +	port1 = of_graph_get_port_by_id(companion, 1);
> +	pixel_order = drm_of_lvds_get_dual_link_pixel_order(port0, port1);
> +	of_node_put(port0);
> +	of_node_put(port1);
> +	of_node_put(companion);
> +
> +	switch (pixel_order) {
> +	case -EINVAL:
> +		/*
> +		 * The dual link properties were not found in at least
> +		 * one of the sink nodes. Since 2 OLDI ports are present
> +		 * in the DT, it can be safely assumed that the required
> +		 * configuration is Clone Mode.
> +		 */
> +		return OLDI_MODE_CLONE_SINGLE_LINK;
> +
> +	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> +		return OLDI_MODE_DUAL_LINK;
> +
> +	/* Unsupported OLDI Modes */
> +	case DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS:
> +	default:
> +		return OLDI_MODE_UNSUPPORTED;
> +	}
> +}
> +
> +static u32 get_parent_dss_vp(struct device_node *oldi_tx, u32 *parent_vp)

The return value should be int.

> +{
> +	struct device_node *ep, *dss_port;
> +	int ret = 0;

Unnecessary initialization.

> +
> +	ep = of_graph_get_endpoint_by_regs(oldi_tx, OLDI_INPUT_PORT, -1);
> +	if (ep) {
> +		dss_port = of_graph_get_remote_port(ep);
> +		if (!dss_port) {
> +			ret = -ENODEV;
> +			goto err_return_ep_port;
> +		}
> +
> +		ret = of_property_read_u32(dss_port, "reg", parent_vp);
> +
> +		of_node_put(dss_port);
> +err_return_ep_port:
> +		of_node_put(ep);
> +		return ret;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static const struct drm_bridge_timings default_tidss_oldi_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE
> +			 | DRM_BUS_FLAG_DE_HIGH,
> +};
> +
> +void tidss_oldi_deinit(struct tidss_device *tidss)
> +{
> +	for (int i = 0; i < tidss->num_oldis; i++) {
> +		if (tidss->oldis[i]) {
> +			drm_bridge_remove(&tidss->oldis[i]->bridge);
> +			tidss->oldis[i] = NULL;
> +		}
> +	}
> +}
> +
> +int tidss_oldi_init(struct tidss_device *tidss)
> +{
> +	struct tidss_oldi *oldi;
> +	struct device_node *child;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	u32 parent_vp, oldi_instance;
> +	enum tidss_oldi_link_type link_type = OLDI_MODE_UNSUPPORTED;
> +	struct device_node *oldi_parent;
> +	int ret = 0;
> +
> +	tidss->num_oldis = 0;
> +
> +	oldi_parent = of_get_child_by_name(tidss->dev->of_node, "oldi-txes");
> +	if (!oldi_parent)
> +		/* Return gracefully */
> +		return 0;
> +
> +	for_each_child_of_node(oldi_parent, child) {
> +		ret = get_parent_dss_vp(child, &parent_vp);
> +		if (ret) {
> +			if (ret == -ENODEV) {
> +				/*
> +				 * ENODEV means that this particular OLDI node
> +				 * is not connected with the DSS, which is not
> +				 * a harmful case. There could be another OLDI
> +				 * which may still be connected.
> +				 * Continue to search for that.
> +				 */
> +				ret = 0;
> +				continue;
> +			}
> +			goto err_put_node;
> +		}
> +
> +		ret = of_property_read_u32(child, "reg", &oldi_instance);
> +		if (ret)
> +			goto err_put_node;
> +
> +		/*
> +		 * Now that its confirmed that OLDI is connected with DSS, let's
> +		 * continue getting the OLDI sinks ahead and other OLDI
> +		 * properties.
> +		 */
> +		ret = drm_of_find_panel_or_bridge(child, OLDI_OURPUT_PORT, -1,
> +						  &panel, &bridge);
> +		if (ret) {
> +			/*
> +			 * Either there was no OLDI sink in the devicetree, or
> +			 * the OLDI sink has not been added yet. In any case,
> +			 * return.
> +			 * We don't want to have an OLDI node connected to DSS
> +			 * but not to any sink.
> +			 */
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(tidss->dev,
> +					"no panel/bridge for OLDI%d. Error %d\n",
> +					oldi_instance, ret);
> +			goto err_put_node;
> +		}
> +
> +		if (panel) {
> +			bridge = devm_drm_panel_bridge_add(tidss->dev, panel);
> +			if (IS_ERR(bridge)) {
> +				ret = PTR_ERR(bridge);
> +				goto err_put_node;
> +			}
> +		}
> +
> +		link_type = get_oldi_mode(child);
> +		if (link_type == OLDI_MODE_UNSUPPORTED) {
> +			dev_err(tidss->dev,
> +				"OLDI%d: Unsupported OLDI connection.\n",
> +				oldi_instance);
> +			ret = -EINVAL;
> +			goto err_put_node;
> +		} else if (link_type == OLDI_MODE_SECONDARY) {
> +			/*
> +			 * This is the secondary OLDI node, which serves as a
> +			 * companinon to the primary OLDI, when it is configured
> +			 * for the dual-lvds mode. Since the primary OLDI will
> +			 * be a part of bridge chain, no need to put this one
> +			 * too. Continue onto the next OLDI node.
> +			 */
> +			continue;
> +		}
> +
> +		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
> +		if (!oldi) {
> +			ret = -ENOMEM;
> +			goto err_put_node;
> +		}
> +
> +		oldi->link_type = link_type;
> +		oldi->oldi_instance = oldi_instance;
> +		oldi->dev = tidss->dev;
> +		oldi->next_bridge = bridge;
> +		oldi->panel = panel;
> +
> +		oldi->io_ctrl = syscon_regmap_lookup_by_phandle(child,
> +								"ti,oldi-io-ctrl");
> +		if (IS_ERR(oldi->io_ctrl)) {
> +			dev_err(oldi->dev,
> +				"%s: oldi%d syscon_regmap_lookup_by_phandle failed %ld\n",
> +			       __func__, oldi_instance, PTR_ERR(oldi->io_ctrl));
> +			ret = PTR_ERR(oldi->io_ctrl);
> +			goto err_put_node;
> +		}
> +
> +		oldi->s_clk = of_clk_get_by_name(child, "s_clk");
> +		if (IS_ERR(oldi->s_clk)) {
> +			dev_err(oldi->dev,
> +				"%s: oldi%d Failed to get s_clk: %ld\n",
> +				__func__, oldi_instance, PTR_ERR(oldi->s_clk));
> +			ret = PTR_ERR(oldi->s_clk);
> +			goto err_put_node;
> +		}
> +
> +		/* Register the bridge. */
> +		oldi->bridge.of_node = child;
> +		oldi->bridge.driver_private = oldi;
> +		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
> +		oldi->bridge.timings = &default_tidss_oldi_timings;
> +
> +		tidss->oldis[tidss->num_oldis++] = oldi;
> +		oldi->tidss = tidss;
> +
> +		drm_bridge_add(&oldi->bridge);
> +	}
> +
> +err_put_node:
> +	of_node_put(child);
> +	of_node_put(oldi_parent);
> +	return ret;

I usually have the non-error code path at the end of the main function 
code, with "return 0", and the error cases separately below. Reading the 
above, it makes me think that if we reach the end of the 
for_each_child_of_node block, we're in an error state as we pass the 
err_put_node...

> +}
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
> new file mode 100644
> index 000000000000..5ad02ddea11a
> --- /dev/null
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023 - Texas Instruments Incorporated
> + *
> + * Aradhya Bhatia <a-bhati1@ti.com>
> + */
> +
> +#ifndef __TIDSS_OLDI_H__
> +#define __TIDSS_OLDI_H__
> +
> +#include <linux/media-bus-format.h>
> +
> +#include "tidss_drv.h"
> +#include "tidss_dispc.h"
> +
> +struct tidss_oldi;
> +
> +/* OLDI Instances */
> +#define OLDI(n)		n

This is an odd macro... At least the n should be inside parenthesis, 
but... Isn't a plain number just fine, why do you need a macro?

> +
> +/* OLDI PORTS */
> +#define OLDI_INPUT_PORT		0
> +#define OLDI_OURPUT_PORT	1
> +
> +/* OLDI Config Bits */
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

These are bits of the DISPC_VP_DSS_OLDI_CFG register, so it would be 
nicer to have these in the tidss_dispc_regs.h.

> +
> +/* Control MMR Register */
> +
> +/* Register offsets */
> +#define OLDI_PD_CTRL            0x100
> +#define OLDI_LB_CTRL            0x104
> +
> +/* Power control bits */
> +#define OLDI_PWRDN_TX(n)	BIT(n)
> +
> +/* LVDS Bandgap reference Enable/Disable */
> +#define OLDI_PWRDN_BG		BIT(8)
> +
> +#define OLDI_IDLE_CLK_HZ	25000000 /*25 MHz */
> +
> +enum tidss_oldi_link_type {
> +	OLDI_MODE_UNSUPPORTED,
> +	OLDI_MODE_SINGLE_LINK,
> +	OLDI_MODE_CLONE_SINGLE_LINK,
> +	OLDI_MODE_DUAL_LINK,
> +	OLDI_MODE_SECONDARY,
> +};
> +
> +enum oldi_mode_reg_val { SPWG_18 = 0, JEIDA_24 = 1, SPWG_24 = 2 };
> +
> +struct oldi_bus_format {
> +	u32 bus_fmt;
> +	u32 data_width;
> +	enum oldi_mode_reg_val oldi_mode_reg_val;
> +	u32 input_bus_fmt;
> +};
> +
> +int tidss_oldi_init(struct tidss_device *tidss);
> +void tidss_oldi_deinit(struct tidss_device *tidss);
> +
> +#endif /* __TIDSS_OLDI_H__ */

