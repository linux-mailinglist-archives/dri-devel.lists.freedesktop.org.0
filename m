Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38838C13945
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC6F10E5BC;
	Tue, 28 Oct 2025 08:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ByPbBEfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EF110E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:43:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so5802183f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761640980; x=1762245780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6NXCKjRFgrYiAfp2xjDLu8YxTLQNZXtyNLdLhXM4zbE=;
 b=ByPbBEfO97FnI20xy2XKXscbVO76xPm8W844JDKtbB3ivcov7E3/4tGiivXPOsPRRV
 F6MeId4PLWF5O2oGrON18djYXlvPDym2WVG6rtyPseqXKedn2iaDOs/I6ZS28uCNpLw/
 3azQcFQkdrCvEkAhzyg2ldEbfJNOSV3tLhe1Il7pOTNwlDpmr0AYKJzrQQakAF44cTOm
 l/iBwVO/RFbDvh0DqNNq7i1fK9ty9dCQM5ysN/YBoDxWyeFUvpy3QAdhcq2kk1xuURkQ
 cJV6Ub9o46SSGscXNtyltviQ0dtPFOIyPc9wysJQ4yQMb8FJbkYg3PgokidQ2ohbJpXA
 LoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761640980; x=1762245780;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6NXCKjRFgrYiAfp2xjDLu8YxTLQNZXtyNLdLhXM4zbE=;
 b=epy3vOscGqLxofG5UYlCKYhPMVkAB9IiZqV7/mIgTVoW7nUieZtN03AlC46jSHbKFh
 qeTZvGYr1fr/0p5fd2zRpt5k/N4ms812nLWh8H3Rh4gMFI1nGi0WYsXZ9AazeEmZe0cD
 zs8TDVONw+/7ZvJHSK6vdUG3tXgDrSkXCmqE4xc3omNW7NvKvztmReA/NTkn7jfDwE+7
 P/CfmQuHztcfMOCm7+E8l3r6BaLusLPScw7gc0lGKJQM3wRd59osizQ6xQSF8lAKK4RR
 I7vTmKCenkQme3TmiKUq40mIOCXSxmncZdOja+Bp+OolYd/e5sx1/lLpCE8nnrDFiI7R
 NsdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDC9jdPd9qg0UX/WbI4tozTDtyKrLHH+iKvsrI4x5PplaotSBhwdJ2uUDaSWqwbRzPTPuL8nu6u/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynFhBi6YUNR7+P1LBXHwrVWgI9AN2R/mrfvFTaLOxEWdzbhX3s
 MmXLlJ2ET5JPgNE46KcjBrFJMF1rMCXgZFFqdjYefFWedZ05V5dDFjEItAHe3VKquUo=
X-Gm-Gg: ASbGncujX+Hj3rfrTt3gXCqBj1xDhxko+mDyfdrDd0yKg+Bpbuj5zxQQ2voeaTm+/v3
 Rdl2/yrpxCSxrk2C02EInbcAp+hpC0ywwgJBh5cXQtMLKGFYbHIGejFlsvat1H2AjSBwJpRcKYO
 /RPONeNzf0WLclGc7gTPD6gf9wO0PBOW+nufiwDIu19b6lOfa6yh30Izf1ONYkv7CL+wmivXS1I
 in/ghc9qHoErMtPxYSpZ+OQXeoi45CvBhcpHLfmtOa/fG0SauTleIjTXzp90S6PV/pfncP1Hh5C
 znzVWUz1RXJpkp5rRGV7fBf97oiI7ba2XWiWB8kyj8MmfqLYJK/Ru9J1jvca0FC5eV8ZctVjdi9
 lIWTO8aIHy/qJ8iaN0iXL6M8W0nOSLNgL2WBSYmWb8zNSV1SnIbAPDGRUgEcXQP6m4Wb21/bdqN
 l1iOT/Yzzi1oa0KzdWPrqW2XVl2bo5Rx7XD7/Izevo1qLDnefz8w==
X-Google-Smtp-Source: AGHT+IGO/CrRm+czlEY/95+Qqx9U6VFPdwHdnit4aNOq5qYQYeiVQ3qkFspoLXuMWyUgnNASWVZ6rg==
X-Received: by 2002:a05:6000:1861:b0:427:928:787f with SMTP id
 ffacd0b85a97d-429a7e4ee59mr1933860f8f.21.1761640979509; 
 Tue, 28 Oct 2025 01:42:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5?
 ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952e2e06sm19118388f8f.46.2025.10.28.01.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:42:59 -0700 (PDT)
