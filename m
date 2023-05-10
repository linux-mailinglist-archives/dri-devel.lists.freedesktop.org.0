Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DE6FD71A
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 08:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D88D10E44F;
	Wed, 10 May 2023 06:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AACE10E44F;
 Wed, 10 May 2023 06:35:04 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.225.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EC6AB20210;
 Wed, 10 May 2023 08:35:01 +0200 (CEST)
Date: Wed, 10 May 2023 08:35:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v7 5/8] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Message-ID: <k6xgvs64hryacvgkgc3gvz6ifcibcy62us6ejamyl2ktapnt3q@fnftioyh6ruj>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-5-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-5-df48a2c54421@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Title suggestion: Use **fixed** MSM DSC helper...

To make it clear that this is a bugfix without having to read the commit
description first.

- Marijn

On 2023-05-09 15:06:51, Jessica Zhang wrote:
> The current dpu_hw_dsc calculation for det_thresh_flatness does not
> match the downstream calculation or the DSC spec.
> 
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 4e1396575e6a..1e11c0fb0545 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2020-2022, Linaro Limited
>   */
>  
> +#include <drm/display/drm_dsc_helper.h>
> +
>  #include "dpu_kms.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hwio.h"
> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	data |= dsc->final_offset;
>  	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>  
> -	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
> +	det_thresh_flatness = drm_dsc_calculate_flatness_det_thresh(dsc);
>  	data = det_thresh_flatness << 10;
>  	data |= dsc->flatness_max_qp << 5;
>  	data |= dsc->flatness_min_qp;
> 
> -- 
> 2.40.1
> 
