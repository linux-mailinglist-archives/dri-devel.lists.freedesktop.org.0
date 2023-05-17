Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B27707374
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A2D10E475;
	Wed, 17 May 2023 21:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041DE10E2B4;
 Wed, 17 May 2023 21:01:31 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19a16355c51so811045fac.0; 
 Wed, 17 May 2023 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684357291; x=1686949291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eqSiyegxElvnB3HFZeHm2WOoQsWLWbFEvJXanwFNhfY=;
 b=IwVBRty6oTNkDgMKIGro+ZlrOEdD0O77sLaAVRRBfyCqujaNM1KuhMrMb+kFqL9ZHT
 7S/gJeL30miwkXRWwcMm0u0RAUHjc9Cmd3hMlcEsvOZ9BsaqKyoClgDFa6X6HsWrJ1Qj
 1WdLO2M/LLhbCf7RoVSQ+yBADb+/8/oLAJP7wXgVfYeGs8jgZCxLJebJd8huQpU1D3/y
 dnkkuf7itVysXFaEXdz3/UgEC5VGuLSDK2R5VPLm9FVM/PEzj40+3aU0EJPUkSG2Kqja
 mojwPZIfn5RsRxMnN7pyh7k7aXXuJSOPxBCxu8T2T6kEH4SCcG3nhJRyDqBu7QUcsk3L
 de3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684357291; x=1686949291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqSiyegxElvnB3HFZeHm2WOoQsWLWbFEvJXanwFNhfY=;
 b=CozxeaFGXFTS/QOJNFHebfbG/wDOG1zCWerF3rvplFR4zTIENtLFWm5/YLoY9LsaB9
 VfwjT88UIyG5XxQxApcc28IWzr/tZ7+I2UgeafSclHpT54NNUU7FCkqOhCbuK4UNxIGx
 jnY9mxmL+/Uoisv35t/T7QscL8v9+HAFEg20TMJ/mQRRcQPPQ3zrjhT36qSpBX5LMHrY
 4vY423Fm+Qlp0gF8GXXD/dK5hBohpFaXZCq1d0FWrJU22y9EVTPaVig8vBCgid3Yu+4m
 NlGBcYK7qyBgwCNfr26fcu6HK9KPacG5F2oyUhAGCTXlUKWnnGzFX67q0+vCjhzyRdpp
 2n2g==
X-Gm-Message-State: AC+VfDwHpNuPn19cc/zR028eGMsOKyFzchDugimtGQdcQkbfXCr/e5vK
 RQmxK6drlau8pZHvvSpdAS21kFVKfSMZJXY9Evg=
X-Google-Smtp-Source: ACHHUZ5DNQ5cEhCyZ7UiqvxPUUYqrgP9b4Bn8/Qo8vrVSgb4l+WK8gOAlq3ExN0A5Lpuoii/2LSgiKNsv2yt7Z5YUHE=
X-Received: by 2002:a05:6870:c4e:b0:187:c066:a39a with SMTP id
 lf14-20020a0568700c4e00b00187c066a39amr112477oab.16.1684357290743; Wed, 17
 May 2023 14:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230509102239.2935744-1-zhenguo.yin@amd.com>
 <20230509102239.2935744-2-zhenguo.yin@amd.com>
 <CADnq5_NbpWOhUWcKB8_4xdzs5gjMONQMYyuX7sfwvXjb=5TRyg@mail.gmail.com>
In-Reply-To: <CADnq5_NbpWOhUWcKB8_4xdzs5gjMONQMYyuX7sfwvXjb=5TRyg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 May 2023 17:01:19 -0400
Message-ID: <CADnq5_Nxqki-mCwp8SCuZmUDDFT-4YX_fsVSw1J=w0t=bKbjmQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/scheduler: avoid infinite loop if entity's
 dependency is a scheduled error fence
To: ZhenGuo Yin <zhenguo.yin@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: monk.liu@amd.com, jingwen.chen@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 11:02=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> + dri-devel for scheduler
>
> On Tue, May 9, 2023 at 6:23=E2=80=AFAM ZhenGuo Yin <zhenguo.yin@amd.com> =
wrote:
> >
> > [Why]
> > drm_sched_entity_add_dependency_cb ignores the scheduled fence and retu=
rn false.
> > If entity's dependency is a schedulerd error fence and drm_sched_stop i=
s called

typo: schedulerd -> scheduler

> > due to TDR, drm_sched_entity_pop_job will wait for the dependency infin=
itely.
> >
> > [How]
> > Do not wait or ignore the scheduled error fence, add drm_sched_entity_w=
akeup
> > callback for the dependency with scheduled error fence.
> >
> > Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>

The series looks good to me, but it would be good to have Christian
take a look as well.  Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index d3f4ada6a68e..96e173b0a6c6 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -384,7 +384,7 @@ static bool drm_sched_entity_add_dependency_cb(stru=
ct drm_sched_entity *entity)
> >         }
> >
> >         s_fence =3D to_drm_sched_fence(fence);
> > -       if (s_fence && s_fence->sched =3D=3D sched &&
> > +       if (!fence->error && s_fence && s_fence->sched =3D=3D sched &&
> >             !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
> >
> >                 /*
> > --
> > 2.35.1
> >
