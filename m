Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E907AC781
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 12:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25310E118;
	Sun, 24 Sep 2023 10:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4946310E116
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 10:20:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c123eed8b2so74909131fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 03:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550800; x=1696155600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hY0ljtde/5K2iYIwWscMKJ2Ri1157h8FSjz1rWDedH4=;
 b=SAblE4MlFkKAoVfpw1gQQPEiey+cU6kc/pyYYdP+/OxrRbaSWZjfvQ825fW9inmRN5
 GwcRTHDGz6MsfBF9BqW7eDgzlTeepQQeW69UDF9EdmWb8n8EpDAYOqLRYVs/JDQV28zU
 x/DcXUsSdy2adahmxOAf9K2/Zy5+9+t2i8+Eex4U92WZy0DmfaXvrM26tVAJzMaRjCj5
 G6ZCejzEho73u2chZKm/iKKcM9GA1BcALraM9xPyStL3Z8HK4QPAUE1vewaSAPS33EO8
 CkAYQdXYs8nHWATiIYb3fU1l038dLEa1BNiGzZTSfui9DPT/Do0Coe7//ULlDETJQHQf
 yoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550800; x=1696155600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hY0ljtde/5K2iYIwWscMKJ2Ri1157h8FSjz1rWDedH4=;
 b=X4kIJpoluMEzg+2DaRaY87q2IFjPoiKByLcDgLeD5slKr5CUp4CUzr0fn5GEQ1qftc
 aqbbJxjfX6y2BTNT03eJ41+HFp3vGRRy77Mvd0B0sVB+Cs+QdyLn9lT26tGwCZpWmjjt
 CLmQjCr2e5ku0EMJjSvtrZOmyb1ORKEmhg6bVyQjHeJkPpph5whnA3nAwtAeekM6o5se
 ZeTatTFT+EOtMpXY0KVEHD2AGkzxxORqkTZis/DjhgQqebquS47ELiYcYGYI10yqaCnd
 LSp4/Q6bESFduvGnHpz0luhzlVhA8cGEK241hbjK2FB8yEHqtGDaj2UEeYNBOibmzbvS
 sY9w==
X-Gm-Message-State: AOJu0YyMIougHS1Dqf5Tm+trGGlsdydbco/B8YJhdDmGpWNMCwoLvqOR
 buCreV/axH8P8bT6tTwoFVaWXw==
X-Google-Smtp-Source: AGHT+IE1R+kW0CUrN0+4eCznwg1+XjbH2xe2PKn1epb7KtCwDBCaHMVn5JRFspmw4xwDmbE69z5HqQ==
X-Received: by 2002:ac2:4d86:0:b0:501:c779:b3bb with SMTP id
 g6-20020ac24d86000000b00501c779b3bbmr2852198lfe.60.1695550800011; 
 Sun, 24 Sep 2023 03:20:00 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05640207c700b005311e934765sm4244799edy.27.2023.09.24.03.19.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:19:59 -0700 (PDT)
