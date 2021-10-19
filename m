Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A1434224
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4426E17B;
	Tue, 19 Oct 2021 23:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C05D6E133
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:36:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634686573; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1+u4o5BrSgJRG3IymcStczFaOcnqoI4uE+KBtlHBBVY=;
 b=TgnR2ipVSDBz9qXeU3U26yAAAomgayxdvykz6Vq320S+0AbCKS+CUIfs/BXmbx43lp05UjPF
 oScYFzhh/SMXbCpUiGxrSmvBKK9NOg6uWGvFzVce3gSdSHb0q2MLam2XnYV8zkAYfPZ3fLNm
 aA6mmBJs7kn5E4mdM/vmPfazJ8M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 616f56573416c2cb706686e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 23:35:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A4D31C4360C; Tue, 19 Oct 2021 23:35:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E15EC4338F;
 Tue, 19 Oct 2021 23:35:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Oct 2021 16:35:49 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dsi: stop setting clock parents
 manually
In-Reply-To: <20211006204828.1218225-2-dmitry.baryshkov@linaro.org>
References: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
 <20211006204828.1218225-2-dmitry.baryshkov@linaro.org>
Message-ID: <f7e8176759809f41dff1c41d6adb9d4a@codeaurora.org>
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

On 2021-10-06 13:48, Dmitry Baryshkov wrote:
> There is no reason to set clock parents manually, use device tree to
> assign DSI/display clock parents to DSI PHY clocks. Dropping this 
> manual
> setup allows us to drop repeating code and to move registration of hw
> clock providers to generic place.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I believe this was reviewed previously on

https://patchwork.freedesktop.org/patch/443470/

Hence,

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  2 -
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 53 ---------------------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 11 +-----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ------
>  4 files changed, 2 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index 7dfb6d198ca9..c03a8d09c764 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -173,8 +173,6 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>  void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
>  			     enum msm_dsi_phy_usecase uc);
> -int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
> -	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
>  int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
>  void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct
> msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1ffcd0577e99..9600b4fa27eb 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2232,59 +2232,6 @@ void msm_dsi_host_set_phy_mode(struct
> mipi_dsi_host *host,
>  	msm_host->cphy_mode = src_phy->cphy_mode;
>  }
> 
> -int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> -	struct msm_dsi_phy *src_phy)
> -{
> -	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> -	struct clk *byte_clk_provider, *pixel_clk_provider;
> -	int ret;
> -
> -	msm_host->cphy_mode = src_phy->cphy_mode;
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
> index 49a0a0841487..9342a822ad20 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -78,10 +78,7 @@ static int dsi_mgr_setup_components(int id)
> 
>  		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
>  		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
> -	} else if (!other_dsi) {
> -		ret = 0;
> -	} else {
> +	} else if (other_dsi) {
>  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							msm_dsi : other_dsi;
>  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> @@ -107,13 +104,9 @@ static int dsi_mgr_setup_components(int id)
>  					MSM_DSI_PHY_SLAVE);
>  		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> -		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
> -		if (ret)
> -			return ret;
> -		ret = msm_dsi_host_set_src_pll(other_dsi->host, 
> clk_master_dsi->phy);
>  	}
> 
> -	return ret;
> +	return 0;
>  }
> 
>  static int enable_phy(struct msm_dsi *msm_dsi,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6968ca..8ec331e751a2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -890,17 +890,6 @@ bool msm_dsi_phy_set_continuous_clock(struct
> msm_dsi_phy *phy, bool enable)
>  	return phy->cfg->ops.set_continuous_clock(phy, enable);
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
