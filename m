Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A506510E58
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FC510E18D;
	Wed, 27 Apr 2022 02:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6802810E18C;
 Wed, 27 Apr 2022 02:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651025175; x=1682561175;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0m+dY10uYolN81K4/2jJLNtkRZYeucyRLbTsObn7+EE=;
 b=mrfrRZf5rU0DS7xF9WtiY/ggE05aozdXJPTag/h3Mzj9+50yKwbMA88z
 o+Ss0724vsTb8gZpyaaxlnwE5KfUbsAvIn0Mih/NGLpyTe4o7+89iHToQ
 YANFPDWSzo6Is3mybxwmn8ulDWVOXE91BoVA19khXyQVWtH6H80r43kpX w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 19:06:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 19:06:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 19:06:13 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 19:06:11 -0700
Message-ID: <0b3245d7-1d1e-4e34-004e-821be59451f1@quicinc.com>
Date: Tue, 26 Apr 2022 19:06:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 03/25] drm/msm/dpu: add support for SSPP allocation to RM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
> Add support for handling and allocting SSPP blocks through the resource
> manager. Handling code is not converted to use it though.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 10 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 81 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  6 ++
>   5 files changed, 104 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 1b18de957500..f805c30643b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -388,6 +388,16 @@ struct dpu_hw_pipe {
>   };
>   
>   struct dpu_kms;
> +/**
> + * to_dpu_hw_pipe - convert base object dpu_hw_base to container
> + * @hw: Pointer to base hardware block
> + * return: Pointer to hardware block container
> + */
> +static inline struct dpu_hw_pipe *to_dpu_hw_pipe(struct dpu_hw_blk *hw)
> +{
> +	return container_of(hw, struct dpu_hw_pipe, base);
> +}
> +
>   /**
>    * dpu_hw_sspp_init - initializes the sspp hw driver object.
>    * Should be called once before accessing every pipe.
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4b7f5e..824495ad2392 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -146,6 +146,7 @@ struct dpu_global_state {
>   	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>   	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>   	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +	uint32_t pipe_to_plane_id[SSPP_MAX - SSPP_NONE];
>   };
>   
>   struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c04c3be16d85..146dbccd79cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1235,8 +1235,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
>   		/* this will destroy the states as well */
>   		drm_plane_cleanup(plane);
>   
> -		dpu_hw_sspp_destroy(pdpu->pipe_hw);
> -
>   		kfree(pdpu);
>   	}
>   }
> @@ -1445,14 +1443,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	pdpu->pipe = pipe;
>   
>   	/* initialize underlying h/w driver */
> -	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
> -	if (IS_ERR(pdpu->pipe_hw)) {
> -		DPU_ERROR("[%u]SSPP init failed\n", pipe);
> -		ret = PTR_ERR(pdpu->pipe_hw);
> +	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
>   		goto clean_plane;
> -	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> +	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
> +
> +	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
>   		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
> -		goto clean_sspp;
> +		goto clean_plane;
>   	}
>   
>   	format_list = pdpu->pipe_hw->cap->sblk->format_list;
> @@ -1462,7 +1459,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   				format_list, num_formats,
>   				supported_format_modifiers, type, NULL);
>   	if (ret)
> -		goto clean_sspp;
> +		goto clean_plane;
>   
>   	pdpu->catalog = kms->catalog;
>   
> @@ -1494,9 +1491,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   					pipe, plane->base.id);
>   	return plane;
>   
> -clean_sspp:
> -	if (pdpu && pdpu->pipe_hw)
> -		dpu_hw_sspp_destroy(pdpu->pipe_hw);
>   clean_plane:
>   	kfree(pdpu);
>   	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..21c9e513f1f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -8,6 +8,7 @@
>   #include "dpu_hw_lm.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_pingpong.h"
> +#include "dpu_hw_sspp.h"
>   #include "dpu_hw_intf.h"
>   #include "dpu_hw_dspp.h"
>   #include "dpu_hw_merge3d.h"
> @@ -35,6 +36,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   {
>   	int i;
>   
> +	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks); i++) {
> +		struct dpu_hw_pipe *hw;
> +
> +		if (rm->sspp_blks[i]) {
> +			hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
> +			dpu_hw_sspp_destroy(hw);
> +		}
> +	}
>   	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
>   		struct dpu_hw_pingpong *hw;
>   
> @@ -166,6 +175,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>   		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
>   	}
>   
> +	for (i = 0; i < cat->sspp_count; i++) {
> +		struct dpu_hw_pipe *hw;
> +		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
> +
> +		if (sspp->id <= SSPP_NONE || sspp->id >= SSPP_MAX) {
> +			DPU_ERROR("skip sspp %d with invalid id\n", sspp->id);
> +			continue;
> +		}
> +		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
> +		if (IS_ERR_OR_NULL(hw)) {
> +			rc = PTR_ERR(hw);
> +			DPU_ERROR("failed sspp object creation: err %d\n",
> +				rc);
> +			goto fail;
> +		}
> +		rm->sspp_blks[sspp->id - SSPP_NONE] = &hw->base;
> +	}
> +
>   	for (i = 0; i < cat->intf_count; i++) {
>   		struct dpu_hw_intf *hw;
>   		const struct dpu_intf_cfg *intf = &cat->intf[i];
> @@ -660,3 +687,57 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   
>   	return num_blks;
>   }
> +
> +enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale)
> +{

Right now we have only yuv and scale as requirements for the incoming 
plane. But these requirements can expand.

Do you think a enum req_mask will be a good addition here?
You can start with having 2 masks for YUV and Scale but atleast that way 
its expandable cleanly rather than just increasing function parameters here.


> +	int i;
> +	enum dpu_sspp pipe = SSPP_NONE;
> +	struct dpu_hw_pipe *pipe_hw;
> +	bool retry = false;
> +
> +retry_loop:
> +	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) {
> +		if (!rm->sspp_blks[i])
> +			continue;
> +		if (reserved_by_other(global_state->pipe_to_plane_id, i, plane_id))
> +			continue;
> +
> +		pipe_hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
> +
> +		/* skip incompatible planes */
> +		if (scale && !(pipe_hw->cap->features & DPU_SSPP_SCALER))
> +			continue;
> +
> +		if (yuv && (!(pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> +			    !(pipe_hw->cap->features & DPU_SSPP_CSC_ANY)))
> +			continue;
> +
> +		/* For non-yuv, non-scaled planes try to find simple (DMA)
> +		 * plane, fallback to VIG on a second try.
> +		 *
> +		 * This way we'd leave VIG pipes to be later used for YUV formats.
> +		 */
> +

this strategy should work. I just think we need to validate this quite a 
bit with some real world cases such as video playback with UI layers, 
opening and closing video players, browsers etc.

I am yet to review the usage of this in the next patches, but yes if 
even this wont kick in for small layers, we are protected.


> +		if (!scale && !yuv && !retry &&
> +		    (pipe_hw->cap->features & (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY)))
> +			continue;
> +
> +		pipe = i + SSPP_NONE;
> +	};
> +
> +	if (!scale && !yuv && !retry && pipe == SSPP_NONE) {
> +		retry = true;
> +		goto retry_loop;
> +	}
> +
> +	if (pipe != SSPP_NONE)
> +		global_state->pipe_to_plane_id[pipe - SSPP_NONE] = plane_id;
> +
> +	return pipe;
> +}
> +
> +void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id)
> +{
> +	_dpu_rm_clear_mapping(global_state->pipe_to_plane_id,
> +			ARRAY_SIZE(global_state->pipe_to_plane_id), plane_id);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..b759fe39f6d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -16,6 +16,7 @@ struct dpu_global_state;
>   /**
>    * struct dpu_rm - DPU dynamic hardware resource manager
>    * @pingpong_blks: array of pingpong hardware resources
> + * @sspp_blks: array of sspp hardware resources
>    * @mixer_blks: array of layer mixer hardware resources
>    * @ctl_blks: array of ctl hardware resources
>    * @intf_blks: array of intf hardware resources
> @@ -25,6 +26,7 @@ struct dpu_global_state;
>    */
>   struct dpu_rm {
>   	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> +	struct dpu_hw_blk *sspp_blks[SSPP_MAX - SSPP_NONE];
>   	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>   	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>   	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
> @@ -88,5 +90,9 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   	struct dpu_global_state *global_state, uint32_t enc_id,
>   	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
> +
> +enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale);
> +void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id);
> +
>   #endif /* __DPU_RM_H__ */
>   
