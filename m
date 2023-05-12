Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A0700907
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D63D10E6B3;
	Fri, 12 May 2023 13:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0761710E6B2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:20:23 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-55a5e0f5b1aso97318297b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897622; x=1686489622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1ufTI0N/A8HGHpsL+5b5N6TDgFlJEMJVUrvN/3+6Z8=;
 b=QWYNohvJzTmJ6q30YpRS8FTgZPSycw88I72yrG+4iM9NQEdvurffkd8ouvc6RS1BhT
 wYDrjmTzMYQPLIyElWLXnonVETgBeuMFQ43WDXyGD7OpZPQ9hweZq/LeYe2v0jAB70l/
 owWHr5LkRHvwZWUtIKr1edL/p0j4Lj82osgABrXBsSHDYQhwIoiRwgjpg2g8TcdX+iDn
 YbjqV5tkhc0WTuG06uddYRysNAmplW4SgJc/8KnaIupcyi8lSfm9O74wULEOjC1/Z7Hg
 9yC7tX6fnIrA5OZ6qHTbb/4CCA7m/WYSqjMq+rd/Hj1TLodVpPwNDcU/eJqXzRHzojbQ
 uQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897622; x=1686489622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1ufTI0N/A8HGHpsL+5b5N6TDgFlJEMJVUrvN/3+6Z8=;
 b=ItBO+QdZtL7neAyRIOlpKmGHI12TeJ60/ffPH1Hk0Ni/wQPMsc0rZA1ps8ocSuNNz+
 yx3+xR0hIrKGAeYSLGSCXN/O9tVOMNxzaLPvv5XkLQonmF4fIwwXV4VDukQ9qOlRXVzY
 gM5/wgrPXRn1R9yzH4PIvJQU4DGQi/fFM9ILOq5zcdZ8N4yvi+7sy/DS7Fv9YzQ1jPE5
 GHJTNeiMx+OF+tA23Wwrj0SE073e54PN3O/5VXKepXazHNEEwEKgOdsMPOj+fr4/Q9ug
 kgwGtvZJF2G//TtK4MGiq1PHhJRvbyh5ULHYXlPEKEInLBvV2RuaUkxGxypZfrS4l2fJ
 uEHg==
X-Gm-Message-State: AC+VfDx5BkmnQJvs9tqcRCTI/x+/ZPCX6e30l3GvtLpoYRZgxXtqn0e5
 hbILiHJMbfDG75XzdzsmWiag6pSqZbAHqOUqu89xWg==
X-Google-Smtp-Source: ACHHUZ4FgTKnRcizzvuJHbXx0AUa2LC8h+NkYcZvuVzEViTBNa5PLLiGvAvRN495BEDo/Y8l17i/YU1Hz3rhY1qiln4=
X-Received: by 2002:a81:5b41:0:b0:55a:59cb:4c1a with SMTP id
 p62-20020a815b41000000b0055a59cb4c1amr24094471ywb.14.1683897622455; Fri, 12
 May 2023 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
In-Reply-To: <20230102112927.26565-12-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 May 2023 15:20:11 +0200
Message-ID: <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: javierm@redhat.com, mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for late regression detection but this patch regresses
the Integrator AB IMPD-1 graphics, I bisected down to this
patch.

On Mon, Jan 2, 2023 at 12:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Fix the color-format selection of the single-probe helper. Go
> through all user-specified values and test each for compatibility
> with the driver. If none is supported, use the driver-provided
> default. This guarantees that the console is always available in
> any color format at least.
>
> Until now, the format selection of the single-probe helper tried
> to either use a user-specified format or a 32-bit default format.
> If the user-specified format was not supported by the driver, the
> selection failed and the display remained blank.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Before this patch:

[drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
drm-clcd-pl111 c1000000.display: [drm] requested bpp 16, scaled depth down =
to 15
drm-clcd-pl111 c1000000.display: enable IM-PD1 CLCD connectors
Console: switching to colour frame buffer device 80x30
drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer device

After this patch:

[drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
drm-clcd-pl111 c1000000.display: [drm] bpp/depth value of 16/16 not support=
ed
drm-clcd-pl111 c1000000.display: [drm] No compatible format found
drm-clcd-pl111 c1000000.display: [drm] *ERROR* fbdev: Failed to setup
generic emulation (ret=3D-12)

It seems the bpp downscaling stopped to work?

This is the driver:
drivers/gpu/drm/pl111/pl111_versatile.c
with the pl110_impd1 variant, so these are the supported modes:

/* PL110 pixel formats for Integrator, vanilla PL110 */
static const u32 pl110_integrator_pixel_formats[] =3D {
        DRM_FORMAT_ABGR8888,
        DRM_FORMAT_XBGR8888,
        DRM_FORMAT_ARGB8888,
        DRM_FORMAT_XRGB8888,
        DRM_FORMAT_ABGR1555,
        DRM_FORMAT_XBGR1555,
        DRM_FORMAT_ARGB1555,
        DRM_FORMAT_XRGB1555,
};
(...)
/*
 * The IM-PD1 variant is a PL110 with a bunch of broken, or not
 * yet implemented features
 */
static const struct pl111_variant_data pl110_impd1 =3D {
        .name =3D "PL110 IM-PD1",
        .is_pl110 =3D true,
        .broken_clockdivider =3D true,
        .broken_vblank =3D true,
        .formats =3D pl110_integrator_pixel_formats,
        .nformats =3D ARRAY_SIZE(pl110_integrator_pixel_formats),
        .fb_bpp =3D 16,
};

Notice the absence of RGB565!
Then we initialized the frambuffer like this:

        drm_fbdev_dma_setup(drm, priv->variant->fb_bpp);

And as you see priv->variant->fb_bpp will be 16, so we want some
16bpp mode however the only supported depth is 15 (the 1555 modes)
so it would use that by scaling back depth to 15.

However after this patch that doesn't work anymore.

Any hints on how we can fix this?

Yours,
Linus Walleij
