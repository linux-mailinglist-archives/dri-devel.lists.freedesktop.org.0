Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A436914C773
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386B36F49F;
	Wed, 29 Jan 2020 08:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55E36F49A;
 Wed, 29 Jan 2020 08:26:01 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id q190so8340491ybq.2;
 Wed, 29 Jan 2020 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgF2vmhz2T7IeFLxb2F117QIdy1NFOJJsX193BxkqOw=;
 b=dSNO9wjN2SsIBCH49OqTw/A/PZDqYOhzfrV2bZZqib4KDx0TSD+ni80dMEBk59atxI
 N/H3dy3x9h6l8+GyOFyfyhKzsiNKl92xMtTEqSEvQxQktrQ/g/i3fyKSkV2XlzQQXedG
 9RYuTGVZ9dltnlbFbN6Z3xrsbt26kFKGreKDHGEtBdu6kUzxb3/R+7WvQ27byrztsof5
 a0pOa1tq1O25hD0B/wAnZTeTU3TVu/K3D3pFDFgILT8dfi6xdRkVpw0ZGqusli/vHMMs
 JiOgO4MTQ5p4pkgqTFjrlq6i2a3O0xfuYOgtw/7CZftq7P3zwKz8rTO3xrog1fcCGHJk
 6nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgF2vmhz2T7IeFLxb2F117QIdy1NFOJJsX193BxkqOw=;
 b=OMExpqIiP9lyTBXwfdugj+XezqIOw0yha4IgEWWbq/J59SgmDAwt/r0QQL99wVdb/D
 czCL/PnPap0i8zho8ljTWU2xHF/gYBuXzYe4GKJBr6IGqVFxqjehElLC1DTYlzmgBDhZ
 hiWPH/1pMdi8CmQub75xhoHBm5QjMW2IUlFoUnUX0g7u8D/Nvkiy5ykg8ZQVt7sD1GY9
 GWbOR4jsFMcbrX3Nh0d5oSHrJEPiekzjAsqlZQ9dBwYsgO0qucbf+6bSx5VIldG/RAQ5
 +4qcgrGlVYlwcWsi9pApsnVhvyb7G87ALn19ZpOwoPLxPvv9qVoyqSKW1EKzPDoEp7U6
 OE4w==
X-Gm-Message-State: APjAAAXt9tBhHUdpyOrdphl0EaUobxUN4QaxclflLSpBXKEUOfrLmEPo
 zeGIM/0JP8WfQbUG1yYztgLmpIm4EU/GPoxmgWc=
X-Google-Smtp-Source: APXvYqyVyK9PjCztHzRXzGqMcg86H7OYSIU9PnLCzOGfOIj82VVVgpuSOxqUS6U+h720ew60ng17+3R2jqUohlRgOEg=
X-Received: by 2002:a25:69c9:: with SMTP id
 e192mr19401976ybc.162.1580286361002; 
 Wed, 29 Jan 2020 00:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20200123135943.24140-1-tzimmermann@suse.de>
 <20200123135943.24140-10-tzimmermann@suse.de>
In-Reply-To: <20200123135943.24140-10-tzimmermann@suse.de>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jan 2020 18:25:49 +1000
Message-ID: <CACAvsv4Yp99w845A8kERpnx+mSax16PLzEBx-uEpZyfAoLu_Qg@mail.gmail.com>
Subject: Re: [PATCH v4 09/22] drm/nouveau: Convert to CRTC VBLANK callbacks
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, Dave Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, alexandre.torgue@st.com,
 thellstrom@vmware.com, sean@poorly.run, linux-graphics-maintainer@vmware.com,
 Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, rodrigosiqueiramelo@gmail.com,
 philippe.cornu@st.com, yannick.fertre@st.com,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jan 2020 at 00:00, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert nouvean over.
