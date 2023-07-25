Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB95762225
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 21:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9188B10E009;
	Tue, 25 Jul 2023 19:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA2010E009
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 19:22:08 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-583fe10bb3cso27619367b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 12:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690312927; x=1690917727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=At/a1Bt299KhNXNnEBcJxXMKWJIL0grBYXNr14vGJ30=;
 b=Uh3TtsLFW4s/xGTwszm5x95UqqMhdfNswQdqCZZTA0w0vVbbItsUi9W/6zUTvSt4fj
 2LkqBdgbcVMB4/Sm7vEthsH/cs6vQg/78qdimdlk71/mykHNRjzIdM5TKX+vPUbEpS6S
 bCAVOaSGGFdNI6BS2zwHvkwegK0HQQZ63B5ep40GV4IE1CSPmKM5eFVfyvI6QjitQJpG
 rMHg50zet+ml+X831xPc6QGQCGgzccuhw5JSJVEIfYn/RBlT3nqrhw+V3H/DlJhEmZIA
 WvirvUduStpwLPUQjgFKhEea3iCTO3mckxPCY7E8wRDpWE6+fWR0JIwSSVKrpTsqfNQc
 XkkQ==
X-Gm-Message-State: ABy/qLZYqmljdHUJPL/jzTE1acHTrVmJw9wrFToZleMPzAjcD/OaeNcS
 fmsUWPomW/4JWVVmAAtvwOgfTBTY2V4vXw==
X-Google-Smtp-Source: APBJJlHSfoQGvmePzDkua/7a37pdom4CCU8+yj0JHEGgHeL9QFJZi627gJTdedUlBURvI4IwL8ZXuA==
X-Received: by 2002:a0d:c202:0:b0:57a:f72:ebf8 with SMTP id
 e2-20020a0dc202000000b0057a0f72ebf8mr102716ywd.28.1690312927016; 
 Tue, 25 Jul 2023 12:22:07 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 g198-20020a8152cf000000b005773ac21cdbsm3671583ywb.106.2023.07.25.12.22.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 12:22:05 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d074da73c7dso4464699276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 12:22:05 -0700 (PDT)
X-Received: by 2002:a25:1882:0:b0:c76:173c:6718 with SMTP id
 124-20020a251882000000b00c76173c6718mr12051757yby.1.1690312925095; Tue, 25
 Jul 2023 12:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230721070955.1170974-1-javierm@redhat.com>
In-Reply-To: <20230721070955.1170974-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jul 2023 21:21:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
Message-ID: <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

Thanks for your patch!

On Fri, Jul 21, 2023 at 9:10=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert reports that the following NULL pointer dereference happens for him
> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
> plane update"):
>
>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
>     and format(R1   little-endian (0x20203152))
>     Unable to handle kernel NULL pointer dereference at virtual address 0=
0000000
>     Oops [#1]
>     CPU: 0 PID: 1 Comm: swapper Not tainted
>     6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>     ...
>     status: 00000120 badaddr: 00000000 cause: 0000000f
>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>     [<c02f94fc>] commit_tail+0x190/0x1b8
>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
>     [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
>     [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
>     [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
>     [<c02cd064>] drm_client_modeset_commit+0x34/0x64
>     [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
>     [<c0303424>] drm_fb_helper_set_par+0x38/0x58
>     [<c027c410>] fbcon_init+0x294/0x534
>     ...
>
> The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
> and this leads to drm_atomic_helper_commit_planes() attempting to commit
> the atomic state for all planes, even the ones whose CRTC is not enabled.
>
> Since the primary plane buffer is allocated in the encoder .atomic_enable
> callback, this happens after that initial modeset commit and leads to the
> mentioned NULL pointer dereference.

Upon further investigation, the NULL pointer dereference does not
happen with the current and accepted code (only with my patches to
add support for R1), because of the "superfluous" NULL buffer check
in ssd130x_fb_blit_rect():
https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/solomon/ssd130x.=
c#n592

So you probably want to drop the crash report...

> Fix this by having custom helpers to allocate, duplicate and destroy the
> plane state, that will take care of allocating and freeing these buffers.
>
> Instead of doing it in the encoder atomic enabled and disabled callbacks,
> since allocations must not be done in an .atomic_enable handler. Because
> drivers are not allowed to fail after drm_atomic_helper_swap_state() has
> been called and the new atomic state is stored into the current sw state.
>
> Fixes: 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each plane u=
pdate")

... and the Fixes tag.

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Regardless, avoiding calls to ssd130x_fb_blit_rect() when the buffer
is not yet allocated is worthwhile.  And this patch achieves that.

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Still, some comments below.

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -141,12 +141,26 @@ const struct ssd130x_deviceinfo ssd130x_variants[] =
=3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
>
> +struct ssd130x_plane_state {
> +       struct drm_plane_state base;
> +       /* Intermediate buffer to convert pixels from XRGB8888 to R1 */
> +       u8 *buffer;
> +       /* Buffer that contains R1 pixels to be written to the panel */
> +       u8 *data_array;

The second buffer actually contains pixels in hardware format.
For now that is a transposed buffer of R1 pixels, but that will change
when you will add support for greyscale displays.

So I'd write "hardware format" instead of R1 for both.

BTW, I still think data_array should be allocated during probing,
as it is related to the hardware, not to a plane.

> +};

> @@ -159,23 +173,23 @@ static int ssd130x_buf_alloc(struct ssd130x_device =
*ssd130x)
>
>         pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
>
> -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNEL);
> -       if (!ssd130x->buffer)
> +       ssd130x_state->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KER=
NEL);
> +       if (!ssd130x_state->buffer)
>                 return -ENOMEM;
>
> -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_KERNEL=
);
> -       if (!ssd130x->data_array) {
> -               kfree(ssd130x->buffer);
> +       ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages, GFP_=
KERNEL);
> +       if (!ssd130x_state->data_array) {
> +               kfree(ssd130x_state->buffer);

Should ssd130x_state->buffer be reset to NULL here?
I.e. if .atomic_check() fails, will .atomic_destroy_state() be called,
leading to a double free?

>                 return -ENOMEM;
>         }
>
>         return 0;
>  }

> @@ -576,18 +593,21 @@ static void ssd130x_clear_screen(struct ssd130x_dev=
ice *ssd130x)
>                 .y2 =3D ssd130x->height,
>         };
>
> -       ssd130x_update_rect(ssd130x, &fullscreen);
> +       ssd130x_update_rect(ssd130x, ssd130x_state, &fullscreen);
>  }
>
> -static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct=
 iosys_map *vmap,
