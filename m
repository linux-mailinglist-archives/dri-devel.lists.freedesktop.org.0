Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE9966834
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C210EABC;
	Fri, 30 Aug 2024 17:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fVxxq6oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2B10EABC
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:41:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so2802207e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039694; x=1725644494; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CLJLsb74GimibdeF1WmelfLCMwqv4A9ITslugGtRe5c=;
 b=fVxxq6ocKyzLIGfbuFmbf2SKW1hQVpr0uDZTE21WFR0TzEAmDqNNuinfBWqqJtGRcc
 2FyoBKfJfFuJMk/o7wP1a2PUN35FY+7ZY9aJ4ZdIpzLXkCTrWWZFK3JkoOpNHxKKGqNv
 ivlSkX8VGuiVwCOCV5mHnAK3iWFMe1+bnrIiuC7xWdpCeACmRHEQ9NRD3U128XBglIXW
 1TzHPe6C3jjhuaRyOK4hXazRx7wl2NIXfhEg5sy9DX6pQAilOeUu246uRmEL50iMfCnI
 k8gMFthyz+OzvVrtRdjybXHdt5Id9JgxLXYNxY4MCwZzpfKOw/ec4hVzk8DGZonpazpB
 sOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039694; x=1725644494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLJLsb74GimibdeF1WmelfLCMwqv4A9ITslugGtRe5c=;
 b=t+DAX6KfBvJiH1sjuRXmi9Hak83htCESLbiycSWcnSbnuaTA781lhLQ5oL3r3WqcSc
 0iwJrdjAHAIzHgN49RHo83DiBZS0EVMtwXcRJ3e2IQW5VVQhE9trPjJOnihVAqpOEysi
 AXOydwanYA46Bkn1dtNZV813WFIMdpnYkItqXNde6NOGt0issyPOY8YNVzD1TgnmYDWy
 AhoqsQOdw35d3vzb7Oib9HvDWqoyCWXNaxdB78hiJAh6Zo5dwv/jYEg6NUXBkxwD6q4Y
 iUAF9Mor9Zf89ONaPybeN0LHbhb8jlTM1YVu5BS9QBYAZBX+z1a6HCC2vJAk1arJw9cI
 VPnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjLTrLyzL1Tm4PKNU8DrhdhdiLgcHy2gjJOUGD949eY4T+YcTor29TNmT5wiIufmOMVt6CDqaZ++E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEAlZ8/ac2CGa7cv1t9C5BuVvQdg/dcCvujwP/gDamG3lArN9a
 mxKAEuIVoqMBI0otjpTFGb673KHBOBnRLeg2P72oHd1Jaodypmha73r2Y0iK16g=
X-Google-Smtp-Source: AGHT+IEft8aB2lR1r5bENPky9CFg/kbFxnPnSz6qK6jny48qhst3N/wIodvNncTlBMYI4RrorHcGZQ==
X-Received: by 2002:a05:6512:2316:b0:533:44e7:1b1a with SMTP id
 2adb3069b0e04-53546b32d48mr2344387e87.17.1725039693591; 
 Fri, 30 Aug 2024 10:41:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084e01bsm718411e87.273.2024.08.30.10.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:41:33 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:41:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 10/21] drm/msm/dpu: add CWB support to dpu_hw_wb
Message-ID: <2iyrj4bzvvjapn2p6kef2jub2ivsjszrqwaq3zj33hsbdtzuid@q7s6dqlerebu>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-10-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-10-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:31PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Add function ops to allow hw_wb to configure CWB registers and adjust
> the WB_MUX configuration to account for using dedicated CWB pingpong
> blocks.
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 69 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h | 34 +++++++++++++++
>  2 files changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 93ff01c889b5..998c9fbd22a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -51,6 +51,12 @@
>  #define WB_CDP_CNTL                           0x2B4
>  #define WB_OUT_IMAGE_SIZE                     0x2C0
>  #define WB_OUT_XY                             0x2C4

Empty line

