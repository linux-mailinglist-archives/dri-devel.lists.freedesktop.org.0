Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4A16AD54
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 18:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA156E536;
	Mon, 24 Feb 2020 17:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C59F6E536
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:27:30 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6HVu-0003xW-G0; Mon, 24 Feb 2020 18:27:26 +0100
Message-ID: <1515559adebe3a6206e9b8e84692b7818709890b.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] drm/imx: Add initial support for DCSS on iMX8MQ
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Date: Mon, 24 Feb 2020 18:27:25 +0100
In-Reply-To: <1575625964-27102-3-git-send-email-laurentiu.palcu@nxp.com>
References: <1575625964-27102-1-git-send-email-laurentiu.palcu@nxp.com>
 <1575625964-27102-3-git-send-email-laurentiu.palcu@nxp.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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

just a first drive-by comment, more in-depth review tomorrow.

On Fr, 2019-12-06 at 11:52 +0200, Laurentiu Palcu wrote:
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
> ---
[...]
> diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
> new file mode 100644
> index 00000000..a189dac
> --- /dev/null
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -0,0 +1,8 @@
> +config DRM_IMX_DCSS
> +	tristate "i.MX8MQ DCSS"
> +	select RESET_CONTROLLER
> +	select IMX_IRQSTEER

This driver has no build time dependency on the IRQSTEER driver. It
needs it at runtime, but those dependencies are normally not described
in Kconfig.

On the other hand this is missing a "select DRM_KMS_CMA_HELPER".

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
