Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE64AEED9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 11:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E5510E118;
	Wed,  9 Feb 2022 10:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1345C10E118
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 10:04:04 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHjpP-0008Rc-En; Wed, 09 Feb 2022 11:03:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 02/23] drm/rockchip: dw_hdmi: Do not leave clock
 enabled in error case
Date: Wed, 09 Feb 2022 11:03:58 +0100
Message-ID: <2395553.0l50XtO9Ib@diego>
In-Reply-To: <20220209095350.2104049-3-s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-3-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 9. Februar 2022, 10:53:29 CET schrieb Sascha Hauer:
> The driver returns an error when devm_phy_optional_get() fails leaving
> the previously enabled clock turned on. Change order and enable the
> clock only after the phy has been acquired.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

just a note for me, already applied to drm-misc-fixes:
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=c0cfbb122275da1b726481de5a8cffeb24e6322b

> ---
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index 830bdd5e9b7c..8677c8271678 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -529,13 +529,6 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>  
> -	ret = clk_prepare_enable(hdmi->vpll_clk);
> -	if (ret) {
> -		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI vpll: %d\n",
> -			      ret);
> -		return ret;
> -	}
> -
>  	hdmi->phy = devm_phy_optional_get(dev, "hdmi");
>  	if (IS_ERR(hdmi->phy)) {
>  		ret = PTR_ERR(hdmi->phy);
> @@ -544,6 +537,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>  
> +	ret = clk_prepare_enable(hdmi->vpll_clk);
> +	if (ret) {
> +		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI vpll: %d\n",
> +			      ret);
> +		return ret;
> +	}
> +
>  	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
>  	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
>  
> 




