Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D4756190
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 13:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1110F10E035;
	Mon, 17 Jul 2023 11:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091DF10E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 11:28:54 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-579e5d54e68so47395477b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 04:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689593333; x=1692185333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ovpqli4VYl8QA6u7r093Hwe7E7RuqANjeNVwPKe59Vg=;
 b=eN6IWv08c9DARoxPVycjWfBXRKNjkcCokKJbscIDc9na6e+vhW2Dpw7CnMkbQ+9Q2i
 UGr/+owkXaLP0QHfHTx2HtwvhBYEtuSN6Xdr7d2dCbhkEzZMox5QgujLUBzgK2vqf7aX
 hDPjffH2l7ujQ7Qb0LCK/HWA7FK8Ilas5N39A7WHDtNcVNmpz+FQ8w0Ve/P/Z9SH05s5
 n909eP9gyd3kVunEw+8Zv9fInBrsTvHirq4SowbTksHuyD8ABb6BIB1VPxT5hJzoZUbG
 7b8Tvq30pkY4SXqA4inqubXa0YZuSW0q3r6+UjTgb/f7DK5n7b9U9ngxtia8cDxfHukA
 hN0g==
X-Gm-Message-State: ABy/qLa+ckJ4RGI1CBjjukjQSNNcl/nUkfbquxHVP32B/gU8WlyOHPFk
 NWRdeTqfPLbiJkleyf8BAeUylq7aX+rlbQ==
X-Google-Smtp-Source: APBJJlHFtXUC8YB4pzabSHzx2KQGfrHUCTjqnRm1uMnRgOe6vtUsGYU5ridS/72OFF0Dhoq0zK5amQ==
X-Received: by 2002:a0d:fac4:0:b0:573:b24c:a527 with SMTP id
 k187-20020a0dfac4000000b00573b24ca527mr14320749ywf.41.1689593333572; 
 Mon, 17 Jul 2023 04:28:53 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 b7-20020a0dc007000000b0057a0e5b18e0sm3757900ywd.142.2023.07.17.04.28.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 04:28:53 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-bfe6ea01ff5so4613734276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 04:28:53 -0700 (PDT)
X-Received: by 2002:a25:23c7:0:b0:c60:fb80:99f7 with SMTP id
 j190-20020a2523c7000000b00c60fb8099f7mr10930768ybj.16.1689593333040; Mon, 17
 Jul 2023 04:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
 <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
 <87h6q2kh6s.fsf@minerva.mail-host-address-is-not-set>
 <87bkgaken1.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87bkgaken1.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2023 13:28:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYdL0y2-tVfG3BZbCtR-0xOMz9tu4R4=CJqxqwgVVmcw@mail.gmail.com>
Message-ID: <CAMuHMdVYdL0y2-tVfG3BZbCtR-0xOMz9tu4R4=CJqxqwgVVmcw@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Jul 17, 2023 at 12:37=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Javier Martinez Canillas <javierm@redhat.com> writes:
> >> On Mon, Jul 17, 2023 at 10:48=E2=80=AFAM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> >>> After some discussion on IRC, I'd suggest to allocate the buffer
> >>> somewhere within probe. So it will always be there when the plane cod=
e runs.
> >>>
> >>> A full fix would be to allocate the buffer memory as part of the plan=
e
> >>> state and/or the plane's atomic_check. That's a bit more complicated =
if
> >>> you want to shared the buffer memory across plane updates.
> >>
> >> Note that actually two buffers are involved: data_array (monochrome,
> >> needed for each update), and buffer (R8, only needed when converting
> >> from XR24 to R1).
> >>
> >> For the former, I agree, as it's always needed.
> >> For the latter, I'm afraid it would set a bad example: while allocatin=
g
> >> a possibly-unused buffer doesn't hurt for small displays, it would
> >> mean wasting 1 MiB in e.g. the repaper driver (once it has gained
> >> support for R1 ;^).
> >>
> >
> > Maybe another option is to allocate on the struct drm_mode_config_funcs
> > .fb_create callback? That way, we can get the mode_cmd->pixel_format an=
d
> > determine if only "data_array" buffer must be allocated or also "buffer=
".
> >
>
> Something like the following patch:
>
> From 307bf062c9a999693a4a68c6740ec55b81f796b8 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Mon, 17 Jul 2023 12:30:35 +0200
> Subject: [PATCH v2] drm/ssd130x: Fix an oops when attempting to update a
>  disabled plane
>
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
>
> Fix this by allocating the buffers in the struct drm_mode_config_funcs
> .fb_create, instead of doing it when the encoder is enabled.
>
> Also, make a couple of improvements to the ssd130x_buf_alloc() function:
>
>   * Make the allocation smarter to only allocate the intermediate buffer
>     if the native R1 format is not used. Otherwise is not needed, since
>     there is no XRGB8888 to R1 format conversion during plane updates.
>
>   * Allocate the buffers as device managed resources, this is enough and
>     simplifies the logic since there is no need to explicitly free them.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> Changes in v2:
> - Move the buffers allocation to .fb_create instead of preventing atomic
>   updates for disable planes.
> - Don't allocate the intermediate buffer when using the native R1 format.
> - Allocate buffers as device managed resources.

