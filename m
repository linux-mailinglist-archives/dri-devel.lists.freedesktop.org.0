Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1926E8DC1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D168916D;
	Thu, 20 Apr 2023 09:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4FB8916D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:15:41 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso431564e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982139; x=1684574139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2/e9Dnl7P2o+B8qqamMNBV5IQwfpE3QNjICNgU+vyo=;
 b=iHBEXNXy/GRwNRyb4z9GGkJL8vOo6iQdd9LCad3h7V8Evc+qyZ2sSv2hMFGt3t1SCT
 /PDCP6QA50krS4Td88Xh4AujC6yXRpIbD9yem1cbhZz0/7tSNk5PtsTcLrCKdw5spyuE
 OVX+TcpxvD1o0HWpxv3LStcPs0w7bp2hMitV9q7Oi80boOy+N9uuGcpt8cb/NqvoyV3Z
 U2mZ0+xi2GEpbs6XfFvjiDvnRvDJ86yd2xfz06+D5Z2Uqzj9w8MZyDpls9srXoWG/uMv
 uJ6P8Y2QZuO8r+pGxBZXpNW+SOrZ3yt9IGmHoWk/u94OqmiDfyAHL27r+4mAyRgJe2nV
 KLhw==
X-Gm-Message-State: AAQBX9c1bsSZ+9458yWOgmO2xfrEu0GTDIEQc6DZ2O+iji/Y22IhYccF
 Rjym1h7wAJPDk+fCWy4F1wOwryLB1SGVF+Tu
X-Google-Smtp-Source: AKy350ZLYsl13gwLxCKxtyryiKV+xTYhQ0caM4qbyRjXZ+YJ2inmVfTrCMCV/4qRupRG0szwPVFc1w==
X-Received: by 2002:ac2:52aa:0:b0:4cb:2aa:9e58 with SMTP id
 r10-20020ac252aa000000b004cb02aa9e58mr240146lfm.13.1681982138580; 
 Thu, 20 Apr 2023 02:15:38 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 h25-20020ac250d9000000b004eb09820adbsm153484lfm.105.2023.04.20.02.15.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:15:38 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id c3so2001953ljf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:15:38 -0700 (PDT)
X-Received: by 2002:a2e:a17b:0:b0:2a8:baf7:4e60 with SMTP id
 u27-20020a2ea17b000000b002a8baf74e60mr157071ljl.9.1681982137873; Thu, 20 Apr
 2023 02:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
 <ZEAY5Sf/V10ipDZk@phenom.ffwll.local>
In-Reply-To: <ZEAY5Sf/V10ipDZk@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 11:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbsFHP7Amoz16o5ge5a=wv5u2x0B+yP7e-0bRJufqrQQ@mail.gmail.com>
Message-ID: <CAMuHMdWbsFHP7Amoz16o5ge5a=wv5u2x0B+yP7e-0bRJufqrQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Fix height, width,
 and accel_flags in fb_var
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Apr 19, 2023 at 6:38=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> On Tue, Apr 18, 2023 at 08:42:46PM +0200, Geert Uytterhoeven wrote:
> > Fbtest contains some very simple validation of the fbdev userspace API
> > contract.  When used with shmob-drm, it reports the following warnings
> > and errors:
> >
> >     height changed from 68 to 0
> >     height was rounded down
> >     width changed from 111 to 0
> >     width was rounded down
> >     accel_flags changed from 0 to 1
> >
> > The first part happens because __fill_var() resets the physical
> > dimensions of the first connector, as filled in by drm_setup_crtcs_fb()=
.
> > Fix this by retaining the original values.
> >
> > The last part happens because __fill_var() forces the FB_ACCELF_TEXT
> > flag on, while fbtest disables all acceleration on purpose, so it can
> > draw safely to the frame buffer.  Fix this by setting accel_flags to
> > zero, as DRM does not implement any text console acceleration.
> > Note that this issue can also be seen in the output of fbset, which
> > reports "accel true".
> >
> > Fixes: ee4cce0a8f03a333 ("drm/fb-helper: fix input validation gaps in c=
heck_var")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -2066,7 +2068,7 @@ static void drm_fb_helper_fill_var(struct fb_info=
 *info,
> >       info->pseudo_palette =3D fb_helper->pseudo_palette;
> >       info->var.xoffset =3D 0;
> >       info->var.yoffset =3D 0;
> > -     __fill_var(&info->var, fb);
> > +     __fill_var(&info->var, info, fb);
>
> Bit a bikeshed since it zeroed-allocated anyway, but I'd pass NULL here
> for info and catch that in __fill_var and then keep the explicit =3D 0;

Yeah, it's a bit unfortunate this is done in two places, and
info->var.{height,width} are initialized by drm_setup_crtcs_fb()
only later.

Most of the var contents cannot change as mode changes are not
supported, so drm_fb_helper_check_var() should just do

    if (var->foo > info->var.foo)
            return -EINVAL;
    var->foo =3D info->var.foo;

For the parts that can change, based on earlier discussions I saw pass
by, I believe there should be a call into atomic try-modesetting at
the end of drm_fb_helper_check_var()?

> Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
