Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C99AD3AB0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7451E10E597;
	Tue, 10 Jun 2025 14:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kldFenT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDF910E597
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:10:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so63420385e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564651; x=1750169451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7xRZaCqfgFQZF5DtUD0UWiWLPdXpNsrUellAmF4l02M=;
 b=kldFenT8DUz0yvdQkfr3PPfWbc/vxsqhSruRRbt1xJ4I6sGZqMsoDT3bt+IKubtUhP
 ZYpsDJ4uBW6GkfRgG+dr7uSi608RDs4UyncoTLfGO7D2AQxZ8qeA28p1790jFncZweYE
 he0uZkbG8YYQ2oUVspXsPg9UeGYT9hkwLwR38GbPperWlUZr+q6mMUvyAkq0D8HxBDie
 ztwcyi8Fc2iwZYhJIHQmcolJNoSNDSQXro7tmT9CpYaUf+JSnUAXrhisMKA6S1rs4X0F
 HcY0nPOPQi6iMVRhnZM9hs9IyGAoRPyKLIB4xxly9JaEGIzgh7U1Ng3xDfSnlE3EcGV5
 zj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564651; x=1750169451;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7xRZaCqfgFQZF5DtUD0UWiWLPdXpNsrUellAmF4l02M=;
 b=BFyYhZYAUE3TdscayU3aXp5TxboebrHBtUPBmN90ywEs89CBTs4c2oeKk0WflvXdHU
 hidx6Mxxl2krXFlXTql/WE5CqGlJx9xj9Rmsc4Cb7DRFWZoX/0vgfzwxgcL8TZL66lIz
 aHUuE63c216DKuZXK3739eo1xEdo4G1s4Oe7OFohohm9MB1WBpET/aw8+xC9FcI61mRH
 d6rdTpjqnl8uJpcNRKlObu0zlqegmavFDgT4QVISWTqHNxm7/ShzFhW9ZKBzYb7wpyRK
 vQqiTuSjqyEVDXzkHIExCu+MtsqFBivV2sTVfwThjUTJ5sUU3Aw2Jf3sHL7z5jYA4pgS
 vhew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz57tQZIX+bjuMHWt1PhbDbQ4Eshm9xB15DscLghRyPgacMTPRZZN4d9WKsCOoA4Px89GEFL3k2rY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL/W1b8e5uTsnRtsHMdjBetv14X8WU2kLj/6bbcLF6/UFBH0OR
 vjTpeOIbigFEW6PJ9poj9eMBhaUlvZhNyUlO5fNGtrcK2WXpeZ+OBCRNW81nYRUVN7E=
X-Gm-Gg: ASbGnctZqV9XYZ8fNXM5veEp4VtfVznWJElxCn5lCxj9gCp8Tsv6P0+tJR130cY0igZ
 QtQ2xHIvms7RUrZF/vSdaCFjxedX1pv4IC0evz4C63faC4EpIO1RsEyPbFUB5gvuxaBWkJg3q9R
 Z49b8HiUkw5BJZFsMgmup7vPZHc6ctZjCdBPhm/hzVcnmhEOm0mvWKjAz28aT36/+1vt5aj+D5M
 dqh7P0cjYoHwIpmPaPBGpnNvvqWX6xphSnq2apkV3xMF+ryrfh2liM3SiMZfNkMz6qTctNreo6y
 7yuv65nL+zt0LziWFwdHYNDuGak/gHijuzDi1l5UEI9qFeGH/e2aGSDN61I64HV+HszqNpvPlEM
 wC06M3NLdXiltiREM4gJTj+Gnx/Gole/qHCHc
X-Google-Smtp-Source: AGHT+IH6nxPw4SGNIKULUDGmYJNLzg0CR+d3wDgQkU66TIShv8ZdQB2lSNRbrUl7wqsrLTx0uzCF8Q==
X-Received: by 2002:a05:600c:c4b7:b0:441:b19c:96fe with SMTP id
 5b1f17b1804b1-452013841d8mr197717025e9.10.1749564650836; 
 Tue, 10 Jun 2025 07:10:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531febf905sm14161215e9.0.2025.06.10.07.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:10:50 -0700 (PDT)
Message-ID: <3d576c19-6f68-4f04-b89a-e269c438b339@linaro.org>
Date: Tue, 10 Jun 2025 16:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 14/17] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-14-ee633e3ddbff@linaro.org>
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
In-Reply-To: <20250610-b4-sm8750-display-v6-14-ee633e3ddbff@linaro.org>
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

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Notable changes in v6:
> Correct fg_alpha shift on new DPU, pointed out by Abel Vesas.

-------------------------------------------------------- Vesa

