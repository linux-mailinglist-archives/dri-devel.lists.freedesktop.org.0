Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B323721ACA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 00:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666310E0CA;
	Sun,  4 Jun 2023 22:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BFE10E0CA
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 22:04:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D7A1A3EBBD;
 Mon,  5 Jun 2023 00:04:56 +0200 (CEST)
Date: Mon, 5 Jun 2023 00:04:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: use PINGPONG_NONE to unbind INTF
 from PP
Message-ID: <dzxdyiigbkjlmhudjbrmxuhauqn2lh5dkuyrpddcpt5xteo7um@elcvbccbbfod>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
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

On 2023-06-04 06:13:07, Dmitry Baryshkov wrote:
> Currently the driver passes the PINGPONG index to
> dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> flag to tell whether INTF should be bound or unbound. Simplify this by
> passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> 
> Changes since v1:
> - Dropped != PINGPONG_NONE (Marijn)
> 
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
>  5 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d29c4b..3e543d664c98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2090,8 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
>  				phys_enc->hw_intf->ops.bind_pingpong_blk(
> -						dpu_enc->phys_encs[i]->hw_intf, false,
> -						dpu_enc->phys_encs[i]->hw_pp->idx);
> +						dpu_enc->phys_encs[i]->hw_intf,
> +						PINGPONG_NONE);
>  
>  			/* mark INTF flush as pending */
>  			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 4f8c9187f76d..107f0eff958c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				true,
>  				phys_enc->hw_pp->idx);
>  }
>  
> @@ -553,8 +552,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>  	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				false,
> -				phys_enc->hw_pp->idx);
> +				PINGPONG_NONE);
>  
>  		ctl = phys_enc->hw_ctl;
>  		ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index e26629e9e303..662d74ded1b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
>  		phys_enc->hw_intf->ops.bind_pingpong_blk(
>  				phys_enc->hw_intf,
> -				true,
>  				phys_enc->hw_pp->idx);
>  
>  	if (phys_enc->hw_pp->merge_3d)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 5dce18236d87..530f82e34c1e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -267,7 +267,6 @@ static void dpu_hw_intf_setup_prg_fetch(
>  
>  static void dpu_hw_intf_bind_pingpong_blk(
>  		struct dpu_hw_intf *intf,
> -		bool enable,
>  		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &intf->hw;
> @@ -276,7 +275,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
>  	mux_cfg = DPU_REG_READ(c, INTF_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (enable)
> +	if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 73b0885918f8..33895eca1211 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -88,7 +88,6 @@ struct dpu_hw_intf_ops {
>  	u32 (*get_line_count)(struct dpu_hw_intf *intf);
>  
>  	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
> -			bool enable,
>  			const enum dpu_pingpong pp);
>  	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
>  	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
> -- 
> 2.39.2
> 
