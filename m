Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF8904E7B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015AA10E7DF;
	Wed, 12 Jun 2024 08:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t4CwcX5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979BC10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:50:47 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-62a08091c2bso25231287b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718182246; x=1718787046; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hNjdy7UPfu6XvaHxYP1tE+6Sgn9Tw3j/iRDWJlIZilY=;
 b=t4CwcX5OabBIC41aqjzPDLU7e0bgwFKY0+AGJt92Gzo6si87qmkeIRHGgj848K8ytg
 8sEvW2CCFuV6/IikQ7DVwXr9I7ygNry40z28HZ+p8Hw1xaKQuk6xpVZcTmG+a9vTsDwy
 hmgDrG8MyuB8PdSDipAbYaqk8Za6ccwHbxGoOI0DAI7sunZ6BQVm6bitIAgR4TH3xstW
 /NLv5DbPC2Dl6RxmGR8ktWUu/XbEILyHFbYJeKE68YJn5aqrlk+OxnN5F0vDEmkFoWms
 mYlu682h0hjw+7Hs8SyVhPQuCaB/usk3UzLABfunyR1+e4EyQQXi+1OsdpoQgoLOAGUS
 c0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718182246; x=1718787046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNjdy7UPfu6XvaHxYP1tE+6Sgn9Tw3j/iRDWJlIZilY=;
 b=YrgsB7onY66VSKKDzYcJkJUxYaRg/xTzFd2XJ24f48cpF456k25O1g41bPjqNXFePw
 Scc1tTSIqEGZnhMANKvI1wqBV/bCHdo59SRWedgN15qQvEPCk5h+raCNUc3b3JuJbKwb
 mPGEJzc0noFel/z/2/5XcwFWa3qF+h1g7svCx3kR0CAhSZr0WmIFi38SQV7jsgHUjFQT
 /WIB7ehJ7itgsfpubVUz0NLlYY6ot/+NtfZwPawP6yTzBw/D5NbFXXKq57qtFH1JsCD1
 QqlDelQCCFroQn6IM3X2xYOSxKhSxxzY8+PqkxeNA7+dOPcixInIom885sjxdtvl/8Ic
 Xt2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKCszqQxmnOynyvPkHT04zCLyRCZ1Gjqm+HvC/i8V+6tY5LHw91rNzg4Z/SU03m0PRE6S+Pk3CXg+D6YmsOOtzPJiDqh7x/PI7sy/HZhXJ
X-Gm-Message-State: AOJu0YxlQUDAB3pZpCQ3qGbBQ4BkNT3NfvSw7Dmglx3L/PxAsotZAqFX
 VXR7K6Z88Q5D5ywFSB3Lp96w0J+QF2uh/cYrrP94wlx5pW+5vXjAKpoSe6dodXFIgkEZsCvWHNw
 NHjWeyFzUkQ5qcK8m7blHQ6YZDOMsdVRyMkCD7g==
X-Google-Smtp-Source: AGHT+IEIep8TWUDQNYipjdR8ozOU4TsvCnB30cqeIU/L2mK6IRI2gHDnCC8z6o/4kDTLu0qtEuxMlFKxSjEfM2ymJuE=
X-Received: by 2002:a81:a705:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-62fbd6a5654mr10701807b3.40.1718182245910; Wed, 12 Jun 2024
 01:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-13-dmitry.baryshkov@linaro.org>
 <0996ccd1-32b1-eaa9-0331-e0270da80da2@quicinc.com>
In-Reply-To: <0996ccd1-32b1-eaa9-0331-e0270da80da2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 11:50:35 +0300
Message-ID: <CAA8EJprJq7jFVK5hU2ByYP2QWoy1xfmCn0L3W4kYhgLRa0yDNA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm/dpu: allow sharing of blending stages
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jun 2024 at 04:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > It is possible to slightly bend the limitations of the HW blender. If
> > two rectangles are contiguous (like two rectangles of a single plane)
> > they can be blended using a single LM blending stage, allowing one to
> > blend more planes via a single LM.
> >
>
> Can you pls let me know the source of this optimization (assuming its
> present downstream) ?
>
> Otherwise I will have to lookup some more docs to confirm this.
>
> It certainly makes sense, that if the same layer is being split across
> two SSPP's we can certainly use the same blend stage. But want to make
> sure this is already in place somewhere and not something which was
> tried and just worked.

