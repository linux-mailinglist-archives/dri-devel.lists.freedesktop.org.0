Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C397873FB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8D710E58C;
	Thu, 24 Aug 2023 15:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455A010E587
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:22:18 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6bb07d274feso5070910a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890537; x=1693495337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvbKBvGBb47deB3Uur3bkWNEdVyLXWReh2OEJ/A5lAI=;
 b=jrnPmrBqqHYXrXgWlAofOOUn7i4+zQg9dY/dug3xzkFB3UZFJW1bob0ab4N7VhLc6Y
 DBp+w0nx9H19S9jYYL5DBjDZhtwmu5WTdalLCwaspq70V5OL36ObNezOfm660gZBJ7Ay
 YUaoMlKW5btcyAw7/GIaIxNusDl3WlTOr2wVYwJeU++ZChRfNlKcvbXMO9Nh3Fs9ldh1
 5S0vNALzg5YP2X6bx+kPhvNXvrPmudLtFsZnPJhvD9ahqCJ8qqpX0XOS8m1nxZk1K+cE
 jctJIw44ZNUGUPJRb42wyQGEHssTEFj9ZoVcQxlboAljSo9P3qHX/ft7ooc0dq/B42zc
 kMsQ==
X-Gm-Message-State: AOJu0YzTv4Q7TQWippHH1uKKQKd/FmW1jjzQ2b1juUcBJ0wQGhNoYs68
 1ULHhZ7/ftfVQSGyrBYbUuKVxzSCilcc5Q==
X-Google-Smtp-Source: AGHT+IENgsVz7083lAcN1qsTqlrJ5n+LQpCASN6NxVxeqgi40D4cgcQGdPCRnIoXMZc3h5HfNpFcqg==
X-Received: by 2002:a9d:6255:0:b0:6bd:7252:9db1 with SMTP id
 i21-20020a9d6255000000b006bd72529db1mr2871640otk.11.1692890537351; 
 Thu, 24 Aug 2023 08:22:17 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44]) by smtp.gmail.com with ESMTPSA id
 y26-20020a056830109a00b006b93c6c97basm6870255oto.44.2023.08.24.08.22.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:22:16 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6bee392fe9dso508743a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:22:16 -0700 (PDT)
X-Received: by 2002:a05:6358:5913:b0:139:b4c0:93c with SMTP id
 g19-20020a056358591300b00139b4c0093cmr17358536rwf.5.1692890536410; Thu, 24
 Aug 2023 08:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692888745.git.geert@linux-m68k.org>
 <50762fd1694d3b5f6df1bdfa482564adb2ee7f36.1692888745.git.geert@linux-m68k.org>
 <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
In-Reply-To: <CAPj87rNr7PTcquaz+VzwmXh0mSWSSK25_Fa6uxC2VOfj=wMmcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Aug 2023 17:22:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
Message-ID: <CAMuHMdWyMNZJ3seWWHqigLfXwCnp47Xwzs1B6ixOyY+n7cir-A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/client: Convert drm_client_buffer_addfb() to
 drm_mode_addfb2()
To: Daniel Stone <daniel@fooishbar.org>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Aug 24, 2023 at 5:12=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
> On Thu, 24 Aug 2023 at 16:09, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> >         struct drm_client_dev *client =3D buffer->client;
> > -       struct drm_mode_fb_cmd fb_req =3D { };
> > -       const struct drm_format_info *info;
> > +       struct drm_mode_fb_cmd2 fb_req =3D { };
> >         int ret;
> >
> > -       info =3D drm_format_info(format);
> > -       fb_req.bpp =3D drm_format_info_bpp(info, 0);
> > -       fb_req.depth =3D info->depth;
> >         fb_req.width =3D width;
> >         fb_req.height =3D height;
> > -       fb_req.handle =3D handle;
> > -       fb_req.pitch =3D buffer->pitch;
> > +       fb_req.pixel_format =3D format;
> > +       fb_req.handles[0] =3D handle;
> > +       fb_req.pitches[0] =3D buffer->pitch;
> >
> > -       ret =3D drm_mode_addfb(client->dev, &fb_req, client->file);
> > +       ret =3D drm_mode_addfb2(client->dev, &fb_req, client->file);
> >         if (ret)
> >                 return ret;
>
> This should explicitly set the LINEAR modifier (and the modifier flag)
> if the driver supports modifiers.

Thanks for your comment!

I have no idea how to do that, and I do not know what the impact
would be.  All I know is that the current implementation of
drm_client_buffer_addfb() does not do that, so changing that in this
patch would mean that this would no longer be a trivial conversion.

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
