Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2378E770
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 09:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0867310E17E;
	Thu, 31 Aug 2023 07:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F5110E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 07:56:39 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d7ba4c5f581so330446276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693468598; x=1694073398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52E1H+CStLtbMwxlYSENmQFJDY+5NaKvwrzRLoKXXlQ=;
 b=bAJBeQSve1xdV2A4bWRVEyZkW3Buz9zuNgesEiYBNb2t7YYKanvTMt0a+N1qJ6/uBz
 Bbtc8HW3uraUpFefikGDVBQzi3m3xxYczfKFvuEpVrXWq63boQwVyxXiWewB0rYuPTIp
 QcWzVYV4XsDFIJ5WseME4T4rFY5VKOSvxMuY2WWUkzI6uZdzM/cIv1Piv27EJYDiWhBn
 ZrBYVpD5Qt0xee0TWxTUkI6FwFxU3oq0yUkr4i7VxAQAKgnjABRhLXV6nRO2WYOpvSio
 oER+fTUowcnm4Fnw9bJvAHjcxUBGSZRiw/Xw8Dd7Na76PVGH884GRcbxzFc9l9AgzSMX
 CWxA==
X-Gm-Message-State: AOJu0YzoCSsqObbOoJknx4xr2lohOHb92knQ6rVu6wyRo/sx114emb3T
 kawAPIbb0RzC7DlqLa70bbSwuA+9BxUXuQ==
X-Google-Smtp-Source: AGHT+IEFDsCZkE1sjqQVvP/91Oahja6clRyF7kV3zYv492iTwTUqq6GtBW/zazbZHRQpYZQNPxXhnA==
X-Received: by 2002:a25:ae86:0:b0:d78:ae6:e75a with SMTP id
 b6-20020a25ae86000000b00d780ae6e75amr4040166ybj.60.1693468598586; 
 Thu, 31 Aug 2023 00:56:38 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 j143-20020a252395000000b00d7badcab84esm195309ybj.9.2023.08.31.00.56.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 00:56:37 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso319772276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:56:37 -0700 (PDT)
X-Received: by 2002:a25:7356:0:b0:d7b:37de:2f6e with SMTP id
 o83-20020a257356000000b00d7b37de2f6emr4801334ybc.39.1693468587194; Thu, 31
 Aug 2023 00:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692888745.git.geert@linux-m68k.org>
 <16d488639e99f43ca3977ee7b8f76fc26c34aa86.1692888745.git.geert@linux-m68k.org>
 <1a98bb80-9990-dc65-5f14-066315a7e7d8@suse.de>
In-Reply-To: <1a98bb80-9990-dc65-5f14-066315a7e7d8@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 09:56:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmHsfOwSa_Owm2rShsMrmMSfa6eVkFz8Y0K_DmhxxZ4A@mail.gmail.com>
Message-ID: <CAMuHMdWmHsfOwSa_Owm2rShsMrmMSfa6eVkFz8Y0K_DmhxxZ4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/dumb-buffers: Fix drm_mode_create_dumb() for
 bpp < 8
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Aug 31, 2023 at 9:40=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 24.08.23 um 17:08 schrieb Geert Uytterhoeven:
> > drm_mode_create_dumb() calculates the number of characters per pixel
> > from the number of bits per pixel by rounding up, which is not correct
> > as the actual value of cpp may be non-integer.  While we do not need to
> > care here about complex formats like YUV, bpp < 8 is a valid use case.
> >
> >    - The overflow check for the buffer width is not correct if bpp < 8.
> >      However, it doesn't hurt, as widths larger than U32_MAX / 8 should
> >      not happen for real anyway.  Add a comment to clarify.
> >    - Calculating the stride from the number of characters per pixel is
> >      not correct.  Fix this by calculating it from the number of bits p=
er
> >      pixel instead.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Tested-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> > v2:
> >    - Add Reviewed-by, Tested-by.
> > ---
> >   drivers/gpu/drm/drm_dumb_buffers.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_d=
umb_buffers.c
> > index 70032bba1c97e787..21a04c32a5e3d785 100644
> > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > @@ -71,10 +71,11 @@ int drm_mode_create_dumb(struct drm_device *dev,
> >       /* overflow checks for 32bit size calculations */
> >       if (args->bpp > U32_MAX - 8)
> >               return -EINVAL;
> > +     /* Incorrect (especially if bpp < 8), but doesn't hurt much */
> >       cpp =3D DIV_ROUND_UP(args->bpp, 8);
> >       if (cpp > U32_MAX / args->width)
> >               return -EINVAL;
>
> At first, I was confused by this.

Me too ;-)

> So I'd really prefer to outright
> delete this code. As you say, it's incorrect and doesn't add anything.
> The concept of cpp is somewhat wrong anyway.
>
> > -     stride =3D cpp * args->width;
> > +     stride =3D DIV_ROUND_UP(args->bpp * args->width, 8);
>
> Do we need an overflow check for (bpp * width < U32_MAX) ?

I think I thought it would be covered by the above, but on more thought,
that is indeed not true.

So perhaps drop the cpp code above, and test bpp instead:

    -        cpp =3D DIV_ROUND_UP(args->bpp, 8);
    -        if (cpp > U32_MAX / args->width)
    +        if (args->bpp > U32_MAX / args->width)
                     return -EINVAL;

That would preclude a very wide buffer with height 1, though.

BTW, in v1 I also had this question:

    Why is drm_mode_create_dumb.size __u64?  The test for "args->height >
    U32_MAX / stride" rejects all sizes not fitting in __u32 anyway.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
