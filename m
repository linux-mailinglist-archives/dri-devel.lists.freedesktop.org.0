Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6B7511E2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 22:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A4710E057;
	Wed, 12 Jul 2023 20:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F95E10E048;
 Wed, 12 Jul 2023 20:39:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fbcbf4375dso1595473e87.0; 
 Wed, 12 Jul 2023 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689194348; x=1691786348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3Aw+/y9y4d+i3cxzJxMrhK42+dQ+oiMMdAhC+nVYJU=;
 b=D65i0ZgJZryvUj4mF/jaQIHWSquZLHKSFoRxBZb00GXYUT8PREoM42YBQyW6a4GRuU
 tWmYjYU8Gnr1iRDSYv7vhgP5J2oCjk1eIOp+pQQMGDRkHi+14LjerjcTMo7JtIm+icr7
 8aZw9WlQLF1toaY62FQWLyftpPjTrrdykg9r7BElThk51Z+J4einHxBSlDsTBuYmszq8
 wo0TfaGUt6IItjuVuK/gEGhpssX7XD1nClK6Y+dlbFSZR4596hdUadHi+WMQjdkEt5tb
 S3LAYgHsil6bBeORflHQmb6wTlQdKc5f9MZeNe1ljdclQbjWoaxn0nchSittu4er0ZOy
 zPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689194348; x=1691786348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3Aw+/y9y4d+i3cxzJxMrhK42+dQ+oiMMdAhC+nVYJU=;
 b=Ssb80umYsjeUx2HugxM/h7Y1vu1t6ifXi9Dt108pp+t3BSX4PWqjBh3mT7hcmErdXV
 KgQ7jsvQ2RwdlBPgNuBUVaegKHE0DDXsPAqjij62xo23vf1SNFxteil5Qq6urSnts1JY
 PgzQMmJQjzm+wycVytLq2Ud3QmBFuNtquJ3lZXztC8vlCKGYLinQX/pApfVjj6YFrcdN
 nGkcAv3KkyS6cFDGiK3qkJ9xoQeK4WL2NDwdjoM686vU9jRfwzf5FljKpF64hKCPDodk
 SGjS1jhpLtVakAlUZ5zz0x89isIzyqDUwWN3G0yZHGLvKKpXV+rA8P4BDZUswe5x+Cus
 S/uA==
X-Gm-Message-State: ABy/qLbK74EwfgZxJNKwHJTi914w7j4IzaoXM+YxynxUny7e/2GOukXq
 ZfceM43Hcl748GT07bRXNkmvTLYGIyKho0SWJhc=
X-Google-Smtp-Source: APBJJlE4zSFvx6Zo3GKHIRV22wEE/iuCXt9jm8m6cfRi1vG5WKOsAupCfTIazj1pe2+m712CCradYuymkKMJMTKAtmc=
X-Received: by 2002:a05:6512:234d:b0:4f8:586a:d6ca with SMTP id
 p13-20020a056512234d00b004f8586ad6camr1125246lfu.9.1689194347888; Wed, 12 Jul
 2023 13:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230522201838.1496622-1-kherbst@redhat.com>
 <CACO55tuZeJZ6GTA+ooaXsSgde2Zy70qpe8Cg_AEfZRXtmd2LWA@mail.gmail.com>
 <CAPM=9txP3D8p9H=xCvBocFVssH=YP0h12FEOTnuTF7_pEUpRow@mail.gmail.com>
In-Reply-To: <CAPM=9txP3D8p9H=xCvBocFVssH=YP0h12FEOTnuTF7_pEUpRow@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 13 Jul 2023 06:38:56 +1000
Message-ID: <CACAvsv6-AJ4EHg7pNUWgsnCN0CYrO8gWd3NR8pu32a-wXSOjeA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr: Abort loading ACR if no
 firmware was found
To: Dave Airlie <airlied@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Jul 2023 at 05:31, Dave Airlie <airlied@gmail.com> wrote:
>
> On Tue, 23 May 2023 at 19:37, Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Mon, May 22, 2023 at 10:18=E2=80=AFPM Karol Herbst <kherbst@redhat.c=
om> wrote:
> > >
> > > This fixes a NULL pointer access inside nvkm_acr_oneinit in case nece=
ssary
> > > firmware files couldn't be loaded.
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
> > > Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers=
/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> > > index 795f3a649b12..6388234c352c 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> > > @@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
> > >         u64 falcons;
> > >         int ret, i;
> > >
> > > -       if (list_empty(&acr->hsfw)) {
> > > +       if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {
> >
> > Now thinking about this, it should probably also check acr->func...
>
> with that fixed if you think you need it,
I don't *think* you do.  I believe modprobe will fail for any case it
can be NULL.

>
> Reviewed-by: Dave Airlie <airlied@redhat.com>
>
> >
> > >                 nvkm_debug(subdev, "No HSFW(s)\n");
> > >                 nvkm_acr_cleanup(acr);
> > >                 return 0;
> > > --
> > > 2.40.1
> > >
> >
