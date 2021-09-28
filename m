Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242041AF99
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 15:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37BE89C54;
	Tue, 28 Sep 2021 13:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F76F89C54
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 13:02:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id z2so3434890wmc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tR2TQX+kVW0rYrRfEEQg7WRnq2clbEFfqF4BNcuxvaQ=;
 b=xwh+oTfqAoZAVf+C975YtjHcHNtJ9zw8T+99kEppazEhQ9Vl5ssftS152FY6vNegm3
 k+OsjszbH8DC4d1hsrvAoKjYC36oFCuQp+C+wkbUqFLSfXiDXuZBfNIJWzEOHW/gXMpg
 ChxjbhiD2REH5LsuC4feYLP3d4Ud4fLZpSw+BfJ9A+tkuKExrb68TE/4z3LD+boJudXb
 gtsjM0oG6dF3opnyolwkIayRbV9ziEAukPrsKo96OguWWzMnBZWzMfJBbDlgxwIvYh1c
 I6gsf04tAnIIjJngzcxGbkmongAtMTuAgVeXyWdaSmdAcQ/TzA65csd+Z/Rj59DwQylO
 lJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tR2TQX+kVW0rYrRfEEQg7WRnq2clbEFfqF4BNcuxvaQ=;
 b=pNNK8tmLmzKdJWfBbk5PZDa4bbFi4Cq39zc7lqLqNYwfsISZ8OMr63JTi3ywcWneEs
 u5x7WZrGykBS585rYoU41KQP/PmKvTWe7xQW37mrH3nXQnaAQeOOIkBAmoJ7lagXLz4r
 JGBqg+ahLC3JS0gm4NGjz8pRbT31+I+0CYd7lHqpFOHxARPNIa1Bvp/Y5t1uIzaOPVYx
 3XfS0MQtYiPg6FOtmmHtPvMprP9Nfvib1NCAZW5bMeGV1zGVgqW0waSz2GY2EqkZ6nKW
 Z9RLybRMelG9MHc91CFBjqwPuba1zUKQdla00TuQHxcrea4EQ/19iNkNYPWOfFDw3f5F
 x/kQ==
X-Gm-Message-State: AOAM533+Ol/XT05uanJp7I3nUcu9XnJzdUa1Axo/jYW//40Q+U0XBu5x
 rHfadgZFJJho3P2wX+dPad/0s9SPQ6azgnWZ
X-Google-Smtp-Source: ABdhPJxEbicmcy5wEkUCRews8l61o9FWFWXKUSbuqqlQ6A3D1PbsMXtnxpHP0J+Grnc6jP0i9g5enQ==
X-Received: by 2002:a05:600c:40c4:: with SMTP id
 m4mr4619005wmh.64.1632834152799; 
 Tue, 28 Sep 2021 06:02:32 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:af32:f180:8ede:d9da?
 ([2001:861:44c0:66c0:af32:f180:8ede:d9da])
 by smtp.gmail.com with ESMTPSA id o7sm24611367wro.45.2021.09.28.06.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 06:02:32 -0700 (PDT)
Subject: Re: [PATCH v4 06/10] drm/ingenic: Add dw-hdmi driver for jz4780
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>, "Eric W. Biederman"
 <ebiederm@xmission.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
References: <cover.1632761067.git.hns@goldelico.com>
 <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <86c61519-697f-9ca8-4257-074173656c38@baylibre.com>
