Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0184298AB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 23:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5306E96D;
	Mon, 11 Oct 2021 21:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38B66E96D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 21:09:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633986588; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mcbzMvbJjsJzfGMVHA2HceukDUBg6GF8UwE11dJYi1E=;
 b=ItlYLbTSDgXVSO4scRZqm23M65DvbVNDw/5OG9kfFeRU6S8QDBN0PaXosY782qoViRzb3Nl8
 M/9qVij+amJBgYANhT9CIL6yDnnebfgERD14ArjfCvEDcXNepVcinDxQkUtjLOeA7VirSsDr
 BXJJGtJIbTIrg9eQwWAngA/tePQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6164a81ba45ca753075e13f9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 21:09:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 170A9C4338F; Mon, 11 Oct 2021 21:09:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9096CC43460;
 Mon, 11 Oct 2021 21:09:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Oct 2021 14:09:45 -0700
From: abhinavk@codeaurora.org
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Martin Botka
 <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen
 Boyd <swboyd@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Use division result from
 div_u64_rem in 7nm and 14nm PLL
In-Reply-To: <20211011201642.167700-1-marijn.suijten@somainline.org>
References: <20211011201642.167700-1-marijn.suijten@somainline.org>
Message-ID: <51e9b0197656385025cd5c8a25bf01e8@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-11 13:16, Marijn Suijten wrote:
> div_u64_rem provides the result of the division and additionally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
> 
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes in v2:
> - Corrected two typos in the first commit-message sentence.
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9a959a5dcc1e..de3c6556a587 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -215,9 +215,7 @@ static void pll_14nm_dec_frac_calc(struct
> dsi_pll_14nm *pll, struct dsi_pll_conf
>  	DBG("vco_clk_rate=%lld ref_clk_rate=%lld", vco_clk_rate, fref);
> 
>  	dec_start_multiple = div_u64(vco_clk_rate * multiplier, fref);
> -	div_u64_rem(dec_start_multiple, multiplier, &div_frac_start);
> -
> -	dec_start = div_u64(dec_start_multiple, multiplier);
> +	dec_start = div_u64_rem(dec_start_multiple, multiplier, 
> &div_frac_start);
> 
>  	pconf->dec_start = (u32)dec_start;
>  	pconf->div_frac_start = div_frac_start;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9f7c408325ba..36eb6109cb88 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -114,9 +114,7 @@ static void dsi_pll_calc_dec_frac(struct
> dsi_pll_7nm *pll, struct dsi_pll_config
> 
>  	multiplier = 1 << FRAC_BITS;
>  	dec_multiple = div_u64(pll_freq * multiplier, divider);
> -	div_u64_rem(dec_multiple, multiplier, &frac);
> -
> -	dec = div_u64(dec_multiple, multiplier);
> +	dec = div_u64_rem(dec_multiple, multiplier, &frac);
> 
>  	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>  		config->pll_clock_inverters = 0x28;
> --
> 2.33.0
