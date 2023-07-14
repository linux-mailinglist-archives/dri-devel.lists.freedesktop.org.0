Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F12F753987
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F58610E871;
	Fri, 14 Jul 2023 11:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E00210E871
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:32:24 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-cada5e4e3f6so1677229276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689334343; x=1691926343;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0GHsf3+kOYGZ8Tt4qW6cXRgWp6sPt9tasFL1Jg1Sjy8=;
 b=NH7LAqi9mu/xrLhgUhGE8QeJuoRtx3F4L4HC81ReiYLvegPj0gtVgfccqaeq51n/eG
 BkduI/Ht3+92CpZgjqzEqqblPwAo0CrLmv3VUqvAzBmfW9Gjb5rKQglN39Y77iL/4rk1
 X7ktHqdzHAMR1e34ipUp6fzTDLblqIrl/Qro5HhUfJtU2QbqrnJqmTP2CulUBJXGyGfp
 dLfO82xAKetBZozxkxTeikbI1/vbx2WLapsUAocbG8USA/vHLg7MObSu5C8TWiRULCPM
 PJNI6PPJGU0s82D9Km8T2CSIp9/w4IWUvV2KikkjybrIpLeNczOhuw5Vps7Al+rapkYQ
 oH8w==
X-Gm-Message-State: ABy/qLavueDVUvc1+wNfWz5RaZ19stzprrpWIcHlxsWA+Uxf2Hz+tXBI
 lYXgGYRWHk7kr5V52vF7vxX06YvwzJKkOQ==
X-Google-Smtp-Source: APBJJlFfuFUVBWSCm9odIqvT7uhDYjUsLjHx/SEc9yT+453K4zR24hDwk0DWw+9qCdLX+EFyu0HxzA==
X-Received: by 2002:a81:8044:0:b0:57a:9384:4c13 with SMTP id
 q65-20020a818044000000b0057a93844c13mr4555701ywf.49.1689334342923; 
 Fri, 14 Jul 2023 04:32:22 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 u10-20020a0deb0a000000b005772154dddbsm2240807ywe.24.2023.07.14.04.32.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 04:32:22 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-cada5e4e3f6so1677192276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:32:22 -0700 (PDT)
X-Received: by 2002:a25:4090:0:b0:bff:242b:78d0 with SMTP id
 n138-20020a254090000000b00bff242b78d0mr3970572yba.34.1689334342130; Fri, 14
 Jul 2023 04:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <00790d022752b672a28256db7b9393eca0801b99.1689252746.git.geert@linux-m68k.org>
 <87cz0uu6wq.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cz0uu6wq.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 13:32:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSUFd0WaaEU7UsbODxPuJzetg-rP-1E7ZWz9d58rLBqQ@mail.gmail.com>
Message-ID: <CAMuHMdUSUFd0WaaEU7UsbODxPuJzetg-rP-1E7ZWz9d58rLBqQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/fb-helper: Pass buffer format via
 drm_fb_helper_surface_size
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Jul 14, 2023 at 12:25=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > drm_fb_helper_single_fb_probe() first calls drm_fb_helper_find_sizes(),
> > followed by drm_fbdev_generic_helper_fb_probe():
> >   - The former tries to find a suitable buffer format, taking into
> >     account limitations of the whole display pipeline,
> >   - The latter just calls drm_mode_legacy_fb_format() again.
> >
> > Simplify this by passing the buffer format between these functions
> > via a new buffer format member in the drm_fb_helper_surface_size
> > structure.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
>
> [...]
>
> > -     drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> > +     drm_info(dev, "surface width(%d), height(%d), bpp(%d) and format(=
%p4cc)\n",
>
> You are promoting a debug printout here to info but that change is not
> mentioned in the commit message. If you think this will be useful, maybe
> do it as a separate patch ?

Oops, that was unintentional.  Will fix in v2.

> The rest of the patch looks good to me though.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

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
