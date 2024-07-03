Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8D9256A2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 11:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9A10E1FC;
	Wed,  3 Jul 2024 09:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KFujur3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED9110E1FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719998614;
 bh=3p4jCo07KorC/Q2s2wiGJUlf/uZd6/quP5XG15P2JuU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KFujur3dDxKT2tQJXDAsqhTEXFQyn3z6fizRWrLV9mBClub/Cq/nWX0d/3O4qqEZh
 6RMpVoo6nKEB02R2t9Mu6a6lCHEmXsz7GRVbl3yu2ns6Ot2Di1+hAZK3v6pWol9PQx
 CLAeVBggxpZ9oq2JpScxGFX90LTVjhSMrSNHvjnwPIU5wRBGOCRShMXMr99Zyg9+FD
 m70iQ89UkopvcWWTySADAA1x8biTK+9c6f3ZWgC+1cp67bderiD6QmzVEUqbSRJtRy
 jjc+bf+gM/3JyNiLlHUHFFG6vJC8KNsEQkRrvknqMa0KkXm8tJNjoGQzixpHZFkG0g
 U2Xp/P3qK2zMg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6D4937820A6;
 Wed,  3 Jul 2024 09:23:32 +0000 (UTC)
Message-ID: <d9390fb4-98e2-40e7-a5d2-67d101585698@collabora.com>
Date: Wed, 3 Jul 2024 11:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
To: Sandor Yu <Sandor.yu@nxp.com>, dmitry.baryshkov@linaro.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com,
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
References: <cover.1719903904.git.Sandor.yu@nxp.com>
 <359914108b879e995d4a39de32a33310009f0fab.1719903904.git.Sandor.yu@nxp.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <359914108b879e995d4a39de32a33310009f0fab.1719903904.git.Sandor.yu@nxp.com>
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


Le 02/07/2024 à 14:22, Sandor Yu a écrit :
> Add a new DRM DisplayPort and HDMI bridge driver for Candence MHDP8501
> used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> standards according embedded Firmware running in the uCPU.
>
> For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> SOC's ROM code. Bootload binary included respective specific firmware
> is required.
>
> Driver will check display connector type and
> then load the corresponding driver.
>
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> v15->v16:
> - rebase the patchset sits on top Dmitry's
>     'make use of the HDMI connector infrastructure' patchset ([2]).
> - Add DRM_BRIDGE_OP_HDMI flags for HDMI driver,
> - Introduce the hdmi info frame helper functions, added hdmi_clear_infoframe(),
>    hdmi_write_infoframe() and hdmi_tmds_char_rate_valid().
> - mode_fixup() was replaced by atomic_check().
> - Fix video mode 4Kp30 did not work on some displays that support
>    LTE_340Mcsc_scramble.
> - updated for tmds_char_rate added in patch #2.
>
> v13->v14:
> - Rebase to next-20240219, replace get_edid function by edid_read
>    function.
>
> v12->v13:
> - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> - Fix build warning
> - Order bit bpc and color_space in descending shit.
>
> v11->v12:
> - Replace DRM_INFO with dev_info or dev_warn.
> - Replace DRM_ERROR with dev_err.
> - Return ret when cdns_mhdp_dpcd_read failed in function cdns_dp_aux_transferi().
> - Remove unused parmeter in function cdns_dp_get_msa_misc
>    and use two separate variables for color space and bpc.
> - Add year 2024 to copyright.
>
>   drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
>   drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
>   .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 330 +++++++++
>   .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 367 +++++++++
>   .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 700 ++++++++++++++++++
>   .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 595 +++++++++++++++
>   6 files changed, 2010 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
>   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
>
> diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> index e0973339e9e3..45848e741f5f 100644
> --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> @@ -51,3 +51,19 @@ config DRM_CDNS_MHDP8546_J721E
>   	  initializes the J721E Display Port and sets up the
>   	  clock and data muxes.
>   endif
> +
> +config DRM_CDNS_MHDP8501
> +	tristate "Cadence MHDP8501 DP/HDMI bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select CDNS_MHDP_HELPER
> +	select DRM_CDNS_AUDIO
> +	depends on OF
> +	help
> +	  Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> +	  Cadence MHDP8501 support one or more protocols,
> +	  including DisplayPort and HDMI.
> +	  To use the DP and HDMI drivers, their respective
> +	  specific firmware is required.
> diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> index 087dc074820d..02c1a9f3cf6f 100644
> --- a/drivers/gpu/drm/bridge/cadence/Makefile
> +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> @@ -6,3 +6,5 @@ obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
>   obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
>   cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
>   cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> +obj-$(CONFIG_DRM_CDNS_MHDP8501) += cdns-mhdp8501.o
> +cdns-mhdp8501-y := cdns-mhdp8501-core.o cdns-mhdp8501-dp.o cdns-mhdp8501-hdmi.o
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> new file mode 100644
> index 000000000000..c306db982b76
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence Display Port Interface (DP) driver
> + *
> + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <linux/clk.h>
> +#include <linux/irq.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +
> +#include "cdns-mhdp8501-core.h"
> +
> +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 status;
> +	int ret;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
> +				     GENERAL_GET_HPD_STATE, 0, NULL);
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_GENERAL,
> +					    GENERAL_GET_HPD_STATE,
> +					    sizeof(status));
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
> +	if (ret)
> +		goto err_get_hpd;
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	return status;
> +
> +err_get_hpd:
> +	dev_err(mhdp->dev, "read hpd  failed: %d\n", ret);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	return ret;
> +}
> +
> +enum drm_connector_status cdns_mhdp8501_detect(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 hpd = 0xf;
> +
> +	hpd = cdns_mhdp8501_read_hpd(mhdp);
> +	if (hpd == 1)
> +		return connector_status_connected;
> +	else if (hpd == 0)
> +		return connector_status_disconnected;
> +
> +	dev_warn(mhdp->dev, "Unknown cable status, hdp=%u\n", hpd);
> +	return connector_status_unknown;
> +}
> +
> +static void hotplug_work_func(struct work_struct *work)
> +{
> +	struct cdns_mhdp8501_device *mhdp = container_of(work,
> +						     struct cdns_mhdp8501_device,
> +						     hotplug_work.work);
> +	enum drm_connector_status status = cdns_mhdp8501_detect(mhdp);
> +
> +	drm_bridge_hpd_notify(&mhdp->bridge, status);
> +
> +	if (status == connector_status_connected) {
> +		/* Cable connected  */
> +		DRM_INFO("HDMI/DP Cable Plug In\n");
> +		enable_irq(mhdp->irq[IRQ_OUT]);
> +	} else if (status == connector_status_disconnected) {
> +		/* Cable Disconnected  */
> +		DRM_INFO("HDMI/DP Cable Plug Out\n");
> +		enable_irq(mhdp->irq[IRQ_IN]);
> +	}
> +}
> +
> +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> +{
> +	struct cdns_mhdp8501_device *mhdp = data;
> +
> +	disable_irq_nosync(irq);
> +
> +	mod_delayed_work(system_wq, &mhdp->hotplug_work,
> +			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device *mhdp,
> +				  struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(np, 1, 0);
> +	if (!remote) {
> +		dev_err(dev, "fail to get remote node\n");
> +		of_node_put(remote);
> +		return -EINVAL;
> +	}
> +
> +	/* get connector type */
> +	if (of_device_is_compatible(remote, "hdmi-connector")) {
> +		mhdp->connector_type = DRM_MODE_CONNECTOR_HDMIA;
> +
> +	} else if (of_device_is_compatible(remote, "dp-connector")) {
> +		mhdp->connector_type = DRM_MODE_CONNECTOR_DisplayPort;
> +
> +	} else {
> +		dev_err(dev, "Unknown connector type\n");
> +		of_node_put(remote);
> +		return -EINVAL;
> +	}
> +
> +	of_node_put(remote);
> +	return true;
> +}
> +
> +static void cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device *mhdp)
> +{
> +	mhdp->bridge.type = mhdp->connector_type;
> +	mhdp->bridge.driver_private = mhdp;
> +	mhdp->bridge.of_node = mhdp->dev->of_node;
> +	mhdp->bridge.vendor = "NXP";
> +	mhdp->bridge.product = "i.MX8";
> +	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +			   DRM_BRIDGE_OP_HPD;
> +
> +	if (mhdp->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> +		mhdp->bridge.funcs = &cdns_hdmi_bridge_funcs;
> +		mhdp->bridge.ops |= DRM_BRIDGE_OP_HDMI;
> +	} else if (mhdp->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		mhdp->bridge.funcs = &cdns_dp_bridge_funcs;
> +	} else {
> +		dev_err(mhdp->dev, "Unsupported connector type!\n");
> +		return;
> +	}
> +
> +	drm_bridge_add(&mhdp->bridge);
> +}
> +
> +static int cdns_mhdp8501_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cdns_mhdp8501_device *mhdp;
> +	struct resource *res;
> +	enum phy_mode phy_mode;
> +	u32 reg;
> +	int ret;
> +
> +	mhdp = devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> +	if (!mhdp)
> +		return -ENOMEM;
> +
> +	mutex_init(&mhdp->mbox_mutex);
> +	mhdp->dev = dev;
> +
> +	INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	mhdp->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	if (IS_ERR(mhdp->regs))
> +		return PTR_ERR(mhdp->regs);
> +
> +	ret = cdns_mhdp8501_dt_parse(mhdp, pdev);
> +	if (ret < 0)
> +		return -EINVAL;
> +
> +	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
> +	if (IS_ERR(mhdp->phy))
> +		return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no PHY configured\n");
> +
> +	mhdp->irq[IRQ_IN] = platform_get_irq_byname(pdev, "plug_in");
> +	if (mhdp->irq[IRQ_IN] < 0)
> +		return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No plug_in irq number\n");
> +
> +	mhdp->irq[IRQ_OUT] = platform_get_irq_byname(pdev, "plug_out");
> +	if (mhdp->irq[IRQ_OUT] < 0)
> +		return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No plug_out irq number\n");
> +
> +	irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
> +	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> +					NULL, cdns_mhdp8501_irq_thread,
> +					IRQF_ONESHOT, dev_name(dev), mhdp);
> +	if (ret < 0) {
> +		dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
> +		return -EINVAL;
> +	}
> +
> +	irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
> +	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> +					NULL, cdns_mhdp8501_irq_thread,
> +					IRQF_ONESHOT, dev_name(dev), mhdp);
> +	if (ret < 0) {
> +		dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_OUT]);
> +		return -EINVAL;
> +	}
> +
> +	/* set default lane mapping */
> +	mhdp->lane_mapping = LANE_MAPPING_NORMAL;
> +
> +	/* cdns_mhdp8501_dt_parse() ensures connector_type is valid */
> +	mhdp->plat_data = of_device_get_match_data(dev);
> +	if (mhdp->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		mhdp->lane_mapping = mhdp->plat_data->dp_lane_mapping;
> +		phy_mode = PHY_MODE_DP;
> +	} else if (mhdp->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
> +		mhdp->lane_mapping = mhdp->plat_data->hdmi_lane_mapping;
> +		phy_mode = PHY_MODE_HDMI;
> +	}

