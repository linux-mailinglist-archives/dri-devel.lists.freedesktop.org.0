Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A9D1F886
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 15:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6410E215;
	Wed, 14 Jan 2026 14:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KQKGR9jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3F10E114
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 14:48:30 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7926b269f03so38192317b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768402110; x=1769006910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moURBLGJf5+rXV68bZZhYNA/I5Oay3dNci5O9TfNQ54=;
 b=KQKGR9jU0plTSR0Ozi57EO81g/frmZk9gw1ekWV/aLfkIsuoPLW32f9ghqjJhZ5BXl
 84Nb7PIP7mTqZflDhtPhEliK8jKZOyMgwDkVrH1iIkfdVVNyAxEn/QeH5uUiY/MzjnwX
 mbxBrqgg8VExprA+IHzV0n62RkFYQjKgFI0LuWj6sRKLHObXCQgpnSl+k/WLP4NiL1aX
 SwlKwuC3vWC6GN4ohZmwZ47+VkdTcyzOrb18T6h0btE4kH8MiZExG0M1ojAtMMg3jGB/
 609BQIxRC4YUtjRne5ZfnHSXijIc7K4X2bxJg6wOEaLwe/OdeGjbktSvtWLWe79KiwjA
 IkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768402110; x=1769006910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=moURBLGJf5+rXV68bZZhYNA/I5Oay3dNci5O9TfNQ54=;
 b=P+o1nQwc3rLl+/14l0FRXniUIQK68lad7bS+dqPJcoJFt1wIlJHq5Le6JBV0wJfXav
 4Pp2YCtybLZWbzUKj1v+nq71Z0BEXukAtP5ja7fNfurZv3aMgmpChYYNHMIHA1BRDa4i
 uBpPZmJoG4sTn8MhnyUCvl6b1qYRlamvc7pDbrSqgiKN40qKbABvdnHBSd0wGYL79yXk
 +SJ8GqUazG1HJcU7lGwh8PWvmFiOvvS/0/jgCQyx2dLLQHI38RVkbN2A5u3raH1XeCvL
 im9USShLm9vEXFurtzfXdxjExSr/UURLqp048f9We8qcd18OrnH2nn7SkzcbipTI3jro
 XqMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMoSCs/GbSYdV1Ag+pkc94oQ1Ec8UtTg0AKiLIX7OAaGBPFAoxuSXyYXVlzF2zuxyeH1TdskmmEtY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhfIbCJUdEqNFMEzprSSgJQGxmFktL8mnUxEwzaxfCTOZ1D6HG
 Lasz/qcMG13AbbPextcNzkNqFw3YfTpMMmuXb9tfZT/vIfPdjsT/TyNFpNJVAcW8ZwwZoJlbqy+
 WPr1Lpov0MsbBbvcGKJBpsVIouBbc4cMbg4ORGzufZQ==
X-Gm-Gg: AY/fxX4id0Q150g/ogmET3e21BE6Psp4Z1FavSNnM2mMqQbuW8UNr8UFTBmYYFwwNh+
 fnL+gE0SyS8Y6/jfID5CxJH1MmX+yIGvhy6Yq6S7XArweR72HO9VpD0xNMqnYNUrimjG2TJLyhS
 JsFqPpIK4c5lYPE/GhxptLXUheYwTegrzaRi2UXnjZHJNGy2v083ZyT3mLrsD75LVfIdua62dho
 l3TX6GDk1M9cVJh+7qxTx/ihV8FOWfkcYEFiEqzY91DEF1muf+JLTm2GnDZ4788we/EkOo4ch9r
 1kr87XekO3c=
X-Received: by 2002:a05:690c:9a01:b0:787:e779:9eb3 with SMTP id
 00721157ae682-793a1d9d67cmr45024817b3.62.1768402109292; Wed, 14 Jan 2026
 06:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 14 Jan 2026 22:48:17 +0800
X-Gm-Features: AZwV_QhxEXOKU22GGsX-5EC8TiJBFaRkWwxBFGCNSHzm_nmpA2a_JSQsuPnfxLw
Message-ID: <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=97=A5=E5=
=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
>
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
>
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---=
------
>  3 files changed, 110 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc=
2c5b9fd5ae83e6a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en=
)
>         return 0;
>  }
>
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> +
> +       return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.h
> index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c=
4c8714ca6589b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_=
client_type(
>
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc=
4e61c16c92e460c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_=
plane *plane,
>         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
>         struct dpu_sw_pipe_cfg *pipe_cfg;
>         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +       struct dpu_sw_pipe_cfg init_pipe_cfg;
>         struct drm_rect fb_rect =3D { 0 };
> +       const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
>         uint32_t max_linewidth;
> +       u32 num_lm;
> +       int stage_id, num_stages;
>
>         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
>         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
>                 return -EINVAL;
>         }
>
> -       /* move the assignment here, to ease handling to another pairs la=
ter */
> -       pipe_cfg =3D &pstate->pipe_cfg[0];
> -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> -       /* state->src is 16.16, src_rect is not */
> -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
>
> -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> +       /* state->src is 16.16, src_rect is not */
> +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src=
);
>
>         fb_rect.x2 =3D new_plane_state->fb->width;
>         fb_rect.y2 =3D new_plane_state->fb->height;
> @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm=
_plane *plane,
>
>         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
>
> -       drm_rect_rotate(&pipe_cfg->src_rect,
> +       drm_rect_rotate(&init_pipe_cfg.src_rect,
>                         new_plane_state->fb->width, new_plane_state->fb->=
height,
>                         new_plane_state->rotation);
>
> -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > =
max_mdp_clk_rate) {
> -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewid=
th) {
> -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT=
 " line:%u\n",
> -                                       DRM_RECT_ARG(&pipe_cfg->src_rect)=
, max_linewidth);
> -                       return -E2BIG;
> +       /*
> +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer=
 pair
> +        * configs for left and right half screen in case of 4:4:2 topolo=
gy.
> +        * But we may have 2 rect to split wide plane that exceeds limit =
with 1
> +        * config for 2:2:1. So need to handle both wide plane splitting,=
 and
> +        * two halves of screen splitting for quad-pipe case. Check dest
> +        * rectangle left/right clipping first, then check wide rectangle
> +        * splitting in every half next.
> +        */
> +       num_stages =3D (num_lm + 1) / 2;

