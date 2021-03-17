Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE633EE3C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 11:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FFF6E524;
	Wed, 17 Mar 2021 10:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D344A8925B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:22:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D3F064EE1;
 Wed, 17 Mar 2021 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615976572;
 bh=desTsx3WQtjTaVBjhTB+jOTKBQ4fVjhRjO2BfJzcTvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXWROD1l0QOnrXuCYjcLc4/v2MYTS0MwDMSd1ekyiUJ89MDjNelAY0o5t77I0zkam
 CLm01YdIrPgKjQzcfcCcPpRQZzm9ZIO2ywGBPKv8k+2maxCepIZFNRkqCxszU5JRnH
 OPM7O9/qIjOqaGzm2SKAPl5eRnVt/ziIU//lRqzH+wfmJhT4ZAx6PZPQ5EVX5k55ss
 sZnVQKwsIqWKvBu+nDrHJqLE2806MBQ1UZTBeWrSpFng878P0gmi2BE+HvInRYE9AP
 4MpaCOoDj6Wvj1lJW+D3HgKBVrNgfVmlhWuZUWnG96a7R77FB+JzZfk1wDuSXd/sq7
 XakProKWsCPUQ==
Date: Wed, 17 Mar 2021 15:52:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 2/5] phy: Add LVDS configuration options
Message-ID: <YFHYeZ/ZVqNiG/yo@vkoul-mobl.Dlink>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
 <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 jonas@kwiboo.se, s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08-03-21, 11:52, Liu Ying wrote:
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
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * Add Robert's R-b tag.
> 
> v2->v3:
> * No change.
> 
> v1->v2:
> * No change.
> 
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

Can we have these in kernel-doc style please, similar to style in linux/phy/phy.h

> +	unsigned int bits_per_lane_and_dclk_cycle;
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
> -- 
> 2.7.4

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
