Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB73B17405
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34F110E7BC;
	Thu, 31 Jul 2025 15:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VF2djo4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EE410E48C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:37:26 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-71b49bbb95cso11644757b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753976246; x=1754581046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7//2LzAKu11HmoEGbibQ1LX9NI1hrz/gXY6C8TmT6w=;
 b=VF2djo4qlz+zEwkHvMIHIOK1LiSmODxpHpyoG+/1dzxsY/KEnM/16eDYW6zsVQVIwW
 Hg8xf2CFp1jmA0novX3K2rmw5ArDlspgi0dcOv8b3Nj8bNl+tCLenvpipCqIuem2EAi6
 Xjv7XhdUHaXxJ7MO8u7paxvdU1SwsQBK72pTBnucw/gtehibvp3vMLUnRM0U/25bqb9w
 20L6cUh6MkkvPtP0l0cBPwOjGdA0q+yrpwiOfE1rDmgB8dxiKE7B+0ryDqinjNJ7qNPt
 JC3VE6DkWCout9g8nvOvQoo690ke53iIC5w2rII/ue1BK69q2ETzJF0JasvQYyiJ993D
 vDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753976246; x=1754581046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7//2LzAKu11HmoEGbibQ1LX9NI1hrz/gXY6C8TmT6w=;
 b=Fl7e9RUg0nwiGquuD9rBfIhG0+oIK4hzCE+Veck9CUr63rksPDmdjSyGqDPPmBeCBy
 HeKTfSr00vBW8Wsf/AIXGrqb6CJaPgodoBxlQSa1JqxxTgZ2tBmjQnQ7q10Cazf31qgz
 GZNlHqJSxs0AcYiKSO6d+4ss9g6NTSJigf5HziXi0yyUdaRrQhf9UcwwBfLJ1Fi5kjBq
 +HYNowsxsfWBFszL0sZAgQF3htu72/wvQaiBb8hVPeffmfVAq/8ZH8HEbMPB9KC+p5qB
 Jf/fuZ9/F7Cy5dDd/eusWGA78K8BOUFAKDUIu0kBZAnGIw+ts/Ra9l1+J/MCZqDpyEkA
 1+uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUgDtzULcj+kNrm2dc67LcNPD6Jv4N8KaUfXsLW/EY/3/6Zc/X76DbeK8dmrUC/tKFSwmaRfo7SyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA1cvSfjkJPY8XCYL5IvxWPrsYF/BKE3MCvtZuW6vprQmkSC/e
 SC1MdqugFX8kk0k6Un9wp3gdeYOC56Xo8/O38Ez2z6oLwvzWwN5X8Xh0gJAeyj8qhyvOQTzHUB7
 OKGSKQzzPdCg/7e0QqXw0v1spaiRmj6ju2U861KLzeA==
X-Gm-Gg: ASbGncvb3YAQ5bCkQPnCr0GCGejjH1dfKx5BvxkHTjBFgJ7E4bNC3ydgSYq8nAtQZjX
 93CME+H2Z1N3tvSqwtnyHHKzpGOEiyeVkIo1Y6hJ33855QIDYxAGaRGO8B7yueN5XCzo4cNFlE4
 Zyry1IXWB0ll4hfThqsudSku929e4izbwSiOUbEoTr4je6+aQofTKURj9R70A7AO6/CNQ3D2Yow
 IDrS9AYAIdkuLJkVg==
X-Google-Smtp-Source: AGHT+IESBL+nOLlOE1iMeOWQoaaI0PhLxmwK6WF01fgWpmssAArTOZ70Ah0OCxEGX5/X5yW+9NpNjRDV5p3xQYmyuXU=
X-Received: by 2002:a05:690c:f05:b0:71a:2dc9:a203 with SMTP id
 00721157ae682-71a469cc8f0mr107199247b3.25.1753976245620; Thu, 31 Jul 2025
 08:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
 <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
