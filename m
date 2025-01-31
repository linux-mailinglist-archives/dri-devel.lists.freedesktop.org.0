Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD59A24060
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7FB10E399;
	Fri, 31 Jan 2025 16:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VdZq1Wg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8AA10E399
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:27:10 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-303548a933aso18487161fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738340829; x=1738945629; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
 b=VdZq1Wg/P5sfnS/f0KqM+gChHn8qmDzYmv7IsUW2fa1mOGtiP2kK+cDONjD/teB1GE
 lDEV1Lhait4pr7oy+e29UgkelMxQ2+UMitgBz9zqmMlI9/jVM9/Z5mc/CnvH4b6b+Hqy
 w5mjvHjGAQNdyEaEt6IyxTItNJN+dXDrZjtCAT4GpLztSlsDAyJEbng9L8X5D93GwcTX
 7N4Hqldt24ipwMD1mO23fAM17dBWwOONcn4elPE2qFnKBLGXV2ayoNzFTYNKEd5TZ020
 gDbMRXxgfQUcGgIDd6Xpt3I+ZGCNr9QGnKakTHTNihaqafOYrfi1oGA1ctR/DTA46kHR
 LxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738340829; x=1738945629;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
 b=q0Zw+9908Pp7p1W7Lp+YEU9SsI+8zWdWm/jztDN0BS9I+rm5OqXpJE2RzqCaI2rKgq
 bEMXVctnt3gWxQSqxJ7AfpZmhtOk8GdpYQEFfpX5yRHHCNOoMBiM44aHduJWP+NNn4OJ
 jHY1rQYebcOCdJSM9ox6jSbciLNwgMSfTOx7HtN7UHP1ZBOqBavOlFgiYh+SF0t1fdOZ
 NGYPhFnM1fhHf4LJSz6xyc7yjepOE9OzaLV/mIwR3oJSDxKN6UqiwgYopSSClo8Voyys
 Yoxfw0jq+tD49Bhl7Cxq/th+IDfk+6vSaOx2VxnJSyVH4iR3nFyre60/rDDgsydlPDHL
 DHBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO07QMBZfuH+lYRVGOPIJFXbk3EY0aKHQnwgiTAVqEZi7KoUkS/iMuXzwr5ThYcWuBiAlDW/JucGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBhJN++vGT4tiuq+Ooz/kNvikcb1v/Yd7DUaNw35ZkqQMIXJ79
 ppp5NH0FLoBI787s6u7pagD3zTLEXItDCDBE1deuVA5FHcoRc+odgumRx6x1x2s=
X-Gm-Gg: ASbGncuC334/fjkR34Bxc3I3A2bDKNVK//b/Cm674lDtqBkhCEGUlT3xKqtj9pq8/E2
 XMyzWPFkkx32rQhZbKXNGbc5UKWhhKziaxfKemfDdLKgXcQFEu1H3BeenEJ7DMUyKfhP7idwzoA
 mHIWWXP5SbJLLEQdkPGkR0uMczqVtLLBZBqxG57VJB9YoZRXxw4EI15WWRG/OicwcjDE2m2K9Wu
 yGiqpctNKOZNxXY7U/cjQFNW3PytqeYL7rUh6gG2uF151yxXdXXtAImojsLWQZuUVcr/UUHm8iR
 JKLihkaVmzArI+lWOYVKOeurVwxMmUcv6MavhWZxrvb/ZVTh28nhRrFDC8gWbdDjRfs6X9w=
X-Google-Smtp-Source: AGHT+IHj2CEfFG1Ny3hI/iiu/YjFUy7k0PuAj0GbWhKpJjm24+fabydi0W5P5bg17qhnO1cLtaZBqg==
X-Received: by 2002:a05:651c:1608:b0:300:2d54:c2ae with SMTP id
 38308e7fff4ca-307968e7b65mr51500131fa.27.1738340828800; 
 Fri, 31 Jan 2025 08:27:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a33f806csm6141981fa.70.2025.01.31.08.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:27:07 -0800 (PST)
Date: Fri, 31 Jan 2025 18:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <lpg4ig3lzypzbv5nyzjfdz77ma5jdk3ey2hjt5htt5yd3ztfjp@i4qzlexajhvb>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
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

On Fri, Jan 31, 2025 at 04:02:52PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce..8a9ee308ccffc3b9d112a994a064d8be06d9c42e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -615,7 +615,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -634,7 +633,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

This also should be defined.

>  
>  	return 0;
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
