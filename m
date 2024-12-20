Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73139F88F2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CBD10EE06;
	Fri, 20 Dec 2024 00:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVwblUQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7B10EE06
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:22:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so1330651e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734654157; x=1735258957; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AAbh6kvzri8ctYwKqJBe83JxMpEXpUs+Ep0IfsaKnoM=;
 b=sVwblUQuMNqn1nUOGi6yEOE3hVaw/EGv0/wfRR9AgVlDTQ7xGsTKrW2kK+LJWMkgbM
 GJom7zdLIaTuMpI178TTtYjKez61/2s6tJCcPgQrdPMekn6qYrxHPEswCSmnixr6aKy5
 BZKdGYJre1L2xCfstCEhw0dvHIw3vAWBPq5J/0UCHOz1qw2cgO/Gb76xkLD9HGUMapDW
 F3TpmWYec4mV+p6bbEhO/hRdfA9Tbix8s8y5w1QwCPZzPyTnSyFkKauS/TsRo/5NebEi
 saTfbdj0aLQJsYtiPsuyjniujiOEZAm9yC9OvQsYJ/er2yzkgoeDJLAmRnwkb+oLA2WW
 VBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734654157; x=1735258957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAbh6kvzri8ctYwKqJBe83JxMpEXpUs+Ep0IfsaKnoM=;
 b=rBPyi7ZVXf0ha7NeZ+2TbwISnfTy/qQr5CZ2HWhHImRL4iFYnDIhC7x5NwY6ArOTsR
 O2CYNzsratSKKPclqU5zejInXo3Qv5WlN1z8ZiYgeKT4Utphxswc0kvgbRDh7+zVPBmN
 PJkOdOrUIVLaT41Z4Oez896vBzDgVNgK2MRKclNevHOzH6DDAO6VY9P73w37uP5c8nTa
 tQE8tzBm7EOeX9iTfrvXYvCYU+xk9FVJf/kaiOldJc9mm+4g6rrFnsj9bKfaGxLvcI/T
 nO7j7zwGYiJdp3iw5jvgcw0mLo/1ZDRTeYwhxp4j3fPrAFs5WB/8ro5vrGgeXlanrjF2
 PC1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9QmMwFsK8ycyOqoXyqfUomZkYXCq0A1FtlOvy6Nsn21VtxQBwFieWiMtkssblKbQEG8LcukooRZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJWB+egvFDzV0aN/KivBDxODxV8vp3vGBSDz//czrBTNZ6y9ZQ
 8TERudzoswtHcxEDoYMuIv5ms7pM/DJFhnKmJJhDnabtUj461IN+XLUC8UT7I8I=
X-Gm-Gg: ASbGncsGcRNox2TLXaZpTShni31MZnf9XZrI5xfD/WM3jcNvcjTTyXvjUj153b7aXUJ
 7rqdaK49NH6cUS4UGotAJqdF4SPO9TV6kavXPGa2vChr0EMrSV31ZxuZcazLqEPieNM3aJyuFCx
 CCsAgsjyih28/q6Rd7xZSToUvJmdeVV7lIQ7t5Pf5mMxe/0ZYyge4VRwc/wO5uxTOsdBmi1nTqo
 rkjiJPtxM9zHpsYSx6MPYbFWwrquisKp9b4ppbHXyJXeKEdyZj4ULH7LB/yqDfsyTgnunQ5Wn0N
 8HUTEIf0RivCrFft4agMRewXFqeKnKJ0N86o
X-Google-Smtp-Source: AGHT+IHBDB0DL2HFPmb1YTVLVej9ZBG0paM1gMbp8tkms3Vb7rT70j9ksKteZoAkcn4DVOlUEs7IFg==
X-Received: by 2002:a05:6512:3f25:b0:540:353a:5b1f with SMTP id
 2adb3069b0e04-542294a1623mr189444e87.0.1734654156655; 
 Thu, 19 Dec 2024 16:22:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832b6csm318735e87.273.2024.12.19.16.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:22:35 -0800 (PST)
Date: Fri, 20 Dec 2024 02:22:33 +0200
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
Subject: Re: [PATCH v3 04/15] phy: phy-rockchip-samsung-hdptx: Rename some
 register names related to DP
