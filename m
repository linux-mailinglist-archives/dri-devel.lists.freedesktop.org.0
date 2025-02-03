Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7DA26199
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0805410E538;
	Mon,  3 Feb 2025 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UEolFfJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BC710E539
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:42:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so6296328e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738604542; x=1739209342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
 b=UEolFfJnfiGlH0NawLaJnrihIfGD19rTXBZmbrW6UW5OMTgxPaqhIdSFMOcudIUFcL
 EVnI5tp3a3MEfOjt1bLQPHbtOshRdYHlS43ZdDTz+wHi+xiqq6IaquPzBh9AID57hp+2
 347Sns5o37Dh9/bnimQHoybaP3vGteF41xH3tUBaODcF7OIQR2ntgYAfFxOCIOnZYx1W
 rNCg35lpXvZjyiS4vD+nho3xebqiymyRDoBLKHqHSyZFjoYiiJijWdGURF1xuTbO57Ul
 9gmV+fhTJYkVRssHZPYdBEQyzagP7TC1ECmDH6FX54GO8pd8/Uw/+EhzbszWGZaBo6GD
 UGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738604542; x=1739209342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
 b=gu2OuVgdYgtWb1QTn2ghmjOE9DkcuF+6j9ot++8+0GvbsIg25sULxUeIZ5mZ1jJZ0x
 Ij3upLCOxdRCK9CtUw9SFLvG/MY/AAYs4A3KALC6i6PtVYx6nrRmETgNPSvTHus/nf7C
 0LQuN/O9UMY1DwrQdGEAgkT0eGXnyz0njdRE/sdS2o96r44IJYsfmpXkSBDdVlGwE3Nz
 h+iQjnKcx5fM2lArL+ukz8G50I50GjC4zjgCBQbfBacm/KwpB3JMrlAQLdUxB9HI0682
 k8Yn715wa5WyUD00rpakNjEobsha0WsIRir4LhnLGaMS+3aaxNOYoq4Lkbz7HrCwyNTi
 SVTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl9rUi19pztaosES0xSO6khl3XnPcUoA5cZ+BFSZsXefL68eLxBdXhqa0VYBs8WL038V3ygJAMjYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd+zeQHho6S2YXxaDGuhNHABsMFxfBq2cxQrRsSh7z3g6cvuq3
 XzZ8P2BVpqyojtF5W2fatKAAXGz57NCV47txrROJwkt4Ie/GCMuIo/8Gr/i97N0=
X-Gm-Gg: ASbGncth17Wy2gI8y0Zsoiv9haC4d131BYPeJxTn9kL3LyF9RRihJVicqRDBtYZ/tu3
 MIe03TOB5BNZMT7+XWigeEXqaz/ec473JBUfE3NMO1VX3cndDlzGSbaJR7n5QVTD4RhNs3Gt2nI
 oEMMu3iKvnZm82hY9+Dm1YDyOUnW4+oD6xVnBgP8TVsSmrIHpQVYO303hfpie2T3LcmyqaEbv+C
 wI/bjVcEf0r4/01T/IvOoDGdLM6Fh4SDWaBuRR7mkiS7aMEG5engLfk92l91geUQgdgaSrPX7JI
 XGFJt6/FCd0tLLOvFLqo+diiEZId7CaxCaubDLTztugWKjg0Un3J3akrhkJX3lCZXL1wYGw=
X-Google-Smtp-Source: AGHT+IGlJ87svBgPPUA20T73yUcNcWRnrAPPLfHleKAdvq9eZ+1SZHlu0nXMsWAYW/fUC1Is8QpX2g==
X-Received: by 2002:a05:6512:3f13:b0:542:99a7:b415 with SMTP id
 2adb3069b0e04-543ffab903amr96587e87.0.1738604542379; 
 Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7df3sm1351683e87.204.2025.02.03.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Date: Mon, 3 Feb 2025 19:42:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Message-ID: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
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

On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> divider clocks from Common Clock Framework:
> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> clocks side is protected with spinlock, however driver's side in
> restoring state is not.  Restoring state is called from
> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> conflicting updates with clock framework.
> 
> Add missing lock usage on the PHY driver side, encapsulated in its own
> function so the code will be still readable.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  	ndelay(250);
>  }
>  
> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> +}
> +
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
>  	u32 data;
> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));

Ideally this would be FIELD_PREP or a special function generated for you
in the header.

>  
>  	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  	val &= ~0x3;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