On imx8mq-zii-ultra board lane mapping doesn't follow your default setting.
Please add a "lane-mapping" property in the DT to allow to customized this setting for each board.
You can make it optional and keep the default value when the property is missing on the DT node.

Regards,
Benjamin

> +
> +	dev_set_drvdata(dev, mhdp);
> +
> +	/* init base struct for access mhdp mailbox */
> +	mhdp->base.dev = mhdp->dev;
> +	mhdp->base.regs = mhdp->regs;
> +	mhdp->base.mbox_mutex = &mhdp->mbox_mutex;
> +
> +	if (mhdp->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		drm_dp_aux_init(&mhdp->dp.aux);
> +		mhdp->dp.aux.name = "mhdp8501_dp_aux";
> +		mhdp->dp.aux.dev = dev;
> +		mhdp->dp.aux.transfer = cdns_dp_aux_transfer;
> +	}
> +
> +	/* Enable APB clock */
> +	mhdp->apb_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(mhdp->apb_clk))
> +		return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk),
> +				     "couldn't get apb clk\n");
> +
> +	clk_prepare_enable(mhdp->apb_clk);
> +
> +	/*
> +	 * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> +	 * Updated each sched "tick" (~2ms)
> +	 */
> +	ret = readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> +				 reg & CDNS_KEEP_ALIVE_MASK, 500,
> +				 CDNS_KEEP_ALIVE_TIMEOUT);
> +	if (ret) {
> +		dev_err(dev, "device didn't give any life sign: reg %d\n", reg);
> +		goto clk_disable;
> +	}
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_init(mhdp->phy);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> +		goto clk_disable;
> +	}
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_set_mode(mhdp->phy, phy_mode);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret) {
> +		dev_err(dev, "Failed to configure PHY: %d\n", ret);
> +		goto clk_disable;
> +	}
> +
> +	/* Enable cable hotplug detect */
> +	if (cdns_mhdp8501_read_hpd(mhdp))
> +		enable_irq(mhdp->irq[IRQ_OUT]);
> +	else
> +		enable_irq(mhdp->irq[IRQ_IN]);
> +
> +	cdns_mhdp8501_add_bridge(mhdp);
> +
> +	return 0;
> +
> +clk_disable:
> +	clk_disable_unprepare(mhdp->apb_clk);
> +
> +	return -EINVAL;
> +}
> +
> +static void cdns_mhdp8501_remove(struct platform_device *pdev)
> +{
> +	struct cdns_mhdp8501_device *mhdp = platform_get_drvdata(pdev);
> +
> +	if (mhdp->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +		cdns_dp_aux_destroy(mhdp);
> +
> +	drm_bridge_remove(&mhdp->bridge);
> +	clk_disable_unprepare(mhdp->apb_clk);
> +}
> +
> +static struct mhdp8501_plat_data imx8mq_mhdp_drv_data = {
> +	.hdmi_lane_mapping = LANE_MAPPING_FLIPPED,
> +	.dp_lane_mapping = LANE_MAPPING_IMX8MQ_DP,
> +};
> +
> +static const struct of_device_id cdns_mhdp8501_dt_ids[] = {
> +	{ .compatible = "fsl,imx8mq-mhdp8501",
> +	  .data = &imx8mq_mhdp_drv_data
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, cdns_mhdp8501_dt_ids);
> +
> +static struct platform_driver cdns_mhdp8501_driver = {
> +	.probe = cdns_mhdp8501_probe,
> +	.remove = cdns_mhdp8501_remove,
> +	.driver = {
> +		.name = "cdns-mhdp8501",
> +		.of_match_table = cdns_mhdp8501_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(cdns_mhdp8501_driver);
> +
> +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> +MODULE_DESCRIPTION("Cadence MHDP8501 bridge driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> new file mode 100644
> index 000000000000..593071f36995
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> @@ -0,0 +1,367 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence MHDP 8501 Common head file
> + *
> + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> + *
> + */
> +
> +#ifndef _CDNS_MHDP8501_CORE_H_
> +#define _CDNS_MHDP8501_CORE_H_
> +
> +#include <drm/bridge/cdns-mhdp-helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/display/drm_dp_helper.h>
> +#include <linux/bitops.h>
> +
> +#define ADDR_IMEM			0x10000
> +#define ADDR_DMEM			0x20000
> +
> +/* APB CFG addr */
> +#define APB_CTRL			0
> +#define XT_INT_CTRL			0x04
> +#define MAILBOX_FULL_ADDR		0x08
> +#define MAILBOX_EMPTY_ADDR		0x0c
> +#define MAILBOX0_WR_DATA		0x10
> +#define MAILBOX0_RD_DATA		0x14
> +#define KEEP_ALIVE			0x18
> +#define VER_L				0x1c
> +#define VER_H				0x20
> +#define VER_LIB_L_ADDR			0x24
> +#define VER_LIB_H_ADDR			0x28
> +#define SW_DEBUG_L			0x2c
> +#define SW_DEBUG_H			0x30
> +#define MAILBOX_INT_MASK		0x34
> +#define MAILBOX_INT_STATUS		0x38
> +#define SW_CLK_L			0x3c
> +#define SW_CLK_H			0x40
> +#define SW_EVENTS0			0x44
> +#define SW_EVENTS1			0x48
> +#define SW_EVENTS2			0x4c
> +#define SW_EVENTS3			0x50
> +#define XT_OCD_CTRL			0x60
> +#define APB_INT_MASK			0x6c
> +#define APB_STATUS_MASK			0x70
> +
> +/* Source phy comp */
> +#define PHY_DATA_SEL			0x0818
> +#define LANES_CONFIG			0x0814
> +
> +/* Source CAR Addr */
> +#define SOURCE_HDTX_CAR			0x0900
> +#define SOURCE_DPTX_CAR			0x0904
> +#define SOURCE_PHY_CAR			0x0908
> +#define SOURCE_CEC_CAR			0x090c
> +#define SOURCE_CBUS_CAR			0x0910
> +#define SOURCE_PKT_CAR			0x0918
> +#define SOURCE_AIF_CAR			0x091c
> +#define SOURCE_CIPHER_CAR		0x0920
> +#define SOURCE_CRYPTO_CAR		0x0924
> +
> +/* clock meters addr */
> +#define CM_CTRL				0x0a00
> +#define CM_I2S_CTRL			0x0a04
> +#define CM_SPDIF_CTRL			0x0a08
> +#define CM_VID_CTRL			0x0a0c
> +#define CM_LANE_CTRL			0x0a10
> +#define I2S_NM_STABLE			0x0a14
> +#define I2S_NCTS_STABLE			0x0a18
> +#define SPDIF_NM_STABLE			0x0a1c
> +#define SPDIF_NCTS_STABLE		0x0a20
> +#define NMVID_MEAS_STABLE		0x0a24
> +#define I2S_MEAS			0x0a40
> +#define SPDIF_MEAS			0x0a80
> +#define NMVID_MEAS			0x0ac0
> +
> +/* source vif addr */
> +#define BND_HSYNC2VSYNC			0x0b00
> +#define HSYNC2VSYNC_F1_L1		0x0b04
> +#define HSYNC2VSYNC_STATUS		0x0b0c
> +#define HSYNC2VSYNC_POL_CTRL		0x0b10
> +
> +/* MHDP TX_top_comp */
> +#define SCHEDULER_H_SIZE		0x1000
> +#define SCHEDULER_V_SIZE		0x1004
> +#define HDTX_SIGNAL_FRONT_WIDTH		0x100c
> +#define HDTX_SIGNAL_SYNC_WIDTH		0x1010
> +#define HDTX_SIGNAL_BACK_WIDTH		0x1014
> +#define HDTX_CONTROLLER			0x1018
> +#define HDTX_HPD			0x1020
> +#define HDTX_CLOCK_REG_0		0x1024
> +#define HDTX_CLOCK_REG_1		0x1028
> +
> +/* DPTX hpd addr */
> +#define HPD_IRQ_DET_MIN_TIMER		0x2100
> +#define HPD_IRQ_DET_MAX_TIMER		0x2104
> +#define HPD_UNPLGED_DET_MIN_TIMER	0x2108
> +#define HPD_STABLE_TIMER		0x210c
> +#define HPD_FILTER_TIMER		0x2110
> +#define HPD_EVENT_MASK			0x211c
> +#define HPD_EVENT_DET			0x2120
> +
> +/* DPTX framer addr */
> +#define DP_FRAMER_GLOBAL_CONFIG		0x2200
> +#define DP_SW_RESET			0x2204
> +#define DP_FRAMER_TU			0x2208
> +#define DP_FRAMER_PXL_REPR		0x220c
> +#define DP_FRAMER_SP			0x2210
> +#define AUDIO_PACK_CONTROL		0x2214
> +#define DP_VC_TABLE(x)			(0x2218 + ((x) << 2))
> +#define DP_VB_ID			0x2258
> +#define DP_MTPH_LVP_CONTROL		0x225c
> +#define DP_MTPH_SYMBOL_VALUES		0x2260
> +#define DP_MTPH_ECF_CONTROL		0x2264
> +#define DP_MTPH_ACT_CONTROL		0x2268
> +#define DP_MTPH_STATUS			0x226c
> +#define DP_INTERRUPT_SOURCE		0x2270
> +#define DP_INTERRUPT_MASK		0x2274
> +#define DP_FRONT_BACK_PORCH		0x2278
> +#define DP_BYTE_COUNT			0x227c
> +
> +/* DPTX stream addr */
> +#define MSA_HORIZONTAL_0		0x2280
> +#define MSA_HORIZONTAL_1		0x2284
> +#define MSA_VERTICAL_0			0x2288
> +#define MSA_VERTICAL_1			0x228c
> +#define MSA_MISC			0x2290
> +#define STREAM_CONFIG			0x2294
> +#define AUDIO_PACK_STATUS		0x2298
> +#define VIF_STATUS			0x229c
> +#define PCK_STUFF_STATUS_0		0x22a0
> +#define PCK_STUFF_STATUS_1		0x22a4
> +#define INFO_PACK_STATUS		0x22a8
> +#define RATE_GOVERNOR_STATUS		0x22ac
> +#define DP_HORIZONTAL			0x22b0
> +#define DP_VERTICAL_0			0x22b4
> +#define DP_VERTICAL_1			0x22b8
> +#define DP_BLOCK_SDP			0x22bc
> +
> +/* DPTX glbl addr */
> +#define DPTX_LANE_EN			0x2300
> +#define DPTX_ENHNCD			0x2304
> +#define DPTX_INT_MASK			0x2308
> +#define DPTX_INT_STATUS			0x230c
> +
> +/* DP AUX Addr */
> +#define DP_AUX_HOST_CONTROL		0x2800
> +#define DP_AUX_INTERRUPT_SOURCE		0x2804
> +#define DP_AUX_INTERRUPT_MASK		0x2808
> +#define DP_AUX_SWAP_INVERSION_CONTROL	0x280c
> +#define DP_AUX_SEND_NACK_TRANSACTION	0x2810
> +#define DP_AUX_CLEAR_RX			0x2814
> +#define DP_AUX_CLEAR_TX			0x2818
> +#define DP_AUX_TIMER_STOP		0x281c
> +#define DP_AUX_TIMER_CLEAR		0x2820
> +#define DP_AUX_RESET_SW			0x2824
> +#define DP_AUX_DIVIDE_2M		0x2828
> +#define DP_AUX_TX_PREACHARGE_LENGTH	0x282c
> +#define DP_AUX_FREQUENCY_1M_MAX		0x2830
> +#define DP_AUX_FREQUENCY_1M_MIN		0x2834
> +#define DP_AUX_RX_PRE_MIN		0x2838
> +#define DP_AUX_RX_PRE_MAX		0x283c
> +#define DP_AUX_TIMER_PRESET		0x2840
> +#define DP_AUX_NACK_FORMAT		0x2844
> +#define DP_AUX_TX_DATA			0x2848
> +#define DP_AUX_RX_DATA			0x284c
> +#define DP_AUX_TX_STATUS		0x2850
> +#define DP_AUX_RX_STATUS		0x2854
> +#define DP_AUX_RX_CYCLE_COUNTER		0x2858
> +#define DP_AUX_MAIN_STATES		0x285c
> +#define DP_AUX_MAIN_TIMER		0x2860
> +#define DP_AUX_AFE_OUT			0x2864
> +
> +/* source pif addr */
> +#define SOURCE_PIF_WR_ADDR		0x30800
> +#define SOURCE_PIF_WR_REQ		0x30804
> +#define SOURCE_PIF_RD_ADDR		0x30808
> +#define SOURCE_PIF_RD_REQ		0x3080c
> +#define SOURCE_PIF_DATA_WR		0x30810
> +#define SOURCE_PIF_DATA_RD		0x30814
> +#define SOURCE_PIF_FIFO1_FLUSH		0x30818
> +#define SOURCE_PIF_FIFO2_FLUSH		0x3081c
> +#define SOURCE_PIF_STATUS		0x30820
> +#define SOURCE_PIF_INTERRUPT_SOURCE	0x30824
> +#define SOURCE_PIF_INTERRUPT_MASK	0x30828
> +#define SOURCE_PIF_PKT_ALLOC_REG	0x3082c
> +#define SOURCE_PIF_PKT_ALLOC_WR_EN	0x30830
> +#define SOURCE_PIF_SW_RESET		0x30834
> +
> +#define LINK_TRAINING_NOT_ACTIV		0
> +#define LINK_TRAINING_RUN		1
> +#define LINK_TRAINING_RESTART		2
> +
> +#define CONTROL_VIDEO_IDLE		0
> +#define CONTROL_VIDEO_VALID		1
> +
> +#define INTERLACE_FMT_DET		BIT(12)
> +#define VIF_BYPASS_INTERLACE		BIT(13)
> +#define TU_CNT_RST_EN			BIT(15)
> +#define INTERLACE_DTCT_WIN		0x20
> +
> +#define DP_FRAMER_SP_INTERLACE_EN	BIT(2)
> +#define DP_FRAMER_SP_HSP		BIT(1)
> +#define DP_FRAMER_SP_VSP		BIT(0)
> +
> +/* Capability */
> +#define AUX_HOST_INVERT			3
> +#define FAST_LT_SUPPORT			1
> +#define FAST_LT_NOT_SUPPORT		0
> +#define LANE_MAPPING_NORMAL		0x1b
> +#define LANE_MAPPING_FLIPPED		0xe4
> +#define LANE_MAPPING_IMX8MQ_DP		0xc6
> +#define ENHANCED			1
> +#define SCRAMBLER_EN			BIT(4)
> +
> +#define FULL_LT_STARTED			BIT(0)
> +#define FASE_LT_STARTED			BIT(1)
> +#define CLK_RECOVERY_FINISHED		BIT(2)
> +#define EQ_PHASE_FINISHED		BIT(3)
> +#define FASE_LT_START_FINISHED		BIT(4)
> +#define CLK_RECOVERY_FAILED		BIT(5)
> +#define EQ_PHASE_FAILED			BIT(6)
> +#define FASE_LT_FAILED			BIT(7)
> +
> +#define TU_SIZE				30
> +#define CDNS_DP_MAX_LINK_RATE		540000
> +
> +#define F_HDMI_ENCODING(x) (((x) & ((1 << 2) - 1)) << 16)
> +#define F_VIF_DATA_WIDTH(x) (((x) & ((1 << 2) - 1)) << 2)
> +#define F_HDMI_MODE(x) (((x) & ((1 << 2) - 1)) << 0)
> +#define F_GCP_EN(x) (((x) & ((1 << 1) - 1)) << 12)
> +#define F_DATA_EN(x) (((x) & ((1 << 1) - 1)) << 15)
> +#define F_CLEAR_AVMUTE(x) (((x) & ((1 << 1) - 1)) << 14)
> +#define F_HDMI2_PREAMBLE_EN(x) (((x) & ((1 << 1) - 1)) << 18)
> +#define F_PIC_3D(x) (((x) & ((1 << 4) - 1)) << 7)
> +#define F_BCH_EN(x) (((x) & ((1 << 1) - 1)) << 11)
> +#define F_SOURCE_PHY_MHDP_SEL(x) (((x) & ((1 << 2) - 1)) << 3)
> +#define F_HPD_VALID_WIDTH(x) (((x) & ((1 << 12) - 1)) << 0)
> +#define F_HPD_GLITCH_WIDTH(x) (((x) & ((1 << 8) - 1)) << 12)
> +#define F_HDMI2_CTRL_IL_MODE(x) (((x) & ((1 << 1) - 1)) << 19)
> +#define F_SOURCE_PHY_LANE0_SWAP(x) (((x) & ((1 << 2) - 1)) << 0)
> +#define F_SOURCE_PHY_LANE1_SWAP(x) (((x) & ((1 << 2) - 1)) << 2)
> +#define F_SOURCE_PHY_LANE2_SWAP(x) (((x) & ((1 << 2) - 1)) << 4)
> +#define F_SOURCE_PHY_LANE3_SWAP(x) (((x) & ((1 << 2) - 1)) << 6)
> +#define F_SOURCE_PHY_COMB_BYPASS(x) (((x) & ((1 << 1) - 1)) << 21)
> +#define F_SOURCE_PHY_20_10(x) (((x) & ((1 << 1) - 1)) << 22)
> +#define F_PKT_ALLOC_ADDRESS(x) (((x) & ((1 << 4) - 1)) << 0)
> +#define F_ACTIVE_IDLE_TYPE(x) (((x) & ((1 << 1) - 1)) << 17)
> +#define F_FIFO1_FLUSH(x) (((x) & ((1 << 1) - 1)) << 0)
> +#define F_PKT_ALLOC_WR_EN(x) (((x) & ((1 << 1) - 1)) << 0)
> +#define F_DATA_WR(x) (x)
> +#define F_WR_ADDR(x) (((x) & ((1 << 4) - 1)) << 0)
> +#define F_HOST_WR(x) (((x) & ((1 << 1) - 1)) << 0)
> +#define F_TYPE_VALID(x) (((x) & ((1 << 1) - 1)) << 16)
> +#define F_PACKET_TYPE(x) (((x) & ((1 << 8) - 1)) << 8)
> +
> +/* Reference cycles when using lane clock as reference */
> +#define LANE_REF_CYC			0x8000
> +
> +/* HPD Debounce */
> +#define HOTPLUG_DEBOUNCE_MS		200
> +
> +/* HPD IRQ Index */
> +#define IRQ_IN    0
> +#define IRQ_OUT   1
> +#define IRQ_NUM   2
> +
> +/* FW check alive timeout */
> +#define CDNS_KEEP_ALIVE_TIMEOUT		2000
> +#define CDNS_KEEP_ALIVE_MASK		GENMASK(7, 0)
> +
> +enum voltage_swing_level {
> +	VOLTAGE_LEVEL_0,
> +	VOLTAGE_LEVEL_1,
> +	VOLTAGE_LEVEL_2,
> +	VOLTAGE_LEVEL_3,
> +};
> +
> +enum pre_emphasis_level {
> +	PRE_EMPHASIS_LEVEL_0,
> +	PRE_EMPHASIS_LEVEL_1,
> +	PRE_EMPHASIS_LEVEL_2,
> +	PRE_EMPHASIS_LEVEL_3,
> +};
> +
> +enum pattern_set {
> +	PTS1 = BIT(0),
> +	PTS2 = BIT(1),
> +	PTS3 = BIT(2),
> +	PTS4 = BIT(3),
> +	DP_NONE	= BIT(4)
> +};
> +
> +enum vic_color_depth {
> +	BCS_6 = 0x1,
> +	BCS_8 = 0x2,
> +	BCS_10 = 0x4,
> +	BCS_12 = 0x8,
> +	BCS_16 = 0x10,
> +};
> +
> +enum vic_bt_type {
> +	BT_601 = 0x0,
> +	BT_709 = 0x1,
> +};
> +
> +enum {
> +	MODE_DVI,
> +	MODE_HDMI_1_4,
> +	MODE_HDMI_2_0,
> +};
> +
> +struct video_info {
> +	int bpc;
> +	int color_fmt;
> +};
> +
> +struct mhdp8501_plat_data {
> +	int hdmi_lane_mapping;
> +	int dp_lane_mapping;
> +};
> +
> +struct cdns_mhdp8501_device {
> +	struct cdns_mhdp_base base;
> +
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct drm_connector *curr_conn;
> +	struct drm_bridge bridge;
> +	struct clk *apb_clk;
> +	struct phy *phy;
> +
> +	struct video_info video_info;
> +	struct drm_display_mode mode;
> +
> +	int irq[IRQ_NUM];
> +	struct delayed_work hotplug_work;
> +	int connector_type;
> +	u32 lane_mapping;
> +
> +	/* protect mailbox communications with the firmware */
> +	struct mutex mbox_mutex;
> +
> +	const struct mhdp8501_plat_data *plat_data;
> +
> +	union {
> +		struct _dp_data {
> +			u32 rate;
> +			u8 num_lanes;
> +			struct drm_dp_aux aux;
> +			u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +		} dp;
> +		struct _hdmi_data {
> +			u32 hdmi_type;
> +			unsigned long long char_rate;
> +		} hdmi;
> +	};
> +};
> +
> +extern const struct drm_bridge_funcs cdns_dp_bridge_funcs;
> +extern const struct drm_bridge_funcs cdns_hdmi_bridge_funcs;
> +
> +ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg);
> +enum drm_connector_status cdns_mhdp8501_detect(struct cdns_mhdp8501_device *mhdp);
> +int cdns_dp_aux_destroy(struct cdns_mhdp8501_device *mhdp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> new file mode 100644
> index 000000000000..d8cc31daf322
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence MHDP8501 DisplayPort(DP) bridge driver
> + *
> + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-dp.h>
> +
> +#include "cdns-mhdp8501-core.h"
> +
> +#define LINK_TRAINING_TIMEOUT_MS	500
> +#define LINK_TRAINING_RETRY_MS		20
> +
> +ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux,
> +			     struct drm_dp_aux_msg *msg)
> +{
> +	struct cdns_mhdp8501_device *mhdp = dev_get_drvdata(aux->dev);
> +	bool native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
> +	int ret;
> +
> +	/* Ignore address only message */
> +	if (!msg->size || !msg->buffer) {
> +		msg->reply = native ?
> +			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
> +		return msg->size;
> +	}
> +
> +	if (!native) {
> +		dev_err(mhdp->dev, "%s: only native messages supported\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/* msg sanity check */
> +	if (msg->size > DP_AUX_MAX_PAYLOAD_BYTES) {
> +		dev_err(mhdp->dev, "%s: invalid msg: size(%zu), request(%x)\n",
> +			__func__, msg->size, (unsigned int)msg->request);
> +		return -EINVAL;
> +	}
> +
> +	if (msg->request == DP_AUX_NATIVE_WRITE) {
> +		const u8 *buf = msg->buffer;
> +		int i;
> +
> +		for (i = 0; i < msg->size; ++i) {
> +			ret = cdns_mhdp_dpcd_write(&mhdp->base,
> +						   msg->address + i, buf[i]);
> +			if (ret < 0) {
> +				dev_err(mhdp->dev, "Failed to write DPCD\n");
> +				return ret;
> +			}
> +		}
> +		msg->reply = DP_AUX_NATIVE_REPLY_ACK;
> +		return msg->size;
> +	}
> +
> +	if (msg->request == DP_AUX_NATIVE_READ) {
> +		ret = cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
> +					  msg->buffer, msg->size);
> +		if (ret < 0)
> +			return ret;
> +		msg->reply = DP_AUX_NATIVE_REPLY_ACK;
> +		return msg->size;
> +	}
> +	return 0;
> +}
> +
> +int cdns_dp_aux_destroy(struct cdns_mhdp8501_device *mhdp)
> +{
> +	drm_dp_aux_unregister(&mhdp->dp.aux);
> +
> +	return 0;
> +}
> +
> +static int cdns_dp_get_msa_misc(struct video_info *video)
> +{
> +	u32 msa_misc;
> +	u8 color_space = 0;
> +	u8 bpc = 0;
> +
> +	switch (video->color_fmt) {
> +	/* set YUV default color space conversion to BT601 */
> +	case DRM_COLOR_FORMAT_YCBCR444:
> +		color_space = 6 + BT_601 * 8;
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR422:
> +		color_space = 5 + BT_601 * 8;
> +		break;
> +	case DRM_COLOR_FORMAT_YCBCR420:
> +		color_space = 5;
> +		break;
> +	case DRM_COLOR_FORMAT_RGB444:
> +	default:
> +		color_space = 0;
> +		break;
> +	};
> +
> +	switch (video->bpc) {
> +	case 6:
> +		bpc = 0;
> +		break;
> +	case 10:
> +		bpc = 2;
> +		break;
> +	case 12:
> +		bpc = 3;
> +		break;
> +	case 16:
> +		bpc = 4;
> +		break;
> +	case 8:
> +	default:
> +		bpc = 1;
> +		break;
> +	};
> +
> +	msa_misc = (bpc << 5) | (color_space << 1);
> +
> +	return msa_misc;
> +}
> +
> +static int cdns_dp_config_video(struct cdns_mhdp8501_device *mhdp)
> +{
> +	struct video_info *video = &mhdp->video_info;
> +	struct drm_display_mode *mode = &mhdp->mode;
> +	bool h_sync_polarity, v_sync_polarity;
> +	u64 symbol;
> +	u32 val, link_rate, rem;
> +	u8 bit_per_pix, tu_size_reg = TU_SIZE;
> +	int ret;
> +
> +	bit_per_pix = (video->color_fmt == DRM_COLOR_FORMAT_YCBCR422) ?
> +		      (video->bpc * 2) : (video->bpc * 3);
> +
> +	link_rate = mhdp->dp.rate / 1000;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, BND_HSYNC2VSYNC, VIF_BYPASS_INTERLACE);
> +	if (ret)
> +		goto err_config_video;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HSYNC2VSYNC_POL_CTRL, 0);
> +	if (ret)
> +		goto err_config_video;
> +
> +	/*
> +	 * get a best tu_size and valid symbol:
> +	 * 1. chose Lclk freq(162Mhz, 270Mhz, 540Mhz), set TU to 32
> +	 * 2. calculate VS(valid symbol) = TU * Pclk * Bpp / (Lclk * Lanes)
> +	 * 3. if VS > *.85 or VS < *.1 or VS < 2 or TU < VS + 4, then set
> +	 *    TU += 2 and repeat 2nd step.
> +	 */
> +	do {
> +		tu_size_reg += 2;
> +		symbol = tu_size_reg * mode->clock * bit_per_pix;
> +		do_div(symbol, mhdp->dp.num_lanes * link_rate * 8);
> +		rem = do_div(symbol, 1000);
> +		if (tu_size_reg > 64) {
> +			ret = -EINVAL;
> +			dev_err(mhdp->dev, "tu error, clk:%d, lanes:%d, rate:%d\n",
> +				mode->clock, mhdp->dp.num_lanes, link_rate);
> +			goto err_config_video;
> +		}
> +	} while ((symbol <= 1) || (tu_size_reg - symbol < 4) ||
> +		 (rem > 850) || (rem < 100));
> +
> +	val = symbol + (tu_size_reg << 8);
> +	val |= TU_CNT_RST_EN;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_TU, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	/* set the FIFO Buffer size */
> +	val = div_u64(mode->clock * (symbol + 1), 1000) + link_rate;
> +	val /= (mhdp->dp.num_lanes * link_rate);
> +	val = div_u64(8 * (symbol + 1), bit_per_pix) - val;
> +	val += 2;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_VC_TABLE(15), val);
> +
> +	switch (video->bpc) {
> +	case 6:
> +		val = BCS_6;
> +		break;
> +	case 10:
> +		val = BCS_10;
> +		break;
> +	case 12:
> +		val = BCS_12;
> +		break;
> +	case 16:
> +		val = BCS_16;
> +		break;
> +	case 8:
> +	default:
> +		val = BCS_8;
> +		break;
> +	};
> +
> +	val += video->color_fmt << 8;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_PXL_REPR, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
> +	h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	val = h_sync_polarity ? DP_FRAMER_SP_HSP : 0;
> +	val |= v_sync_polarity ? DP_FRAMER_SP_VSP : 0;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_SP, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = (mode->hsync_start - mode->hdisplay) << 16;
> +	val |= mode->htotal - mode->hsync_end;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_FRONT_BACK_PORCH, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->hdisplay * bit_per_pix / 8;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_BYTE_COUNT, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->htotal | ((mode->htotal - mode->hsync_start) << 16);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, MSA_HORIZONTAL_0, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->hsync_end - mode->hsync_start;
> +	val |= (mode->hdisplay << 16) | (h_sync_polarity << 15);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, MSA_HORIZONTAL_1, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->vtotal;
> +	val |= (mode->vtotal - mode->vsync_start) << 16;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, MSA_VERTICAL_0, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->vsync_end - mode->vsync_start;
> +	val |= (mode->vdisplay << 16) | (v_sync_polarity << 15);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, MSA_VERTICAL_1, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = cdns_dp_get_msa_misc(video);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, MSA_MISC, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, STREAM_CONFIG, 1);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->hsync_end - mode->hsync_start;
> +	val |= mode->hdisplay << 16;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_HORIZONTAL, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->vdisplay;
> +	val |= (mode->vtotal - mode->vsync_start) << 16;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_VERTICAL_0, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	val = mode->vtotal;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_VERTICAL_1, val);
> +	if (ret)
> +		goto err_config_video;
> +
> +	ret = cdns_mhdp_dp_reg_write_bit(&mhdp->base, DP_VB_ID, 2, 1, 0);
> +
> +err_config_video:
> +	if (ret)
> +		dev_err(mhdp->dev, "config video failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static void cdns_dp_pixel_clk_reset(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u32 val;
> +
> +	/* reset pixel clk */
> +	cdns_mhdp_reg_read(&mhdp->base, SOURCE_HDTX_CAR, &val);
> +	cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR, val & 0xFD);
> +	cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR, val);
> +}
> +
> +static int cdns_dp_set_video_status(struct cdns_mhdp8501_device *mhdp, int active)
> +{
> +	u8 msg;
> +	int ret;
> +
> +	msg = !!active;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX, DPTX_SET_VIDEO,
> +				     sizeof(msg), &msg);
> +	if (ret)
> +		dev_err(mhdp->dev, "set video status failed: %d\n", ret);
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	return ret;
> +}
> +
> +static int cdns_dp_training_start(struct cdns_mhdp8501_device *mhdp)
> +{
> +	unsigned long timeout;
> +	u8 msg, event[2];
> +	int ret;
> +
> +	msg = LINK_TRAINING_RUN;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	/* start training */
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +				     DPTX_TRAINING_CONTROL, sizeof(msg), &msg);
> +	if (ret)
> +		goto err_training_start;
> +
> +	timeout = jiffies + msecs_to_jiffies(LINK_TRAINING_TIMEOUT_MS);
> +	while (time_before(jiffies, timeout)) {
> +		msleep(LINK_TRAINING_RETRY_MS);
> +		ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +					     DPTX_READ_EVENT, 0, NULL);
> +		if (ret)
> +			goto err_training_start;
> +
> +		ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
> +						    DPTX_READ_EVENT, sizeof(event));
> +		if (ret)
> +			goto err_training_start;
> +
> +		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, event, sizeof(event));
> +		if (ret)
> +			goto err_training_start;
> +
> +		if (event[1] & CLK_RECOVERY_FAILED) {
> +			dev_err(mhdp->dev, "clock recovery failed\n");
> +		} else if (event[1] & EQ_PHASE_FINISHED) {
> +			mutex_unlock(&mhdp->mbox_mutex);
> +			return 0;
> +		}
> +	}
> +
> +	ret = -ETIMEDOUT;
> +
> +err_training_start:
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	dev_err(mhdp->dev, "training failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static int cdns_dp_get_training_status(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 status[13];
> +	int ret;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +				     DPTX_READ_LINK_STAT, 0, NULL);
> +	if (ret)
> +		goto err_get_training_status;
> +
> +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
> +					    DPTX_READ_LINK_STAT,
> +					    sizeof(status));
> +	if (ret)
> +		goto err_get_training_status;
> +
> +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, status, sizeof(status));
> +	if (ret)
> +		goto err_get_training_status;
> +
> +	mhdp->dp.rate = drm_dp_bw_code_to_link_rate(status[0]);
> +	mhdp->dp.num_lanes = status[1];
> +
> +err_get_training_status:
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "get training status failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static int cdns_dp_train_link(struct cdns_mhdp8501_device *mhdp)
> +{
> +	int ret;
> +
> +	ret = cdns_dp_training_start(mhdp);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to start training %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = cdns_dp_get_training_status(mhdp);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to get training stat %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(mhdp->dev, "rate:0x%x, lanes:%d\n", mhdp->dp.rate,
> +		mhdp->dp.num_lanes);
> +	return ret;
> +}
> +
> +static int cdns_dp_set_host_cap(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u8 msg[8];
> +	int ret;
> +
> +	msg[0] = drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
> +	msg[1] = mhdp->dp.num_lanes | SCRAMBLER_EN;
> +	msg[2] = VOLTAGE_LEVEL_2;
> +	msg[3] = PRE_EMPHASIS_LEVEL_3;
> +	msg[4] = PTS1 | PTS2 | PTS3 | PTS4;
> +	msg[5] = FAST_LT_NOT_SUPPORT;
> +	msg[6] = mhdp->lane_mapping;
> +	msg[7] = ENHANCED;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +				     DPTX_SET_HOST_CAPABILITIES,
> +				     sizeof(msg), msg);
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "set host cap failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int cdns_dp_get_edid_block(void *data, u8 *edid,
> +				  unsigned int block, size_t length)
> +{
> +	struct cdns_mhdp8501_device *mhdp = data;
> +	u8 msg[2], reg[2], i;
> +	int ret;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	for (i = 0; i < 4; i++) {
> +		msg[0] = block / 2;
> +		msg[1] = block % 2;
> +
> +		ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
> +					     DPTX_GET_EDID, sizeof(msg), msg);
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
> +						    DPTX_GET_EDID,
> +						    sizeof(reg) + length);
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, edid, length);
> +		if (ret)
> +			continue;
> +
> +		if (reg[0] == length && reg[1] == block / 2)
> +			break;
> +	}
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n", block, ret);
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	return ret;
> +}
> +
> +static void cdns_dp_mode_set(struct cdns_mhdp8501_device *mhdp)
> +{
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	cdns_dp_pixel_clk_reset(mhdp);
> +
> +	/* Get DP Caps  */
> +	ret = drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV, mhdp->dp.dpcd,
> +			       DP_RECEIVER_CAP_SIZE);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "Failed to get caps %d\n", ret);
> +		return;
> +	}
> +
> +	mhdp->dp.rate = drm_dp_max_link_rate(mhdp->dp.dpcd);
> +	mhdp->dp.num_lanes = drm_dp_max_lane_count(mhdp->dp.dpcd);
> +
> +	/* check the max link rate */
> +	if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> +		mhdp->dp.rate = CDNS_DP_MAX_LINK_RATE;
> +
> +	phy_cfg.dp.lanes = mhdp->dp.num_lanes;
> +	phy_cfg.dp.link_rate = mhdp->dp.rate;
> +	phy_cfg.dp.set_lanes = false;
> +	phy_cfg.dp.set_rate = false;
> +	phy_cfg.dp.set_voltages = true;
> +
> +	/* Mailbox protect for DP PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_configure(mhdp->phy, &phy_cfg);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret) {
> +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	/* Video off */
> +	ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> +		return;
> +	}
> +
> +	/* Line swapping */
> +	cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000 | mhdp->lane_mapping);
> +
> +	/* Set DP host capability */
> +	ret = cdns_dp_set_host_cap(mhdp);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to set host cap %d\n", ret);
> +		return;
> +	}
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, DP_AUX_SWAP_INVERSION_CONTROL,
> +				  AUX_HOST_INVERT);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to set host invert %d\n", ret);
> +		return;
> +	}
> +
> +	ret = cdns_dp_config_video(mhdp);
> +	if (ret)
> +		dev_err(mhdp->dev, "Failed to config video %d\n", ret);
> +}
> +
> +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(mhdp->dev, "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	mhdp->dp.aux.drm_dev = bridge->dev;
> +
> +	return drm_dp_aux_register(&mhdp->dp.aux);
> +}
> +
> +static enum drm_mode_status
> +cdns_dp_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{
> +	enum drm_mode_status mode_status = MODE_OK;
> +
> +	/* We don't support double-clocked modes */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return MODE_BAD;
> +
> +	/* MAX support pixel clock rate 594MHz */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->hdisplay > 3840)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay > 2160)
> +		return MODE_BAD_VVALUE;
> +
> +	return mode_status;
> +}
> +
> +static enum drm_connector_status
> +cdns_dp_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	return cdns_mhdp8501_detect(mhdp);
> +}
> +
> +static const struct drm_edid
> +*cdns_dp_bridge_edid_read(struct drm_bridge *bridge,
> +			  struct drm_connector *connector)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	return drm_edid_read_custom(connector, cdns_dp_get_edid_block, mhdp);
> +}
> +
> +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> +	mhdp->curr_conn = NULL;
> +
> +	/* Mailbox protect for DP PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	phy_power_off(mhdp->phy);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +}
> +
> +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	struct drm_atomic_state *state = old_state->base.state;
> +	struct drm_connector *connector;
> +	struct video_info *video = &mhdp->video_info;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	const struct drm_display_mode *mode;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	mhdp->curr_conn = connector;
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
> +	switch (connector->display_info.bpc) {
> +	case 10:
> +		video->bpc = 10;
> +		break;
> +	case 6:
> +		video->bpc = 6;
> +		break;
> +	default:
> +		video->bpc = 8;
> +		break;
> +	}
> +
> +	/* The only currently supported format */
> +	video->color_fmt = DRM_COLOR_FORMAT_RGB444;
> +
> +	dev_dbg(mhdp->dev, "Mode: %dx%dp%d\n",
> +		mode->hdisplay, mode->vdisplay, mode->clock);
> +	memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
> +
> +	cdns_dp_mode_set(mhdp);
> +
> +	/* Link trainning */
> +	ret = cdns_dp_train_link(mhdp);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed link train %d\n", ret);
> +		return;
> +	}
> +
> +	ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
> +	if (ret) {
> +		dev_err(mhdp->dev, "Failed to valid video %d\n", ret);
> +		return;
> +	}
> +}
> +
> +const struct drm_bridge_funcs cdns_dp_bridge_funcs = {
> +	.attach = cdns_dp_bridge_attach,
> +	.detect = cdns_dp_bridge_detect,
> +	.edid_read = cdns_dp_bridge_edid_read,
> +	.mode_valid = cdns_dp_bridge_mode_valid,
> +	.atomic_enable = cdns_dp_bridge_atomic_enable,
> +	.atomic_disable = cdns_dp_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> new file mode 100644
> index 000000000000..834ca9788a5f
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> @@ -0,0 +1,595 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence MHDP8501 HDMI bridge driver
> + *
> + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> + *
> + */
> +#include <drm/display/drm_hdmi_helper.h>
> +#include <drm/display/drm_hdmi_state_helper.h>
> +#include <drm/display/drm_scdc_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_print.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-hdmi.h>
> +
> +#include "cdns-mhdp8501-core.h"
> +
> +/**
> + * cdns_hdmi_config_infoframe() - fill the HDMI infoframe
> + * @mhdp: phandle to mhdp device.
> + * @entry_id: The packet memory address in which the data is written.
> + * @len: length of infoframe.
> + * @buf: point to InfoFrame Packet.
> + * @type: Packet Type of InfoFrame in HDMI Specification.
> + *
> + */
> +static void cdns_hdmi_config_infoframe(struct cdns_mhdp8501_device *mhdp,
> +				       u8 entry_id, u8 len,
> +				       const u8 *buf, u8 type)
> +{
> +	u8 packet[32], packet_len = 32;
> +	u32 packet32, len32;
> +	u32 val, i;
> +
> +	/*
> +	 * only support 32 bytes now
> +	 * packet[0] = 0
> +	 * packet[1-3] = HB[0-2]  InfoFrame Packet Header
> +	 * packet[4-31 = PB[0-27] InfoFrame Packet Contents
> +	 */
> +	if (len >= (packet_len - 1))
> +		return;
> +	packet[0] = 0;
> +	memcpy(packet + 1, buf, len);
> +
> +	/* invalidate entry */
> +	val = F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id);
> +	writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> +	writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs + SOURCE_PIF_PKT_ALLOC_WR_EN);
> +
> +	/* flush fifo 1 */
> +	writel(F_FIFO1_FLUSH(1), mhdp->regs + SOURCE_PIF_FIFO1_FLUSH);
> +
> +	/* write packet into memory */
> +	len32 = packet_len / 4;
> +	for (i = 0; i < len32; i++) {
> +		packet32 = get_unaligned_le32(packet + 4 * i);
> +		writel(F_DATA_WR(packet32), mhdp->regs + SOURCE_PIF_DATA_WR);
> +	}
> +
> +	/* write entry id */
> +	writel(F_WR_ADDR(entry_id), mhdp->regs + SOURCE_PIF_WR_ADDR);
> +
> +	/* write request */
> +	writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
> +
> +	/* update entry */
> +	val = F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
> +		F_PACKET_TYPE(type) | F_PKT_ALLOC_ADDRESS(entry_id);
> +	writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> +
> +	writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs + SOURCE_PIF_PKT_ALLOC_WR_EN);
> +}
> +
> +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> +				    u32 block, size_t length)
> +{
> +	struct cdns_mhdp8501_device *mhdp = data;
> +	u8 msg[2], reg[5], i;
> +	int ret;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	for (i = 0; i < 4; i++) {
> +		msg[0] = block / 2;
> +		msg[1] = block % 2;
> +
> +		ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_HDMI_TX, HDMI_TX_EDID,
> +					     sizeof(msg), msg);
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_HDMI_TX,
> +						    HDMI_TX_EDID, sizeof(reg) + length);
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
> +		if (ret)
> +			continue;
> +
> +		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, edid, length);
> +		if (ret)
> +			continue;
> +
> +		if ((reg[3] << 8 | reg[4]) == length)
> +			break;
> +	}
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n", block, ret);
> +	return ret;
> +}
> +
> +static int cdns_hdmi_scdc_write(struct cdns_mhdp8501_device *mhdp, u8 addr, u8 value)
> +{
> +	u8 msg[5], reg[5];
> +	int ret;
> +
> +	msg[0] = 0x54;
> +	msg[1] = addr;
> +	msg[2] = 0;
> +	msg[3] = 1;
> +	msg[4] = value;
> +
> +	mutex_lock(&mhdp->mbox_mutex);
> +
> +	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
> +				     sizeof(msg), msg);
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_HDMI_TX,
> +					    HDMI_TX_WRITE, sizeof(reg));
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
> +	if (ret)
> +		goto err_scdc_write;
> +
> +	if (reg[0] != 0)
> +		ret = -EINVAL;
> +
> +err_scdc_write:
> +
> +	mutex_unlock(&mhdp->mbox_mutex);
> +
> +	if (ret)
> +		dev_err(mhdp->dev, "scdc write failed: %d\n", ret);
> +	return ret;
> +}
> +
> +static int cdns_hdmi_ctrl_init(struct cdns_mhdp8501_device *mhdp)
> +{
> +	unsigned long long char_rate = mhdp->hdmi.char_rate;
> +	u32 protocol = mhdp->hdmi.hdmi_type;
> +	u32 reg0, reg1, val;
> +	int ret;
> +
> +	/* Set PHY to HDMI data */
> +	ret = cdns_mhdp_reg_write(&mhdp->base, PHY_DATA_SEL, F_SOURCE_PHY_MHDP_SEL(1));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_HPD,
> +				  F_HPD_VALID_WIDTH(4) | F_HPD_GLITCH_WIDTH(0));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* open CARS */
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_PHY_CAR, 0xF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR, 0xFF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_PKT_CAR, 0xF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_AIF_CAR, 0xF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_CIPHER_CAR, 0xF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_CRYPTO_CAR, 0xF);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SOURCE_CEC_CAR, 3);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg0 = 0x7c1f;
> +	reg1 = 0x7c1f;
> +	if (protocol == MODE_HDMI_2_0 && char_rate >= 340000000) {
> +		reg0 = 0;
> +		reg1 = 0xFFFFF;
> +	}
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_0, reg0);
> +	if (ret < 0)
> +		return ret;
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_1, reg1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set HDMI mode and preemble mode data enable */
> +	val = F_HDMI_MODE(protocol) | F_HDMI2_PREAMBLE_EN(1) |
> +	      F_DATA_EN(1) | F_HDMI2_CTRL_IL_MODE(1) | F_BCH_EN(1) |
> +	      F_PIC_3D(0XF) | F_CLEAR_AVMUTE(1);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +
> +	return ret;
> +}
> +
> +static int cdns_hdmi_mode_config(struct cdns_mhdp8501_device *mhdp,
> +				 struct drm_display_mode *mode,
> +				 struct video_info *video_info)
> +{
> +	u32 vsync_lines = mode->vsync_end - mode->vsync_start;
> +	u32 eof_lines = mode->vsync_start - mode->vdisplay;
> +	u32 sof_lines = mode->vtotal - mode->vsync_end;
> +	u32 hblank = mode->htotal - mode->hdisplay;
> +	u32 hactive = mode->hdisplay;
> +	u32 vblank = mode->vtotal - mode->vdisplay;
> +	u32 vactive = mode->vdisplay;
> +	u32 hfront = mode->hsync_start - mode->hdisplay;
> +	u32 hback = mode->htotal - mode->hsync_end;
> +	u32 vfront = eof_lines;
> +	u32 hsync = hblank - hfront - hback;
> +	u32 vsync = vsync_lines;
> +	u32 vback = sof_lines;
> +	u32 v_h_polarity = ((mode->flags & DRM_MODE_FLAG_NHSYNC) ? 0 : 1) +
> +			   ((mode->flags & DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
> +	int ret;
> +	u32 val;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_H_SIZE, (hactive << 16) + hblank);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_V_SIZE, (vactive << 16) + vblank);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_SYNC_WIDTH, (vsync << 16) + hsync);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_BACK_WIDTH, (vback << 16) + hback);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HSYNC2VSYNC_POL_CTRL, v_h_polarity);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Reset Data Enable */
> +	cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> +	val &= ~F_DATA_EN(1);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set bpc */
> +	val &= ~F_VIF_DATA_WIDTH(3);
> +	switch (video_info->bpc) {
> +	case 10:
> +		val |= F_VIF_DATA_WIDTH(1);
> +		break;
> +	case 12:
> +		val |= F_VIF_DATA_WIDTH(2);
> +		break;
> +	case 16:
> +		val |= F_VIF_DATA_WIDTH(3);
> +		break;
> +	case 8:
> +	default:
> +		val |= F_VIF_DATA_WIDTH(0);
> +		break;
> +	}
> +
> +	/* select color encoding */
> +	val &= ~F_HDMI_ENCODING(3);
> +	switch (video_info->color_fmt) {
> +	case HDMI_COLORSPACE_YUV444:
> +		val |= F_HDMI_ENCODING(2);
> +		break;
> +	case HDMI_COLORSPACE_YUV422:
> +		val |= F_HDMI_ENCODING(1);
> +		break;
> +	case HDMI_COLORSPACE_YUV420:
> +		val |= F_HDMI_ENCODING(3);
> +		break;
> +	case HDMI_COLORSPACE_RGB:
> +	default:
> +		val |= F_HDMI_ENCODING(0);
> +		break;
> +	}
> +
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set data enable */
> +	val |= F_DATA_EN(1);
> +	ret = cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +
> +	return ret;
> +}
> +
> +static int cdns_hdmi_disable_gcp(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u32 val;
> +
> +	cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> +	val &= ~F_GCP_EN(1);
> +
> +	return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +}
> +
> +static int cdns_hdmi_enable_gcp(struct cdns_mhdp8501_device *mhdp)
> +{
> +	u32 val;
> +
> +	cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> +	val |= F_GCP_EN(1);
> +
> +	return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> +}
> +
> +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device *mhdp)
> +{
> +	struct drm_scdc *scdc = &mhdp->curr_conn->display_info.hdmi.scdc;
> +	u8 buff = 0;
> +
> +	/* Default work in HDMI1.4 */
> +	mhdp->hdmi.hdmi_type = MODE_HDMI_1_4;
> +
> +	/* check sink support SCDC or not */
> +	if (!scdc->supported) {
> +		dev_info(mhdp->dev, "Sink Not Support SCDC\n");
> +		return;
> +	}
> +
> +	if (mhdp->hdmi.char_rate > 340000000) {
> +		/*
> +		 * TMDS Character Rate above 340MHz should working in HDMI2.0
> +		 * Enable scrambling and TMDS_Bit_Clock_Ratio
> +		 */
> +		buff = SCDC_TMDS_BIT_CLOCK_RATIO_BY_40 | SCDC_SCRAMBLING_ENABLE;
> +		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
> +	} else if (scdc->scrambling.low_rates) {
> +		/*
> +		 * Enable scrambling and HDMI2.0 when scrambling capability of sink
> +		 * be indicated in the HF-VSDB LTE_340Mcsc_scramble bit
> +		 */
> +		buff = SCDC_SCRAMBLING_ENABLE;
> +		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
> +	}
> +
> +	/* TMDS config */
> +	cdns_hdmi_scdc_write(mhdp, SCDC_TMDS_CONFIG, buff);
> +}
> +
> +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(mhdp->dev, "do not support creating a drm_connector\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum drm_mode_status
> +cdns_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
> +			       const struct drm_display_mode *mode,
> +			       unsigned long long tmds_rate)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	phy_cfg.hdmi.tmds_char_rate = tmds_rate;
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret < 0)
> +		return MODE_CLOCK_RANGE;
> +
> +	return MODE_OK;
> +}
> +
> +static enum drm_mode_status
> +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
> +			    const struct drm_display_mode *mode)
> +{
> +	unsigned long long tmds_rate;
> +
> +	/* We don't support double-clocked and Interlaced modes */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> +		return MODE_BAD;
> +
> +	/* MAX support pixel clock rate 594MHz */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->hdisplay > 3840)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay > 2160)
> +		return MODE_BAD_VVALUE;
> +
> +	tmds_rate = mode->clock * 1000ULL;
> +	return cdns_hdmi_tmds_char_rate_valid(bridge, mode, tmds_rate);
> +}
> +
> +static enum drm_connector_status
> +cdns_hdmi_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	return cdns_mhdp8501_detect(mhdp);
> +}
> +
> +static const struct drm_edid
> +*cdns_hdmi_bridge_edid_read(struct drm_bridge *bridge,
> +			    struct drm_connector *connector)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	return drm_edid_read_custom(connector, cdns_hdmi_get_edid_block, mhdp);
> +}
> +
> +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	mhdp->curr_conn = NULL;
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	phy_power_off(mhdp->phy);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +}
> +
> +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_state)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +	struct drm_atomic_state *state = old_state->base.state;
> +	struct drm_connector *connector;
> +	struct video_info *video = &mhdp->video_info;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector_state *conn_state;
> +	struct drm_display_mode *mode = &mhdp->mode;
> +	union phy_configure_opts phy_cfg;
> +	int ret;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	if (WARN_ON(!connector))
> +		return;
> +
> +	mhdp->curr_conn = connector;
> +
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (WARN_ON(!conn_state))
> +		return;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	if (WARN_ON(!crtc_state))
> +		return;
> +
> +	video->color_fmt = conn_state->hdmi.output_format;
> +	video->bpc = conn_state->hdmi.output_bpc;
> +
> +	drm_mode_copy(&mhdp->mode, &crtc_state->adjusted_mode);
> +
> +	/* video mode check */
> +	if (mode->clock == 0 || mode->hdisplay == 0 || mode->vdisplay == 0)
> +		return;
> +
> +	dev_dbg(mhdp->dev, "Mode: %dx%dp%d\n",
> +		mode->hdisplay, mode->vdisplay, mode->clock);
> +
> +	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
> +
> +	/* Line swapping */
> +	cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000 | mhdp->lane_mapping);
> +
> +	mhdp->hdmi.char_rate = drm_hdmi_compute_mode_clock(mode,
> +							   mhdp->video_info.bpc,
> +							   mhdp->video_info.color_fmt);
> +	phy_cfg.hdmi.tmds_char_rate = mhdp->hdmi.char_rate;
> +
> +	/* Mailbox protect for HDMI PHY access */
> +	mutex_lock(&mhdp->mbox_mutex);
> +	ret = phy_configure(mhdp->phy, &phy_cfg);
> +	mutex_unlock(&mhdp->mbox_mutex);
> +	if (ret) {
> +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> +			__func__, ret);
> +		return;
> +	}
> +
> +	cdns_hdmi_sink_config(mhdp);
> +
> +	ret = cdns_hdmi_ctrl_init(mhdp);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "%s, ret = %d\n", __func__, ret);
> +		return;
> +	}
> +
> +	/* Config GCP */
> +	if (mhdp->video_info.bpc == 8)
> +		cdns_hdmi_disable_gcp(mhdp);
> +	else
> +		cdns_hdmi_enable_gcp(mhdp);
> +
> +	ret = cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
> +	if (ret < 0) {
> +		dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking ret = %d\n", ret);
> +		return;
> +	}
> +}
> +
> +static int cdns_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type)
> +{
> +	return 0;
> +}
> +
> +static int cdns_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
> +					    enum hdmi_infoframe_type type,
> +					    const u8 *buffer, size_t len)
> +{
> +	struct cdns_mhdp8501_device *mhdp = bridge->driver_private;
> +
> +	switch (type) {
> +	case HDMI_INFOFRAME_TYPE_AVI:
> +		cdns_hdmi_config_infoframe(mhdp, 0, len, buffer, HDMI_INFOFRAME_TYPE_AVI);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_SPD:
> +		cdns_hdmi_config_infoframe(mhdp, 1, len, buffer, HDMI_INFOFRAME_TYPE_SPD);
> +		break;
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		cdns_hdmi_config_infoframe(mhdp, 2, len, buffer, HDMI_INFOFRAME_TYPE_VENDOR);
> +		break;
> +	default:
> +		dev_dbg(mhdp->dev, "Unsupported infoframe type %x\n", type);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cdns_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *bridge_state,
> +					 struct drm_crtc_state *crtc_state,
> +					 struct drm_connector_state *conn_state)
> +{
> +	return drm_atomic_helper_connector_hdmi_check(conn_state->connector, conn_state->state);
> +}
> +
> +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs = {
> +	.attach = cdns_hdmi_bridge_attach,
> +	.detect = cdns_hdmi_bridge_detect,
> +	.edid_read = cdns_hdmi_bridge_edid_read,
> +	.mode_valid = cdns_hdmi_bridge_mode_valid,
> +	.atomic_enable = cdns_hdmi_bridge_atomic_enable,
> +	.atomic_disable = cdns_hdmi_bridge_atomic_disable,
> +	.atomic_check = cdns_hdmi_bridge_atomic_check,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.hdmi_clear_infoframe = cdns_hdmi_bridge_clear_infoframe,
> +	.hdmi_write_infoframe = cdns_hdmi_bridge_write_infoframe,
> +	.hdmi_tmds_char_rate_valid = cdns_hdmi_tmds_char_rate_valid,
> +};
