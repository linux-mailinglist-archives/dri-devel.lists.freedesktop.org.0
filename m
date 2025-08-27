Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7DEB380B1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0810E08B;
	Wed, 27 Aug 2025 11:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AP21TCS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFAA10E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756293451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oAhdbf6vh7iRSgsK75rNkb5MDO8FGeWtYs3dZeDfRU=;
 b=AP21TCS0egNkrndNnMDtOJE0d/HN+59R7X2R0bkGJnxY66Ay1V7xhG5hVDIH72fZwpC0g0
 XemRIL5I30tryBfnaBB2yvnVeTLmS79kjjyz0arVJryI098qQVZ1Ovry/ghaObKOsE3DXq
 QhRMP/7CZzLmsr9nSU/wg7fG1fQbY7g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-M86rEqeROYi_P6duo0Ugeg-1; Wed, 27 Aug 2025 07:17:29 -0400
X-MC-Unique: M86rEqeROYi_P6duo0Ugeg-1
X-Mimecast-MFC-AGG-ID: M86rEqeROYi_P6duo0Ugeg_1756293448
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3c75de76caaso1790097f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756293448; x=1756898248;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yGGLpOKTTKl7QSaqTVOWMFBQk1IcweQZhxo0taPBQig=;
 b=wTlBVf+CGEZs04ehehUmcOfK0k+FkUY3igsYOwtGXC2Rv9O7YYf0ESYthQBYrlPok7
 NcphVprd40ioZrqMg/SpH7Jf/dybU3fhn6HJMWxZgfdvYSM3oH9IZ8Mi3jEJj/7KzOvZ
 dJfsyql3YDzoAUcJortb2oxwaZKDx2RyQFDXRXLUdWuzhlFD7Q+V6V9G3TPp5J846UdG
 oq44eav/QitFThkC6fW6+Z8/5HLzicBjBjjZrERJdUw72cX48rVdbwveDV/Bwj9ASAhS
 /HDz1uC5XBphjbCovHdV2es4asyGWF+0shDaPLMyCEefeX+UpH/ZcLfe52+3PRSmlSee
 GLcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnhEZvPV7mJLYCXL9C4aLOB0FSw4wOOJ2r1CmQ+cXOwfbq91SKt27nCJQU1z15kfphC3bxvMGdXDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxml2+5POsC2Ks9uRO5S3oC3AWlCKyNWWtZqpJ5A/5pqC2Rx41y
 xVCeZo3EycyMUgqkby5hMmsoVMuYna9JLxFSjSohSawsY4OcZLZZeYkTdBf+SVOQA2ySDTjO0hv
 4kyEWsIvG++tRskeI6p8trBlkBtiU6dnSvlfocAsY1DeIJl4gphwQHhr1SuTfm7C2874elQ==
X-Gm-Gg: ASbGncv4XkECjTCLcRqDvGrqsdy+G8K+EEPTncdisdrQ0LcPzMeFt+oxdT7OppAgK94
 l6pzfxCxRGHQ3LMqJMF6MldqpfX/7lqQkUOpBi1Gc1ArxGRsfKCY7JMKSH4bVcB8W/yYahRnypp
 tjw86Rr+ZC/+FFyLQDtzOhy9vMlAnRKF+gW2aJtzum7+Gw4HapHEt6FdPHKTn1psVlVVxIuqfV7
 /GeT98sxrURz7grafjK7Y+AorC+ms//R/XUuvoGiYuxhayZrR78jgD3sFvN1OZhgllYWSPOuPXh
 LXGYwmFG3ND01caFj7UIiHt97p2V1RdSfUBsnnWwr16fjg==
X-Received: by 2002:a05:6000:1182:b0:3cd:1cc2:f411 with SMTP id
 ffacd0b85a97d-3cd1cc2ff1amr883624f8f.61.1756293448049; 
 Wed, 27 Aug 2025 04:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7k1uZnIQV6zvtSaSjL9cEzSrSgANMES51n8h8kHcZkQIXNZXr7XHs6BqppTpqyiVrfSuJ8w==
X-Received: by 2002:a05:6000:1182:b0:3cd:1cc2:f411 with SMTP id
 ffacd0b85a97d-3cd1cc2ff1amr883584f8f.61.1756293447323; 
 Wed, 27 Aug 2025 04:17:27 -0700 (PDT)
