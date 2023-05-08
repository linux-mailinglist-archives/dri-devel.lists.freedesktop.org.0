Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CD6FBA1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D6810E309;
	Mon,  8 May 2023 21:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582CA10E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:43:20 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F3DA63F409;
 Mon,  8 May 2023 23:43:17 +0200 (CEST)
Date: Mon, 8 May 2023 23:43:16 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v6 4/7] drm/msm/dpu: Fix slice_last_group_size calculation
Message-ID: <g55ej2gfdytjytzr66ngh4sg4yaqb4p6l2qjiqbmlplhz2jx75@sqj5iruga6c2>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v6-4-cb7f59f0f7fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-4-cb7f59f0f7fb@quicinc.com>
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

On 2023-04-12 16:25:18, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Changes in v3:
> - Reworded slice_last_group_size calculation to
>   `(dsc->slice_width + 2) % 3`
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index b952f7d2b7f5..ff1c8f92fb20 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -56,9 +56,10 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
>  	if (is_cmd_mode)
>  		initial_lines += 1;
>  
> -	slice_last_group_size = 3 - (dsc->slice_width % 3);
> +	slice_last_group_size = (dsc->slice_width + 2) % 3;
> +
>  	data = (initial_lines << 20);
> -	data |= ((slice_last_group_size - 1) << 18);
> +	data |= (slice_last_group_size << 18);

Agreed, this matches the calculation found in newer downstream.  This
older calculation is only present in an older fbdev driver, and was
working for the only panel I was able to test because the new and the
old calculation result in the same value:

    3 - (720 % 3) - 1 = 2
    (720 + 2) % 3 = 2

The other two outcomes are flipped, and match the downstream switch-case
on slice_width % 3:

    0 -> 2
    1 -> 0
    2 -> 1

More importantly it is one of the fixes necessary to get DSC working on
my SM8150 and SM8250 devices [1].

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Thanks!

- Marijn

[1]: https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1899310

>  	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
>  	data |= (dsc->bits_per_pixel << 8);
>  	data |= (dsc->block_pred_enable << 7);
> 
> -- 
> 2.40.0
> 