Hi Dmitry,
Because the plane is checked before crtc is checked in the drm framework. W=
hile
the topology is decided in crtc check. Thus num_lm is 0 when this function =
is
called for the first time. As a result, the below iteration is not run
at all and leads
 to iommu warning.
Do you suggest to change drm framework with adding extra crtc check before
plane check, or you prefer the below line here?

num_stages =3D max(1, (num_lm + 1) / 2);

Jun

> +       /* iterate mixer configs for this plane, to separate left/right w=
ith the id */
> +       for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> +               struct drm_rect mixer_rect =3D {
> +                       .x1 =3D stage_id * mode->hdisplay / num_stages,
> +                       .y1 =3D 0,
> +                       .x2 =3D (stage_id + 1) * mode->hdisplay / num_sta=
ges,
> +                       .y2 =3D mode->vdisplay
> +                       };
> +               int cfg_idx =3D stage_id * PIPES_PER_STAGE;
> +
> +               pipe_cfg =3D &pstate->pipe_cfg[cfg_idx];
> +               r_pipe_cfg =3D &pstate->pipe_cfg[cfg_idx + 1];
> +
> +               drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state-=
>src);
> +               pipe_cfg->dst_rect =3D new_plane_state->dst;
> +
> +               DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +                               " vs clip window " DRM_RECT_FMT "\n",
> +                               DRM_RECT_ARG(&pipe_cfg->src_rect),
> +                               DRM_RECT_ARG(&mixer_rect));
> +
> +               /*
> +                * If this plane does not fall into mixer rect, check nex=
t
> +                * mixer rect.
> +                */
> +               if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> +                                         &pipe_cfg->dst_rect,
> +                                         &mixer_rect)) {
> +                       memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe=
_cfg));
> +
> +                       continue;
>                 }
>
> -               *r_pipe_cfg =3D *pipe_cfg;
> -               pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe_c=
fg->src_rect.x2) >> 1;
> -               pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe_c=
fg->dst_rect.x2) >> 1;
> -               r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> -               r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> -       } else {
> -               memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -       }
> +               pipe_cfg->dst_rect.x1 -=3D mixer_rect.x1;
> +               pipe_cfg->dst_rect.x2 -=3D mixer_rect.x1;
> +
> +               DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst:=
 " DRM_RECT_FMT "\n",
> +                               DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RE=
CT_ARG(&pipe_cfg->dst_rect));
> +
> +               /* Split wide rect into 2 rect */
> +               if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth)=
 ||
> +                    _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_ra=
te) {
> +
> +                       if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max=
_linewidth) {
> +                               DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_=
RECT_FMT " line:%u\n",
> +                                               DRM_RECT_ARG(&pipe_cfg->s=
rc_rect), max_linewidth);
> +                               return -E2BIG;
> +                       }
> +
> +                       memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw=
_pipe_cfg));
> +                       pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 =
+ pipe_cfg->src_rect.x2) >> 1;
> +                       pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 =
+ pipe_cfg->dst_rect.x2) >> 1;
> +                       r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2=
;
> +                       r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2=
;
> +                       DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> +                                       DRM_RECT_FMT " and " DRM_RECT_FMT=
 "\n",
> +                                       DRM_RECT_ARG(&pipe_cfg->src_rect)=
,
> +                                       DRM_RECT_ARG(&r_pipe_cfg->src_rec=
t));
> +               } else {
> +                       memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_c=
fg));
> +               }
>
> -       drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -                           new_plane_state->fb->width, new_plane_state->=
fb->height,
> -                           new_plane_state->rotation);
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> -               drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -                                   new_plane_state->fb->width, new_plane=
_state->fb->height,
> +               drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +                                   new_plane_state->fb->width,
> +                                   new_plane_state->fb->height,
>                                     new_plane_state->rotation);
>
> +               if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> +                       drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +                                           new_plane_state->fb->width,
> +                                           new_plane_state->fb->height,
> +                                           new_plane_state->rotation);
> +       }
> +
>         pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_st=
ate);
>
>         return 0;
> @@ -983,20 +1043,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_=
plane *plane,
>                 drm_atomic_get_new_plane_state(state, plane);
>         struct dpu_plane *pdpu =3D to_dpu_plane(plane);
>         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> -       struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> -       struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> -       struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate->pipe_cfg[1];
> -       int ret =3D 0;
> -
> -       ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> -                                         &crtc_state->adjusted_mode,
> -                                         new_plane_state);
> -       if (ret)
> -               return ret;
> +       struct dpu_sw_pipe *pipe;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
> +       int ret =3D 0, i;
>
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> -               ret =3D dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_=
cfg,
> +       for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> +               pipe =3D &pstate->pipe[i];
> +               pipe_cfg =3D &pstate->pipe_cfg[i];
> +               if (!drm_rect_width(&pipe_cfg->src_rect))
> +                       continue;
> +               DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n",=
 i);
> +               ret =3D dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
>                                                   &crtc_state->adjusted_m=
ode,
>                                                   new_plane_state);
>                 if (ret)
>
> --
> 2.34.1
>
