Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35903ED8F7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 16:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832B2898BE;
	Mon, 16 Aug 2021 14:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEA3898BE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 14:28:51 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id g26so5696131ybe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 07:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xKJ8jyF18iUebPKiVfcp86JCzuYZ7rYQ2qa/RHFCFIc=;
 b=oAVVsf+dqLuQ1CqVAVLtnxNMqlQgyuD4EyqveY4HUOTn/9ZJBSPMeE5ite0gbzsA6Y
 r36520PGyTvxYXs34xO/bQRCUnk2OdX8qUHGUwuPt5huFYid2KIVRbqEF6l7agktK6WH
 vZFYD1zDfldkM0ef5VHJyCTKdFq4HDaF697dMgB+iaQAWBl506CYW3qIRpqiA+GH3sGJ
 zkU1GwD4A2QAAcxM4LEss5JOMbA7Lk0Q1vIcj1trsycVKFbFC4SCEnztL6UdG31xLIQ8
 wthn3gjaTdIbnfOJ4jjqyGRFF7Bop0TjMNSu8ssCpmgd+Gq7OPZORGbSpcWYs2fyz9QL
 YtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xKJ8jyF18iUebPKiVfcp86JCzuYZ7rYQ2qa/RHFCFIc=;
 b=U9tOak8lxRaJxKPPrP1d9JubOvU01DmKaDV6Ii3fJggay57huIai/Hnj7Ys7ezlypy
 0F3wWMBjje5i98M/4i6lv2WU9UjmiqEKwneyi5SWX4Uo727+7KrsbDJTTsd5iION2I2T
 IZBzKAaERQTaIn+e2CenyohaQRHfrPWdDAAKVE1ul8OsWa8mMtiNA/eMbL1vRBavHXVs
 6SKts3TjOvicqxdSxjTd9OpRyvtjFKTj952GiL7MUxNv8j+q5w13NoLlwvIaTr9BS5jp
 T3NRJoqhgtQ0KLNRNACbilweX/40xoB1/DDKYAjTYa0+OSTKUshhy3W2oGX8vB4yfk4b
 r2QA==
X-Gm-Message-State: AOAM530esiaDrebppHtFgDpKcrkxkM5duuKJR7h4Hq/3UEuys7brCWpX
 lxcdmiD3Ws4w+g2VtY1zVa0KsDbx7FMjY8g0fqiO4w==
X-Google-Smtp-Source: ABdhPJyL99HtYIoFyfc0P3QJrMp3nMQCUsacwxN28rh4i27dUHtvD1oUFOYZjm/OPUoVjrTYSI1vNBliSkn1DYm3XQo=
X-Received: by 2002:a25:c091:: with SMTP id
 c139mr22760475ybf.180.1629124130808; 
 Mon, 16 Aug 2021 07:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210810195906.22220-2-dmoulding@me.com>
 <9df167c7-2985-5b0a-9d54-70ec9d5d2eca@amd.com>
In-Reply-To: <9df167c7-2985-5b0a-9d54-70ec9d5d2eca@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 16 Aug 2021 09:28:39 -0500
Message-ID: <CAOFGe96xGaMeZPYw=EW0c7f58+D7jrVMU4FLUauvKUorXbZ6=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: ttm: Don't bail from ttm_global_init if
 debugfs_create_dir fails
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dan Moulding <dmoulding@me.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>
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

Makes sense

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Mon, Aug 16, 2021 at 2:40 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 10.08.21 um 21:59 schrieb Dan Moulding:
> > In 69de4421bb4c ("drm/ttm: Initialize debugfs from
> > ttm_global_init()"), ttm_global_init was changed so that if creation
> > of the debugfs global root directory fails, ttm_global_init will bail
> > out early and return an error, leading to initialization failure of
> > DRM drivers. However, not every system will be using debugfs. On such
> > a system, debugfs directory creation can be expected to fail, but DRM
> > drivers must still be usable. This changes it so that if creation of
> > TTM's debugfs root directory fails, then no biggie: keep calm and
> > carry on.
> >
> > Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init(=
)")
> > Signed-off-by: Dan Moulding <dmoulding@me.com>
>
> Good point, patch is Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>
> Going to pick that up later today.
>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/ttm/ttm_device.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> > index 74e3b460132b..2df59b3c2ea1 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -78,9 +78,7 @@ static int ttm_global_init(void)
> >
> >       ttm_debugfs_root =3D debugfs_create_dir("ttm", NULL);
> >       if (IS_ERR(ttm_debugfs_root)) {
> > -             ret =3D PTR_ERR(ttm_debugfs_root);
> >               ttm_debugfs_root =3D NULL;
> > -             goto out;
> >       }
> >
> >       /* Limit the number of pages in the pool to about 50% of the tota=
l
>
