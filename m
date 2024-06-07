Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB988FF9A1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 03:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79E210E1FA;
	Fri,  7 Jun 2024 01:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8fBgdCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EE710E1FA;
 Fri,  7 Jun 2024 01:37:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-35ef1e928c9so1882342f8f.3; 
 Thu, 06 Jun 2024 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717724257; x=1718329057; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+bktKVr+7XJccCJBBtxqF+Ee7b46k9Prkz6DvcgbEsM=;
 b=f8fBgdComdRslXRfOTmLtR7PwmUrg106jAeDCEdiillPXXpUSwPPRKzcnfyqdZSnlz
 AeFXdFtCNmWY8HAeEFjvCHeOKoJbQw7Qvx9rWunvgNwbkf+2hK/TaxbNAKHcGUwzguaS
 m09mllWa4U4iiU2jecdrhdhG72EkIK8GaQa5QPVm2fAC9ScovEcSW5w64ToLl/ZfL//t
 oNFuF3UEjUDNV7kVr3l1ddVallPEv9N+w8BnW5s0+2HTAvCMGoXGX2TUU1eLIABXPJBo
 XNM2MxwtkMey88Yf91sfCHHzjmQEGwb8Ofoqv7KOOIgSrvxfcIxgUHsVyIHiq/t6vBCE
 King==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717724257; x=1718329057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+bktKVr+7XJccCJBBtxqF+Ee7b46k9Prkz6DvcgbEsM=;
 b=pSUCAJ0Tezx06QK+vPQ+E3LqGEiFcZj87+pEsAyJtIa8TmIlrS6G/YtBf7lx1qc6Ru
 r4ZaKZ/qzC/JwhU3KA6WfmM6d+S/LnLfdpyWyMsCx6/WR7FOXgl0ClpVBssJVQOhX6XC
 6Rjq54vLhh6+EkTkZ+LMW2ISuboBw7Ruk4L49LtHdHvE26vwoYIPHIc4ZaPaQPg6EoWG
 /SsIqmuIMEs4bPcPkno0bS2tRQ6acka+mw2YG21WTBi/tbrjPZGFsRRJeWCZ1jGPjG4Z
 D1YpCy7TWTlaI8ijJvykNNaX/zr0rjM6dHmKrOSrrNClqFigGKTjuBCv78L6p5MzPQLZ
 JNUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV04SShUvOrJi2lKMjWTbPDXZg0KBjxcu7e3ocX0I7WR1fugaRnHpYTV4XrvOCa9zhSJaNTG3hno7W8Vc1GiAjHrImc0WRnf1TChLjyeg==
X-Gm-Message-State: AOJu0Yxgc9lSaLErpMiDjFn47bMCKzi4m0v+rzRN+b9cEvfYM8dtff2B
 Pn74qw2QfBKArf481tkwQqI620gq7vL9a5cHjtHemPcs+jh5f1q5cRleWYzxBcopHbKj6AmXcIQ
 mhz46jPWaGHWp3nd7KXgXlUpaMyQ=
X-Google-Smtp-Source: AGHT+IFJs0bx4HiK7iXnZrVWQbhoUZhYjMnDilfoT4Vpldl2o7Rm8Pb9lbJh5bI2Us9trrHDnplx1412h2GslrJLGLg=
X-Received: by 2002:a05:6000:1201:b0:354:f489:faf with SMTP id
 ffacd0b85a97d-35efed15cccmr1043852f8f.1.1717724256433; Thu, 06 Jun 2024
 18:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240528215344.2442-1-anarsoul@gmail.com>
 <d388ebb2-fdef-400f-a62e-67352385effd@nvidia.com>
In-Reply-To: <d388ebb2-fdef-400f-a62e-67352385effd@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Jun 2024 11:37:24 +1000
Message-ID: <CAPM=9txUt=vRyO=ozZNHhreb3Lsn6Pjtm=Na=NfU-D-pmnyxOw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
To: Ben Skeggs <bskeggs@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

readding original poster

