Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A792BC57E91
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6C110E82B;
	Thu, 13 Nov 2025 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LTQS/DE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E836B10E82B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:23:33 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-935356590ddso248022241.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763043813; x=1763648613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AQkkqmO1JTEqvi4TMO0ZQ/b1FHhR2XjnwcEZpp95XA4=;
 b=LTQS/DE44SdaZu8Ymx5RBxVXRyPgbkY4BQl3r8TwCN0h7WRXR8UPcMw/aeChAQ5GIQ
 4T4GeWzuEHAKljjIRE3lcxA/qbopCYk9r93kzUIAVuFlc3FcF5rh31YUsTAu3B4oOaPy
 E/aNJ0bv+mrQ2EYqk7WQph1irBGt1imAdJxRiGhWDmiyKw3XuCz/nskgYldncgbtb/Bz
 ERhRBbjWsBu2QVJeYvQRB9+6pSDHBMkgTC2QX3/dm6vWP84he6rKWM91KOvxM6+GdE1A
 G9GoPR7GbUWMXVgLSbxiSvzNiQXThRcD5iVIB+XTDRfy5x82qSszEzxYJdhyqa4ZHw+R
 tX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763043813; x=1763648613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AQkkqmO1JTEqvi4TMO0ZQ/b1FHhR2XjnwcEZpp95XA4=;
 b=WCs2ogI589Anq86fQjg1eTy/NsXb5NNjo0Ij9/4zfstsTEten0VpfZlrzvauybfDdA
 9RYLA0g/iYVl/q7gq0m0XKFz7e8Py+R5ExcUFmae1x2RXy0Thqdia9848EF6KgdDFYJ4
 Zg0KUqBd6aEe8T1XWxoQf2gQ/6krMo0gU7Dg9b1TIVALEEw/tn6TeDqeMnmjiG68urNP
 QaSwUZ5Y/H0VVKzNTtsnFB/Ly1aMwmRUYNKTVFUjukP6RThE3x92Ty5+jNFyd9/phBw6
 Krvy77WGGIKd2FrC3zeoqBAQ+vRwqEeNnBayG2vf1LMJ/ExkbLCMvxqKe/3yd55IFa3g
 rYpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Igtec1ZHiC4HvKxjGQlY3a+efegrUoZDIhnIdidZSt4bZ7WwfGcSE6ZSQs4NSFVItVNxAe3vZps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylZjdIiM2JNzDfi+n+QmXvvJMkn5X9DXVkYxCRdzDCAS4MLg7/
 ph/B08ROVU1imwGYVMvksawiam7sTlYeLPGyigCNZshilnsI5KN019EnTG8/Kv9Re0dJfSsa7vM
 I/qTB+/4zxEYDGovqGSZnfBkGXsonOMk=
X-Gm-Gg: ASbGncu15sb7Evt2Pv2D12telR5UDKgluqFa4HIk5ZD3xTFwTzWsjzXZBVu07ASP891
 mbWmDpOr9iX23W99x8tmIvRDzfCaufFoCLAY4qNuO/RLs1kdqVbI46JNGJWpCQAK71L4pCCk+AY
 2u5KuFVMRooYgdhns7RmcGk0eKqt3ynOHCg7sweYOiQKJUrrlqPly0dICnuUFWYV1PgBaZaexHd
 9/7da4Np5Q7TQNkqhvQLuHvV7iYnpbL2sS1Samc/Y3/uSn2+z2MyocYqt3qYUTc6zv6rA==
X-Google-Smtp-Source: AGHT+IEdl9tzzz4LmeLbbScFz7vEKneZAAwSpFKwNSObLKjtaLI1BVG/9M8fwcPigkX8YTSZH2mEkOKn47z8CXxwMZQ=
X-Received: by 2002:a67:e043:0:b0:5df:ac57:b0ea with SMTP id
 ada2fe7eead31-5dfac57b3ddmr1090766137.10.1763043812409; Thu, 13 Nov 2025
 06:23:32 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
 <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
 <000001dc537e$42b8bc20$c82a3460$@samsung.com>
In-Reply-To: <000001dc537e$42b8bc20$c82a3460$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 13 Nov 2025 23:22:55 +0900
X-Gm-Features: AWmQ_bkMCoxlUNto3uZx9EZFH13ZH-AWorJ3ocnpvF6QI-HTLttLH3Rd-wpAotw
Message-ID: <CAAQKjZMAPtisBhgcZE1QVoUsG8n=4PGzNB9rdVtjxaVnGc0YOA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
To: hy_fifty.lee@samsung.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hoyoung,

2025=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:44,=
 <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > -----Original Message-----
