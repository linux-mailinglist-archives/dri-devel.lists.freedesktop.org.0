Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A1436D8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 00:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E9F89139;
	Thu, 21 Oct 2021 22:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE096E209
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 22:36:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634855760; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nz46hJHg14w27MvaxWuLRSJj9BjKYZ+W7Iuyx5TwDEU=;
 b=gnscEUtDKv1gkWDjtfcsRTRIezpgPkPC4qWp49hy4F5FU3qPOKtkaVA1yzPPUmJWZd4zGD/q
 u7ua7WCjt5z/D5nO+MoHM8AaZCtOPzuvv9r3VCBxfjZllZDHBzoTZ4uj6OprMwhUoQMwpptB
 vfFZvzT6bGbAXq66luE8RsjKXZ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6171eb4ffd91319f0f44dd25 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:35:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 00488C43460; Thu, 21 Oct 2021 22:35:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DDF8C4338F;
 Thu, 21 Oct 2021 22:35:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 15:35:57 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 05/11] drm/msm/dpu: move dpu_hw_pipe_cfg out
 of struct dpu_plane
In-Reply-To: <20210930140002.308628-6-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-6-dmitry.baryshkov@linaro.org>
Message-ID: <25f95f7fa81c2b9d771f6e3f26dc2820@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> struct dpu_hw_pipe_cfg represents an interim state during atomic
> update/color fill, so move it out of struct dpu_plane.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 104 ++++++++++++----------
>  1 file changed, 57 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ef3737642b0c..5288b5b824f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -104,7 +104,6 @@ struct dpu_plane {
>  	uint32_t features;      /* capabilities from catalog */
> 
>  	struct dpu_hw_pipe *pipe_hw;
> -	struct dpu_hw_pipe_cfg pipe_cfg;
>  	uint32_t color_fill;
>  	bool is_error;
>  	bool is_rt_pipe;
> @@ -143,14 +142,15 @@ static struct dpu_kms *_dpu_plane_get_kms(struct
> drm_plane *plane)
>   * _dpu_plane_calc_bw - calculate bandwidth required for a plane
>   * @plane: Pointer to drm plane.
>   * @fb:   Pointer to framebuffer associated with the given plane
> + * @pipe_cfg: Pointer to pipe configuration
>   * Result: Updates calculated bandwidth in the plane state.
>   * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
>   * Prefill BW Equation: line src bytes * line_time
>   */
>  static void _dpu_plane_calc_bw(struct drm_plane *plane,
> -	struct drm_framebuffer *fb)
> +	struct drm_framebuffer *fb,
> +	struct dpu_hw_pipe_cfg *pipe_cfg)
>  {
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate;
>  	struct drm_display_mode *mode;
>  	const struct dpu_format *fmt = NULL;
> @@ -167,9 +167,9 @@ static void _dpu_plane_calc_bw(struct drm_plane 
> *plane,
> 
>  	fmt = dpu_get_dpu_format_ext(fb->format->format, fb->modifier);
> 
> -	src_width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
> -	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
> -	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
> +	src_width = drm_rect_width(&pipe_cfg->src_rect);
> +	src_height = drm_rect_height(&pipe_cfg->src_rect);
> +	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
>  	fps = drm_mode_vrefresh(mode);
>  	vbp = mode->vtotal - mode->vsync_end;
>  	vpw = mode->vsync_end - mode->vsync_start;
> @@ -200,12 +200,12 @@ static void _dpu_plane_calc_bw(struct drm_plane 
> *plane,
>  /**
>   * _dpu_plane_calc_clk - calculate clock required for a plane
>   * @plane: Pointer to drm plane.
> + * @pipe_cfg: Pointer to pipe configuration
>   * Result: Updates calculated clock in the plane state.
>   * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
>   */
> -static void _dpu_plane_calc_clk(struct drm_plane *plane)
> +static void _dpu_plane_calc_clk(struct drm_plane *plane, struct
> dpu_hw_pipe_cfg *pipe_cfg)
>  {
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate;
>  	struct drm_display_mode *mode;
>  	int dst_width, src_height, dst_height, fps;
> @@ -213,9 +213,9 @@ static void _dpu_plane_calc_clk(struct drm_plane 
> *plane)
>  	pstate = to_dpu_plane_state(plane->state);
>  	mode = &plane->state->crtc->mode;
> 
> -	src_height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
> -	dst_width = drm_rect_width(&pdpu->pipe_cfg.dst_rect);
> -	dst_height = drm_rect_height(&pdpu->pipe_cfg.dst_rect);
> +	src_height = drm_rect_height(&pipe_cfg->src_rect);
> +	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
> +	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
>  	fps = drm_mode_vrefresh(mode);
> 
>  	pstate->plane_clk =
> @@ -252,14 +252,17 @@ static int _dpu_plane_calc_fill_level(struct
> drm_plane *plane,
>  	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
> 
>  	list_for_each_entry(tmp, &pdpu->mplane_list, mplane_list) {
> +		u32 tmp_width;
> +
>  		if (!tmp->base.state->visible)
>  			continue;
> +		tmp_width = drm_rect_width(&tmp->base.state->src) >> 16;
>  		DPU_DEBUG("plane%d/%d src_width:%d/%d\n",
>  				pdpu->base.base.id, tmp->base.base.id,
>  				src_width,
> -				drm_rect_width(&tmp->pipe_cfg.src_rect));
> +				tmp_width);
>  		src_width = max_t(u32, src_width,
> -				  drm_rect_width(&tmp->pipe_cfg.src_rect));
> +				  tmp_width);
>  	}
> 
>  	if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
> @@ -319,9 +322,10 @@ static u64 _dpu_plane_get_qos_lut(const struct
> dpu_qos_lut_tbl *tbl,
>   * _dpu_plane_set_qos_lut - set QoS LUT of the given plane
>   * @plane:		Pointer to drm plane
>   * @fb:			Pointer to framebuffer associated with the given plane
> + * @pipe_cfg:		Pointer to pipe configuration
>   */
>  static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
> -		struct drm_framebuffer *fb)
> +		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
>  {
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct dpu_format *fmt = NULL;
> @@ -335,7 +339,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane 
> *plane,
>  				fb->format->format,
>  				fb->modifier);
>  		total_fl = _dpu_plane_calc_fill_level(plane, fmt,
> -				drm_rect_width(&pdpu->pipe_cfg.src_rect));
> +				drm_rect_width(&pipe_cfg->src_rect));
> 
>  		if (fmt && DPU_FORMAT_IS_LINEAR(fmt))
>  			lut_usage = DPU_QOS_LUT_USAGE_LINEAR;
> @@ -461,9 +465,10 @@ static void _dpu_plane_set_qos_ctrl(struct
> drm_plane *plane,
>   * _dpu_plane_set_ot_limit - set OT limit for the given plane
>   * @plane:		Pointer to drm plane
>   * @crtc:		Pointer to drm crtc
> + * @pipe_cfg:		Pointer to pipe configuration
>   */
>  static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
> -		struct drm_crtc *crtc)
> +		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
>  {
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_vbif_set_ot_params ot_params;
> @@ -472,8 +477,8 @@ static void _dpu_plane_set_ot_limit(struct 
> drm_plane *plane,
>  	memset(&ot_params, 0, sizeof(ot_params));
>  	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
>  	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
> -	ot_params.width = drm_rect_width(&pdpu->pipe_cfg.src_rect);
> -	ot_params.height = drm_rect_height(&pdpu->pipe_cfg.src_rect);
> +	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
> +	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>  	ot_params.is_wfd = !pdpu->is_rt_pipe;
>  	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>  	ot_params.vbif_idx = VBIF_RT;
> @@ -651,17 +656,18 @@ static void _dpu_plane_setup_csc(struct dpu_plane 
> *pdpu)
> 
>  static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>  		struct dpu_plane_state *pstate,
> -		const struct dpu_format *fmt, bool color_fill)
> +		const struct dpu_format *fmt, bool color_fill,
> +		struct dpu_hw_pipe_cfg *pipe_cfg)
>  {
>  	const struct drm_format_info *info = 
> drm_format_info(fmt->base.pixel_format);
> 
>  	/* don't chroma subsample if decimating */
>  	/* update scaler. calculate default config for QSEED3 */
>  	_dpu_plane_setup_scaler3(pdpu, pstate,
> -			drm_rect_width(&pdpu->pipe_cfg.src_rect),
> -			drm_rect_height(&pdpu->pipe_cfg.src_rect),
> -			drm_rect_width(&pdpu->pipe_cfg.dst_rect),
> -			drm_rect_height(&pdpu->pipe_cfg.dst_rect),
> +			drm_rect_width(&pipe_cfg->src_rect),
> +			drm_rect_height(&pipe_cfg->src_rect),
> +			drm_rect_width(&pipe_cfg->dst_rect),
> +			drm_rect_height(&pipe_cfg->dst_rect),
>  			&pstate->scaler3_cfg, fmt,
>  			info->hsub, info->vsub);
>  }
> @@ -679,6 +685,7 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
>  	const struct dpu_format *fmt;
>  	const struct drm_plane *plane = &pdpu->base;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
> +	struct dpu_hw_pipe_cfg pipe_cfg;
> 
>  	DPU_DEBUG_PLANE(pdpu, "\n");
> 
> @@ -695,13 +702,15 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
>  				pstate->multirect_index);
> 
>  		/* override scaler/decimation if solid fill */
> -		pdpu->pipe_cfg.src_rect.x1 = 0;
> -		pdpu->pipe_cfg.src_rect.y1 = 0;
> -		pdpu->pipe_cfg.src_rect.x2 =
> -			drm_rect_width(&pdpu->pipe_cfg.dst_rect);
> -		pdpu->pipe_cfg.src_rect.y2 =
> -			drm_rect_height(&pdpu->pipe_cfg.dst_rect);
> -		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true);
> +		pipe_cfg.dst_rect = pstate->base.dst;
> +
> +		pipe_cfg.src_rect.x1 = 0;
> +		pipe_cfg.src_rect.y1 = 0;
> +		pipe_cfg.src_rect.x2 =
> +			drm_rect_width(&pipe_cfg.dst_rect);
> +		pipe_cfg.src_rect.y2 =
> +			drm_rect_height(&pipe_cfg.dst_rect);
> +		_dpu_plane_setup_scaler(pdpu, pstate, fmt, true, &pipe_cfg);
> 
>  		if (pdpu->pipe_hw->ops.setup_format)
>  			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
> @@ -710,7 +719,7 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
> 
>  		if (pdpu->pipe_hw->ops.setup_rects)
>  			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
> -					&pdpu->pipe_cfg,
> +					&pipe_cfg,
>  					pstate->multirect_index);
> 
>  		if (pdpu->pipe_hw->ops.setup_pe)
> @@ -720,7 +729,7 @@ static int _dpu_plane_color_fill(struct dpu_plane 
> *pdpu,
>  		if (pdpu->pipe_hw->ops.setup_scaler &&
>  				pstate->multirect_index != DPU_SSPP_RECT_1)
>  			pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> -					&pdpu->pipe_cfg, &pstate->pixel_ext,
> +					&pipe_cfg, &pstate->pixel_ext,
>  					&pstate->scaler3_cfg);
>  	}
> 
> @@ -1087,10 +1096,11 @@ static void
> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  	bool is_rt_pipe, update_qos_remap;
>  	const struct dpu_format *fmt =
>  		to_dpu_format(msm_framebuffer_format(fb));
> +	struct dpu_hw_pipe_cfg pipe_cfg;
> 
> -	memset(&(pdpu->pipe_cfg), 0, sizeof(struct dpu_hw_pipe_cfg));
> +	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> 
> -	_dpu_plane_set_scanout(plane, pstate, &pdpu->pipe_cfg, fb);
> +	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> 
>  	pstate->pending = true;
> 
> @@ -1102,17 +1112,17 @@ static void
> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  			crtc->base.id, DRM_RECT_ARG(&state->dst),
>  			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> 
> -	pdpu->pipe_cfg.src_rect = state->src;
> +	pipe_cfg.src_rect = state->src;
> 
>  	/* state->src is 16.16, src_rect is not */
> -	pdpu->pipe_cfg.src_rect.x1 >>= 16;
> -	pdpu->pipe_cfg.src_rect.x2 >>= 16;
> -	pdpu->pipe_cfg.src_rect.y1 >>= 16;
> -	pdpu->pipe_cfg.src_rect.y2 >>= 16;
> +	pipe_cfg.src_rect.x1 >>= 16;
> +	pipe_cfg.src_rect.x2 >>= 16;
> +	pipe_cfg.src_rect.y1 >>= 16;
> +	pipe_cfg.src_rect.y2 >>= 16;
> 
> -	pdpu->pipe_cfg.dst_rect = state->dst;
> +	pipe_cfg.dst_rect = state->dst;
> 
> -	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false);
> +	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
> 
>  	/* override for color fill */
>  	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> @@ -1122,7 +1132,7 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
> 
>  	if (pdpu->pipe_hw->ops.setup_rects) {
>  		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
> -				&pdpu->pipe_cfg,
> +				&pipe_cfg,
>  				pstate->multirect_index);
>  	}
> 
> @@ -1139,7 +1149,7 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
>  	if (pdpu->pipe_hw->ops.setup_scaler &&
>  			pstate->multirect_index != DPU_SSPP_RECT_1)
>  		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> -				&pdpu->pipe_cfg, &pstate->pixel_ext,
> +				&pipe_cfg, &pstate->pixel_ext,
>  				&pstate->scaler3_cfg);
> 
>  	if (pdpu->pipe_hw->ops.setup_multirect)
> @@ -1192,12 +1202,12 @@ static void
> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  			pdpu->csc_ptr = 0;
>  	}
> 
> -	_dpu_plane_set_qos_lut(plane, fb);
> +	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
>  	_dpu_plane_set_danger_lut(plane, fb);
> 
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>  		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
> -		_dpu_plane_set_ot_limit(plane, crtc);
> +		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
>  	}
> 
>  	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
> @@ -1211,9 +1221,9 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
>  		_dpu_plane_set_qos_remap(plane);
>  	}
> 
> -	_dpu_plane_calc_bw(plane, fb);
> +	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
> 
> -	_dpu_plane_calc_clk(plane);
> +	_dpu_plane_calc_clk(plane, &pipe_cfg);
>  }
> 
>  static void _dpu_plane_atomic_disable(struct drm_plane *plane)
