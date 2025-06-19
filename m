Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1FBADFDAD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946F10E9AA;
	Thu, 19 Jun 2025 06:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PK+Z6xhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F210E9A7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750315041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uNMBk0wAlkZx/rfLqOzJesJna8POdoskmu3HAnO65Y=;
 b=PK+Z6xhU+XHw7IxVLtYiBuyji4AVfItUIOu+Ov9ZrxgAnPSxQqBAC7ikNI4EAK7S3kDb82
 UVqwGta8WE0NVVNyeyeu7j524pf956aXf1Bqk6VUlNW3HzBbYf6iaLI+TyuxM7zTQ6uvfG
 YgxXI0OmOvAB68CLo2QFRhdYlzmtCIY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-lRF9Wy0TP0uWgqaIuHr_OA-1; Thu, 19 Jun 2025 02:37:20 -0400
X-MC-Unique: lRF9Wy0TP0uWgqaIuHr_OA-1
X-Mimecast-MFC-AGG-ID: lRF9Wy0TP0uWgqaIuHr_OA_1750315039
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-311d670ad35so428988a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 23:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750315039; x=1750919839;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uNMBk0wAlkZx/rfLqOzJesJna8POdoskmu3HAnO65Y=;
 b=TW77+fFOm/dEL2YC7fpW2LcERzmUUsSbf1INJUgs7x/uR47ViNKIRFC3AiPKq5aeOi
 ntFjgZQ3uPwI4vL9z7zPKcpYEMi3o3nnqFsaesnGqvfSXhpERHyo8cfu9uzcPlDOuZRd
 B6VoA3H9JsLWivQ47PEjiQLBWqDfIfyge4gRJhafA4+SGrJGY6tkqqUQv0gG1N3p68h2
 8BEZu+C/E4eil/hTmIszxDBWxHfc0GaKkCfOvmTAJLeOp2Ga55gqrnLnXw9YWnwWqPaW
 /btO+g91wArCcwU9kVgsYTaK867l45eeH5D1nEYda+0UGGP1eKeQ/NtWtXAHqtLkHIUU
 Zc/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXNl8qd+z6twy3LlYfD5FpSAbM1bSH2JxiHSQ4ZJllYSWHu4/mYqsqNvYD1PhY37o3xqX/WF9mmyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4y5E2mTo2KdmX501EkbvVxuSv7yoqFPykxDZfBdXbmniLYoez
 Tv90Qbr4G/pmmU38YFnLljMKaXnBqNsG6aJkrP0ceEvduVWMc0EoiB9XO4pp9Wl6t8ICmXM3POP
 /CMxXGeZqe3xdgf8nPNjRE4Wi4ymGJxxAoT8VwpYiEn84AH4HENe2oqGG/oNQrNq6IYMbXvaHvH
 6wSzY/E1gq4XKPa526CjI3gwrUwBKWtmQWXjjK1s0WwS8x
X-Gm-Gg: ASbGncupea4xOLTHyoTvjTlOn9RHKDfXPgfFrgeUw0DJ5YMZioezNo1xQ71K9GmAkxv
 36MmESqbq/kmeYNAOhR0+CpEgLjDArkwhUa4mDg7V11LD07xw+D+mwBSaAoY8c3WhFKO9mn9Zuq
 o7MJx7MMxtvxF2al42A6K568kIntHSscHwSF0Djg==
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id
 98e67ed59e1d1-313f1d50e08mr28234699a91.20.1750315039369; 
 Wed, 18 Jun 2025 23:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX7GnjAlVhwgCg3zE5Ch7H7SHvP9QUYPvl7kO44iyN3b8BgkXc1zdxaWZ+FGkVn/hULPc5fRFcJjWwX6646bY=
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id
 98e67ed59e1d1-313f1d50e08mr28234671a91.20.1750315038936; Wed, 18 Jun 2025
 23:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250613132023.106946-1-ryasuoka@redhat.com>
 <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
In-Reply-To: <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Thu, 19 Jun 2025 15:37:06 +0900
X-Gm-Features: AX0GCFvSMUcq1h_W5ABI167G5MpNn8Cu_AvBDu-QBtX7eKvqtg0izjF5ovDEkb4
Message-ID: <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5oGDGYl9P0raGp3yydBjvJjTof0cWPPPnHZmabRdPTc_1750315039
X-Mimecast-Originator: redhat.com
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

On Thu, Jun 19, 2025 at 3:12=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
> > Add drm_panic moudle for bochs drm so that panic screen can be displaye=
d
> > on panic.
>
> Thanks for the patch, it's simple and looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
> If no objections, I will push it next Monday.
>
> Best regards,
>
> --
>
> Jocelyn

Thank you Jocelyn for reviewing my patch.
Now I found a typo in the commit message; moudle -> module.

Let me fix it in v2.

Ryosuke

> >
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > ---
> >   drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.=
c
> > index 8706763af8fb..ed42ad5c4927 100644
> > --- a/drivers/gpu/drm/tiny/bochs.c
> > +++ b/drivers/gpu/drm/tiny/bochs.c
> > @@ -19,6 +19,7 @@
> >   #include <drm/drm_gem_shmem_helper.h>
> >   #include <drm/drm_managed.h>
> >   #include <drm/drm_module.h>
> > +#include <drm/drm_panic.h>
> >   #include <drm/drm_plane_helper.h>
> >   #include <drm/drm_probe_helper.h>
> >
> > @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_upd=
ate(struct drm_plane *plane,
> >       bochs_hw_setformat(bochs, fb->format);
> >   }
> >
> > +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_pl=
ane *plane,
> > +                                                       struct drm_scan=
out_buffer *sb)
> > +{
> > +     struct bochs_device *bochs =3D to_bochs_device(plane->dev);
> > +     struct iosys_map map =3D IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map=
);
> > +
> > +     if (plane->state && plane->state->fb) {
> > +             sb->format =3D plane->state->fb->format;
> > +             sb->width =3D plane->state->fb->width;
> > +             sb->height =3D plane->state->fb->height;
> > +             sb->pitch[0] =3D plane->state->fb->pitches[0];
> > +             sb->map[0] =3D map;
> > +             return 0;
> > +     }
> > +     return -ENODEV;
> > +}
> > +
> >   static const struct drm_plane_helper_funcs bochs_primary_plane_helper=
_funcs =3D {
> >       DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> >       .atomic_check =3D bochs_primary_plane_helper_atomic_check,
> >       .atomic_update =3D bochs_primary_plane_helper_atomic_update,
> > +     .get_scanout_buffer =3D bochs_primary_plane_helper_get_scanout_bu=
ffer,
> >   };
> >
> >   static const struct drm_plane_funcs bochs_primary_plane_funcs =3D {
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>

