Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC07992D6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 01:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556FD10E216;
	Fri,  8 Sep 2023 23:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1288310E216
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 23:30:18 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso2300370276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694215817; x=1694820617; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PY75H1jflFjdwbxljuQ1fV6R6iCKvsQ0y9zdUNKFhfE=;
 b=tzhzux5QpRse9Q13q9YGwZewV9UqYnjBa8sapVd3S3eKJ0YfIRgScU709gzZgzVfbA
 EKFnSfI7QfQs8gMR9HPPoa7hyW5KjcvMBrMiY5Z36wAdBCaEyI4KeFbilfPtaXAmIlwf
 aJT50/QjD3VQ74yLLsz5/oKxhnVG1Gxy1J2jMwGadLj6RmrhNu22Ffv87sHCTylislvD
 KDzi9DIIpiR+a+J/Pk56RXCyhMUaCycJQJYatM64I7LymjJQOJlyYXM/M2M3fEebs6Xq
 jvKGQS9IIm4jxsKF7p1W2vRotZ2/Iq7beEbfOG2zvLH43W9DOdRLsPamKYap45UIYfF6
 rk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694215817; x=1694820617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PY75H1jflFjdwbxljuQ1fV6R6iCKvsQ0y9zdUNKFhfE=;
 b=janN/0tRYzD0Dx+0nsHhB19ji3G7h2bbpxNu0K0lwbRcA/iGxVbPUxCRtzfJScdMKW
 xeGWYQLRN4Zz845gNiiOgqqXp48N86gioghwvr7ubVUzae8bY2kVQjvd1RoC0ZtLMkW+
 3Pq/55UGtUVs1iwmCWgnw/1zKejON1w0IsKOgdpLFcVbut/m3az5mIOcsWkMQrLtbo0X
 wnHHocH/xVBGOtiSlcxYy/zTFzgYTHXm8c11yxlfogNeXHhe9WTqGO2dR+wpy7f9PfRg
 VBXqm9wrSUWut4YQ/0Pi3etX+2MC0//njLGu78WqLOjKCeAg/Q3+CPP9V+qOmSnfOJrR
 uzJw==
X-Gm-Message-State: AOJu0Yy6YfYbRIS9tE3Y39SyRaM4/V7jqpMdL4clcdx5170Bt+fWxvS+
 +tqh4l3D8KSyv0Clyq17mV1kYC5n3JCGm/8idu1naw==
X-Google-Smtp-Source: AGHT+IFf/w3Ll2Vi98yCb/MLhf+vlwG+jwysyimZL9ykydnejFlmX6x8jbG6nmN39VVCN6dQagU++csT2yUv+wExVNk=
X-Received: by 2002:a25:d050:0:b0:d78:2967:93ea with SMTP id
 h77-20020a25d050000000b00d78296793eamr3687368ybg.1.1694215817318; Fri, 08 Sep
 2023 16:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230908185427.29026-1-quic_abhinavk@quicinc.com>
 <20230908185427.29026-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230908185427.29026-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Sep 2023 02:30:05 +0300
Message-ID: <CAA8EJppj+JTA8iZ6+Ui8JkD-kP54YKObRDK2_Oh+Wpn4XjU-4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: try multirect based on mdp clock limits
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Sept 2023 at 21:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> It's certainly possible that for large resolutions a single DPU SSPP
> cannot process the image without exceeding the MDP clock limits but
> it can still process it in multirect mode because the source rectangles
> will get divided and can fall within the MDP clock limits.
>
> If the SSPP cannot process the image even in multirect mode, then it
> will be rejected in dpu_plane_atomic_check_pipe().
>
> Hence try using multirect for resolutions which cannot be processed
> by a single SSPP without exceeding the MDP clock limits.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 62dd9f9b4dce..85072328cd53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -792,6 +792,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                                                                                  plane);
>         int ret = 0, min_scale;
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
> +       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>         struct dpu_sw_pipe *pipe = &pstate->pipe;
>         struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> @@ -860,7 +861,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>
>         max_linewidth = pdpu->catalog->caps->max_linewidth;
>
> -       if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> +       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> +            _dpu_plane_calc_clk(&crtc_state->mode, pipe_cfg) > kms->perf.max_core_clk_rate) {

First, I think this should be an adjusted_mode too. And this probably
needs some more attention in the next few lines of code, since .e.g
the UBWC case also needs to be adjusted.

>                 /*
>                  * In parallel multirect case only the half of the usual width
>                  * is supported for tiled formats. If we are here, we know that
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
