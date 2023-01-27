Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8091B67E220
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914E710E44C;
	Fri, 27 Jan 2023 10:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C17610E44C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:46:07 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id d8so3525243ybe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yEIvFhK3IIlErsVgToB5qFHQjVAAQfk7keFlobxxWmQ=;
 b=pbRiHizXgqKLgJi0SZFHnlopsAQ2dHzA++kqIfzVt60x7aFpDvVIK8jIuZ/e+bHQIr
 TsToNjrN77cQxH7RuLXAD01snstWf+mgyrY4tQ+Yji1eFenSGboymtMKPOgqLeX2HPBA
 1J8WDoPq0J9kfaNBUn0mNnj5oODs+1OdTCAnIFbpUROdGOnaAF7b1mqF4EjjgSk8FnX9
 3xe/ZNyWEnkMxPqOzBgDEu8sO/y+g0aQhoshBqQ1MuRJFoXw/rZahh+ggq0dorOvjrCo
 gKEskc21+60VDKHdlqowmvelAntxyM6fffX/JEcdB6p1UQFrNg43bvsgBe+So4DTpzyV
 v1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEIvFhK3IIlErsVgToB5qFHQjVAAQfk7keFlobxxWmQ=;
 b=SsFrDD6bfguDhQppPt8HiJaB0i+QQa6zciAZB1yyqK5aDWfFwYZW8NqgzJAEIlrA4n
 HuSn2Q6KDaS22h2gX0KzjLDihRO8Z0l9rKChCKXeeDjfAtECLGkVEZOL56+6GrYpGEkB
 FKVJ/pSo8gbW3L4wAqnk6TPbNbAulahpUr33I4XktSAnMXKOQyVEq50YqXarzB7rv1t7
 rvLHUg1J9knAGOb1fe1BxtnB/TXngHKiJ1p/thCT/R4058g9O11WOtIemuBlf1MkPNTP
 FCKiyyBOw3Hmh05exZxTGMCVspCA0fBVfnRlcbkZOnWN+qh3BKdp8xpgqhVvkf5eElbZ
 BZrA==
X-Gm-Message-State: AO0yUKVwGklP+sNSoOK7vmuKzgHMB/156fGQeexPwFa6iDXWFSG9SfQt
 3CdppxOfJNPAP2U+eFn9Bhnw7RftAEO+KukrvchmvA==
X-Google-Smtp-Source: AK7set8CEjnHi7EVPneHsLI4xDP7Wr4mxQeL1iOel0vamGF0k7QBKC5yCvd7idAVuR1tV91uJqvlYEJIbDj6l19NjRo=
X-Received: by 2002:a25:d84f:0:b0:80e:9132:a7fe with SMTP id
 p76-20020a25d84f000000b0080e9132a7femr88574ybg.516.1674816366185; Fri, 27 Jan
 2023 02:46:06 -0800 (PST)
MIME-Version: 1.0
References: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com>
 <1674814545-9453-3-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1674814545-9453-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Jan 2023 12:45:55 +0200
Message-ID: <CAA8EJprX-8fcoi3FBR7ZUOa2ehhCGEAngq2+UDdC64hHMraqfA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/disp/dpu1: add dspps into reservation if
 there is a ctm request
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, marijn.suijten@somainline.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 at 12:15, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Add dspp blocks into the topology for reservation, if there is a ctm
> request for that composition.

... rather than just allocating them for DSI encoders.

With this fixed (and one nit below):

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..8d76cb3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>  static struct msm_display_topology dpu_encoder_get_topology(
>                         struct dpu_encoder_virt *dpu_enc,
>                         struct dpu_kms *dpu_kms,
> -                       struct drm_display_mode *mode)
> +                       struct drm_display_mode *mode,
> +                       struct drm_crtc_state *crtc_state)
>  {
>         struct msm_display_topology topology = {0};
>         int i, intf_count = 0;
> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>         else
>                 topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>
> -       if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -               if (dpu_kms->catalog->dspp &&
> -                       (dpu_kms->catalog->dspp_count >= topology.num_lm))
> -                       topology.num_dspp = topology.num_lm;
> -       }
> +       if (dpu_kms->catalog->dspp && crtc_state->ctm &&

Could you please move the second condition to a separate line? Also
possibly it would be good to indent the conditions to the opening
parenthesis.

> +               (dpu_kms->catalog->dspp_count >= topology.num_lm))
> +               topology.num_dspp = topology.num_lm;
>
>         topology.num_enc = 0;
>         topology.num_intf = intf_count;
> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>                 }
>         }
>
> -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>
>         /* Reserve dynamic resources now. */
>         if (!ret) {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
