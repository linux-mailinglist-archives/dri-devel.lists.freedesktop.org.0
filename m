Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5EF9C150A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 05:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495E410E265;
	Fri,  8 Nov 2024 04:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PPRRtDCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B317F10E265
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 04:00:17 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so33918766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 20:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731038416; x=1731643216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAM0QYMnxEBYV9BoGSFBZyE9KGFIHhzUSgRaGgFcXGc=;
 b=PPRRtDCoSUgAce52o0liaxrWhSSKKPRFJt8Ye2oRf6vfGzxgdWEgf6yJ2j/0ba7ZeB
 tTXso5Ea4KAEdvLotEMOtGRUtYsCOf3UK/ghs08FmJAKdoo8WtjaYmMAnhuwKgobrbjH
 F4swbayjBajrPkZTRtBBJBc9Bbjvw2K6SlgMlcRPSFTgeGs+FiOFVEJOJ+V7YD2jlLRC
 1RKV1ai2ShA2zsV9n3tcpVm7SX1SdaMfUcOQDZWq89ZbnobPUYw1vp0zEEzjmk1Y7gI2
 kScjdCEV7E0H1waMo+Udy2EqifU6Q/VFruwsmOD75cSAjE7xY9uhp7W9o2cWNx8wYPN8
 XQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731038416; x=1731643216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAM0QYMnxEBYV9BoGSFBZyE9KGFIHhzUSgRaGgFcXGc=;
 b=qYhcEnDdqBG6MnFHh/FILJNMA7t5Qm1WYZ976UfxGRXC0VFiTk2NOZ40X0QVWCAxHq
 0iGhjmB0hIy5WdxOGa9hgxFBrbdYG560i5Z3Qo5OS1qT6S3hMm2KnYNJ4i7XLhjnb5H9
 qTyCgODAzsPdZkawGZ6hHQRfF/mlbvX1RQLW+ZSlrz8/wlweZJwxHX1bKy6ElQa9w+fz
 XuCvG9TTs8zYOOEaLmByARHoqt60byP55UU+xlpzn4UeHxc3XHekrsSidFCess2dFPqL
 ShgpVCisIZ6WKExKjnAJcVLDyeq2kLEgY2DYp7dqq9QcBPAzO771hao4jVmhKvU0wj1g
 YEnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvhalDrNuU8AVsZbPiQlDvwJpTUD9bw88NG8a6/7ZUdEEpXurgJ9JMrCn+akCR/i/kGsquLPnvlX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRnCVyO3YEb5JBV6yL2Ya6RcdandCGxc2cRJFTgVRUQKDXRDkX
 zGfT8un9M1kD6h93WrhbuCFgWCceXIBn3tkHJlDnC9I1U0L4dB8cFhXlO8BvkboO3iUfGzEFm0T
 7CQMCBaIP6jtic+QTyvWeL/2d+pE=
X-Google-Smtp-Source: AGHT+IEnXXzAq9QDXVim9nkhGcbbyE3zq1TU++IWts912pEkWgu8An5ocGHYEXiGwyf+pljZD6++kN/2Y2N7Uydi3D0=
X-Received: by 2002:a17:907:2d0b:b0:a9a:c03:ebc8 with SMTP id
 a640c23a62f3a-a9eeffe9de6mr107584766b.37.1731038415728; Thu, 07 Nov 2024
 20:00:15 -0800 (PST)
MIME-Version: 1.0
References: <20240918133956.26557-1-christian.koenig@amd.com>
In-Reply-To: <20240918133956.26557-1-christian.koenig@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 8 Nov 2024 14:00:04 +1000
Message-ID: <CAPM=9tzACady1QN_wMaZ_WP3n_pftAGgGkATOQWOG+n+Zvjifg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Sima Vetter <sima@ffwll.ch>
Cc: dakr@kernel.org, pstanner@redhat.com, dri-devel@lists.freedesktop.org, 
 ltuikov89@gmail.com
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

On Wed, 18 Sept 2024 at 23:48, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Tearing down the scheduler with jobs still on the pending list can
> lead to use after free issues. Add a warning if drivers try to
> destroy a scheduler which still has work pushed to the HW.
>
> When there are still entities with jobs the situation is even worse
> since the dma_fences for those jobs can never signal we can just
> choose between potentially locking up core memory management and
> random memory corruption. When drivers really mess it up that well
> let them run into a BUG_ON().

I've been talking a bit to Phillip about this offline.

I'm not sure we should ever be BUG_ON here, I think it might be an
extreme answer, considering we are saying blocking userspace to let
things finish is bad, I think hitting this would be much worse.

I'd rather we WARN_ON, and consider just saying screw it and block
userspace close.

If we really want to avoid the hang on close possibility (though I'm
mostly fine with that) then I think Sima's option to just keep a
reference on the driver, let userspace close and try and clean things
up on fences in the driver later.

I think this should be at least good for rust lifetimes.

Having an explicit memory leak is bad, having a managed memory leak is
less bad, because at least all the memory is still pointed to by
something and managed, at a guess we'd have to keep the whole driver
and scheduler around, to avoid having to make special free functions.
Unless there is some concept like TTM ghost objects we could get away
with, but I think having to signal the fence means we should keep all
the pieces.

Dave.

>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index f093616fe53c..8a46fab5cdc8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler *sch=
ed)
>
>         drm_sched_wqueue_stop(sched);
>
> +       /*
> +        * Tearing down the scheduler wile there are still unprocessed jo=
bs can
> +        * lead to use after free issues in the scheduler fence.
> +        */
> +       WARN_ON(!list_empty(&sched->pending_list));
> +
>         for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>                 struct drm_sched_rq *rq =3D sched->sched_rq[i];
>
>                 spin_lock(&rq->lock);
> -               list_for_each_entry(s_entity, &rq->entities, list)
> +               list_for_each_entry(s_entity, &rq->entities, list) {
> +                       /*
> +                        * The justification for this BUG_ON() is that te=
aring
> +                        * down the scheduler while jobs are pending leav=
es
> +                        * dma_fences unsignaled. Since we have dependenc=
ies
> +                        * from the core memory management to eventually =
signal
> +                        * dma_fences this can trivially lead to a system=
 wide
> +                        * stop because of a locked up memory management.
> +                        */
> +                       BUG_ON(spsc_queue_count(&s_entity->job_queue));
> +
>                         /*
>                          * Prevents reinsertion and marks job_queue as id=
le,
>                          * it will removed from rq in drm_sched_entity_fi=
ni
>                          * eventually
>                          */
>                         s_entity->stopped =3D true;
> +               }
>                 spin_unlock(&rq->lock);
>                 kfree(sched->sched_rq[i]);
>         }
> --
> 2.34.1
>
