Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F826FBA66
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11AE10E319;
	Mon,  8 May 2023 21:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A1B10E30D;
 Mon,  8 May 2023 21:59:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 38F633F33C;
 Mon,  8 May 2023 23:59:26 +0200 (CEST)
Date: Mon, 8 May 2023 23:59:25 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v6 3/7] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Message-ID: <pldbixvcvqn5pjcuohz2uijywsd7rbhabdaas2oag6eqwqofon@amyyth6qgy3u>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-3-cb7f59f0f7fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-3-cb7f59f0f7fb@quicinc.com>
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

On 2023-04-12 16:25:17, Jessica Zhang wrote:
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.

This should put more emphasis on the fact that the helper **has a
different math implementation** to calculate the value differently, and
that this hence is a **semantic change**.  Otherwise the Fixes: won't
make sense and the reader wouldn't notice it.

> Changes in V2:
> - Added a Fixes tag
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've made the same change locally, so for the change itself:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..b952f7d2b7f5 100644
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
> 2.40.0
> 