>
> v4:
>         * add argument names in function declaration
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  3 +++
>  drivers/gpu/drm/nouveau/dispnv50/head.c   |  4 ++++
>  drivers/gpu/drm/nouveau/nouveau_display.c | 14 ++------------
>  drivers/gpu/drm/nouveau/nouveau_display.h |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_drm.c     |  4 ----
>  5 files changed, 11 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 17e9d1c078a0..1f08de4241e0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1248,6 +1248,9 @@ static const struct drm_crtc_funcs nv04_crtc_funcs = {
>         .set_config = drm_crtc_helper_set_config,
>         .page_flip = nv04_crtc_page_flip,
>         .destroy = nv_crtc_destroy,
> +       .enable_vblank = nouveau_display_vblank_enable,
> +       .disable_vblank = nouveau_display_vblank_disable,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 41852dd8fdbd..8f6455697ba7 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -29,6 +29,7 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_vblank.h>
>  #include "nouveau_connector.h"
>  void
>  nv50_head_flush_clr(struct nv50_head *head,
> @@ -482,6 +483,9 @@ nv50_head_func = {
>         .page_flip = drm_atomic_helper_page_flip,
>         .atomic_duplicate_state = nv50_head_atomic_duplicate_state,
>         .atomic_destroy_state = nv50_head_atomic_destroy_state,
> +       .enable_vblank = nouveau_display_vblank_enable,
> +       .disable_vblank = nouveau_display_vblank_disable,
> +       .get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
>  };
>
>  struct nv50_head *
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 86f99dc8fcef..700817dc4fa0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -54,15 +54,10 @@ nouveau_display_vblank_handler(struct nvif_notify *notify)
>  }
>
>  int
> -nouveau_display_vblank_enable(struct drm_device *dev, unsigned int pipe)
> +nouveau_display_vblank_enable(struct drm_crtc *crtc)
>  {
> -       struct drm_crtc *crtc;
>         struct nouveau_crtc *nv_crtc;
>
> -       crtc = drm_crtc_from_index(dev, pipe);
> -       if (!crtc)
> -               return -EINVAL;
> -
>         nv_crtc = nouveau_crtc(crtc);
>         nvif_notify_get(&nv_crtc->vblank);
>
> @@ -70,15 +65,10 @@ nouveau_display_vblank_enable(struct drm_device *dev, unsigned int pipe)
>  }
>
>  void
> -nouveau_display_vblank_disable(struct drm_device *dev, unsigned int pipe)
> +nouveau_display_vblank_disable(struct drm_crtc *crtc)
>  {
> -       struct drm_crtc *crtc;
>         struct nouveau_crtc *nv_crtc;
>
> -       crtc = drm_crtc_from_index(dev, pipe);
> -       if (!crtc)
> -               return;
> -
>         nv_crtc = nouveau_crtc(crtc);
>         nvif_notify_put(&nv_crtc->vblank);
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
> index 26d34f1a77da..de004018ab5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> @@ -61,8 +61,8 @@ int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
>  void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
>  int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
>  void nouveau_display_resume(struct drm_device *dev, bool runtime);
> -int  nouveau_display_vblank_enable(struct drm_device *, unsigned int);
> -void nouveau_display_vblank_disable(struct drm_device *, unsigned int);
> +int  nouveau_display_vblank_enable(struct drm_crtc *crtc);
> +void nouveau_display_vblank_disable(struct drm_crtc *crtc);
>  bool nouveau_display_scanoutpos(struct drm_crtc *crtc,
>                                 bool in_vblank_irq, int *vpos, int *hpos,
>                                 ktime_t *stime, ktime_t *etime,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index fcc036a08965..6b1629c14dd7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1120,10 +1120,6 @@ driver_stub = {
>         .debugfs_init = nouveau_drm_debugfs_init,
>  #endif
>
> -       .enable_vblank = nouveau_display_vblank_enable,
> -       .disable_vblank = nouveau_display_vblank_disable,
> -       .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
> -
>         .ioctls = nouveau_ioctls,
>         .num_ioctls = ARRAY_SIZE(nouveau_ioctls),
>         .fops = &nouveau_driver_fops,
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