Not sure this should be in the commit message.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v6:
> 1. Checkpatch: CHECK: Prefer kernel type 'u32' over 'uint32_t'
> 2. Fix for fg_alpha shift (Abel Vesa).
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 23 ++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>   2 files changed, 97 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 92f6c39eee3dc090bd957239e58793e5b0437548..5e986640c8ce5b49d0ce2f91cc47f677a2e3f061 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -320,14 +320,22 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>   }
>   
>   static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> -		struct dpu_plane_state *pstate, const struct msm_format *format)
> +				      struct dpu_plane_state *pstate,
> +				      const struct msm_format *format,
> +				      const struct dpu_mdss_version *mdss_ver)
>   {
>   	struct dpu_hw_mixer *lm = mixer->hw_lm;
>   	u32 blend_op;
> -	u32 fg_alpha, bg_alpha;
> +	u32 fg_alpha, bg_alpha, max_alpha;
>   
> -	fg_alpha = pstate->base.alpha >> 8;
> -	bg_alpha = 0xff - fg_alpha;
> +	if (mdss_ver->core_major_ver < 12) {
> +		max_alpha = 0xff;
> +		fg_alpha = pstate->base.alpha >> 8;
> +	} else {
> +		max_alpha = 0x3ff;
> +		fg_alpha = pstate->base.alpha >> 6;
> +	}
> +	bg_alpha = max_alpha - fg_alpha;
>   
>   	/* default to opaque blending */
>   	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> @@ -337,7 +345,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
>   		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>   			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>   			bg_alpha = fg_alpha;
>   			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
>   				    DPU_BLEND_BG_INV_MOD_ALPHA;
> @@ -348,7 +356,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   		/* coverage blending */
>   		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
>   			DPU_BLEND_BG_ALPHA_FG_PIXEL;
> -		if (fg_alpha != 0xff) {
> +		if (fg_alpha != max_alpha) {
>   			bg_alpha = fg_alpha;
>   			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
>   				    DPU_BLEND_FG_INV_MOD_ALPHA |
> @@ -481,7 +489,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   		/* blend config update */
>   		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> -			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
> +			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
> +						  ctl->mdss_ver);
>   
>   			if (bg_alpha_enable && !format->alpha_enable)
>   				mixer[lm_idx].mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -19,12 +19,20 @@
>   
>   /* These register are offset to mixer base + stage base */
>   #define LM_BLEND0_OP                     0x00
> +
> +/* <v12 DPU with offset to mixer base + stage base */
>   #define LM_BLEND0_CONST_ALPHA            0x04
>   #define LM_FG_COLOR_FILL_COLOR_0         0x08
>   #define LM_FG_COLOR_FILL_COLOR_1         0x0C
>   #define LM_FG_COLOR_FILL_SIZE            0x10
>   #define LM_FG_COLOR_FILL_XY              0x14
>   
> +/* >= v12 DPU */
> +#define LM_BORDER_COLOR_0_V12            0x1c
> +#define LM_BORDER_COLOR_1_V12            0x20
> +
> +/* >= v12 DPU with offset to mixer base + stage base */
> +#define LM_BLEND0_CONST_ALPHA_V12        0x08
>   #define LM_BLEND0_FG_ALPHA               0x04
>   #define LM_BLEND0_BG_ALPHA               0x08
>   
> @@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>   	}
>   }
>   
> +static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
> +					     struct dpu_mdss_color *color,
> +					     u8 border_en)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +
> +	if (border_en) {
> +		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
> +			      (color->color_0 & 0x3ff) |
> +			      ((color->color_1 & 0x3ff) << 16));
> +		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
> +			      (color->color_2 & 0x3ff) |
> +			      ((color->color_3 & 0x3ff) << 16));
> +	}
> +}
> +
>   static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
>   {
>   	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
> @@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
>   	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>   }
>   
> +static void
> +dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
> +						u32 stage, u32 fg_alpha,
> +						u32 bg_alpha, u32 blend_op)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int stage_off;
> +	u32 const_alpha;
> +
> +	if (stage == DPU_STAGE_BASE)
> +		return;
> +
> +	stage_off = _stage_offset(ctx, stage);
> +	if (WARN_ON(stage_off < 0))
> +		return;
> +
> +	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
> +	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
> +	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
> +}
> +
>   static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
>   	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
>   {
> @@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
>   	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
>   }
>   
> +static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
> +				       uint32_t mixer_op_mode)
> +{
> +	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +	int op_mode, stages, stage_off, i;
> +
> +	stages = ctx->cap->sblk->maxblendstages;
> +	if (stages <= 0)
> +		return;
> +
> +	for (i = DPU_STAGE_0; i <= stages; i++) {
> +		stage_off = _stage_offset(ctx, i);
> +		if (WARN_ON(stage_off < 0))
> +			return;
> +
> +		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
> +		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
> +		if (mixer_op_mode & BIT(i))
> +			op_mode |= BIT(30);
> +		else
> +			op_mode &= ~BIT(30);
> +
> +		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
> +	}
> +}
> +
>   /**
>    * dpu_hw_lm_init() - Initializes the mixer hw driver object.
>    * should be called once before accessing every mixer.
> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
>   	c->idx = cfg->id;
>   	c->cap = cfg;
>   	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (mdss_ver->core_major_ver >= 4)
> +	if (mdss_ver->core_major_ver >= 12)
> +		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
> +	else if (mdss_ver->core_major_ver >= 4)
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
>   	else
>   		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
> -	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> -	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	if (mdss_ver->core_major_ver < 12) {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
> +	} else {
> +		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
> +		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
> +	}
>   	c->ops.setup_misr = dpu_hw_lm_setup_misr;
>   	c->ops.collect_misr = dpu_hw_lm_collect_misr;
>   
> 

