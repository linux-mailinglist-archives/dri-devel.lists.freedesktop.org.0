Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C56730B0B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CCE10E478;
	Wed, 14 Jun 2023 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26D210E478;
 Wed, 14 Jun 2023 22:58:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 13AC13F804;
 Thu, 15 Jun 2023 00:57:57 +0200 (CEST)
Date: Thu, 15 Jun 2023 00:57:55 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: split dsi_ctrl_config() function
Message-ID: <kkqjd5kmopmuhcnkksk2vzn3rwunbmzoq3yybnlw4eu4fjnmxo@seilko33i5ri>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
 <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
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

On 2023-06-15 01:44:02, Dmitry Baryshkov wrote:
> It makes no sense to pass NULL parameters to dsi_ctrl_config() in the
> disable case. Split dsi_ctrl_config() into enable and disable parts and
> drop unused params.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Indeed, it makes much more sense to split this out instead of faking a
_configure(false) with a return right at the top and "bogus" pointers.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index eaee621aa6c8..3f6dfb4f9d5a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -705,7 +705,12 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
>  	}
>  }
>  
> -static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
> +static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
> +{
> +	dsi_write(msm_host, REG_DSI_CTRL, 0);
> +}
> +
> +static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
>  {
>  	u32 flags = msm_host->mode_flags;
> @@ -713,11 +718,6 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	u32 data = 0, lane_ctrl = 0;
>  
> -	if (!enable) {
> -		dsi_write(msm_host, REG_DSI_CTRL, 0);
> -		return;
> -	}
> -
>  	if (flags & MIPI_DSI_MODE_VIDEO) {
>  		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
>  			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
> @@ -802,7 +802,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
>  		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
>  
> -		if (msm_dsi_phy_set_continuous_clock(phy, enable))
> +		if (msm_dsi_phy_set_continuous_clock(phy, true))
>  			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
>  
>  		dsi_write(msm_host, REG_DSI_LANE_CTRL,
> @@ -2358,7 +2358,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  
>  	dsi_timing_setup(msm_host, is_bonded_dsi);
>  	dsi_sw_reset(msm_host);
> -	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
> +	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
>  
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 1);
> @@ -2390,7 +2390,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  		goto unlock_ret;
>  	}
>  
> -	dsi_ctrl_config(msm_host, false, NULL, NULL);
> +	dsi_ctrl_disable(msm_host);
>  
>  	if (msm_host->disp_en_gpio)
>  		gpiod_set_value(msm_host->disp_en_gpio, 0);
> -- 
> 2.39.2
> 