In-Reply-To: <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 31 Jul 2025 23:37:14 +0800
X-Gm-Features: Ac12FXwaPDf1p1H6FfT2KsXBNP7Dmag-L9T8Z8cb67--3eJcqBUWEQApLgw6zMw
Message-ID: <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
7=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 22:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On 31/07/2025 13:52, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 02:52=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> >>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> >>> quad-pipe usage scenarios require four pipes and involve configuring
> >>> two stages. In quad-pipe case, the first two pipes share a set of
> >>> mixer configurations and enable multi-rect mode when certain
> >>> conditions are met. The same applies to the subsequent two pipes.
> >>>
> >>> Assign SSPPs to the pipes in each stage using a unified method and
> >>> to loop the stages accordingly.
> >>>
> >>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++-=
-----------
> >>>   1 file changed, 99 insertions(+), 61 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> >>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f4=
60d62901dced65e3a9e 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capab=
le(struct dpu_hw_sspp *sspp,
> >>>   }
> >>>
> >>>
> >>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_stat=
e *pstate,
> >>> +                                            struct dpu_sw_pipe **sin=
gle_pipe,
> >>> +                                            struct dpu_sw_pipe_cfg *=
*single_pipe_cfg,
> >>> +                                            int stage_index)
> >>> +{
> >>> +     int pipe_idx, i, valid_pipe =3D 0;
> >>> +
> >>> +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> >>
> >> Why do you need to loop here? Is there a case when pipe 0 is not
> >> assigned, but pipe 1 is?
> >
> > Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> > pipes in stage of the current plane, this function will return false.
> > Or you prefer the below coding?
> >
> > 1029         pipe_idx =3D stage_index * PIPES_PER_STAGE;
> > 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) !=
=3D 0 &&
> > 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> > 1].src_rect) =3D=3D 0) {
>
> Yes, this is better from my POV. But the bigger question is why do you
> need it at all? What is wrong with the existing check? Can it be that
> pipe0 is not used, but pipe1 is used?

There is no case that pipe0 is not used, but pipe1 is used. Existing check
does not filter the plane which contains single pipe in a stage, which can
be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
skipped to be stored in prev_adjacent_plane_state[].

>
> > 1032                         if (single_pipe)
>
> You don't need these ifs. You always pass a valid pointer.

OK, a valid pointer can be passed though the return value may not be needed=
.
>
> > 1033                                 *single_pipe =3D &pstate->pipe[pip=
e_idx];
> > 1034                         if (single_pipe_cfg)
> > 1035                                 *single_pipe_cfg =3D
> > &pstate->pipe_cfg[pipe_idx];
> > 1036                 return true;
> > 1037         }
> > 1038
> > 1039         return false;
> >
> >>
> >>> +             pipe_idx =3D stage_index * PIPES_PER_STAGE + i;
> >>> +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect=
) !=3D 0) {
> >>> +                     valid_pipe++;
> >>> +                     if (valid_pipe > 1)
> >>> +                             return false;
> >>> +
> >>> +                     if (single_pipe)
> >>> +                             *single_pipe =3D &pstate->pipe[pipe_idx=
];
> >>> +                     if (single_pipe_cfg)
> >>> +                             *single_pipe_cfg =3D &pstate->pipe_cfg[=
pipe_idx];
> >>> +             }
> >>> +     }
> >>> +
> >>> +     return valid_pipe =3D=3D 1;
> >>> +}
> >>> +
> >>>   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >>>                                       struct drm_atomic_state *state,
> >>>                                       const struct drm_crtc_state *cr=
tc_state)
> >>> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(=
struct dpu_sw_pipe *pipe, struct dp
> >>>   static int dpu_plane_try_multirect_shared(struct dpu_plane_state *p=
state,
> >>>                                          struct dpu_plane_state *prev=
_adjacent_pstate,
> >>>                                          const struct msm_format *fmt=
,
> >>> -                                       uint32_t max_linewidth)
> >>> +                                       uint32_t max_linewidth, int s=
tage_index)
> >>>   {
> >>> -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> >>> -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> >>> -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> >>> -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe[0=
];
> >>> -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_pstate=
->pipe_cfg[0];
> >>> +     struct dpu_sw_pipe *pipe, *prev_pipe;
> >>> +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >>>        const struct msm_format *prev_fmt =3D msm_framebuffer_format(p=
rev_adjacent_pstate->base.fb);
> >>>        u16 max_tile_height =3D 1;
> >>>
> >>> -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> >>> +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> >>> +                                             &pipe_cfg, stage_index)=
)
> >>> +             return false;
> >>> +
> >>> +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> >>> +                                             &prev_pipe, &prev_pipe_=
cfg,
> >>> +                                             stage_index) ||
> >>>            prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >>>                return false;
> >>>
> >>> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(stru=
ct dpu_plane_state *pstate,
> >>>        if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >>>                max_tile_height =3D max(max_tile_height, prev_fmt->til=
e_height);
> >>>
> >>> -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> -
> >>> -     r_pipe->sspp =3D NULL;
> >>> -
> >>>        if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth=
) &&
> >>>            dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max=
_linewidth) &&
> >>>            (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> >>> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(str=
uct drm_plane *plane,
> >>>        return 0;
> >>>   }
> >>>
> >>> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pi=
pe,
> >>> +                                           struct dpu_sw_pipe_cfg *p=
ipe_cfg,
> >>> +                                           struct drm_plane_state *p=
lane_state,
> >>> +                                           struct dpu_global_state *=
global_state,
> >>> +                                           struct drm_crtc *crtc,
> >>> +                                           struct dpu_rm_sspp_requir=
ements *reqs)
> >>> +{
> >>> +     struct drm_plane *plane =3D plane_state->plane;
> >>> +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>> +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> >>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> >>> +
> >>> +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> >>> +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, reqs);
> >>> +             if (!pipe->sspp)
> >>> +                     return -ENODEV;
> >>> +             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> +             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> +     }
> >>> +
> >>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> >>> +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_=
pipe_cfg,
> >>> +                                           pipe->sspp,
> >>> +                                           msm_framebuffer_format(pl=
ane_state->fb),
> >>> +                                           dpu_kms->catalog->caps->m=
ax_linewidth))
> >>> +             goto stage_assinged;
> >>> +
> >>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> >>> +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, reqs);
> >>> +             if (!r_pipe->sspp)
> >>> +                     return -ENODEV;
> >>> +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> +     }
> >>> +
> >>> +stage_assinged:
> >>> +     return 0;
> >>> +}
> >>> +
> >>>   static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc=
,
> >>>                                              struct dpu_global_state =
*global_state,
> >>>                                              struct drm_atomic_state =
*state,
> >>>                                              struct drm_plane_state *=
plane_state,
> >>> -                                           struct drm_plane_state *p=
rev_adjacent_plane_state)
> >>> +                                           struct drm_plane_state **=
prev_adjacent_plane_state)
> >>>   {
> >>>        const struct drm_crtc_state *crtc_state =3D NULL;
> >>>        struct drm_plane *plane =3D plane_state->plane;
> >>>        struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>>        struct dpu_rm_sspp_requirements reqs;
> >>> -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> >>> +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PE=
R_PLANE];
> >>>        struct dpu_sw_pipe *pipe;
> >>> -     struct dpu_sw_pipe *r_pipe;
> >>>        struct dpu_sw_pipe_cfg *pipe_cfg;
> >>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >>>        const struct msm_format *fmt;
> >>> -     int i;
> >>> +     int i, ret;
> >>>
> >>>        if (plane_state->crtc)
> >>>                crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >>>                                                           plane_state=
->crtc);
> >>>
> >>>        pstate =3D to_dpu_plane_state(plane_state);
> >>> -     prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >>> -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >>> -
> >>> -     pipe =3D &pstate->pipe[0];
> >>> -     r_pipe =3D &pstate->pipe[1];
> >>> -     pipe_cfg =3D &pstate->pipe_cfg[0];
> >>> -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >>> +             prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i=
] ?
> >>> +                     to_dpu_plane_state(prev_adjacent_plane_state[i]=
) : NULL;
> >>>
> >>>        for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >>>                pstate->pipe[i].sspp =3D NULL;
> >>> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources=
(struct drm_crtc *crtc,
> >>>
> >>>        reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >>>
> >>> -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> >>> -             if (!prev_adjacent_pstate ||
> >>> -                 !dpu_plane_try_multirect_shared(pstate, prev_adjace=
nt_pstate, fmt,
> >>> -                                                 dpu_kms->catalog->c=
aps->max_linewidth)) {
> >>> -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm=
, global_state, crtc, &reqs);
> >>> -                     if (!pipe->sspp)
> >>> -                             return -ENODEV;
> >>> -
> >>> -                     r_pipe->sspp =3D NULL;
> >>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++) {
> >>> +             if (!prev_adjacent_pstate[i])
> >>> +                     goto assignment;
> >>>
> >>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> >>> -
> >>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>> -             }
> >>> -     } else {
> >>> -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, &reqs);
> >>> -             if (!pipe->sspp)
> >>> -                     return -ENODEV;
> >>> -
> >>> -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r=
_pipe, r_pipe_cfg,
> >>> -                                                   pipe->sspp,
> >>> -                                                   msm_framebuffer_f=
ormat(plane_state->fb),
> >>> -                                                   dpu_kms->catalog-=
>caps->max_linewidth)) {
> >>> -                     /* multirect is not possible, use two SSPP bloc=
ks */
> >>> -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->=
rm, global_state, crtc, &reqs);
> >>> -                     if (!r_pipe->sspp)
> >>> -                             return -ENODEV;
> >>> +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacen=
t_pstate[i], fmt,
> >>> +                                                dpu_kms->catalog->ca=
ps->max_linewidth,
> >>> +                                                i))
> >>> +                     continue;
> >>
> >>
> >> if (prev_adjacent_pstate[i] &&
> >>      dpu_plane_try_multirect_shared())
> >>          continue;
> >>
> >> No need for the goto.
> >
> > Right, it will be simpler.
> >>
> >>>
> >>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> >>> +assignment:
> >>> +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NU=
LL, i))
> >>> +                     prev_adjacent_plane_state[i] =3D plane_state;
> >>>
> >>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>> -             }
> >>> +             pipe =3D &pstate->pipe[i * PIPES_PER_STAGE];
> >>> +             pipe_cfg =3D &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> >>> +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe_c=
fg,
> >>> +                                                      plane_state,
> >>> +                                                      global_state,
> >>> +                                                      crtc, &reqs);
> >>> +             if (ret)
> >>> +                     return ret;
> >>>        }
> >>>
> >>>        return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >>> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_globa=
l_state *global_state,
> >>>                               unsigned int num_planes)
> >>>   {
> >>>        unsigned int i;
> >>> -     struct drm_plane_state *prev_adjacent_plane_state =3D NULL;
> >>> +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PL=
ANE] =3D { NULL };
> >>>
> >>>        for (i =3D 0; i < num_planes; i++) {
> >>>                struct drm_plane_state *plane_state =3D states[i];
> >>> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_glob=
al_state *global_state,
> >>>
> >>>                int ret =3D dpu_plane_virtual_assign_resources(crtc, g=
lobal_state,
> >>>                                                             state, pl=
ane_state,
> >>> -                                                          prev_adjac=
ent_plane_state);
> >>> +                                                          &prev_adja=
cent_plane_state[0]);
> >>
> >> It's exactly the prev_adjacent_plane_state.
> >
> > Yes, I will change it.
> >
> >>
> >>>                if (ret)
> >>>                        break;
> >>> -
> >>> -             prev_adjacent_plane_state =3D plane_state;
> >>>        }
> >>>
> >>>        return 0;
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry
