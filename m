Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C0E5356FD
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 02:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020010E204;
	Fri, 27 May 2022 00:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD2910E1DB;
 Fri, 27 May 2022 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653610492; x=1685146492;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LsnUhSF3s0d8SgUuqxOT68WM2m+iGMIBFQKcHjDdf3I=;
 b=m81kF4n1t4GNeDo8zFlWKBF6jyuS7MxBI9NoTeHlSLfm36Xcvjc8WYZx
 TbSkaxHsKn0Jl9iwFwe9dV98EGun3eMTRerPIR+KmEkXMdJ399kOGBkgM
 B8k4r4iPyEF5ks15I6Jgg3FTI7Z+CfpRJdoepdAqHiKGFdaPn2Faq/xPe Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 May 2022 17:14:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 17:14:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 26 May 2022 17:14:51 -0700
Received: from [10.111.172.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 26 May
 2022 17:14:49 -0700
Message-ID: <99964cc8-b5ce-5454-59ac-de9355dbff52@quicinc.com>
Date: Thu, 26 May 2022 17:14:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 18/25] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-19-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-19-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> Remove plane checks/state updates from dpu_crtc_atomic_check(). The
> belong to dpu_plane_atomic_check().
> 
The --> They
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 44 -----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 +++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ----
>   3 files changed, 10 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index cbd0e50c2bd3..fa279f0358d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1054,14 +1054,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>   
> -	const struct drm_plane_state *pstate;
> -	struct drm_plane *plane;
>   	struct drm_display_mode *mode;
>   
>   	int rc = 0;
>   
> -	struct drm_rect crtc_rect = { 0 };
> -
>   	if (!crtc_state->enable || !crtc_state->active) {
>   		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>   				crtc->base.id, crtc_state->enable,
> @@ -1080,46 +1076,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	if (cstate->num_mixers)
>   		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
>   
> -	crtc_rect.x2 = mode->hdisplay;
> -	crtc_rect.y2 = mode->vdisplay;
> -
> -	 /* get plane state for all drm planes associated with crtc state */
> -	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> -		struct drm_rect dst, clip = crtc_rect;
> -		int z_pos;
> -
> -		if (IS_ERR_OR_NULL(pstate)) {
> -			rc = PTR_ERR(pstate);
> -			DPU_ERROR("%s: failed to get plane%d state, %d\n",
> -					dpu_crtc->name, plane->base.id, rc);
> -			return rc;
> -		}
> -
> -		dpu_plane_clear_multirect(pstate);
> -
> -		dst = drm_plane_state_dest(pstate);
> -		if (!drm_rect_intersect(&clip, &dst)) {
> -			DPU_ERROR("invalid vertical/horizontal destination\n");
> -			DPU_ERROR("display: " DRM_RECT_FMT " plane: "
> -				  DRM_RECT_FMT "\n", DRM_RECT_ARG(&crtc_rect),
> -				  DRM_RECT_ARG(&dst));
> -			return -E2BIG;
> -		}

Doesnt this check also have to be moved? We need to make sure dest 
rectangle is within CRTC bounds?

> -
> -		z_pos = pstate->normalized_zpos;
> -
> -		/* verify z_pos setting before using it */
> -		if (z_pos >= DPU_STAGE_MAX - DPU_STAGE_0) {
> -			DPU_ERROR("> %d plane stages assigned\n",
> -					DPU_STAGE_MAX - DPU_STAGE_0);
> -			return -EINVAL;
> -		}
> -
> -		to_dpu_plane_state(pstate)->stage = z_pos + DPU_STAGE_0;
> -		DRM_DEBUG_ATOMIC("%s: zpos %d\n", dpu_crtc->name, z_pos);
> -
> -	}
> -
>   	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
>   
>   	rc = dpu_core_perf_crtc_check(crtc, crtc_state);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index b2395f02f6d3..637d164667e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -702,14 +702,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	return 0;
>   }
>   
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
> -{
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
> -
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -}
> -
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>   {
>   	struct dpu_plane_state *pstate[R_MAX];
> @@ -931,6 +923,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> +	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> +	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +	if (pstate->stage >= DPU_STAGE_MAX) {
> +		DPU_ERROR("> %d plane stages assigned\n",
> +				DPU_STAGE_MAX - DPU_STAGE_0);
> +		return -EINVAL;
> +	}
> +
>   	src.x1 = new_plane_state->src_x >> 16;
>   	src.y1 = new_plane_state->src_y >> 16;
>   	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index b6fd6f856d6a..e61c57b045ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -83,12 +83,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>    */
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
>   
> -/**
> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
> - * @drm_state: Pointer to DRM plane state
> - */
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
> -
>   /**
>    * dpu_plane_color_fill - enables color fill on plane
>    * @plane:  Pointer to DRM plane object