Message-ID: <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
Date: Tue, 28 Oct 2025 09:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/7/25 03:38, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - *crtc_clock -> *mode_clock (Dmitry)
> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
> - Switch from quic_* email to OSS email
> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>   3 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 0fb5789c60d0..13cc658065c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>   	DPU_PERF_MODE_MAX
>   };
>   
> +/**
> + * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate according to
> + *   the perf clock factor.
> + * @crtc_clk_rate - Unadjusted mode clock rate
> + * @perf_cfg: performance configuration
> + */
> +u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg)
> +{
> +	u32 clk_factor;
> +
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
> +	if (clk_factor) {
> +		mode_clk_rate *= clk_factor;
> +		do_div(mode_clk_rate, 100);
> +	}
> +
> +	return mode_clk_rate;
> +}
> +
>   /**
>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>    * @perf_cfg: performance configuration
> @@ -75,28 +95,21 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>   	struct drm_plane *plane;
>   	struct dpu_plane_state *pstate;
>   	struct drm_display_mode *mode;
> -	u64 crtc_clk;
> -	u32 clk_factor;
> +	u64 mode_clk;
>   
>   	mode = &state->adjusted_mode;
>   
> -	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
> +	mode_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
>   
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
>   		pstate = to_dpu_plane_state(plane->state);
>   		if (!pstate)
>   			continue;
>   
> -		crtc_clk = max(pstate->plane_clk, crtc_clk);
> -	}
> -
> -	clk_factor = perf_cfg->clk_inefficiency_factor;
> -	if (clk_factor) {
> -		crtc_clk *= clk_factor;
> -		do_div(crtc_clk, 100);
> +		mode_clk = max(pstate->plane_clk, mode_clk);
>   	}
>   
> -	return crtc_clk;
> +	return dpu_core_perf_adjusted_mode_clk(mode_clk, perf_cfg);
>   }
>   
>   static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index d2f21d34e501..3740bc97422c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>   	u32 fix_core_ab_vote;
>   };
>   
> +u64 dpu_core_perf_adjusted_mode_clk(u64 clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg);
> +
>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   		struct drm_crtc_state *state);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0714936d8835..5e3c34fed63b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1501,6 +1501,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>   						const struct drm_display_mode *mode)
>   {
>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	u64 adjusted_mode_clk;
>   
>   	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>   	 * split the large layer into 2 LMs, filter out such modes
> @@ -1508,6 +1509,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>   	if (!dpu_kms->catalog->caps->has_3d_merge &&
>   	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>   		return MODE_BAD_HVALUE;
> +
> +	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
> +							    dpu_kms->perf.perf_cfg);
> +
> +	/*
> +	 * The given mode, adjusted for the perf clock factor, should not exceed
> +	 * the max core clock rate
> +	 */
> +	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
> +		return MODE_CLOCK_HIGH;

This test doesn't take in account if the mode is for a bonded DSI mode, which
is the same mode on 2 interfaces doubled, but it's valid since we could literally
set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
in addition to the fix:
https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

I'm trying to find a correct way to handle that, I have tried that:
===========================><========================================
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 48c3aef1cfc2..6aa5db1996e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1684,8 +1684,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
  static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
  						const struct drm_display_mode *mode)
  {
+	struct drm_encoder *encoder = get_encoder_from_crtc(crtc);
  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
  	u64 adjusted_mode_clk;
+	unsigned int intfs;

  	/* if there is no 3d_mux block we cannot merge LMs so we cannot
  	 * split the large layer into 2 LMs, filter out such modes
@@ -1700,12 +1702,18 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
  	if (dpu_kms->catalog->caps->has_3d_merge)
  		adjusted_mode_clk /= 2;

+	intfs = dpu_encoder_get_intf_count(encoder);
+	if (intfs)
+		adjusted_mode_clk /= intfs;
+
  	/*
  	 * The given mode, adjusted for the perf clock factor, should not exceed
  	 * the max core clock rate
  	 */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3dd202e0ce94..862239b7d4bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2892,6 +2892,23 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
  	return INTF_MODE_NONE;
  }

+/**
+ * dpu_encoder_get_intf_count - get interface count of the given encoder
+ * @encoder: Pointer to drm encoder object
+ */
+unsigned int dpu_encoder_get_intf_count(struct drm_encoder *encoder)
+{
+	struct dpu_encoder_virt *dpu_enc = NULL;
+
+	if (!encoder) {
+		DPU_ERROR("invalid encoder\n");
+		return 0;
+	}
+	dpu_enc = to_dpu_encoder_virt(encoder);
+
+	return dpu_enc->num_phys_encs;
+}
+
  /**
   * dpu_encoder_helper_get_cwb_mask - get CWB blocks mask for the DPU encoder
   * @phys_enc: Pointer to physical encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7e..f10ad297b379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -58,6 +58,8 @@ int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);

  enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);

+unsigned int dpu_encoder_get_intf_count(struct drm_encoder *encoder);
+
  void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);

  uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
====================================><========================================

But this doesn't work since the crtc hasn't been associated to the encoder yet....

Neil

> +
>   	/*
>   	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>   	 */
> 
> ---
> base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
> change-id: 20250506-filter-modes-c60b4332769f
> 
> Best regards,