> > From: Inki Dae <daeinki@gmail.com>
> > Sent: Monday, November 10, 2025 11:24 AM
> > To: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> > Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> > Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen
> > planes instead of zero-sized update
> >
> > Thanks for contribution,
> >
> > 2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:2=
9, Hoyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91
> > =EC=84=B1:
> > >
> > > Some configurations require additional actions when all windows are
> > > disabled to keep DECON operating correctly. Programming a zero-sized
> > > window in ->atomic_update() leaves the plane logically enabled and ca=
n
> > > bypass those disable semantics.
> > >
> > > Treat a fully off-screen plane as not visible and take the explicit
> > > disable path.
> > >
> > > Implementation details:
> > > - exynos_plane_mode_set(): if computed actual_w/actual_h is zero, mar=
k
> > >   state->visible =3D false and return early.
> > > - exynos_plane_atomic_check(): if !visible, skip further checks and
> > >   return 0.
> > > - exynos_plane_atomic_update(): if !visible, call ->disable_plane();
> > >   otherwise call ->update_plane().
> > >
> > > No functional change for visible planes; off-screen planes are now
> > > cleanly disabled, ensuring the disable hooks run consistently.
> > >
> > > Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > index 7c3aa77186d3..842974154d79 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > > @@ -91,6 +91,11 @@ static void exynos_plane_mode_set(struct
> > exynos_drm_plane_state *exynos_state)
> > >         actual_w =3D exynos_plane_get_size(crtc_x, crtc_w, mode->hdis=
play);
> > >         actual_h =3D exynos_plane_get_size(crtc_y, crtc_h,
> > > mode->vdisplay);
> > >
> > > +       if (!actual_w || !actual_h) {
> > > +               state->visible =3D false;
> >
> > The state->visible field in the DRM atomic framework is set to true onl=
y
> > when the following conditions are met:
> > - Both state->crtc and state->fb are present (having only one of them
> > results in an error).
> > - src_w/src_h and crtc_w/crtc_h are non-zero.
> > - The source rectangle does not exceed the framebuffer bounds (e.g., sr=
c_x
> > + src_w <=3D fb->width).
> > - Rotation and clipping checks pass successfully.
> >
> > However, this patch modifies the state->visible value within vendor-
> > specific code. Doing so can be problematic because it overrides a field
> > that is managed by the DRM atomic framework. Even if it currently works=
,
> > it may lead to unexpected behavior in the future.
> >
> > For example, if the DRM atomic framework sets visible =3D true after
> > validating the above conditions and begins processing certain logic, bu=
t
> > the vendor driver later changes it to false, the framework may still
> > assume the variable remains true, resulting in inconsistent states.
> >
> > Turning off a plane when it doesn=E2=80=99t need to be displayed is a g=
ood idea I
> > think. You might consider contributing this behavior upstream so it can=
 be
> > properly handled within the DRM atomic framework itself.
> >
> > Thanks,
> > Inki Dae
> >
> > > +               return;
> > > +       }
> > > +
> > >         if (crtc_x < 0) {
> > >                 if (actual_w)
> > >                         src_x +=3D ((-crtc_x) * exynos_state->h_ratio=
)
> > > >> 16; @@ -244,6 +249,9 @@ static int exynos_plane_atomic_check(struc=
t
> > drm_plane *plane,
> > >         /* translate state into exynos_state */
> > >         exynos_plane_mode_set(exynos_state);
> > >
> > > +       if (!new_plane_state->visible)
> > > +               return 0;
> > > +
> > >         ret =3D exynos_drm_plane_check_format(exynos_plane->config,
> > exynos_state);
> > >         if (ret)
> > >                 return ret;
> > > @@ -263,8 +271,10 @@ static void exynos_plane_atomic_update(struct
> > drm_plane *plane,
> > >         if (!new_state->crtc)
> > >                 return;
> > >
> > > -       if (exynos_crtc->ops->update_plane)
> > > +       if (new_state->visible && exynos_crtc->ops->update_plane)
> > >                 exynos_crtc->ops->update_plane(exynos_crtc,
> > > exynos_plane);
> > > +       else if (exynos_crtc->ops->disable_plane)
> > > +               exynos_crtc->ops->disable_plane(exynos_crtc,
> > > + exynos_plane);
> > >  }
> > >
> > >  static void exynos_plane_atomic_disable(struct drm_plane *plane,
> > > --
> > > 2.34.1
> > >
> > >
>
> Hi Inki,
> Thanks for the review.
>
> I agree that mutating state->visible value in vendor code is risky.
> Rather than touching the DRM atomic framework or that field, how about we=
 add a driver-private flag in Exynos(e.g. exynos_drm_plane_state->visible) =
and use that instead?
> If this approach sounds reasonable to you, I=E2=80=99ll spin a v2 along t=
hese lines.
>

For now, it is fine to add a driver-private flag and apply the change
only to Exynos. However, I believe this feature can also be generally
applied to other SoCs whose display controllers support multiple
hardware overlays, not just Exynos. Therefore, it would be ideal if
this could eventually be integrated into the DRM atomic framework so
that other SoCs may also take advantage of it in the future.

Thanks,
Inki Dae

> BRs,
> Hoyoung Lee
>
>
>
