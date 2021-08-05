Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED43E159F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84426EA4A;
	Thu,  5 Aug 2021 13:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8A86EA4A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 13:25:38 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 g5-20020a9d6b050000b02904f21e977c3eso5091587otp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZvB+WTalaaLFDM9yKMubNCZNxYrXJL3/4wxE5xbXTa4=;
 b=OMyh4VOwGOzGNMForJllGM+oW5KWHuZd6h3l8ashDKMcFGf0HFHUWSJ7RYl8VUVYQg
 Z3QtgFKIzlEUq1cUC82+jp8M5D7Ums6c+A4rWnwEOqMnFCjxWgZgd/Q4w5TZYxAe9NDC
 vWq91tU3hzkF5CuB91brwzUsbubydQiUJtMTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZvB+WTalaaLFDM9yKMubNCZNxYrXJL3/4wxE5xbXTa4=;
 b=YlmXjTZdwoI8YLL2BjhlRLinmLdBmhwP4Lp/WCDMtDbbPPIw02aRG26Z017YCH5mbG
 QGMjA13KLXZCZAsEU+HaZ+MFBrCaWpc4drRJ94C1Mo13Ne+H24wcE5dQMFStMudqJ6aT
 mcq1pxbgyKbsLrJea24TTkElPnbd+/VMa1LZxt37yKSa3gX5Oc65ZjFlnr1ImkQqnYI2
 ZpSSNVgsj46qLqYIH1okrp2d9nm3JAxUjM38VCDpWDCZEDtajt4x5UQnQwuomLSh4sYX
 FqoLc2D2dE/dak+ppSb05IaOFBGIwJDCjzR9+/Dl/EWVu3T/xqV/DfrUOUWA6wNr7ILO
 BfpA==
X-Gm-Message-State: AOAM5313xudwMmozFEh182ajDT9VI8S7ycYwmpTL45s3ZKu3SfKunh4O
 eutzvfIUHHYHFEr7mXW4OAHb8tdh/aNhWQMmy8YjIA==
X-Google-Smtp-Source: ABdhPJxE+UPcdtV7MJon3byNj6SopD16xmgansPYcAvxtPPI0xopgOxb0WODPXxagU7ceg0mB6sZjZSb0y92nr/+Z24=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr3742931otp.188.1628169937853; 
 Thu, 05 Aug 2021 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-15-daniel.vetter@ffwll.ch>
 <f883e6af-284c-9400-ca3d-b5192d11fb01@amd.com>
In-Reply-To: <f883e6af-284c-9400-ca3d-b5192d11fb01@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Aug 2021 15:25:26 +0200
Message-ID: <CAKMK7uEVbTOuJVvQDybFM+9x4LUP+ojcCzWfkp4sau3oX7fjXQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] drm/sched: Don't store self-dependencies
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>, 
 Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 Luben Tuikov <luben.tuikov@amd.com>,
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

On Thu, Aug 5, 2021 at 3:18 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
>
>
> Am 05.08.21 um 12:46 schrieb Daniel Vetter:
> > This is essentially part of drm_sched_dependency_optimized(), which
> > only amdgpu seems to make use of. Use it a bit more.
> >
> > This would mean that as-is amdgpu can't use the dependency helpers, at
> > least not with the current approach amdgpu has for deciding whether a
> > vm_flush is needed. Since amdgpu also has very special rules around
> > implicit fencing it can't use those helpers either, and adding a
> > drm_sched_job_await_fence_always or similar for amdgpu wouldn't be too
> > onerous. That way the special case handling for amdgpu sticks even
> > more out and we have higher chances that reviewers that go across all
> > drivers wont miss it.
>
> Well you should probably drop the sentence about the vm_flush, this is
> completely unrelated.
>
> Additional to that I still don't think that this is a good idea.
> Dependency handling is something completely driver specific.
>
> E.g. even when you have submitted jobs back to back they still might
> need a cache flush in between and that is not only for amdgpu like this.
>
> What you can do is to optimize for while looking at the fences later on
> and then note that you have done so and what the last hw fence is you
> used instead.

Out of 6 drivers using drm/sched 5 can use this. When we get i915
over, that one will be added to the list. amdgpu can't use any of this
anyway due to the vm_id allocation requirements, which is why I
mention that. Also note that all the callbacks are still there, so you
can just ignore this all and still build your own. Like amdgpu does.

So I'm not sure what exactly your object is, aside from "this doesn't
fit for amdgpu", which a) I know b) the commit message explains c)
doesn't actually hurt amdgpu in the slightest. And we still get the
benefit that for most drivers it's a nice optimization.
-Daniel

> Regards,
> Christian.
>
> >
> > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > Acked-by: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index f77456929139..49e507f91ec0 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -660,6 +660,13 @@ int drm_sched_job_add_dependency(struct drm_sched_=
job *job,
> >       if (!fence)
> >               return 0;
> >
> > +     /* if it's a fence from us it's guaranteed to be earlier */
> > +     if (fence->context =3D=3D job->entity->fence_context ||
> > +         fence->context =3D=3D job->entity->fence_context + 1) {
> > +             dma_fence_put(fence);
> > +             return 0;
> > +     }
> > +
> >       /* Deduplicate if we already depend on a fence from the same cont=
ext.
> >        * This lets the size of the array of deps scale with the number =
of
> >        * engines involved, rather than the number of BOs.
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
