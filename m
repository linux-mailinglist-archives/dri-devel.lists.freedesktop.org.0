Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC345391D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 19:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19BF6E087;
	Tue, 16 Nov 2021 18:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DA16E087
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 18:02:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n29so39208136wra.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G2KyZ/qnwHe6Ob4/X8lVgAGDvWYLw2dc5drFHDTcfDI=;
 b=KUlp7yVcs7F1MA0ScUwEGeBz2ECnCOxWrTB4OSScHyE1CTppyPMn2atZnH7h1dEreO
 iOnLWrm8Qn7oFsll9Z7oDixPn4RaBstzFqSF/ItBVjxNrDTJjAuj52BXRM6ACmj5Kj34
 HAvbyTUfSOA1If3AgcHTnk3iZZJcUGHMCG6qd9f0OFWYEoFYdHsycFPMJqaRdN5POkaN
 bUOU1wIcw9HraAmSWHh/AoF+RF34Nk4zdPHr3qkThkVzr+wYlB9oaBOXlyfZ1EkRmcNt
 TaaQRhQ2wcBetjEDPV+PGwVgq3Kvpg5v66zjT1XgiBlp6ju8HTgq4PEOaGEbvKAgj91O
 ZT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G2KyZ/qnwHe6Ob4/X8lVgAGDvWYLw2dc5drFHDTcfDI=;
 b=TvV8la3vuQCoKb9geOVC4dak7aiLoRTCcdLbIcM7ufEoB+l7OGRfTYg7mt/g7MulTn
 PeE5I6rGaVI6TajzPf9xf7+KnexWdHXQAmFYl3dMwRvuvXu/vrOFz3BFFSw0VpuDlmsV
 bIJeANslgZFITBwQWIhcxmehntTaHlXkQ7EVziHASLX1vzf3Q+3FB3smD7zN2VeFXkyV
 Ll8znBvG+nHBZL5mn2oH70qOfFx99/j8RoPToWkX3Nzs5kPuc0JFlBk5q0haIRTt98kw
 l2scQ1J1UuScADJPURJ0lh0bUnvBMtctUnm+o/XAvPVDbbK0ael7fTIlB7V5J3Is9l8S
 FJIQ==
X-Gm-Message-State: AOAM5309sAgcm0IAD6ynOZZXf9Xy/q6O7PcFk5vNUKuNZ6rdRhrxEucd
 TyU7tiOUXEA4fMogucGpdytDEuJNx5h4v1AVCLU=
X-Google-Smtp-Source: ABdhPJxSBhlB87hiyfrtT6nOYqn9TyrSPrVzsFOZ7Nr4fAGapPWNGJi5UVzyAy4r7iKs3S7ge89zK3+3inBgJZ0beo0=
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr11564510wri.251.1637085724346; 
 Tue, 16 Nov 2021 10:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20211116092519.99206-1-christian.koenig@amd.com>
 <20211116092519.99206-2-christian.koenig@amd.com>
 <YZPeXyCSaRRtUN21@phenom.ffwll.local>
In-Reply-To: <YZPeXyCSaRRtUN21@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Nov 2021 10:07:08 -0800
Message-ID: <CAF6AEGvmgE1N=c5YexCyxWTVUpC6V5LEtvUnxxZ3eNAA5z6MGg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: fix dropping the last fence ref
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: frattaroli.nicolas@gmail.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 8:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Nov 16, 2021 at 10:25:19AM +0100, Christian K=C3=B6nig wrote:
> > We need to grab another ref before trying to add the fence to the sched
> > job and not after.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I wondered first why this goes boom, but then I realized that in some
> cases add_dependency() drops the reference of the passed-in fence.
>
> Please also add the Fixes: line like in the previous patch.

oh, I sent https://patchwork.freedesktop.org/patch/463329/ before I
saw this.. it already has the fixes tag, and IMO a better description,
so I think you can just pick that one instead

BR,
-R

> Cheers, Daniel
>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 94fe51b3caa2..400d201c3c28 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -704,12 +704,14 @@ int drm_sched_job_add_implicit_dependencies(struc=
t drm_sched_job *job,
> >       int ret;
> >
> >       dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> > -             ret =3D drm_sched_job_add_dependency(job, fence);
> > -             if (ret)
> > -                     return ret;
> > -
> >               /* Make sure to grab an additional ref on the added fence=
 */
> >               dma_fence_get(fence);
> > +
> > +             ret =3D drm_sched_job_add_dependency(job, fence);
> > +             if (ret) {
> > +                     dma_fence_put(fence);
> > +                     return ret;
> > +             }
> >       }
> >       return 0;
> >  }
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