Thanks for the update!

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -146,38 +146,35 @@ static inline struct ssd130x_device *drm_to_ssd130x=
(struct drm_device *drm)
>         return container_of(drm, struct ssd130x_device, drm);
>  }
>
> -static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x)
> +static int ssd130x_buf_alloc(struct ssd130x_device *ssd130x, __u32 pixel=
_format)
>  {
>         unsigned int page_height =3D ssd130x->device_info->page_height;
>         unsigned int pages =3D DIV_ROUND_UP(ssd130x->height, page_height)=
;
>         const struct drm_format_info *fi;
>         unsigned int pitch;
>
> -       fi =3D drm_format_info(DRM_FORMAT_R1);
> -       if (!fi)
> -               return -EINVAL;
> +       /* If the native format is not used an intermediate buffer is nee=
ded */
> +       if (pixel_format !=3D DRM_FORMAT_R1) {
> +               fi =3D drm_format_info(DRM_FORMAT_R1);
> +               if (!fi)
> +                       return -EINVAL;
>
> -       pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
> +               pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width=
);
>
> -       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNEL);
> -       if (!ssd130x->buffer)
> -               return -ENOMEM;
> +               ssd130x->buffer =3D devm_kcalloc(ssd130x->dev, pitch, ssd=
130x->height,
> +                                              GFP_KERNEL);

This should check if the buffer was allocated before.
Else an application creating two or more frame buffers will keep
on allocating new buffers.  The same is true for fbdev emulation vs.
a userspace application.

> +               if (!ssd130x->buffer)
> +                       return -ENOMEM;
> +       }
>
> -       ssd130x->data_array =3D kcalloc(ssd130x->width, pages, GFP_KERNEL=
);
> -       if (!ssd130x->data_array) {
> -               kfree(ssd130x->buffer);
> +       ssd130x->data_array =3D devm_kcalloc(ssd130x->dev, ssd130x->width=
, pages,
> +                                          GFP_KERNEL);

Same here.

> +       if (!ssd130x->data_array)
>                 return -ENOMEM;
> -       }

And you still need the data_array buffer for clearing the screen,
which is not tied to the creation of a frame buffer, I think?

>
>         return 0;
>  }
>
> -static void ssd130x_buf_free(struct ssd130x_device *ssd130x)
> -{
> -       kfree(ssd130x->data_array);
> -       kfree(ssd130x->buffer);
> -}
> -
>  /*
>   * Helper to write data (SSD130X_DATA) to the device.
>   */
> @@ -741,10 +738,6 @@ static void ssd130x_encoder_helper_atomic_enable(str=
uct drm_encoder *encoder,
>         if (ret)
>                 goto power_off;
>
> -       ret =3D ssd130x_buf_alloc(ssd130x);
> -       if (ret)
> -               goto power_off;
> -
>         ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
>
>         backlight_enable(ssd130x->bl_dev);
> @@ -766,8 +759,6 @@ static void ssd130x_encoder_helper_atomic_disable(str=
uct drm_encoder *encoder,
>
>         ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
>
> -       ssd130x_buf_free(ssd130x);
> -
>         ssd130x_power_off(ssd130x);
>  }
>
> @@ -811,8 +802,21 @@ static const struct drm_connector_funcs ssd130x_conn=
ector_funcs =3D {
>         .atomic_destroy_state =3D drm_atomic_helper_connector_destroy_sta=
te,
>  };
>
> +static struct drm_framebuffer *ssd130x_fb_create(struct drm_device *dev,=
 struct drm_file *file,
> +                                                const struct drm_mode_fb=
_cmd2 *mode_cmd)
> +{
> +       struct ssd130x_device *ssd130x =3D drm_to_ssd130x(dev);
> +       int ret;
> +
> +       ret =3D ssd130x_buf_alloc(ssd130x, mode_cmd->pixel_format);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return drm_gem_fb_create_with_dirty(dev, file, mode_cmd);
> +}
> +
>  static const struct drm_mode_config_funcs ssd130x_mode_config_funcs =3D =
{
> -       .fb_create =3D drm_gem_fb_create_with_dirty,
> +       .fb_create =3D ssd130x_fb_create,
>         .atomic_check =3D drm_atomic_helper_check,
>         .atomic_commit =3D drm_atomic_helper_commit,
>  };

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
