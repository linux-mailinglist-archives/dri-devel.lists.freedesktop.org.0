Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A7751143
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 21:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF7810E5D7;
	Wed, 12 Jul 2023 19:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAAC10E5D6;
 Wed, 12 Jul 2023 19:31:03 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b8decf09e1so6445470a34.0; 
 Wed, 12 Jul 2023 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689190262; x=1691782262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVtSCpW+Tth4mC3MWGAVEkXOAuk+fenRNi3sCg0wW/s=;
 b=r32FMANDItl8SWdMt3H1qMFDlAHWoxWPe6MrEB33WVrdTB8FoKKtRmyAx5c6yFfK0e
 1oOPzWmuNc6xljTGS/Z3ai96BCd7pCg45e+Mv9tfebdsFfxen9ScPuKZHpaJGC/4EQv+
 J1/KhQ5rUKe0SFwZ/8/5bbM3Mn7TINH3RXSbno8ZRUvc6MTmhZlHZ8Ih71+15+c9jfR2
 CjxvCRzZBzoQ9J3PUoJqXnwgHHlpNcC0ZF1szDyIyPteTEErrvpAfhbKAl0XqeufIRaN
 sjL8Wt+uGr7P+5xN+x7EFC+Ha50BJcGI0UCqoNr733Z/dyLS0NZjjZbGHe8F+jsYAbNm
 Qdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689190262; x=1691782262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVtSCpW+Tth4mC3MWGAVEkXOAuk+fenRNi3sCg0wW/s=;
 b=g+Se1abqMQJzPeyFHifBlb2DOIRveKTbTFgmGkBhc6slVRFwVzJfz6GdQJn2dR5nak
 f3vm5UMoUvHX2UJAb3zu2cic2TB7PTNme9NJ0AygCJSRYU+Vqjba81BGZNqaCjNBvyir
 6wN09tJlOj1el7tQ7Q6vB3jq+zNs7VOp5EmpLmWzgKiSjhaFfGBpVNWLTKSBMp6iiv1d
 1amsXhjKz2/OUGFHii5/4bElWjP90ltOSC5DDcm/efI06GPUly1jxc4Av9CxoXtn6v5P
 Dhr2mWuBEScx+obUj+V726KilVmPL99LSljt9kYYSd+jI9gX9Y7QpcsDGsb+kIyxtavZ
 whkA==
X-Gm-Message-State: ABy/qLYjQ39LKXh9X358B6Q3GHbVg6sJFISwMX2mlqP0pbz4uZQZaPbQ
 F74D8vBuHL7DL35kTyKVSCKokIzW3QujXBMJu04=
X-Google-Smtp-Source: APBJJlEt110G42kGYTiSWg5RkQiygRnhzKc4MikyaoVcdGUWksdFdFLUXc1bxTG+gXM5gOw+VMyJ2yO+C7wyuDUzvdI=
X-Received: by 2002:a05:6870:b24e:b0:1b3:e46a:7164 with SMTP id
 b14-20020a056870b24e00b001b3e46a7164mr21502131oam.40.1689190262500; Wed, 12
 Jul 2023 12:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230522201838.1496622-1-kherbst@redhat.com>
 <CACO55tuZeJZ6GTA+ooaXsSgde2Zy70qpe8Cg_AEfZRXtmd2LWA@mail.gmail.com>
In-Reply-To: <CACO55tuZeJZ6GTA+ooaXsSgde2Zy70qpe8Cg_AEfZRXtmd2LWA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 13 Jul 2023 05:30:49 +1000
Message-ID: <CAPM=9txP3D8p9H=xCvBocFVssH=YP0h12FEOTnuTF7_pEUpRow@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: Abort loading ACR if no firmware was
 found
To: Karol Herbst <kherbst@redhat.com>
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
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 19:37, Karol Herbst <kherbst@redhat.com> wrote:
>
> On Mon, May 22, 2023 at 10:18=E2=80=AFPM Karol Herbst <kherbst@redhat.com=
> wrote:
> >
> > This fixes a NULL pointer access inside nvkm_acr_oneinit in case necess=
ary
> > firmware files couldn't be loaded.
> >
> > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/212
> > Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/acr/base.c
> > index 795f3a649b12..6388234c352c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c
> > @@ -224,7 +224,7 @@ nvkm_acr_oneinit(struct nvkm_subdev *subdev)
> >         u64 falcons;
> >         int ret, i;
> >
> > -       if (list_empty(&acr->hsfw)) {
> > +       if (list_empty(&acr->hsfw) || !acr->func->wpr_layout) {
>
> Now thinking about this, it should probably also check acr->func...

with that fixed if you think you need it,

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> >                 nvkm_debug(subdev, "No HSFW(s)\n");
> >                 nvkm_acr_cleanup(acr);
> >                 return 0;
> > --
> > 2.40.1
> >
>
