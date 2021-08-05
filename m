Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBA3E15A7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB4489E63;
	Thu,  5 Aug 2021 13:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26489E63
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 13:27:26 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 t1-20020a4a54010000b02902638ef0f883so1294796ooa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qalves52XLJ7vOzp6TLw36xWZEzh27ZO+8Xjdq0smJo=;
 b=Xg+W1IE5Ssz6GXZHPkJ/ntmsbR5J/6Unp8BgOGq1KC6EtahsTDHNutF/BXcPNK64Xd
 gqs5SRJZh4ZqkGqBT39oAYIjQeCqTU7XfOvVNJ0BvdjM6S6lXMQvchoYvnCL+FGqmCZE
 iYgAK1TIJwyAzn51Q+NIyMOnXv9+jFDjnk3Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qalves52XLJ7vOzp6TLw36xWZEzh27ZO+8Xjdq0smJo=;
 b=k9PwZV8pDG/XZXd1F9EYKERnyfo+MH0PNCRvHiS7ZrnoAgkxPJEk/1UKmbzaNOHirW
 YiqiSeDqAxO/KrvSdgxdz8qJg2Q/6tSUm21uqBrZC3x1wQANnA7iz8PbVC/qF0d5/9t+
 0inpUKBpQZElcO0lK7Gfz4lQwipAZJYEDH4qgCXCbFYuHTcCDY9exjloD/SQVWDum8PX
 kUqZs2S2heEh9n1TPou1Moqr6Ob6BVLJh4xmuxw3V723QPhdKXI2b5J9QSgxnstj1H/q
 IRHTqpDHc0N81BPonuszcx2nwZ4m5swnGbwI/8th3PsJt+G3x5zLamRg4+ysBBIQ4o3l
 +Oog==
X-Gm-Message-State: AOAM532VrqDvPZOATz4lMdC2M9ouA1zi9cOpeOTcirWyh4UUj0dKeHks
 Lurtipwoh6XRTjo5pxw9xksUmamaKZqCRgkXqQBy4A==
X-Google-Smtp-Source: ABdhPJwdiWRyV6Abe33vo73yoJf4LzwhPZ4TtR31ItS5xOzjfO9OeNix/2PTEIfa21GRYE1Zw9naL7DKQnQkF40GwCw=
X-Received: by 2002:a4a:b402:: with SMTP id y2mr1161405oon.89.1628170045983;
 Thu, 05 Aug 2021 06:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-16-daniel.vetter@ffwll.ch>
 <67fa5409-df0d-df5f-161e-695394bd7eba@amd.com>
In-Reply-To: <67fa5409-df0d-df5f-161e-695394bd7eba@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Aug 2021 15:27:14 +0200
Message-ID: <CAKMK7uHYD9NXugkRQkeJ8qwHWF-tXP54+PMOexcvV7QqyrOcDw@mail.gmail.com>
Subject: Re: [PATCH v5 15/20] drm/sched: Check locking in
 drm_sched_job_await_implicit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, 
 Daniel Vetter <daniel.vetter@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
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

On Thu, Aug 5, 2021 at 3:19 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 05.08.21 um 12:47 schrieb Daniel Vetter:
> > You really need to hold the reservation here or all kinds of funny
> > things can happen between grabbing the dependencies and inserting the
> > new fences.
> >
> > Acked-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
>
> The function name in the subject line should be updated, apart from that
> feel free to add my rb to this patch.

Fixed locally and r-b added, I think the later parts of this series
will need to be resent anyway. Thanks for your review.
-Daniel

>
> Christian.
>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index 49e507f91ec0..1abb40b07324 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -715,6 +715,8 @@ int drm_sched_job_add_implicit_dependencies(struct =
drm_sched_job *job,
> >       struct dma_fence **fences;
> >       unsigned int i, fence_count;
> >
> > +     dma_resv_assert_held(obj->resv);
> > +
> >       if (!write) {
> >               struct dma_fence *fence =3D dma_resv_get_excl_unlocked(ob=
j->resv);
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
