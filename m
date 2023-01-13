Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB1866A14C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1488710E070;
	Fri, 13 Jan 2023 17:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3C10E070
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 17:58:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 09DDBB821AA;
 Fri, 13 Jan 2023 17:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFFFC433F0;
 Fri, 13 Jan 2023 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673632696;
 bh=JuFDRpf2cgQra4Jmh7Rp/roiRRmIQ+8USu0y4bvm8KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RkzR17B3MqmFD3UDolrzkWFgVQxhTgJ+4mIBUVVNY+/xkKk5diJ1opON8eqkEMhs8
 56NpBBuZXT0z1eov1BtFLHwQbVq7pZQDfLDmHe9msV4+HlUoBra7C35UT54dmiJ/gK
 I1PeMTqmdr8gQ4978vdbOXvc7PZ0whaLOhhHuMROJiFm/4AZiws4TVlDUiUf86aDGk
 x4fdw0aL6q3xuuyxREb6gubPmU5zMZzolXC/K6ft33MfIN971TxVhZMBbkY7ON5C82
 El2Tp/2Lhy6ANr8J4O8V6cctEBXUyKemnbT2XRdS7k4SEw6v+NDC9c+dmUfmCZslMQ
 o87sG7uo5PfJQ==
Date: Fri, 13 Jan 2023 23:28:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [RFC PATCH 2/4] phy: rockchip: Add inno_is_valid_phy_mode
Message-ID: <Y8GbtA7+xHtBEpRs@matsya>
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
 <20221002064540.2500257-3-michael@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002064540.2500257-3-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02-10-22, 08:45, Michael Trimarchi wrote:
> The function is used to avoid to enable clock on the hardware
> if the mode requested is invalid
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 630e01b5c19b..644cf73cfd53 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -217,6 +217,20 @@ static void phy_update_bits(struct inno_dsidphy *inno,
>  	writel(tmp, inno->phy_base + reg);
>  }
>  
> +static int inno_is_valid_phy_mode(struct inno_dsidphy *inno)
> +{
> +	switch (inno->mode) {
> +	case PHY_MODE_MIPI_DPHY:
> +		break;
> +	case PHY_MODE_LVDS:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +};
> +
>  static unsigned long inno_dsidphy_pll_calc_rate(struct inno_dsidphy *inno,
>  						unsigned long rate)
>  {
> @@ -495,6 +509,11 @@ static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
>  static int inno_dsidphy_power_on(struct phy *phy)
>  {
>  	struct inno_dsidphy *inno = phy_get_drvdata(phy);
> +	int ret = 0;

this initialization is superfluous

> +
> +	ret = inno_is_valid_phy_mode(inno);
> +	if (ret)
> +		return ret;
>  
>  	clk_prepare_enable(inno->pclk_phy);
>  	clk_prepare_enable(inno->ref_clk);
> -- 
> 2.34.1

-- 
~Vinod
