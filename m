Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEF5895CA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 04:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D8711AFFC;
	Thu,  4 Aug 2022 02:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBFF2BC7E;
 Thu,  4 Aug 2022 02:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659578437; x=1691114437;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5FwZbUVCI96oldTuHCGORfGxf+Ok4IKAm28ynxjAyvM=;
 b=HeKl0/GFsCEjTWkGsHEeKkwKuV/IrexA3dM5BnXlrw4XFJJVUp9MqBQ6
 +N8AW0K8phzy28JwqDg3Ck9YPiEsorZ8Y+dN9cG6+LKmDSu/66gZZeJBF
 WC+eREgtYjt/xnIOXSbq1KrGghXq1cpMWrt5vu9uAV/uH2ZuXJeuSg7D0 Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Aug 2022 19:00:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 19:00:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 19:00:35 -0700
Received: from [10.38.247.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 19:00:29 -0700
Message-ID: <108527a1-03c1-2419-f92a-11a80a2a9805@quicinc.com>
Date: Wed, 3 Aug 2022 19:00:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 5/6] drm/msm/dsi: Take advantage of
 devm_regulator_bulk_get_const()
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Sireesh Kodali <sireeshkodali1@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/2/2022 3:37 PM, Douglas Anderson wrote:
> As of the commit 1de452a0edda ("regulator: core: Allow drivers to
> define their init data as const") we no longer need to do copying of
> regulator bulk data from initdata to something dynamic. Let's take
> advantage of that.
> 
> In addition to saving some code, this also moves us to using
> ARRAY_SIZE() to specify how many regulators we have which is less
> error prone.
> 
> This gets rid of some layers of wrappers which makes it obvious that
> we can get rid of an extra error print.
> devm_regulator_bulk_get_const() prints errors for you so you don't
> need an extra layer of printing.
> 
> In all cases here I have preserved the old settings without any
> investigation about whether the loads being set are sensible. In the
> cases of some of the PHYs if several PHYs in the same file used
> exactly the same settings I had them point to the same data structure.
> 
> NOTE: Though I haven't done the math, this is likely an overall
> savings in terms of "static const" data. We previously always
> allocated space for 8 supplies. Each of these supplies took up 36
> bytes of data (32 for name, 4 for an int).
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

LGTM, I am okay with DSI and DSI PHY being in one patch,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> ---
> 
> Changes in v3:
> - Do all the PHYs too.
> - Get rid of error print after devm_regulator_bulk_get_const().
> - Just directly call the bulk commands; get rid of the wrapper.
> - Update commit message to point at the git hash of the regulator change.
> 
> Changes in v2:
> - ("Take advantage of devm_regulator_bulk_get_const") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi.h                 |  12 --
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |  42 ++---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  37 +---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
>   .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
>   12 files changed, 167 insertions(+), 242 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bb6a5bd05cb1..d661510d570d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -30,20 +30,8 @@ enum msm_dsi_phy_usecase {
>   	MSM_DSI_PHY_SLAVE,
>   };
>   
> -#define DSI_DEV_REGULATOR_MAX	8
>   #define DSI_BUS_CLK_MAX		4
>   
> -/* Regulators for DSI devices */
> -struct dsi_reg_entry {
> -	char name[32];
> -	int enable_load;
> -};
> -
> -struct dsi_reg_config {
> -	int num;
> -	struct dsi_reg_entry regs[DSI_DEV_REGULATOR_MAX];
> -};
> -
>   struct msm_dsi {
>   	struct drm_device *dev;
>   	struct platform_device *pdev;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 901d6fd53800..7e97c239ed48 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -9,16 +9,16 @@ static const char * const dsi_v2_bus_clk_names[] = {
>   	"core_mmss", "iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data apq8064_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> +	{ .supply = "avdd", .init_load_uA = 10000 },	/* 3.0 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   static const struct msm_dsi_config apq8064_dsi_cfg = {
>   	.io_offset = 0,
> -	.reg_cfg = {
> -		.num = 3,
> -		.regs = {
> -			{"vdda", 100000},	/* 1.2 V */
> -			{"avdd", 10000},	/* 3.0 V */
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = apq8064_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
>   	.bus_clk_names = dsi_v2_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
>   	.io_start = { 0x4700000, 0x5800000 },
> @@ -29,16 +29,16 @@ static const char * const dsi_6g_bus_clk_names[] = {
>   	"mdp_core", "iface", "bus", "core_mmss",
>   };
>   
> +static const struct regulator_bulk_data msm8974_apq8084_regulators[] = {
> +	{ .supply = "vdd", .init_load_uA = 150000 },	/* 3.0 V */
> +	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 3,
> -		.regs = {
> -			{"vdd", 150000},	/* 3.0 V */
> -			{"vdda", 100000},	/* 1.2 V */
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = msm8974_apq8084_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
>   	.bus_clk_names = dsi_6g_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>   	.io_start = { 0xfd922800, 0xfd922b00 },
> @@ -49,15 +49,15 @@ static const char * const dsi_8916_bus_clk_names[] = {
>   	"mdp_core", "iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   static const struct msm_dsi_config msm8916_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 2,
> -		.regs = {
> -			{"vdda", 100000},	/* 1.2 V */
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = msm8916_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
>   	.bus_clk_names = dsi_8916_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
>   	.io_start = { 0x1a98000 },
> @@ -68,34 +68,34 @@ static const char * const dsi_8976_bus_clk_names[] = {
>   	"mdp_core", "iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   static const struct msm_dsi_config msm8976_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 2,
> -		.regs = {
> -			{"vdda", 100000},	/* 1.2 V */
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = msm8976_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
>   	.bus_clk_names = dsi_8976_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
>   	.io_start = { 0x1a94000, 0x1a96000 },
>   	.num_dsi = 2,
>   };
>   
> +static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.25 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +	{ .supply = "vcca", .init_load_uA = 10000 },	/* 1.0 V */
> +	{ .supply = "vdd", .init_load_uA = 100000 },	/* 1.8 V */
> +	{ .supply = "lab_reg", .init_load_uA = -1 },
> +	{ .supply = "ibb_reg", .init_load_uA = -1 },
> +};
> +
>   static const struct msm_dsi_config msm8994_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 6,
> -		.regs = {
> -			{"vdda", 100000},	/* 1.25 V */
> -			{"vddio", 100000},	/* 1.8 V */
> -			{"vcca", 10000},	/* 1.0 V */
> -			{"vdd", 100000},	/* 1.8 V */
> -			{"lab_reg", -1},
> -			{"ibb_reg", -1},
> -		},
> -	},
> +	.regulator_data = msm8994_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
>   	.bus_clk_names = dsi_6g_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>   	.io_start = { 0xfd998000, 0xfd9a0000 },
> @@ -106,16 +106,16 @@ static const char * const dsi_8996_bus_clk_names[] = {
>   	"mdp_core", "iface", "bus", "core_mmss",
>   };
>   
> +static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
> +	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   static const struct msm_dsi_config msm8996_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 3,
> -		.regs = {
> -			{"vdda", 18160},	/* 1.25 V */
> -			{"vcca", 17000},	/* 0.925 V */
> -			{"vddio", 100000},/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = msm8996_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
>   	.bus_clk_names = dsi_8996_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
>   	.io_start = { 0x994000, 0x996000 },
> @@ -126,15 +126,15 @@ static const char * const dsi_msm8998_bus_clk_names[] = {
>   	"iface", "bus", "core",
>   };
>   
> +static const struct regulator_bulk_data msm8998_dsi_regulators[] = {
> +	{ .supply = "vdd", .init_load_uA = 367000 },	/* 0.9 V */
> +	{ .supply = "vdda", .init_load_uA = 62800 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config msm8998_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 2,
> -		.regs = {
> -			{"vdd", 367000},	/* 0.9 V */
> -			{"vdda", 62800},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = msm8998_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
>   	.bus_clk_names = dsi_msm8998_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
>   	.io_start = { 0xc994000, 0xc996000 },
> @@ -145,14 +145,14 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
>   	"iface", "bus", "core", "core_mmss",
>   };
>   
> +static const struct regulator_bulk_data sdm660_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 12560 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdda", 12560},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = sdm660_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
>   	.bus_clk_names = dsi_sdm660_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
>   	.io_start = { 0xc994000, 0xc996000 },
> @@ -167,28 +167,28 @@ static const char * const dsi_sc7180_bus_clk_names[] = {
>   	"iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config sdm845_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdda", 21800},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = sdm845_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
>   	.bus_clk_names = dsi_sdm845_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>   	.io_start = { 0xae94000, 0xae96000 },
>   	.num_dsi = 2,
>   };
>   
> +static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config sc7180_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdda", 21800},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = sc7180_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
>   	.bus_clk_names = dsi_sc7180_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
>   	.io_start = { 0xae94000 },
> @@ -199,14 +199,14 @@ static const char * const dsi_sc7280_bus_clk_names[] = {
>   	"iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config sc7280_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdda", 8350},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = sc7280_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
>   	.bus_clk_names = dsi_sc7280_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
>   	.io_start = { 0xae94000 },
> @@ -217,14 +217,14 @@ static const char * const dsi_qcm2290_bus_clk_names[] = {
>   	"iface", "bus",
>   };
>   
> +static const struct regulator_bulk_data qcm2290_dsi_cfg_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> +};
> +
>   static const struct msm_dsi_config qcm2290_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdda", 21800},	/* 1.2 V */
> -		},
> -	},
> +	.regulator_data = qcm2290_dsi_cfg_regulators,
> +	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
>   	.bus_clk_names = dsi_qcm2290_bus_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>   	.io_start = { 0x5e94000 },
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index fe54a999968b..8f04e685a74e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -32,7 +32,8 @@
>   
>   struct msm_dsi_config {
>   	u32 io_offset;
> -	struct dsi_reg_config reg_cfg;
> +	const struct regulator_bulk_data *regulator_data;
> +	int num_regulators;
>   	const char * const *bus_clk_names;
>   	const int num_bus_clks;
>   	const resource_size_t io_start[DSI_MAX];
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a0a1b6d61d05..3364b2affac5 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -106,7 +106,7 @@ struct msm_dsi_host {
>   
>   	void __iomem *ctrl_base;
>   	phys_addr_t ctrl_size;
> -	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
> +	struct regulator_bulk_data *supplies;
>   
>   	int num_bus_clks;
>   	struct clk_bulk_data bus_clks[DSI_BUS_CLK_MAX];
> @@ -253,28 +253,6 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
>   	return container_of(host, struct msm_dsi_host, base);
>   }
>   
> -static int dsi_regulator_init(struct msm_dsi_host *msm_host)
> -{
> -	struct regulator_bulk_data *s = msm_host->supplies;
> -	const struct dsi_reg_entry *regs = msm_host->cfg_hnd->cfg->reg_cfg.regs;
> -	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
> -	int i, ret;
> -
> -	for (i = 0; i < num; i++) {
> -		s[i].supply = regs[i].name;
> -		s[i].init_load_uA = regs[i].enable_load;
> -	}
> -
> -	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
> -	if (ret < 0) {
> -		pr_err("%s: failed to init regulator, ret=%d\n",
> -						__func__, ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   int dsi_clk_init_v2(struct msm_dsi_host *msm_host)
>   {
>   	struct platform_device *pdev = msm_host->pdev;
> @@ -1982,6 +1960,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   {
>   	struct msm_dsi_host *msm_host = NULL;
>   	struct platform_device *pdev = msm_dsi->pdev;
> +	const struct msm_dsi_config *cfg;
>   	int ret;
>   
>   	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
> @@ -2014,6 +1993,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   		pr_err("%s: get config failed\n", __func__);
>   		goto fail;
>   	}
> +	cfg = msm_host->cfg_hnd->cfg;
>   
>   	msm_host->id = dsi_host_get_id(msm_host);
>   	if (msm_host->id < 0) {
> @@ -2023,13 +2003,13 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>   	}
>   
>   	/* fixup base address by io offset */
> -	msm_host->ctrl_base += msm_host->cfg_hnd->cfg->io_offset;
> +	msm_host->ctrl_base += cfg->io_offset;
>   
> -	ret = dsi_regulator_init(msm_host);
> -	if (ret) {
> -		pr_err("%s: regulator init failed\n", __func__);
> +	ret = devm_regulator_bulk_get_const(&pdev->dev, cfg->num_regulators,
> +					    cfg->regulator_data,
> +					    &msm_host->supplies);
> +	if (ret)
>   		goto fail;
> -	}
>   
>   	ret = dsi_clk_init(msm_host);
>   	if (ret) {
> @@ -2510,7 +2490,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>   
>   	msm_dsi_sfpb_config(msm_host, true);
>   
> -	ret = regulator_bulk_enable(msm_host->cfg_hnd->cfg->reg_cfg.num,
> +	ret = regulator_bulk_enable(msm_host->cfg_hnd->cfg->num_regulators,
>   				    msm_host->supplies);
>   	if (ret) {
>   		pr_err("%s:Failed to enable vregs.ret=%d\n",
> @@ -2551,7 +2531,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>   	cfg_hnd->ops->link_clk_disable(msm_host);
>   	pm_runtime_put(&msm_host->pdev->dev);
>   fail_disable_reg:
> -	regulator_bulk_disable(msm_host->cfg_hnd->cfg->reg_cfg.num,
> +	regulator_bulk_disable(msm_host->cfg_hnd->cfg->num_regulators,
>   			       msm_host->supplies);
>   unlock_ret:
>   	mutex_unlock(&msm_host->dev_mutex);
> @@ -2579,7 +2559,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>   	cfg_hnd->ops->link_clk_disable(msm_host);
>   	pm_runtime_put(&msm_host->pdev->dev);
>   
> -	regulator_bulk_disable(msm_host->cfg_hnd->cfg->reg_cfg.num,
> +	regulator_bulk_disable(msm_host->cfg_hnd->cfg->num_regulators,
>   			       msm_host->supplies);
>   
>   	msm_dsi_sfpb_config(msm_host, false);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index efb6b1726cdb..0a00f9b73fc5 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -507,33 +507,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>   	return 0;
>   }
>   
> -static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
> -{
> -	struct regulator_bulk_data *s = phy->supplies;
> -	const struct dsi_reg_entry *regs = phy->cfg->reg_cfg.regs;
> -	struct device *dev = &phy->pdev->dev;
> -	int num = phy->cfg->reg_cfg.num;
> -	int i, ret;
> -
> -	for (i = 0; i < num; i++) {
> -		s[i].supply = regs[i].name;
> -		s[i].init_load_uA = regs[i].enable_load;
> -	}
> -
> -	ret = devm_regulator_bulk_get(dev, num, s);
> -	if (ret < 0) {
> -		if (ret != -EPROBE_DEFER) {
> -			DRM_DEV_ERROR(dev,
> -				      "%s: failed to init regulator, ret=%d\n",
> -				      __func__, ret);
> -		}
> -
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
>   {
>   	struct device *dev = &phy->pdev->dev;
> @@ -698,7 +671,9 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   			goto fail;
>   	}
>   
> -	ret = dsi_phy_regulator_init(phy);
> +	ret = devm_regulator_bulk_get_const(dev, phy->cfg->num_regulators,
> +					    phy->cfg->regulator_data,
> +					    &phy->supplies);
>   	if (ret)
>   		goto fail;
>   
> @@ -780,7 +755,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>   		goto res_en_fail;
>   	}
>   
> -	ret = regulator_bulk_enable(phy->cfg->reg_cfg.num, phy->supplies);
> +	ret = regulator_bulk_enable(phy->cfg->num_regulators, phy->supplies);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev, "%s: regulator enable failed, %d\n",
>   			__func__, ret);
> @@ -817,7 +792,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>   	if (phy->cfg->ops.disable)
>   		phy->cfg->ops.disable(phy);
>   phy_en_fail:
> -	regulator_bulk_disable(phy->cfg->reg_cfg.num, phy->supplies);
> +	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
>   reg_en_fail:
>   	dsi_phy_disable_resource(phy);
>   res_en_fail:
> @@ -831,7 +806,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
>   
>   	phy->cfg->ops.disable(phy);
>   
> -	regulator_bulk_disable(phy->cfg->reg_cfg.num, phy->supplies);
> +	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
>   	dsi_phy_disable_resource(phy);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index dc91b43d5a38..60a99c6525b2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -29,7 +29,8 @@ struct msm_dsi_phy_ops {
>   };
>   
>   struct msm_dsi_phy_cfg {
> -	struct dsi_reg_config reg_cfg;
> +	const struct regulator_bulk_data *regulator_data;
> +	int num_regulators;
>   	struct msm_dsi_phy_ops ops;
>   
>   	unsigned long	min_pll_rate;
> @@ -98,7 +99,7 @@ struct msm_dsi_phy {
>   	int id;
>   
>   	struct clk *ahb_clk;
> -	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
> +	struct regulator_bulk_data *supplies;
>   
>   	struct msm_dsi_dphy_timing timing;
>   	const struct msm_dsi_phy_cfg *cfg;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 6a10a1448051..e34a2274db87 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -1028,14 +1028,14 @@ static int dsi_10nm_phy_parse_dt(struct msm_dsi_phy *phy)
>   	return 0;
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_10nm_regulators[] = {
> +	{ .supply = "vdds", .init_load_uA = 36000 },
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdds", 36000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_10nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_10nm_regulators),
>   	.ops = {
>   		.enable = dsi_10nm_phy_enable,
>   		.disable = dsi_10nm_phy_disable,
> @@ -1052,12 +1052,8 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdds", 36000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_10nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_10nm_regulators),
>   	.ops = {
>   		.enable = dsi_10nm_phy_enable,
>   		.disable = dsi_10nm_phy_disable,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 0f3d4c56c333..be1500368d95 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1024,14 +1024,18 @@ static void dsi_14nm_phy_disable(struct msm_dsi_phy *phy)
>   	wmb();
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_14nm_17mA_regulators[] = {
> +	{ .supply = "vcca", .init_load_uA = 17000 },
> +};
> +
> +static const struct regulator_bulk_data dsi_phy_14nm_73p4mA_regulators[] = {
> +	{ .supply = "vcca", .init_load_uA = 73400 },
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vcca", 17000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_14nm_17mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
>   	.ops = {
>   		.enable = dsi_14nm_phy_enable,
>   		.disable = dsi_14nm_phy_disable,
> @@ -1047,12 +1051,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vcca", 73400},
> -		},
> -	},
> +	.regulator_data = dsi_phy_14nm_73p4mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_73p4mA_regulators),
>   	.ops = {
>   		.enable = dsi_14nm_phy_enable,
>   		.disable = dsi_14nm_phy_disable,
> @@ -1068,12 +1068,8 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vcca", 17000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_14nm_17mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
>   	.ops = {
>   		.enable = dsi_14nm_phy_enable,
>   		.disable = dsi_14nm_phy_disable,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> index b7c621d94981..c9752b991744 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c
> @@ -129,15 +129,15 @@ static void dsi_20nm_phy_disable(struct msm_dsi_phy *phy)
>   	dsi_20nm_phy_regulator_ctrl(phy, false);
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_20nm_regulators[] = {
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +	{ .supply = "vcca", .init_load_uA = 10000 },	/* 1.0 V */
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs = {
>   	.has_phy_regulator = true,
> -	.reg_cfg = {
> -		.num = 2,
> -		.regs = {
> -			{"vddio", 100000},	/* 1.8 V */
> -			{"vcca", 10000},	/* 1.0 V */
> -		},
> -	},
> +	.regulator_data = dsi_phy_20nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_20nm_regulators),
>   	.ops = {
>   		.enable = dsi_20nm_phy_enable,
>   		.disable = dsi_20nm_phy_disable,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 6beba387640d..578c671a3bb1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -769,14 +769,14 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
>   	wmb();
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_28nm_regulators[] = {
> +	{ .supply = "vddio", .init_load_uA = 100000 },
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
>   	.has_phy_regulator = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vddio", 100000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_28nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
>   	.ops = {
>   		.enable = dsi_28nm_phy_enable,
>   		.disable = dsi_28nm_phy_disable,
> @@ -792,12 +792,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
>   	.has_phy_regulator = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vddio", 100000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_28nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
>   	.ops = {
>   		.enable = dsi_28nm_phy_enable,
>   		.disable = dsi_28nm_phy_disable,
> @@ -813,12 +809,8 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
>   	.has_phy_regulator = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = dsi_phy_28nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
>   	.ops = {
>   		.enable = dsi_28nm_phy_enable,
>   		.disable = dsi_28nm_phy_disable,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 2e942b10fffa..fba1ba88de01 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -648,14 +648,14 @@ static void dsi_28nm_phy_disable(struct msm_dsi_phy *phy)
>   	wmb();
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_28nm_8960_regulators[] = {
> +	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs = {
>   	.has_phy_regulator = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vddio", 100000},	/* 1.8 V */
> -		},
> -	},
> +	.regulator_data = dsi_phy_28nm_8960_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_8960_regulators),
>   	.ops = {
>   		.enable = dsi_28nm_phy_enable,
>   		.disable = dsi_28nm_phy_disable,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9c7c49ce1200..cef801c58cdf 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1036,14 +1036,18 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   	DBG("DSI%d PHY disabled", phy->id);
>   }
>   
> +static const struct regulator_bulk_data dsi_phy_7nm_36mA_regulators[] = {
> +	{ .supply = "vdds", .init_load_uA = 36000 },
> +};
> +
> +static const struct regulator_bulk_data dsi_phy_7nm_37750uA_regulators[] = {
> +	{ .supply = "vdds", .init_load_uA = 37550 },
> +};
> +
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdds", 36000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_7nm_36mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_36mA_regulators),
>   	.ops = {
>   		.enable = dsi_7nm_phy_enable,
>   		.disable = dsi_7nm_phy_disable,
> @@ -1065,12 +1069,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdds", 36000},
> -		},
> -	},
> +	.regulator_data = dsi_phy_7nm_36mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_36mA_regulators),
>   	.ops = {
>   		.enable = dsi_7nm_phy_enable,
>   		.disable = dsi_7nm_phy_disable,
> @@ -1087,12 +1087,8 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>   
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
>   	.has_phy_lane = true,
> -	.reg_cfg = {
> -		.num = 1,
> -		.regs = {
> -			{"vdds", 37550},
> -		},
> -	},
> +	.regulator_data = dsi_phy_7nm_37750uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_37750uA_regulators),
>   	.ops = {
>   		.enable = dsi_7nm_phy_enable,
>   		.disable = dsi_7nm_phy_disable,
