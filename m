Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0687F65EF44
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93C210E745;
	Thu,  5 Jan 2023 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E0A10E745
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672930261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=92doJ+xo8tgw6fKSGAk7Sp9ncmNA8GftX/t5qhk+C60=;
 b=bKzWd0Y/EMs5mE0Fc+7T8wcSmqvWESv9f9JddoW7S6X2T8Y++Il5ONf1lTRLXGRQHHAyzV
 RPQVriu4eQkKv4oUu+L4/5F75QKtsq+1To0zWfB26/hxqJY5nVYvMt0R1+XgFCfMoaoXa/
 4LEuqrW+mUnBYcvyQgVt/Gf2fOmFx50=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-PSRr-ZR-Mma44sgjABHTGw-1; Thu, 05 Jan 2023 09:49:35 -0500
X-MC-Unique: PSRr-ZR-Mma44sgjABHTGw-1
Received: by mail-lf1-f72.google.com with SMTP id
 f17-20020ac25091000000b004b565e69540so12964554lfm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 06:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92doJ+xo8tgw6fKSGAk7Sp9ncmNA8GftX/t5qhk+C60=;
 b=FHPCX6X6jXVs3vB1MDHVjDfA3QILMRRY76/SmGDJmg525GRkQklPqyHg1P1jtDMTGZ
 HPGYaG+1osJFz3HsU6/rNfovqvU5IY67eJUny7JduDxU6TYF3L9blKkONbURcIFn3mRD
 MfhjkXWEu3Sw3HYiDlUqsDVTqSW1wjN9CpV0IAuzPZmO8HIFeU2ihhL9QGXgwWtOrpFl
 CRJ+xf+Q+I8E85GqooiBzMWRg71C7k4SWwFfsH1fj5/A2bCrXUac/cR5Stwm9OBwL0Lr
 TRAqBR3eBDFwlTt2ao5Z9w0ayM1uogObXv3GmvaE79DEn8vcme/AlML64GY0gdpblECy
 LnfA==
X-Gm-Message-State: AFqh2kpWeYO/IskhxqscwLLWDrLY9r/0TEEm/dftYfohQW41HC+yU020
 KuY9QSPkCOc6XHd/an6AQvwyGu+eEyNGAltXG/pnRNoJu/J01QP9t1HhAHc7mZPle6fvJVVD1VV
 v5Ks9FCDPw8aXUO2ogPlwoukzYwSUp4GcnImPLm51GX2m
X-Received: by 2002:ac2:530b:0:b0:4b5:a6ba:b1e4 with SMTP id
 c11-20020ac2530b000000b004b5a6bab1e4mr3907182lfh.393.1672930168594; 
 Thu, 05 Jan 2023 06:49:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsl/a7MJB7dV41IJi6yl4EgwvribrjkBLTdL8FU1vlvg5KdNpX96IU96426HSKrX9Za3Icszg6rSagF8tJ07zk=
X-Received: by 2002:ac2:530b:0:b0:4b5:a6ba:b1e4 with SMTP id
 c11-20020ac2530b000000b004b5a6bab1e4mr3907168lfh.393.1672930168260; Thu, 05
 Jan 2023 06:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
 <20221222221441.6980-4-quic_jesszhan@quicinc.com>
 <fd9a9aca-8225-6cd1-ff5e-19f0a39bf49c@linaro.org>
 <66072aca-c8c5-db21-64c1-5d23762dc338@quicinc.com>
