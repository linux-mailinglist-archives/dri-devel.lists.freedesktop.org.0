Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA96F7711
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC09310E533;
	Thu,  4 May 2023 20:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3013610E538
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 20:33:20 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DB43240B00;
 Thu,  4 May 2023 22:33:16 +0200 (CEST)
Date: Thu, 4 May 2023 22:33:15 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/4] drm/msm/dsi: Adjust pclk rate for compression
Message-ID: <lq6le3pxya3op2nke53uniusr3chtkmqdfrc7wkv4tylqb2fio@esjoh4f63g5q>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-1-6bc6f03ae735@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v1-1-6bc6f03ae735@quicinc.com>
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

Title suggestion: use the wording "reduce pclk rate" :)

(Eventually "when DSC is enabled", instead of "for compression")

On 2023-05-02 18:19:12, Jessica Zhang wrote:
> Divide the pclk rate by the compression ratio when DSC is enabled
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thank you so much for sending this.   The compression ratio was applied
to hdisplay, but not the clocks yet, and with this patch I get a massive
reduction in clock speeds on the Xperia XZ3, without regressions nor
affecting performance/fps:

          gcc_sys_noc_cpuss_ahb_clk       1        1        0    19200000          0     0  50000         Y
          gcc_cpuss_ahb_clk           1        1        0    19200000          0     0  50000         Y
    bi_tcxo                           6        6        0    19200000          0     0  50000         Y
       dsi0vco_clk                    1        1        0  [-1873793994-]{+1249195898+}          0     0  50000         Y
          dsi0_pll_out_div_clk        1        1        0   [-1873793994-]{+624597949+}          0     0  50000         Y
             dsi0_pll_post_out_div_clk       0        0        0   [-468448498-]{+156149487+}          0     0  50000         Y
             dsi0_pll_bit_clk         2        2        0   [-1873793994-]{+624597949+}          0     0  50000         Y
                dsi0_pclk_mux         1        1        0   [-1873793994-]{+624597949+}          0     0  50000         Y
                   dsi0_phy_pll_out_dsiclk       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
                      disp_cc_mdss_pclk0_clk_src       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
                         disp_cc_mdss_pclk0_clk       1        1        0   [-312298999-]{+104099659+}          0     0  50000         Y
                dsi0_pll_by_2_bit_clk       0        0        0   [-936896997-]{+312298974+}          0     0  50000         Y
                dsi0_phy_pll_out_byteclk       1        1        0    [-234224249-]{+78074743+}          0     0  50000         Y
                   disp_cc_mdss_byte0_clk_src       2        2        0    [-234224249-]{+78074743+}          0     0  50000         Y
                      disp_cc_mdss_byte0_div_clk_src       1        1        0    [-117112125-]{+39037372+}          0     0  50000         Y
                         disp_cc_mdss_byte0_intf_clk       1        1        0    [-117112125-]{+39037372+}          0     0  50000         Y
                      disp_cc_mdss_byte0_clk       1        1        0    [-234224249-]{+78074743+}          0     0  50000         Y
       gpu_cc_pll1                    0        0        0   500000097          0     0  50000         N
       disp_cc_mdss_dp_pixel_clk_src       0        0        0    19200000          0     0  50000         N
          disp_cc_mdss_dp_pixel_clk       0        0        0    19200000          0     0  50000         N

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 43a5ec33eee8..35c69dbe5f6f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
>  
> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,

It is a bit unfortunate that this function is called so often with the
same parameters, doing the same calculation over and over.

> +		struct drm_dsc_config *dsc, bool is_bonded_dsi)
>  {
>  	unsigned long pclk_rate;
>  
> @@ -576,6 +577,11 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>  	if (is_bonded_dsi)
>  		pclk_rate /= 2;
>  
> +	/* If DSC is enabled, divide pclk by compression ratio */
> +	if (dsc)
> +		pclk_rate = DIV_ROUND_UP(pclk_rate,
> +				dsc->bits_per_component * 3 / msm_dsc_get_bpp_int(dsc));

Don't forget to mention that this series depends on the DSC helpers.  I
don't think the linked DSC 1.2 series depends on it (at least it doesn't
mention it):

https://lore.kernel.org/linux-arm-msm/20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com/

- Marijn

> +
>  	return pclk_rate;
>  }
>  
> @@ -585,7 +591,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	u8 lanes = msm_host->lanes;
>  	u32 bpp = dsi_get_bpp(msm_host->format);
> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>  	u64 pclk_bpp = (u64)pclk_rate * bpp;
>  
>  	if (lanes == 0) {
> @@ -604,7 +610,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>  
>  static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>  	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>  							msm_host->mode);
>  
> @@ -634,7 +640,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