Received: from localhost ([2001:9e8:898f:9300:ff23:be77:f1bc:ffc8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cce1724939sm1984579f8f.26.2025.08.27.04.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 04:17:26 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 27 Aug 2025 13:17:25 +0200
Message-Id: <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
From: "Sebastian Wick" <sebastian.wick@redhat.com>
To: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
Cc: "Alex Hung" <alex.hung@amd.com>, <wayland-devel@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <leo.liu@amd.com>,
 <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <shashank.sharma@amd.com>, <agoins@nvidia.com>, <joshua@froggi.es>,
 <mdaenzer@redhat.com>, <aleixpol@kde.org>, <xaver.hugl@gmail.com>,
 <victoria@system76.com>, <uma.shankar@intel.com>,
 <quic_naseer@quicinc.com>, <quic_cbraga@quicinc.com>,
 <quic_abhinavk@quicinc.com>, <marcan@marcan.st>, <Liviu.Dudau@arm.com>,
 <sashamcintosh@google.com>, <chaitanya.kumar.borah@intel.com>,
 <louis.chauvet@bootlin.com>, <mcanal@igalia.com>, <kernel@collabora.com>,
 <daniels@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
X-Mailer: aerc 0.20.1
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nQuL8jWbLG8-wO0GLuePOUdRYWTm9BOwKAbNV5en8RQ_1756293448
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
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

On Fri Aug 22, 2025 at 8:36 PM CEST, N=C3=ADcolas F. R. A. Prado wrote:
> Introduce support for a post-blend color pipeline API analogous to the
> pre-blend color pipeline API. While the pre-blend color pipeline was
> configured through a COLOR_PIPELINE property attached to a drm_plane,
> the post-blend color pipeline is configured through a COLOR_PIPELINE
> property on the drm_crtc.
>
> Since colorops can now be attached to either a drm_plane or a drm_crtc,
> rework the helpers to account for both cases.
>
> Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, to
> enable support for post-blend color pipelines, and prevent the now
> legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties from
> being exposed.

Hey,

Please note that you'll also have to deprecate the semi-standard
Broadcast RGB property. It serves two purposes at once: it changes the
values between the color range (similar to COLOR_RANGE but at the other
end) and informats the sink of the range as well.

So the post blending color pipeline will need something like an inverse
COLOR_RANGE op.

We will also need a new connector property where user space can select
the color range, which does not change the pixel values, and only
exposes options that can be achieved (default sink behavior, full range
infoframe, limited range infoframe).

>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        |  32 ++++++--
>  drivers/gpu/drm/drm_atomic_uapi.c   |  50 ++++++++++++-
>  drivers/gpu/drm/drm_colorop.c       | 144 +++++++++++++++++++++++++++++-=
------
>  drivers/gpu/drm/drm_connector.c     |   1 +
>  drivers/gpu/drm/drm_crtc.c          |  77 +++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h |   6 ++
>  drivers/gpu/drm/drm_ioctl.c         |   7 ++
>  drivers/gpu/drm/drm_mode_object.c   |  20 +++++
>  drivers/gpu/drm/drm_plane.c         |  36 ++-------
>  include/drm/drm_atomic.h            |  20 +++++
>  include/drm/drm_atomic_uapi.h       |   2 +
>  include/drm/drm_colorop.h           |  16 +++-
>  include/drm/drm_crtc.h              |  19 +++++
>  include/drm/drm_file.h              |   7 ++
>  include/uapi/drm/drm.h              |  16 ++++
>  15 files changed, 383 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3ab32fe7fe1cbf9057c3763d979638dce013d82b..558d389d59d9a44d3cd1048ed=
365848f62b4d62d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -472,6 +472,8 @@ static void drm_atomic_crtc_print_state(struct drm_pr=
inter *p,
>  =09drm_printf(p, "\tplane_mask=3D%x\n", state->plane_mask);
>  =09drm_printf(p, "\tconnector_mask=3D%x\n", state->connector_mask);
>  =09drm_printf(p, "\tencoder_mask=3D%x\n", state->encoder_mask);
> +=09drm_printf(p, "\tcolor-pipeline=3D%d\n",
> +=09=09   state->color_pipeline ? state->color_pipeline->base.id : 0);
>  =09drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode=
));
> =20
>  =09if (crtc->funcs->atomic_print_state)
> @@ -617,9 +619,15 @@ drm_atomic_get_colorop_state(struct drm_atomic_state=
 *state,
>  =09if (colorop_state)
>  =09=09return colorop_state;
> =20
> -=09ret =3D drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
> -=09if (ret)
> -=09=09return ERR_PTR(ret);
> +=09if (colorop->plane) {
> +=09=09ret =3D drm_modeset_lock(&colorop->plane->mutex, state->acquire_ct=
x);
> +=09=09if (ret)
> +=09=09=09return ERR_PTR(ret);
> +=09} else {
> +=09=09ret =3D drm_modeset_lock(&colorop->crtc->mutex, state->acquire_ctx=
);
> +=09=09if (ret)
> +=09=09=09return ERR_PTR(ret);
> +=09}
> =20
>  =09colorop_state =3D drm_atomic_helper_colorop_duplicate_state(colorop);
>  =09if (!colorop_state)
> @@ -2003,11 +2011,21 @@ static void __drm_state_dump(struct drm_device *d=
ev, struct drm_printer *p,
>  =09=09return;
> =20
>  =09list_for_each_entry(colorop, &config->colorop_list, head) {
> -=09=09if (take_locks)
> -=09=09=09drm_modeset_lock(&colorop->plane->mutex, NULL);
> +=09=09if (take_locks) {
> +=09=09=09if (colorop->plane)
> +=09=09=09=09drm_modeset_lock(&colorop->plane->mutex, NULL);
> +=09=09=09else
> +=09=09=09=09drm_modeset_lock(&colorop->crtc->mutex, NULL);
> +
> +=09=09}
>  =09=09drm_atomic_colorop_print_state(p, colorop->state);
> -=09=09if (take_locks)
> -=09=09=09drm_modeset_unlock(&colorop->plane->mutex);
> +=09=09if (take_locks) {
> +=09=09=09if (colorop->plane)
> +=09=09=09=09drm_modeset_unlock(&colorop->plane->mutex);
> +=09=09=09else
> +=09=09=09=09drm_modeset_unlock(&colorop->crtc->mutex);
> +
> +=09=09}
>  =09}
> =20
>  =09list_for_each_entry(plane, &config->plane_list, head) {
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index b7cc6945864274bedd21dd5b73494f9aae216888..a826758cf0b6205e2ba497340=
70bc83ffb7c08df 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -287,6 +287,33 @@ drm_atomic_set_colorop_for_plane(struct drm_plane_st=
ate *plane_state,
>  }
>  EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
> =20
> +/**
> + * drm_atomic_set_colorop_for_crtc - set colorop for crtc
> + * @crtc_state: atomic state object for the crtc
> + * @colorop: colorop to use for the crtc
> + *
> + * Helper function to select the color pipeline on a crtc by setting
> + * it to the first drm_colorop element of the pipeline.
> + */
> +void
> +drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +=09=09=09=09 struct drm_colorop *colorop)
> +{
> +=09struct drm_crtc *crtc =3D crtc_state->crtc;
> +
> +=09if (colorop)
> +=09=09drm_dbg_atomic(crtc->dev,
> +=09=09=09       "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
> +=09=09=09       colorop->base.id, crtc->base.id, crtc->name,
> +=09=09=09       crtc_state);
> +=09else
> +=09=09drm_dbg_atomic(crtc->dev,
> +=09=09=09       "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
> +=09=09=09       crtc->base.id, crtc->name, crtc_state);
> +
> +=09crtc_state->color_pipeline =3D colorop;
> +}
> +EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
> =20
>  /**
>   * drm_atomic_set_crtc_for_connector - set CRTC for connector
> @@ -396,8 +423,8 @@ static s32 __user *get_out_fence_for_connector(struct=
 drm_atomic_state *state,
>  }
> =20
>  static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
> -=09=09struct drm_crtc_state *state, struct drm_property *property,
> -=09=09uint64_t val)
> +=09=09struct drm_crtc_state *state, struct drm_file *file_priv,
> +=09=09struct drm_property *property, uint64_t val)
>  {
>  =09struct drm_device *dev =3D crtc->dev;
>  =09struct drm_mode_config *config =3D &dev->mode_config;
> @@ -406,7 +433,17 @@ static int drm_atomic_crtc_set_property(struct drm_c=
rtc *crtc,
> =20
>  =09if (property =3D=3D config->prop_active)
>  =09=09state->active =3D val;
> -=09else if (property =3D=3D config->prop_mode_id) {
> +=09else if (property =3D=3D crtc->color_pipeline_property) {
> +=09=09/* find DRM colorop object */
> +=09=09struct drm_colorop *colorop =3D NULL;
> +
> +=09=09colorop =3D drm_colorop_find(dev, file_priv, val);
> +
> +=09=09if (val && !colorop)
> +=09=09=09return -EACCES;
> +
> +=09=09drm_atomic_set_colorop_for_crtc(state, colorop);
> +=09} else if (property =3D=3D config->prop_mode_id) {
>  =09=09struct drm_property_blob *mode =3D
>  =09=09=09drm_property_lookup_blob(dev, val);
>  =09=09ret =3D drm_atomic_set_mode_prop_for_crtc(state, mode);
> @@ -487,6 +524,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  =09=09*val =3D 0;
>  =09else if (property =3D=3D crtc->scaling_filter_property)
>  =09=09*val =3D state->scaling_filter;
> +=09else if (property =3D=3D crtc->color_pipeline_property)
> +=09=09*val =3D (state->color_pipeline) ? state->color_pipeline->base.id =
: 0;
>  =09else if (crtc->funcs->atomic_get_property)
>  =09=09return crtc->funcs->atomic_get_property(crtc, state, property, val=
);
>  =09else {
> @@ -1047,6 +1086,8 @@ int drm_atomic_get_property(struct drm_mode_object =
*obj,
> =20
>  =09=09if (colorop->plane)
>  =09=09=09WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
> +=09=09else
> +=09=09=09WARN_ON(!drm_modeset_is_locked(&colorop->crtc->mutex));
> =20
>  =09=09ret =3D drm_atomic_colorop_get_property(colorop,
>  =09=09=09=09colorop->state, property, val);
> @@ -1204,7 +1245,7 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  =09=09}
> =20
>  =09=09ret =3D drm_atomic_crtc_set_property(crtc,
> -=09=09=09=09crtc_state, prop, prop_value);
> +=09=09=09=09crtc_state, file_priv, prop, prop_value);
>  =09=09break;
>  =09}
>  =09case DRM_MODE_OBJECT_PLANE: {
> @@ -1604,6 +1645,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  =09state->acquire_ctx =3D &ctx;
>  =09state->allow_modeset =3D !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESE=
T);
>  =09state->plane_color_pipeline =3D file_priv->plane_color_pipeline;
> +=09state->post_blend_color_pipeline =3D file_priv->post_blend_color_pipe=
line;
> =20
>  retry:
>  =09copied_objs =3D 0;
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index a1b36cd488f0a014425a9192ffe5fcc4d2c1afaa..d53de1438d23def74a77730ca=
cd3651131e82cbe 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -90,8 +90,9 @@ static const struct drm_prop_enum_list drm_colorop_lut3=
d_interpolation_list[] =3D
> =20
>  /* Init Helpers */
> =20
> -static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop *colorop,
> -=09=09=09    struct drm_plane *plane, enum drm_colorop_type type, uint32=
_t flags)
> +static int drm_common_colorop_init(struct drm_device *dev,
> +=09=09=09=09   struct drm_colorop *colorop,
> +=09=09=09=09   enum drm_colorop_type type, uint32_t flags)
>  {
>  =09struct drm_mode_config *config =3D &dev->mode_config;
>  =09struct drm_property *prop;
> @@ -104,7 +105,6 @@ static int drm_plane_colorop_init(struct drm_device *=
dev, struct drm_colorop *co
>  =09colorop->base.properties =3D &colorop->properties;
>  =09colorop->dev =3D dev;
>  =09colorop->type =3D type;
> -=09colorop->plane =3D plane;
>  =09colorop->next =3D NULL;
> =20
>  =09list_add_tail(&colorop->head, &config->colorop_list);
> @@ -153,6 +153,34 @@ static int drm_plane_colorop_init(struct drm_device =
*dev, struct drm_colorop *co
>  =09return ret;
>  }
> =20
> +static int drm_crtc_colorop_init(struct drm_device *dev,
> +=09=09=09=09 struct drm_colorop *colorop,
> +=09=09=09=09 struct drm_crtc *crtc,
> +=09=09=09=09 enum drm_colorop_type type, uint32_t flags)
> +{
> +=09int ret;
> +
> +=09ret =3D drm_common_colorop_init(dev, colorop, type, flags);
> +
> +=09colorop->crtc =3D crtc;
> +
> +=09return ret;
> +}
> +
> +static int drm_plane_colorop_init(struct drm_device *dev,
> +=09=09=09=09  struct drm_colorop *colorop,
> +=09=09=09=09  struct drm_plane *plane,
> +=09=09=09=09  enum drm_colorop_type type, uint32_t flags)
> +{
> +=09int ret;
> +
> +=09ret =3D drm_common_colorop_init(dev, colorop, type, flags);
> +
> +=09colorop->plane =3D plane;
> +
> +=09return ret;
> +}
> +
>  /**
>   * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
>   *
> @@ -279,29 +307,16 @@ static int drm_colorop_create_data_prop(struct drm_=
device *dev, struct drm_color
>  =09return 0;
>  }
> =20
> -/**
> - * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> - *
> - * @dev: DRM device
> - * @colorop: The drm_colorop object to initialize
> - * @plane: The associated drm_plane
> - * @lut_size: LUT size supported by driver
> - * @lut1d_interpolation: 1D LUT interpolation type
> - * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> - * @return zero on success, -E value on failure
> - */
> -int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> -=09=09=09=09=09struct drm_plane *plane, uint32_t lut_size,
> -=09=09=09=09=09enum drm_colorop_lut1d_interpolation_type lut1d_interpola=
tion,
> -=09=09=09=09=09uint32_t flags)
> +static int
> +drm_common_colorop_curve_1d_lut_init(struct drm_device *dev,
> +=09=09=09=09     struct drm_colorop *colorop,
> +=09=09=09=09     uint32_t lut_size,
> +=09=09=09=09     enum drm_colorop_lut1d_interpolation_type lut1d_interpo=
lation,
> +=09=09=09=09     uint32_t flags)
>  {
>  =09struct drm_property *prop;
>  =09int ret;
> =20
> -=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LU=
T, flags);
> -=09if (ret)
> -=09=09return ret;
> -
>  =09/* initialize 1D LUT only attribute */
>  =09/* LUT size */
>  =09prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM=
_MODE_PROP_ATOMIC,
> @@ -333,17 +348,69 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_=
device *dev, struct drm_color
> =20
>  =09return 0;
>  }
> -EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
> =20
> -int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
> -=09=09=09=09   struct drm_plane *plane, uint32_t flags)
> +/**
> + * drm_crtc_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @crtc: The associated drm_crtc
> + * @lut_size: LUT size supported by driver
> + * @lut1d_interpolation: 1D LUT interpolation type
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int
> +drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev,
> +=09=09=09=09   struct drm_colorop *colorop,
> +=09=09=09=09   struct drm_crtc *crtc, uint32_t lut_size,
> +=09=09=09=09   enum drm_colorop_lut1d_interpolation_type lut1d_interpola=
tion,
> +=09=09=09=09   uint32_t flags)
>  {
>  =09int ret;
> =20
> -=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3=
X4, flags);
> +=09ret =3D drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_LUT,=
 flags);
>  =09if (ret)
>  =09=09return ret;
> =20
> +=09return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
> +=09=09=09=09=09=09    lut1d_interpolation, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_lut_init);
> +
> +/**
> + * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @lut_size: LUT size supported by driver
> + * @lut1d_interpolation: 1D LUT interpolation type
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int
> +drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_c=
olorop *colorop,
> +=09=09=09=09    struct drm_plane *plane, uint32_t lut_size,
> +=09=09=09=09    enum drm_colorop_lut1d_interpolation_type lut1d_interpol=
ation,
> +=09=09=09=09    uint32_t flags)
> +{
> +=09int ret;
> +
> +=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LU=
T, flags);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
> +=09=09=09=09=09=09    lut1d_interpolation, flags);
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
> +
> +static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struc=
t drm_colorop *colorop,
> +=09=09=09=09=09   uint32_t flags)
> +{
> +=09int ret;
> +
>  =09ret =3D drm_colorop_create_data_prop(dev, colorop);
>  =09if (ret)
>  =09=09return ret;
> @@ -352,6 +419,31 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device=
 *dev, struct drm_colorop *c
> =20
>  =09return 0;
>  }
> +
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_col=
orop *colorop,
> +=09=09=09=09   struct drm_crtc *crtc, uint32_t flags)
> +{
> +=09int ret;
> +
> +=09ret =3D drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_CTM_3X4=
, flags);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_ctm_3x4_init);
> +
> +int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
> +=09=09=09=09   struct drm_plane *plane, uint32_t flags)
> +{
> +=09int ret;
> +
> +=09ret =3D drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3=
X4, flags);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
> +}
>  EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
> =20
>  /**
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4d=
bb9ddbedf724dc7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, v=
oid *data,
>  =09 */
>  =09ret =3D drm_mode_object_get_properties(&connector->base, file_priv->a=
tomic,
>  =09=09=09file_priv->plane_color_pipeline,
> +=09=09=09file_priv->post_blend_color_pipeline,
>  =09=09=09(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
>  =09=09=09(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
>  =09=09=09&out_resp->count_props);
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003db2a1b43441434839e26f61d79b4e..94238163ff1254c721df39c03=
0bc99a31d3bb92a 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -959,3 +959,80 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *c=
rtc_state)
>  =09return hweight32(crtc_state->encoder_mask) > 1;
>  }
>  EXPORT_SYMBOL(drm_crtc_in_clone_mode);
> +
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct=
 drm_mode_object *obj,
