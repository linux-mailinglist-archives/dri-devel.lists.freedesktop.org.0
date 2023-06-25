Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2777773D1BD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 17:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC1910E185;
	Sun, 25 Jun 2023 15:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DAA10E184
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 15:36:22 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7654e1d83e8so192275785a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 08:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687707381; x=1690299381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t6hADTvRtybxnAgwb/MiYU3LVBKmH7BajnYoRP9HcuU=;
 b=MmsOIasSMFrOMrewm6RaToUdLr+a2cn/3y57UrZbGO2K9Bmadt4dsPjPZdLK1Bd5rM
 wMAVgl4CxbzXWX1i+KXQR0w0sg2DEMAlA32AcBczZJEbWik0B9Yw5Dz8jevTxmRuNtPv
 g4n+OyHHSL8YcxSc4aaYaUC6PObw8NlqxyGkBzF4zu3i9GsZNQfAAAZMQd2Vbt6fDLhi
 i7Z69KiOOWl/qRXjr4ul3oxLlKQu3qJ32XXQIraapSDtYJkX8Yyy3KLWV9rYA7eOX/tR
 w0oXEfvA1RENq0SYhXFxKuHwC6YsXQFyU/X3cGa3/hjUDiloZtmWOHC9ifbngMHeJ1tL
 EdmA==
X-Gm-Message-State: AC+VfDwYy9EFcVwk2K0C6K5AIUOzgGBzt3S+HuRQx4BlrOx56Fpy+dgq
 8cHRqUhdnE6ikPeZuxQa/9jjhEpVPibxTQ==
X-Google-Smtp-Source: ACHHUZ7I+NBPLTDLBtuWGE8go1WSicNhHIjXJ0QkulYzq7796MjIDd549V9dnNFKtzJ/Hzd0C9MBaA==
X-Received: by 2002:a81:6e89:0:b0:565:c21d:8ec6 with SMTP id
 j131-20020a816e89000000b00565c21d8ec6mr29051998ywc.6.1687707380587; 
 Sun, 25 Jun 2023 08:36:20 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 z14-20020a81a24e000000b0056ca07bbc03sm845691ywg.86.2023.06.25.08.36.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 08:36:19 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so2429438276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 08:36:18 -0700 (PDT)
X-Received: by 2002:a0d:d649:0:b0:56d:c02:58a7 with SMTP id
 y70-20020a0dd649000000b0056d0c0258a7mr27473610ywd.18.1687707378531; Sun, 25
 Jun 2023 08:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <20230416115237.798604-4-dmitry.osipenko@collabora.com>
 <CAMuHMdVrJsmQx8X-_Tnxir9W752Mdh8ye7ob2srtY+6HFDEMGw@mail.gmail.com>
 <0ca8034d-0377-26b9-51c8-8caff6c4174a@collabora.com>
In-Reply-To: <0ca8034d-0377-26b9-51c8-8caff6c4174a@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Jun 2023 17:36:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfE=6xFsYFv=mCACpwZp45AiCzFxEB=suEFBhv9ry5aw@mail.gmail.com>
Message-ID: <CAMuHMdWfE=6xFsYFv=mCACpwZp45AiCzFxEB=suEFBhv9ry5aw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jun 25, 2023 at 2:41=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> On 6/25/23 11:47, Geert Uytterhoeven wrote:
> > On Sun, Apr 16, 2023 at 1:55=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >> Add sync object DRM UAPI support to VirtIO-GPU driver. Sync objects
> >> support is needed by native context VirtIO-GPU Mesa drivers, it also w=
ill
> >> be used by Venus and Virgl contexts.
> >>
> >> Reviewed-by; Emil Velikov <emil.velikov@collabora.com>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> >
> >> +static int
> >> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
> >> +{
> >> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> >> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> >> +       size_t syncobj_stride =3D exbuf->syncobj_stride;
> >> +       u32 num_in_syncobjs =3D exbuf->num_in_syncobjs;
> >> +       struct drm_syncobj **syncobjs;
> >> +       int ret =3D 0, i;
> >> +
> >> +       if (!num_in_syncobjs)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * kvalloc at first tries to allocate memory using kmalloc and
> >> +        * falls back to vmalloc only on failure. It also uses GFP_NOW=
ARN
> >
> > GFP_NOWARN does not exist.
>
> https://elixir.bootlin.com/linux/v6.4-rc7/source/include/linux/gfp_types.=
h#L38

That line defines "__GFP_NOWARN", not "GFP_NOWARN".
C is case- and underscore-sensitive. as is "git grep -w" ;-)

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