In-Reply-To: <66072aca-c8c5-db21-64c1-5d23762dc338@quicinc.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 5 Jan 2023 15:49:17 +0100
Message-ID: <CA+hFU4yySWjEjJc2Ay=ygJGSa2CzRMiDSLVHD5kpcZ5RWxydow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
To: Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: ppaalanen@gmail.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 4, 2023 at 2:10 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 12/22/2022 7:12 PM, Dmitry Baryshkov wrote:
> > On 23/12/2022 00:14, Jessica Zhang wrote:
> >> Initialize and use the color_fill properties for planes in DPU driver. In
> >> addition, relax framebuffer requirements within atomic commit path and
> >> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
> >> as it's unused.
> >>
> >> Changes since V2:
> >> - Fixed dropped 'const' warning
> >> - Dropped use of solid_fill_format
> >> - Switched to using drm_plane_solid_fill_enabled helper method
> >> - Added helper to convert color fill to BGR888 (Rob)
> >> - Added support for solid fill on planes of varying sizes
> >> - Removed DPU_PLANE_COLOR_FILL_FLAG
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
> >>   2 files changed, 49 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 13ce321283ff..0695b70ea1b7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct
> >> drm_crtc *crtc,
> >>       struct drm_plane_state *state;
> >>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
> >>       struct dpu_plane_state *pstate = NULL;
> >> +    const struct msm_format *fmt;
> >>       struct dpu_format *format;
> >>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> >> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct
> >> drm_crtc *crtc,
> >>                   sspp_idx - SSPP_VIG0,
> >>                   state->fb ? state->fb->base.id : -1);
> >> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> >> +        if (pstate->base.fb)
> >> +            fmt = msm_framebuffer_format(pstate->base.fb);
> >> +        else
> >> +            fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> >> +                    DRM_FORMAT_ABGR8888, 0);
> >> +
> >> +        format = to_dpu_format(fmt);
> >>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
> >>               bg_alpha_enable = true;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> index 86719020afe2..51a7507373f7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >> @@ -44,7 +44,6 @@
> >>   #define DPU_NAME_SIZE  12
> >> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
> >>   #define DPU_ZPOS_MAX 255
> >>   /* multirect rect index */
> >> @@ -105,7 +104,6 @@ struct dpu_plane {
> >>       enum dpu_sspp pipe;
> >>       struct dpu_hw_pipe *pipe_hw;
> >> -    uint32_t color_fill;
> >>       bool is_error;
> >>       bool is_rt_pipe;
> >>       const struct dpu_mdss_cfg *catalog;
> >> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct
> >> dpu_plane *pdpu,
> >>                   &scaler3_cfg);
> >>   }
> >> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill
> >> solid_fill)
> >> +{
> >> +    uint32_t ret = 0;
> >> +
> >> +    ret |= ((uint8_t) solid_fill.b) << 16;
> >> +    ret |= ((uint8_t) solid_fill.g) << 8;
> >> +    ret |= ((uint8_t) solid_fill.r);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   /**
> >>    * _dpu_plane_color_fill - enables color fill on plane
> >>    * @pdpu:   Pointer to DPU plane object
> >> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>       dst = drm_plane_state_dest(new_plane_state);
> >> -    fb_rect.x2 = new_plane_state->fb->width;
> >> -    fb_rect.y2 = new_plane_state->fb->height;
> >> +    if (new_plane_state->fb) {
> >> +        fb_rect.x2 = new_plane_state->fb->width;
> >> +        fb_rect.y2 = new_plane_state->fb->height;
> >> +    }
> >>       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >> +    if (new_plane_state->fb)
> >> +        fmt =
> >> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >> +    else
> >> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> >>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> >> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct
> >> drm_plane *plane,
> >>           return -EINVAL;
> >>       /* check src bounds */
> >> -    } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> >> +    } else if (new_plane_state->fb && !dpu_plane_validate_src(&src,
> >> &fb_rect, min_src_size)) {
> >>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
> >>                   DRM_RECT_ARG(&src));
> >>           return -E2BIG;
> >> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
> >>       if (pdpu->is_error)
> >>           /* force white frame with 100% alpha pipe output on error */
> >>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> >> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> >> +    else if (!(plane->state->fb) &&
> >> drm_plane_solid_fill_enabled(plane->state))
> >
> > And what if the plane has both fb and solid_fill proprety?
>
> Hi Dmitry,
>
> If both the FB and solid_fill are set, then the driver should prioritize
> the FB over the solid_fill.

Please add this to the documentation of the property as well.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>           /* force 100% alpha */
> >> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> >> +        _dpu_plane_color_fill(pdpu,
> >> _dpu_plane_get_fill_color(plane->state->solid_fill),
> >> +                0xFF);
> >>       else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
> >>           const struct dpu_format *fmt =
> >> to_dpu_format(msm_framebuffer_format(plane->state->fb));
> >>           const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu,
> >> fmt);
> >> @@ -1127,23 +1142,30 @@ static void
> >> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> >>       struct drm_crtc *crtc = state->crtc;
> >>       struct drm_framebuffer *fb = state->fb;
> >>       bool is_rt_pipe, update_qos_remap;
> >> -    const struct dpu_format *fmt =
> >> -        to_dpu_format(msm_framebuffer_format(fb));
> >> +    const struct dpu_format *fmt;
> >>       struct dpu_hw_pipe_cfg pipe_cfg;
> >> -    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> >> -
> >> -    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> >> -
> >>       pstate->pending = true;
> >>       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
> >>       _dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
> >> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u "
> >> DRM_RECT_FMT
> >> -            ", %4.4s ubwc %d\n", fb->base.id,
> >> DRM_RECT_FP_ARG(&state->src),
> >> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
> >> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> >> +    /* override for color fill */
> >> +    if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
> >
> > And here too.
> >
> >> +        /* skip remaining processing on color fill */
> >> +        return;
> >> +    }
> >> +
> >> +    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> >> +
> >> +    fmt = to_dpu_format(msm_framebuffer_format(fb));
> >> +    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> >> +
> >> +    if (fb)
> >> +        DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u "
> >> DRM_RECT_FMT
> >> +                ", %4.4s ubwc %d\n", fb->base.id,
> >> DRM_RECT_FP_ARG(&state->src),
> >> +                crtc->base.id, DRM_RECT_ARG(&state->dst),
> >> +                (char *)&fmt->base.pixel_format,
> >> DPU_FORMAT_IS_UBWC(fmt));
> >>       pipe_cfg.src_rect = state->src;
> >> @@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct
> >> drm_plane *plane)
> >>       pipe_cfg.dst_rect = state->dst;
> >> -    /* override for color fill */
> >> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> >> -        /* skip remaining processing on color fill */
> >> -        return;
> >> -    }
> >> -
> >>       if (pdpu->pipe_hw->ops.setup_rects) {
> >>           pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
> >>                   &pipe_cfg,
> >> @@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct
> >> drm_device *dev,
> >>           DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
> >>       drm_plane_create_alpha_property(plane);
> >> +    drm_plane_create_solid_fill_property(plane);
> >>       drm_plane_create_blend_mode_property(plane,
> >>               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> >>               BIT(DRM_MODE_BLEND_PREMULTI) |
> >
> > --
> > With best wishes
> > Dmitry
> >
>

