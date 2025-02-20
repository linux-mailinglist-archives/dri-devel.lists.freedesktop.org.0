Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCFFA3E844
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 00:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3E10E1F9;
	Thu, 20 Feb 2025 23:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC97610E1F9;
 Thu, 20 Feb 2025 23:20:44 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 477612012A;
 Fri, 21 Feb 2025 00:20:43 +0100 (CET)
Date: Fri, 21 Feb 2025 00:20:41 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/msm/dpu: program master INTF value
Message-ID: <btkhximqopd3wmp7hxape6hsx53kzdfyl5ciyu5fe472nphzra@lbq3ybphm4h3>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
 <20250220-dpu-active-ctl-v1-2-71ca67a564f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dpu-active-ctl-v1-2-71ca67a564f8@linaro.org>
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

On 2025-02-20 12:26:19, Dmitry Baryshkov wrote:
> If several interfaces are being handled through a single CTL, a main
> ('master') INTF needs to be programmed into a separate register. Write
> corresponding value into that register.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 321a89e6400d2824ebda2c08be5e6943cb0f6b11..db36bfa98fc310c1bf35c4817d601ae6cf88d151 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -582,6 +582,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>  	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
>  
> +	if (cfg->intf_master)
> +		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
> +

We should not forget to unset the master mode when this INTF is "removed"
from the CTL.  When I modified and prepared your patches for sending, I did
it like this to only clear it in reset_intf_v1 if the current intf is equal to
the mater interface, similar to how it's removing the current intf _bit_ from
CTL_INTF_ACTIVE without touching the rest:

https://github.com/SoMainline/linux/commit/f5a0789c3b9fcba08f6e8fb67637d16dc553cb9b#diff-e9e5209e670102755be2a30d223e79da644dfb8c28ac2ef61e5c49bb46457bb9R667-R673

>  	if (cfg->merge_3d)
>  		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 85c6c835cc8780e6cb66f3a262d9897c91962935..e95989a2fdda6344d0cb9d3036e6ed22a0458675 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
>  /**
>   * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output interface
>   * @intf :                 Interface id
> + * @intf_master:           Master interface id in the dual pipe topology

Will this apply to quad topology etc as well?  Maybe needs to be generalized.

- Marijn

>   * @mode_3d:               3d mux configuration
>   * @merge_3d:              3d merge block used
>   * @intf_mode_sel:         Interface mode, cmd / vid
> @@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
>   */
>  struct dpu_hw_intf_cfg {
>  	enum dpu_intf intf;
> +	enum dpu_intf intf_master;
>  	enum dpu_wb wb;
>  	enum dpu_3d_blend_mode mode_3d;
>  	enum dpu_merge_3d merge_3d;
> 
> -- 
> 2.39.5
> 
