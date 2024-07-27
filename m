Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176F93E013
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F02710E01F;
	Sat, 27 Jul 2024 16:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KHOgsKMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB310E01F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 16:11:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52fc4388a64so3489995e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722096694; x=1722701494; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UBusllycXeOxRmMQscoyIs5AgPJe93SHCpBqt0L+kPU=;
 b=KHOgsKMTB1vyYF40GY5NAaTpDfFkIPDedy8pI+9a9t/+fLhJ45U192M7J+0SIR0sP7
 SGpk2pgBBFb6Nvj9ejReoAa7GdANSV5vAx8z/7PBq49IWawtuVYWzkucaGqHikc8OIll
 50RiGEWdBSfEHhvZfqNHvP6Rj9nYt9dltUL1CnePlpKBXwselWa24uamSr+J073n59k6
 i/sz3V1WQc4zf3dlDgAdTq8rxwR4L6QYYMN9ICZCpRgS2WN0FqvMLyEdqFX3gFyBUfdS
 ujXMP5k8j2EMe2o4LW+3oWLWMCOUUjvjYJN0WPAqRiQ5cWNQE8yszZaaMvI4iEVfwB7P
 vVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722096694; x=1722701494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBusllycXeOxRmMQscoyIs5AgPJe93SHCpBqt0L+kPU=;
 b=G7ZurP8wm0gRtR5sUyqTJqsEz3J88bTPdvRYt/5rIjP2HysJkhERvDaQKjfwvYvXvR
 pIqX7SPmrQKF+osq9oxfDVtc/zAHMmhY9lkuAqBerQYEEuX1NCF7zgOJg6pbMEpTv8di
 lTHTrd2N6pxX+eE0pp7XBPFe2Nqn6MFmRlrHqTJ6z6YKfBKE4kxU10ChPCY0/km/E2sA
 i8vhvOAkAqKsteAC0ZWt5mFAkZ5JkJ5ilTbPzVPpztRKRoaImwUaCwvbf8sKJbVAP46U
 OmzljLBqT3d9MXpCPeRzRli5jhEzrUTfRbo/UDXJ0z1IT9DmW1PFoNisAE4rzSHWCe2z
 T+nA==
X-Gm-Message-State: AOJu0YyFoSRXtj+pVZxfQ9odFKvlSGoKbQzQQTYqiXGuLjsF4HJjmC4x
 pNFTOwvaT4RpwvgLRz3/byUc69e0aQdc96i/+r9XdCf490FqTB47HdvzH//SP5o=
X-Google-Smtp-Source: AGHT+IGE/jZAAc2Nvw2MwerHR0yM2Y7j8htLQh1i+XFzPdpbP2zrSjL7bEwU58lE0zhsp1lfp1yK8Q==
X-Received: by 2002:a2e:b710:0:b0:2ef:2c86:4d43 with SMTP id
 38308e7fff4ca-2f12edf9e66mr19092791fa.3.1722096694188; 
 Sat, 27 Jul 2024 09:11:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d074b19sm7153491fa.110.2024.07.27.09.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jul 2024 09:11:33 -0700 (PDT)
Date: Sat, 27 Jul 2024 19:11:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com
Subject: Re: [PATCH v2 06/16] drm/imx: Add i.MX8qxp Display Controller
 display engine
Message-ID: <ib6brwxeai3wkgzglihfbqx7jakjslnftydbzo32xthijkd4u6@y4ebhgk5o3ec>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712093243.2108456-7-victor.liu@nxp.com>
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

On Fri, Jul 12, 2024 at 05:32:33PM GMT, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The display engine driver as a master binds FrameGen and
> TCon drivers as components.  While at it, the display engine driver
> is a component to be bound with the upcoming DRM driver.

Generic question: why do you need so many small subdrivers? Are they
used to represent the flexibility of the pipeline? Can you instantiate
these units directly from the de(?) driver and reference created
structures without the need to create subdevices?

> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Use OF alias id to get instance id.
> * Add dev member to struct dc_tc.
> 
>  drivers/gpu/drm/imx/Kconfig     |   1 +
>  drivers/gpu/drm/imx/Makefile    |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig  |   5 +
>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>  drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>  drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
>  drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
>  10 files changed, 784 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 03535a15dd8f..3e8c6edbc17c 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +source "drivers/gpu/drm/imx/dc/Kconfig"
>  source "drivers/gpu/drm/imx/dcss/Kconfig"
>  source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>  source "drivers/gpu/drm/imx/lcdc/Kconfig"
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index 86f38e7c7422..c7b317640d71 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +obj-$(CONFIG_DRM_IMX8_DC) += dc/
>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>  obj-$(CONFIG_DRM_IMX) += ipuv3/
>  obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
> new file mode 100644
> index 000000000000..32d7471c49d0
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/Kconfig
> @@ -0,0 +1,5 @@
> +config DRM_IMX8_DC
> +	tristate "Freescale i.MX8 Display Controller Graphics"
> +	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
> +	help
> +	  enable Freescale i.MX8 Display Controller(DC) graphics support
> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
> new file mode 100644
> index 000000000000..56de82d53d4d
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
> +
> +obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
> new file mode 100644
> index 000000000000..2c8268b76b08
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/component.h>
> +#include <linux/container_of.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "dc-de.h"
> +#include "dc-drv.h"
> +
> +#define POLARITYCTRL		0xc
> +#define  POLEN_HIGH		BIT(2)
> +
> +struct dc_de_priv {
> +	struct dc_de engine;
> +	void __iomem *reg_top;
> +};
> +
> +static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
> +{
> +	return container_of(de, struct dc_de_priv, engine);
> +}
> +
> +static inline void
> +dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
> +{
> +	struct dc_de_priv *priv = to_de_priv(de);
> +
> +	writel(value, priv->reg_top + offset);

Is there a point in this wrapper? Can you call writel directly? This
question generally applies to the driver. I see a lot of small functions
which can be inlined without losing the clarity.

> +}
> +
> +static void dc_dec_init(struct dc_de *de)
> +{
> +	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
> +}
> +
> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dc_drm_device *dc_drm = data;
> +	struct dc_de_priv *priv;
> +	int ret;
> +
> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
> +	if (IS_ERR(priv->reg_top))
> +		return PTR_ERR(priv->reg_top);
> +
> +	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
> +	if (priv->engine.irq_shdld < 0)
> +		return priv->engine.irq_shdld;
> +
> +	priv->engine.irq_framecomplete =
> +				platform_get_irq_byname(pdev, "framecomplete");
> +	if (priv->engine.irq_framecomplete < 0)
> +		return priv->engine.irq_framecomplete;
> +
> +	priv->engine.irq_seqcomplete =
> +				platform_get_irq_byname(pdev, "seqcomplete");
> +	if (priv->engine.irq_seqcomplete < 0)
> +		return priv->engine.irq_seqcomplete;
> +
> +	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");

Is this alias documented somewhere? Is it Acked by DT maintainers?

> +	if (priv->engine.id < 0) {
> +		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
> +		return priv->engine.id;
> +	}
> +
> +	priv->engine.dev = dev;
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	dc_drm->de[priv->engine.id] = &priv->engine;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry
