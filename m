Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8867FC546
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 21:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C7010E329;
	Tue, 28 Nov 2023 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5ED10E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 20:24:54 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5cd0af4a7d3so61400537b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701203093; x=1701807893; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TSLF7Ad3i79H/glaQ3o9WJ/hGDQy8pGfVG+aH4loN/s=;
 b=W6tPS6tU5zMt36XLT4WgPl6povDPkGSJ74mdCLpCTh5pGlSCvEA7dpfc5srZY8z0bW
 CVR7nNXF107SHwXW+qkkRakUouvYaZ3ct6bnrrkani+U5733bdlJ8m1oy6xuPDMQvJlh
 oLojZRwWi5s3dKb+miBeAr3FFmmgy1CPVrqYck92SnHNakwHJrCLT+qVzL9qv5yrhVgT
 5o8m2T5oYvHQuklJciRV6HXL6GD8vbGxgxVLyGAJdZxB4AOpEVRRtdiqh9NH5b3CF4hj
 4IfmEWiWJTcrzNStBtjjVZdl+dtKPqht/QDBCIyrpzN0NPtY3wCWuDRu41Y3BrXkGiMi
 9Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701203093; x=1701807893;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TSLF7Ad3i79H/glaQ3o9WJ/hGDQy8pGfVG+aH4loN/s=;
 b=bBCKqJwYMF9iGI8r+eD8coJqcgGYkMaj5fMBWY2LRszlieRf6+IpsINBujJuAVIuhR
 acH30F6n4P0LPKunCwU5o9AR2CGDIM7b3AAcv5IxXzmU9Xn6VjM8t1FvavNd5lVuWxrK
 uW04AghKK4p5o1KMCXyjYryIYQ4eSq5r7xCFacpZMbouJlFMfssllIdoMexYZZWqaDhj
 8JenkL6zowFsUM3ZsZlwzSvx1kSXJDTEpOtmzcNTATJwWNUMagYCFL9ktVHBYI2i1y7G
 NPrVfd8xKnDjsU3lgRyUvXoYVJH50I5CfFPEe6+bl95E8xnMJkHy3byKlSd1/Tkpr3Du
 71Aw==
X-Gm-Message-State: AOJu0YziKH4UEB0aIghqfmoK9iC0ZfIVtAyOe+G8kjGLczPucGMMCqUm
 8c3fOTHaUmHIH32Ryfx9CVtxmedRVfhRsydBcpWYaXuN+3SUxzfx
X-Google-Smtp-Source: AGHT+IEjE9OF/yo6DxBMtu+TRHRqrD+boNuuR8j23dQKjHPPl/zDpBoSt2BEETEQWEUnSFsO0rH65ODxy+Smgd4XLu0=
X-Received: by 2002:a0d:dec2:0:b0:5cd:c7a3:6cb3 with SMTP id
 h185-20020a0ddec2000000b005cdc7a36cb3mr16364581ywe.37.1701203093370; Tue, 28
 Nov 2023 12:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20231128011122.14711-1-quic_parellan@quicinc.com>
 <CAA8EJpprP7mQLm47d07AtNRjLtpQCSAw5PuXjwGXNO2rXVUPZw@mail.gmail.com>
 <cf850520-0906-0291-fd21-be8cd687bcde@quicinc.com>
In-Reply-To: <cf850520-0906-0291-fd21-be8cd687bcde@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 22:24:42 +0200
Message-ID: <CAA8EJpqj5nPPxK=AzS=owURRZEgO3zdQZEMcJ8XjHOJfQrUEwg@mail.gmail.com>
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

On Tue, 28 Nov 2023 at 19:43, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 11/27/2023 5:48 PM, Dmitry Baryshkov wrote:
> > On Tue, 28 Nov 2023 at 03:12, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> >> state when the frame_done_timer timeouts.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++--
> >>   1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 1cf7ff6caff4..5cf7594feb5a 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -191,6 +191,7 @@ struct dpu_encoder_virt {
> >>          void *crtc_frame_event_cb_data;
> >>
> >>          atomic_t frame_done_timeout_ms;
> >> +       atomic_t frame_done_timeout_cnt;
> >>          struct timer_list frame_done_timer;
> >>
> >>          struct msm_display_info disp_info;
> >> @@ -1204,6 +1205,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
> >>
> >>          dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> >>
> >> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> >> +
> >>          if (disp_info->intf_type == INTF_DP)
> >>                  dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
> >>          else if (disp_info->intf_type == INTF_DSI)
> >> @@ -2115,11 +2118,12 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
> >>          for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> >>                  struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >>
> >> -               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    ",
> >> +               seq_printf(s, "intf:%d  wb:%d  vsync:%8d     underrun:%8d    frame_done_cnt:%d",
> >>                                  phys->hw_intf ? phys->hw_intf->idx - INTF_0 : -1,
> >>                                  phys->hw_wb ? phys->hw_wb->idx - WB_0 : -1,
> >>                                  atomic_read(&phys->vsync_cnt),
> >> -                               atomic_read(&phys->underrun_cnt));
> >> +                               atomic_read(&phys->underrun_cnt),
> >> +                               atomic_read(&dpu_enc->frame_done_timeout_cnt));
> >>
> >>                  seq_printf(s, "mode: %s\n", dpu_encoder_helper_get_intf_type(phys->intf_mode));
> >>          }
> >> @@ -2341,6 +2345,10 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
> >>
> >>          DPU_ERROR_ENC(dpu_enc, "frame done timeout\n");
> >>
> >> +       atomic_inc(&dpu_enc->frame_done_timeout_cnt);
> >> +       if (atomic_read(&dpu_enc->frame_done_timeout_cnt) == 1)
> >> +               msm_disp_snapshot_state(drm_enc->dev);
> > atomic_inc_and_test(), please
>
> Hi Dmitry,
>
> We only want to create a snapshot for the first instance in which the
> timer timeouts. atomic_int_and_test() increments the value and then
> returns whether it has a value of zero or not. FWIW I think I should
> change it to 'atomic_add_return(1, &dpu_enc->frame_done_timeout_cnt)' so
> that we can check only when this value equals one.

Works for me too.

I suggested atomic_inc_test() because then we can let devcoredump take
care of duplicate events.

>
> Thank you,
>
> Paloma
>
> >
> >> +
> >>          event = DPU_ENCODER_FRAME_EVENT_ERROR;
> >>          trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
> >>          dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
> >> @@ -2392,6 +2400,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >>                  goto fail;
> >>
> >>          atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
> >> +       atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
> >>          timer_setup(&dpu_enc->frame_done_timer,
> >>                          dpu_encoder_frame_done_timeout, 0);
> >>
> >> --
> >> 2.41.0
> >>
> >



-- 
With best wishes
Dmitry
