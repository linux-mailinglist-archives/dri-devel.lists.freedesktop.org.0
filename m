Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D19F2C83
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDDE10E55A;
	Mon, 16 Dec 2024 09:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CubeFAJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22B10E555
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:00:53 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30225b2586cso51451441fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734339651; x=1734944451; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uTx1B6pXJlDecGHUxSfa038Fj9Ix66Vm46TNScUuzTk=;
 b=CubeFAJE3mPF1Bu58iUDNqSKL+ICbTktWRC8nT64VlLvw0tKZM55CJZ+9KrcEguy+A
 sPdS+6gIQgNdVidxVBkgSe6+P7kLZmenuCIyNGpwhnm89EAweyKMKJ9/DEK+MFMjnkQt
 77aBR7rqhxuzQO6pyxcwEjBmkhK7tadFVYxS8gHcsditEEGywVjD+CNNrZi3Zqqf2uhu
 XS1H6I9b/TNeYKfsDs0a1+pNmYzuNA+XoQMH0duDrqvN901gNDeW1tjkuJmCIGF2vceT
 MbCpf15qxk2wkP3jspaOfCfewLwca4aAWXo6h8HPR+RjelctlWojoF9q761NPZMGZ62W
 sTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734339651; x=1734944451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTx1B6pXJlDecGHUxSfa038Fj9Ix66Vm46TNScUuzTk=;
 b=ArAyIT3C/n5R2Vw2AYZ5MAkcXD+opdI9BlxBE8duisZYozYxr9SXQFEIcl9rGxwIbP
 5FbUln3oKxIL15MKEFhHc+TLVYc5uJomYfGJefynyV/ZN1GnVdaDsVP03z94pW8fjX9P
 iy/Mn4I5ZiO4kTeXWqV3cAP3r76ueSE3bMoQopijtYQCogb2X1wSNjH7CVI3U80+MzC7
 KO9wVbMUCP2oe0SLAdpz0eOVtsajWkUe/JKqCEcEO/b+ijx9Dubh28m3mqwNozViDZE0
 6laaC0OKX+BNpWw534yd5+eELwCm7WimrT12Kym1dj2/mDOTy9u9kJu59CvHO0eXvg8N
 vkTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjz2HSfjskHdGiLs+wYKsDQ0vmW5EBjv0v75/paaJOiys++knjq7zYYp1gU0gYen9uPA0waP2qVVU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1uT0lik8eVAeCjR/eGY3D1II0hKFBAwQKnqOWHpCpEtz3xRag
 DXRq3eQzVnmPQTFkTjuhYO6mCnv+q88pgnwWLh/7MCk4T4WoSlR/Elqx3Td0iGk=
X-Gm-Gg: ASbGnctUEY1i5Jqm1jL0LOlW9OEEz4iKp7zWYMi3nT/lIjR9ALaCxp/YPLfUd6egZmG
 prCowAOcEeUhZrgSX+Ilo1OrwphBpymHHuQvCdmbkRIs1lDxYTMRCtf2uuHWibPIKUUBmnN9848
 ZqoSOfan2IAjoovc3YLNXYhY7FORR63Sh9j+moSn+O5XcurKae5txkhQ744U5aK3mtC0P+KJAzy
 xep0yI+Dsq3/UfLTvNX9+o39lsf/JdWETMH0T9cms4LZBB2Jk/J/HWH2MVopJlABGpGX0MA0kjV
 D9GY1K9nyu3jI2q7jDx8LBS8XEi5UbSMfcqZ
X-Google-Smtp-Source: AGHT+IFTyqqrl0+YJybHIEXffnVkJ6udS+MW0l442LhR1iyjVYdsf1/iddGjehSxkpBocd5WJNd7Aw==
X-Received: by 2002:a05:651c:b10:b0:302:251a:bcfe with SMTP id
 38308e7fff4ca-302a4d0cadamr36099851fa.6.1734339651235; 
 Mon, 16 Dec 2024 01:00:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm8541391fa.125.2024.12.16.01.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:00:49 -0800 (PST)
Date: Mon, 16 Dec 2024 11:00:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 04/11] phy: phy-rockchip-samsung-hdptx: Add support
 for eDP mode
Message-ID: <3amy575wrx65kwf2kh5t2vx2f6vugq2bq3t6orpqlmbvnmq7oo@4mvt2lwgg3fh>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031225.3746-5-damon.ding@rock-chips.com>
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

On Mon, Dec 16, 2024 at 11:12:18AM +0800, Damon Ding wrote:
> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
> pre-emphasis configurations of each link rate have been verified according
> to the eDP 1.3 requirements.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Add the module author
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 937 +++++++++++++++++-
>  1 file changed, 894 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 9f084697dd05..8dd0de267d10 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -25,6 +25,7 @@
>  #define HDPTX_I_PLL_EN			BIT(7)
>  #define HDPTX_I_BIAS_EN			BIT(6)
>  #define HDPTX_I_BGR_EN			BIT(5)
> +#define HDPTX_MODE_SEL			BIT(0)
>  #define GRF_HDPTX_STATUS		0x80
>  #define HDPTX_O_PLL_LOCK_DONE		BIT(3)
>  #define HDPTX_O_PHY_CLK_RDY		BIT(2)
> @@ -44,6 +45,7 @@
>  #define LANE_REG(n)			HDTPX_REG(n, 0300, 062d)
>  
>  /* CMN_REG(0008) */
> +#define OVRD_LCPLL_EN_MASK		BIT(7)
>  #define LCPLL_EN_MASK			BIT(6)
>  #define LCPLL_LCVCO_MODE_EN_MASK	BIT(4)
>  /* CMN_REG(001e) */
> @@ -61,49 +63,110 @@
>  /* CMN_REG(002f) */
>  #define LCPLL_SDC_DENOMINATOR_MASK	GENMASK(7, 2)
>  #define LCPLL_SDC_NDIV_RSTN		BIT(0)
> +/* CMN_REG(003c) */
> +#define ANA_LCPLL_RESERVED7_MASK	BIT(7)
>  /* CMN_REG(003d) */
> +#define OVRD_ROPLL_EN_MASK		BIT(7)
> +#define ROPLL_EN_MASK			BIT(6)
>  #define ROPLL_LCVCO_EN			BIT(4)
> +/* CMN_REG(0046) */
> +#define ROPLL_ANA_CPP_CTRL_COARSE_MASK	GENMASK(7, 4)
> +#define ROPLL_ANA_CPP_CTRL_FINE_MASK	GENMASK(3, 0)
> +/* CMN_REG(0047) */
> +#define ROPLL_ANA_LPF_C_SEL_COARSE_MASK	GENMASK(5, 3)
> +#define ROPLL_ANA_LPF_C_SEL_FINE_MASK	GENMASK(2, 0)
>  /* CMN_REG(004e) */
>  #define ROPLL_PI_EN			BIT(5)
> +/* CMN_REG(0051) */
> +#define ROPLL_PMS_MDIV_MASK		GENMASK(7, 0)
> +/* CMN_REG(0055) */
> +#define ROPLL_PMS_MDIV_AFC_MASK		GENMASK(7, 0)
> +/* CMN_REG(0059) */
> +#define ANA_ROPLL_PMS_PDIV_MASK		GENMASK(7, 4)
> +#define ANA_ROPLL_PMS_REFDIV_MASK	GENMASK(3, 0)
> +/* CMN_REG(005a) */
> +#define ROPLL_PMS_SDIV_RBR_MASK		GENMASK(7, 4)
> +#define ROPLL_PMS_SDIV_HBR_MASK		GENMASK(3, 0)
> +/* CMN_REG(005b) */
> +#define ROPLL_PMS_SDIV_HBR2_MASK	GENMASK(7, 4)
>  /* CMN_REG(005c) */
>  #define ROPLL_PMS_IQDIV_RSTN		BIT(5)
>  /* CMN_REG(005e) */
>  #define ROPLL_SDM_EN_MASK		BIT(6)
> -#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
> -#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
> -#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
> -#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)

