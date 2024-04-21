Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8A8ABF1C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 14:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA36E10E3A1;
	Sun, 21 Apr 2024 12:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y+vskJxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B130610F043
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 12:07:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7919CE1;
 Sun, 21 Apr 2024 14:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713701225;
 bh=5t9i1tFwJM8WzaV17nFarWHAevNZdDbrrDX4kWOx5zk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y+vskJxHsklch1JdwkAvvGfdOqOEugie7gpKX24QrLZBcz/YmxNuGTriSjbrnb4LQ
 5Mea1omWXKrqDKtwZhGodr1ge+vclhZgq53hayDJG07GFlqXcw91Xogq8zTh2m9OpH
 pex9KjGprVVEbnebWk0EnlMk820cf8b4lPmDbK4M=
Date: Sun, 21 Apr 2024 15:07:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: imx: Fix unmet depenency for
 PHY_FSL_SAMSUNG_HDMI_PHY
Message-ID: <20240421120747.GA19147@pendragon.ideasonboard.com>
References: <20240420112831.5942-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240420112831.5942-1-aford173@gmail.com>
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

Hi Adam,

Thank you for the patch.

On Sat, Apr 20, 2024 at 06:28:31AM -0500, Adam Ford wrote:
> When enabling i.MX8MP DWC HDMI driver, it automatically selects
> PHY_FSL_SAMSUNG_HDMI_PHY, since it wont' work without the phy.
> This may cause some Kconfig warnings during various build tests.
> Fix this by implying the phy instead of selecting the phy.
> 
> Fixes: 1f36d634670d ("drm/bridge: imx: add bridge wrapper driver for i.MX8MP DWC HDMI")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 7687ed652df5..8f125c75050d 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -9,7 +9,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	depends on DRM_DW_HDMI
>  	depends on OF
>  	select DRM_IMX8MP_HDMI_PVI

This also looks wrong, even if in practice it will likely work because
DRM_IMX8MP_HDMI_PVI has no extra dependency compared to
DRM_IMX8MP_DW_HDMI_BRIDGE. Still, it would be good to fix it.

> -	select PHY_FSL_SAMSUNG_HDMI_PHY
> +	imply PHY_FSL_SAMSUNG_HDMI_PHY
>  	help
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.

-- 
Regards,

Laurent Pinchart
