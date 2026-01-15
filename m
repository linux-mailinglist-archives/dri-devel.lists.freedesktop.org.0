Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C39D2394C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5487510E729;
	Thu, 15 Jan 2026 09:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="se8zW0O8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF610E727
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:34:40 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-792815157f3so6543377b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768469679; x=1769074479; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtmucDODzCQNgpM1i8fstCkKu8sS/X2z9xJEfREIeM4=;
 b=se8zW0O8ivjzqwRaYmSNskm4JdBpCkMdkAK5ME4NUykZVdlNKGpXEiCavRHtQySo6E
 UEU8Tf4FeJKwBlmmQmyLKB2+9AhEWbEs0S16DvKZ6r1gaIL8zKwuz1fPEfIm3P1q2zmJ
 76b6mXTlJJ6f2t02g0sgLeeamulOX5g3QBhRoj1fLthFXbhMfTzJtgzOpCsSLty7GjX6
 kwltAItvsC3XZ8+5ipLm45TupQeeLcGNl1QjqlcWZeFSSvF4W6Z7kZXUblESxK9xWp4Y
 DKLKfBuvuMFGjXpzUlDS9NuJUpKHsE83ZA+JLRaSLM5MkLjF3c5ExtB4MAvX3PGYQbAP
 qenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469679; x=1769074479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gtmucDODzCQNgpM1i8fstCkKu8sS/X2z9xJEfREIeM4=;
 b=LFBcfJN7m3X9N/DfIwArlSXGPWPze3sVKftkbRxzh9PTP4+TjF/yKFsVGYXL+LEwf+
 eMjAkSXDb2N903sGSOF0tIpyfie8m7rQxSqVKvgxwVdnEeLNMHMhnEd3p5VCSp+ACfwp
 YGpy6/MqGYbgT3HGgKQk6+qB4kkitItBfvV2lR3nawJAsBfPdn9IhWjS1Rdg08XxZZac
 GJpdl2NZuGh019BSGXn9QCBRY3YATIuWYV3H3XfolnWbqGBLDbAIrvPpe+OZioyhYbv5
 ViN/NCYpQTKt9ZVgkTA49W87UHzfwJ8M9wDMk3P+uPXgurM97mkxHgPDOgpl/j4+2FkL
 g++Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnCfjTzsMzE/n8b8u6K73PX0phmKJgATihuoMgjjTcCGeM70Rtvxd4m5eXhfn7bPbYeovsnFlGbnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIJlBnYqwVtBmbIYxP83UVcDUrWwIen8c7KjWYmSmqjxmcAERg
 BLZ+Bo47qbWwzJQPfBXjgIhpqlC7VxvdtjCql7DG77Wr4A3o/ynS0wKaWG9JH6zy7IUCQjD46oF
 61mqLzU/Xya/UCsXGGKqHi2m2tTsiIhi+84dIeemRmw==
X-Gm-Gg: AY/fxX5MpekOvenXkZZT7z4ttgWXZovy0DnhMQawuisUA8jnFwWgmGUx70KA01Mux24
 Ja4ox8zEAKE2wfX1naM4h/YmlTFEaPF9IaSgp1ai/IR1neU8YUl4OBiQIiqiAx8mS/Bj49HJPm2
 CQGE4n1qS03OKeYDYTDwYFlikuqKN6YAPnuw+tWcgwwWk9CxXbcEBct9ABVjcvEsLskIYVo1wV6
 ZqpljC2hjinX6Z+fveYmmI6V03NSoLDI6RZ1hOav4dN4DGA33cZs32XWj31sPcukmNXDUGjouxC
 414=
X-Received: by 2002:a53:ad51:0:b0:644:4f94:c534 with SMTP id
 956f58d0204a3-64901b01e6bmr3412888d50.53.1768469679004; Thu, 15 Jan 2026
 01:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
