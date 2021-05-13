Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBC3800F7
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 01:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C696EDED;
	Thu, 13 May 2021 23:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140AA6EDED
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 23:42:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA5AE6143C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 23:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620949336;
 bh=Q+ZtNVyGmIl0eXIQdcuUrxm022erUcWDgP5SQNOKYQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iH49wNJ+6khauFhNYkW4TjYuSUoVNxpNAXZwdwX1vzihY0Q/34epUJFzJ1oKStd42
 WZAsWkiNHkMrVshVnZyX9l06691jq9xHRcRuhboOHs0sSxTd743O2L9mnvP6Dy4//5
 at++XhheqRV58LqTyVD2TYMsYsRfkrcCFQ4Y7kjh7wFUezH6ACP8dHk/Gd8gvKFVwv
 GB0WzLc0DZ0amS16V59vFKKOHpJlHASkBkV8HfFarusvPeESM1BwulNWbue2EKaaiJ
 mK6zQyBivpA0SCi03Jdeq707COQjTm9ON/Q/HYni9EDWx85PYqigEDbRFLdfUmfOLB
 KU5Dg6bY8VpgQ==
Received: by mail-ej1-f53.google.com with SMTP id u21so42138849ejo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 16:42:16 -0700 (PDT)
X-Gm-Message-State: AOAM532px94TTizNTj0HVvbQQ8awJz0zXsC6ZSp5Jzyow5WgdPj/AGE9
 h38iUL/9Qcv8veCK+4tUMR4kk8MJpFywKjz+XQ==
X-Google-Smtp-Source: ABdhPJwjsoRig7IOCycfYr7+vBwT5PLJsBVb7geAGrFTpeUYk95619iAQHs5U3NzTbepCRoakv8rIPSUJ04vCjqg1co=
X-Received: by 2002:a17:906:3da9:: with SMTP id
 y9mr46028343ejh.303.1620949335233; 
 Thu, 13 May 2021 16:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210410034841.16567-1-wangli74@huawei.com>
 <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
In-Reply-To: <CAAOTY_-qNeoZT1CorqhBrQe888tG21TF=LnPkUgymv=rQ8-YAA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 14 May 2021 07:42:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95X+z83Ng8EO3zwbAqqE9E1=YQYT+3e-N2KHTOVqfsKg@mail.gmail.com>
Message-ID: <CAAOTY_95X+z83Ng8EO3zwbAqqE9E1=YQYT+3e-N2KHTOVqfsKg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wang Li <wangli74@huawei.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Wang:

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2021=E5=B9=B44=E6=9C=8812=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:32=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi, Wang:
>
> Wang Li <wangli74@huawei.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=8810=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8811:31=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > pm_runtime_get_sync will increment pm usage counter even it failed.
> > Forgetting to putting operation will result in reference leak here.
> > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > counter balanced.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wang Li <wangli74@huawei.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index 54ab3a324752..f1954242d8f6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -259,7 +259,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc=
 *mtk_crtc)
> >                 drm_connector_list_iter_end(&conn_iter);
> >         }
> >
> > -       ret =3D pm_runtime_get_sync(crtc->dev->dev);
> > +       ret =3D pm_runtime_resume_and_get(crtc->dev->dev);
> >         if (ret < 0) {
> >                 DRM_ERROR("Failed to enable power domain: %d\n", ret);
> >                 return ret;
> > --
> > 2.17.1
> >
