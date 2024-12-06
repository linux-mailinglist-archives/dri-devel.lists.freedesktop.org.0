Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52809E69C1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4A10E623;
	Fri,  6 Dec 2024 09:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R0BWnVdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A15F10F042
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:09:42 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3000b64fbe9so18066311fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733476180; x=1734080980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6VCu5IuBNknOEvtDWTAOICbOzdvqtJ8gIgp8PClwSbg=;
 b=R0BWnVdl5UZYnb0MZt9jKrW07ceWqK8w+8lYJ3/cawshcnp38TmZ/EzaLCknRr7JKr
 Uxq++OrgtOuuTFXfeUn+l6PCDIYsT8+OZiQZyzvQuwHg0IVX75s7eksnkYZydVRqg+RN
 sBxOtjvzNyzMGFw3KqB0d8xSKeEabVZfkS6p/0OdUQPh+Bz6gmCwW9WsVTh0jA9134yB
 COQF1+2RMFoUDSkMtcTJvCSOt0Ygu+mWWkErJBmAFe11lfQDnAY3Mfso14OdVjXMpsow
 eItWdjbba+BUnPyC6kbJW2Lb51PNmHeSLqaKhPgs4TcDx0ZcS0pOnzXGf6PmI3y385Zz
 qlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733476180; x=1734080980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VCu5IuBNknOEvtDWTAOICbOzdvqtJ8gIgp8PClwSbg=;
 b=JcbQZ5jZcuFceCjgHdwFSjgvsQNwEq8QOUSN7EwqQ8CBB2YqLXPPKOHCzut1YNxRz5
 A5K6LLfyO6HzB5SJ97U5Wrw8A3Im2An9P/5HP1CjwHmxsOM3CuRzXs6HHM3PfwC0bSnp
 yyaLrroeTTh6Lx5/jl9O5CrF3b612WcrHHcnU0feUtLsuWbNROgR0qe3XB9RW4tqtPKk
 1WSy4hbMcvbLDbuIiix7sDBNACL1r7/Z2UM5LVVVcDcHEFyqLzrjDx3hPIlGFQn0Bt4m
 r08DzjJENTDWtFFv3XghWG6O8vL2xbO5SexZ4pHR91nt4xwWPUQyvoMF8hNFGy5YO2Cq
 9e9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsfdvyb0V7NYFa2eJUWJD9hHsce/sv8copdzPcCjmaXdeNy/H5/NqR2Ea8CAgBMPOADyfhDP4k79o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOe+gAhrIcZ0VhJrAmN87OUlMScWJLU+R6MqFeI9q/RGfXbTPu
 UzhgE7rs6cUOV6ZcWBW8HTl5xYQRpYX9wpxp4sW6JiGycUu9ZwRtWaaWEgZvBAE=
X-Gm-Gg: ASbGncv9S0ckl+Efgn24aPak07D/YNHl8cIH3EGcyUEHl3rUj37nuEvuBMRN4394X8U
 XhszK8P1R6qQb2MNR9FpKmCJLW28HX4KetP/vmGxEopR9SDc0w0r3cNfY9my0OLZFbzl7g1ElvZ
 QXOSV0cZp25/rIkHXGxfhWFLJhX9eyIzFTmf+xW/BGMYUbx37hhwyFy3J2zAoRfZzHc7YKHeEiw
 rGo9CLQhelvTUfIz/2PlbQT99OyF9sOA4HzOtyxfaDlxiH7yKhSC0IyVvydU7iWVAO8+6HKEmqa
 7yD3Pr1UOzm5P6EmNRD5cAzGnpziOw==
X-Google-Smtp-Source: AGHT+IGGD7BpEU4LTmFRtF3Uq6Kc+gY9kNk+2fkbJjTYIYQ/unDQIyFXp07CwDoGJjyIkme/z7Qb0g==
X-Received: by 2002:a05:651c:b29:b0:300:2d54:c2c8 with SMTP id
 38308e7fff4ca-3002f8b588dmr11105671fa.8.1733476180093; 
 Fri, 06 Dec 2024 01:09:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db3854sm4204331fa.51.2024.12.06.01.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:09:38 -0800 (PST)
