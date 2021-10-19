Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008A43421A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 01:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6926E0C9;
	Tue, 19 Oct 2021 23:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCC86E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 23:34:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634686447; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qOnN/S+9RE7D3SqAFVshlOLHzL8eWKbXAxUSsArQSc4=;
 b=KtbJO7rutx/IWy+1YaNQX1jTIkzNkAflC5Geh7QgKgbCDXB3o9HBueIza8nWb4GTybXQFE7Z
 qjDgC2qaV6/cVhmgB3bT2ph7VVLBfvAOoGPmFDXRf75dYx/fgQiA7TRNDeUbiqVM6j2r29S/
 SxruOP+9qvs/muTJk/Y4v4K3pWs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 616f55eabc302969585ca66f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 23:34:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AA242C43618; Tue, 19 Oct 2021 23:34:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E789C4338F;
 Tue, 19 Oct 2021 23:34:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Oct 2021 16:34:01 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dsi: untangle cphy setting from
 the src pll setting
In-Reply-To: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
References: <20211006204828.1218225-1-dmitry.baryshkov@linaro.org>
Message-ID: <87b52292450d443fd5be678da8a7bf41@codeaurora.org>
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
> Move DPHY/CPHY setting from msm_dsi_host_set_src_pll() to new function
> msm_dsi_host_set_phy_mode().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just a minor comment, can you also include the part which removes
msm_host->cphy_mode = src_phy->cphy_mode; from msm_dsi_host_set_src_pll
in this change itself so that its clear that you are removing from there
and moving it into a new API?

You can still keep my
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

once you address this.

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 8 ++++++++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 3 +++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b50db91cb8a7..7dfb6d198ca9 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -118,6 +118,8 @@ unsigned long msm_dsi_host_get_mode_flags(struct
> mipi_dsi_host *host);
>  struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host 
> *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host, bool 
> check_defer);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> +void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
> +			struct msm_dsi_phy *src_phy);
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy *src_phy);
>  void msm_dsi_host_reset_phy(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..1ffcd0577e99 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2224,6 +2224,14 @@ void msm_dsi_host_cmd_xfer_commit(struct
> mipi_dsi_host *host, u32 dma_base,
>  	wmb();
>  }
> 
> +void msm_dsi_host_set_phy_mode(struct mipi_dsi_host *host,
> +	struct msm_dsi_phy *src_phy)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	msm_host->cphy_mode = src_phy->cphy_mode;
> +}
> +
>  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
>  	struct msm_dsi_phy *src_phy)
>  {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index c41d39f5b7cf..49a0a0841487 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -77,6 +77,7 @@ static int dsi_mgr_setup_components(int id)
>  			return ret;
> 
>  		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  		ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);
>  	} else if (!other_dsi) {
>  		ret = 0;
> @@ -104,6 +105,8 @@ static int dsi_mgr_setup_components(int id)
>  					MSM_DSI_PHY_MASTER);
>  		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
>  					MSM_DSI_PHY_SLAVE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
>  		ret = msm_dsi_host_set_src_pll(msm_dsi->host, clk_master_dsi->phy);
>  		if (ret)
>  			return ret;
