Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B253AF84C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 00:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231966E435;
	Mon, 21 Jun 2021 22:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2121F6E435
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 22:10:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624313455; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hX4Ft6zyiQIVmE/JarON2QPSpyjovAuFjZBiUid87uM=;
 b=w78gbYGm3vNXxX/qf1WagabX/gaYns61dbxjaWToUX4jWIVl1TCVRPxOKuXcrgpzsPQ+7iOi
 vnrbayOUfgjADwIUq/Eo+6rhcX80doVC8ZyhcZgLIfPK4msW0aj4i4+BO9ErOxEfKOq/Pxj6
 Yj+q+vWuXRjU/bd6hX0593x555Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60d10e4f5eaa81cb1e503b75 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:10:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6F457C43217; Mon, 21 Jun 2021 22:10:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 65279C433D3;
 Mon, 21 Jun 2021 22:10:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jun 2021 15:10:20 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 5/8] drm/msm/dsi: stop setting clock parents
 manually
In-Reply-To: <20210515131217.1540412-6-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
 <20210515131217.1540412-6-dmitry.baryshkov@linaro.org>
Message-ID: <e28d5d34d48947b77a0a0bf6ae9bf27a@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> There is no reason to set clock parents manually, use device tree to
> assign DSI/display clock parents to DSI PHY clocks. Dropping this 
> manual
> setup allows us to drop repeating code and to move registration of hw
> clock providers to generic place.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Once you have documented or pointed me to the documentation that 
assign-clock-parents
is now a mandatory property for the DSI node, this is a good cleanup, 
hence:

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  2 --
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 51 ---------------------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
>  4 files changed, 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7abfeab08165..2041980548f0 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -169,8 +169,6 @@ void msm_dsi_phy_get_shared_timings(struct 
> msm_dsi_phy *phy,
>  			struct msm_dsi_phy_shared_timings *shared_timing);
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc);
> -int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 8a10e4343281..1f444101e551 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2223,57 +2223,6 @@ void msm_dsi_host_cmd_xfer_commit(struct
> mipi_dsi_host *host, u32 dma_base,
>  	wmb();
>  }
> 
> -int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -	struct msm_dsi_phy *src_phy)
> -{
> -	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -	struct clk *byte_clk_provider, *pixel_clk_provider;
> -	int ret;
> -
> -	ret = msm_dsi_phy_get_clk_provider(src_phy,
> -				&byte_clk_provider, &pixel_clk_provider);
> -	if (ret) {
> -		pr_info("%s: can't get provider from pll, don't set parent\n",
> -			__func__);
> -		return 0;
> -	}
> -
> -	ret = clk_set_parent(msm_host->byte_clk_src, byte_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to byte_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	ret = clk_set_parent(msm_host->pixel_clk_src, pixel_clk_provider);
> -	if (ret) {
> -		pr_err("%s: can't set parent to pixel_clk_src. ret=%d\n",
> -			__func__, ret);
> -		goto exit;
> -	}
> -
> -	if (msm_host->dsi_clk_src) {
> -		ret = clk_set_parent(msm_host->dsi_clk_src, pixel_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to dsi_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -	if (msm_host->esc_clk_src) {
> -		ret = clk_set_parent(msm_host->esc_clk_src, byte_clk_provider);
> -		if (ret) {
> -			pr_err("%s: can't set parent to esc_clk_src. ret=%d\n",
> -				__func__, ret);
> -			goto exit;
> -		}
> -	}
> -
> -exit:
> -	return ret;
> -}
> -
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index cd016576e8c5..12efc8c69046 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -78,7 +78,6 @@ static int dsi_mgr_setup_components(int id)
>  			return ret;
> 
>  		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>  	} else if (!other_dsi) {
>  		ret = 0;
>  	} else {
> @@ -105,10 +104,6 @@ static int dsi_mgr_setup_components(int id)
>  					MSM_DSI_PHY_MASTER);
>  		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
>  					MSM_DSI_PHY_SLAVE);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
> -		if (ret)
> -			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, 
> clk_master_dsi->phy);
>  	}
> 
>  	return ret;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index ff7f2ec42030..f2b5e0f63a16 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -835,17 +835,6 @@ void msm_dsi_phy_set_usecase(struct msm_dsi_phy 
> *phy,
>  		phy->usecase = uc;
>  }
> 
> -int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider)
> -{
> -	if (byte_clk_provider)
> -		*byte_clk_provider = 
> phy->provided_clocks->hws[DSI_BYTE_PLL_CLK]->clk;
> -	if (pixel_clk_provider)
> -		*pixel_clk_provider = 
> phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
> -
> -	return 0;
> -}
> -
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
>  {
>  	if (phy->cfg->ops.save_pll_state) {
