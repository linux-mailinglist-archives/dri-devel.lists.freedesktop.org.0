Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5374B31B0
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 01:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E3210EB64;
	Sat, 12 Feb 2022 00:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9410EB64
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 00:08:36 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x15so2308151lfu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fpuJk97y1P3INpszoMWNPASFD8WJwAEC9DcU0jepr5o=;
 b=IRwDDOFZajJji9JXq8duBKdB2OkSnpOAssJxOlRsyPPtsIlX5VKDOLP0BqZPpl9DVh
 PsXqQ2xxSouRUnoOQd+w8lbULOZ1N+IJMslyUtdHHMR8elvNR3E0CCTEsTAkNhvgDOhJ
 Qa4eIsQPXSVfkWBOMZmtez3vojxZFJFOhWGD7qfQajkNSf728taGpKPUmdn1tuooFKh6
 ZbCtj2+EFHMkNxzgI/g5KFpGl3NXhTDlFyV5tcSHXOcEYZHR6Hc91y6S+LV5T3fo3ft4
 oYdYAicI0L6EpqqOcSA2AYtC/n5KScv+3+Qkw1O9Ened+U6GXtJ9tBJp2nf4ekVMtIOD
 5zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fpuJk97y1P3INpszoMWNPASFD8WJwAEC9DcU0jepr5o=;
 b=NqwQW/Niz7DSDedQE0S0k5PSGU5OIQkpkklryXTm0ueDbmRfgA9y31BXgxi3YvW30H
 YIUlfvH48tVjnS7iHRLn5WQaCER24nGgYGdSjQ+HkSvX0/R8gh+QOm/xm+oeFIQTbQNc
 t6upFLDIhhgOjBf/XUPZl3RzoVyKQ5l5++lYITLdT9cUNSgzjyRp0DffuwSLhOrkUXzE
 0eoC89g+en37JUPdyW+MWaVz1Wat+rDuhFU2ZidAZYQhiwyJSSVJSoXVjLUoMbOUctj8
 alou69hZwodWX1GKgSbS2KyuX75Gztws4AZ43od3vGYmxxyGpXubPPo6EQV7/+Wd06eb
 Rgaw==
X-Gm-Message-State: AOAM533YTZKmVKKHX2dJ8XM8Ixrf+IkaQkEW6GQFdYK8D4eVHvvv8Je9
 U2BRG4ZY3ObrnWFcHPScYc781w==
X-Google-Smtp-Source: ABdhPJyBJwiUC+IpTf0MdOxowKjJzNud0vmI2g/HKsijMC47G4wihhm/XdPtvoeFKpQLsf8WJZxCMA==
X-Received: by 2002:a05:6512:39c2:: with SMTP id
 k2mr2708271lfu.586.1644624514701; 
 Fri, 11 Feb 2022 16:08:34 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i12sm1080781lfr.167.2022.02.11.16.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 16:08:34 -0800 (PST)
Message-ID: <d77140f5-73b3-b9a4-aa4b-b240105eb5d4@linaro.org>
Date: Sat, 12 Feb 2022 03:08:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm: populate intf_audio_select() base on hardware
 capability
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
 airlied@linux.ie, agross@kernel.org, bjorn.andersson@linaro.org
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2022 02:23, Kuogee Hsieh wrote:
> intf_audio_select() callback function use to configure
> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> interface. HDMI is obsoleted at newer chipset. To keep supporting
> legacy hdmi application, intf_audio_select call back function have
> to be populated base on hardware chip capability where legacy
> chipsets have has_audio_select flag set to true.

So, after thinking more about the patch, I have a bunch of questions:

You are enabling this callback only for sdm845 and sm8150.

Does this register exist on other (newer) platforms (but just defaults 
to DP)?

Neither sdm845 nor sm8150 support INTF_HDMI. What's the purpose of the 
register on these platforms?

Does that mean that we should program the register for HDMI (e.g. on 8998)?

And, as you are touching this piece of code, how do we control audio 
routing on newer platforms which have several hardware DP interfaces?


> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 272b14b..23680e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
>   	.has_3d_merge = true,
> +	.has_audio_select = true,
>   	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>   	.has_dim_layer = true,
>   	.has_idle_pc = true,
>   	.has_3d_merge = true,
> +	.has_audio_select = true,
>   	.max_linewidth = 4096,
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   	.max_hdeci_exp = MAX_HORZ_DECIMATION,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e5a96d6..b33f91b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -357,6 +357,7 @@ struct dpu_caps {
>   	bool has_dim_layer;
>   	bool has_idle_pc;
>   	bool has_3d_merge;
> +	bool has_audio_select;
>   	/* SSPP limits */
>   	u32 max_linewidth;
>   	u32 pixel_ram_size;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 282e3c6..e608f4d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
>   }
>   
>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> -		unsigned long cap)
> +		unsigned long cap,
> +		const struct dpu_mdss_cfg *m)
>   {
>   	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>   	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>   	ops->get_danger_status = dpu_hw_get_danger_status;
>   	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
>   	ops->get_safe_status = dpu_hw_get_safe_status;
> -	ops->intf_audio_select = dpu_hw_intf_audio_select;
> +
> +	if (m->caps->has_audio_select)
> +		ops->intf_audio_select = dpu_hw_intf_audio_select;
>   }
>   
>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
>   	 */
>   	mdp->idx = idx;
>   	mdp->caps = cfg;
> -	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
> +	_setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
>   
>   	return mdp;
>   }


-- 
With best wishes
Dmitry
