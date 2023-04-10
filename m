Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8BB6DC522
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 11:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567310E0AA;
	Mon, 10 Apr 2023 09:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DED10E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 09:36:12 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-54e40113cf3so128620547b3.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 02:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681119371;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FHSMM1KvEHdmSEiK3Kz5ib8QCRDoCzAK4drVjX0gWY8=;
 b=qqXhWoisDmj64EjgyB9DWvF5461ZOVpuNZSjpQHp5fV2Tx3KcJMan/tmBSRAQTZgem
 uN3GWh7dOjLD4VbtJXjPotoAAi7BMQawEWHzJeFK6HmOUl/RLBCkAdNkovg/pYsRjWzc
 6LIwQvOWi/mRrl/0OrNm4CZ90iknKJl+KFqN22qWtpTzkd3FE8aSRfSCusVsh5b43FGP
 OUhVTuoeg28GgLnSihSLSn6/J/HgJy2hfhhh1+az3tI0D5xNXQGpPKre2fDn+xz0kjBH
 mv370PLdonD30ybgDSbHkBEN8TsbmC+UGpfo8DG2s/MuBKal3l3hqf7CZmZ1uxVhtusi
 MOXQ==
X-Gm-Message-State: AAQBX9fE/KrYUc6l4FWeJymjFW9WqVFVfa482cF4lp0uueY2Rc6Zp6i+
 ZFCa+1S360Z7a8qk/88jIao2kiej/fSqog==
X-Google-Smtp-Source: AKy350YuWjO0R2IrIiTgoaTiTBWwgcwEa2LnSumofv6Xgm1LuLLZBNcRCEFGGzmue/6esL0LjWxalw==
X-Received: by 2002:a0d:ea4b:0:b0:54e:d9df:7e48 with SMTP id
 t72-20020a0dea4b000000b0054ed9df7e48mr5637964ywe.21.1681119370752; 
 Mon, 10 Apr 2023 02:36:10 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 f10-20020a81414a000000b00545a08184desm2700216ywk.110.2023.04.10.02.36.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 02:36:10 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id z9so3971700ybs.9
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 02:36:10 -0700 (PDT)
X-Received: by 2002:a25:df0b:0:b0:b75:9519:dbcd with SMTP id
 w11-20020a25df0b000000b00b759519dbcdmr6808406ybg.12.1681119369989; Mon, 10
 Apr 2023 02:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680273039.git.geert+renesas@glider.be>
 <df4099d79c985c73bdc890eb0e026494b7fa5c96.1680273039.git.geert+renesas@glider.be>
 <20230405035952.GI9915@pendragon.ideasonboard.com>
In-Reply-To: <20230405035952.GI9915@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Apr 2023 11:35:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMEVYRr9oYBB=50WJtM4St1UfVkGMw09dchjgoUC2Q6A@mail.gmail.com>
Message-ID: <CAMuHMdUMEVYRr9oYBB=50WJtM4St1UfVkGMw09dchjgoUC2Q6A@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm: shmobile: Switch to drm_crtc_init_with_planes()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for your comments!

On Wed, Apr 5, 2023 at 5:59=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Mar 31, 2023 at 04:48:09PM +0200, Geert Uytterhoeven wrote:
> > The SH-Mobile DRM driver uses the legacy drm_crtc_init(), which
> > advertizes only the formats in safe_modeset_formats[] (XR24 and AR24) a=
s
> > being supported.
> >
> > Switch to drm_crtc_init_with_planes(), and advertize all supported
> > (A)RGB modes, so we can use RGB565 as the default mode for the console.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> > +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> > @@ -18,6 +18,7 @@
> >  #include <drm/drm_gem_dma_helper.h>
> >  #include <drm/drm_modeset_helper.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> > +#include <drm/drm_plane_helper.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -478,16 +479,41 @@ static const struct drm_crtc_funcs crtc_funcs =3D=
 {
> >       .disable_vblank =3D shmob_drm_disable_vblank,
> >  };
> >
> > +static const uint32_t modeset_formats[] =3D {
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static const struct drm_plane_funcs primary_plane_funcs =3D {
> > +     DRM_PLANE_NON_ATOMIC_FUNCS,
> > +};
> > +
> >  int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
> >  {
> >       struct drm_crtc *crtc =3D &sdev->crtc.crtc;
> > +     struct drm_plane *primary;
> >       int ret;
> >
> >       sdev->crtc.dpms =3D DRM_MODE_DPMS_OFF;
> >
> > -     ret =3D drm_crtc_init(sdev->ddev, crtc, &crtc_funcs);
> > -     if (ret < 0)
> > +     primary =3D __drm_universal_plane_alloc(sdev->ddev, sizeof(*prima=
ry), 0,
> > +                                           0, &primary_plane_funcs,
> > +                                           modeset_formats,
> > +                                           ARRAY_SIZE(modeset_formats)=
,
> > +                                           NULL, DRM_PLANE_TYPE_PRIMAR=
Y,
> > +                                           NULL);
> > +     if (IS_ERR(primary))
> > +             return PTR_ERR(primary);
>
> This seems like a bit of a hack to me. Why don't you use the planes

I'm following what Thomas did in the nouveau driver....

> created by shmob_drm_plane_create() instead of allocating a new one ?

Is that possible? shmob_drm_plane_create() creates overlay planes,
while this is for the primary plane.

>
> > +
> > +     ret =3D drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL=
,
> > +                                     &crtc_funcs, NULL);
> > +     if (ret < 0) {
> > +             drm_plane_cleanup(primary);
> > +             kfree(primary);
> >               return ret;
> > +     }
> >
> >       drm_crtc_helper_add(crtc, &crtc_helper_funcs);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
