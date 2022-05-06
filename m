Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C451E0F3
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 23:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824BA10E2C4;
	Fri,  6 May 2022 21:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7E10E31D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 21:18:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j4so14585194lfh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xkzP5u72qK43RYOhNZogpD7xbdbfeOcVPCOK9F5pkPs=;
 b=aG2RbOD7Zm1fvthbPCHgJJQe9VnJMVTpamn1wPzuzrJGOSA9VHVBS7Htz70WSZrRRy
 FhKSkyVJtrdcShrsMBstGL19dIG4LRdv2ivpqSnOIE531vrlssK2ZfugogOhZgiLOOnY
 OXwWTiIVD2ej5NbJ8ScItjZxHLzBhwJyZdG1iZDNTgaKSdscJdeKqe34E5r41lf0/ZBt
 tWH4LXLj9YaLEP00D/lAbmPAKyTDvU+96q1f/FxVLi7bJNF1+XvVq6i3F4TpFRcQn4Eg
 yPTHyGMhNPmf8bvL0ffM4Z64QC/J25t1eNWf3RzLSxCJ1F3CZyNJiw31YjE8tavn478H
 7/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xkzP5u72qK43RYOhNZogpD7xbdbfeOcVPCOK9F5pkPs=;
 b=WkQQj1/Nc3en4UVY7yEUZt7jrzLWW8/6yfEMwwXqK8+4gaAIgEqOXXGnw4722HLQql
 TRmQBwCP0VpHaLnwoRdIA+nXhLFbOLpZVFrs7IGxH2UvewAJlaRGZJPvFqooKB66FRr1
 e5ZZvwdyogFYKB0YQVVwmgOOqCcbB/ZpIr0p02J/cRnmGf3y+WRGCeDbXyNVqRWZ1Gd4
 cPx+Qcc6QZzZqT9lj3c0du9fkG/9hkulT8AE5/EqoGwGmlr+4dTa5RXLz9iBQSXRyW52
 6BBfD5ALhk/iXTSG/fjvniYUaLq0hYp4KY5u4WixQ+BgDgRXmAxu9GusGmLTwllJzf0i
 AMPg==
X-Gm-Message-State: AOAM532rvwqrLILaJdbaWN+/9viBbMlmmW2NTsSzQgtG0ZZDiKABZ5H+
 G6hAjQ4eJFshWaUxfsCVYe7VVQ==
X-Google-Smtp-Source: ABdhPJwnVjx/fqO7yeezqY3YCF6km7fh2C7BDZwhzKjlD+/X61ZGr13q78k6WWg5u5837Zb+nPoV+A==
X-Received: by 2002:ac2:5cb4:0:b0:472:4d8a:60be with SMTP id
 e20-20020ac25cb4000000b004724d8a60bemr3841865lfq.118.1651871918312; 
 Fri, 06 May 2022 14:18:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a19560a000000b0047255d211bdsm821126lfb.236.2022.05.06.14.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 14:18:37 -0700 (PDT)
Message-ID: <60674a4b-1837-8c77-1b16-238ad5e14e05@linaro.org>
Date: Sat, 7 May 2022 00:18:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] drm/msm/mdp5: Return error code in
 mdp5_pipe_release when deadlock is detected
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220505214051.155-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220505214051.155-1-quic_jesszhan@quicinc.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/05/2022 00:40, Jessica Zhang wrote:
> mdp5_get_global_state runs the risk of hitting a -EDEADLK when acquiring
> the modeset lock, but currently mdp5_pipe_release doesn't check for if
> an error is returned. Because of this, there is a possibility of
> mdp5_pipe_release hitting a NULL dereference error.
> 
> To avoid this, let's have mdp5_pipe_release check if
> mdp5_get_global_state returns an error and propogate that error.
> 
> Changes since v1:
> - Separated declaration and initialization of *new_state to avoid
>    compiler warning
> - Fixed some spelling mistakes in commit message
> 
> Changes since v2:
> - Return 0 in case where hwpipe is NULL as this is considered normal
>    behavior
> - Added 2nd patch in series to fix a similar NULL dereference issue in
>    mdp5_mixer_release
> 
> Reported-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c  | 15 +++++++++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h  |  2 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 20 ++++++++++++++++----
>   3 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> index ba6695963aa6..a4f5cb90f3e8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
> @@ -119,18 +119,23 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>   	return 0;
>   }
>   
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>   {
>   	struct msm_drm_private *priv = s->dev->dev_private;
>   	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
>   	struct mdp5_global_state *state = mdp5_get_global_state(s);
> -	struct mdp5_hw_pipe_state *new_state = &state->hwpipe;
> +	struct mdp5_hw_pipe_state *new_state;
>   
>   	if (!hwpipe)
> -		return;
> +		return 0;
> +
> +	if (IS_ERR(state))
> +		return PTR_ERR(state);
> +
> +	new_state = &state->hwpipe;
>   
>   	if (WARN_ON(!new_state->hwpipe_to_plane[hwpipe->idx]))
> -		return;
> +		return -EINVAL;
>   
>   	DBG("%s: release from plane %s", hwpipe->name,
>   		new_state->hwpipe_to_plane[hwpipe->idx]->name);
> @@ -141,6 +146,8 @@ void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
>   	}
>   
>   	new_state->hwpipe_to_plane[hwpipe->idx] = NULL;
> +
> +	return 0;
>   }
>   
>   void mdp5_pipe_destroy(struct mdp5_hw_pipe *hwpipe)
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> index 9b26d0761bd4..cca67938cab2 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h
> @@ -37,7 +37,7 @@ int mdp5_pipe_assign(struct drm_atomic_state *s, struct drm_plane *plane,
>   		     uint32_t caps, uint32_t blkcfg,
>   		     struct mdp5_hw_pipe **hwpipe,
>   		     struct mdp5_hw_pipe **r_hwpipe);
> -void mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
> +int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe);
>   
>   struct mdp5_hw_pipe *mdp5_pipe_init(enum mdp5_pipe pipe,
>   		uint32_t reg_offset, uint32_t caps);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 228b22830970..979458482841 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -311,12 +311,24 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>   				mdp5_state->r_hwpipe = NULL;
>   
>   
> -			mdp5_pipe_release(state->state, old_hwpipe);
> -			mdp5_pipe_release(state->state, old_right_hwpipe);
> +			ret = mdp5_pipe_release(state->state, old_hwpipe);
> +			if (ret)
> +				return ret;
> +
> +			ret = mdp5_pipe_release(state->state, old_right_hwpipe);
> +			if (ret)
> +				return ret;
> +
>   		}
>   	} else {
> -		mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> -		mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +		ret = mdp5_pipe_release(state->state, mdp5_state->hwpipe);
> +		if (ret)
> +			return ret;
> +
> +		ret = mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
> +		if (ret)
> +			return ret;
> +
>   		mdp5_state->hwpipe = mdp5_state->r_hwpipe = NULL;
>   	}
>   


-- 
With best wishes
Dmitry
