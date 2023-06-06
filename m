Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E3723FC7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A8110E221;
	Tue,  6 Jun 2023 10:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D95B10E221
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686047944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpv953l+q5fc9HmqRZAoq0E3Wcwa2EnYD8e+xZL0CXA=;
 b=NM5TCxMcY7c2ENeUO31I4lPg7b8MwMDLKcbuRRZtaogdAVyuz8jAfKmrKoXRL3rMCmfvyS
 eEzc/4QAktr15+LcZomMa/Hkc6hNFGt3VPzGC3hIeGzWo9EfAyjdqkIZTIvbQ0dfY1bsCs
 cMNz4wUCj1RnI3a70Vv2UKeqKyP+MXE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-yd0SZjlLNcOJzV72BZ9EHg-1; Tue, 06 Jun 2023 06:39:03 -0400
X-MC-Unique: yd0SZjlLNcOJzV72BZ9EHg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1e52292beso2658721fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 03:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686047942; x=1688639942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpv953l+q5fc9HmqRZAoq0E3Wcwa2EnYD8e+xZL0CXA=;
 b=CA4yhdgGl0xw7ou5NgVWDJTmGSEaVWyieCuYy3PXVDRwCgLAFOIkj8Bj+WfFvvyM2B
 Z846KAU4pwKQtFdHbijaa0uee4uu36T3bMhjwuQSPUXH6t5eymu2eIc28w95yoHveOUz
 4KG7S6e5qr86dR+6EGEXP/TEIO3rDuB0fHFK7MkMK4FReXg98XUGEUfIh8Ww/LtbpXlX
 /hMwgq8w/vI5QApTpFVYfGBpwHIwKwJWjTdDgIWTgWwJrt/Yg9hY/swq69zrzZ431GpY
 OYQtuK0dAgE9IlfOhkYqYlt+zHQNcnmFlVKDzVln94CvYAUQ0PB0xkYTS1tVE5oNR82r
 qyUg==
X-Gm-Message-State: AC+VfDw3sjRY2BiWyAZSA/qpm/D5XI3l/ag7XGAnriv1MBdxjBIk3pGl
 B0oBbhSu8j9VwRdIXw8y++wgpmUrIlT4wSq74U2p1rWmG6yqn+mPsSu1JdNDv3OxePH5am8eDMJ
 tGFU5BJq8I7yO2aHvJGcsJDZjD6xGsTe5Bk4/CFiAhmJy
X-Received: by 2002:a05:651c:3c2:b0:2b1:d8fa:3e59 with SMTP id
 f2-20020a05651c03c200b002b1d8fa3e59mr804610ljp.4.1686047942045; 
 Tue, 06 Jun 2023 03:39:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zn97oPcc9bAEPtfRK6uwJ9A0EpNgvvjiCSHupJDNIoKQNNQXMCMOfbu3Undc2TovwL4NGYatrgXpJavNHMaQ=
X-Received: by 2002:a05:651c:3c2:b0:2b1:d8fa:3e59 with SMTP id
 f2-20020a05651c03c200b002b1d8fa3e59mr804601ljp.4.1686047941701; Tue, 06 Jun
 2023 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230526091052.2169044-1-kherbst@redhat.com>
 <CAKb7Uvha74HOvny25aqnwzvvRLpc7+DNQm6QEAk4oxfTa1urJg@mail.gmail.com>
In-Reply-To: <CAKb7Uvha74HOvny25aqnwzvvRLpc7+DNQm6QEAk4oxfTa1urJg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 6 Jun 2023 12:38:50 +0200
Message-ID: <CACO55ts7gJfJ5ver+qvL5Tp9X+Kzk9ByvmXUD1hLH31NR+3pBg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: bring back blit subchannel for
 pre nv50 GPUs
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mimecast-Spam-Score: 0
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 5:21=E2=80=AFPM Ilia Mirkin <imirkin@alum.mit.edu> =
wrote:
>
> On Fri, May 26, 2023 at 5:11=E2=80=AFAM Karol Herbst <kherbst@redhat.com>=
 wrote:
> >
> > 1ba6113a90a0 removed a lot of the kernel GPU channel, but method 0x128
> > was important as otherwise the GPU spams us with `CACHE_ERROR` messages=
.
> >
> > We use the blit subchannel inside our vblank handling, so we should kee=
p
> > at least this part.
> >
> > v2: Only do it for NV11+ GPUs
> >
> > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/201
> > Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c  | 20 +++++++++++++++++---
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/n=
ouveau/nouveau_chan.c
> > index e648ecd0c1a0..3dfbc374478e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> > @@ -90,6 +90,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
> >                 if (cli)
> >                         nouveau_svmm_part(chan->vmm->svmm, chan->inst);
> >
> > +               nvif_object_dtor(&chan->blit);
> >                 nvif_object_dtor(&chan->nvsw);
> >                 nvif_object_dtor(&chan->gart);
> >                 nvif_object_dtor(&chan->vram);
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/n=
ouveau/nouveau_chan.h
> > index e06a8ffed31a..bad7466bd0d5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> > @@ -53,6 +53,7 @@ struct nouveau_channel {
> >         u32 user_put;
> >
> >         struct nvif_object user;
> > +       struct nvif_object blit;
> >
> >         struct nvif_event kill;
> >         atomic_t killed;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/no=
uveau/nouveau_drm.c
> > index cc7c5b4a05fd..9512f1c2f871 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -369,15 +369,29 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
> >                 ret =3D nvif_object_ctor(&drm->channel->user, "drmNvsw"=
,
> >                                        NVDRM_NVSW, nouveau_abi16_swclas=
s(drm),
> >                                        NULL, 0, &drm->channel->nvsw);
> > +
> > +               if (ret =3D=3D 0 && device->info.chipset >=3D 0x11) {
>
> Can you double-check that this is needed on NV15? IIRC there's some
> non-linearity of chipsets here which is why we had (some long time
> ago, not sure if it's still there), a chip class which would simplify
> such checks.
>

yeah, it's fine. The old code before 4a16dd9d18a0 had a
"device->info.chipset >=3D 0x11 ? 0x009f : 0x005f" check when creating
the blit object.

> Cheers,
>
>   -ilia
>

