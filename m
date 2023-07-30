Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5D7687A3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3906010E133;
	Sun, 30 Jul 2023 19:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977EF10E12C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:45:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4908E203CB;
 Sun, 30 Jul 2023 21:45:16 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:45:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: enable PINGPONG TE operations only
 when supported by HW
Message-ID: <qowcwmoo6h25xkcdsmm2f3celsiwggu4zmn24p4gq3intcku2f@lfwf4f3vhjuq>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730003518.349197-3-dmitry.baryshkov@linaro.org>
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

On 2023-07-30 03:35:12, Dmitry Baryshkov wrote:
> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> Rather than checking for the flag, check for the presense of the
> corresponding interrupt line.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

This patch changed significantly since the last submission, but it is
still to my liking so this r-b stays!

- Marijn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c          | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 9298c166b213..057cac7f5d93 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -282,7 +282,7 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>  }
>  
>  struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
> -		void __iomem *addr)
> +		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>  {
>  	struct dpu_hw_pingpong *c;
>  
> @@ -296,7 +296,9 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  	c->idx = cfg->id;
>  	c->caps = cfg;
>  
> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> +	if (mdss_rev->core_major_ver < 5) {
> +		WARN_ON(!cfg->intr_rdptr);
> +
>  		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>  		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>  		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index d3246a9a5808..0d541ca5b056 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -123,10 +123,11 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
>   * pingpong catalog entry.
>   * @cfg:  Pingpong catalog entry for which driver object is required
>   * @addr: Mapped register io address of MDP
> + * @mdss_rev: dpu core's major and minor versions
>   * Return: Error code or allocated dpu_hw_pingpong context
>   */
>  struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
> -		void __iomem *addr);
> +		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
>  
>  /**
>   * dpu_hw_pingpong_destroy - destroys pingpong driver context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 4a53e2c931d6..9894eea77b5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -145,7 +145,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_pingpong *hw;
>  		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
>  
> -		hw = dpu_hw_pingpong_init(pp, mmio);
> +		hw = dpu_hw_pingpong_init(pp, mmio, cat->mdss_ver);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed pingpong object creation: err %d\n",
> -- 
> 2.39.2
> 
