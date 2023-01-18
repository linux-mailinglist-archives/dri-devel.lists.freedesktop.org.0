Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE196710FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C799010E64C;
	Wed, 18 Jan 2023 02:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F0510E643
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:16:30 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-4bf16baa865so448563547b3.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WTelNd/87R5jSKpjxuTjQoM4TcDwXgDtZiccb4mI7os=;
 b=BeO1vd+nYNzaTVGL4K1aGbH1qHT/ypHg3FWdn5k/n535Ir1E6oVs1Qpusnqd1NEyl7
 qG6Iln1cIx7bzclj1mek4Tl+hQ3NYOIJLcc9K4rh8sorZnze9HVroRa9+MR8HM6VKqtv
 f/uCGQ2d5WcxHKix3eRqpGIFEVmIf69EBnMGSK4OcYtTAwvGjsN5UN7xAKpQE+n6v6Eu
 P88jEBhQFe+W2Rh8LA3P+zTdv0nf2hnx0NZlaXfj1B9RcBm9KlUsDk2o2z28fq7WYjR2
 soXM8iCiS0H7WGVpTlXuYKtOwYfSfT5C5jgFwBdEoDCk3dkPW7Xi0RhltF1ZENW9s3Qz
 wS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTelNd/87R5jSKpjxuTjQoM4TcDwXgDtZiccb4mI7os=;
 b=fiMp68wigDa0tfVcJwGLpMCVcLJF/4ENnpJOv/D//HP7XRSpWelnyOUxlSAIweFwdl
 I1SmiuwKDS8v/sA6q7K7Ety92c4c7K32Kcyo5kAy9VwSjoFL+pvA/BAwVdAwViVgsB6x
 Zv3LySQTCNB6xQwchomWaHdxZBURc6oNP8A5qZoaUNT35p6rzL7OVIwP10/l/ZAlpkY5
 N5ErkIXEwsyVuZDjexJlSt+vnZcCGYwTNN0yI5a9T2K+IgrzohDUXaaZSdonGKfrFPGg
 Pypp+PRxiLeanBLfSl2EdWQGip389XLeoz0NZas4rXxQjbwjNdeW1mqxn4KJimCZ4JWw
 VOuA==
X-Gm-Message-State: AFqh2krIM7gji6TR3RjWuQAW/570vpVFJ9x05ib++jd6m4L+qy70pAjl
 RnnsUv+4TWJCaDb7qzPfwue2jQGRjbt3a1FVG0o4xQ==
X-Google-Smtp-Source: AMrXdXsYNRgRsxLE4EskwQVMnKYVOCMhOKZaffiRjaF9y3tc78QjF1fxjwYPtPDXH1tdRSj/CdFg61Yg1LHRgs+zW0w=
X-Received: by 2002:a0d:fd07:0:b0:3d6:2151:4038 with SMTP id
 n7-20020a0dfd07000000b003d621514038mr627610ywf.418.1674008189782; Tue, 17 Jan
 2023 18:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20230118021441.161-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20230118021441.161-1-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:16:18 +0200
Message-ID: <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Reapply CTM if modeset is needed
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Jan 2023 at 04:14, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Add a !drm_atomic_crtc_needs_modeset() check to
> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied after a
> suspend/resume.

.. or if the LM/DSPP blocks were reallocated by resource allocation
during the modeset.

>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..aa120a230222 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>         int i;
>
>
> -       if (!state->color_mgmt_changed)
> +       if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
>                 return;
>
>         for (i = 0; i < cstate->num_mixers; i++) {
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
