Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E43751E198
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834F310E494;
	Fri,  6 May 2022 22:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40310E43B;
 Fri,  6 May 2022 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651875898; x=1683411898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r59VCrCsgsKUaCsQChb61ImErFL2YZ/I18OorrXID9Y=;
 b=Y2J0sx3Zz+w5An5raiKkb2ZIUUBf7JcqF2tRd0v6sjYHXVJ8xKQbL0XE
 Q/RFF2n79U8OPtsO4wO55wb1abFBMQw+N6BZHwcoFqw3PK2EG1NOxGM3c
 N+TfqFB32n8VF9grai2u7RAIRZ7GCnO8QCoCFhiq2pC64XORVmhBzk/fh w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 06 May 2022 15:24:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 15:24:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 15:24:26 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 15:24:23 -0700
Message-ID: <ac7086dc-51c9-308c-486b-01edde562039@quicinc.com>
Date: Fri, 6 May 2022 15:24:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/25] drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp
 callbacks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-12-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-12-dmitry.baryshkov@linaro.org>
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
> Where feasible, use dpu_sw_pipe rather than a combo of dpu_hw_pipe and
> multirect_index/_mode arguments.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 59 ++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 46 ++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 62 +++++++++------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  9 ++-
>   4 files changed, 77 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 8714ee767346..d8120168f974 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -168,17 +168,16 @@ static int _sspp_subblk_offset(struct dpu_hw_pipe *ctx,
>   	return rc;
>   }
>   
> -static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
> -		enum dpu_sspp_multirect_index index,
> -		enum dpu_sspp_multirect_mode mode)
> +static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	u32 mode_mask;
>   	u32 idx;
>   
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> -	if (index == DPU_SSPP_RECT_SOLO) {
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>   		/**
>   		 * if rect index is RECT_SOLO, we cannot expect a
>   		 * virtual plane sharing the same SSPP id. So we go
> @@ -187,8 +186,8 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_hw_pipe *ctx,
>   		mode_mask = 0;
>   	} else {
>   		mode_mask = DPU_REG_READ(&ctx->hw, SSPP_MULTIRECT_OPMODE + idx);
> -		mode_mask |= index;
> -		if (mode == DPU_SSPP_MULTIRECT_TIME_MX)
> +		mode_mask |= pipe->multirect_index;
> +		if (pipe->multirect_mode == DPU_SSPP_MULTIRECT_TIME_MX)
>   			mode_mask |= BIT(2);
>   		else
>   			mode_mask &= ~BIT(2);
> @@ -239,10 +238,10 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
>   /*
>    * Setup source pixel format, flip,
>    */
> -static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
> -		const struct dpu_format *fmt, u32 flags,
> -		enum dpu_sspp_multirect_index rect_mode)
> +static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> +		const struct dpu_format *fmt, u32 flags)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	struct dpu_hw_blk_reg_map *c;
>   	u32 chroma_samp, unpack, src_format;
>   	u32 opmode = 0;
> @@ -253,7 +252,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx) || !fmt)
>   		return;
>   
> -	if (rect_mode == DPU_SSPP_RECT_SOLO || rect_mode == DPU_SSPP_RECT_0) {
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> +	    pipe->multirect_index == DPU_SSPP_RECT_0) {
>   		op_mode_off = SSPP_SRC_OP_MODE;
>   		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
>   		format_off = SSPP_SRC_FORMAT;
> @@ -443,10 +443,10 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
>   /*
>    * dpu_hw_sspp_setup_rects()
>    */
> -static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cfg *cfg,
> -		enum dpu_sspp_multirect_index rect_index)
> +static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
> +		struct dpu_hw_pipe_cfg *cfg)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	struct dpu_hw_blk_reg_map *c;
>   	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
>   	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
> @@ -457,7 +457,8 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>   
>   	c = &ctx->hw;
>   
> -	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) {
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> +	    pipe->multirect_index == DPU_SSPP_RECT_0) {
>   		src_size_off = SSPP_SRC_SIZE;
>   		src_xy_off = SSPP_SRC_XY;
>   		out_size_off = SSPP_OUT_SIZE;
> @@ -478,7 +479,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>   	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
>   		drm_rect_width(&cfg->dst_rect);
>   
> -	if (rect_index == DPU_SSPP_RECT_SOLO) {
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>   		ystride0 = (cfg->layout.plane_pitch[0]) |
>   			(cfg->layout.plane_pitch[1] << 16);
>   		ystride1 = (cfg->layout.plane_pitch[2]) |
> @@ -487,7 +488,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>   		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
>   		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
>   
> -		if (rect_index == DPU_SSPP_RECT_0) {
> +		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>   			ystride0 = (ystride0 & 0xFFFF0000) |
>   				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
>   			ystride1 = (ystride1 & 0xFFFF0000)|
> @@ -512,21 +513,21 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
> -static void dpu_hw_sspp_setup_sourceaddress(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cfg *cfg,
> -		enum dpu_sspp_multirect_index rect_mode)
> +static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
> +		struct dpu_hw_pipe_cfg *cfg)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	int i;
>   	u32 idx;
>   
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> -	if (rect_mode == DPU_SSPP_RECT_SOLO) {
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>   		for (i = 0; i < ARRAY_SIZE(cfg->layout.plane_addr); i++)
>   			DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx + i * 0x4,
>   					cfg->layout.plane_addr[i]);
> -	} else if (rect_mode == DPU_SSPP_RECT_0) {
> +	} else if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC0_ADDR + idx,
>   				cfg->layout.plane_addr[0]);
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC2_ADDR + idx,
> @@ -556,15 +557,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
>   	dpu_hw_csc_setup(&ctx->hw, idx, data, csc10);
>   }
>   
> -static void dpu_hw_sspp_setup_solidfill(struct dpu_hw_pipe *ctx, u32 color, enum
> -		dpu_sspp_multirect_index rect_index)
> +static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	u32 idx;
>   
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> -	if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0)
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> +	    pipe->multirect_index == DPU_SSPP_RECT_0)
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
>   	else
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR_REC1 + idx,
> @@ -626,10 +628,10 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
>   	DPU_REG_WRITE(&ctx->hw, SSPP_QOS_CTRL + idx, qos_ctrl);
>   }
>   
> -static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cdp_cfg *cfg,
> -		enum dpu_sspp_multirect_index index)
> +static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> +		struct dpu_hw_pipe_cdp_cfg *cfg)
>   {
> +	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	u32 idx;
>   	u32 cdp_cntl = 0;
>   	u32 cdp_cntl_offset = 0;
> @@ -640,7 +642,8 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> -	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> +	    pipe->multirect_index == DPU_SSPP_RECT_0)
>   		cdp_cntl_offset = SSPP_CDP_CNTL;
>   	else
>   		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 0af2bc6e5df8..74171fb4e585 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -234,24 +234,20 @@ struct dpu_sw_pipe {
>   struct dpu_hw_sspp_ops {
>   	/**
>   	 * setup_format - setup pixel format cropping rectangle, flip
> -	 * @ctx: Pointer to pipe context
> +	 * @pipe: Pointer to software pipe context
>   	 * @cfg: Pointer to pipe config structure
>   	 * @flags: Extra flags for format config
> -	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_format)(struct dpu_hw_pipe *ctx,
> -			const struct dpu_format *fmt, u32 flags,
> -			enum dpu_sspp_multirect_index index);
> +	void (*setup_format)(struct dpu_sw_pipe *pipe,
> +			const struct dpu_format *fmt, u32 flags);
>   
>   	/**
>   	 * setup_rects - setup pipe ROI rectangles
> -	 * @ctx: Pointer to pipe context
> +	 * @pipe: Pointer to software pipe context
>   	 * @cfg: Pointer to pipe config structure
> -	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_rects)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cfg *cfg,
> -			enum dpu_sspp_multirect_index index);
> +	void (*setup_rects)(struct dpu_sw_pipe *pipe,
> +			struct dpu_hw_pipe_cfg *cfg);
>   
>   	/**
>   	 * setup_pe - setup pipe pixel extension
> @@ -263,13 +259,11 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_sourceaddress - setup pipe source addresses
> -	 * @ctx: Pointer to pipe context
> +	 * @pipe: Pointer to software pipe context
>   	 * @cfg: Pointer to pipe config structure
> -	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_sourceaddress)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cfg *cfg,
> -			enum dpu_sspp_multirect_index index);
> +	void (*setup_sourceaddress)(struct dpu_sw_pipe *ctx,
> +			struct dpu_hw_pipe_cfg *cfg);
>   
>   	/**
>   	 * setup_csc - setup color space coversion
> @@ -280,24 +274,18 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_solidfill - enable/disable colorfill
> -	 * @ctx: Pointer to pipe context
> +	 * @pipe: Pointer to software pipe context
>   	 * @const_color: Fill color value
>   	 * @flags: Pipe flags
> -	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_solidfill)(struct dpu_hw_pipe *ctx, u32 color,
> -			enum dpu_sspp_multirect_index index);
> +	void (*setup_solidfill)(struct dpu_sw_pipe *pipe, u32 color);
>   
>   	/**
>   	 * setup_multirect - setup multirect configuration
> -	 * @ctx: Pointer to pipe context
> -	 * @index: rectangle index in multirect
> -	 * @mode: parallel fetch / time multiplex multirect mode
> +	 * @pipe: Pointer to software pipe context
>   	 */
>   
> -	void (*setup_multirect)(struct dpu_hw_pipe *ctx,
> -			enum dpu_sspp_multirect_index index,
> -			enum dpu_sspp_multirect_mode mode);
> +	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
>   
>   	/**
>   	 * setup_sharpening - setup sharpening
> @@ -362,13 +350,11 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_cdp - setup client driven prefetch
> -	 * @ctx: Pointer to pipe context
> +	 * @pipe: Pointer to software pipe context
>   	 * @cfg: Pointer to cdp configuration
> -	 * @index: rectangle index in multirect
>   	 */
> -	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cdp_cfg *cfg,
> -			enum dpu_sspp_multirect_index index);
> +	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
> +			struct dpu_hw_pipe_cdp_cfg *cfg);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 51b5e8a3182b..d029ce806039 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -506,16 +506,13 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
>   	else if (ret)
>   		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>   	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
> -		trace_dpu_plane_set_scanout(pstate->pipe.sspp->idx,
> -					    &pipe_cfg->layout,
> -					    pstate->pipe.multirect_index);
> -		pstate->pipe.sspp->ops.setup_sourceaddress(pstate->pipe.sspp, pipe_cfg,
> -						pstate->pipe.multirect_index);
> +		trace_dpu_plane_set_scanout(&pstate->pipe,
> +					    &pipe_cfg->layout);
> +		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, pipe_cfg);
>   	}
>   }
>   
> -static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
> -		struct dpu_plane_state *pstate,
> +static void _dpu_plane_setup_scaler3(struct dpu_hw_pipe *pipe_hw,
>   		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>   		struct dpu_hw_scaler3_cfg *scale_cfg,
>   		struct dpu_hw_pixel_ext *pixel_ext,
> @@ -553,7 +550,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   			scale_cfg->src_height[i] /= chroma_subsmpl_v;
>   		}
>   
> -		if (pstate->pipe.sspp->cap->features &
> +		if (pipe_hw->cap->features &
>   			BIT(DPU_SSPP_SCALER_QSEED4)) {
>   			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>   			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> @@ -637,11 +634,11 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>   	return csc_ptr;
>   }
>   
> -static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
> -		struct dpu_plane_state *pstate,
> +static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
>   		const struct dpu_format *fmt, bool color_fill,
>   		struct dpu_hw_pipe_cfg *pipe_cfg)
>   {
> +	struct dpu_hw_pipe *pipe_hw = pipe->sspp;
>   	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
>   	struct dpu_hw_scaler3_cfg scaler3_cfg;
>   	struct dpu_hw_pixel_ext pixel_ext;
> @@ -651,7 +648,7 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   
>   	/* don't chroma subsample if decimating */
>   	/* update scaler. calculate default config for QSEED3 */
> -	_dpu_plane_setup_scaler3(pdpu, pstate,
> +	_dpu_plane_setup_scaler3(pipe_hw,
>   			drm_rect_width(&pipe_cfg->src_rect),
>   			drm_rect_height(&pipe_cfg->src_rect),
>   			drm_rect_width(&pipe_cfg->dst_rect),
> @@ -659,8 +656,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   			&scaler3_cfg, &pixel_ext, fmt,
>   			info->hsub, info->vsub);
>   
> -	if (pstate->pipe.sspp->ops.setup_pe)
> -		pstate->pipe.sspp->ops.setup_pe(pstate->pipe.sspp,
> +	if (pipe_hw->ops.setup_pe)
> +		pipe_hw->ops.setup_pe(pipe_hw,
>   				&pixel_ext);
>   
>   	/**
> @@ -668,9 +665,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   	 * bypassed. Still we need to update alpha and bitwidth
>   	 * ONLY for RECT0
>   	 */
> -	if (pstate->pipe.sspp->ops.setup_scaler &&
> -			pstate->pipe.multirect_index != DPU_SSPP_RECT_1)
> -		pstate->pipe.sspp->ops.setup_scaler(pstate->pipe.sspp,
> +	if (pipe_hw->ops.setup_scaler &&
> +			pipe->multirect_index != DPU_SSPP_RECT_1)
> +		pipe_hw->ops.setup_scaler(pipe_hw,
>   				pipe_cfg,
>   				&scaler3_cfg);
>   }
> @@ -700,9 +697,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   
>   	/* update sspp */
>   	if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
> -		pstate->pipe.sspp->ops.setup_solidfill(pstate->pipe.sspp,
> -				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
> -				pstate->pipe.multirect_index);
> +		pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
> +				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
>   
>   		/* override scaler/decimation if solid fill */
>   		pipe_cfg.dst_rect = pstate->base.dst;
> @@ -715,16 +711,14 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   			drm_rect_height(&pipe_cfg.dst_rect);
>   
>   		if (pstate->pipe.sspp->ops.setup_format)
> -			pstate->pipe.sspp->ops.setup_format(pstate->pipe.sspp,
> -					fmt, DPU_SSPP_SOLID_FILL,
> -					pstate->pipe.multirect_index);
> +			pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
> +					fmt, DPU_SSPP_SOLID_FILL);
>   
>   		if (pstate->pipe.sspp->ops.setup_rects)
> -			pstate->pipe.sspp->ops.setup_rects(pstate->pipe.sspp,
> -					&pipe_cfg,
> -					pstate->pipe.multirect_index);
> +			pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
> +					&pipe_cfg);
>   
> -		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
> +		_dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg);
>   	}
>   
>   	return 0;
> @@ -1112,18 +1106,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	}
>   
>   	if (pipe->sspp->ops.setup_rects) {
> -		pipe->sspp->ops.setup_rects(pipe->sspp,
> -				&pipe_cfg,
> -				pipe->multirect_index);
> +		pipe->sspp->ops.setup_rects(pipe,
> +				&pipe_cfg);
>   	}
>   
> -	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
> +	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg);
>   
>   	if (pipe->sspp->ops.setup_multirect)
>   		pipe->sspp->ops.setup_multirect(
> -				pipe->sspp,
> -				pipe->multirect_index,
> -				pipe->multirect_mode);
> +				pipe);
>   
>   	if (pipe->sspp->ops.setup_format) {
>   		unsigned int rotation;
> @@ -1142,8 +1133,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   			src_flags |= DPU_SSPP_FLIP_UD;
>   
>   		/* update format */
> -		pipe->sspp->ops.setup_format(pipe->sspp, fmt, src_flags,
> -				pipe->multirect_index);
> +		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
>   
>   		if (pipe->sspp->ops.setup_cdp) {
>   			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
> @@ -1159,7 +1149,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   					DPU_FORMAT_IS_TILE(fmt);
>   			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
>   
> -			pipe->sspp->ops.setup_cdp(pipe->sspp, &cdp_cfg, pipe->multirect_index);
> +			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index ecd2f371374d..11b61f9777eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -759,18 +759,17 @@ TRACE_EVENT(dpu_crtc_disable_frame_pending,
>   );
>   
>   TRACE_EVENT(dpu_plane_set_scanout,
> -	TP_PROTO(enum dpu_sspp index, struct dpu_hw_fmt_layout *layout,
> -		 enum dpu_sspp_multirect_index multirect_index),
> -	TP_ARGS(index, layout, multirect_index),
> +	TP_PROTO(struct dpu_sw_pipe *pipe, struct dpu_hw_fmt_layout *layout),
> +	TP_ARGS(pipe, layout),
>   	TP_STRUCT__entry(
>   		__field(	enum dpu_sspp,			index	)
>   		__field_struct(	struct dpu_hw_fmt_layout,	layout	)
>   		__field(	enum dpu_sspp_multirect_index,	multirect_index)
>   	),
>   	TP_fast_assign(
> -		__entry->index = index;
> +		__entry->index = pipe->sspp.idx;
>   		__entry->layout = *layout;
> -		__entry->multirect_index = multirect_index;
> +		__entry->multirect_index = pipe->multirect_index;
>   	),
>   	TP_printk("index:%d layout:{%ux%u @ [%u/%u, %u/%u, %u/%u, %u/%u]} "
>   		  "multirect_index:%d", __entry->index, __entry->layout.width,
