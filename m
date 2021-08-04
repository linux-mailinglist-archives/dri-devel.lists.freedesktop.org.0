Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A991F3E00F2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 14:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBD96E998;
	Wed,  4 Aug 2021 12:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Wed, 04 Aug 2021 12:15:25 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F976E998
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628078963;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=7EdYlGhRsvT7szxYZsO5Oz4HKMO5cvQWTxMEyLge6RE=;
 b=jtstUAEC4kErG9g+SmDSjx/KeJLp1tK1oYS8UOxfoNQWJBQlVAZuH8HykgDeJDADj0
 SxKMMpn7K8caV1+ifTjBcsXmQ8u4ywcx7n482wqExDFKj6N0vMcpM6coiVqGJ01IIwWg
 KeV80CYEnmVNUGY4Unvp4elY+1Ko8uZ23hK9SYKVRUuE+di6WXDOpInf4phUNKtEqrLZ
 WrEjKM6cJZQY4SFZYa1V8AH7hTLUlNec8/wSo54T3iQCFlTM7g0mT+LJC76CEzmR3IE/
 rDOX6Zc/3i5glFY2ARpSLkEqWlrhlNxYJL4ho1ttT34HOiLPMgpPHlOL7A4D5cfKt19t
 JDnA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4peA8Z6I1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id L01e9cx74C9N19V
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 4 Aug 2021 14:09:23 +0200 (CEST)
Date: Wed, 4 Aug 2021 14:09:19 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <YQqDb5eFqIx8tvAL@gerhold.net>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804081352.30595-3-shawn.guo@linaro.org>
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

Hi Shawn,

Thanks for the patch!

On Wed, Aug 04, 2021 at 04:13:52PM +0800, Shawn Guo wrote:
> It adds a drm driver for Truly NT35521 5.24" 1280x720 DSI panel, which
> can be found on Sony Xperia M4 Aqua phone.  The panel backlight is
> managed through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig               |   9 +
>  drivers/gpu/drm/panel/Makefile              |   1 +
>  drivers/gpu/drm/panel/panel-truly-nt35521.c | 491 ++++++++++++++++++++
>  3 files changed, 501 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-truly-nt35521.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ef87d92cdf49..cdc4abd5c40c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -537,6 +537,15 @@ config DRM_PANEL_TPO_TPG110
>  	  400CH LTPS TFT LCD Single Chip Digital Driver for up to
>  	  800x400 LCD panels.
>  
> +config DRM_PANEL_TRULY_NT35521
> +	tristate "Truly NT35521 panel"

I think the name "Truly NT35521" is a bit too generic. AFAIK "Truly" is
a panel vendor and the NovaTek NT35521 is the panel controller. But
there are almost certainly other Truly panels that were also combined
with a NT35521 but need a slightly different configuration.

If you don't know more than "Truly NT35521" based on the Sony sources,
maybe do it similar to "asus,z00t-tm5p5-n35596" and use a compatible
like "sony,<device>-truly-nt35521". Would be good to clarify the Kconfig
option here too.

> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Truly NT35521
> +	  1280x720 DSI panel.
> +
>  config DRM_PANEL_TRULY_NT35597_WQXGA
>  	tristate "Truly WQXGA"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index cae4d976c069..3d3c98cb7a7b 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
> +obj-$(CONFIG_DRM_PANEL_TRULY_NT35521) += panel-truly-nt35521.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>  obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-truly-nt35521.c b/drivers/gpu/drm/panel/panel-truly-nt35521.c
> new file mode 100644
> index 000000000000..ea3cfb46be7e
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-truly-nt35521.c
> @@ -0,0 +1,491 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021, Linaro Limited
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct nt35521_panel {
> +	struct drm_panel panel;
> +	struct device *dev;
> +	struct gpio_desc *rst_gpio;
> +	struct gpio_desc *pwrp5_gpio;
> +	struct gpio_desc *pwrn5_gpio;
> +	struct gpio_desc *en_gpio;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct nt35521_panel *panel_to_nt35521(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct nt35521_panel, panel);
> +}
> +
> +#define nt_dcs_write(seq...)						\
> +({									\
> +	const u8 d[] = { seq };						\
> +	if (mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)) < 0)	\
> +		DRM_DEV_ERROR(dev, "dcs write buffer failed\n");	\
> +})
> +
> +#define nt_gen_write(seq...)						\
> +({									\
> +	const u8 d[] = { seq };						\
> +	if (mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d)) < 0)		\
> +		DRM_DEV_ERROR(dev, "generic write buffer failed\n");	\
> +})
> +
> +static void nt35521_panel_on(struct nt35521_panel *nt)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> +	struct device *dev = nt->dev;
> +
> +	/* Transmit data in low power mode */
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	nt_dcs_write(0xff, 0xaa, 0x55, 0xa5, 0x80);
> +	nt_dcs_write(0x6f, 0x11, 0x00);
> +	nt_dcs_write(0xf7, 0x20, 0x00);
> +	nt_dcs_write(0x6f, 0x01);
> +	nt_dcs_write(0xb1, 0x21);
> +	nt_dcs_write(0xbd, 0x01, 0xa0, 0x10, 0x08, 0x01);
> +	nt_dcs_write(0xb8, 0x01, 0x02, 0x0c, 0x02);
> +	nt_dcs_write(0xbb, 0x11, 0x11);
> +	nt_dcs_write(0xbc, 0x00, 0x00);
> +	nt_dcs_write(0xb6, 0x02);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
> +	nt_dcs_write(0xb0, 0x09, 0x09);
> +	nt_dcs_write(0xb1, 0x09, 0x09);
> +	nt_dcs_write(0xbc, 0x8c, 0x00);
> +	nt_dcs_write(0xbd, 0x8c, 0x00);
> +	nt_dcs_write(0xca, 0x00);
> +	nt_dcs_write(0xc0, 0x04);
> +	nt_dcs_write(0xbe, 0xb5);
> +	nt_dcs_write(0xb3, 0x35, 0x35);
> +	nt_dcs_write(0xb4, 0x25, 0x25);
> +	nt_dcs_write(0xb9, 0x43, 0x43);
> +	nt_dcs_write(0xba, 0x24, 0x24);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> +	nt_dcs_write(0xee, 0x03);
> +	nt_dcs_write(0xb0, 0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb6, 0x00,
> +		     0xc3, 0x00, 0xce, 0x00, 0xe1, 0x00, 0xf3, 0x01,
> +		     0x11);
> +	nt_dcs_write(0xb1, 0x01, 0x2e, 0x01, 0x5c, 0x01, 0x82, 0x01,
> +		     0xc3, 0x01, 0xfe, 0x02, 0x00, 0x02, 0x37, 0x02,
> +		     0x77);
> +	nt_dcs_write(0xb2, 0x02, 0xa1, 0x02, 0xd7, 0x02, 0xfe, 0x03,
> +		     0x2c, 0x03, 0x4b, 0x03, 0x63, 0x03, 0x8f, 0x03,
> +		     0x90);
> +	nt_dcs_write(0xb3, 0x03, 0x96, 0x03, 0x98);
> +	nt_dcs_write(0xb4, 0x00, 0x81, 0x00, 0x8b, 0x00, 0x9c, 0x00,
> +		     0xa9, 0x00, 0xb5, 0x00, 0xcb, 0x00, 0xdf, 0x01,
> +		     0x02);
> +	nt_dcs_write(0xb5, 0x01, 0x1f, 0x01, 0x51, 0x01, 0x7a, 0x01,
> +		     0xbf, 0x01, 0xfa, 0x01, 0xfc, 0x02, 0x34, 0x02, 0x76);
> +	nt_dcs_write(0xb6, 0x02, 0x9f, 0x02, 0xd7, 0x02, 0xfc, 0x03, 0x2c,
> +		     0x03, 0x4a, 0x03, 0x63, 0x03, 0x8f, 0x03, 0xa2);
> +	nt_dcs_write(0xb7, 0x03, 0xb8, 0x03, 0xba);
> +	nt_dcs_write(0xb8, 0x00, 0x01, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x2a,
> +		     0x00, 0x41, 0x00, 0x67, 0x00, 0x87, 0x00, 0xb9);
> +	nt_dcs_write(0xb9, 0x00, 0xe2, 0x01, 0x22, 0x01, 0x54, 0x01, 0xa3,
> +		     0x01, 0xe6, 0x01, 0xe7, 0x02, 0x24, 0x02, 0x67);
> +	nt_dcs_write(0xba, 0x02, 0x93, 0x02, 0xcd, 0x02, 0xf6, 0x03, 0x31,
> +		     0x03, 0x6c, 0x03, 0xe9, 0x03, 0xef, 0x03, 0xf4);
> +	nt_dcs_write(0xbb, 0x03, 0xf6, 0x03, 0xf7);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x03);
> +	nt_dcs_write(0xb0, 0x22, 0x00);
> +	nt_dcs_write(0xb1, 0x22, 0x00);
> +	nt_dcs_write(0xb2, 0x05, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xb3, 0x05, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xb4, 0x05, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xb5, 0x05, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xba, 0x53, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xbb, 0x53, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xbc, 0x53, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xbd, 0x53, 0x00, 0x60, 0x00, 0x00);
> +	nt_dcs_write(0xc0, 0x00, 0x34, 0x00, 0x00);
> +	nt_dcs_write(0xc1, 0x00, 0x00, 0x34, 0x00);
> +	nt_dcs_write(0xc2, 0x00, 0x00, 0x34, 0x00);
> +	nt_dcs_write(0xc3, 0x00, 0x00, 0x34, 0x00);
> +	nt_dcs_write(0xc4, 0x60);
> +	nt_dcs_write(0xc5, 0xc0);
> +	nt_dcs_write(0xc6, 0x00);
> +	nt_dcs_write(0xc7, 0x00);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x05);
> +	nt_dcs_write(0xb0, 0x17, 0x06);
> +	nt_dcs_write(0xb1, 0x17, 0x06);
> +	nt_dcs_write(0xb2, 0x17, 0x06);
> +	nt_dcs_write(0xb3, 0x17, 0x06);
> +	nt_dcs_write(0xb4, 0x17, 0x06);
> +	nt_dcs_write(0xb5, 0x17, 0x06);
> +	nt_dcs_write(0xb6, 0x17, 0x06);
> +	nt_dcs_write(0xb7, 0x17, 0x06);
> +	nt_dcs_write(0xb8, 0x00);
> +	nt_dcs_write(0xb9, 0x00, 0x03);
> +	nt_dcs_write(0xba, 0x00, 0x00);
> +	nt_dcs_write(0xbb, 0x02, 0x03);
> +	nt_dcs_write(0xbc, 0x02, 0x03);
> +	nt_dcs_write(0xbd, 0x03, 0x03, 0x00, 0x03, 0x03);
> +	nt_dcs_write(0xc0, 0x0b);
> +	nt_dcs_write(0xc1, 0x09);
> +	nt_dcs_write(0xc2, 0xa6);
> +	nt_dcs_write(0xc3, 0x05);
> +	nt_dcs_write(0xc4, 0x00);
> +	nt_dcs_write(0xc5, 0x02);
> +	nt_dcs_write(0xc6, 0x22);
> +	nt_dcs_write(0xc7, 0x03);
> +	nt_dcs_write(0xc8, 0x07, 0x20);
> +	nt_dcs_write(0xc9, 0x03, 0x20);
> +	nt_dcs_write(0xca, 0x01, 0x60);
> +	nt_dcs_write(0xcb, 0x01, 0x60);
> +	nt_dcs_write(0xcc, 0x00, 0x00, 0x02);
> +	nt_dcs_write(0xcd, 0x00, 0x00, 0x02);
> +	nt_dcs_write(0xce, 0x00, 0x00, 0x02);
> +	nt_dcs_write(0xcf, 0x00, 0x00, 0x02);
> +	nt_dcs_write(0xd1, 0x00, 0x05, 0x01, 0x07, 0x10);
> +	nt_dcs_write(0xd2, 0x10, 0x05, 0x05, 0x03, 0x10);
> +	nt_dcs_write(0xd3, 0x20, 0x00, 0x43, 0x07, 0x10);
> +	nt_dcs_write(0xd4, 0x30, 0x00, 0x43, 0x07, 0x10);
> +	nt_dcs_write(0xd0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xd5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		     0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xd6, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		     0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xd7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		     0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xe5, 0x06);
> +	nt_dcs_write(0xe6, 0x06);
> +	nt_dcs_write(0xe7, 0x00);
> +	nt_dcs_write(0xe8, 0x06);
> +	nt_dcs_write(0xe9, 0x06);
> +	nt_dcs_write(0xea, 0x06);
> +	nt_dcs_write(0xeb, 0x00);
> +	nt_dcs_write(0xec, 0x00);
> +	nt_dcs_write(0xed, 0x30);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x06);
> +	nt_dcs_write(0xb0, 0x31, 0x31);
> +	nt_dcs_write(0xb1, 0x31, 0x31);
> +	nt_dcs_write(0xb2, 0x2d, 0x2e);
> +	nt_dcs_write(0xb3, 0x31, 0x34);
> +	nt_dcs_write(0xb4, 0x29, 0x2a);
> +	nt_dcs_write(0xb5, 0x12, 0x10);
> +	nt_dcs_write(0xb6, 0x18, 0x16);
> +	nt_dcs_write(0xb7, 0x00, 0x02);
> +	nt_dcs_write(0xb8, 0x08, 0x31);
> +	nt_dcs_write(0xb9, 0x31, 0x31);
> +	nt_dcs_write(0xba, 0x31, 0x31);
> +	nt_dcs_write(0xbb, 0x31, 0x08);
> +	nt_dcs_write(0xbc, 0x03, 0x01);
> +	nt_dcs_write(0xbd, 0x17, 0x19);
> +	nt_dcs_write(0xbe, 0x11, 0x13);
> +	nt_dcs_write(0xbf, 0x2a, 0x29);
> +	nt_dcs_write(0xc0, 0x34, 0x31);
> +	nt_dcs_write(0xc1, 0x2e, 0x2d);
> +	nt_dcs_write(0xc2, 0x31, 0x31);
> +	nt_dcs_write(0xc3, 0x31, 0x31);
> +	nt_dcs_write(0xc4, 0x31, 0x31);
> +	nt_dcs_write(0xc5, 0x31, 0x31);
> +	nt_dcs_write(0xc6, 0x2e, 0x2d);
> +	nt_dcs_write(0xc7, 0x31, 0x34);
> +	nt_dcs_write(0xc8, 0x29, 0x2a);
> +	nt_dcs_write(0xc9, 0x17, 0x19);
> +	nt_dcs_write(0xca, 0x11, 0x13);
> +	nt_dcs_write(0xcb, 0x03, 0x01);
> +	nt_dcs_write(0xcc, 0x08, 0x31);
> +	nt_dcs_write(0xcd, 0x31, 0x31);
> +	nt_dcs_write(0xce, 0x31, 0x31);
> +	nt_dcs_write(0xcf, 0x31, 0x08);
> +	nt_dcs_write(0xd0, 0x00, 0x02);
> +	nt_dcs_write(0xd1, 0x12, 0x10);
> +	nt_dcs_write(0xd2, 0x18, 0x16);
> +	nt_dcs_write(0xd3, 0x2a, 0x29);
> +	nt_dcs_write(0xd4, 0x34, 0x31);
> +	nt_dcs_write(0xd5, 0x2d, 0x2e);
> +	nt_dcs_write(0xd6, 0x31, 0x31);
> +	nt_dcs_write(0xd7, 0x31, 0x31);
> +	nt_dcs_write(0xe5, 0x31, 0x31);
> +	nt_dcs_write(0xe6, 0x31, 0x31);
> +	nt_dcs_write(0xd8, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xd9, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	nt_dcs_write(0xe7, 0x00);
> +	nt_dcs_write(0x6f, 0x02);
> +	nt_dcs_write(0xf7, 0x47);
> +	nt_dcs_write(0x6f, 0x0a);
> +	nt_dcs_write(0xf7, 0x02);
> +	nt_dcs_write(0x6f, 0x17);
> +	nt_dcs_write(0xf4, 0x60);
> +	nt_dcs_write(0x6f, 0x01);
> +	nt_dcs_write(0xf9, 0x46);
> +	nt_dcs_write(0x6f, 0x11);
> +	nt_dcs_write(0xf3, 0x01);
> +	nt_dcs_write(0x35, 0x00);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	nt_dcs_write(0xd9, 0x02, 0x03, 0x00);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	nt_dcs_write(0xb1, 0x6c, 0x21);
> +	nt_dcs_write(0xf0, 0x55, 0xaa, 0x52, 0x00, 0x00);
> +	nt_dcs_write(0x35, 0x00);
> +	nt_gen_write(0x11, 0x00);
> +	msleep(120);
> +	nt_gen_write(0x29, 0x00);
> +	usleep_range(1000, 1500);
> +	nt_dcs_write(0x53, 0x24);

Did you mix up "nt_dcs_write" and "nt_gen_write" here?
The nt_gen_write(0x11, 0x00); looks like MIPI_DCS_EXIT_SLEEP_MODE
and the nt_gen_write(0x29, 0x00); looks like MIPI_DCS_SET_DISPLAY_ON.

For reference you can pull your original reference DTB from Sony through
my panel driver generator: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

It produces the following (I compiled "msm8939-kanuti_tulip.dtb"
from https://github.com/sonyxperiadev/kernel/tree/aosp/LA.BR.1.3.3_rb2.14,
not sure if that is right):

	// ...
	dsi_generic_write_seq(dsi, 0x35, 0x00);

	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
	if (ret < 0) {
		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
		return ret;
	}
	msleep(120);

	ret = mipi_dsi_dcs_set_display_on(dsi);
	if (ret < 0) {
		dev_err(dev, "Failed to set display on: %d\n", ret);
		return ret;
	}
	usleep_range(1000, 2000);

	dsi_generic_write_seq(dsi, 0x53, 0x24);

Which also suggests that generic and DCS writes are mixed up here.

Note however that you could not use the generated driver as-is,
because Sony seems to use their own display driver instead of Qualcomm's
and some things seem to be different.

> +}
> +
> +static void nt35521_panel_off(struct nt35521_panel *nt)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> +	struct device *dev = nt->dev;
> +
> +	/* Transmit data in high speed mode */
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	nt_dcs_write(0x28, 0x00);
> +	msleep(50);
> +	nt_dcs_write(0x10, 0x00);
> +	msleep(150);

