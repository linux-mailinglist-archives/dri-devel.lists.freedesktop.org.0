Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016314118C9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 18:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15E46E550;
	Mon, 20 Sep 2021 16:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B976E546;
 Mon, 20 Sep 2021 16:01:01 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t189so12856750oie.7;
 Mon, 20 Sep 2021 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1fYDaDdupQKRTQy3G0eIhoK53MQKmBSMDwabNWa7/AU=;
 b=p+7utRst/qqmYc/Px7XXYaJgdlSDfqy4DcYoqfugUv72qnBhSeS6x8yigOpO5/Irs1
 DXbeT+XLOKrxi9YAYfoERpvwvPu6wqDAMsB9Pr3oCiPpS0N3dUNAboL2krs2g2kiDce8
 6jocJnGRBQsm5q/mFMPA8l2L3tl/HvgjIaE9sg7SZbmuJz7S3Sww2wq8+nOCz5rSB+C6
 SDZ36P0yqZ3Tap0VKX87E+Iy24pKtDer99RSVPfvyIP3o4iRhH4lyPRk1XvXR0y3ji3j
 VibBIYsMaTsj2Chkl3iYPM2JAE7OLhkYywMWflBeRa3uPoS02LeQkjbvf3pOrCQkD2vB
 KuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1fYDaDdupQKRTQy3G0eIhoK53MQKmBSMDwabNWa7/AU=;
 b=38C9ExtyvvohPHevkFJolE8Y9Xb+j/7vQDSU12raQuqpmRClnNZevGDVN8Sl/bRvWk
 4sFUYH1mDhGnweBG9HsH4e7uODIOau4UZ1ugBBqhmfHr0Oh7x9an8Jv9I4ra0MLjAiMK
 5gFx/YrZzbdXtSGDeAghM47xq/YTTC9lmCT5F7XCsxDGbQU8/eqa6LycJeJrvx+aBQnM
 HAjbGD6i1LUOOaovw+oSpNacQlah15NuIATA7W3ju/vw7XzOW9pVvdne1Ia0SZU6d2Oq
 aLXWrffYwMzLZBcYtw/6pgcoaQJkyacH0ueld0uQnWtrdHfoGRgmYsB2cbDxfdw7mZiY
 fhcQ==
X-Gm-Message-State: AOAM530W/dJ0kc0wMvvdi3a1DNyCCJFMSNv40fx78BUpLQT8SY1W92ww
 c9322M5TI5SHvTqbM0Tp9WWJebmQXbOFT6F5tB4=
X-Google-Smtp-Source: ABdhPJwOHHWgd9SO7q7Cydk6uePKV4tjaBzzczM3AW42smRP6Ur2Lr8KyLJmghYXdOlIIRSW5g1naekO1sTu9UWOqw8=
X-Received: by 2002:aca:ab4d:: with SMTP id u74mr13285127oie.120.1632153661084; 
 Mon, 20 Sep 2021 09:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210918094157.4770-1-yangzhiwei@uniontech.com>
 <484936f6-86e8-2078-3739-674a04283666@gmail.com>
In-Reply-To: <484936f6-86e8-2078-3739-674a04283666@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Sep 2021 12:00:50 -0400
Message-ID: <CADnq5_PwkRb=2z2ak5f8gnAwzQLdE_6ACjtNvpe+6hECxxsCpA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix uninitialized bool variable
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Zhiwei Yang <yangzhiwei@uniontech.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Mon, Sep 20, 2021 at 3:44 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
>
> Am 18.09.21 um 11:41 schrieb Zhiwei Yang:
> > The bool variable detected_hpd_without_ddc in struct radeon_connector
> > is uninitialized when first used, that may cause unnecessary ddc ops.
> > Make it as false when a new connector is alloced.
> >
> > Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
> > ---
> >   drivers/gpu/drm/radeon/radeon_connectors.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/d=
rm/radeon/radeon_connectors.c
> > index fe12d9d91d7a..c1987a66373f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> > +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> > @@ -1866,6 +1866,7 @@ radeon_add_atom_connector(struct drm_device *dev,
> >       bool shared_ddc =3D false;
> >       bool is_dp_bridge =3D false;
> >       bool has_aux =3D false;
> > +     bool detected_hpd_without_ddc =3D false;
>
> In general good catch, but I don't see the need for a local variable here=
.
>
> Just initialize the member directly or even better change the allocation
> of the connector into a kzalloc().

This is already the case:
        radeon_connector =3D kzalloc(sizeof(struct radeon_connector), GFP_K=
ERNEL);
So I don't think this patch is necessary.

Alex

>
> Christian.
>
> >
> >       if (connector_type =3D=3D DRM_MODE_CONNECTOR_Unknown)
> >               return;
> > @@ -1923,6 +1924,7 @@ radeon_add_atom_connector(struct drm_device *dev,
> >       radeon_connector->shared_ddc =3D shared_ddc;
> >       radeon_connector->connector_object_id =3D connector_object_id;
> >       radeon_connector->hpd =3D *hpd;
> > +     radeon_connector->detected_hpd_without_ddc =3D detected_hpd_witho=
ut_ddc;
> >
> >       radeon_connector->router =3D *router;
> >       if (router->ddc_valid || router->cd_valid) {
> > @@ -2384,6 +2386,7 @@ radeon_add_legacy_connector(struct drm_device *de=
v,
> >       struct radeon_connector *radeon_connector;
> >       struct i2c_adapter *ddc =3D NULL;
> >       uint32_t subpixel_order =3D SubPixelNone;
> > +     bool detected_hpd_without_ddc =3D false;
> >
> >       if (connector_type =3D=3D DRM_MODE_CONNECTOR_Unknown)
> >               return;
> > @@ -2414,6 +2417,7 @@ radeon_add_legacy_connector(struct drm_device *de=
v,
> >       radeon_connector->devices =3D supported_device;
> >       radeon_connector->connector_object_id =3D connector_object_id;
> >       radeon_connector->hpd =3D *hpd;
> > +     radeon_connector->detected_hpd_without_ddc =3D detected_hpd_witho=
ut_ddc;
> >
> >       switch (connector_type) {
> >       case DRM_MODE_CONNECTOR_VGA:
>
