Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABD41F952
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 04:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FC26E81E;
	Sat,  2 Oct 2021 02:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B656E81E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 02:10:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633140608; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IdPrSN7DyjjyDwl/JmPxGCeRJ0vl0pdvMkHcDlr+82s=;
 b=jjRfAK2kBsuDBeNRgtDo+JoCEZA+5rbfatCUYKaIHOsEhi+f9pP/PSRYLtnOuMsHWz7gJxLg
 RvXlNC8B6VflxGIilX8gRuFHHky+gUJcE7fjfy+5EG/gYEVgH6M/Y6Z4otw1BagSoUf7oeOq
 ExG0dnPztjbA2+5XfrrwCP9rufc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6157bf7d713d5d6f9661d0c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 02 Oct 2021 02:10:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5EEE5C43618; Sat,  2 Oct 2021 02:10:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C74FC4338F;
 Sat,  2 Oct 2021 02:10:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Oct 2021 19:10:02 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dsi: do not enable irq handler
 before powering up the host
In-Reply-To: <20211002010830.647416-1-dmitry.baryshkov@linaro.org>
References: <20211002010830.647416-1-dmitry.baryshkov@linaro.org>
Message-ID: <2b7889de45ea3e27954b49bc96c49356@codeaurora.org>
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

On 2021-10-01 18:08, Dmitry Baryshkov wrote:
> The DSI host might be left in some state by the bootloader. If this
> state generates an IRQ, it might hang the system by holding the
> interrupt line before the driver sets up the DSI host to the known
> state.
> 
> Move the request_irq into msm_dsi_host_init and pass IRQF_NO_AUTOEN to
> it. Call enable/disable_irq after msm_dsi_host_power_on/_off()
> functions, so that we can be sure that the interrupt is delivered when
> the host is in the known state.
> 
> It is not possible to defer the interrupt enablement to a later point,
> because drm_panel_prepare might need to communicate with the panel over
> the DSI link and that requires working interrupt.
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 48 +++++++++++++++++----------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 16 +++++++++
>  3 files changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
> b/drivers/gpu/drm/msm/dsi/dsi.h
> index b50db91cb8a7..569c8ff062ba 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -107,6 +107,8 @@ void msm_dsi_host_cmd_xfer_commit(struct
> mipi_dsi_host *host,
>  					u32 dma_base, u32 len);
>  int msm_dsi_host_enable(struct mipi_dsi_host *host);
>  int msm_dsi_host_disable(struct mipi_dsi_host *host);
> +void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
> +void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
>  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings,
>  			bool is_bonded_dsi, struct msm_dsi_phy *phy);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..ce26eb78cb6c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1898,6 +1898,23 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>  		return ret;
>  	}
> 
> +	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	if (msm_host->irq < 0) {
> +		ret = msm_host->irq;
> +		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* do not autoenable, will be enabled later */
> +	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
> +			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +			"dsi_isr", msm_host);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
> +				msm_host->irq, ret);
> +		return ret;
> +	}
> +
>  	init_completion(&msm_host->dma_comp);
>  	init_completion(&msm_host->video_comp);
>  	mutex_init(&msm_host->dev_mutex);
> @@ -1941,25 +1958,8 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> -	struct platform_device *pdev = msm_host->pdev;
>  	int ret;
> 
> -	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -	if (msm_host->irq < 0) {
> -		ret = msm_host->irq;
> -		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = devm_request_irq(&pdev->dev, msm_host->irq,
> -			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -			"dsi_isr", msm_host);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
> -				msm_host->irq, ret);
> -		return ret;
> -	}
> -
>  	msm_host->dev = dev;
>  	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>  	if (ret) {
> @@ -2315,6 +2315,20 @@ void msm_dsi_host_get_phy_clk_req(struct
> mipi_dsi_host *host,
>  	clk_req->escclk_rate = msm_host->esc_clk_rate;
>  }
> 
> +void msm_dsi_host_enable_irq(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	enable_irq(msm_host->irq);
> +}
> +
> +void msm_dsi_host_disable_irq(struct mipi_dsi_host *host)
> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	disable_irq(msm_host->irq);
> +}
> +
>  int msm_dsi_host_enable(struct mipi_dsi_host *host)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index c41d39f5b7cf..fb4ccffdcfe1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -377,6 +377,14 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  		}
>  	}
> 
> +	/*
> +	 * Enable before preparing the panel, disable after unpreparing, so
> +	 * that the panel can communicate over the DSI link.
> +	 */
> +	msm_dsi_host_enable_irq(host);
> +	if (is_bonded_dsi && msm_dsi1)
> +		msm_dsi_host_enable_irq(msm_dsi1->host);
> +
>  	/* Always call panel functions once, because even for dual panels,
>  	 * there is only one drm_panel instance.
>  	 */
> @@ -411,6 +419,10 @@ static void dsi_mgr_bridge_pre_enable(struct
> drm_bridge *bridge)
>  	if (panel)
>  		drm_panel_unprepare(panel);
>  panel_prep_fail:
> +	msm_dsi_host_disable_irq(host);
> +	if (is_bonded_dsi && msm_dsi1)
> +		msm_dsi_host_disable_irq(msm_dsi1->host);
> +
>  	if (is_bonded_dsi && msm_dsi1)
>  		msm_dsi_host_power_off(msm_dsi1->host);
>  host1_on_fail:
> @@ -523,6 +535,10 @@ static void dsi_mgr_bridge_post_disable(struct
> drm_bridge *bridge)
>  								id, ret);
>  	}
> 
> +	msm_dsi_host_disable_irq(host);
> +	if (is_bonded_dsi && msm_dsi1)
> +		msm_dsi_host_disable_irq(msm_dsi1->host);
> +
>  	/* Save PHY status if it is a clock source */
>  	msm_dsi_phy_pll_save_state(msm_dsi->phy);
