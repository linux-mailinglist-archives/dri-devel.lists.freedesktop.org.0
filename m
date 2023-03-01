Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999066A68D8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ED110E1EB;
	Wed,  1 Mar 2023 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0A10E21E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 08:24:11 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B74C420398;
 Wed,  1 Mar 2023 09:24:07 +0100 (CET)
Date: Wed, 1 Mar 2023 09:24:03 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: add DSPPs into reservation upon a
 CTM request
Message-ID: <20230301082403.vm4ejqod3ba5wkzp@SoMainline.org>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <1676286704-818-3-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676286704-818-3-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-13 03:11:42, Kalyan Thota wrote:
> Add DSPP blocks into the topology for reservation, if there
> is a CTM request for that composition.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> Changes in v1:
> - Minor nits (Dmitry)
> 
> Changes in v2:
> - Populate DSPPs into the reservation only if CTM is requested (Dmitry)
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..46d2a5c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  static struct msm_display_topology dpu_encoder_get_topology(
>  			struct dpu_encoder_virt *dpu_enc,
>  			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc_state *crtc_state)
>  {
>  	struct msm_display_topology topology = {0};
>  	int i, intf_count = 0;
> @@ -563,8 +564,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	 * 1 LM, 1 INTF
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
> -	 * Adding color blocks only to primary interface if available in
> -	 * sufficient number
> +	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  	if (intf_count == 2)
>  		topology.num_lm = 2;
> @@ -573,11 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
>  	else
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> -			topology.num_dspp = topology.num_lm;
> -	}
> +	if (crtc_state->ctm)
> +		topology.num_dspp = topology.num_lm;
>  
>  	topology.num_enc = 0;
>  	topology.num_intf = intf_count;
> @@ -643,7 +640,7 @@ static int dpu_encoder_virt_atomic_check(
>  		}
>  	}
>  
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>  
>  	/* Reserve dynamic resources now. */
>  	if (!ret) {
> -- 
> 2.7.4
> 
