Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B847AEA42
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9422610E39A;
	Tue, 26 Sep 2023 10:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F02010E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:22:15 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59bf1dde73fso106822257b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695723734; x=1696328534; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a98I+/enWVs0BEjUps7tbFx8/Tj78e5XZIx5A8fkfhE=;
 b=Sibc/bqUS3AWLdefV57rcyC285iY9lZiAVOI9Ha54jKDTL5eYo9EXIL+OLU81vOAcs
 ANNnW7Alg59c8SwF7RB7fql8I5693Hprz59kAQ0QryO1xXalN/JV6bB9JzsC8EtygKHM
 +d15qbkaEkjxN+AuTz8dH7HXq49qvFsVEB4/2qzAOgeMWxkxcTCY6hXcoHrBXebHCgBz
 6/HjunhnxPhjNirSxc5kVweJliPl6YplP0WrCxUHGPtYVFINgPQU44iSUf2vP0q2kk50
 428FOty/MGvW9WjYBV3GcrLI3M0lflK0gypTIogRJZGiioyypcyJktDCgsAZ/WbZs12B
 2XLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695723734; x=1696328534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a98I+/enWVs0BEjUps7tbFx8/Tj78e5XZIx5A8fkfhE=;
 b=gyYVVeJXrLJFfN036sYpPt8+xcSErFVtWIBiH7LcZzwF4XymabvzdgtTwqTDy9LxJU
 S7MX3ioMRRIOgR2AUX00cxw1KeE4tqnp9nvCOj+UROLY9jGBDoeIpa4MvVaqwBTGSvfW
 AaZpwU2dDNMCRosQ0DbEzgMEoSSvUHGuCPs3uwTqh1Xkq+qlhGCme7lhbqy5SqKSwPZJ
 w5Ud07RBpabEWhD3mdT0JjZ9BIpluCSoOtNUL0Qru/rECFkVqNU3XSUj3K8rv8Nstnjd
 gczssRQez4uGpIuJ25EkA2KHwg1kjehgPC4ZbTfOtoMqxXickjJ0WZzDJ8kv94S4OKT7
 VLhQ==
X-Gm-Message-State: AOJu0Yx6wPq2RnLaNfqYenQ2/PWL6v8QJOcBnckyhw76u0uk0B+CbY+m
 vL/+kFZL2CGOzZ+8hSPOyrB6zfAarlHCK9D/1YpQM2KuwsKIUkVeKKbJ6A==
X-Google-Smtp-Source: AGHT+IGmLuat8sSPGzk/B0CHDauKNfvhdOvdCcSe26K4vrmzaiM9ls0m20+5wDgFIeDnTqlnb5On9IWTdPLMoG6LBvQ=
X-Received: by 2002:a0d:d046:0:b0:586:c27c:3eee with SMTP id
 s67-20020a0dd046000000b00586c27c3eeemr10831532ywd.38.1695723734453; Tue, 26
 Sep 2023 03:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Sep 2023 13:21:08 +0300
Message-ID: <CAA8EJppsY059KXaw6fh2Rdyuh210ibMa_MwsPz-mxivK3QE=Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fail dpu_plane_atomic_check() based
 on mdp clk limits
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_parellan@quicinc.com, nespera@igalia.com,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sept 2023 at 01:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently, dpu_plane_atomic_check() does not check whether the
> plane can process the image without exceeding the per chipset
> limits for MDP clock. This leads to underflow issues because the
> SSPP is not able to complete the processing for the data rate of
> the display.
>
> Fail the dpu_plane_atomic_check() if the SSPP cannot process the
> image without exceeding the MDP clock limits.
>
> changes in v2:
>         - use crtc_state's adjusted_mode instead of mode
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 98c1b22e9bca..0be195f9149c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -733,9 +733,11 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 struct dpu_sw_pipe *pipe,
>                 struct dpu_sw_pipe_cfg *pipe_cfg,
> -               const struct dpu_format *fmt)
> +               const struct dpu_format *fmt,
> +               const struct drm_display_mode *mode)
>  {
>         uint32_t min_src_size;
> +       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>
>         min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>
> @@ -774,6 +776,12 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 return -EINVAL;
>         }
>
> +       /* max clk check */
> +       if (_dpu_plane_calc_clk(mode, pipe_cfg) > kms->perf.max_core_clk_rate) {
> +               DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk limits\n");
> +               return -E2BIG;
> +       }
> +
>         return 0;
>  }
>
> @@ -899,12 +907,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>         }
>
> -       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
> +       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
>         if (ret)
>                 return ret;
>
>         if (r_pipe->sspp) {
> -               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
> +               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> +                                                 &crtc_state->adjusted_mode);
>                 if (ret)
>                         return ret;
>         }
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
