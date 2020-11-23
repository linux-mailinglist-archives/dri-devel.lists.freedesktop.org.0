Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A882C1952
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 00:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036C6E118;
	Mon, 23 Nov 2020 23:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CAD6E118;
 Mon, 23 Nov 2020 23:18:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so895306wmg.3;
 Mon, 23 Nov 2020 15:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nj+gdTH1StHuONWnTSTyqwU/3oIYDEHaKWBrfK50CQA=;
 b=hP1StnKqpISni3iYelCRXg4UuZ+DrTjSYEs2bKb91lI7/LrJtOp+gaKC9NPGLGuhy4
 JUic4G2gogQszL1j8P/ea5bdXK/03RIg/mAde9/9qewvsLJTYpk8VnR3gc3xj28TtP1n
 e8eQEobTa1QpfsFkdJ3H8cp8Lw2Xhjo7IO2PSCympH4es68QbYgMvuNWMXx5Is7PTZA+
 8b6Y6IZTKWenvbYLm453/gviARCub4dwabSjN997hLWdcbDHc4Sal/h/tJ290Bu89I2E
 ziJG78lXAn6iDgmZS+d+b9OebmPyDV1k2/0xtBE0//U0eoC7cE/R4OoaHwdPRKIqFH1+
 UKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nj+gdTH1StHuONWnTSTyqwU/3oIYDEHaKWBrfK50CQA=;
 b=FPXiSzkI8cx8m/5CUDde79qhKY9Q1Qn8gMg1ZQdS4/5L6UnDpkrvynXfOu+oRl66HP
 j1Ge2iLB4WqetyavnS90qB5nFlUVOdB3cJsHd3G4N2WEGH+C957vDWH7N1zFQo9c0zVk
 8O8lU7KgwoZwxPdLGUD+iErO+7Z2zGXwSdbEAHEDo0CUmw7woLCmuSXqK4ppSBr8/HeE
 L9QuVJYcADMb/y0NJhebe54AIYc43uiSi+5WcIZNfrp+FsYqINr0qfFxP4qxhtnUk/tZ
 c4cr2OWzlBdnA2Ni9jlGpuDjApfa5aVtPbfZE5cGTBmlXoJiKw0vG/ZYgxMqKa+2p77S
 Xbjg==
X-Gm-Message-State: AOAM531GkbBRaZCQyhCxxgdRC18+TFt3VEctHbf+IPj6IqdvTuk1O87h
 cmeNXRDeX9IQaLz0ZDRgLSZTRVGJFLjFEHlpR4E=
X-Google-Smtp-Source: ABdhPJxbZx0kgnIaAnh7hLDsIUyOulsD+MqY+/sCRXSQRcguNLyZRSv25aU8ixwKqNHa0Tn7qKLMqza4GKhJ5RHw2jc=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr1168542wmi.164.1606173520987; 
 Mon, 23 Nov 2020 15:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20201119214145.10182-1-abhinavk@codeaurora.org>
In-Reply-To: <20201119214145.10182-1-abhinavk@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Nov 2020 15:18:29 -0800
Message-ID: <CAF6AEGsWVKCAE3CetZagbvRNZAU00FaoWSvaDxxOafNRY5dz1g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: update the qos remap only if the client type
 changes
To: Abhinav Kumar <abhinavk@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 1:41 PM Abhinav Kumar <abhinavk@codeaurora.org> wrote:
>
> Update the qos remap only if the client type changes for the plane.
> This will avoid unnecessary register programming and also avoid log
> spam from the dpu_vbif_set_qos_remap() function.
>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 12 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  5 +++++
>  5 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d4662e8184cc..3867da47c683 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1037,6 +1037,23 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>         return rc;
>  }
>
> +void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc)
> +{
> +       struct drm_plane *plane;
> +       struct drm_plane_state *state;
> +       struct dpu_plane_state *pstate;
> +
> +       drm_atomic_crtc_for_each_plane(plane, crtc) {
> +               state = plane->state;
> +               if (!state)
> +                       continue;
> +
> +               pstate = to_dpu_plane_state(state);
> +
> +               pstate->dirty |= DPU_PLANE_DIRTY_QOS;
> +       }
> +}
> +
>  int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  {
>         struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index cec3474340e8..8ba11de605bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -231,6 +231,13 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
>   */
>  int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
>
> +/**
> + * dpu_crtc_set_qos_dirty - update plane dirty flag to include
> + * QoS reprogramming
> + * @crtc: Pointer to drm crtc structure
> + */
> +void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc);
> +
>  /**
>   * dpu_crtc_vblank_callback - called on vblank irq, issues completion events
>   * @crtc: Pointer to drm crtc object
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f7f5c258b553..c2db9dd6ec67 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1001,6 +1001,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>
>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>
> +       dpu_crtc_set_qos_dirty(drm_enc->crtc);
> +
>         if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
>                 msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7ea90d25a3b6..f91d31a31e14 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1066,6 +1066,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>         struct drm_crtc *crtc = state->crtc;
>         struct drm_framebuffer *fb = state->fb;
> +       bool is_rt_pipe;
>         const struct dpu_format *fmt =
>                 to_dpu_format(msm_framebuffer_format(fb));
>
> @@ -1075,7 +1076,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>
>         pstate->pending = true;
>
> -       pdpu->is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
> +       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>         _dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>
>         DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> @@ -1181,8 +1182,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                 _dpu_plane_set_ot_limit(plane, crtc);
>         }
>
> -       _dpu_plane_set_qos_remap(plane);
> +       if (is_rt_pipe != pdpu->is_rt_pipe) {
> +               pdpu->is_rt_pipe = is_rt_pipe;
> +               pstate->dirty |= DPU_PLANE_DIRTY_QOS;
> +       }
>
> +       if (pstate->dirty & DPU_PLANE_DIRTY_QOS) {
> +               _dpu_plane_set_qos_remap(plane);
> +               pstate->dirty = 0x0;
> +       }

So in the end, this looks roughly like "set qos remap on modesets or
switching between right/left pipe"?  Couldn't this be simpler if in
plane->atomic_check() you do something like:

   dpu_plane_state->needs_qos_remap = atomic_state->allow_modeset;

and then in plane->atomic_update:

    if (pstate->needs_qos_remap || (is_rt_pipe != pdpu->is_rt_pipe) {
         pdpu->is_rt_pipe = is_rt_pipe;
         _dpu_plane_set_qos_remap(plane)
    }

?

BR,
-R


>         _dpu_plane_calc_bw(plane, fb);
>
>         _dpu_plane_calc_clk(plane);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index ca83b8753d59..47abd3686a86 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -14,11 +14,15 @@
>  #include "dpu_hw_mdss.h"
>  #include "dpu_hw_sspp.h"
>
> +/* dirty bits to update QOS */
> +#define DPU_PLANE_DIRTY_QOS 0x1
> +
>  /**
>   * struct dpu_plane_state: Define dpu extension of drm plane state object
>   * @base:      base drm plane state object
>   * @aspace:    pointer to address space for input/output buffers
>   * @stage:     assigned by crtc blender
> + * @dirty:     bitmask for which pipe h/w config functions need to be updated
>   * @multirect_index: index of the rectangle of SSPP
>   * @multirect_mode: parallel or time multiplex multirect mode
>   * @pending:   whether the current update is still pending
> @@ -32,6 +36,7 @@ struct dpu_plane_state {
>         struct drm_plane_state base;
>         struct msm_gem_address_space *aspace;
>         enum dpu_stage stage;
> +       uint32_t dirty;
>         uint32_t multirect_index;
>         uint32_t multirect_mode;
>         bool pending;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