You have mixed the redefinition of existing bitfields with addition of
new ones. Please split them into separate patches: one for each of
corrections (be sure to specify Fixes tag as required), one for generic
renaming and one for the new platform and new registers / new bitfields)

> +#define OVRD_ROPLL_SDM_RSTN_MASK	BIT(5)
> +#define ROPLL_SDM_RSTN_MASK		BIT(4)
> +#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
> +#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
> +#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
> +/* CMN_REG(005f) */
> +#define OVRD_ROPLL_SDC_RSTN_MASK	BIT(5)
> +#define ROPLL_SDC_RSTN_MASK		BIT(4)
> +/* CMN_REG(0060)  */
> +#define ROPLL_SDM_DENOMINATOR_MASK	GENMASK(7, 0)
>  /* CMN_REG(0064) */
>  #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
> +#define ROPLL_SDM_NUM_SIGN_HBR_MASK	BIT(2)
> +#define ROPLL_SDM_NUM_SIGN_HBR2_MASK	BIT(1)
> +/* CMN_REG(0065) */
> +#define ROPLL_SDM_NUM_MASK		GENMASK(7, 0)
>  /* CMN_REG(0069) */
>  #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
> +/* CMN_REG(006a) */
> +#define ROPLL_SDC_N_HBR_MASK		GENMASK(5, 3)
> +#define ROPLL_SDC_N_HBR2_MASK		GENMASK(2, 0)
> +/* CMN_REG(006b) */
> +#define ROPLL_SDC_N_HBR3_MASK		GENMASK(3, 1)
> +/* CMN_REG(006c) */
> +#define ROPLL_SDC_NUM_MASK		GENMASK(5, 0)
> +/* cmn_reg0070 */
> +#define ROPLL_SDC_DENO_MASK		GENMASK(5, 0)
>  /* CMN_REG(0074) */
> -#define ROPLL_SDC_NDIV_RSTN		BIT(2)
> -#define ROPLL_SSC_EN			BIT(0)
> +#define OVRD_ROPLL_SDC_NDIV_RSTN_MASK	BIT(3)
> +#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
> +#define OVRD_ROPLL_SSC_EN_MASK		BIT(1)
> +#define ROPLL_SSC_EN_MASK		BIT(0)
> +/* CMN_REG(0075) */
> +#define ANA_ROPLL_SSC_FM_DEVIATION_MASK	GENMASK(5, 0)
> +/* CMN_REG(0076) */
> +#define ANA_ROPLL_SSC_FM_FREQ_MASK	GENMASK(6, 2)
> +/* CMN_REG(0077) */
> +#define ANA_ROPLL_SSC_CLK_DIV_SEL_MASK	GENMASK(6, 3)
>  /* CMN_REG(0081) */
> -#define OVRD_PLL_CD_CLK_EN		BIT(8)
> -#define PLL_CD_HSCLK_EAST_EN		BIT(0)
> +#define ANA_PLL_CD_TX_SER_RATE_SEL_MASK	BIT(3)
> +#define ANA_PLL_CD_HSCLK_WEST_EN_MASK	BIT(1)
> +#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
> +/* CMN_REG(0082) */
> +#define ANA_PLL_CD_VREG_GAIN_CTRL_MASK	GENMASK(3, 0)
> +/* CMN_REG(0083) */
> +#define ANA_PLL_CD_VREG_ICTRL_MASK	GENMASK(6, 5)
> +/* CMN_REG(0084) */
> +#define PLL_LCRO_CLK_SEL_MASK		BIT(5)
> +/* CMN_REG(0085) */
> +#define ANA_PLL_SYNC_LOSS_DET_MODE_MASK	GENMASK(1, 0)
>  /* CMN_REG(0086) */
>  #define PLL_PCG_POSTDIV_SEL_MASK	GENMASK(7, 4)
>  #define PLL_PCG_CLK_SEL_MASK		GENMASK(3, 1)
>  #define PLL_PCG_CLK_EN			BIT(0)
>  /* CMN_REG(0087) */
> -#define PLL_FRL_MODE_EN			BIT(3)
> -#define PLL_TX_HS_CLK_EN		BIT(2)
> +#define ANA_PLL_FRL_MODE_EN_MASK	BIT(3)
> +#define ANA_PLL_TX_HS_CLK_EN_MASK	BIT(2)
>  /* CMN_REG(0089) */
>  #define LCPLL_ALONE_MODE		BIT(1)
> +/* CMN_REG(0095) */
> +#define DP_TX_LINK_BW_MASK		GENMASK(1, 0)
>  /* CMN_REG(0097) */
> -#define DIG_CLK_SEL			BIT(1)
> -#define ROPLL_REF			BIT(1)
> -#define LCPLL_REF			0
> +#define DIG_CLK_SEL_MASK		BIT(1)
> +#define LCPLL_REF			BIT(1)
> +#define ROPLL_REF			0
>  /* CMN_REG(0099) */
> +#define SSC_EN_MASK			GENMASK(7, 6)
>  #define CMN_ROPLL_ALONE_MODE		BIT(2)
>  #define ROPLL_ALONE_MODE		BIT(2)
>  /* CMN_REG(009a) */
> -#define HS_SPEED_SEL			BIT(0)
> +#define HS_SPEED_SEL_MASK		BIT(0)
>  #define DIV_10_CLOCK			BIT(0)
>  /* CMN_REG(009b) */
> -#define IS_SPEED_SEL			BIT(4)
> +#define LS_SPEED_SEL_MASK		BIT(4)
>  #define LINK_SYMBOL_CLOCK		BIT(4)
>  #define LINK_SYMBOL_CLOCK1_2		0
>  
> @@ -118,6 +181,8 @@
>  /* SB_REG(0104) */
>  #define OVRD_SB_EN_MASK			BIT(5)
>  #define SB_EN_MASK			BIT(4)
> +#define OVRD_SB_AUX_EN_MASK		BIT(1)
> +#define SB_AUX_EN_MASK			BIT(0)
>  /* SB_REG(0105) */
>  #define OVRD_SB_EARC_CMDC_EN_MASK	BIT(6)
>  #define SB_EARC_CMDC_EN_MASK		BIT(5)
> @@ -126,6 +191,8 @@
>  #define ANA_SB_TX_LLVL_PROG_MASK	GENMASK(6, 4)
>  /* SB_REG(0109) */
>  #define ANA_SB_DMRX_AFC_DIV_RATIO_MASK	GENMASK(2, 0)
> +/* SB_REG(010d) */
> +#define ANA_SB_DMRX_LPBK_DATA_MASK	BIT(4)
>  /* SB_REG(010f) */
>  #define OVRD_SB_VREG_EN_MASK		BIT(7)
>  #define SB_VREG_EN_MASK			BIT(6)
> @@ -133,6 +200,7 @@
>  #define SB_VREG_LPF_BYPASS_MASK		BIT(4)
>  #define ANA_SB_VREG_GAIN_CTRL_MASK	GENMASK(3, 0)
>  /* SB_REG(0110) */
> +#define ANA_SB_VREG_OUT_SEL_MASK	BIT(1)
>  #define ANA_SB_VREG_REF_SEL_MASK	BIT(0)
>  /* SB_REG(0113) */
>  #define SB_RX_RCAL_OPT_CODE_MASK	GENMASK(5, 4)
> @@ -147,13 +215,24 @@
>  #define AFC_RSTN_DELAY_TIME_MASK	GENMASK(6, 4)
>  /* SB_REG(0117) */
>  #define FAST_PULSE_TIME_MASK		GENMASK(3, 0)
> +/* SB_REG(0118) */
> +#define SB_TG_EARC_DMRX_RECVRD_CLK_CNT_MASK	GENMASK(7, 0)
> +/* SB_REG(011a) */
> +#define SB_TG_CNT_RUN_NO_7_0_MASK	GENMASK(7, 0)
>  /* SB_REG(011b) */
>  #define SB_EARC_SIG_DET_BYPASS_MASK	BIT(4)
>  #define SB_AFC_TOL_MASK			GENMASK(3, 0)
> +/* SB_REG(011c) */
> +#define SB_AFC_STB_NUM_MASK		GENMASK(3, 0)
> +/* SB_REG(011d) */
> +#define SB_TG_OSC_CNT_MIN_MASK		GENMASK(7, 0)
> +/* SB_REG(011e) */
> +#define SB_TG_OSC_CNT_MAX_MASK		GENMASK(7, 0)
>  /* SB_REG(011f) */
>  #define SB_PWM_AFC_CTRL_MASK		GENMASK(7, 2)
>  #define SB_RCAL_RSTN_MASK		BIT(1)
>  /* SB_REG(0120) */
> +#define SB_AUX_EN_IN_MASK		BIT(7)
>  #define SB_EARC_EN_MASK			BIT(1)
>  #define SB_EARC_AFC_EN_MASK		BIT(2)
>  /* SB_REG(0123) */
> @@ -165,35 +244,65 @@
>  #define HDMI_MODE			BIT(2)
>  #define HDMI_TMDS_FRL_SEL		BIT(1)
>  /* LNTOP_REG(0206) */
> -#define DATA_BUS_SEL			BIT(0)
> +#define DATA_BUS_WIDTH_MASK		GENMASK(2, 1)
> +#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
>  #define DATA_BUS_36_40			BIT(0)
>  /* LNTOP_REG(0207) */
>  #define LANE_EN				0xf
>  #define ALL_LANE_EN			0xf
>  
> -/* LANE_REG(0312) */
> -#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
> -/* LANE_REG(0412) */
> -#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
> -/* LANE_REG(0512) */
> -#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
> -/* LANE_REG(0612) */
> -#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
> +/* LANE_REG(0301) */
> +#define OVRD_LN_TX_DRV_EI_EN_MASK	BIT(7)
> +#define LN_TX_DRV_EI_EN_MASK		BIT(6)
> +/* LANE_REG(0303) */
> +#define OVRD_LN_TX_DRV_LVL_CTRL_MASK	BIT(5)
> +#define LN_TX_DRV_LVL_CTRL_MASK		GENMASK(4, 0)
> +/* LANE_REG(0304)  */
> +#define OVRD_LN_TX_DRV_POST_LVL_CTRL_MASK	BIT(4)
> +#define LN_TX_DRV_POST_LVL_CTRL_MASK	GENMASK(3, 0)
> +/* LANE_REG(0305) */
> +#define OVRD_LN_TX_DRV_PRE_LVL_CTRL_MASK	BIT(6)
> +#define LN_TX_DRV_PRE_LVL_CTRL_MASK	GENMASK(5, 2)
> +/* LANE_REG(0306) */
> +#define LN_ANA_TX_DRV_IDRV_IDN_CTRL_MASK	GENMASK(7, 5)
> +#define LN_ANA_TX_DRV_IDRV_IUP_CTRL_MASK	GENMASK(4, 2)
> +#define LN_ANA_TX_DRV_ACCDRV_EN_MASK	BIT(0)
> +/* LANE_REG(0307) */
> +#define LN_ANA_TX_DRV_ACCDRV_POL_SEL_MASK	BIT(6)
> +#define LN_ANA_TX_DRV_ACCDRV_CTRL_MASK	GENMASK(5, 3)
> +/* LANE_REG(030a) */
> +#define LN_ANA_TX_JEQ_EN_MASK		BIT(4)
> +#define LN_TX_JEQ_EVEN_CTRL_RBR_MASK	GENMASK(3, 0)
> +/* LANE_REG(030b) */
> +#define LN_TX_JEQ_EVEN_CTRL_HBR_MASK	GENMASK(7, 4)
> +#define LN_TX_JEQ_EVEN_CTRL_HBR2_MASK	GENMASK(3, 0)
> +/* LANE_REG(030c) */
> +#define LN_TX_JEQ_ODD_CTRL_RBR_MASK	GENMASK(3, 0)
> +/* LANE_REG(030d) */
> +#define LN_TX_JEQ_ODD_CTRL_HBR_MASK	GENMASK(7, 4)
> +#define LN_TX_JEQ_ODD_CTRL_HBR2_MASK	GENMASK(3, 0)
> +/* LANE_REG(0310) */
> +#define LN_ANA_TX_SYNC_LOSS_DET_MODE_MASK	GENMASK(1, 0)
> +/* LANE_REG(0311) */
> +#define LN_TX_SER_40BIT_EN_RBR_MASK	BIT(3)
> +#define LN_TX_SER_40BIT_EN_HBR_MASK	BIT(2)
> +#define LN_TX_SER_40BIT_EN_HBR2_MASK	BIT(1)
> +/* LANE_REG(0316) */
> +#define LN_ANA_TX_SER_VREG_GAIN_CTRL_MASK	GENMASK(3, 0)
> +/* LANE_REG(031B) */
> +#define LN_ANA_TX_RESERVED_MASK		GENMASK(7, 0)
> +/* LANE_REG(031e) */
> +#define LN_POLARITY_INV_MASK		BIT(2)
> +#define LN_LANE_MODE_MASK		BIT(1)
>  
>  #define HDMI20_MAX_RATE			600000000
>  
> +enum dp_link_rate {
> +	DP_BW_RBR,
> +	DP_BW_HBR,
> +	DP_BW_HBR2,
> +};
> +
>  struct lcpll_config {
>  	u32 bit_rate;
>  	u8 lcvco_mode_en;
> @@ -255,6 +364,19 @@ struct ropll_config {
>  	u8 cd_tx_ser_rate_sel;
>  };
>  
> +struct tx_drv_ctrl {
> +	u8 tx_drv_lvl_ctrl;
> +	u8 tx_drv_post_lvl_ctrl;
> +	u8 ana_tx_drv_idrv_idn_ctrl;
> +	u8 ana_tx_drv_idrv_iup_ctrl;
> +	u8 ana_tx_drv_accdrv_en;
> +	u8 ana_tx_drv_accdrv_ctrl;
> +	u8 tx_drv_pre_lvl_ctrl;
> +	u8 ana_tx_jeq_en;
> +	u8 tx_jeq_even_ctrl;
> +	u8 tx_jeq_odd_ctrl;
> +};
> +
>  enum rk_hdptx_reset {
>  	RST_PHY = 0,
>  	RST_APB,
> @@ -560,6 +682,90 @@ static const struct reg_sequence rk_hdtpx_tmds_lane_init_seq[] = {
>  	REG_SEQ0(LANE_REG(0606), 0x1c),
>  };
>  
> +static struct tx_drv_ctrl tx_drv_ctrl_rbr[4][4] = {
> +	/* voltage swing 0, pre-emphasis 0->3 */
> +	{
> +		{ 0x2, 0x0, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0x4, 0x3, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0x7, 0x6, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xd, 0xc, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 1, pre-emphasis 0->2 */
> +	{
> +		{ 0x4, 0x0, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0x9, 0x5, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xc, 0x8, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 2, pre-emphasis 0->1 */
> +	{
> +		{ 0x8, 0x0, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0xc, 0x5, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 3, pre-emphasis 0 */
> +	{
> +		{ 0xb, 0x0, 0x7, 0x7, 0x1, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +	}
> +};
> +
> +static struct tx_drv_ctrl tx_drv_ctrl_hbr[4][4] = {
> +	/* voltage swing 0, pre-emphasis 0->3 */
> +	{
> +		{ 0x2, 0x0, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0x5, 0x4, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0x9, 0x8, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xd, 0xc, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 1, pre-emphasis 0->2 */
> +	{
> +		{ 0x6, 0x1, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0xa, 0x6, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xc, 0x8, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 2, pre-emphasis 0->1 */
> +	{
> +		{ 0x9, 0x1, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0xd, 0x6, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 3, pre-emphasis 0 */
> +	{
> +		{ 0xc, 0x1, 0x7, 0x7, 0x1, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +	}
> +};
> +
> +static struct tx_drv_ctrl tx_drv_ctrl_hbr2[4][4] = {
> +	/* voltage swing 0, pre-emphasis 0->3 */
> +	{
> +		{ 0x2, 0x1, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0x5, 0x4, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0x9, 0x8, 0x4, 0x6, 0x1, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xd, 0xc, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 1, pre-emphasis 0->2 */
> +	{
> +		{ 0x6, 0x1, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0xb, 0x7, 0x4, 0x6, 0x0, 0x4, 0x0, 0x1, 0x7, 0x7 },
> +		{ 0xd, 0x9, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 2, pre-emphasis 0->1 */
> +	{
> +		{ 0x8, 0x1, 0x4, 0x6, 0x0, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +		{ 0xc, 0x6, 0x7, 0x7, 0x1, 0x7, 0x0, 0x1, 0x7, 0x7 },
> +	},
> +
> +	/* voltage swing 3, pre-emphasis 0 */
> +	{
> +		{ 0xb, 0x0, 0x7, 0x7, 0x1, 0x4, 0x1, 0x1, 0x7, 0x7 },
> +	}
> +};
> +
>  static bool rk_hdptx_phy_is_rw_reg(struct device *dev, unsigned int reg)
>  {
>  	switch (reg) {
> @@ -911,11 +1117,297 @@ static int rk_hdptx_phy_consumer_put(struct rk_hdptx_phy *hdptx, bool force)
>  	return ret;
>  }
>  
> +static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
> +{
> +	reset_control_assert(hdptx->rsts[RST_LANE].rstc);
> +	reset_control_assert(hdptx->rsts[RST_CMN].rstc);
> +	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
> +
> +	reset_control_assert(hdptx->rsts[RST_APB].rstc);
> +	udelay(10);
> +	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0301),
> +			   OVRD_LN_TX_DRV_EI_EN_MASK | LN_TX_DRV_EI_EN_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_EI_EN_MASK, 1) |
> +			   FIELD_PREP(LN_TX_DRV_EI_EN_MASK, 0));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0401),
> +			   OVRD_LN_TX_DRV_EI_EN_MASK | LN_TX_DRV_EI_EN_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_EI_EN_MASK, 1) |
> +			   FIELD_PREP(LN_TX_DRV_EI_EN_MASK, 0));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0501),
> +			   OVRD_LN_TX_DRV_EI_EN_MASK | LN_TX_DRV_EI_EN_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_EI_EN_MASK, 1) |
> +			   FIELD_PREP(LN_TX_DRV_EI_EN_MASK, 0));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0601),
> +			   OVRD_LN_TX_DRV_EI_EN_MASK | LN_TX_DRV_EI_EN_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_EI_EN_MASK, 1) |
> +			   FIELD_PREP(LN_TX_DRV_EI_EN_MASK, 0));
> +
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x0));
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_BIAS_EN << 16 | FIELD_PREP(HDPTX_I_BIAS_EN, 0x0));
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x0));
> +}
> +
> +static void rk_hdptx_dp_pll_init(struct rk_hdptx_phy *hdptx)
> +{
> +	regmap_update_bits(hdptx->regmap, CMN_REG(003c), ANA_LCPLL_RESERVED7_MASK,
> +			   FIELD_PREP(ANA_LCPLL_RESERVED7_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0046),
> +			   ROPLL_ANA_CPP_CTRL_COARSE_MASK | ROPLL_ANA_CPP_CTRL_FINE_MASK,
> +			   FIELD_PREP(ROPLL_ANA_CPP_CTRL_COARSE_MASK, 0xe) |
> +			   FIELD_PREP(ROPLL_ANA_CPP_CTRL_FINE_MASK, 0xe));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0047),
> +			   ROPLL_ANA_LPF_C_SEL_COARSE_MASK |
> +			   ROPLL_ANA_LPF_C_SEL_FINE_MASK,
> +			   FIELD_PREP(ROPLL_ANA_LPF_C_SEL_COARSE_MASK, 0x4) |
> +			   FIELD_PREP(ROPLL_ANA_LPF_C_SEL_FINE_MASK, 0x4));
> +
> +	regmap_write(hdptx->regmap, CMN_REG(0051), FIELD_PREP(ROPLL_PMS_MDIV_MASK, 0x87));
> +	regmap_write(hdptx->regmap, CMN_REG(0052), FIELD_PREP(ROPLL_PMS_MDIV_MASK, 0x71));
> +	regmap_write(hdptx->regmap, CMN_REG(0053), FIELD_PREP(ROPLL_PMS_MDIV_MASK, 0x71));
> +
> +	regmap_write(hdptx->regmap, CMN_REG(0055),
> +		     FIELD_PREP(ROPLL_PMS_MDIV_AFC_MASK, 0x87));
> +	regmap_write(hdptx->regmap, CMN_REG(0056),
> +		     FIELD_PREP(ROPLL_PMS_MDIV_AFC_MASK, 0x71));
> +	regmap_write(hdptx->regmap, CMN_REG(0057),
> +		     FIELD_PREP(ROPLL_PMS_MDIV_AFC_MASK, 0x71));
> +
> +	regmap_write(hdptx->regmap, CMN_REG(0059),
> +		     FIELD_PREP(ANA_ROPLL_PMS_PDIV_MASK, 0x1) |
> +		     FIELD_PREP(ANA_ROPLL_PMS_REFDIV_MASK, 0x1));
> +	regmap_write(hdptx->regmap, CMN_REG(005a),
> +		     FIELD_PREP(ROPLL_PMS_SDIV_RBR_MASK, 0x3) |
> +		     FIELD_PREP(ROPLL_PMS_SDIV_HBR_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005b), ROPLL_PMS_SDIV_HBR2_MASK,
> +			   FIELD_PREP(ROPLL_PMS_SDIV_HBR2_MASK, 0x0));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005e), ROPLL_SDM_EN_MASK,
> +			   FIELD_PREP(ROPLL_SDM_EN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005e),
> +			   OVRD_ROPLL_SDM_RSTN_MASK | ROPLL_SDM_RSTN_MASK,
> +			   FIELD_PREP(OVRD_ROPLL_SDM_RSTN_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_SDM_RSTN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005e), ROPLL_SDC_FRAC_EN_RBR_MASK,
> +			   FIELD_PREP(ROPLL_SDC_FRAC_EN_RBR_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005e), ROPLL_SDC_FRAC_EN_HBR_MASK,
> +			   FIELD_PREP(ROPLL_SDC_FRAC_EN_HBR_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005e), ROPLL_SDC_FRAC_EN_HBR2_MASK,
> +			   FIELD_PREP(ROPLL_SDC_FRAC_EN_HBR2_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(005f),
> +			   OVRD_ROPLL_SDC_RSTN_MASK | ROPLL_SDC_RSTN_MASK,
> +			   FIELD_PREP(OVRD_ROPLL_SDC_RSTN_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_SDC_RSTN_MASK, 0x1));
> +	regmap_write(hdptx->regmap, CMN_REG(0060),
> +		     FIELD_PREP(ROPLL_SDM_DENOMINATOR_MASK, 0x21));
> +	regmap_write(hdptx->regmap, CMN_REG(0061),
> +		     FIELD_PREP(ROPLL_SDM_DENOMINATOR_MASK, 0x27));
> +	regmap_write(hdptx->regmap, CMN_REG(0062),
> +		     FIELD_PREP(ROPLL_SDM_DENOMINATOR_MASK, 0x27));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0064),
> +			   ROPLL_SDM_NUM_SIGN_RBR_MASK |
> +			   ROPLL_SDM_NUM_SIGN_HBR_MASK |
> +			   ROPLL_SDM_NUM_SIGN_HBR2_MASK,
> +			   FIELD_PREP(ROPLL_SDM_NUM_SIGN_RBR_MASK, 0x0) |
> +			   FIELD_PREP(ROPLL_SDM_NUM_SIGN_HBR_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_SDM_NUM_SIGN_HBR2_MASK, 0x1));
> +	regmap_write(hdptx->regmap, CMN_REG(0065),
> +		     FIELD_PREP(ROPLL_SDM_NUM_MASK, 0x0));
> +	regmap_write(hdptx->regmap, CMN_REG(0066),
> +		     FIELD_PREP(ROPLL_SDM_NUM_MASK, 0xd));
> +	regmap_write(hdptx->regmap, CMN_REG(0067),
> +		     FIELD_PREP(ROPLL_SDM_NUM_MASK, 0xd));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0069), ROPLL_SDC_N_RBR_MASK,
> +			   FIELD_PREP(ROPLL_SDC_N_RBR_MASK, 0x2));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(006a),
> +			   ROPLL_SDC_N_HBR_MASK | ROPLL_SDC_N_HBR2_MASK,
> +			   FIELD_PREP(ROPLL_SDC_N_HBR_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_SDC_N_HBR2_MASK, 0x1));
> +
> +	regmap_write(hdptx->regmap, CMN_REG(006c),
> +		     FIELD_PREP(ROPLL_SDC_NUM_MASK, 0x3));
> +	regmap_write(hdptx->regmap, CMN_REG(006d),
> +		     FIELD_PREP(ROPLL_SDC_NUM_MASK, 0x7));
> +	regmap_write(hdptx->regmap, CMN_REG(006e),
> +		     FIELD_PREP(ROPLL_SDC_NUM_MASK, 0x7));
> +
> +	regmap_write(hdptx->regmap, CMN_REG(0070),
> +		     FIELD_PREP(ROPLL_SDC_DENO_MASK, 0x8));
> +	regmap_write(hdptx->regmap, CMN_REG(0071),
> +		     FIELD_PREP(ROPLL_SDC_DENO_MASK, 0x18));
> +	regmap_write(hdptx->regmap, CMN_REG(0072),
> +		     FIELD_PREP(ROPLL_SDC_DENO_MASK, 0x18));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0074),
> +			   OVRD_ROPLL_SDC_NDIV_RSTN_MASK | ROPLL_SDC_NDIV_RSTN_MASK,
> +			   FIELD_PREP(OVRD_ROPLL_SDC_NDIV_RSTN_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_SDC_NDIV_RSTN_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0077), ANA_ROPLL_SSC_CLK_DIV_SEL_MASK,
> +			   FIELD_PREP(ANA_ROPLL_SSC_CLK_DIV_SEL_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0081), ANA_PLL_CD_TX_SER_RATE_SEL_MASK,
> +			   FIELD_PREP(ANA_PLL_CD_TX_SER_RATE_SEL_MASK, 0x0));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0081),
> +			   ANA_PLL_CD_HSCLK_EAST_EN_MASK | ANA_PLL_CD_HSCLK_WEST_EN_MASK,
> +			   FIELD_PREP(ANA_PLL_CD_HSCLK_EAST_EN_MASK, 0x1) |
> +			   FIELD_PREP(ANA_PLL_CD_HSCLK_WEST_EN_MASK, 0x0));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0082), ANA_PLL_CD_VREG_GAIN_CTRL_MASK,
> +			   FIELD_PREP(ANA_PLL_CD_VREG_GAIN_CTRL_MASK, 0x4));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0083), ANA_PLL_CD_VREG_ICTRL_MASK,
> +			   FIELD_PREP(ANA_PLL_CD_VREG_ICTRL_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0084), PLL_LCRO_CLK_SEL_MASK,
> +			   FIELD_PREP(PLL_LCRO_CLK_SEL_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0085), ANA_PLL_SYNC_LOSS_DET_MODE_MASK,
> +			   FIELD_PREP(ANA_PLL_SYNC_LOSS_DET_MODE_MASK, 0x3));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0087), ANA_PLL_TX_HS_CLK_EN_MASK,
> +			   FIELD_PREP(ANA_PLL_TX_HS_CLK_EN_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0097), DIG_CLK_SEL_MASK,
> +			   FIELD_PREP(DIG_CLK_SEL_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0099), CMN_ROPLL_ALONE_MODE,
> +			   FIELD_PREP(CMN_ROPLL_ALONE_MODE, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(009a), HS_SPEED_SEL_MASK,
> +			   FIELD_PREP(HS_SPEED_SEL_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, CMN_REG(009b), LS_SPEED_SEL_MASK,
> +			   FIELD_PREP(LS_SPEED_SEL_MASK, 0x1));
> +}
> +
> +static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
> +{
> +	u32 status;
> +	int ret;
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(0102), ANA_SB_RXTERM_OFFSP_MASK,
> +			   FIELD_PREP(ANA_SB_RXTERM_OFFSP_MASK, 0x3));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0103), ANA_SB_RXTERM_OFFSN_MASK,
> +			   FIELD_PREP(ANA_SB_RXTERM_OFFSN_MASK, 0x3));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0104), SB_AUX_EN_MASK,
> +			   FIELD_PREP(SB_AUX_EN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0105), ANA_SB_TX_HLVL_PROG_MASK,
> +			   FIELD_PREP(ANA_SB_TX_HLVL_PROG_MASK, 0x7));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0106), ANA_SB_TX_LLVL_PROG_MASK,
> +			   FIELD_PREP(ANA_SB_TX_LLVL_PROG_MASK, 0x7));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(010d), ANA_SB_DMRX_LPBK_DATA_MASK,
> +			   FIELD_PREP(ANA_SB_DMRX_LPBK_DATA_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(010f), ANA_SB_VREG_GAIN_CTRL_MASK,
> +			   FIELD_PREP(ANA_SB_VREG_GAIN_CTRL_MASK, 0x0));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0110),
> +			   ANA_SB_VREG_OUT_SEL_MASK | ANA_SB_VREG_REF_SEL_MASK,
> +			   FIELD_PREP(ANA_SB_VREG_OUT_SEL_MASK, 0x1) |
> +			   FIELD_PREP(ANA_SB_VREG_REF_SEL_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(0113),
> +			   SB_RX_RCAL_OPT_CODE_MASK | SB_RX_RTERM_CTRL_MASK,
> +			   FIELD_PREP(SB_RX_RCAL_OPT_CODE_MASK, 0x1) |
> +			   FIELD_PREP(SB_RX_RTERM_CTRL_MASK, 0x3));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0114),
> +			   SB_TG_SB_EN_DELAY_TIME_MASK | SB_TG_RXTERM_EN_DELAY_TIME_MASK,
> +			   FIELD_PREP(SB_TG_SB_EN_DELAY_TIME_MASK, 0x2) |
> +			   FIELD_PREP(SB_TG_RXTERM_EN_DELAY_TIME_MASK, 0x2));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0115),
> +			   SB_READY_DELAY_TIME_MASK | SB_TG_OSC_EN_DELAY_TIME_MASK,
> +			   FIELD_PREP(SB_READY_DELAY_TIME_MASK, 0x2) |
> +			   FIELD_PREP(SB_TG_OSC_EN_DELAY_TIME_MASK, 0x2));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0116),
> +			   AFC_RSTN_DELAY_TIME_MASK,
> +			   FIELD_PREP(AFC_RSTN_DELAY_TIME_MASK, 0x2));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0117),
> +			   FAST_PULSE_TIME_MASK,
> +			   FIELD_PREP(FAST_PULSE_TIME_MASK, 0x4));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0118),
> +			   SB_TG_EARC_DMRX_RECVRD_CLK_CNT_MASK,
> +			   FIELD_PREP(SB_TG_EARC_DMRX_RECVRD_CLK_CNT_MASK, 0xa));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(011a), SB_TG_CNT_RUN_NO_7_0_MASK,
> +			   FIELD_PREP(SB_TG_CNT_RUN_NO_7_0_MASK, 0x3));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011b),
> +			   SB_EARC_SIG_DET_BYPASS_MASK | SB_AFC_TOL_MASK,
> +			   FIELD_PREP(SB_EARC_SIG_DET_BYPASS_MASK, 0x1) |
> +			   FIELD_PREP(SB_AFC_TOL_MASK, 0x3));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011c), SB_AFC_STB_NUM_MASK,
> +			   FIELD_PREP(SB_AFC_STB_NUM_MASK, 0x4));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011d), SB_TG_OSC_CNT_MIN_MASK,
> +			   FIELD_PREP(SB_TG_OSC_CNT_MIN_MASK, 0x67));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011e), SB_TG_OSC_CNT_MAX_MASK,
> +			   FIELD_PREP(SB_TG_OSC_CNT_MAX_MASK, 0x6a));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011f), SB_PWM_AFC_CTRL_MASK,
> +			   FIELD_PREP(SB_PWM_AFC_CTRL_MASK, 0x5));
> +	regmap_update_bits(hdptx->regmap, SB_REG(011f), SB_RCAL_RSTN_MASK,
> +			   FIELD_PREP(SB_RCAL_RSTN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0120), SB_AUX_EN_IN_MASK,
> +			   FIELD_PREP(SB_AUX_EN_IN_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(0102), OVRD_SB_RXTERM_EN_MASK,
> +			   FIELD_PREP(OVRD_SB_RXTERM_EN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0103), OVRD_SB_RX_RESCAL_DONE_MASK,
> +			   FIELD_PREP(OVRD_SB_RX_RESCAL_DONE_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0104), OVRD_SB_EN_MASK,
> +			   FIELD_PREP(OVRD_SB_EN_MASK, 0x1));
> +	regmap_update_bits(hdptx->regmap, SB_REG(0104), OVRD_SB_AUX_EN_MASK,
> +			   FIELD_PREP(OVRD_SB_AUX_EN_MASK, 0x1));
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(010f), OVRD_SB_VREG_EN_MASK,
> +			   FIELD_PREP(OVRD_SB_VREG_EN_MASK, 0x1));
> +
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_BGR_EN << 16 | FIELD_PREP(HDPTX_I_BGR_EN, 0x1));
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_BIAS_EN << 16 | FIELD_PREP(HDPTX_I_BIAS_EN, 0x1));
> +	usleep_range(20, 25);
> +
> +	reset_control_deassert(hdptx->rsts[RST_INIT].rstc);
> +	usleep_range(20, 25);
> +	reset_control_deassert(hdptx->rsts[RST_CMN].rstc);
> +	usleep_range(20, 25);
> +
> +	regmap_update_bits(hdptx->regmap, SB_REG(0103), OVRD_SB_RX_RESCAL_DONE_MASK,
> +			   FIELD_PREP(OVRD_SB_RX_RESCAL_DONE_MASK, 0x1));
> +	usleep_range(100, 110);
> +	regmap_update_bits(hdptx->regmap, SB_REG(0104), SB_EN_MASK,
> +			   FIELD_PREP(SB_EN_MASK, 0x1));
> +	usleep_range(100, 110);
> +	regmap_update_bits(hdptx->regmap, SB_REG(0102), SB_RXTERM_EN_MASK,
> +			   FIELD_PREP(SB_RXTERM_EN_MASK, 0x1));
> +	usleep_range(20, 25);
> +	regmap_update_bits(hdptx->regmap, SB_REG(010f), SB_VREG_EN_MASK,
> +			   FIELD_PREP(SB_VREG_EN_MASK, 0x1));
> +	usleep_range(20, 25);
> +	regmap_update_bits(hdptx->regmap, SB_REG(0104), SB_AUX_EN_MASK,
> +			   FIELD_PREP(SB_AUX_EN_MASK, 0x1));
> +	usleep_range(100, 110);
> +
> +	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS,
> +				       status, FIELD_GET(HDPTX_O_SB_RDY, status),
> +				       50, 1000);
> +	if (ret) {
> +		dev_err(hdptx->dev, "Failed to get phy sb ready: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rk_hdptx_phy_power_on(struct phy *phy)
>  {
>  	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
>  	int bus_width = phy_get_bus_width(hdptx->phy);
> -	int ret;
> +	enum phy_mode mode = phy_get_mode(phy);
> +	int ret, lane;
>  
>  	/*
>  	 * FIXME: Temporary workaround to pass pixel_clk_rate
> @@ -927,13 +1419,43 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>  	dev_dbg(hdptx->dev, "%s bus_width=%x rate=%u\n",
>  		__func__, bus_width, rate);
>  
> -	ret = rk_hdptx_phy_consumer_get(hdptx, rate);
> -	if (ret)
> -		return ret;
> +	if (mode == PHY_MODE_DP) {
> +		rk_hdptx_dp_reset(hdptx);
>  
> -	ret = rk_hdptx_ropll_tmds_mode_config(hdptx, rate);
> -	if (ret)
> -		rk_hdptx_phy_consumer_put(hdptx, true);
> +		for (lane = 0; lane < 4; lane++) {
> +			regmap_update_bits(hdptx->regmap, LANE_REG(031e) + 0x400 * lane,
> +					   LN_POLARITY_INV_MASK | LN_LANE_MODE_MASK,
> +					   FIELD_PREP(LN_POLARITY_INV_MASK, 0) |
> +					   FIELD_PREP(LN_LANE_MODE_MASK, 1));
> +		}
> +
> +		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x1));
> +
> +		regmap_update_bits(hdptx->regmap, LNTOP_REG(0200), PROTOCOL_SEL,
> +				   FIELD_PREP(PROTOCOL_SEL, 0x0));
> +		regmap_update_bits(hdptx->regmap, LNTOP_REG(0206), DATA_BUS_WIDTH_MASK,
> +				   FIELD_PREP(DATA_BUS_WIDTH_MASK, 0x1));
> +		regmap_update_bits(hdptx->regmap, LNTOP_REG(0206), DATA_BUS_WIDTH_SEL_MASK,
> +				   FIELD_PREP(DATA_BUS_WIDTH_SEL_MASK, 0x0));
> +
> +		rk_hdptx_dp_pll_init(hdptx);
> +
> +		ret = rk_hdptx_dp_aux_init(hdptx);
> +		if (ret)
> +			pm_runtime_put(hdptx->dev);
> +	} else {
> +		regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +			     HDPTX_MODE_SEL << 16 | FIELD_PREP(HDPTX_MODE_SEL, 0x0));
> +
> +		ret = rk_hdptx_phy_consumer_get(hdptx, rate);
> +		if (ret)
> +			return ret;
> +
> +		ret = rk_hdptx_ropll_tmds_mode_config(hdptx, rate);
> +		if (ret)
> +			rk_hdptx_phy_consumer_put(hdptx, true);
> +	}
>  
>  	return ret;
>  }
> @@ -945,9 +1467,337 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>  	return rk_hdptx_phy_consumer_put(hdptx, false);
>  }
>  
> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> +				 int submode)
> +{
> +	return 0;
> +}
> +
> +static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
> +				      struct phy_configure_opts_dp *dp)
> +{
> +	int i;
> +
> +	if (dp->set_rate) {
> +		switch (dp->link_rate) {
> +		case 1620:
> +		case 2700:
> +		case 5400:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_lanes) {
> +		switch (dp->lanes) {
> +		case 0:
> +		case 1:
> +		case 2:
> +		case 4:
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (dp->set_voltages) {
> +		for (i = 0; i < dp->lanes; i++) {
> +			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
> +				return -EINVAL;
> +
> +			if (dp->voltage[i] + dp->pre[i] > 3)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk_hdptx_phy_set_rate(struct rk_hdptx_phy *hdptx,
> +				 struct phy_configure_opts_dp *dp)
> +{
> +	u32 bw, status;
> +	int ret;
> +
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x0));
> +
> +	switch (dp->link_rate) {
> +	case 1620:
> +		bw = DP_BW_RBR;
> +		break;
> +	case 2700:
> +		bw = DP_BW_HBR;
> +		break;
> +	case 5400:
> +		bw = DP_BW_HBR2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0008), OVRD_LCPLL_EN_MASK | LCPLL_EN_MASK,
> +			   FIELD_PREP(OVRD_LCPLL_EN_MASK, 0x1) |
> +			   FIELD_PREP(LCPLL_EN_MASK, 0x0));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(003d), OVRD_ROPLL_EN_MASK | ROPLL_EN_MASK,
> +			   FIELD_PREP(OVRD_ROPLL_EN_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_EN_MASK, 0x1));
> +
> +	if (dp->ssc) {
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0074),
> +				   OVRD_ROPLL_SSC_EN_MASK | ROPLL_SSC_EN_MASK,
> +				   FIELD_PREP(OVRD_ROPLL_SSC_EN_MASK, 0x1) |
> +				   FIELD_PREP(ROPLL_SSC_EN_MASK, 0x1));
> +		regmap_write(hdptx->regmap, CMN_REG(0075),
> +			     FIELD_PREP(ANA_ROPLL_SSC_FM_DEVIATION_MASK, 0xc));
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0076),
> +				   ANA_ROPLL_SSC_FM_FREQ_MASK,
> +				   FIELD_PREP(ANA_ROPLL_SSC_FM_FREQ_MASK, 0x1f));
> +
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0099), SSC_EN_MASK,
> +				   FIELD_PREP(SSC_EN_MASK, 0x2));
> +	} else {
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0074),
> +				   OVRD_ROPLL_SSC_EN_MASK | ROPLL_SSC_EN_MASK,
> +				   FIELD_PREP(OVRD_ROPLL_SSC_EN_MASK, 0x1) |
> +				   FIELD_PREP(ROPLL_SSC_EN_MASK, 0x0));
> +		regmap_write(hdptx->regmap, CMN_REG(0075),
> +			     FIELD_PREP(ANA_ROPLL_SSC_FM_DEVIATION_MASK, 0x20));
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0076),
> +				   ANA_ROPLL_SSC_FM_FREQ_MASK,
> +				   FIELD_PREP(ANA_ROPLL_SSC_FM_FREQ_MASK, 0xc));
> +
> +		regmap_update_bits(hdptx->regmap, CMN_REG(0099), SSC_EN_MASK,
> +				   FIELD_PREP(SSC_EN_MASK, 0x0));
> +	}
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0095), DP_TX_LINK_BW_MASK,
> +			   FIELD_PREP(DP_TX_LINK_BW_MASK, bw));
> +
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x1));
> +
> +	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS,
> +				       status, FIELD_GET(HDPTX_O_PLL_LOCK_DONE, status),
> +				       50, 1000);
> +	if (ret) {
> +		dev_err(hdptx->dev, "Failed to get phy pll lock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rk_hdptx_phy_lane_disable(struct rk_hdptx_phy *hdptx)
> +{
> +	reset_control_assert(hdptx->rsts[RST_LANE].rstc);
> +
> +	regmap_update_bits(hdptx->regmap, LNTOP_REG(0207), LANE_EN,
> +			   FIELD_PREP(LANE_EN, 0x0));
> +
> +	regmap_write(hdptx->grf, GRF_HDPTX_CON0,
> +		     HDPTX_I_PLL_EN << 16 | FIELD_PREP(HDPTX_I_PLL_EN, 0x0));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(0008), OVRD_LCPLL_EN_MASK | LCPLL_EN_MASK,
> +			   FIELD_PREP(OVRD_LCPLL_EN_MASK, 0x1) |
> +			   FIELD_PREP(LCPLL_EN_MASK, 0x0));
> +
> +	regmap_update_bits(hdptx->regmap, CMN_REG(003d), OVRD_ROPLL_EN_MASK | ROPLL_EN_MASK,
> +			   FIELD_PREP(OVRD_ROPLL_EN_MASK, 0x1) |
> +			   FIELD_PREP(ROPLL_EN_MASK, 0x0));
> +}
> +
> +static int rk_hdptx_phy_set_lanes(struct rk_hdptx_phy *hdptx,
> +				  struct phy_configure_opts_dp *dp)
> +{
> +	if (!dp->lanes) {
> +		rk_hdptx_phy_lane_disable(hdptx);
> +		return 0;
> +	}
> +
> +	regmap_update_bits(hdptx->regmap, LNTOP_REG(0207), LANE_EN,
> +			   FIELD_PREP(LANE_EN, GENMASK(dp->lanes - 1, 0)));
> +
> +	return 0;
> +}
> +
> +static void rk_hdptx_phy_set_voltage(struct rk_hdptx_phy *hdptx,
> +				     struct phy_configure_opts_dp *dp,
> +				     u8 lane)
> +{
> +	const struct tx_drv_ctrl *ctrl;
> +	u32 offset = lane * 0x400;
> +
> +	switch (dp->link_rate) {
> +	case 1620:
> +		ctrl = &tx_drv_ctrl_rbr[dp->voltage[lane]][dp->pre[lane]];
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030a) + offset,
> +				   LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_RBR_MASK,
> +				   ctrl->tx_jeq_even_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030c) + offset,
> +				   LN_TX_JEQ_ODD_CTRL_RBR_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_RBR_MASK,
> +				   ctrl->tx_jeq_odd_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
> +				   LN_TX_SER_40BIT_EN_RBR_MASK,
> +				   FIELD_PREP(LN_TX_SER_40BIT_EN_RBR_MASK, 0x1));
> +		break;
> +	case 2700:
> +		ctrl = &tx_drv_ctrl_hbr[dp->voltage[lane]][dp->pre[lane]];
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
> +				   LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR_MASK,
> +				   ctrl->tx_jeq_even_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
> +				   LN_TX_JEQ_ODD_CTRL_HBR_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR_MASK,
> +				   ctrl->tx_jeq_odd_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
> +				   LN_TX_SER_40BIT_EN_HBR_MASK,
> +				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR_MASK, 0x1));
> +		break;
> +	case 5400:
> +	default:
> +		ctrl = &tx_drv_ctrl_hbr2[dp->voltage[lane]][dp->pre[lane]];
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030b) + offset,
> +				   LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_EVEN_CTRL_HBR2_MASK,
> +				   ctrl->tx_jeq_even_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(030d) + offset,
> +				   LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
> +				   FIELD_PREP(LN_TX_JEQ_ODD_CTRL_HBR2_MASK,
> +				   ctrl->tx_jeq_odd_ctrl));
> +		regmap_update_bits(hdptx->regmap, LANE_REG(0311) + offset,
> +				   LN_TX_SER_40BIT_EN_HBR2_MASK,
> +				   FIELD_PREP(LN_TX_SER_40BIT_EN_HBR2_MASK, 0x1));
> +		break;
> +	}
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0303) + offset,
> +			   OVRD_LN_TX_DRV_LVL_CTRL_MASK | LN_TX_DRV_LVL_CTRL_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_LVL_CTRL_MASK, 0x1) |
> +			   FIELD_PREP(LN_TX_DRV_LVL_CTRL_MASK,
> +				      ctrl->tx_drv_lvl_ctrl));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0304) + offset,
> +			   OVRD_LN_TX_DRV_POST_LVL_CTRL_MASK |
> +			   LN_TX_DRV_POST_LVL_CTRL_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_POST_LVL_CTRL_MASK, 0x1) |
> +			   FIELD_PREP(LN_TX_DRV_POST_LVL_CTRL_MASK,
> +				      ctrl->tx_drv_post_lvl_ctrl));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0305) + offset,
> +			   OVRD_LN_TX_DRV_PRE_LVL_CTRL_MASK |
> +			   LN_TX_DRV_PRE_LVL_CTRL_MASK,
> +			   FIELD_PREP(OVRD_LN_TX_DRV_PRE_LVL_CTRL_MASK, 0x1) |
> +			   FIELD_PREP(LN_TX_DRV_PRE_LVL_CTRL_MASK,
> +				      ctrl->tx_drv_pre_lvl_ctrl));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0306) + offset,
> +			   LN_ANA_TX_DRV_IDRV_IDN_CTRL_MASK |
> +			   LN_ANA_TX_DRV_IDRV_IUP_CTRL_MASK |
> +			   LN_ANA_TX_DRV_ACCDRV_EN_MASK,
> +			   FIELD_PREP(LN_ANA_TX_DRV_IDRV_IDN_CTRL_MASK,
> +				      ctrl->ana_tx_drv_idrv_idn_ctrl) |
> +			   FIELD_PREP(LN_ANA_TX_DRV_IDRV_IUP_CTRL_MASK,
> +				      ctrl->ana_tx_drv_idrv_iup_ctrl) |
> +			   FIELD_PREP(LN_ANA_TX_DRV_ACCDRV_EN_MASK,
> +				      ctrl->ana_tx_drv_accdrv_en));
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0307) + offset,
> +			   LN_ANA_TX_DRV_ACCDRV_POL_SEL_MASK |
> +			   LN_ANA_TX_DRV_ACCDRV_CTRL_MASK,
> +			   FIELD_PREP(LN_ANA_TX_DRV_ACCDRV_POL_SEL_MASK, 0x1) |
> +			   FIELD_PREP(LN_ANA_TX_DRV_ACCDRV_CTRL_MASK,
> +				      ctrl->ana_tx_drv_accdrv_ctrl));
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(030a) + offset,
> +			   LN_ANA_TX_JEQ_EN_MASK,
> +			   FIELD_PREP(LN_ANA_TX_JEQ_EN_MASK, ctrl->ana_tx_jeq_en));
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0310) + offset,
> +			   LN_ANA_TX_SYNC_LOSS_DET_MODE_MASK,
> +			   FIELD_PREP(LN_ANA_TX_SYNC_LOSS_DET_MODE_MASK, 0x3));
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(0316) + offset,
> +			   LN_ANA_TX_SER_VREG_GAIN_CTRL_MASK,
> +			   FIELD_PREP(LN_ANA_TX_SER_VREG_GAIN_CTRL_MASK, 0x2));
> +
> +	regmap_update_bits(hdptx->regmap, LANE_REG(031b) + offset,
> +			   LN_ANA_TX_RESERVED_MASK,
> +			   FIELD_PREP(LN_ANA_TX_RESERVED_MASK, 0x1));
> +}
> +
> +static int rk_hdptx_phy_set_voltages(struct rk_hdptx_phy *hdptx,
> +				     struct phy_configure_opts_dp *dp)
> +{
> +	u8 lane;
> +	u32 status;
> +	int ret;
> +
> +	for (lane = 0; lane < dp->lanes; lane++)
> +		rk_hdptx_phy_set_voltage(hdptx, dp, lane);
> +
> +	reset_control_deassert(hdptx->rsts[RST_LANE].rstc);
> +
> +	ret = regmap_read_poll_timeout(hdptx->grf, GRF_HDPTX_STATUS,
> +				       status, FIELD_GET(HDPTX_O_PHY_RDY, status),
> +				       50, 5000);
> +	if (ret) {
> +		dev_err(hdptx->dev, "Failed to get phy ready: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
> +	enum phy_mode mode = phy_get_mode(phy);
> +	int ret;
> +
> +	if (mode != PHY_MODE_DP)
> +		return -EINVAL;
> +
> +	ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
> +	if (ret) {
> +		dev_err(hdptx->dev, "invalid params for phy configure\n");
> +		return ret;
> +	}
> +
> +	if (opts->dp.set_rate) {
> +		ret = rk_hdptx_phy_set_rate(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set rate: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_lanes) {
> +		ret = rk_hdptx_phy_set_lanes(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set lanes: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	if (opts->dp.set_voltages) {
> +		ret = rk_hdptx_phy_set_voltages(hdptx, &opts->dp);
> +		if (ret) {
> +			dev_err(hdptx->dev, "failed to set voltages: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct phy_ops rk_hdptx_phy_ops = {
>  	.power_on  = rk_hdptx_phy_power_on,
>  	.power_off = rk_hdptx_phy_power_off,
> +	.set_mode  = rk_hdptx_phy_set_mode,
> +	.configure = rk_hdptx_phy_configure,
>  	.owner	   = THIS_MODULE,
>  };
>  
> @@ -1164,5 +2014,6 @@ module_platform_driver(rk_hdptx_phy_driver);
>  
>  MODULE_AUTHOR("Algea Cao <algea.cao@rock-chips.com>");
>  MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@collabora.com>");
> +MODULE_AUTHOR("Damon Ding <damon.ding@rock-chips.com>");
>  MODULE_DESCRIPTION("Samsung HDMI/eDP Transmitter Combo PHY Driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
