Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43822802C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 14:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C2B89BA9;
	Tue, 21 Jul 2020 12:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FA389BA9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:43:38 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxrcL-0006Dx-Re; Tue, 21 Jul 2020 14:43:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxrcG-0005Rp-VR; Tue, 21 Jul 2020 14:43:28 +0200
Message-ID: <58a3ebe2620008daeab826a8216b6b5ad672fc7c.camel@pengutronix.de>
Subject: Re: [PATCH v7 2/5] drm/imx: Add initial support for DCSS on iMX8MQ
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,  Lucas Stach <l.stach@pengutronix.de>
Date: Tue, 21 Jul 2020 14:43:28 +0200
In-Reply-To: <20200721102007.18368-3-laurentiu.palcu@oss.nxp.com>
References: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
 <20200721102007.18368-3-laurentiu.palcu@oss.nxp.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurentiu,

On Tue, 2020-07-21 at 13:20 +0300, Laurentiu Palcu wrote:
> From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> 
> This adds initial support for iMX8MQ's Display Controller Subsystem (DCSS).
> Some of its capabilities include:
>  * 4K@60fps;
>  * HDR10;
>  * one graphics and 2 video pipelines;
>  * on-the-fly decompression of compressed video and graphics;
> 
> The reference manual can be found here:
> https://www.nxp.com/webapp/Download?colCode=IMX8MDQLQRM
> 
> The current patch adds only basic functionality: one primary plane for
> graphics, linear, tiled and super-tiled buffers support (no graphics
> decompression yet), no HDR10 and no video planes.
> 
> Video planes support and HDR10 will be added in subsequent patches once
> per-plane de-gamma/CSC/gamma support is in.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/imx/Kconfig            |   2 +
>  drivers/gpu/drm/imx/Makefile           |   1 +
>  drivers/gpu/drm/imx/dcss/Kconfig       |   9 +
>  drivers/gpu/drm/imx/dcss/Makefile      |   6 +
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c |  70 +++
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c   | 219 +++++++
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 424 +++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.c    | 314 ++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-dev.h    | 177 ++++++
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 562 +++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c    | 138 +++++
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 409 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.c    | 177 ++++++
>  drivers/gpu/drm/imx/dcss/dcss-kms.h    |  43 ++
>  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 405 ++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 826 +++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dcss/dcss-ss.c     | 180 ++++++
>  17 files changed, 3962 insertions(+)
>  create mode 100644 drivers/gpu/drm/imx/dcss/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dcss/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-blkctl.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ctxld.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dev.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dpr.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-dtg.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-scaler.c
>  create mode 100644 drivers/gpu/drm/imx/dcss/dcss-ss.c
> 
> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
> index 207bf7409dfb..6231048aa5aa 100644
> --- a/drivers/gpu/drm/imx/Kconfig
> +++ b/drivers/gpu/drm/imx/Kconfig
> @@ -39,3 +39,5 @@ config DRM_IMX_HDMI
>  	depends on DRM_IMX
>  	help
>  	  Choose this if you want to use HDMI on i.MX6.
> +
> +source "drivers/gpu/drm/imx/dcss/Kconfig"
> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
> index 21cdcc2faabc..b644deffe948 100644
> --- a/drivers/gpu/drm/imx/Makefile
> +++ b/drivers/gpu/drm/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX_TVE) += imx-tve.o
>  obj-$(CONFIG_DRM_IMX_LDB) += imx-ldb.o
>  
>  obj-$(CONFIG_DRM_IMX_HDMI) += dw_hdmi-imx.o
> +obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> new file mode 100644
> index 000000000000..988979bc22cc
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -0,0 +1,9 @@
> +config DRM_IMX_DCSS
> +	tristate "i.MX8MQ DCSS"
> +	select RESET_CONTROLLER

Why does DCSS select RESET_CONTROLLER?

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
