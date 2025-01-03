Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E0A00D6D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 19:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FB410E17E;
	Fri,  3 Jan 2025 18:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FGTyH6es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1B10E31B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 18:10:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so149889431fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927786; x=1736532586; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
 b=FGTyH6esZWKcPSuIQW3DwTRdAZp0lW/ysizF0sQOtltxnGAHVblH5Lyq8W5xBpoGC/
 7Mlbi35fhFghUCGG2IxX2wzqCAuylrvqrjcyVh0Zco56UqRJna1xXHcjMSBj710upJHC
 H4D0j9L0frW1jiv+zjXFDi4weqh9cpZKnR1dp4XAhcSeD9fUzNtvoplDuCaVTCep6n3a
 FVq4xZfXJjRHOhAgvqm6g9Qxlif75SGQASBaI3MJ01AeUnfgd/8QIq0hYpmA/aksyaAK
 GU3o8bSbXHcV7tAUwlmGt7GdQ97MQkv6oT8CspopezPJdXBFVrFLNBGJXwH933OZAI2o
 VWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927786; x=1736532586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZYLBdsRdDPVtkeCUAysBUJx2iI5sqwL/egQovGRiw8=;
 b=YwEe9a3s5+xWIoxGA4R8oG9K65V11MWXndCG7KifQohbbGMcg0AUfGhl2y+RQY5Tv0
 lrHTL4Uj8fE4qKdN3MSlHqcTAvfu1i/hBkhd5rLYSQRj+0c55Kc9yKV3Fbsvp0KcNO5f
 9jF6AC0j/RACz+nmNsYhJUO72IH50F0TwxLde148skCxBn/EMrqWN+yoyNJOVNMeRKkp
 EWBLxgdmIksQRg6ceX/BigZCH9suRqMGwhSyq+nWw6Q54v81NP+3KrJR6xGY27wQrK52
 wRR5SYRNgZZjug/1NYhIo2QnEpAmtWWkv5PehxvLhWo6usT51Bw/E3KIMbL6fWkqV5e8
 i3RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcbkuqgB7EyVscadvwdwa2wed5Ur3crxA+bL5y6vYHtYx0Mxhz4xDj4ObCo5Ht8s7TTJVorCXyLvQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ScSFkFW+fADPdjkOVwcKmZSXwC2QF162zJJ4LwQ6UIwpaCtw
 FCtHy1t73Ve2QJYoiVTQV7WPaz6igl0iVKnUJk2yuTBgUqROFplft0+uopHrPh0=
X-Gm-Gg: ASbGncvZTqkQIRmavFf71h+/4aj6jkNdKkrUGDC5KUWyxIKg4ZeLeqKpYHssD9HcHY8
 Pn7tW19e9bU3p05rhAUEcFQm0aMvAidFtUVM/M8RUT9kD0jUUGevAa62/Ym2zfczz0CMFUzAbOe
 uvdCW2/ZBR1xbUAewpgcreyTiyG8EyR1pw9U9lMw4+kJaAVdxI2iTZXaQ+0iHN64MmnHhwR56MU
 0FHnkV//3g6gKx3d8+r489dW2L43wpBRJpVBnKA4aCQtbpqJDtY5jfT1hwjeh/g2wCx1Oau8VYl
 s5QkkFQ2CWa0bpvFh8aLbzoJCQ2CiHqextLN
X-Google-Smtp-Source: AGHT+IEigSb029e59y379vL7vE1ceWNcVXZK8+VzyasTF/J25CUvyFgmDW7iv3a1fCJVEGa2Lq5l/w==
X-Received: by 2002:a05:651c:198f:b0:302:3261:8e33 with SMTP id
 38308e7fff4ca-30468517777mr152461131fa.4.1735927785612; 
 Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b083af8sm46855921fa.101.2025.01.03.10.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:09:45 -0800 (PST)
Date: Fri, 3 Jan 2025 20:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them, which
> is handling the explicit disabling of non-transparent mode and its
> disable->enable sequence mentioned in the DP Standard v2.0 section
> 3.6.6.1.
> 
> So use the new drm generic helper instead as it makes the code a bit
> cleaner.
> 
> Acked-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
>  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
>  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
>  
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> -		return false;
> -
>  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
>  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
>  
> @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	int lttpr_count;
> +	int ret;
>  
>  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
>  		return 0;
> @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		return lttpr_count;
>  	}
>  
> -	/*
> -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> -	 * non-transparent mode and the disable->enable non-transparent mode
> -	 * sequence.
> -	 */
> -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> -
> -	/*
> -	 * In case of unsupported number of LTTPRs or failing to switch to
> -	 * non-transparent mode fall-back to transparent link training mode,
> -	 * still taking into account any LTTPR common lane- rate/count limits.
> -	 */
> -	if (lttpr_count < 0)
> -		goto out_reset_lttpr_count;
> -
> -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> +	if (ret) {
>  		lt_dbg(intel_dp, DP_PHY_DPRX,
>  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
>  
> @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
>  		goto out_reset_lttpr_count;
>  	}
>  
> +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> +

I think the code now misses a way to update intel_dp->lttpr_common_caps
in a transparent-mode case:
intel_dp_set_lttpr_transparent_mode(intel_dp, true).

>  	return lttpr_count;
>  
>  out_reset_lttpr_count:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
