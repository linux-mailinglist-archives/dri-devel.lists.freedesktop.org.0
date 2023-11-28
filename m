Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198667FAFC2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 02:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A4310E0A9;
	Tue, 28 Nov 2023 01:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D910E037
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 01:48:22 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5cdc0b3526eso31752217b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701136101; x=1701740901; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7vxz+tHNBNWZVc8EcJHObY+dUX9GxZl9+4l9Gmig2ak=;
 b=Hs2yLQFtT+4hHe86DiQni3olJE5kh9uH6yIZuGkCcEjKXmy6KuY+DggP8Fp0gNJI3J
 ykfsDl/k9sam8o16bWG5CVQT1nVGue3HJhB5nB4n0FzVyDJ0EqICHraSUGMvQwi+nvfh
 rOpWnScsHemGxxXVzWaK3GMtZCGB3ey8/IA2pc7sN+x8j2la4WEDZIHLuSn2Bv8EPyeK
 9Cah47Ol++LMN0Wxie87kPkeuou1kBgbdv2GhUZu2W9J44cfHkT1UlU8tkkd02QkEqLh
 +gZQgYXELWK63nCEIkW+D9vlIpmQazytPHlKBMdkBAdi1FkSAzPNs0yU0xtQxT3b7Iiy
 l+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701136101; x=1701740901;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vxz+tHNBNWZVc8EcJHObY+dUX9GxZl9+4l9Gmig2ak=;
 b=WuZmZe+xLg9eriHfRDPCaKh+JkcmvSMib+O6CP23BWO9gL5y/RUu1vgG57UcgZrrJB
 SOIjRenZ4ErjGc4CUNL/d3wwrhmDtxc8R3c2jP1dRvkh06LBCoNSJxGDgqJjj1utGQoV
 lI4q98WZ+fL3CdNnmqscBTqgObnZmmKMY5v7bcAo4GEPSjlveEBPgHObqgz06y6E8Qhc
 CzZaSNTt/QCY9/wj+BZxdUma0tJ7WIcPrA0eLc4t/wedtDs8pLWt1oqmkMVKUS9M8Z9D
 4OZ86b5dMsCPcTDXRhqnFEQrAB9LGDUUTyRJDdJwLlR6BqNdox7hPkMWRKv9GumzcK7F
 HACQ==
X-Gm-Message-State: AOJu0Yw3H/LikTZdttPctxAoGRGP43ls+6SW2GgHVUjuD2VWABRVSVhX
 PUF5X/R4iIvDJOYtB2DC5fzl80swxbevikPrgfAkGA==
X-Google-Smtp-Source: AGHT+IGYQElil91O5cH+HFnOPnDGOe0frEhW3uvtQCLF5IPu3HSvzwR/Wc1fbGURrXChA9Dz45L784GG2VN/D75eRF4=
X-Received: by 2002:a81:6c82:0:b0:5cc:9ef4:b01d with SMTP id
 h124-20020a816c82000000b005cc9ef4b01dmr14954961ywc.21.1701136101408; Mon, 27
 Nov 2023 17:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20231128011122.14711-1-quic_parellan@quicinc.com>
In-Reply-To: <20231128011122.14711-1-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 03:48:10 +0200
Message-ID: <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Capture dpu snapshot when frame_done_timer
 timeouts
To: Paloma Arellano <quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 03:12, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1cf7ff6caff4..5cf7594feb5a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -191,6 +191,7 @@ struct dpu_encoder_virt {
>         void *crtc_frame_event_cb_data;
>
>         atomic_t frame_done_timeout_ms;
> +       atomic_t frame_done_timeout_cnt;
>         struct timer_list frame_done_timer;
>
>         struct msm_display_info disp_info;
> @@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
>
> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> +
>         if (disp_info->intf_type == INTF_DP)
>                 dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
>         else if (disp_info->intf_type == INTF_DSI)
> @@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
>         for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>                 struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>
> -               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
> +               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
>                                 phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
>                                 phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
>                                 atomic_read(&phys->vsync_cnt),
> -                               atomic_read(&phys->underrun_cnt));
> +                               atomic_read(&phys->underrun_cnt),
> +                               atomic_read(&dpu_enc->frame_done_timeout_cnt));
>
>                 seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
>         }
> @@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>
>         DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
>
> +       atomic_inc(&dpu_enc->frame_done_timeout_cnt);
> +       if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
> +               msm_disp_snapshot_state(drm_enc->dev);

atomic_inc_and_test(), please

> +
>         event = DPU_ENCODER_FRAME_EVENT_ERROR;
>         trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
>         dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> @@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>                 goto fail;
>
>         atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
>         timer_setup(&dpu_enc->frame_done_timer,
>                         dpu_encoder_frame_done_timeout, 0);
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
