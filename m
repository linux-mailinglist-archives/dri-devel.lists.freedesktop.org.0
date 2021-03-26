Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121834ADE6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992B96F45F;
	Fri, 26 Mar 2021 17:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAD86F45F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:52:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781123; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1Cv4Q1p0GwPoa05kk7e1DNWb07Mr08xNsqUcxEWZcDg=;
 b=IzCs+BCJEw6O1y6pAiT5nzsjetsUHVb/kFk9hnMEWffghlpeSJogcqQm5tRBcxvCTx+vAU6v
 AefzSY4wk63zaxLf3Y8dYVjRz6yXXkESpAZTytpLMp99sDqJMd01pEe56pJ3Yyrww8JwY5+W
 vzU2mUTKofOL1WC2Jv5RHdasDok=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 605e1e130a4a07ffda1ce684 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:46:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CC906C43464; Fri, 26 Mar 2021 17:46:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D1899C43461;
 Fri, 26 Mar 2021 17:46:56 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:46:56 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 04/28] drm/msm/dsi: replace PHY's init
 callback with configurable data
In-Reply-To: <20210324151846.2774204-5-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-5-dmitry.baryshkov@linaro.org>
Message-ID: <14073fbf2cf9653010078a5479e7e874@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> DSI PHY init callback would either map dsi_phy_regulator or 
> dsi_phy_lane
> depending on the PHY type. Replace those callbacks with configuration
> options governing mapping those regions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
This is a nice cleanup which will make all the ioremaps happen
in the same location.
Hence,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 42 ++++++++-----------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  4 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 19 +--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 19 +--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  6 +--
>  .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 19 +--------
>  8 files changed, 31 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index e8c1a727179c..83eb0a630443 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -637,24 +637,6 @@ static int dsi_phy_get_id(struct msm_dsi_phy *phy)
>  	return -EINVAL;
>  }
> 
> -int msm_dsi_phy_init_common(struct msm_dsi_phy *phy)
> -{
> -	struct platform_device *pdev = phy->pdev;
> -	int ret = 0;
> -
> -	phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator",
> -				"DSI_PHY_REG");
> -	if (IS_ERR(phy->reg_base)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator base\n",
> -			__func__);
> -		ret = -ENOMEM;
> -		goto fail;
> -	}
> -
> -fail:
> -	return ret;
> -}
> -
>  static int dsi_phy_driver_probe(struct platform_device *pdev)
>  {
>  	struct msm_dsi_phy *phy;
> @@ -691,6 +673,24 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		goto fail;
>  	}
> 
> +	if (phy->cfg->has_phy_lane) {
> +		phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane", "DSI_PHY_LANE");
> +		if (IS_ERR(phy->lane_base)) {
> +			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n", 
> __func__);
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +	}
> +
> +	if (phy->cfg->has_phy_regulator) {
> +		phy->reg_base = msm_ioremap(pdev, "dsi_phy_regulator", 
> "DSI_PHY_REG");
> +		if (IS_ERR(phy->reg_base)) {
> +			DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy regulator
> base\n", __func__);
> +			ret = -ENOMEM;
> +			goto fail;
> +		}
> +	}
> +
>  	ret = dsi_phy_regulator_init(phy);
>  	if (ret)
>  		goto fail;
> @@ -702,12 +702,6 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		goto fail;
>  	}
> 
> -	if (phy->cfg->ops.init) {
> -		ret = phy->cfg->ops.init(phy);
> -		if (ret)
> -			goto fail;
> -	}
> -
>  	/* PLL init will call into clk_register which requires
>  	 * register access, so we need to enable power and ahb clock.
>  	 */
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index d2bd74b6f357..03dfb08e7128 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -17,7 +17,6 @@
>  #define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
> 
>  struct msm_dsi_phy_ops {
> -	int (*init) (struct msm_dsi_phy *phy);
>  	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
>  			struct msm_dsi_phy_clk_request *clk_req);
>  	void (*disable)(struct msm_dsi_phy *phy);
> @@ -37,6 +36,8 @@ struct msm_dsi_phy_cfg {
>  	const resource_size_t io_start[DSI_MAX];
>  	const int num_dsi_phy;
>  	const int quirks;
> +	bool has_phy_regulator;
> +	bool has_phy_lane;
>  };
> 
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
> @@ -106,7 +107,6 @@ int msm_dsi_dphy_timing_calc_v4(struct
> msm_dsi_dphy_timing *timing,
>  				struct msm_dsi_phy_clk_request *clk_req);
>  void msm_dsi_phy_set_src_pll(struct msm_dsi_phy *phy, int pll_id, u32 
> reg,
>  				u32 bit_mask);
> -int msm_dsi_phy_init_common(struct msm_dsi_phy *phy);
> 
>  #endif /* __DSI_PHY_H__ */
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index d1b92d4dc197..655fa17a0452 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -216,24 +216,10 @@ static void dsi_10nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  	DBG("DSI%d PHY disabled", phy->id);
>  }
> 
> -static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
> -{
> -	struct platform_device *pdev = phy->pdev;
> -
> -	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
> -				     "DSI_PHY_LANE");
> -	if (IS_ERR(phy->lane_base)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
> -			__func__);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>  	.type = MSM_DSI_PHY_10NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -243,7 +229,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>  	.ops = {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
> -		.init = dsi_10nm_phy_init,
>  	},
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
> @@ -252,6 +237,7 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>  const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
>  	.type = MSM_DSI_PHY_10NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -261,7 +247,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs 
> = {
>  	.ops = {
>  		.enable = dsi_10nm_phy_enable,
>  		.disable = dsi_10nm_phy_disable,
> -		.init = dsi_10nm_phy_init,
>  	},
>  	.io_start = { 0xc994400, 0xc996400 },
>  	.num_dsi_phy = 2,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 519400501bcd..6989730b5fbd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -129,24 +129,10 @@ static void dsi_14nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  	wmb();
>  }
> 
> -static int dsi_14nm_phy_init(struct msm_dsi_phy *phy)
> -{
> -	struct platform_device *pdev = phy->pdev;
> -
> -	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
> -				"DSI_PHY_LANE");
> -	if (IS_ERR(phy->lane_base)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
> -			__func__);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>  	.type = MSM_DSI_PHY_14NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -156,7 +142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>  	.ops = {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
> -		.init = dsi_14nm_phy_init,
>  	},
>  	.io_start = { 0x994400, 0x996400 },
>  	.num_dsi_phy = 2,
> @@ -165,6 +150,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>  	.type = MSM_DSI_PHY_14NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -174,7 +160,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs 
> = {
>  	.ops = {
>  		.enable = dsi_14nm_phy_enable,
>  		.disable = dsi_14nm_phy_disable,
> -		.init = dsi_14nm_phy_init,
>  	},
>  	.io_start = { 0xc994400, 0xc996000 },
>  	.num_dsi_phy = 2,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index eca86bf448f7..b752636f7f21 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -127,6 +127,7 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
>  	.type = MSM_DSI_PHY_20NM,
>  	.src_pll_truthtable = { {false, true}, {false, true} },
> +	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 2,
>  		.regs = {
> @@ -137,7 +138,6 @@ const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
>  	.ops = {
>  		.enable = dsi_20nm_phy_enable,
>  		.disable = dsi_20nm_phy_disable,
> -		.init = msm_dsi_phy_init_common,
>  	},
>  	.io_start = { 0xfd998500, 0xfd9a0500 },
>  	.num_dsi_phy = 2,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index c3c580cfd8b1..5bf79de0da67 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -153,6 +153,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
>  	.type = MSM_DSI_PHY_28NM_HPM,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
> +	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -162,7 +163,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  	.ops = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
> -		.init = msm_dsi_phy_init_common,
>  	},
>  	.io_start = { 0xfd922b00, 0xfd923100 },
>  	.num_dsi_phy = 2,
> @@ -171,6 +171,7 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs 
> = {
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
>  	.type = MSM_DSI_PHY_28NM_HPM,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
> +	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -180,7 +181,6 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  	.ops = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
> -		.init = msm_dsi_phy_init_common,
>  	},
>  	.io_start = { 0x1a94400, 0x1a96400 },
>  	.num_dsi_phy = 2,
> @@ -189,6 +189,7 @@ const struct msm_dsi_phy_cfg 
> dsi_phy_28nm_hpm_famb_cfgs = {
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
>  	.type = MSM_DSI_PHY_28NM_LP,
>  	.src_pll_truthtable = { {true, true}, {true, true} },
> +	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -198,7 +199,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = 
> {
>  	.ops = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
> -		.init = msm_dsi_phy_init_common,
>  	},
>  	.io_start = { 0x1a98500 },
>  	.num_dsi_phy = 1,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index f22583353957..5d33de27a0f4 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -176,6 +176,7 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy 
> *phy)
>  const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
>  	.type = MSM_DSI_PHY_28NM_8960,
>  	.src_pll_truthtable = { {true, true}, {false, true} },
> +	.has_phy_regulator = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -185,7 +186,6 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs 
> = {
>  	.ops = {
>  		.enable = dsi_28nm_phy_enable,
>  		.disable = dsi_28nm_phy_disable,
> -		.init = msm_dsi_phy_init_common,
>  	},
>  	.io_start = { 0x4700300, 0x5800300 },
>  	.num_dsi_phy = 2,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 79c034ae075d..cbfeec860e69 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -224,24 +224,10 @@ static void dsi_7nm_phy_disable(struct 
> msm_dsi_phy *phy)
>  	DBG("DSI%d PHY disabled", phy->id);
>  }
> 
> -static int dsi_7nm_phy_init(struct msm_dsi_phy *phy)
> -{
> -	struct platform_device *pdev = phy->pdev;
> -
> -	phy->lane_base = msm_ioremap(pdev, "dsi_phy_lane",
> -				     "DSI_PHY_LANE");
> -	if (IS_ERR(phy->lane_base)) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: failed to map phy lane base\n",
> -			__func__);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  	.type = MSM_DSI_PHY_7NM_V4_1,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -251,7 +237,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  	.ops = {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
> -		.init = dsi_7nm_phy_init,
>  	},
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
> @@ -260,6 +245,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>  	.type = MSM_DSI_PHY_7NM,
>  	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.has_phy_lane = true,
>  	.reg_cfg = {
>  		.num = 1,
>  		.regs = {
> @@ -269,7 +255,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs 
> = {
>  	.ops = {
>  		.enable = dsi_7nm_phy_enable,
>  		.disable = dsi_7nm_phy_disable,
> -		.init = dsi_7nm_phy_init,
>  	},
>  	.io_start = { 0xae94400, 0xae96400 },
>  	.num_dsi_phy = 2,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
