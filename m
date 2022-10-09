Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7C5F8D9A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 20:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4F10E545;
	Sun,  9 Oct 2022 18:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C304210E545
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 18:58:08 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5E60F1F969;
 Sun,  9 Oct 2022 20:58:06 +0200 (CEST)
Date: Sun, 9 Oct 2022 20:58:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 06/10] drm/msm/dsi: Migrate to
 drm_dsc_compute_rc_parameters()
Message-ID: <20221009185804.si22xuo4rs6qxicc@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185058.460688-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009185058.460688-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-09 20:50:54, Marijn Suijten wrote:

Apologies.  After attempting to recover from an unexpected interruption
_right as I was sending this series_, this patch got sent twice as it
only later appeared to also have made its way through in the first round
[1], together with the cover letter and first five patches.

[1]: https://lore.kernel.org/linux-arm-msm/20221009184824.457416-7-marijn.suijten@somainline.org/

- Marijn

> As per the FIXME this code is entirely duplicate with what is already
> provided inside drm_dsc_compute_rc_parameters(), and it is yet unknown
> why this comment was put in place instead of resolved from the get-go.
> Not only does it save on duplication, it would have also spared certain
> issues.
> 
> For example, this code from downstream assumed dsc->bits_per_pixel to
> contain an integer value, whereas the upstream drm_dsc_config struct has
> it with 4 fractional bits.  drm_dsc_compute_rc_parameters() already
> accounts for this feat, and the sole remaining use of
> dsc->bits_per_pixel inside dsi_populate_dsc_params() will be addressed
> in a separate patch.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 64 +++---------------------------
>  1 file changed, 6 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 83cde4d62b68..68c39debc22f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -21,6 +21,7 @@
>  
>  #include <video/mipi_display.h>
>  
> +#include <drm/display/drm_dsc_helper.h>
>  #include <drm/drm_of.h>
>  
>  #include "dsi.h"
> @@ -1771,14 +1772,6 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
>  
>  static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>  {
> -	int mux_words_size;
> -	int groups_per_line, groups_total;
> -	int min_rate_buffer_size;
> -	int hrd_delay;
> -	int pre_num_extra_mux_bits, num_extra_mux_bits;
> -	int slice_bits;
> -	int data;
> -	int final_value, final_scale;
>  	int i;
>  
>  	dsc->rc_model_size = 8192;
> @@ -1804,11 +1797,11 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>  	if (dsc->bits_per_pixel != 8)
>  		dsc->initial_offset = 2048;	/* bpp = 12 */
>  
> -	mux_words_size = 48;		/* bpc == 8/10 */
> -	if (dsc->bits_per_component == 12)
> -		mux_words_size = 64;
> +	if (dsc->bits_per_component <= 10)
> +		dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
> +	else
> +		dsc->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
>  
> -	dsc->mux_word_size = mux_words_size;
>  	dsc->initial_xmit_delay = 512;
>  	dsc->initial_scale_value = 32;
>  	dsc->first_line_bpg_offset = 12;
> @@ -1820,52 +1813,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
>  	dsc->rc_quant_incr_limit0 = 11;
>  	dsc->rc_quant_incr_limit1 = 11;
>  
> -	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
> -	 * params are calculated
> -	 */
> -	groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
> -	dsc->slice_chunk_size = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> -
> -	/* rbs-min */
> -	min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> -				dsc->initial_xmit_delay * dsc->bits_per_pixel +
> -				groups_per_line * dsc->first_line_bpg_offset;
> -
> -	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
> -
> -	dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
> -
> -	dsc->initial_scale_value = 8 * dsc->rc_model_size /
> -				       (dsc->rc_model_size - dsc->initial_offset);
> -
> -	slice_bits = 8 * dsc->slice_chunk_size * dsc->slice_height;
> -
> -	groups_total = groups_per_line * dsc->slice_height;
> -
> -	data = dsc->first_line_bpg_offset * 2048;
> -
> -	dsc->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->slice_height - 1));
> -
> -	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->bits_per_component + 4) - 2);
> -
> -	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
> -			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
> -
> -	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
> -	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> -
> -	data = dsc->initial_xmit_delay * dsc->bits_per_pixel;
> -	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> -	dsc->final_offset = final_value;
> -
> -	final_scale = 8 * dsc->rc_model_size / (dsc->rc_model_size - final_value);
> -
> -	data = (final_scale - 9) * (dsc->nfl_bpg_offset + dsc->slice_bpg_offset);
> -	dsc->scale_increment_interval = (2048 * dsc->final_offset) / data;
> -
> -	dsc->scale_decrement_interval = groups_per_line / (dsc->initial_scale_value - 8);
> -
> -	return 0;
> +	return drm_dsc_compute_rc_parameters(dsc);
>  }
>  
>  static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
> -- 
> 2.38.0
> 