Date: Tue, 28 Sep 2021 15:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cecd7ae2e21f6547f23c125b2f7767b0090277bc.1632761068.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 27/09/2021 18:44, H. Nikolaus Schaller wrote:
> From: Paul Boddie <paul@boddie.org.uk>
> 
> A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
> HDMI support. This requires a new driver, plus device tree and configuration
> modifications.
> 
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/Kconfig           |   9 ++
>  drivers/gpu/drm/ingenic/Makefile          |   1 +
>  drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c | 142 ++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> 
> diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
> index 3b57f8be007c..4c7d311fbeff 100644
> --- a/drivers/gpu/drm/ingenic/Kconfig
> +++ b/drivers/gpu/drm/ingenic/Kconfig
> @@ -25,4 +25,13 @@ config DRM_INGENIC_IPU
>  
>  	  The Image Processing Unit (IPU) will appear as a second primary plane.
>  
> +config DRM_INGENIC_DW_HDMI
> +	bool "Ingenic specific support for Synopsys DW HDMI"
> +	depends on MACH_JZ4780
> +	select DRM_DW_HDMI
> +	help
> +	  Choose this option to enable Synopsys DesignWare HDMI based driver.
> +	  If you want to enable HDMI on Ingenic JZ4780 based SoC, you should
> +	  select this option..
> +
>  endif
> diff --git a/drivers/gpu/drm/ingenic/Makefile b/drivers/gpu/drm/ingenic/Makefile
> index d313326bdddb..3db9888a6c04 100644
> --- a/drivers/gpu/drm/ingenic/Makefile
> +++ b/drivers/gpu/drm/ingenic/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_DRM_INGENIC) += ingenic-drm.o
>  ingenic-drm-y = ingenic-drm-drv.o
>  ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) += ingenic-ipu.o
> +ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) += ingenic-dw-hdmi.o
> diff --git a/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> new file mode 100644
> index 000000000000..dd9c94ae842e
> --- /dev/null
> +++ b/drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2011-2013 Freescale Semiconductor, Inc.
> + * Copyright (C) 2019, 2020 Paul Boddie <paul@boddie.org.uk>
> + *
> + * Derived from dw_hdmi-imx.c with i.MX portions removed.
> + * Probe and remove operations derived from rcar_dw_hdmi.c.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +static const struct dw_hdmi_mpll_config ingenic_mpll_cfg[] = {
> +	{ 45250000,  { { 0x01e0, 0x0000 }, { 0x21e1, 0x0000 }, { 0x41e2, 0x0000 } } },
> +	{ 92500000,  { { 0x0140, 0x0005 }, { 0x2141, 0x0005 }, { 0x4142, 0x0005 } } },
> +	{ 148500000, { { 0x00a0, 0x000a }, { 0x20a1, 0x000a }, { 0x40a2, 0x000a } } },
> +	{ 216000000, { { 0x00a0, 0x000a }, { 0x2001, 0x000f }, { 0x4002, 0x000f } } },
> +	{ ~0UL,      { { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 } } }
> +};
> +
> +static const struct dw_hdmi_curr_ctrl ingenic_cur_ctr[] = {
> +	/*pixelclk     bpp8    bpp10   bpp12 */
> +	{ 54000000,  { 0x091c, 0x091c, 0x06dc } },
> +	{ 58400000,  { 0x091c, 0x06dc, 0x06dc } },
> +	{ 72000000,  { 0x06dc, 0x06dc, 0x091c } },
> +	{ 74250000,  { 0x06dc, 0x0b5c, 0x091c } },
> +	{ 118800000, { 0x091c, 0x091c, 0x06dc } },
> +	{ 216000000, { 0x06dc, 0x0b5c, 0x091c } },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 } },
> +};
> +
> +/*
> + * Resistance term 133Ohm Cfg
> + * PREEMP config 0.00
> + * TX/CK level 10
> + */
> +static const struct dw_hdmi_phy_config ingenic_phy_config[] = {
> +	/*pixelclk   symbol   term   vlev */
> +	{ 216000000, 0x800d, 0x0005, 0x01ad},
> +	{ ~0UL,      0x0000, 0x0000, 0x0000}
> +};
> +
> +static enum drm_mode_status
> +ingenic_dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +	/* FIXME: Hardware is capable of 270MHz, but setup data is missing. */
> +	if (mode->clock > 216000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static bool
> +ingenic_dw_hdmi_mode_fixup(struct drm_bridge *bridge,
> +			   const struct drm_display_mode *mode,
> +			   struct drm_display_mode *adjusted_mode)
> +{
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +
> +	return true;
> +}
> +
> +static const struct drm_bridge_timings ingenic_dw_hdmi_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +};

These should go in the intermediate encoder bridge callbacks Paul introduces in his patch at [1].

With that patch 4 can be dropped.

[1] https://lore.kernel.org/r/20210922205555.496871-7-paul@crapouillou.net

Neil

> +
> +static struct dw_hdmi_plat_data ingenic_dw_hdmi_plat_data = {
> +	.mpll_cfg   = ingenic_mpll_cfg,
> +	.cur_ctr    = ingenic_cur_ctr,
> +	.phy_config = ingenic_phy_config,
> +	.mode_valid = ingenic_dw_hdmi_mode_valid,
> +	.mode_fixup = ingenic_dw_hdmi_mode_fixup,
> +	.timings    = &ingenic_dw_hdmi_timings,
> +	.output_port	= 1,
> +};
> +
> +static const struct of_device_id ingenic_dw_hdmi_dt_ids[] = {
> +	{ .compatible = "ingenic,jz4780-dw-hdmi" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ingenic_dw_hdmi_dt_ids);
> +
> +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi;
> +	struct regulator *regulator;
> +	int ret;
> +
> +	hdmi = dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	regulator = devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
> +
> +	if (IS_ERR(regulator)) {
> +		ret = PTR_ERR(regulator);
> +
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get hpd regulator: %s (%d)\n",
> +			      "hdmi-5v", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(regulator);
> +	if (ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Failed to enable hpd regulator: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ingenic_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver ingenic_dw_hdmi_driver = {
> +	.probe  = ingenic_dw_hdmi_probe,
> +	.remove = ingenic_dw_hdmi_remove,
> +	.driver = {
> +		.name = "dw-hdmi-ingenic",
> +		.of_match_table = ingenic_dw_hdmi_dt_ids,
> +	},
> +};
> +
> +struct platform_driver *ingenic_dw_hdmi_driver_ptr = &ingenic_dw_hdmi_driver;
> 

