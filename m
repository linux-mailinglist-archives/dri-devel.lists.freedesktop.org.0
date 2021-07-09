Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F173C2150
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 11:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AAC6E9F1;
	Fri,  9 Jul 2021 09:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934D6E9F5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 09:15:52 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id l26so11457717oic.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jaix3U7G/PB87Ay07enXH/OSVYtCPLdi40u5BPIOv1s=;
 b=TwhB3mut8U7oIcVxsmZ6E535sHZwGLthPxsFmOOVY+1LchLYvrr58HnWTpEwBqLMZu
 zcADVGUGUSehj1h9D6GEHNW6QzTlHjuAQc5K2jQ8zGImBrn1Y3qZD5irpgvPo9f9ZD9F
 9yoeEfsfKgt0ewtqZ1Nndga3l/2KHdcTQRf1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jaix3U7G/PB87Ay07enXH/OSVYtCPLdi40u5BPIOv1s=;
 b=sjxp1EFnCWx+ugYLqouSmO4qWNcuK+u92H1LOBo7nxz26jN0bn7QTHdBGpx51Mv5XO
 r+iVsIDhzSkHxSQhSS5mRT4NfMY/9AlgkF4G/6V6OghcUc7RDXrfQm+IWdnOmATflXjH
 4NCjaA80/FwXPN2GIuQPfh/cWuZzms8tqcKXPJVP+IZ03KHiWEGy0vYY45MnJi+g5/i8
 /IfP8/mG2EI6QXhAysWvXMNjrjLrXyCndPenj0aZgQ0XNB5jdfvSrgwMmpTJXFVD2iTq
 r6EVGS4b9Z2oiYkD3kHS4BH+jKW4m7yR2YV70pc/b8h7X3wUN+M3coawggzZxH/AkNqp
 yD9Q==
X-Gm-Message-State: AOAM532c47TCgvpRuouZIcv3r8asPyw9VA0KnNKjmzQBZwhm1BGB0lXS
 DQpoRQWlqRD9GcczMRrpnfBHXwIXU+dSs+4S2S7s+A==
X-Google-Smtp-Source: ABdhPJzdY5JqorO3ZHqZxNzPMPfbxu3TUa15r/b5G4RPJXaiHeVYNoRHYk7zvU/nMnz2sOTggwkJa6qMTzOHwoVFhfY=
X-Received: by 2002:aca:eb43:: with SMTP id j64mr7192215oih.101.1625822151219; 
 Fri, 09 Jul 2021 02:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-17-daniel.vetter@ffwll.ch>
 <2582129c-b0c3-831c-a3b4-caa51be95095@gmail.com>
In-Reply-To: <2582129c-b0c3-831c-a3b4-caa51be95095@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Jul 2021 11:15:40 +0200
Message-ID: <CAKMK7uGGv+6B9642XX1WordAkan7XbMyGCumaJGsQYxb+qQWfQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] drm/msm: always wait for the exclusive fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 10:48 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >
> > Drivers also need to to sync to the exclusive fence when
> > a shared one is present.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > [danvet: Not that hard to compile-test on arm ...]
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
>
> Wondering a bit why you have that in this patch set now.
>
> But any objections that we push this now?

Cover letter of the first one version explained that I just wanted to
have all the msm fixes in this series, for completeness. But yeah I
thought I put an r-b on your series for this? There was one patch
where I was unhappy with the docs, but there's a new patch for that
now here.
-Daniel

> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
> >   1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 141178754231..d9c4f1deeafb 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *ob=
j,
> >       struct dma_fence *fence;
> >       int i, ret;
> >
> > -     fobj =3D dma_resv_shared_list(obj->resv);
> > -     if (!fobj || (fobj->shared_count =3D=3D 0)) {
> > -             fence =3D dma_resv_excl_fence(obj->resv);
> > -             /* don't need to wait on our own fences, since ring is fi=
fo */
> > -             if (fence && (fence->context !=3D fctx->context)) {
> > -                     ret =3D dma_fence_wait(fence, true);
> > -                     if (ret)
> > -                             return ret;
> > -             }
> > +     fence =3D dma_resv_excl_fence(obj->resv);
> > +     /* don't need to wait on our own fences, since ring is fifo */
> > +     if (fence && (fence->context !=3D fctx->context)) {
> > +             ret =3D dma_fence_wait(fence, true);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> > +     fobj =3D dma_resv_shared_list(obj->resv);
> >       if (!exclusive || !fobj)
> >               return 0;
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
