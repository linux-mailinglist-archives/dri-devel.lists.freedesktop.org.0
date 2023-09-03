Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C0790DC4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 21:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A0E10E201;
	Sun,  3 Sep 2023 19:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0310E201;
 Sun,  3 Sep 2023 19:35:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2360920091;
 Sun,  3 Sep 2023 21:35:19 +0200 (CEST)
Date: Sun, 3 Sep 2023 21:35:17 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 4/4] drm/msm/dsi: Enable widebus for DSI
Message-ID: <3jpcldlzrrsy6v3rco7jdx2hqv4sl5qkmi77gpppm2ifccnc77@chj5gcjrfivu>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
 <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822-add-widebus-support-v4-4-9dc86083d6ea@quicinc.com>
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-22 10:42:07, Jessica Zhang wrote:
> DSI 6G v2.5.x+ supports a data-bus widen mode that allows DSI to send
> 48 bits of compressed data instead of 24.
> 
> Enable this mode whenever DSC is enabled for supported chipsets.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.c      |  2 +-
>  drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++----
>  3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 4cf424b3509f..7327bfc06a84 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -19,7 +19,7 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
>  
>  bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
>  {
> -	return false;
> +	return msm_dsi_host_is_widebus_enabled(msm_dsi->host);
>  }
>  
>  static int dsi_get_phy(struct msm_dsi *msm_dsi)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index bd3763a5d723..a557d2c1aaff 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -134,6 +134,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
>  void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
>  struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
> +bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host);
>  
>  /* dsi phy */
>  struct msm_dsi_phy;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 645927214871..267c7fda8854 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -710,6 +710,15 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
>  	dsi_write(msm_host, REG_DSI_CTRL, 0);
>  }
>  
> +bool msm_dsi_host_is_widebus_enabled(struct mipi_dsi_host *host)

I thought you settled on wide_bus?

> +{
> +	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +
> +	return msm_host->dsc &&
> +		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
> +}
> +
>  static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>  			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
>  {
> @@ -753,10 +762,16 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>  		data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
>  		dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
>  
> -		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> -		    msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {
> +		if (cfg_hnd->major == MSM_DSI_VER_MAJOR_6G) {
>  			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
> -			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +
> +			if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
> +				data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +
> +			/* TODO: Allow for video-mode support once tested/fixed */
> +			if (msm_dsi_host_is_widebus_enabled(&msm_host->base))
> +				data |= DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN;
> +
>  			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
>  		}
>  	}
> @@ -894,6 +909,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  	u32 hdisplay = mode->hdisplay;
>  	u32 wc;
>  	int ret;
> +	bool widebus_enabled = msm_dsi_host_is_widebus_enabled(&msm_host->base);
>  
>  	DBG("");
>  
> @@ -914,6 +930,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  
>  	if (msm_host->dsc) {
>  		struct drm_dsc_config *dsc = msm_host->dsc;
> +		u32 bytes_per_pclk;
>  
>  		/* update dsc params with timing params */
>  		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
> @@ -937,7 +954,13 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		 * pulse width same
>  		 */
>  		h_total -= hdisplay;
> -		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> +		if (widebus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
> +			bytes_per_pclk = 6;
> +		else
> +			bytes_per_pclk = 3;
> +
> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> +
>  		h_total += hdisplay;
>  		ha_end = ha_start + hdisplay;
>  	}
> 
> -- 
> 2.42.0
> 
