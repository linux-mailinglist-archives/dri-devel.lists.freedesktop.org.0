Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650EF34DCC1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A75F6E5A3;
	Tue, 30 Mar 2021 00:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5B6E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:03:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617062630; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q/vwPUUGGKX2Gce1dd+LAqI10B98dw9Nic2zaw+7SS4=;
 b=Tc+Tts4SJBvBA+nhRh8aaWGxIltHHSTiiVjLoT2/mRDni0iC9ZWMVmLGKXiGhlJ82f77dueQ
 A0AatzR0Tt/QHU7o3mXfiAI8EUOoyYnrqi55mMY7W3cA8ep6ENE0NI6YEOhQHlyG3PnyTyFc
 0IOTgWBfqR5eYm+YRlW66PnXBg4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60626adf876af85fc414d890 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 00:03:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BCF67C433CA; Tue, 30 Mar 2021 00:03:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03AA1C433C6;
 Tue, 30 Mar 2021 00:03:42 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 29 Mar 2021 17:03:42 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v3 16/25] drm/msm/dpu: simplify vco_delay
 handling in dsi_phy_28nm driver
In-Reply-To: <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
Message-ID: <e7f9bb4fe6f5830569627649b9e5fac8@codeaurora.org>
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

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Instead of setting the variable and then using it just in the one 
> place,
> determine vco_delay directly at the PLL configuration time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
The subject line should still be "drm/msm/dsi" and not "drm/msm/dpu".
Once thats fixed, please apply
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 3e9b7949b038..ed369eb18e9d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -72,8 +72,6 @@ struct dsi_pll_28nm {
>  	struct platform_device *pdev;
>  	void __iomem *mmio;
> 
> -	int vco_delay;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct
> clk_hw *hw, unsigned long rate,
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
> 
>  	/* Add hardware recommended delay for correct PLL configuration */
> -	if (pll_28nm->vco_delay)
> -		udelay(pll_28nm->vco_delay);
> +	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> +		udelay(1000);
> +	else
> +		udelay(1);
> 
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
> @@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll = &pll_28nm->base;
>  	pll->cfg = phy->cfg;
> -	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> -		pll_28nm->vco_delay = 1000;
> -	else
> -		pll_28nm->vco_delay = 1;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