On Wed, 29 May 2024 at 09:57, Ben Skeggs <bskeggs@nvidia.com> wrote:
>
> On 29/5/24 07:52, Vasily Khoruzhick wrote:
>
> > If the card doesn't have display hardware, hpd_work and hpd_lock are
> > left uninitialized which causes BUG when attempting to schedule hpd_work
> > on runtime PM resume.
>
> Hi,
>
> Good catch, thank you for looking at this.  A couple of initial comments
> below:
>
> Ben.
>
> >
> > Fix it by adding headless flag to DRM and skip any hpd if it's set.
> >
> > Fixes: ae1aadb1eb8d ("nouveau: don't fail driver load if no display hw present.")
> > Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/337
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >   drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
> >   drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
> >   drivers/gpu/drm/nouveau/nouveau_connector.c |  3 +++
> >   drivers/gpu/drm/nouveau/nouveau_display.c   | 11 ++++++++++-
> >   drivers/gpu/drm/nouveau/nouveau_drv.h       |  1 +
> >   5 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > index 13705c5f1497..4b7497a8755c 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> > @@ -68,7 +68,7 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
> >       if (nv_two_heads(dev))
> >               NVWriteCRTC(dev, 1, NV_PCRTC_INTR_EN_0, 0);
> >
> > -     if (!runtime)
> > +     if (!runtime && !drm->headless)
> >               cancel_work_sync(&drm->hpd_work);
> >
> >       if (!suspend)
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 88728a0b2c25..674dc567e179 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -2680,7 +2680,7 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
> >                       nv50_mstm_fini(nouveau_encoder(encoder));
> >       }
> >
> > -     if (!runtime)
> > +     if (!runtime && !drm->headless)
> >               cancel_work_sync(&drm->hpd_work);
> >   }
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > index 856b3ef5edb8..b315a2ef5b28 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > @@ -1190,6 +1190,9 @@ nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
> >       u32 mask = drm_connector_mask(&nv_connector->base);
> >       unsigned long flags;
> >
> > +     if (drm->headless)
> > +             return;
> > +
>
> You shouldn't need this change, the function can't be called if there's
> no display.
>
>
> >       spin_lock_irqsave(&drm->hpd_lock, flags);
> >       if (!(drm->hpd_pending & mask)) {
> >               nv_connector->hpd_pending |= bits;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> > index aed5d5b51b43..1961ef665e97 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > @@ -450,6 +450,9 @@ nouveau_display_hpd_resume(struct drm_device *dev)
> >   {
> >       struct nouveau_drm *drm = nouveau_drm(dev);
> >
> > +     if (drm->headless)
> > +             return;
> > +
> >       spin_lock_irq(&drm->hpd_lock);
> >       drm->hpd_pending = ~0;
> >       spin_unlock_irq(&drm->hpd_lock);
> > @@ -468,6 +471,11 @@ nouveau_display_hpd_work(struct work_struct *work)
> >       int changed = 0;
> >       struct drm_connector *first_changed_connector = NULL;
> >
> > +     WARN_ON_ONCE(drm->headless);
> > +
> > +     if (drm->headless)
> > +             return;
> > +
>
> Same here.
>
>
> >       pm_runtime_get_sync(dev->dev);
> >
> >       spin_lock_irq(&drm->hpd_lock);
> > @@ -635,7 +643,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
> >       }
> >       drm_connector_list_iter_end(&conn_iter);
> >
> > -     if (!runtime)
> > +     if (!runtime && !drm->headless)
> >               cancel_work_sync(&drm->hpd_work);
> >
> >       drm_kms_helper_poll_disable(dev);
> > @@ -729,6 +737,7 @@ nouveau_display_create(struct drm_device *dev)
> >               /* no display hw */
> >               if (ret == -ENODEV) {
> >                       ret = 0;
> > +                     drm->headless = true;
> >                       goto disp_create_err;
> >               }
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index e239c6bf4afa..25fca98a20bc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -276,6 +276,7 @@ struct nouveau_drm {
> >       /* modesetting */
> >       struct nvbios vbios;
> >       struct nouveau_display *display;
> > +     bool headless;
> >       struct work_struct hpd_work;
> >       spinlock_t hpd_lock;
> >       u32 hpd_pending;