Message-ID: <31d6163a-a71d-4707-a958-43bde2042d42@linaro.org>
Date: Sun, 24 Sep 2023 13:19:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic checks
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source != FB, the commit can still go through.
> 
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
> 
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source == FB.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>   drivers/gpu/drm/drm_atomic_helper.c | 36 ++++++++++++++++++++----------------
>   include/drm/drm_atomic_helper.h     |  4 ++--
>   include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>   4 files changed, 62 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index cc0e93d19e15..cdc6cfedd433 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -668,14 +668,14 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	const struct drm_framebuffer *fb = new_plane_state->fb;
>   	int ret;
>   
> -	/* either *both* CRTC and FB must be set, or neither */
> -	if (crtc && !fb) {
> -		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no FB\n",
> +	/* either *both* CRTC and pixel source must be set, or neither */
> +	if (crtc && !drm_plane_has_visible_data(new_plane_state)) {
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no visible data\n",
>   			       plane->base.id, plane->name);
>   		return -EINVAL;
> -	} else if (fb && !crtc) {
> -		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] FB set but no CRTC\n",
> -			       plane->base.id, plane->name);
> +	} else if (drm_plane_has_visible_data(new_plane_state) && !crtc) {
> +		drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] Source %d has visible data but no CRTC\n",
> +			       plane->base.id, plane->name, new_plane_state->pixel_source);
>   		return -EINVAL;
>   	}
>   
> @@ -706,9 +706,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>   	}
>   
>   
> -	ret = drm_atomic_plane_check_fb(new_plane_state);
> -	if (ret)
> -		return ret;
> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {

Nit: could you please be more specific here? Drop the fb variable and 
use new_plane_state->fb directly.

> +		ret = drm_atomic_plane_check_fb(new_plane_state);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	if (plane_switching_crtc(old_plane_state, new_plane_state)) {
>   		drm_dbg_atomic(plane->dev,
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 41b8066f61ff..a176064ee27e 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -864,7 +864,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   	*src = drm_plane_state_src(plane_state);
>   	*dst = drm_plane_state_dest(plane_state);
>   
> -	if (!fb) {
> +	if (!drm_plane_has_visible_data(plane_state)) {
>   		plane_state->visible = false;
>   		return 0;
>   	}
> @@ -881,25 +881,29 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>   		return -EINVAL;
>   	}
>   
> -	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
> +	if (plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {


And here too. Could you please move fb var into the condition?

Other than that LGTM


> +		drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>   
> -	/* Check scaling */
> -	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> -	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> -	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->plane->dev,
> -			    "Invalid scaling of plane\n");
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> -		return -ERANGE;
> -	}
> +		/* Check scaling */
> +		hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> +		vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>   
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
> +		if (hscale < 0 || vscale < 0) {
> +			drm_dbg_kms(plane_state->plane->dev,
> +					"Invalid scaling of plane\n");
> +			drm_rect_debug_print("src: ", &plane_state->src, true);
> +			drm_rect_debug_print("dst: ", &plane_state->dst, false);
> +			return -ERANGE;
> +		}
>   
> -	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		if (crtc_state->enable)
> +			drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>   
> -	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +		plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
> +		drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
> +	} else if (drm_plane_solid_fill_enabled(plane_state)) {
> +		plane_state->visible = true;
> +	}
>   
>   	if (!plane_state->visible)
>   		/*
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 536a0b0091c3..6d97f38ac1f6 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -256,8 +256,8 @@ drm_atomic_plane_disabling(struct drm_plane_state *old_plane_state,
>   	 * Anything else should be considered a bug in the atomic core, so we
>   	 * gently warn about it.
>   	 */
> -	WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != NULL) ||
> -		(new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
> +	WARN_ON((new_plane_state->crtc == NULL && drm_plane_has_visible_data(new_plane_state)) ||
> +		(new_plane_state->crtc != NULL && !drm_plane_has_visible_data(new_plane_state)));
>   
>   	return old_plane_state->crtc && !new_plane_state->crtc;
>   }
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index a58f84b6bd5e..4c5b7bcdb25c 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -992,6 +992,35 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>   #define drm_for_each_plane(plane, dev) \
>   	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>   
> +/**
> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
> + * @state: plane state
> + *
> + * Returns:
> + * Whether the plane has been assigned a solid_fill_blob
> + */
> +static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
> +{
> +	if (!state)
> +		return false;
> +	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
> +}
> +
> +static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
> +{
> +	switch (state->pixel_source) {
> +	case DRM_PLANE_PIXEL_SOURCE_NONE:
> +		return false;
> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
> +		return state->solid_fill_blob != NULL;
> +	case DRM_PLANE_PIXEL_SOURCE_FB:
> +	default:
> +		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
> +	}
> +
> +	return state->fb != NULL;
> +}
> +
>   bool drm_any_plane_has_format(struct drm_device *dev,
>   			      u32 format, u64 modifier);
>   
> 

-- 
With best wishes
Dmitry

