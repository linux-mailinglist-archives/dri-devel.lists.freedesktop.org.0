Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE944BA31
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 03:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7AF6EC6D;
	Wed, 10 Nov 2021 02:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EE86EAC6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:12:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636510371; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ecADr3wzM0TFbc43Pij7QByXJevYCIvrf32QJg2deLQ=;
 b=sJxSGqXcpWFGQmyEwihak7zMzI1SPereS9GzgrcrySK1j7JCMORe0Zj+t7yccbU5lvb6M/Xt
 yt8WkqPD+6OfIy0PfDNJOuBg4du6n5D4mOxEiQwxgVa0jck7d+VVS8y4YJ6MS5fnP7w3yPst
 xGAvaQv3t/7y8d8Qdcdxa7m0d54=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 618b2aa2facd20d79520988a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 02:12:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E1403C4360C; Wed, 10 Nov 2021 02:12:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E9A9BC4338F;
 Wed, 10 Nov 2021 02:12:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Nov 2021 18:12:48 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 21/22] drm/msm/dpu: fix CDP setup to
 account for multirect index
In-Reply-To: <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-22-dmitry.baryshkov@linaro.org>
Message-ID: <1fb08ef9aa4d5d2e7d76453386bd2b75@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> Client driven prefetch (CDP) is properly setup only for SSPP REC0
> currently. Enable client driven prefetch also for SSPP REC1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 12 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index f93cdeb08ac7..96f2f3f12f34 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -75,6 +75,7 @@
>  #define SSPP_TRAFFIC_SHAPER                0x130
>  #define SSPP_CDP_CNTL                      0x134
>  #define SSPP_UBWC_ERROR_STATUS             0x138
> +#define SSPP_CDP_CNTL_REC1                 0x13c
>  #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
>  #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
>  #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> @@ -624,10 +625,12 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct
> dpu_hw_pipe *ctx,
>  }
> 
>  static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cdp_cfg *cfg)
> +		struct dpu_hw_pipe_cdp_cfg *cfg,
> +		enum dpu_sspp_multirect_index index)
>  {
>  	u32 idx;
>  	u32 cdp_cntl = 0;
> +	u32 cdp_cntl_offset = 0;
> 
>  	if (!ctx || !cfg)
>  		return;
> @@ -635,6 +638,11 @@ static void dpu_hw_sspp_setup_cdp(struct 
> dpu_hw_pipe *ctx,
>  	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>  		return;
> 
> +	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
> +		cdp_cntl_offset = SSPP_CDP_CNTL;
> +	else
> +		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
> +
>  	if (cfg->enable)
>  		cdp_cntl |= BIT(0);
>  	if (cfg->ubwc_meta_enable)
> @@ -644,7 +652,7 @@ static void dpu_hw_sspp_setup_cdp(struct 
> dpu_hw_pipe *ctx,
>  	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
>  		cdp_cntl |= BIT(3);
> 
> -	DPU_REG_WRITE(&ctx->hw, SSPP_CDP_CNTL, cdp_cntl);
> +	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
>  }
> 
>  static void _setup_layer_ops(struct dpu_hw_pipe *c,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index c5ac8defa073..19c5358b962c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -358,9 +358,11 @@ struct dpu_hw_sspp_ops {
>  	 * setup_cdp - setup client driven prefetch
>  	 * @ctx: Pointer to pipe context
>  	 * @cfg: Pointer to cdp configuration
> +	 * @index: rectangle index in multirect
>  	 */
>  	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cdp_cfg *cfg);
> +			struct dpu_hw_pipe_cdp_cfg *cfg,
> +			enum dpu_sspp_multirect_index index);
>  };
> 
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d692136884ad..420cdd90e89b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1241,7 +1241,7 @@ static void dpu_plane_sspp_atomic_update(struct
> drm_plane *plane)
>  					DPU_FORMAT_IS_TILE(fmt);
>  			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> 
> -			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg);
> +			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg,
> pstate->multirect_index);
>  		}
>  	}
