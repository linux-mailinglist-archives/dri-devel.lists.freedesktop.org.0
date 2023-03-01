Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4A6A68DF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D7710E1EE;
	Wed,  1 Mar 2023 08:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D576210E1EE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 08:27:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AC8942038B;
 Wed,  1 Mar 2023 09:27:06 +0100 (CET)
Date: Wed, 1 Mar 2023 09:27:05 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: avoid unnecessary check in DPU
 reservations
Message-ID: <20230301082705.ugbaov2kr75fygnr@SoMainline.org>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <1676286704-818-4-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676286704-818-4-git-send-email-quic_kalyant@quicinc.com>
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

On 2023-02-13 03:11:43, Kalyan Thota wrote:
> Return immediately on failure, this will make dpu reservations
> part look cleaner.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 46d2a5c..3920efd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -636,25 +636,22 @@ static int dpu_encoder_virt_atomic_check(
>  		if (ret) {
>  			DPU_ERROR_ENC(dpu_enc,
>  					"mode unsupported, phys idx %d\n", i);
> -			break;
> +			return ret;
>  		}
>  	}
>  
>  	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>  
> -	/* Reserve dynamic resources now. */
> -	if (!ret) {
> -		/*
> -		 * Release and Allocate resources on every modeset
> -		 * Dont allocate when active is false.
> -		 */
> -		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -			dpu_rm_release(global_state, drm_enc);
> +	/*
> +	 * Release and Allocate resources on every modeset
> +	 * Dont allocate when active is false.
> +	 */
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		dpu_rm_release(global_state, drm_enc);
>  
> -			if (!crtc_state->active_changed || crtc_state->active)
> -				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -						drm_enc, crtc_state, topology);
> -		}
> +		if (!crtc_state->active_changed || crtc_state->active)
> +			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +					drm_enc, crtc_state, topology);
>  	}
>  
>  	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> -- 
> 2.7.4
> 
