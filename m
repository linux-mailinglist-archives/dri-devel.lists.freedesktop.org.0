Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C202196677E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADCE10E7F5;
	Fri, 30 Aug 2024 17:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SOticUiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41910E7D3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:01:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-533488ffaebso2522878e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725037259; x=1725642059; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HyuzVMuh/pclBHjeTifeYUKcalShwXXF1JsCaZjhr8U=;
 b=SOticUiM0a/QY4DoDc39UJklUhl87yv7uCJlEBROL1OYcSkUWPaXAOLCqhCygN3xyX
 /7gN1mRtK9z4jPiKCUnjfXTXSD3wFWGrFsQzaLD+/D+FvCw+CUI/dD4Bd5VR2CLmY7Ws
 98CMl6J9Pqm9wLRa0mB6Btj/v7Q61t+jT5aMIsxQ7t9ivNVtVI+qGig7y5DB98advLhN
 XRXFOYCS4qJ7Gpl4Ib4AoLzbEQmk6Cp6kC+YUlsY5agHTxlNqOTxX5TEBWDFjRkXvd9M
 bkOmDgGpR022Cdps/HOKxvDeO1GoRdOZaYmF79lu+ij/qJDiPgBXfZbs6Z8GLQ6GBYP+
 5Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725037259; x=1725642059;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyuzVMuh/pclBHjeTifeYUKcalShwXXF1JsCaZjhr8U=;
 b=RRIlvZxKtF6lVSNg2dW6tRIZs91N11PW33tkVMbShUCp83DjQvtbIeIBgGsn4y3PUl
 tbNnaE5QBt9qccZKIV7n8oE/Nkzuuc4S2oAt8nZh4q0SRP7QeZbr0xS9ljM77BylfMHd
 mH7T3Rcuqj/UmScpZSFiauu+undTtIMLXKF9XiiY4HHzCfCmKAoi9mwaqeciwo28HmoU
 ALo6bcPodyNecdsm/r8zumnuTjz0oMTdz5rLIsiqsetoCgz4iNRg4yDU9ypydwBaRwAG
 OCQ9DSl+OPQNEx6jbsnU2lBiUuR76XkvYaaTuLxBbGxrjY/HDwWDb/hvEGtidNQ6MMXJ
 w72w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcj+MhTAnLnLF5dGHQqU4Ds78WuntFy510QpcIJn7oDMWxtuZ0NPXST9UpEmbdWA07spn4+wvjeR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKAERu12XVD8WVJbWjupHil6vuw49HMMynuUXFsvJ/kVTr5paZ
 VEsp0N66aGFmEVxYIeszOJ8+wyj1aCoEk8BhGHoD4beCXsLeI3UI6CjavHvOy6Q=
X-Google-Smtp-Source: AGHT+IGfsWr29CZq7zFPXPe35gykwJrno7dzUDJ8NIv9QSBL6Rohbmv/iEfu754VwWaVnHFGaag8Hw==
X-Received: by 2002:a05:6512:3e1d:b0:530:ea2b:1a92 with SMTP id
 2adb3069b0e04-53546b93fa8mr2032468e87.43.1725037258492; 
 Fri, 30 Aug 2024 10:00:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407abdb9sm685041e87.72.2024.08.30.10.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:00:58 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:00:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
Message-ID: <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
> Check that each encoder in the CRTC state's encoder_mask is marked as a
> possible clone for all other encoders in the encoder_mask and that only
> one CRTC is in clone mode at a time
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5ec1b5a38922..bebae365c036 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	return topology;
>  }
>  
> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
> +		struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_encoder *drm_enc;
> +	struct drm_crtc *temp_crtc;
> +	int num_cwb_sessions = 0;
> +
> +	drm_for_each_crtc(temp_crtc, crtc->dev)
> +		if (drm_crtc_in_clone_mode(temp_crtc->state))

No, get the state from drm_atomic_state. temp_crtc->state might be
irrelevant.

> +			num_cwb_sessions++;

Even simpler:
if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
	return false;

> +
> +	/*
> +	 * Only support a single concurrent writeback session running
> +	 * at a time

If it is not a hardware limitation, please add:
FIXME: support more than one session

> +	 */
> +	if (num_cwb_sessions > 1)
> +		return false;
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
> +				crtc_state->encoder_mask) {

Align to opening bracket, please. Granted that other drivers don't
perform this check, is it really necessary? Doesn't
validate_encoder_possible_clones() ensure the same, but during the
encoder registration?

> +			DPU_ERROR("crtc%d failed valid clone check for mask 0x%x\n",

DPU_DEBUG, don't let users spam dmesg.

> +				crtc->base.id, crtc_state->encoder_mask);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>  {
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
> @@ -1287,6 +1317,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			return rc;
>  	}
>  
> +	if (drm_crtc_in_clone_mode(crtc_state) &&
> +			!dpu_crtc_has_valid_clones(crtc, crtc_state))

Align to opening bracket.

> +		return -EINVAL;
> +
>  	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>  		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>  				crtc->base.id, crtc_state->enable,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
