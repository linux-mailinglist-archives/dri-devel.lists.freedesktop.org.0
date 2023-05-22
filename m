Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7170CC75
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9B10E07E;
	Mon, 22 May 2023 21:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6A110E07E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:31:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C496920161;
 Mon, 22 May 2023 23:31:42 +0200 (CEST)
Date: Mon, 22 May 2023 23:31:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 2/5] drm/msm/dsi: Adjust pclk rate for compression
Message-ID: <ybyb3sijo462w4qeoihmm6sd3m7ht2p4clhh7qdzk4fnej7v3e@j4pf2kzu2d4v>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-2-15daf84f8dcb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v4-2-15daf84f8dcb@quicinc.com>
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

On 2023-05-22 13:30:21, Jessica Zhang wrote:
> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
> is enabled.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

As discussed previously, this patch would apply a lot more cleanly on
top of:

https://lore.kernel.org/linux-arm-msm/20230520200103.4019607-1-dmitry.baryshkov@linaro.org/T/#u

(This is the v2 that doesn't change the callback, but does change the
code flow so that you have to *touch less lines* in this patch).

- Marijn

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 18d38b90eb28..d04f8bbd707d 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
>  
> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
> +static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
> +		const struct drm_dsc_config *dsc)
> +{
> +	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
> +			dsc->bits_per_component * 3);
> +
> +	return (new_hdisplay + (mode->htotal - mode->hdisplay))
> +			* mode->vtotal * drm_mode_vrefresh(mode);
> +}
> +
> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
> +		const struct drm_dsc_config *dsc, bool is_bonded_dsi)
>  {
>  	unsigned long pclk_rate;
>  
> @@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>  	if (is_bonded_dsi)
>  		pclk_rate /= 2;
>  
> +	/* If DSC is enabled, divide hdisplay by compression ratio */
> +	if (dsc)
> +		pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);
> +
>  	return pclk_rate;
>  }
>  
> @@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	u8 lanes = msm_host->lanes;
>  	u32 bpp = dsi_get_bpp(msm_host->format);
> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>  	u64 pclk_bpp = (u64)pclk_rate * bpp;
>  
>  	if (lanes == 0) {
> @@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  
>  static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>  	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>  							msm_host->mode);
>  
> @@ -634,7 +649,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  
>  	dsi_calc_pclk(msm_host, is_bonded_dsi);
>  
> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
>  	do_div(pclk_bpp, 8);
>  	msm_host->src_clk_rate = pclk_bpp;
>  
> 
> -- 
> 2.40.1
> 
