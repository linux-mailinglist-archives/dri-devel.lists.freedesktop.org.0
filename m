Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB45AC1D5C
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0441610E718;
	Fri, 23 May 2025 06:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SJAw59Js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5F610E739
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:55:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a37ed01aa0so2608501f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747983303; x=1748588103; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=69oCtQFtFuIhATn7nt7tT3JoQ8RLcM/FthzOv16zp9Y=;
 b=SJAw59Js/pyX7HoEnzYutwPxfJEUx1R7mve6r/JgyDMibKc6ENjVW34OwEJhvCJqut
 +IvGpvaW7EEEQJnx0h/0MiS9HzALnNNxpgViKz7NhBmOwrI0NyNO+8g92N61kySHXAhq
 65heOCVXqYCVm2xY71/LK478rayNKaVeRpg4vyRWwY5v1x5V7lONNlR3WB0a3qkprxwe
 mkQgm4ENi61NDl+ik+mKlNd7HYcAs+1kFoOacQi0LolTwcT2yjucAU13qtMvueBpKV71
 RJGV/NO0KBggj8eb1ZG4VVh0o2UcbAlPyXlQJsmjEtmkjXa1gI4pBzHTlbpj3Hf3gAZV
 uXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747983303; x=1748588103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69oCtQFtFuIhATn7nt7tT3JoQ8RLcM/FthzOv16zp9Y=;
 b=LJgPtGYCYXjgIZny1U7RG7+rd8nA1r0UXMgQsHdDvpt8OkB/vl5uBoBSp0BbGyNRWj
 /fflJd0Q31L/2ygZU1FR6ovCmoDkIuNNtDqCm36xU2ofTR/++aMsHS3BmbjYbI0Dpizu
 8wtBJuUykH/qmWNu59RjVwNs/fWRfDeGaPgfXMRtF8AlWiWWceJb6lbIuukMOwmjCdZi
 zMb5pa/Hw6aaojTpW4tUw9clcNbDmA4ealh3DDT/O49L1Vl88U5zk6EzOkemh3SR08qj
 vBM+EqKHZKxSAKaYOQBeW6i5V+2i9ObjC7z8IGJ9wly6yjschdP5W6rfBcOJg7Skbck3
 j7qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZOMOVR8oz27u3VogGsxsjIjOmrmCMuhdYgjRgfGHiP5yNiZBp57fF0KebfiHE3turIuZfgo08sL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS1NRslLvc+Kies2ovHWSpDaQWZFwfMfGq/6UqGYlrlFBlTFmh
 GRHBySwYUcicq1WOFD0NRiYjE8Nc4hdrbfljAHNgi8RPUOPTdVzQZ/8GscnJOqk7Bfs=
X-Gm-Gg: ASbGncsSYn6zWK5GVLS7ArJkGxIGoOckQEYb1rAKV9g2CASkB8waG6mULfuGx5+ul9J
 B5npb06YqO1XZrlhMfm5XlFjPxWAWquHJczunCd3vhKq+2VxUWzTR+CqiAj/4ztngFU+CbQetrT
 PhkfAS1BT4j6ujAKuM7KGPXQHtXY7DbvjC/0jfyKWJv5NMd+FBl3PmyY2a2pGL8qcLdPNBuubGe
 KoeTkxTjab0hRjovnG/1wfAOKkqJf5k7w19oOPEAlZTaTgHk1fhTwrQ2fYfWZbQ2rHhFY6FMzUK
 itqfcv6u59/XlhJYP9PbGa9U+CSx1yAHjoIc3oOjIxrBtC8p
X-Google-Smtp-Source: AGHT+IH75aOsRJMnyheDQH5VfJc94Xc0jentcmMf8E7Zp2ROIEwHjqRlngeR8WzATqUqYD8xScblVw==
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8d5 with SMTP id
 ffacd0b85a97d-3a36e62d9afmr15906729f8f.58.1747983303480; 
 Thu, 22 May 2025 23:55:03 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88941sm25904629f8f.61.2025.05.22.23.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 23:55:02 -0700 (PDT)
Date: Fri, 23 May 2025 09:55:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <aDAbxAnCN1lGGcGH@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
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

On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>  }
>  
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> -		struct dpu_plane_state *pstate, const struct msm_format *format)
> +				      struct dpu_plane_state *pstate,
> +				      const struct msm_format *format,
> +				      const struct dpu_mdss_version *mdss_ver)
>  {
>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>  	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	uint32_t fg_alpha, bg_alpha, max_alpha;
>  
>  	fg_alpha = pstate->base.alpha >> 8;

For the 10-bit alpha, you need to shift here by 5 instead of 8.