Date: Fri, 6 Dec 2024 11:09:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 09/45] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Message-ID: <4pituhltil4qy5p4yhupnfc2zppqdwe2eqp3h4v5wcf6esz7gy@kekccysqb3q3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-9-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-9-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:40PM -0800, Abhinav Kumar wrote:
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is cached inside the dp_ctrl's private struct. However with MST,
> the cached panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the cached one. For SST cases,
> this shall continue to use the cached dp_panel.

"cached inside the dp_ctrl's private struct" usually means that dp_ctrl
stores a copy of the msm_dp_panel, not just a pointer to it, so the
commit message needs rephrasing.

Also if the stored pointer is (or will be) no longer applicable, can we
drop it completely and always pass the dp_panel by reference? Otherwise
it's hard to know when to pass a new one and when to use ctrl->panel
instead.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>  3 files changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 9e08996be0cb969cb96d9a3019c445ab4dfc92ef..0bed85b5c8e8133ffa8c74d5de22668905396d09 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -134,7 +134,8 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
> +				    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
>  	const u8 *dpcd = ctrl->panel->dpcd;
> @@ -142,7 +143,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	/* Default-> LSCLK DIV: 1/4 LCLK  */
>  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>  
> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>  
>  	/* Scrambler reset enable */
> @@ -150,7 +151,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  		config |= DP_CONFIGURATION_CTRL_ASSR;
>  
>  	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> -			ctrl->panel->msm_dp_mode.bpp);
> +			msm_dp_panel->msm_dp_mode.bpp);
>  
>  	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>  
> @@ -173,20 +174,21 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>  }
>  
> -static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> +						struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 cc, tb;
>  
>  	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>  	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
>  
>  	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
> -		ctrl->panel->msm_dp_mode.bpp);
> +		msm_dp_panel->msm_dp_mode.bpp);
>  	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
>  	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
> -	msm_dp_panel_timing_cfg(ctrl->panel);
> +	msm_dp_panel_timing_cfg(msm_dp_panel);
>  }
>  
>  /*
> @@ -1279,7 +1281,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	u8 assr;
>  	struct msm_dp_link_info link_info = {0};
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl(ctrl, ctrl->panel);
>  
>  	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>  	link_info.rate = ctrl->link->link_params.rate;
> @@ -1696,7 +1698,8 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> -static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
> +static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> +						struct msm_dp_panel *msm_dp_panel)
>  {
>  	int ret;
>  	unsigned long pixel_rate;
> @@ -1720,7 +1723,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  		return ret;
>  	}
>  
> -	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>  	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> @@ -1758,7 +1761,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>  		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
> -		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
> +		if (msm_dp_ctrl_process_phy_test_request(ctrl, ctrl->panel)) {
>  			DRM_ERROR("process phy_test_req failed\n");
>  			return;
>  		}
> @@ -1976,7 +1979,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  	return ret;
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>  {
>  	int ret = 0;
>  	bool mainlink_ready = false;
> @@ -1989,9 +1992,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	pixel_rate = pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>  
> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		pixel_rate >>= 1;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> @@ -2019,12 +2022,12 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	 */
>  	reinit_completion(&ctrl->video_comp);
>  
> -	msm_dp_ctrl_configure_source_params(ctrl);
> +	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
>  	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
>  		ctrl->link->link_params.rate,
>  		pixel_rate_orig,
> -		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>  
>  	msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> @@ -2042,7 +2045,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *dp_panel)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 0f58b63c5c7c5aab43c0db2a697ba491959b79d2..547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -18,7 +18,7 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -42,7 +42,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
> +				   struct msm_dp_panel *msm_dp_panel);
>  void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbce8ca09ff70059458231982f002e1f22d2c3ab..c059f749c1f204deac9dfb0c56f537f5545d9acb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -852,7 +852,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -905,7 +905,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, dp->panel);
>  
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
