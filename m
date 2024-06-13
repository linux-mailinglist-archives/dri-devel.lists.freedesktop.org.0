Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E9907AE4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67A10E5A7;
	Thu, 13 Jun 2024 18:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D39D10E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:17:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 591EB3EF1E;
 Thu, 13 Jun 2024 20:17:16 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:17:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: convert vsync source defines to the
 enum
Message-ID: <l3esy4ciy4envu35edg35sip5od6ltxpazpddo2w6vwmqomjky@azgqxi4la3hy>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>
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

On 2024-06-13 20:05:05, Dmitry Baryshkov wrote:
> Add enum dpu_vsync_source instead of a series of defines. Use this enum
> to pass vsync information.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
>  5 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..4988a1029431 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  		if (disp_info->is_te_using_watchdog_timer)
>  			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
>  		else
> -			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
> +			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
>  
>  		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..96f6160cf607 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
>  }
>  
>  static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> -		u32 vsync_source)
> +				  enum dpu_vsync_source vsync_source)
>  {
>  	struct dpu_hw_blk_reg_map *c;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f9015c67a574..ac244f0b33fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
>  
>  	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
>  
> -	void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
> +	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
>  
>  	/**
>  	 * Disable autorefresh if enabled
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 66759623fc42..a2eff36a2224 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -54,18 +54,20 @@
>  #define DPU_BLEND_BG_INV_MOD_ALPHA	(1 << 12)
>  #define DPU_BLEND_BG_TRANSP_EN		(1 << 13)
>  
> -#define DPU_VSYNC0_SOURCE_GPIO		0
> -#define DPU_VSYNC1_SOURCE_GPIO		1
> -#define DPU_VSYNC2_SOURCE_GPIO		2
> -#define DPU_VSYNC_SOURCE_INTF_0		3
> -#define DPU_VSYNC_SOURCE_INTF_1		4
> -#define DPU_VSYNC_SOURCE_INTF_2		5
> -#define DPU_VSYNC_SOURCE_INTF_3		6
> -#define DPU_VSYNC_SOURCE_WD_TIMER_4	11
> -#define DPU_VSYNC_SOURCE_WD_TIMER_3	12
> -#define DPU_VSYNC_SOURCE_WD_TIMER_2	13
> -#define DPU_VSYNC_SOURCE_WD_TIMER_1	14
> -#define DPU_VSYNC_SOURCE_WD_TIMER_0	15
> +enum dpu_vsync_source {
> +	DPU_VSYNC_SOURCE_GPIO_0,
> +	DPU_VSYNC_SOURCE_GPIO_1,
> +	DPU_VSYNC_SOURCE_GPIO_2,

While at it, rename this to _P / _S / _E to match the other patches/code?

- Marijn

> +	DPU_VSYNC_SOURCE_INTF_0 = 3,
> +	DPU_VSYNC_SOURCE_INTF_1,
> +	DPU_VSYNC_SOURCE_INTF_2,
> +	DPU_VSYNC_SOURCE_INTF_3,
> +	DPU_VSYNC_SOURCE_WD_TIMER_4 = 11,
> +	DPU_VSYNC_SOURCE_WD_TIMER_3,
> +	DPU_VSYNC_SOURCE_WD_TIMER_2,
> +	DPU_VSYNC_SOURCE_WD_TIMER_1,
> +	DPU_VSYNC_SOURCE_WD_TIMER_0,
> +};
>  
>  enum dpu_hw_blk_type {
>  	DPU_HW_BLK_TOP = 0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index 6f3dc98087df..5c9a7ede991e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -64,7 +64,7 @@ struct dpu_vsync_source_cfg {
>  	u32 pp_count;
>  	u32 frame_rate;
>  	u32 ppnumber[PINGPONG_MAX];
> -	u32 vsync_source;
> +	enum dpu_vsync_source vsync_source;
>  };
>  
>  /**
> 
> -- 
> 2.39.2
> 
