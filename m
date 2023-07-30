Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA7768788
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 21:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8010E12F;
	Sun, 30 Jul 2023 19:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47B10E133
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 19:41:13 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8145E201AC;
 Sun, 30 Jul 2023 21:41:11 +0200 (CEST)
Date: Sun, 30 Jul 2023 21:41:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
Message-ID: <qn2zf75tqavc6opgfdlt6rd7o36twtq6w6o6dvhcg2tfsuq5qo@px46w7rlpc5m>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
 <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730003518.349197-2-dmitry.baryshkov@linaro.org>
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

On 2023-07-30 03:35:11, Dmitry Baryshkov wrote:
> Inline the _setup_pingpong_ops() function, it makes it easier to handle
> different conditions involving PINGPONG configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 39 ++++++++-----------
>  1 file changed, 17 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 437d9e62a841..9298c166b213 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -281,27 +281,6 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
>  	return 0;
>  }
>  
> -static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
> -				unsigned long features)
> -{
> -	if (test_bit(DPU_PINGPONG_TE, &features)) {
> -		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> -		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> -		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> -		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> -	}
> -
> -	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> -		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> -	}
> -
> -	if (test_bit(DPU_PINGPONG_DITHER, &features))
> -		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> -};
> -
>  struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  		void __iomem *addr)
>  {
> @@ -316,7 +295,23 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  
>  	c->idx = cfg->id;
>  	c->caps = cfg;
> -	_setup_pingpong_ops(c, c->caps->features);
> +
> +	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> +		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
> +		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
> +		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> +		c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
> +	}
> +
> +	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
> +	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
> +		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  
>  	return c;
>  }
> -- 
> 2.39.2
> 