Message-ID: <rkdp44csph6stq2e7emhgjziiwypcas7uqsvcdo7i6ypvg64uz@gnqikl5fzxqd>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-5-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:05:53PM +0800, Damon Ding wrote:
> The modifications of DP register names are as follows:
> - Add the '_MASK' suffix to some registers to ensure consistency.
> - Complete the names of some register to their full names.
> - Swap the definitions of LCPLL_REF and ROPLL_REF.

Three unrelated changes, ideally means three commits (I won't insist on
that though). Also please mention that LCPLL_REF and ROPLL_REF were not
used by the existing driver, so it's not a bug and there is no need to
backport it.

> 
> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++----------
>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index ceab9c71d3b5..c1b9c73f5f9f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -69,41 +69,41 @@
>  #define ROPLL_PMS_IQDIV_RSTN		BIT(5)
>  /* CMN_REG(005e) */
>  #define ROPLL_SDM_EN_MASK		BIT(6)
> -#define ROPLL_SDM_FRAC_EN_RBR		BIT(3)
> -#define ROPLL_SDM_FRAC_EN_HBR		BIT(2)
> -#define ROPLL_SDM_FRAC_EN_HBR2		BIT(1)
> -#define ROPLL_SDM_FRAC_EN_HBR3		BIT(0)
> +#define ROPLL_SDC_FRAC_EN_RBR_MASK	BIT(3)
> +#define ROPLL_SDC_FRAC_EN_HBR_MASK	BIT(2)
> +#define ROPLL_SDC_FRAC_EN_HBR2_MASK	BIT(1)
> +#define ROPLL_SDM_FRAC_EN_HBR3_MASK	BIT(0)
>  /* CMN_REG(0064) */
>  #define ROPLL_SDM_NUM_SIGN_RBR_MASK	BIT(3)
>  /* CMN_REG(0069) */
>  #define ROPLL_SDC_N_RBR_MASK		GENMASK(2, 0)
>  /* CMN_REG(0074) */
> -#define ROPLL_SDC_NDIV_RSTN		BIT(2)
> -#define ROPLL_SSC_EN			BIT(0)
> +#define ROPLL_SDC_NDIV_RSTN_MASK	BIT(2)
> +#define ROPLL_SSC_EN_MASK		BIT(0)
>  /* CMN_REG(0081) */
> -#define OVRD_PLL_CD_CLK_EN		BIT(8)
> -#define PLL_CD_HSCLK_EAST_EN		BIT(0)
> +#define OVRD_PLL_CD_CLK_EN_MASK		BIT(8)
> +#define ANA_PLL_CD_HSCLK_EAST_EN_MASK	BIT(0)
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
>  /* CMN_REG(0097) */
> -#define DIG_CLK_SEL			BIT(1)
> -#define ROPLL_REF			BIT(1)
> -#define LCPLL_REF			0
> +#define DIG_CLK_SEL_MASK		BIT(1)
> +#define LCPLL_REF			BIT(1)
> +#define ROPLL_REF			0
>  /* CMN_REG(0099) */
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
> @@ -165,32 +165,32 @@
>  #define HDMI_MODE			BIT(2)
>  #define HDMI_TMDS_FRL_SEL		BIT(1)
>  /* LNTOP_REG(0206) */
> -#define DATA_BUS_SEL			BIT(0)
> +#define DATA_BUS_WIDTH_SEL_MASK		BIT(0)
>  #define DATA_BUS_36_40			BIT(0)
>  /* LNTOP_REG(0207) */
>  #define LANE_EN				0xf
>  #define ALL_LANE_EN			0xf
>  
>  /* LANE_REG(0312) */
> -#define LN0_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN0_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN0_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN0_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN0_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN0_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN0_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN0_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0412) */
> -#define LN1_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN1_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN1_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN1_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN1_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN1_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN1_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN1_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0512) */
> -#define LN2_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN2_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN2_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN2_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN2_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN2_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN2_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN2_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  /* LANE_REG(0612) */
> -#define LN3_TX_SER_RATE_SEL_RBR		BIT(5)
> -#define LN3_TX_SER_RATE_SEL_HBR		BIT(4)
> -#define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
> -#define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
> +#define LN3_TX_SER_RATE_SEL_RBR_MASK	BIT(5)
> +#define LN3_TX_SER_RATE_SEL_HBR_MASK	BIT(4)
> +#define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
> +#define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
>  
>  #define HDMI20_MAX_RATE			600000000
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