In-Reply-To: <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 15 Jan 2026 17:34:28 +0800
X-Gm-Features: AZwV_QjTArNszH-qrNgMT-T_17tzEChvNSpI6BZWzX1L0kGAzHlaV3mOKtWzKrQ
Message-ID: <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8815=E6=97=A5=E5=91=A8=E5=9B=9B 00:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > Jun Nie <jun.nie@linaro.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8818=E6=97=
=A5=E5=91=A8=E5=9B=9B 21:30=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by tw=
o
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 ++++++++++++++++++++=
+---------
> > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d73=
5fdc2c5b9fd5ae83e6a 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, boo=
l en)
> > >         return 0;
> > >  }
> > >
> > > +/**
> > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > + * @state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > +{
> > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > > +
> > > +       return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.h
> > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9=
895c4c8714ca6589b10 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_=
get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)=
;
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562=
c3dc4e61c16c92e460c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct =
drm_plane *plane,
> > >         struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_pla=
ne_state);
> > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > >         struct drm_rect fb_rect =3D { 0 };
> > > +       const struct drm_display_mode *mode =3D &crtc_state->adjusted=
_mode;
> > >         uint32_t max_linewidth;
> > > +       u32 num_lm;
> > > +       int stage_id, num_stages;
> > >
> > >         min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > >         max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > >                 return -EINVAL;
> > >         }
> > >
> > > -       /* move the assignment here, to ease handling to another pair=
s later */
> > > -       pipe_cfg =3D &pstate->pipe_cfg[0];
> > > -       r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > -       /* state->src is 16.16, src_rect is not */
> > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src=
);
> > > +       num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> > >
> > > -       pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > +       /* state->src is 16.16, src_rect is not */
> > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state-=
>src);
> > >
> > >         fb_rect.x2 =3D new_plane_state->fb->width;
> > >         fb_rect.y2 =3D new_plane_state->fb->height;
> > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct=
 drm_plane *plane,
> > >
> > >         max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > >
> > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > >                         new_plane_state->fb->width, new_plane_state->=
fb->height,
> > >                         new_plane_state->rotation);
> > >
> > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg=
) > max_mdp_clk_rate) {
> > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_lin=
ewidth) {
> > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT=
_FMT " line:%u\n",
> > > -                                       DRM_RECT_ARG(&pipe_cfg->src_r=
ect), max_linewidth);
> > > -                       return -E2BIG;
> > > +       /*
> > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 m=
ixer pair
> > > +        * configs for left and right half screen in case of 4:4:2 to=
pology.
> > > +        * But we may have 2 rect to split wide plane that exceeds li=
mit with 1
> > > +        * config for 2:2:1. So need to handle both wide plane splitt=
ing, and
> > > +        * two halves of screen splitting for quad-pipe case. Check d=
est
> > > +        * rectangle left/right clipping first, then check wide recta=
ngle
> > > +        * splitting in every half next.
> > > +        */
> > > +       num_stages =3D (num_lm + 1) / 2;
> >
> > Hi Dmitry,
> > Because the plane is checked before crtc is checked in the drm framewor=
k. While
> > the topology is decided in crtc check. Thus num_lm is 0 when this funct=
ion is
> > called for the first time. As a result, the below iteration is not run
> > at all and leads
> >  to iommu warning.
>
> How does it lead to IOMMU warnings?

Because the pipe is not configured with width/height etc when the iteration=
 is
skipped. I have not found the root cause so far. But per the null IOMMU iov=
a
value, suppose it is due to DMA buffer not being prepared when DMA is start=
ed.

>
> > Do you suggest to change drm framework with adding extra crtc check bef=
ore
> > plane check, or you prefer the below line here?
> >
> > num_stages =3D max(1, (num_lm + 1) / 2);
>
> DRM framework provides enough hooks to be able to influence the order or
> operations without changing the framework. But, I'd like to point out
> that for the virtual plane case we already perform plane operations
> from dpu_crtc_atomic_check(). You can employ the same approach.

Thanks for the suggestion! I see dpu_assign_plane_resources() is called
from crtc side, which avoids the plane splitting before topology decision.
To use this method, it looks like we are enabling the virtual plane by defa=
ult.
Because the virtual plane differs from the traditional method only with the
plane splitting and resource preparation. Can we just enable the virtual
plane by default in this situation?

Jun

>
>
> --
> With best wishes
> Dmitry
