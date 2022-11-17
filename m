Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D056762D270
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 05:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6307710E1C6;
	Thu, 17 Nov 2022 04:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DB810E1C6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 04:58:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DF00B851C0;
 Thu, 17 Nov 2022 05:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1668661091;
 bh=H75EdlqcmUQ++use3EJrvAxburWA1YNFKBN6VdzLs40=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oY3SaVFCj7rrR8HBaKH/bz7jQ1FT5fF6hPm0rsNm4A8TSTtBGTCf85SL0eaQoeWeL
 o5blLz5/yLhw8wW7mSo51epgCuFi/sDc7bvqQC1D8NIZWwtYHuVFYLgtq5Hti0Yz6I
 45Tc21agQDdO3AEMkJuDcWSZNnCkrUJJz14fKq+kgns0yfslVi9XLmWEGPwwVBL5MC
 R0ACna4JDbnyNNjtvja6GXagq/9zdFqOINbBNjhB3kQ7wDwHG9ElaCsP+5LrAf1wqK
 P/6phoZ95aonXCdaKAT3fxXvaQaTSfRtATYpZycQTVbk2J8WGmqmi/pry5NS0YQc4i
 TJGPZ5bU2mjig==
Message-ID: <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
Date: Thu, 17 Nov 2022 05:58:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221110183853.3678209-7-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/22 19:38, Jagan Teki wrote:
> DSI host initialization handling in previous exynos dsi driver has
> some pitfalls. It initializes the host during host transfer() hook
> that is indeed not the desired call flow for I2C and any other DSI
> configured downstream bridges.
> 
> Host transfer() is usually triggered for downstream DSI panels or
> bridges and I2C-configured-DSI bridges miss these host initialization
> as these downstream bridges use bridge operations hooks like pre_enable,
> and enable in order to initialize or set up the host.
> 
> This patch is trying to handle the host init handler to satisfy all
> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
> flag to ensure that host init is also done on first cmd transfer, this
> helps existing DSI panels work on exynos platform (form Marek
> Szyprowski).
> 
> v8, v7, v6, v5:
> * none
> 
> v4:
> * update init handling to ensure host init done on first cmd transfer
> 
> v3:
> * none
> 
> v2:
> * check initialized state in samsung_dsim_init
> 
> v1:
> * keep DSI init in host transfer
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>   include/drm/bridge/samsung-dsim.h     |  5 +++--
>   2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index bb1f45fd5a88..ec7e01ae02ea 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
>   	disable_irq(dsi->irq);
>   }
>   
> -static int samsung_dsim_init(struct samsung_dsim *dsi)
> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
>   {
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>   
> +	if (dsi->state & flag)
> +		return 0;
> +
>   	samsung_dsim_reset(dsi);
> -	samsung_dsim_enable_irq(dsi);
> +
> +	if (!(dsi->state & DSIM_STATE_INITIALIZED))
> +		samsung_dsim_enable_irq(dsi);
>   
>   	if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>   		samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
>   	samsung_dsim_set_phy_ctrl(dsi);
>   	samsung_dsim_init_link(dsi);
>   
> +	dsi->state |= flag;
> +
>   	return 0;
>   }
>   
> @@ -1269,6 +1276,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>   	}
>   
>   	dsi->state |= DSIM_STATE_ENABLED;
> +
> +	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> +	if (ret)
> +		return;
>   }
>   
>   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> @@ -1458,12 +1469,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
>   		return -EINVAL;
>   
> -	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> -		ret = samsung_dsim_init(dsi);
> -		if (ret)
> -			return ret;
> -		dsi->state |= DSIM_STATE_INITIALIZED;
> -	}
> +	ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);

This triggers full controller reset and reprogramming upon first command 
transfer, is such heavy handed reload really necessary ?
