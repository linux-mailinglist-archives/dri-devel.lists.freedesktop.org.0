Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DC7992A5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 01:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D870710E002;
	Fri,  8 Sep 2023 23:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFAC10E002
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 23:06:49 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d8032efa2bfso1307314276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 16:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694214408; x=1694819208; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=86RlDu4KqfPGl13CQGEE6BLG6WN5cGi5lzDtXCFU4ls=;
 b=qPF6xyiEVjSN9nL0Mzepi9hdcDvTrzOZrlEBvdWMKOiyA4Vh0pn++6aBHZelF0iSpr
 jUYecmEADBGhCR6jVKc+9uWKz46YhjkDU3B8JO6ooOvBWMOxoC+UNxZwsnmFoY7tNhFm
 mu4rrGkvS0hMomPpXejIlPI57TEF/wAQqvpZHcbQpbK/7Y6LP7XtIL3LSMaE2dQjygVr
 p0UE7WpStNwTGoimVL0OgAmNlr5H/TjB1wQQgXtTzuAC1aS7Dde6QPo77Vfw6PM+Zv2K
 8ydgjsn+IPlWMo6ojgYnGhOjkuHtxktuz3ShME+OF46OAV4CSTKfPYVOs/mQA4IMocRi
 ZebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694214408; x=1694819208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=86RlDu4KqfPGl13CQGEE6BLG6WN5cGi5lzDtXCFU4ls=;
 b=HK8ncAaLXxnPkQgw/QrqRZQ46TeGlTGS/dv2g6+NRzolABCpLa6CXjbsBegDkViZnE
 VP5hNOt/3szedEhSuQryUR1PVHLeMLK3IvBeCdzL95Pqw7p4RRAEBiepwJLKbBetj4bV
 VLcpenxYcthY8IGfIWU4D0pXrSJJiAmzV3qTdcgro6tG/1jkth7eO2uW840PfPBrxAA+
 mut6Wc6H1I5xg220SEHDXHqeC85ZbnmTktQML4vAxlXiIU/tlP78ojXtkbSghP/kLdZH
 p+A0s+nuAKoDVLWnhDRSBIw/Lmyw298JcJC6UhpXLpIe2fz08rG1B4dqx5jiGKCqsQ5U
 yJLg==
X-Gm-Message-State: AOJu0YzV+lZcJPIml5fHnjJinw5/SCRuk+4MeExlCul8E/1cKYqd9oA3
 7bNbQAGEvMZiXhtGvm0Bg4EdpvpUu/WKt5Vp/zaemA==
X-Google-Smtp-Source: AGHT+IFGUWQMquiV1p5Biddee7eFZ8X4Ye5n5mZrkJXgfPJ2Z7XVNhyb5TswwcnVancJAh6r2Fz3DqTPsR37P4YgODY=
X-Received: by 2002:a25:73c1:0:b0:d78:477e:442d with SMTP id
 o184-20020a2573c1000000b00d78477e442dmr5044363ybc.8.1694214407734; Fri, 08
 Sep 2023 16:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230908185427.29026-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20230908185427.29026-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Sep 2023 02:06:36 +0300
Message-ID: <CAA8EJprD4nJ=wGZ3XUoxAXi0ybPsGPUOg22FwXVg+dzAmJ8v1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fail dpu_plane_atomic_check() based on
 mdp clk limits
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
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 nespera@igalia.com, quic_parellan@quicinc.com,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Sept 2023 at 21:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
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
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 98c1b22e9bca..62dd9f9b4dce 100644
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
> +       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->mode);
>         if (ret)
>                 return ret;
>
>         if (r_pipe->sspp) {
> -               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt);
> +               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> +                                                 &crtc_state->mode);

I think this should be adjusted_mode. In the end, according to the
docs CRTC should be programmed with the adjusted_mode, while the
state->mode is the mode at the end of the pipeline (if I got it
correct).

So e.g. if we add DS to the picture, state->mode will be screen
resolution, while adjusted_moe will be pre-scale resolution, which is
the one that matters from the bandwidth point of view.


-- 
With best wishes
Dmitry
