Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF152D2B33
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233756E161;
	Tue,  8 Dec 2020 12:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0E36E161
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:38:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5126CDD;
 Tue,  8 Dec 2020 13:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607431136;
 bh=v/1gJ9S8/WL7ZCOyvN/j+6KzE11E1+D7ZujUrs8lthI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUnh33RpWU/mAZ93S3wX/T6Ghd/YrHXmOCK2uw0qO9dPPMw5iy66Dl4YQpH2ILLpa
 qa3jBE3z39ofvUW7eeXdffHMk6o6HevMQT1dKUtF54nRU6rwXxxTMDmKTaqvJs2FIY
 rSmDAGO6Qir86/d0PhCEhA/iFhiw3kTPVlw/j1kA=
Date: Tue, 8 Dec 2020 14:38:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/4] phy: Add LVDS configuration options
Message-ID: <X89z3czlY1yxgsX3@pendragon.ideasonboard.com>
References: <1607067224-15616-1-git-send-email-victor.liu@nxp.com>
 <1607067224-15616-3-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607067224-15616-3-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 linux-imx@nxp.com, robert.chiras@nxp.com, martin.kepplinger@puri.sm,
 shawnguo@kernel.org, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thank you for the patch.

On Fri, Dec 04, 2020 at 03:33:42PM +0800, Liu Ying wrote:
> This patch allows LVDS PHYs to be configured through
> the generic functions and through a custom structure
> added to the generic union.
> 
> The parameters added here are based on common LVDS PHY
> implementation practices.  The set of parameters
> should cover all potential users.
> 
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  include/linux/phy/phy-lvds.h | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h      |  4 ++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 include/linux/phy/phy-lvds.h
> 
> diff --git a/include/linux/phy/phy-lvds.h b/include/linux/phy/phy-lvds.h
> new file mode 100644
> index 00000000..1b5b9d6
> --- /dev/null
> +++ b/include/linux/phy/phy-lvds.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +#ifndef __PHY_LVDS_H_
> +#define __PHY_LVDS_H_
> +
> +/**
> + * struct phy_configure_opts_lvds - LVDS configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * LVDS phy.
> + */
> +struct phy_configure_opts_lvds {
> +	/**
> +	 * @bits_per_lane_and_dclk_cycle:
> +	 *
> +	 * Number of bits per data lane and differential clock cycle.
> +	 */
> +	unsigned int bits_per_lane_and_dclk_cycle;

I see in patch 4/4 that you only support 7, can the value be any
different ?

> +
> +	/**
> +	 * @differential_clk_rate:
> +	 *
> +	 * Clock rate, in Hertz, of the LVDS differential clock.
> +	 */
> +	unsigned long differential_clk_rate;
> +
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active, consecutive, data lanes, starting from
> +	 * lane 0, used for the transmissions.
> +	 */
> +	unsigned int lanes;
> +
> +	/**
> +	 * @is_slave:
> +	 *
> +	 * Boolean, true if the phy is a slave which works together
> +	 * with a master phy to support dual link transmission,
> +	 * otherwise a regular phy or a master phy.
> +	 */
> +	bool is_slave;
> +};
> +
> +#endif /* __PHY_LVDS_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index e435bdb..d450b44 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -17,6 +17,7 @@
>  #include <linux/regulator/consumer.h>
>  
>  #include <linux/phy/phy-dp.h>
> +#include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  
>  struct phy;
> @@ -51,10 +52,13 @@ enum phy_mode {
>   *		the MIPI_DPHY phy mode.
>   * @dp:		Configuration set applicable for phys supporting
>   *		the DisplayPort protocol.
> + * @lvds:	Configuration set applicable for phys supporting
> + *		the LVDS phy mode.
>   */
>  union phy_configure_opts {
>  	struct phy_configure_opts_mipi_dphy	mipi_dphy;
>  	struct phy_configure_opts_dp		dp;
> +	struct phy_configure_opts_lvds		lvds;
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
