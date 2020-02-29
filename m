Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89721746F1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 13:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB046E321;
	Sat, 29 Feb 2020 12:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4998C6E321
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 12:57:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 132D320023;
 Sat, 29 Feb 2020 13:57:27 +0100 (CET)
Date: Sat, 29 Feb 2020 13:57:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 3/3] drm/panel: add panel driver for Elida KD35T133
 panels
Message-ID: <20200229125725.GC5447@ravnborg.org>
References: <20200225093913.415844-1-heiko@sntech.de>
 <20200225093913.415844-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225093913.415844-3-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
 a=7gkXJVJtAAAA:8 a=zCkcj9i8kGs0GUICEK4A:9 a=CjuIK1q_8ugA:10
 a=cwV61pgf2j4Cq8VD9hE_:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, robin.murphy@arm.com,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko.

On Tue, Feb 25, 2020 at 10:39:13AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> Panel driver for the KD35T133 display from Elida, used for example
> in the rk3326-based Odroid Go Advance handheld.
> 
> changes in v2:
> - rename dsi_generic_write_seq macro to dsi_dcs_write_seq to honor
>   the underlying mipi_dsi_dcs_write (Robin)
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Driver looks good. One small nit.
With or without this addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Until we have the vendor prefix applied I cannot apply
the binding and thus this driver.
Ping me when we have the vendor prefix applied.

	Sam

> ---
>  drivers/gpu/drm/panel/Kconfig                |  10 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 352 +++++++++++++++++++
>  3 files changed, 363 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-elida-kd35t133.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index db7ba062027e..56149fdbdf53 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -50,6 +50,16 @@ config DRM_PANEL_SIMPLE
>  	  that it can be automatically turned off when the panel goes into a
>  	  low power state.
>  
> +config DRM_PANEL_ELIDA_KD35T133
> +	tristate "Elida KD35T133 panel driver"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Elida
> +	  KD35T133 controller for 320x480 LCD panels with MIPI-DSI
> +	  system interfaces.
> +
>  config DRM_PANEL_FEIYANG_FY07024DI26A30D
>  	tristate "Feiyang FY07024DI26A30-D MIPI-DSI LCD panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 276907410a45..63189c015ba5 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
>  obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
>  obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
>  obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
> +obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>  obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> new file mode 100644
> index 000000000000..424fb3998d2f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -0,0 +1,352 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Elida kd35t133 5.5" MIPI-DSI panel driver
> + * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
> + *
> + * based on
> + *
> + * Rockteck jh057n00900 5.5" MIPI-DSI panel driver
> + * Copyright (C) Purism SPC 2019
> + */
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#include <video/display_timing.h>
> +#include <video/mipi_display.h>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>

We usually order this:

#include <linux/*>

#include <video/*>

#include <drm/*>

And sorted within each block as you already did.

> +
> +/* Manufacturer specific Commands send via DSI */
> +#define KD35T133_CMD_INTERFACEMODECTRL		0xb0
> +#define KD35T133_CMD_FRAMERATECTRL		0xb1
> +#define KD35T133_CMD_DISPLAYINVERSIONCTRL	0xb4
> +#define KD35T133_CMD_DISPLAYFUNCTIONCTRL	0xb6
> +#define KD35T133_CMD_POWERCONTROL1		0xc0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