> +#define CWB_MUX                               0x000
> +#define CWB_MODE                              0x004
> +
> +/* CWB mux block bit definitions */
> +#define CWB_MUX_MASK                          GENMASK(3, 0)
> +#define CWB_MODE_MASK                         GENMASK(2, 0)
>  
>  static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
>  		struct dpu_hw_wb_cfg *data)
> @@ -173,7 +179,9 @@ static void dpu_hw_wb_bind_pingpong_blk(
>  	mux_cfg = DPU_REG_READ(c, WB_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (pp)
> +	if (pp >= PINGPONG_CWB_0)
> +		mux_cfg |= (pp < PINGPONG_CWB_2) ? 0xd : 0xb;
> +	else if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> @@ -237,3 +245,62 @@ struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
>  
>  	return c;
>  }
> +
> +static void dpu_hw_cwb_setup_input_ctrl(struct dpu_hw_wb *ctx,
> +				enum dpu_cwb cwb_idx,
> +				const enum dpu_pingpong pp)

Align to opening bracket, please.

> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	int cwb_mux_cfg = 0xF;
> +
> +	if (cwb_idx < CWB_0 || cwb_idx >= CWB_MAX)
> +		return;
> +
> +	c = &ctx->cwb_hw[cwb_idx - CWB_0];
> +
> +	/*
> +	 * The CWB_MUX register takes the pingpong index relative to
> +	 * PINGPONG_CWB_0 and not PINGPONG_0
> +	 */
> +	if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
> +		cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_CWB_0);
> +
> +	DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
> +}
> +
> +static void dpu_hw_cwb_setup_input_mode(struct dpu_hw_wb *ctx,
> +				enum dpu_cwb cwb_idx,
> +				const enum cwb_mode_input input)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	int cwb_mux_cfg;
> +
> +	if (cwb_idx < CWB_0 || cwb_idx >= CWB_MAX || input >= INPUT_MODE_MAX)
> +		return;
> +
> +	c = &ctx->cwb_hw[cwb_idx - CWB_0];
> +	cwb_mux_cfg = FIELD_PREP(CWB_MODE_MASK, input);
> +
> +	DPU_REG_WRITE(c, CWB_MODE, cwb_mux_cfg);
> +}
> +
> +static void _setup_cwb_ops(struct dpu_hw_wb_ops *ops)
> +{
> +	ops->setup_input_ctrl = dpu_hw_cwb_setup_input_ctrl;
> +	ops->setup_input_mode = dpu_hw_cwb_setup_input_mode;
> +}
> +
> +struct dpu_hw_wb *dpu_hw_wb_init_with_cwb(struct drm_device *dev,
> +				 const struct dpu_wb_cfg *cfg,
> +				 void __iomem *addr,
> +				 const struct dpu_mdss_version *mdss_rev,
> +				 struct dpu_hw_blk_reg_map *cwb_hw)
> +{
> +	struct dpu_hw_wb *c = dpu_hw_wb_init(dev, cfg, addr, mdss_rev);
> +
> +	c->cwb_hw = cwb_hw;
> +
> +	_setup_cwb_ops(&c->ops);
> +
> +	return c;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index 37497473e16c..1ff40f8325e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -21,6 +21,12 @@ struct dpu_hw_wb_cfg {
>  	struct drm_rect crop;
>  };
>  
> +enum cwb_mode_input {
> +	INPUT_MODE_LM_OUT,
> +	INPUT_MODE_DSPP_OUT,
> +	INPUT_MODE_MAX
> +};
> +
>  /**
>   *
>   * struct dpu_hw_wb_ops : Interface to the wb hw driver functions
> @@ -31,6 +37,8 @@ struct dpu_hw_wb_cfg {
>   *  @setup_cdp:       setup chroma down prefetch block for writeback block
>   *  @setup_clk_force_ctrl: setup clock force control
>   *  @bind_pingpong_blk: enable/disable the connection with ping-pong block
> + *  @setup_ctrl: setup ctrl register for cwb
> + *  @setup_mode: setup mode register for cwb
>   */
>  struct dpu_hw_wb_ops {
>  	void (*setup_outaddress)(struct dpu_hw_wb *ctx,
> @@ -54,11 +62,20 @@ struct dpu_hw_wb_ops {
>  
>  	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>  				  const enum dpu_pingpong pp);
> +
> +	void (*setup_input_ctrl)(struct dpu_hw_wb *ctx,
> +				 enum dpu_cwb cwb_idx,
> +				 const enum dpu_pingpong pp);
> +
> +	void (*setup_input_mode)(struct dpu_hw_wb *ctx,
> +				 enum dpu_cwb cwb_idx,
> +				 const enum cwb_mode_input input);

Judging by the usage, could you please add single setup_cwb() callback
and let WB code call corresponding functions internally.

>  };
>  
>  /**
>   * struct dpu_hw_wb : WB driver object
>   * @hw: block hardware details
> + * @cwb_hw: block hardware details of cwb_muxes
>   * @idx: hardware index number within type
>   * @wb_hw_caps: hardware capabilities
>   * @ops: function pointers
> @@ -66,6 +83,9 @@ struct dpu_hw_wb_ops {
>  struct dpu_hw_wb {
>  	struct dpu_hw_blk_reg_map hw;
>  
> +	/* cwb data */
> +	struct dpu_hw_blk_reg_map *cwb_hw;
> +
>  	/* wb path */
>  	int idx;
>  	const struct dpu_wb_cfg *caps;
> @@ -87,4 +107,18 @@ struct dpu_hw_wb *dpu_hw_wb_init(struct drm_device *dev,
>  				 void __iomem *addr,
>  				 const struct dpu_mdss_version *mdss_rev);
>  
> +/**
> + * dpu_hw_wb_init_with_cwb() - Initializes the writeback hw driver object with cwb.
> + * @dev:  Corresponding device for devres management
> + * @cfg:  wb_path catalog entry for which driver object is required
> + * @addr: mapped register io address of MDP
> + * @hw: array of cwb muxes
> + * Return: Error code or allocated dpu_hw_wb context
> + */

Please move the comment to the function body. This way make W=1 will
check that it is valid.

> +struct dpu_hw_wb *dpu_hw_wb_init_with_cwb(struct drm_device *dev,
> +					const struct dpu_wb_cfg *cfg,
> +					void __iomem *addr,
> +					const struct dpu_mdss_version *mdss_rev,
> +					struct dpu_hw_blk_reg_map *hw);
> +
>  #endif /*_DPU_HW_WB_H */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
