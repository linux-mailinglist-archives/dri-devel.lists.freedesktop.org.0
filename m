Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A793D70742D
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF4110E49C;
	Wed, 17 May 2023 21:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8451010E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:26:06 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 293033F84B;
 Wed, 17 May 2023 23:26:04 +0200 (CEST)
Date: Wed, 17 May 2023 23:26:02 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, @somainline.org
Subject: Re: [PATCH v11 5/9] drm/msm: Add MSM-specific DSC helper methods
Message-ID: <hyqb6upm3zzruyneamujc3hw4vtwjtjxnomdilk6xyxdm2n6bk@4h3eeah6dlhx>
References: <20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v11-5-30270e1eeac3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v11-5-30270e1eeac3@quicinc.com>
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 11:51:14, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
> new file mode 100644
> index 000000000000..2d366ec7d92d
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
> + *
> + * Helper methods for MSM specific DSC calculations that are common between timing engine,

Nit following the commit body: MSM-specific with a hyphen.

> + * DSI, and DP.
> + */
> +
> +#ifndef MSM_DSC_HELPER_H_
> +#define MSM_DSC_HELPER_H_
> +
> +#include <linux/math.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +/**
> + * msm_dsc_get_slices_per_intf() - get number of slices per interface

get -> calculate?

> + * @dsc: Pointer to drm dsc config struct
> + * @intf_width: interface width in pixels
> + * Returns: Integer representing the number of slices for the given interface
> + */
> +static inline int msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, int intf_width)

u32 per v10 review and acks?

The rest looks good, thanks!

- Marijn

> +{
> +	return DIV_ROUND_UP(intf_width, dsc->slice_width);
> +}
> +
> +/**
> + * msm_dsc_get_bytes_per_line() - calculate bytes per line
> + * @dsc: Pointer to drm dsc config struct
> + * Returns: Integer value representing bytes per line. DSI and DP need
> + *          to perform further calculations to turn this into pclk_per_intf,
> + *          such as dividing by different values depending on if widebus is enabled.
> + */
> +static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
> +{
> +	return dsc->slice_count * dsc->slice_chunk_size;
> +}
> +
> +#endif /* MSM_DSC_HELPER_H_ */
> 
> -- 
> 2.40.1
> 