> +=09=09=09=09=09  const struct drm_prop_enum_list *pipelines,
> +=09=09=09=09=09  int num_pipelines)
> +{
> +=09struct drm_prop_enum_list *all_pipelines;
> +=09struct drm_property *prop;
> +=09int len =3D 0;
> +=09int i;
> +
> +=09all_pipelines =3D kcalloc(num_pipelines + 1,
> +=09=09=09=09sizeof(*all_pipelines),
> +=09=09=09=09GFP_KERNEL);
> +
> +=09if (!all_pipelines) {
> +=09=09drm_err(dev, "failed to allocate color pipeline\n");
> +=09=09return ERR_PTR(-ENOMEM);
> +=09}
> +
> +=09/* Create default Bypass color pipeline */
> +=09all_pipelines[len].type =3D 0;
> +=09all_pipelines[len].name =3D "Bypass";
> +=09len++;
> +
> +=09/* Add all other color pipelines */
> +=09for (i =3D 0; i < num_pipelines; i++, len++) {
> +=09=09all_pipelines[len].type =3D pipelines[i].type;
> +=09=09all_pipelines[len].name =3D pipelines[i].name;
> +=09}
> +
> +=09prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +=09=09=09=09=09"COLOR_PIPELINE",
> +=09=09=09=09=09all_pipelines, len);
> +=09if (IS_ERR(prop)) {
> +=09=09kfree(all_pipelines);
> +=09=09return prop;
> +=09}
> +
> +=09drm_object_attach_property(obj, prop, 0);
> +
> +=09kfree(all_pipelines);
> +=09return prop;
> +}
> +
> +/**
> + * drm_crtc_create_color_pipeline_property - create a new color pipeline
> + * property
> + *
> + * @crtc: drm CRTC
> + * @pipelines: list of pipelines
> + * @num_pipelines: number of pipelines
> + *
> + * Create the COLOR_PIPELINE CRTC property to specify color pipelines on
> + * the CRTC.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +=09=09=09=09=09    const struct drm_prop_enum_list *pipelines,
> +=09=09=09=09=09    int num_pipelines)
> +{
> +=09struct drm_property *prop;
> +
> +=09prop =3D drm_common_create_color_pipeline_property(crtc->dev,
> +=09=09=09=09=09=09=09 &crtc->base,
> +=09=09=09=09=09=09=09 pipelines,
> +=09=09=09=09=09=09=09 num_pipelines);
> +=09if (IS_ERR(prop))
> +=09=09return PTR_ERR(prop);
> +
> +=09crtc->color_pipeline_property =3D prop;
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_color_pipeline_property);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index c094092296448093c5cd192ecdc8ea9a50769c90..c53f154e5392a10c326c844b7=
321666275f9ac02 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -35,6 +35,7 @@
>  #ifndef __DRM_CRTC_INTERNAL_H__
>  #define __DRM_CRTC_INTERNAL_H__
> =20
> +#include <drm/drm_property.h>
>  #include <linux/err.h>
>  #include <linux/types.h>
> =20
> @@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crt=
c,
>  int drm_crtc_register_all(struct drm_device *dev);
>  void drm_crtc_unregister_all(struct drm_device *dev);
>  int drm_crtc_force_disable(struct drm_crtc *crtc);
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct=
 drm_mode_object *obj,
> +=09=09=09=09=09  const struct drm_prop_enum_list *pipelines,
> +=09=09=09=09=09  int num_pipelines);
> =20
>  struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
> =20
> @@ -164,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device *de=
v,
>  =09=09=09=09struct drm_mode_object *object);
>  int drm_mode_object_get_properties(struct drm_mode_object *obj, bool ato=
mic,
>  =09=09=09=09   bool plane_color_pipeline,
> +=09=09=09=09   bool post_blend_color_pipeline,
>  =09=09=09=09   uint32_t __user *prop_ptr,
>  =09=09=09=09   uint64_t __user *prop_values,
>  =09=09=09=09   uint32_t *arg_count_props);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ff193155129e7e863888d8958458978566b144f8..2c81f63fee428ca85f3c626d8=
92ea6097b964e88 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -380,6 +380,13 @@ drm_setclientcap(struct drm_device *dev, void *data,=
 struct drm_file *file_priv)
>  =09=09=09return -EINVAL;
>  =09=09file_priv->plane_color_pipeline =3D req->value;
>  =09=09break;
> +=09case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
> +=09=09if (!file_priv->atomic)
> +=09=09=09return -EINVAL;
> +=09=09if (req->value > 1)
> +=09=09=09return -EINVAL;
> +=09=09file_priv->post_blend_color_pipeline =3D req->value;
> +=09=09break;
>  =09default:
>  =09=09return -EINVAL;
>  =09}
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode=
_object.c
> index b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..c9e20d12e8fd311f71b9d6bc8=
d575624751d33ad 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
>  /* helper for getconnector and getproperties ioctls */
>  int drm_mode_object_get_properties(struct drm_mode_object *obj, bool ato=
mic,
>  =09=09=09=09   bool plane_color_pipeline,
> +=09=09=09=09   bool post_blend_color_pipeline,
>  =09=09=09=09   uint32_t __user *prop_ptr,
>  =09=09=09=09   uint64_t __user *prop_values,
>  =09=09=09=09   uint32_t *arg_count_props)
> @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_o=
bject *obj, bool atomic,
>  =09=09=09=09continue;
>  =09=09}
> =20
> +=09=09if (post_blend_color_pipeline && obj->type =3D=3D DRM_MODE_OBJECT_=
CRTC) {
> +=09=09=09struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +=09=09=09struct drm_mode_config mode_config =3D crtc->dev->mode_config;
> +
> +=09=09=09if (prop =3D=3D mode_config.gamma_lut_property ||
> +=09=09=09    prop =3D=3D mode_config.degamma_lut_property ||
> +=09=09=09    prop =3D=3D mode_config.gamma_lut_size_property ||
> +=09=09=09    prop =3D=3D mode_config.ctm_property)
> +=09=09=09=09continue;
> +=09=09}
> +
> +=09=09if (!post_blend_color_pipeline && obj->type =3D=3D DRM_MODE_OBJECT=
_CRTC) {
> +=09=09=09struct drm_crtc *crtc =3D obj_to_crtc(obj);
> +
> +=09=09=09if (prop =3D=3D crtc->color_pipeline_property)
> +=09=09=09=09continue;
> +=09=09}
> +
>  =09=09if (*arg_count_props > count) {
>  =09=09=09ret =3D __drm_object_property_get_value(obj, prop, &val);
>  =09=09=09if (ret)
> @@ -475,6 +494,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_devi=
ce *dev, void *data,
> =20
>  =09ret =3D drm_mode_object_get_properties(obj, file_priv->atomic,
>  =09=09=09file_priv->plane_color_pipeline,
> +=09=09=09file_priv->post_blend_color_pipeline,
>  =09=09=09(uint32_t __user *)(unsigned long)(arg->props_ptr),
>  =09=09=09(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
>  =09=09=09&arg->count_props);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index f6cfa8ac090c7bc49c7f276993bba7e9800da140..60dbfcab495600dd44c15260a=
1fa6135db59c6e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1839,43 +1839,17 @@ int drm_plane_create_color_pipeline_property(stru=
ct drm_plane *plane,
>  =09=09=09=09=09     const struct drm_prop_enum_list *pipelines,
>  =09=09=09=09=09     int num_pipelines)
>  {
> -=09struct drm_prop_enum_list *all_pipelines;
>  =09struct drm_property *prop;
> -=09int len =3D 0;
> -=09int i;
> -
> -=09all_pipelines =3D kcalloc(num_pipelines + 1,
> -=09=09=09=09sizeof(*all_pipelines),
> -=09=09=09=09GFP_KERNEL);
> -
> -=09if (!all_pipelines) {
> -=09=09drm_err(plane->dev, "failed to allocate color pipeline\n");
> -=09=09return -ENOMEM;
> -=09}
> =20
> -=09/* Create default Bypass color pipeline */
> -=09all_pipelines[len].type =3D 0;
> -=09all_pipelines[len].name =3D "Bypass";
> -=09len++;
> -
> -=09/* Add all other color pipelines */
> -=09for (i =3D 0; i < num_pipelines; i++, len++) {
> -=09=09all_pipelines[len].type =3D pipelines[i].type;
> -=09=09all_pipelines[len].name =3D pipelines[i].name;
> -=09}
> -
> -=09prop =3D drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
> -=09=09=09=09=09"COLOR_PIPELINE",
> -=09=09=09=09=09all_pipelines, len);
> -=09if (IS_ERR(prop)) {
> -=09=09kfree(all_pipelines);
> +=09prop =3D drm_common_create_color_pipeline_property(plane->dev,
> +=09=09=09=09=09=09=09 &plane->base,
> +=09=09=09=09=09=09=09 pipelines,
> +=09=09=09=09=09=09=09 num_pipelines);
> +=09if (IS_ERR(prop))
>  =09=09return PTR_ERR(prop);
> -=09}
> =20
> -=09drm_object_attach_property(&plane->base, prop, 0);
>  =09plane->color_pipeline_property =3D prop;
> =20
> -=09kfree(all_pipelines);
>  =09return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 678708df9cdb90b4266127193a92183069f18688..8c42c584aefbf0034b2163d90=
538e80099b0dadb 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -482,6 +482,26 @@ struct drm_atomic_state {
>  =09 */
>  =09bool plane_color_pipeline : 1;
> =20
> +=09/**
> +=09 * @post_blend_color_pipeline:
> +=09 *
> +=09 * Indicates whether this atomic state originated with a client that
> +=09 * set the DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE.
> +=09 *
> +=09 * Drivers and helper functions should use this to ignore legacy
> +=09 * properties that are incompatible with the drm_crtc COLOR_PIPELINE
> +=09 * behavior, such as:
> +=09 *
> +=09 *  - GAMMA_LUT
> +=09 *  - DEGAMMA_LUT
> +=09 *  - GAMMA_LUT_SIZE
> +=09 *  - CTM
> +=09 *
> +=09 * or any other driver-specific properties that might affect pixel
> +=09 * values.
> +=09 */
> +=09bool post_blend_color_pipeline : 1;
> +
>  =09/**
>  =09 * @colorops:
>  =09 *
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.=
h
> index 4363155233267b93767c895fa6085544e2277442..4dc191f6f929d73deee981202=
5c48275a33cf770 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -52,6 +52,8 @@ void drm_atomic_set_fb_for_plane(struct drm_plane_state=
 *plane_state,
>  =09=09=09=09 struct drm_framebuffer *fb);
>  void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_stat=
e,
>  =09=09=09=09      struct drm_colorop *colorop);
> +void drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
> +=09=09=09=09     struct drm_colorop *colorop);
>  int __must_check
>  drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state=
,
>  =09=09=09=09  struct drm_crtc *crtc);
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index d61c6c40e47162cb8b1e7db58b6746c43ac5d202..710a6199ebc5498a3f664de39=
ea07dbc95944eb7 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -206,10 +206,16 @@ struct drm_colorop {
>  =09/**
>  =09 * @plane:
>  =09 *
> -=09 * The plane on which the colorop sits. A drm_colorop is always uniqu=
e
> -=09 * to a plane.
> +=09 * The plane on which the colorop sits if it is a pre-blend colorop.
> +=09 * In this case it is unique to the plane.
> +=09 *
> +=09 * @crtc:
> +=09 *
> +=09 * The CRTC on which the colorop sits if it is a post-blend colorop.
> +=09 * In this case it is unique to the CRTC.
>  =09 */
>  =09struct drm_plane *plane;
> +=09struct drm_crtc *crtc;
> =20
>  =09/**
>  =09 * @state:
> @@ -370,6 +376,10 @@ static inline struct drm_colorop *drm_colorop_find(s=
truct drm_device *dev,
> =20
>  void drm_colorop_pipeline_destroy(struct drm_device *dev);
> =20
> +int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct dr=
m_colorop *colorop,
> +=09=09=09=09       struct drm_crtc *crtc, uint32_t lut_size,
> +=09=09=09=09       enum drm_colorop_lut1d_interpolation_type lut1d_inter=
polation,
> +=09=09=09=09       uint32_t flags);
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_c=
olorop *colorop,
>  =09=09=09=09    struct drm_plane *plane, u64 supported_tfs, uint32_t fla=
gs);
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct d=
rm_colorop *colorop,
> @@ -378,6 +388,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_de=
vice *dev, struct drm_color
>  =09=09=09=09=09uint32_t flags);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_co=
lorop *colorop,
>  =09=09=09=09   struct drm_plane *plane, uint32_t flags);
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_col=
orop *colorop,
> +=09=09=09=09   struct drm_crtc *crtc, uint32_t flags);
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op *colorop,
>  =09=09=09=09struct drm_plane *plane, uint32_t flags);
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop *colorop,
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a748cf40ebf45b37158acda439d9..df03637ca25abd45e96b59442=
29297f776fd046d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,14 @@ struct drm_crtc_state {
>  =09 */
>  =09struct drm_property_blob *gamma_lut;
> =20
> +=09/**
> +=09 * @color_pipeline:
> +=09 *
> +=09 * The first colorop of the active color pipeline, or NULL, if no
> +=09 * color pipeline is active.
> +=09 */
> +=09struct drm_colorop *color_pipeline;
> +
>  =09/**
>  =09 * @target_vblank:
>  =09 *
> @@ -1088,6 +1096,14 @@ struct drm_crtc {
>  =09 */
>  =09struct drm_property *scaling_filter_property;
> =20
> +=09/**
> +=09 * @color_pipeline_property:
> +=09 *
> +=09 * Optional "COLOR_PIPELINE" enum property for specifying
> +=09 * a color pipeline to use on the CRTC.
> +=09 */
> +=09struct drm_property *color_pipeline_property;
> +
>  =09/**
>  =09 * @state:
>  =09 *
> @@ -1323,5 +1339,8 @@ static inline struct drm_crtc *drm_crtc_find(struct=
 drm_device *dev,
> =20
>  int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>  =09=09=09=09=09    unsigned int supported_filters);
> +int drm_crtc_create_color_pipeline_property(struct drm_crtc *crtc,
> +=09=09=09=09=09     const struct drm_prop_enum_list *pipelines,
> +=09=09=09=09=09     int num_pipelines);
>  bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
>  #endif /* __DRM_CRTC_H__ */
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 1a3018e4a537b3341acb50187d47371f6b781b9d..42b9a43baa18079af8ec2ea5b=
1484b23c497beb0 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -213,6 +213,13 @@ struct drm_file {
>  =09 */
>  =09bool plane_color_pipeline;
> =20
> +=09/**
> +=09 * @post_blend_color_pipeline:
> +=09 *
> +=09 * True if client understands post-blend color pipelines
> +=09 */
> +=09bool post_blend_color_pipeline;
> +
>  =09/**
>  =09 * @was_master:
>  =09 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d275c7a7fe057840ef792f30a582bb7..1191b142ebaa5478376308f16=
9f9ce8591580d9d 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -921,6 +921,22 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE=097
> =20
> +/**
> + * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
> + *
> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> + * property on a &drm_crtc, as well as drm_colorop properties.
> + *
> + * Setting of these crtc properties will be rejected when this client
> + * cap is set:
> + * - GAMMA_LUT
> + * - DEGAMMA_LUT
> + * - CTM
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + */
> +#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE=098
> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  =09__u64 capability;

