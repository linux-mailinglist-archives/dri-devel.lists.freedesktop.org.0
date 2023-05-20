Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCED70A64A
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 10:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A261E10E0A3;
	Sat, 20 May 2023 08:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2968710E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 08:07:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 80FAB201EA;
 Sat, 20 May 2023 10:07:30 +0200 (CEST)
Date: Sat, 20 May 2023 10:07:28 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v3 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Message-ID: <uh5cshbplstpnp7npqvnxwefyh7h4zur3vrkt626pdeczgdnya@s3mhsrlc4smy>
References: <20230405-add-dsc-support-v3-0-6e1d35a206b3@quicinc.com>
 <20230405-add-dsc-support-v3-1-6e1d35a206b3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v3-1-6e1d35a206b3@quicinc.com>
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

On 2023-05-19 14:17:26, Jessica Zhang wrote:
> Currently, when compression is enabled, hdisplay is reduced via integer
> division. This causes issues for modes where the original hdisplay is
> not a multiple of 3.
> 
> To fix this, use DIV_ROUND_UP to divide hdisplay.
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>

This should have been:

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>

> Fixes: f3a99460406b ("drm/msm/dsi: update hdisplay calculation for dsi_timing_setup")

This hash is not valid (and checkpatch points it out...), as it is your
local commit from the MSM DSC helper methods series.  The original issue
was introduced in:

Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")

- Marijn

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 9223d7ec5a73..18d38b90eb28 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		 * pulse width same
>  		 */
>  		h_total -= hdisplay;
> -		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>  		h_total += hdisplay;
>  		ha_end = ha_start + hdisplay;
>  	}
> 
> -- 
> 2.40.1
> 
