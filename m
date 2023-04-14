Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C956E1D77
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 09:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86510E0BA;
	Fri, 14 Apr 2023 07:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCA610E0BA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 07:48:15 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 995B5204A2;
 Fri, 14 Apr 2023 09:48:12 +0200 (CEST)
Date: Fri, 14 Apr 2023 09:48:11 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v2] drm/msm/dpu: always program dsc active bits
Message-ID: <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
References: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Capitalize DSC in the title, as discussed in v1.

On 2023-04-13 08:56:41, Kuogee Hsieh wrote:
> In current code, the DSC active bits are written only if cfg->dsc is set.
> However, for displays which are hot-pluggable, there can be a use-case
> of disconnecting a DSC supported sink and connecting a non-DSC sink.
> 
> For those cases we need to clear DSC active bits during tear down.
> 
> Changes in V2:
> 1) correct commit text as suggested
> 2) correct Fixes commit id
> 3) add FIXME comment
> 
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

By default git send-email should pick this up in the CC line...  but I
had to download this patch from lore once again.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95c..1651cd7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -541,10 +541,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	if (cfg->merge_3d)
>  		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>  			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> -		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
> +
> +	/* FIXME: fix reset_intf_cfg to handle teardown of dsc */

There's more wrong than just moving (not "fix"ing) this bit of code into
reset_intf_cfg.  And this will have to be re-wrapped in `if (cfg->dsc)`
again by reverting this patch.  Perhaps that can be explained, or link
to Abhinav's explanation to make it clear to readers what this FIXME
actually means?  Let's wait for Abhinav and Dmitry to confirm the
desired communication here.

https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/

- Marijn

> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>  }
>  
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
