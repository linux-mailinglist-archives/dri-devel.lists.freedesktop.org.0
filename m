Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2E730B03
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1047310E47C;
	Wed, 14 Jun 2023 22:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85F10E47C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 22:55:56 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A86EC3F7E0;
 Thu, 15 Jun 2023 00:55:54 +0200 (CEST)
Date: Thu, 15 Jun 2023 00:55:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused clocks
Message-ID: <qdiqoo67yk3jrdeqj2n6tlhwaxfynwhrple2egzu4dvlkgt3jf@bpjqw57y6may>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-15 01:44:01, Dmitry Baryshkov wrote:
> Several source clocks are not used anymore, so stop handling them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Indeed, we were not using these parent clocks for anything.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fb1d3a25765f..eaee621aa6c8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -118,8 +118,6 @@ struct msm_dsi_host {
>  	struct clk *byte_clk;
>  	struct clk *esc_clk;
>  	struct clk *pixel_clk;
> -	struct clk *byte_clk_src;
> -	struct clk *pixel_clk_src;
>  	struct clk *byte_intf_clk;
>  
>  	unsigned long byte_clk_rate;
> @@ -129,8 +127,6 @@ struct msm_dsi_host {
>  
>  	/* DSI v2 specific clocks */
>  	struct clk *src_clk;
> -	struct clk *esc_clk_src;
> -	struct clk *dsi_clk_src;
>  
>  	unsigned long src_clk_rate;
>  
> @@ -267,21 +263,6 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host)
>  		return ret;
>  	}
>  
> -	msm_host->esc_clk_src = clk_get_parent(msm_host->esc_clk);
> -	if (!msm_host->esc_clk_src) {
> -		ret = -ENODEV;
> -		pr_err("%s: can't get esc clock parent. ret=%d\n",
> -			__func__, ret);
> -		return ret;
> -	}
> -
> -	msm_host->dsi_clk_src = clk_get_parent(msm_host->src_clk);
> -	if (!msm_host->dsi_clk_src) {
> -		ret = -ENODEV;
> -		pr_err("%s: can't get src clock parent. ret=%d\n",
> -			__func__, ret);
> -	}
> -
>  	return ret;
>  }
>  
> @@ -346,20 +327,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  		goto exit;
>  	}
>  
> -	msm_host->byte_clk_src = clk_get_parent(msm_host->byte_clk);
> -	if (IS_ERR(msm_host->byte_clk_src)) {
> -		ret = PTR_ERR(msm_host->byte_clk_src);
> -		pr_err("%s: can't find byte_clk clock. ret=%d\n", __func__, ret);
> -		goto exit;
> -	}
> -
> -	msm_host->pixel_clk_src = clk_get_parent(msm_host->pixel_clk);
> -	if (IS_ERR(msm_host->pixel_clk_src)) {
> -		ret = PTR_ERR(msm_host->pixel_clk_src);
> -		pr_err("%s: can't find pixel_clk clock. ret=%d\n", __func__, ret);
> -		goto exit;
> -	}
> -
>  	if (cfg_hnd->ops->clk_init_ver)
>  		ret = cfg_hnd->ops->clk_init_ver(msm_host);
>  exit:
> -- 
> 2.39.2
> 
