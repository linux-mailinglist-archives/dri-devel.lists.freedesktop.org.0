Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389934E5995
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11BB10E119;
	Wed, 23 Mar 2022 20:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6B410E0EA;
 Wed, 23 Mar 2022 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648066155; x=1679602155;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3vw5NtjQuL3uQ5yXzFrZHiwEqyZsdFKPXNf3Lz2V6Z8=;
 b=vXoa4fj4xkMCkoIgixpJUVLUByra8RHNywRjSrNahsoYMW2t+Phle9VN
 xbz4luykMwOh/lDuSUKwPAI2E4w92vhVF41Ht6PQjGkrtscqa2y6/Wb/Z
 tHQULbksVRqAsiguOOXOBBVaLu/UKL6+fJ5oDopvfboIOX4IXwbejDml3 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Mar 2022 13:09:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 13:09:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:09:14 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:09:13 -0700
Message-ID: <2a88a533-56ec-6445-aae9-ab1e97370a88@quicinc.com>
Date: Wed, 23 Mar 2022 13:09:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 12/22] drm/msm: Use drm_mode_copy()
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-13-ville.syrjala@linux.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220218100403.7028-13-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/18/2022 2:03 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> Even if we know the destination mode is not on any list
> using drm_mode_copy() seems decent as it sets a good
> example. Bad examples of not using it might eventually
> get copied into code where preserving the list head
> actually matters.
> 
> Obviously one case not covered here is when the mode
> itself is embedded in a larger structure and the whole
> structure is copied. But if we are careful when copying
> into modes embedded in structures I think we can be a
> little more reassured that bogus list heads haven't been
> propagated in.
> 
> @is_mode_copy@
> @@
> drm_mode_copy(...)
> {
> ...
> }
> 
> @depends on !is_mode_copy@
> struct drm_display_mode *mode;
> expression E, S;
> @@
> (
> - *mode = E
> + drm_mode_copy(mode, &E)
> |
> - memcpy(mode, E, S)
> + drm_mode_copy(mode, E)
> )
> 
> @depends on !is_mode_copy@
> struct drm_display_mode mode;
> expression E;
> @@
> (
> - mode = E
> + drm_mode_copy(&mode, &E)
> |
> - memcpy(&mode, E, S)
> + drm_mode_copy(&mode, E)
> )
> 
> @@
> struct drm_display_mode *mode;
> @@
> - &*mode
> + mode
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c                  | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 34a6940d12c5..57592052af23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -157,7 +157,7 @@ static void dpu_encoder_phys_cmd_mode_set(
>   		DPU_ERROR("invalid args\n");
>   		return;
>   	}
> -	phys_enc->cached_mode = *adj_mode;
> +	drm_mode_copy(&phys_enc->cached_mode, adj_mode);
>   	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
>   	drm_mode_debug_printmodeline(adj_mode);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index e7813c6f7bd9..d5deca07b65a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -370,7 +370,7 @@ static void dpu_encoder_phys_vid_mode_set(
>   	struct dpu_encoder_irq *irq;
>   
>   	if (adj_mode) {
> -		phys_enc->cached_mode = *adj_mode;
> +		drm_mode_copy(&phys_enc->cached_mode, adj_mode);
>   		drm_mode_debug_printmodeline(adj_mode);
>   		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
>   	}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7cc4d21f2091..2ed6028ca8d6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -825,7 +825,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>   
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	dp->panel->dp_mode.drm_mode = mode->drm_mode;
> +	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
>   	dp->panel->dp_mode.bpp = mode->bpp;
>   	dp->panel->dp_mode.capabilities = mode->capabilities;
>   	dp_panel_init_panel_info(dp->panel);