A bit more deobfuscated from the panel driver generator:

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_off(dsi);
	if (ret < 0) {
		dev_err(dev, "Failed to set display off: %d\n", ret);
		return ret;
	}
	msleep(50);

	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
	if (ret < 0) {
		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
		return ret;
	}
	msleep(150);

(I'm mainly referring to the mipi_dsi_dcs_*() here instead of the
 magic numbers...)

> +}
> +
> +static int nt35521_prepare(struct drm_panel *panel)
> +{
> +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> +
> +	if (nt->prepared)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(nt->pwrp5_gpio, 1);
> +	usleep_range(1000, 1500);
> +	gpiod_set_value_cansleep(nt->pwrn5_gpio, 1);
> +	usleep_range(10000, 15000);
> +	gpiod_set_value_cansleep(nt->rst_gpio, 0);
> +	msleep(150);
> +
> +	nt35521_panel_on(nt);
> +
> +	nt->prepared = true;
> +
> +	return 0;
> +}
> +
> +static int nt35521_unprepare(struct drm_panel *panel)
> +{
> +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> +
> +	if (!nt->prepared)
> +		return 0;
> +
> +	nt35521_panel_off(nt);
> +
> +	gpiod_set_value_cansleep(nt->rst_gpio, 1);
> +
> +	nt->prepared = false;
> +
> +	return 0;
> +}
> +
> +static int nt35521_enable(struct drm_panel *panel)
> +{
> +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> +
> +	if (nt->enabled)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(nt->en_gpio, 1);
> +
> +	nt->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int nt35521_disable(struct drm_panel *panel)
> +{
> +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> +
> +	if (!nt->enabled)
> +		return 0;
> +
> +	gpiod_set_value_cansleep(nt->en_gpio, 0);
> +
> +	nt->enabled = false;
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode nt35521_modes = {
> +	.clock = 133306,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 632,
> +	.hsync_end = 720 + 632 + 40,
> +	.htotal = 720 + 632 + 40 + 295,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 18,
> +	.vsync_end = 1280 + 18 + 1,
> +	.vtotal = 1280 + 18 + 1 + 18,
> +};
> +
> +static int nt35521_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct nt35521_panel *nt = panel_to_nt35521(panel);
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &nt35521_modes);
> +	if (!mode) {
> +		DRM_DEV_ERROR(nt->dev, "failed to add display mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +
> +	connector->display_info.width_mm = 65;
> +	connector->display_info.height_mm = 116;
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs nt35521_drm_funcs = {
> +	.prepare = nt35521_prepare,
> +	.unprepare = nt35521_unprepare,
> +	.enable = nt35521_enable,
> +	.disable = nt35521_disable,
> +	.get_modes = nt35521_get_modes,
> +};
> +
> +static int nt35521_backlight_update_status(struct backlight_device *bd)
> +{
> +	struct nt35521_panel *nt = bl_get_data(bd);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(nt->dev);
> +	u8 brightness = bd->props.brightness;

	u8 brightness = backlight_get_brightness(bl);

Is preferred now I think(?).

> +	int ret;
> +
> +	ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
> +				 &brightness,
> +				 sizeof(brightness));

Does this work too?

	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops nt35521_backlight_ops = {
> +	.update_status = nt35521_backlight_update_status,
> +};
> +
> +static int nt35521_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct backlight_properties props;
> +	struct device *dev = &dsi->dev;
> +	struct nt35521_panel *nt;
> +	int ret;
> +
> +	nt = devm_kzalloc(dev, sizeof(*nt), GFP_KERNEL);
> +	if (!nt)
> +		return -ENOMEM;
> +
> +	nt->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(nt->rst_gpio)) {
> +		ret = PTR_ERR(nt->rst_gpio);
> +		DRM_DEV_ERROR(dev, "failed to get reset GPIO: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nt->pwrp5_gpio = devm_gpiod_get(dev, "pwr-positive5", GPIOD_OUT_LOW);
> +	if (IS_ERR(nt->pwrp5_gpio)) {
> +		ret = PTR_ERR(nt->pwrp5_gpio);
> +		DRM_DEV_ERROR(dev, "failed to get positive5 GPIO: %d\n", ret);
> +		return ret;
> +	}
> +
> +	nt->pwrn5_gpio = devm_gpiod_get(dev, "pwr-negative5", GPIOD_OUT_LOW);
> +	if (IS_ERR(nt->pwrn5_gpio)) {
> +		ret = PTR_ERR(nt->pwrn5_gpio);
> +		DRM_DEV_ERROR(dev, "failed to get negative5 GPIO: %d\n", ret);
> +		return ret;
> +	}
> +

These two GPIOs look a lot like typical 5V display regulators that would
be better described through the regulator subsystem. You can declare
them as fixed-regulator to toggle the GPIO.

> +	nt->en_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(nt->en_gpio)) {
> +		ret = PTR_ERR(nt->en_gpio);
> +		DRM_DEV_ERROR(dev, "failed to get enable GPIO: %d\n", ret);
> +		return ret;
> +	}

Does this refer to the "platform-bklight-en-gpio" in the Sony sources?
Perhaps calling it "backlight-gpios" or something like that would be
more clear to show that it's related to the backlight.

Thanks!
Stephan
