Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF86FD676
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 08:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CA410E2A2;
	Wed, 10 May 2023 06:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C538A10E1F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 06:05:46 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.225.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id ADDE5201C9;
 Wed, 10 May 2023 08:05:39 +0200 (CEST)
Date: Wed, 10 May 2023 08:05:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, @somainline.org
Subject: Re: [PATCH v7 7/8] drm/msm/dsi: Use MSM and DRM DSC helper methods
Message-ID: <kut5a6r7j7jxgibaljatkqnk66ycvmbeqon7k6fvyhrha4gkwi@qjtqk766akfc>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-7-df48a2c54421@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v7-7-df48a2c54421@quicinc.com>
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

On 2023-05-09 15:06:53, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods to configure DSC for DSI.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..508577c596ff 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -28,6 +28,7 @@
>  #include "dsi.xml.h"
>  #include "sfpb.xml.h"
>  #include "dsi_cfg.h"
> +#include "msm_dsc_helper.h"
>  #include "msm_kms.h"
>  #include "msm_gem.h"
>  #include "phy/dsi_phy.h"
> @@ -848,7 +849,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	/* first calculate dsc parameters and then program
>  	 * compress mode registers
>  	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>  
>  	/*
>  	 * If slice_count is greater than slice_per_intf
> @@ -858,7 +859,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	if (dsc->slice_count > slice_per_intf)
>  		dsc->slice_count = 1;
>  
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	total_bytes_per_intf = msm_dsc_get_bytes_per_intf(dsc, hdisplay);

This helper doesn't use slice_chunk_size, but I'll comment on that in
the patch that adds the helper since it seems better to reuse that (as
drm_dsc_compute_rc_parameters already took care of taking into account
420 | 422.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

>  
>  	eol_byte_num = total_bytes_per_intf % 3;
>  	pkt_per_line = slice_per_intf / dsc->slice_count;
> @@ -1759,7 +1760,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  		return ret;
>  	}
>  
> -	dsc->initial_scale_value = 32;
> +	drm_dsc_set_initial_scale_value(dsc);
>  	dsc->line_buf_depth = dsc->bits_per_component + 1;
>  
>  	return drm_dsc_compute_rc_parameters(dsc);
> 
> -- 
> 2.40.1
> 
