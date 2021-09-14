Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3740AA40
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 11:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD96E43B;
	Tue, 14 Sep 2021 09:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 528 seconds by postgrey-1.36 at gabe;
 Tue, 14 Sep 2021 09:08:14 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA17C6E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1631609962; bh=FMNEyanpnGkCzKioEYG1k/II7rKs6qQbFTwCXVGg4oc=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=GGvk1MCa4lFwc1uX1oYJ6MPX92vPtub7KCi60FulGvIvB4YakA/B6yWwCeCJbkvaF
 sdE2vneLJROD6ev1jyF1TxBuoaEp5kBzeFUBkFa89/dNGlnyb3UzeQKatkzk55w5fu
 Xq4JkBithVZ/VaOEzMCCktvrEqFFBVw58taz9MnQ=
Date: Tue, 14 Sep 2021 10:59:22 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 saravanak@google.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
Message-ID: <20210914085922.qxhmr6puvy5d2ceo@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 saravanak@google.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210913172154.2686-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913172154.2686-1-jernej.skrabec@gmail.com>
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

Hello Jernej,

On Mon, Sep 13, 2021 at 07:21:54PM +0200, Jernej Skrabec wrote:
> Recent rework, which made HDMI PHY driver a platform device, inadvertely
> reversed clock setup order. HW is very touchy about it. Proper way is to
> handle controllers resets and clocks first and HDMI PHYs second.
> 
> Currently, without this fix, first mode set completely fails (nothing on
> HDMI monitor) on H3 era PHYs. On H6, it still somehow work.
> 
> Move HDMI PHY reset & clocks handling to sun8i_hdmi_phy_init() which
> will assure that code is executed after controllers reset & clocks are
> handled. Additionally, add sun8i_hdmi_phy_deinit() which will deinit
> them at controllers driver unload.
> 
> Tested on A64, H3, H6 and R40.
> 
> Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  |  7 +-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  4 +-
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 97 ++++++++++++++------------
>  3 files changed, 61 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index f75fb157f2ff..5fa5407ac583 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -216,11 +216,13 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  		goto err_disable_clk_tmds;
>  	}

^^^ This looks like...

> +	ret = sun8i_hdmi_phy_init(hdmi->phy);
> +	if (ret)
> +		return ret;

... you need 'goto err_disable_clk_tmds;' here, instead.

> +
>  	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
>  	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
>  
> -	sun8i_hdmi_phy_init(hdmi->phy);
> -
>  	plat_data->mode_valid = hdmi->quirks->mode_valid;
>  	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
>  	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
> @@ -262,6 +264,7 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
>  	struct sun8i_dw_hdmi *hdmi = dev_get_drvdata(dev);
>  
>  	dw_hdmi_unbind(hdmi->hdmi);
> +	sun8i_hdmi_phy_deinit(hdmi->phy);
>  	clk_disable_unprepare(hdmi->clk_tmds);
>  	reset_control_assert(hdmi->rst_ctrl);
>  	gpiod_set_value(hdmi->ddc_en, 0);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index 74f6ed0e2570..bffe1b9cd3dc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -169,6 +169,7 @@ struct sun8i_hdmi_phy {
>  	struct clk			*clk_phy;
>  	struct clk			*clk_pll0;
>  	struct clk			*clk_pll1;
> +	struct device			*dev;
>  	unsigned int			rcal;
>  	struct regmap			*regs;
>  	struct reset_control		*rst_phy;
> @@ -205,7 +206,8 @@ encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
>  
>  int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
>  
> -void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
> +int sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
> +void sun8i_hdmi_phy_deinit(struct sun8i_hdmi_phy *phy);
>  void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
>  			    struct dw_hdmi_plat_data *plat_data);
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index c9239708d398..78b152973957 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -506,9 +506,60 @@ static void sun8i_hdmi_phy_init_h3(struct sun8i_hdmi_phy *phy)
>  	phy->rcal = (val & SUN8I_HDMI_PHY_ANA_STS_RCAL_MASK) >> 2;
>  }
>  
> -void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy)
> +int sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy)
>  {
> +	int ret;
> +
> +	ret = reset_control_deassert(phy->rst_phy);
> +	if (ret) {
> +		dev_err(phy->dev, "Cannot deassert phy reset control: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(phy->clk_bus);
> +	if (ret) {
> +		dev_err(phy->dev, "Cannot enable bus clock: %d\n", ret);
> +		goto err_deassert_rst_phy;

I know it was there before, but please:

s/deassert/assert/

kind regards,
	o.

> +	}
> +
> +	ret = clk_prepare_enable(phy->clk_mod);
> +	if (ret) {
> +		dev_err(phy->dev, "Cannot enable mod clock: %d\n", ret);
> +		goto err_disable_clk_bus;
> +	}
> +
> +	if (phy->variant->has_phy_clk) {
> +		ret = sun8i_phy_clk_create(phy, phy->dev,
> +					   phy->variant->has_second_pll);
> +		if (ret) {
> +			dev_err(phy->dev, "Couldn't create the PHY clock\n");
> +			goto err_disable_clk_mod;
> +		}
> +
> +		clk_prepare_enable(phy->clk_phy);
> +	}
> +
>  	phy->variant->phy_init(phy);
> +
> +	return 0;
> +
> +err_disable_clk_mod:
> +	clk_disable_unprepare(phy->clk_mod);
> +err_disable_clk_bus:
> +	clk_disable_unprepare(phy->clk_bus);
> +err_deassert_rst_phy:
> +	reset_control_assert(phy->rst_phy);
> +
> +	return ret;
> +}
> +
>
> [......]
