Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380639E69DD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23F110F03D;
	Fri,  6 Dec 2024 09:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xfc/JOB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45D010F03D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:14:23 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ffbfee94d7so15294671fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733476462; x=1734081262; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nntj0vr3sSuMkDDvLjAvt9OkCo7KS9A001W3Zyy1XKs=;
 b=Xfc/JOB4hvFREqluDLPmGZ1zMA6WrvwjZjY7aC/PsLlYRJYUUHjKXM9hOApdzJteKy
 9YGPUaABxp+fYoPPMO1Zda85TjaeMHIVY+ggT1XMklCBNrI2/wYwpoK06xOXEgURo9Uc
 AqZgaRADmDNmNFRLX7wGhYTq/FsJUf1xL74V6+7K8hFvxlQM80S2hWMa6+lAr5V1KTfC
 VDYN8GngOYyjBPiKhxkLW8BNAbFq91yHoxI0g5ZRvBT0ubW/TuetapnZkung4HmDFuPg
 soHKIxPRzAQu4zcbjLNDYlun4s/RtWIM7gc0I4R6U8cQwJ0zc2DXIaOz5ScNjrH4BsG3
 lilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733476462; x=1734081262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nntj0vr3sSuMkDDvLjAvt9OkCo7KS9A001W3Zyy1XKs=;
 b=HzAC0MmfuwWe0NfB67ntYpY/dJPKcq4cgggUGgQAMrwUwzkAe+JP2rNBdt5Ob5JzBO
 9dRjO4+HqC7nWLYYmjANzGrNm6xMNgHGskp9lmn9/UpIBxe5afnN/zZIM1umOBoNndZM
 NQEEqlLiWXidFMZ0T+MMUU4rB98MScQkOa0G4kESRXiMCbPg1FesNb9FSqlKseC3rfwd
 FfJuqWoHmstC0ZECC3hMtuCWripx7vtFk9dUXqJSBJCxBYTwdRJJJugxnzv118sZ/t0v
 sO9vw6/HjpJFwsMZLj3yfeFTsyBUGVo3yAdmzH6IMKMkqO9Jh3oFjfC9c24O0AZIkb2t
 eBTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAm19WCTjb207Sb/uI1d6eK7r6k5a+BvSaSjPK82gTiTH/JqM++s4Ng150c5xJsSFkAL+de0oYOI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4/bt6t1yazwRYGuvkdd/SeswcZrvqEkWpaO8n28CZElCjxz7U
 tODbIw5X/OzVBHIQnRKM2HlELFj6AoxjIqX1RqxVi/Ny67PwZOUV5qIxvYnQKig=
X-Gm-Gg: ASbGncsJSHOVxu8RGd6viP7P6pha2fexNHVpkWcjOppUZs01/3xo1fXNUHDIsmLXY9j
 SgAXGkUeAmmSRscZI5xRpeh45zN2vXk5yatjInJo+2tbrBnbr9/jKAGMdRHdVpbS/3gyYnuGsoR
 nTzuuguYlBoxFi5B88vQld9Gqo5FMxQuSR4LNxHFuD0m73/7Tp9j6q/J3BgWklZGGhO7wBfN4wH
 DiqxCNmI6XqJkLClvI+DlviQY/UY7xEMazhgCBdK6x6cs9WGbqNoMWDNSbDFVRobTwo7CFUUfNR
 GhDB2+a7v1h3QETfkhmy06Nv5/Jhbg==
X-Google-Smtp-Source: AGHT+IGeULY30Ge8vUZIm0lr+henqDGul8jwzbkSBs8yjUR7FgUITuGkZXPcAseJRkhVj5nlhBQZqQ==
X-Received: by 2002:a2e:9a0e:0:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-3002f8c4d83mr7019641fa.16.1733476461886; 
 Fri, 06 Dec 2024 01:14:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020e20581sm4050831fa.77.2024.12.06.01.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:14:20 -0800 (PST)
Date: Fri, 6 Dec 2024 11:14:18 +0200
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
Subject: Re: [PATCH 11/45] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:42PM -0800, Abhinav Kumar wrote:
> Split dp_ctrl_off() into stream and link parts so that for MST
> cases we can control the link and pixel parts separately.

Please start by describing the problem.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++--------------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
>  3 files changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 118f5ed83e464f9f27f813eb39624f9c3189f5ac..485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1739,7 +1739,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	 * running. Add the global reset just before disabling the
>  	 * link clocks and core clocks.
>  	 */
> -	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);

Huh? What happened with the rest of the msm_dp_ctrl_off() code sequence?
It got dropped, but the commit message tells nothing about it.

>  
>  	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
>  	if (ret) {
> @@ -2042,7 +2043,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	return ret;
>  }
>  
> -static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
> @@ -2110,30 +2111,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  		phy, phy->init_count, phy->power_count);
>  }
>  
> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> -{
> -	struct msm_dp_ctrl_private *ctrl;
> -	struct phy *phy;
> -
> -	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> -	phy = ctrl->phy;
> -
> -	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> -
> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> -
> -	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
> -
> -	dev_pm_opp_set_rate(ctrl->dev, 0);
> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> -
> -	phy_power_off(phy);
> -	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
> -			phy, phy->init_count, phy->power_count);
> -}
> -
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da..887cf5a866f07cb9038887a0634d3e1a0375879c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c059f749c1f204deac9dfb0c56f537f5545d9acb..b0458bbc89e934ca33ed5af3f2a8ebca30b50824 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -911,7 +911,9 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (dp->link->sink_count == 0)
>  		msm_dp_ctrl_psm_config(dp->ctrl);
>  
> -	msm_dp_ctrl_off(dp->ctrl);
> +	msm_dp_ctrl_stream_clk_off(dp->ctrl);
> +
> +	msm_dp_ctrl_off_link(dp->ctrl);
>  
>  	/* re-init the PHY so that we can listen to Dongle disconnect */
>  	if (dp->link->sink_count == 0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
