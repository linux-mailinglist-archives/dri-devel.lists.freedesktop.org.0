Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126186F509C
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9391710E1A3;
	Wed,  3 May 2023 07:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FBF10E084
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 07:07:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5A58B3F29C;
 Wed,  3 May 2023 09:07:20 +0200 (CEST)
Date: Wed, 3 May 2023 09:07:18 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: Add has_data_compress to dpu_caps
Message-ID: <v5hmqtjwd3syqwo5nqru7xgpt3rv5ubfbzt6pssriyb7cuprkf@7zdvwsil67nc>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-3-6bc6f03ae735@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v1-3-6bc6f03ae735@quicinc.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-02 18:19:14, Jessica Zhang wrote:
> Add data_compress feature to DPU HW catalog.
> 
> In DPU 7.x and later, there is a DATA_COMPRESS register that must be set
> within the DPU INTF block for DSC to work.
> 
> As core_rev (and related macros) was removed from the dpu_kms struct, the
> most straightforward way to indicate the presence of this register would be
> to have a flag in dpu_caps.

This is a very generic name to have in the global dpu_caps for a very
specific register on the INTF block since DPU >= 7.0.0, and I doubt any
new catalog contributor will know how to fill this field.  After all,
DPU < 7.0.0 also has DCE but it is controlled via the PINGPONG block.

Instead, how about having it as a DPU_INTF_DATA_COMPRESS (or similar)
feature flag on the INTF block?  We do the same for other (register
related) features on the INTF block, and you did the same to disable DSC
callbacks on PP in [1].

In fact it seems that the DSC/DCE (enablement) registers have been moved
from PINGPONG to INTF in DPU 7.0.0.  Can you clarify in the patch
message for v2 that this is the case, and do the same in the linked
PINGPONG patch?  Perhaps these patches should be part of the same series
as they do not seem DSI-specific.

[1]: https://lore.kernel.org/linux-arm-msm/1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com/

- Marijn

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 ++
>  6 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index f98c2a5b0e87..4160a35ff20f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8350_dpu_caps = {
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
>  	.has_3d_merge = true,
> +	.has_data_compress = true,
>  	.max_linewidth = 4096,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3fd0498ab420..23230841a0d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -13,6 +13,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>  	.qseed_type = DPU_SSPP_SCALER_QSEED4,
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
> +	.has_data_compress = true,
>  	.max_linewidth = 2400,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index ce583eb14b06..c990406e4bca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
>  	.has_3d_merge = true,
> +	.has_data_compress = true,
>  	.max_linewidth = 5120,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 3950e7b946a5..7094640e2fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8450_dpu_caps = {
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
>  	.has_3d_merge = true,
> +	.has_data_compress = true,
>  	.max_linewidth = 5120,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 1b3f5424aea8..970049559e02 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -15,6 +15,7 @@ static const struct dpu_caps sm8550_dpu_caps = {
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
>  	.has_3d_merge = true,
> +	.has_data_compress = true,
>  	.max_linewidth = 5120,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b410a85c109c..c5bbd4ad6da8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -380,6 +380,7 @@ struct dpu_rotation_cfg {
>   * @has_dim_layer      dim layer feature status
>   * @has_idle_pc        indicate if idle power collapse feature is supported
>   * @has_3d_merge       indicate if 3D merge is supported
> + * @has_data_compress  indicate if data compression is supported
>   * @max_linewidth      max linewidth for sspp
>   * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
>   * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
> @@ -393,6 +394,7 @@ struct dpu_caps {
>  	bool has_dim_layer;
>  	bool has_idle_pc;
>  	bool has_3d_merge;
> +	bool has_data_compress;
>  	/* SSPP limits */
>  	u32 max_linewidth;
>  	u32 pixel_ram_size;
> 
> -- 
> 2.40.1
> 
