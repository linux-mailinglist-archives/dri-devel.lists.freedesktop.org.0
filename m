Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2C54C8B8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1D810E554;
	Wed, 15 Jun 2022 12:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54110E4CA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:39:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id a15so18678450lfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bwvOqj3SED8Fwlxj46NmjSD6svVkqYJj6IOaVQ6JwUU=;
 b=lrxbeWGbRftjs9+c8HTNUb4b6NIVOtN30fu/lYe1O6K63BsqBLHNAOIDFCThlmHmXu
 pMLuhIEeElz4vk9xP18tGV2sWDdI41nAi6wUa8X0r9bURfnuLTZ7KhKHimDygx+jSdG9
 BvF4y3UPzp3ZTxiGzIimoTrtmg66aYVju7/ok0UsPGxlMMg1tTdLpeVAUY8w1JjG6t6R
 GvFkGn6x0GhNFfRpylUi2dmlDgg9qMk7xXN1f1lHp8pX7pXrq7yA66f0A3yqvwjIO60F
 Ib+QsVYY9rZL2Xn4cDEBu9IzQMXozVVldtTMHlTEsTFc0yEeNMzeOuc5ylcJ60uWyC1l
 GC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bwvOqj3SED8Fwlxj46NmjSD6svVkqYJj6IOaVQ6JwUU=;
 b=WfHxdNweiNJndryK59s609weYYJdMK8/2kAwWkDYwgnPl2XsubAgh2IZxZ5Rvyd/8e
 vI4CgakDhkdortHTAdJCcYeXIA+sEK/Hufeo4Gs7br5of6722bQSjY/v9rUwtU65lhuw
 XdDgkVyGYbYaM9sjePztd0KIJ9qxF/ogZQY27Hhy28OgMj13IWMdZpT8rp4q1PPL9vBD
 mLFlkWhZV89aJlUtUneWrkWf7rVx02eIda3372BhZIVxYdcUcqi5psyqB1XZrDY24vBl
 sp3/wO9bLRr0TmiKBpY9V5wNrn4Z8m6sT0o4BrUhiefV2/AG2mD1bCU30pnSNk1lamQc
 z86w==
X-Gm-Message-State: AJIora8xUksAsWj0tKksbVPJH6y0Fcb+Z3Tw/kusnWVSQBPkDqgtuxFY
 pmgPfc574isyKf4a2/0/lWxgxQ==
X-Google-Smtp-Source: AGRyM1t3+Hli2/Qmtg2lvWRFzOBmwnpK/OIbMqssKJWB1HMzDT4xFFRxOtCx3ooEvGu75kztpJ1Fzg==
X-Received: by 2002:a05:6512:e93:b0:47f:3e19:4d64 with SMTP id
 bi19-20020a0565120e9300b0047f3e194d64mr933201lfb.488.1655296745453; 
 Wed, 15 Jun 2022 05:39:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 1-20020ac25f01000000b0047c61fcd4f2sm1786528lfq.56.2022.06.15.05.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:39:05 -0700 (PDT)
Message-ID: <bfd3d8bb-2b31-16c8-3267-805ae35a480c@linaro.org>
Date: Wed, 15 Jun 2022 15:39:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: move intf and wb assignment to
 dpu_encoder_setup_display()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
> intf and wb resources are not dependent on the rm global
> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
> 
> Move the allocation of intf and wb resources to dpu_encoder_setup_display()
> so that we can utilize the hw caps even during atomic_check() phase.
> 
> Since dpu_encoder_setup_display() already has protection against
> setting invalid intf_idx and wb_idx, these checks can now
> be dropped as well.
> 

I'm going to pick up the last two patches, so you'd have to resend just 
the first one.


> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual encoder")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 +++++++------------------
>   1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..e991d4ba8a40 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1048,24 +1048,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> -		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> -			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> -
> -		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> -			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> -
> -		if (!phys->hw_intf && !phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf or wb block assigned at idx: %d\n", i);
> -			return;
> -		}
> -
> -		if (phys->hw_intf && phys->hw_wb) {
> -			DPU_ERROR_ENC(dpu_enc,
> -					"invalid phys both intf and wb block at idx: %d\n", i);
> -			return;
> -		}
> -
>   		phys->cached_mode = crtc_state->adjusted_mode;
>   		if (phys->ops.atomic_mode_set)
>   			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> @@ -2293,7 +2275,14 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>   		atomic_set(&phys->vsync_cnt, 0);
>   		atomic_set(&phys->underrun_cnt, 0);
> +
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>   	}
> +
>   	mutex_unlock(&dpu_enc->enc_lock);
>   
>   	return ret;


-- 
With best wishes
Dmitry