My source was the original 'virtual' / 'multirect' implementation in
the SDE driver.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 ++++++++++++++++++-----
> >   2 files changed, 37 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 794c5643584f..fbbd7f635d04 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -445,6 +445,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >
> >       uint32_t lm_idx;
> >       bool bg_alpha_enable = false;
> > +     unsigned int stage_indices[DPU_STAGE_MAX] = {};
> >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> >
> >       memset(fetch_active, 0, sizeof(fetch_active));
> > @@ -469,7 +470,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >                                          mixer, cstate->num_mixers,
> >                                          pstate->stage,
> >                                          format, fb ? fb->modifier : 0,
> > -                                        &pstate->pipe, 0, stage_cfg);
> > +                                        &pstate->pipe,
> > +                                        stage_indices[pstate->stage]++,
> > +                                        stage_cfg);
> >
> >               if (pstate->r_pipe.sspp) {
> >                       set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> > @@ -477,7 +480,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
> >                                                  mixer, cstate->num_mixers,
> >                                                  pstate->stage,
> >                                                  format, fb ? fb->modifier : 0,
> > -                                                &pstate->r_pipe, 1, stage_cfg);
> > +                                                &pstate->r_pipe,
> > +                                                stage_indices[pstate->stage]++,
> > +                                                stage_cfg);
> >               }
>
> Is this part of the change related to this patch? We moved from
> hard-coding 0 and 1 for the stage_idx to stage_indices[pstate->stage]
> will still result in the same values of 0 and 1 right?

No. The stage can span multiple planes now, see one of the chunks below.

>
> The sharing will be achieved with the change below of doing
> pstate->stage = prev_pstate->stage.
>
> Rest of the change LGTM.
>
>
> >
> >               /* blend config update */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 2e1c544efc4a..43dfe13eb298 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -827,13 +827,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > -     if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > -             DPU_ERROR("> %d plane stages assigned\n",
> > -                       pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > -             return -EINVAL;
> > -     }
> > -
> >       /* state->src is 16.16, src_rect is not */
> >       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> >
> > @@ -971,6 +964,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
> >               prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> >               prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +             if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> > +                 pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> > +                 pipe_cfg->dst_rect.x1 == prev_pipe_cfg->dst_rect.x2) {
> > +                     pstate->stage = prev_pstate->stage;
> > +             } else if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> > +                        pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> > +                        pipe_cfg->dst_rect.x2 == prev_pipe_cfg->dst_rect.x1) {
> > +                     pstate->stage = prev_pstate->stage;
> > +                     pipe->multirect_index = DPU_SSPP_RECT_0;
> > +                     prev_pipe->multirect_index = DPU_SSPP_RECT_1;
> > +             }
> > +
> >               return true;
> >       }
> >
> > @@ -1080,6 +1085,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > +     pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > +     if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > +             DPU_ERROR("> %d plane stages assigned\n",
> > +                       pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > +             return -EINVAL;
> > +     }
> > +
> >       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >       r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > @@ -1221,6 +1233,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >
> >       max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> >
> > +     if (prev_pstate)
> > +             pstate->stage = prev_pstate->stage + 1;
> > +     else
> > +             pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> > +
> >       if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> >               if (!prev_pstate ||
> >                   !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
> > @@ -1267,6 +1284,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >               }
> >       }
> >
> > +     if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
> > +             DPU_ERROR("> %d plane stages assigned\n",
> > +                       dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> > +             return -EINVAL;
> > +     }
> > +
> >       return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> >   }
> >



-- 
With best wishes
Dmitry