> +static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
> +                               const struct iosys_map *vmap,
>                                 struct drm_rect *rect)
>  {
> +       struct drm_framebuffer *fb =3D state->fb;
>         struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_st=
ate(state);
>         unsigned int page_height =3D ssd130x->device_info->page_height;
>         struct iosys_map dst;
>         unsigned int dst_pitch;
>         int ret =3D 0;
> -       u8 *buf =3D ssd130x->buffer;
> +       u8 *buf =3D ssd130x_state->buffer;
>
>         if (!buf)

This check should no longer be needed (and prevented you from seeing
the issue before).

>                 return 0;
> @@ -607,11 +627,27 @@ static int ssd130x_fb_blit_rect(struct drm_framebuf=
fer *fb, const struct iosys_m
>
>         drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>
> -       ssd130x_update_rect(ssd130x, rect);
> +       ssd130x_update_rect(ssd130x, ssd130x_state, rect);
>
>         return ret;
>  }
>
> +static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *p=
lane,
> +                                                    struct drm_atomic_st=
ate *state)
> +{
> +       struct drm_device *drm =3D plane->dev;
> +       struct ssd130x_device *ssd130x =3D drm_to_ssd130x(drm);
> +       struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_=
state(state, plane);
> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_st=
ate(plane_state);
> +       int ret;
> +
> +       ret =3D drm_plane_helper_atomic_check(plane, state);
> +       if (ret)
> +               return ret;
> +
> +       return ssd130x_buf_alloc(ssd130x, ssd130x_state);

I think the code would become easier to read by inlining
ssd130x_buf_alloc() here.

> +}
> +

> +static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(str=
uct drm_plane *plane)
> +{
> +       struct ssd130x_plane_state *old_ssd130x_state;
> +       struct ssd130x_plane_state *ssd130x_state;
> +
> +       if (WARN_ON(!plane->state))
> +               return NULL;
> +
> +       old_ssd130x_state =3D to_ssd130x_plane_state(plane->state);
> +       ssd130x_state =3D kmemdup(old_ssd130x_state, sizeof(*ssd130x_stat=
e), GFP_KERNEL);

I know this is the standard pattern, but the "dup" part is a bit
silly here:
  - The ssd130x-specific parts in ssd130x_plane_state are zeroed below,
  - The base part is copied again in
    __drm_atomic_helper_plane_duplicate_state).
So (for now) you might as well just call kzalloc() ;-)

> +       if (!ssd130x_state)
> +               return NULL;
> +
> +       /* The buffers are not duplicated and are allocated in .atomic_ch=
eck */
> +       ssd130x_state->buffer =3D NULL;
> +       ssd130x_state->data_array =3D NULL;
> +
> +       __drm_atomic_helper_plane_duplicate_state(plane, &ssd130x_state->=
base);
> +
> +       return &ssd130x_state->base;
> +}
> +
> +static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
> +                                               struct drm_plane_state *s=
tate)
> +{
> +       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_st=
ate(state);
> +
> +       ssd130x_buf_free(ssd130x_state);

I think the code would become easier to read by inlining
ssd130x_buf_free() here.

> +
> +       __drm_atomic_helper_plane_destroy_state(&ssd130x_state->base);
> +
> +       kfree(ssd130x_state);
> +}

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
