Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E1736B85
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 14:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9E810E2DA;
	Tue, 20 Jun 2023 12:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8968910E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:05:11 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CC40D1F91E;
 Tue, 20 Jun 2023 14:05:06 +0200 (CEST)
Date: Tue, 20 Jun 2023 14:05:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Message-ID: <6rcphtpxou2ef3z44upzfbx23ahmqc4f3eys6qreozutt7v6z6@b22a535fhpor>
References: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-20 00:06:47, Dmitry Baryshkov wrote:
> Provide actual documentation for the pclk and hdisplay calculations in
> the case of DSC compression being used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
> - Added a pointer from dsi_timing_setup() docs to
>   dsi_adjust_pclk_for_compression() (Marijn)
> - Fixed two typo (Marijn)
> 
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 3f6dfb4f9d5a..a8a31c3dd168 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>  	clk_disable_unprepare(msm_host->byte_clk);
>  }
>  
> +/**
> + * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
> + * @mode: the selected mode for the DSI output

The

> + * @dsc: DRM DSC configuration for this DSI output
> + *
> + * Adjust the pclk rate by calculating a new hdisplay proportional to
> + * the compression ratio such that:
> + *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp

And in v1 you explained that it is _not_ about bpp...

> + *
> + * Porches do not need to be adjusted:
> + * - For the VIDEO mode they are not compressed by DSC and are passed as is.
> + * - For the CMD mode there are no actual porches. Instead these fields

I feel like "For VIDEO mode" and "For CMD mode" reads more naturally, no
need for "the", but I don't know the grammar rule that states so.

> + *   currently represent the overhead to the image data transfer. As such, they
> + *   are calculated for the final mode parameters (after the compression) and
> + *   are not to be adjusted too.
> + *
> + *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
> + *  refresh rate and data overhead as a starting point of the calculations.

Nit: well, refresh rate is already part of this calculation (that's how
drm_display_mode's clock member comes to be, and how drm_mode_vrefresh()
figures out fps after the fact).  It's all about the per-CMD transfer
overhead in bytes that is currently not part of the calculation.

> + */
>  static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>  		const struct drm_dsc_config *dsc)
>  {
> @@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		if (ret)
>  			return;
>  
> -		/* Divide the display by 3 but keep back/font porch and
> -		 * pulse width same
> +		/*
> +		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is

Should this be pixels (1 pixel), not bytes, just like in the compressed
scenario?

> +		 * not used, a single pixel is transferred at each pulse, no
> +		 * matter what bpp or pixel format is used. In case of DSC
> +		 * compression this results (due to data alignment
> +		 * requirements) in a transfer of 3 compressed pixel per pclk
> +		 * cycle.
> +		 *
> +		 * If widebus is enabled, bus width is extended to 6 bytes.
> +		 * This way the DPU can transfer 6 compressed pixels with bpp
> +		 * less or equal to 8 or 3 compressed pixels in case bpp is
> +		 * greater than 8.

Okay, so one can not send more than 6 pixels even if the bpp is less
than 8, is what this comes down to.

> +		 *
> +		 * The back/font porch and pulse width are kept intact.  They
> +		 * represent timing parameters rather than actual data
> +		 * transfer. See the documentation of
> +		 * dsi_adjust_pclk_for_compression().

Nit: note that this is only for VIDEO mode, h_total and ha_end are
accurately unused in the CMDmode path below.

- Marijn

> +		 *
> +		 * XXX: widebus is not supported by the driver (yet).
>  		 */
>  		h_total -= hdisplay;
>  		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> -- 
> 2.39.2
> 
