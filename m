Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4AA3616C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E3310ECEE;
	Fri, 14 Feb 2025 15:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YZyFOXbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB0810ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:21:01 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so22331971fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739546460; x=1740151260; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u+alm7ANPxaEHKbieUa+EyZgstYms8w4wOcWOnAHGY4=;
 b=YZyFOXbjtzv5C9eRiLxVwHbcn+P55ki/m3589FTvZJL+rTOyoOxja0rJHnE1nr0sPt
 +vJ9Y8wt5jPEIY3zAfRjpFcD5ZHnh6ZZ4VjoXduJ4aXi+tprkgDOmq61gKu0t70Y8iJZ
 IE19Fp5tCrVtLpUBiRjPcyhzq4OpLnt+HVqZ5YgmJAPtHTgisKHXYqRU6KcgiZTqJWtK
 A+Dsoh4vDUxl4E+qVMRp7AJ4IiVUhZjcFhNhsEOPFzF9hKfRCv3eYh4rwNKse2/cQQ8c
 Bqw+MnBDCKe07UP2Mw/iG3Nc0xZjlt34nxpnX63ZhjbxU4J0WD+sdDUzmwd6m8vLdedJ
 6WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739546460; x=1740151260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+alm7ANPxaEHKbieUa+EyZgstYms8w4wOcWOnAHGY4=;
 b=UJDw7IaWCEsMwr54rmHs1PBAc2zj49vDNL7xW1GMBVTgCKUHzUe6SplPlZtKEeHlt1
 RcFGiIX+JqyhswAuBk1qrMHh3JlFvwOE1FgOb3nIzFOmaWXa4ochJfLKuVDHiYMyHFv3
 77fqSovZjvzV4L5ycr4msgU+tSI4ZyoYBtGxifqiqguiAP2G/H7652/QMKsbbWhGc6FP
 q/vRv7J7/GVYjXCPABh7U2ZTOIHSz+w6PdNoSZ3zwwjq3nJCck/vnEZ1zPlBMECN1HUt
 6uZvutw0+r5CeXm3IPbZ+rAEk7xuBCUgNZmkrAQf5s82xW5IX/eWlUG1qX2A7qWjzdt/
 zNNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgn7oTw2mWmtzvFnqyC9ZR/vGpP90CgmEkywwt9FXDjdVErOihPKE6AKcJicUMO+VQtui/zv1KEmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyzXosdXwsfmzOWKOtv0dE1hph2sYRXFUHQ0388Oye9cGSyx7k
 rHvisjMy5dDw2zQrmfBmMCVrTYrVLMPKOzXjwc/Um6mw+khJnDrI3igKacFDuZM=
X-Gm-Gg: ASbGncuabMzSq9fCOmsHwc8eDbZXhHuRSZGIUlvv9yKIScm7HNJ32v/uRqW3gOLUQUd
 HNg6kqrS+CfhVQaDSInoPWnv9GOEXr8OMGHdnkh5j4uSj2YTtCYK01YILPaITZdBAfIoXtEB3E1
 FEetxb0oTGXdLBASbVekGh05e71J5UFQc85YAvgN8qAecTfwbNoNi7smfK5f1UzWwf2l0syKZCO
 IaZlAbuvgALUKh3rh+QVFvD76Y4zHVkgXfDiGVcv8FdWqeZDDwm14x9rl05CZ9iAUETKofwNvbe
 vV87aULprFhHKmhYZRiDnkzdjHI8joarWKllabTTl5qV4vFp1odnoiFCAButsHGuAFmzs1s=
X-Google-Smtp-Source: AGHT+IGf/JDHOwptwq9aBdssKrkB2UDHATM0RmE6UZ1L0ih5y99blcApSprlvyWk9/7mxO1xfUKYMQ==
X-Received: by 2002:a2e:bc18:0:b0:308:eb58:657d with SMTP id
 38308e7fff4ca-30903553746mr44817971fa.0.1739546459775; 
 Fri, 14 Feb 2025 07:20:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b07asm5963421fa.92.2025.02.14.07.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:20:58 -0800 (PST)
Date: Fri, 14 Feb 2025 17:20:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
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

On Fri, Feb 14, 2025 at 04:08:44PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	cached->pll_out_div &= 0x3;
>  
>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> +	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
> +	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
>  
>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;

FIELD_GET.

>  
>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>  	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> @@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +				    cached->pll_mux);

DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(cached->pll_mux)

>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,

data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3)

> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<bitfield name="CLK_EN" pos="5" type="boolean"/>
>  		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
>  		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
> +		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
