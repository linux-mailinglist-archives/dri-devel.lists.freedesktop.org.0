Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97D5007B6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 10:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0F10F222;
	Thu, 14 Apr 2022 08:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Thu, 14 Apr 2022 07:52:54 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AED10FC46
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 07:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 98739FB03;
 Thu, 14 Apr 2022 09:47:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1x8Uot4rq9Or; Thu, 14 Apr 2022 09:47:26 +0200 (CEST)
Date: Thu, 14 Apr 2022 09:47:16 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v7 1/5] drm/bridge: nwl-dsi: Set PHY mode in
 nwl_dsi_mode_set()
Message-ID: <YlfRhA305uVcFnFH@qwark.sigxcpu.org>
References: <20220414064858.405096-1-victor.liu@nxp.com>
 <20220414064858.405096-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220414064858.405096-2-victor.liu@nxp.com>
X-Mailman-Approved-At: Thu, 14 Apr 2022 08:02:23 +0000
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, krzk+dt@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Thu, Apr 14, 2022 at 02:48:54PM +0800, Liu Ying wrote:
> The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
> works with a Mixel MIPI DPHY + LVDS PHY combo to support either
> a MIPI DSI display or a LVDS display.  So, this patch calls
> phy_set_mode() from nwl_dsi_mode_set() to set PHY mode to MIPI DPHY
> explicitly.
> 
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6->v7:
> * No change.
> 
> v5->v6:
> * Rebase the series upon v5.17-rc1.
> * Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
>   bridge driver due to the rebase.
> * Drop Guido's R-b tag due to the rebase.
> 
> v4->v5:
> * No change.
> 
> v3->v4:
> * No change.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * Add Guido's R-b tag.
> 
>  drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index d5945501a5ee..85bab7372af1 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -666,6 +666,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi *dsi)
>  		return ret;
>  	}
>  
> +	ret = phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n", ret);
> +		goto uninit_phy;
> +	}
> +
>  	ret = phy_configure(dsi->phy, phy_cfg);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", ret);
> -- 
> 2.25.1
> 

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido
