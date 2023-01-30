Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB38681E17
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994510E2A8;
	Mon, 30 Jan 2023 22:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6807410E2A8;
 Mon, 30 Jan 2023 22:30:16 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1636eae256cso12819596fac.0; 
 Mon, 30 Jan 2023 14:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQfC9CItlKVaYqqvJIQWdPcrF+TC1OY2XafcNOSJ/Rw=;
 b=ctdB0YaYzgqW00TyOTJ36RYGhs9VcYow60Y+nC2zRkerlqQHCwKAhLmXtYjJ+KAWND
 q2cTuBAAcuLqJ/UFmyOu0VY0aUrgTNHYxA8u/StOg77YAtzJ5zFu2/F41M8hOt06MWYS
 uYat/1Y4M7L3L4VB27zHmrqsiHZQy/OOoXBf+3Crswd6FB5zbW0y/iNYNE/sxzLISkUe
 ctWYLjMEWjVbKr+XtdORU3+oOVXwAQiQeScvMNAbRFyhuxKY44g0y6jbH+b4TdsdEwD7
 UE4/VE7beCwmNn6NCjFMuRYb/1ld2CGxyIM7lJ2f88MK4Z9bDjfZWPmp9U+fbMAYKzm1
 KULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQfC9CItlKVaYqqvJIQWdPcrF+TC1OY2XafcNOSJ/Rw=;
 b=uBGZFuMZtYqna9QifR+SGfc73eAU6aYFhSULFlW4tiZ44L+ghQarScKDG6cENdpwm5
 IG/oNARo/ZYB7y8Vi42NALN29tft01FMbT9y2K3ERADUYhw9fAk43IyVfZ8lB0qefLXU
 oR9TEEIVA6SpnLIJpQas/6ik1YJp4a5TFKsMIiaE/c0K5rEo9V+LOjHzafJsTYpqstWg
 Xn/6bHWWii3b+SXhcHVfLMxBmXdJqMC874g4vPXIJQUQeHrmOT/pQiC+K+bb0nZfnJJ4
 rkNtQupNx5Mila2Ijv4Y7LoYqPAYnriNaYutk6DDWJbrndtChyxMzKNpb3K9+7HlIbk1
 TZhA==
X-Gm-Message-State: AO0yUKWAf0zI6RG0ixTrly+dofbQALVfbn5bYE3ZJziq9tFI7L9vtyUI
 ZJGrHBnqSipJspdiF3q5usS34d80o6uL5wrklYchoodFO6M=
X-Google-Smtp-Source: AK7set+g/JgAoy7nBQ8NKoZHwQLIVVhyv2mAk96BH4bdseyjTh6j1B+xw9oZ+6BQZ7vbGtPGZj5hANmPLM2NZE3+aEM=
X-Received: by 2002:a05:6870:b522:b0:163:8cc6:86a with SMTP id
 v34-20020a056870b52200b001638cc6086amr1209888oap.46.1675117815617; Mon, 30
 Jan 2023 14:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
In-Reply-To: <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Jan 2023 17:30:03 -0500
Message-ID: <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> + Luben
>
> (sorry, missed that in the first submission).
>
> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
> > Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
> > routine - such function is expected to be called only after the
> > respective init function - drm_sched_init() - was executed successfully.
> >
> > Happens that we faced a driver probe failure in the Steam Deck
> > recently, and the function drm_sched_fini() was called even without
> > its counter-part had been previously called, causing the following oops:
> >
> > amdgpu: probe of 0000:04:00.0 failed with error -110
> > BUG: kernel NULL pointer dereference, address: 0000000000000090
> > PGD 0 P4D 0
> > Oops: 0002 [#1] PREEMPT SMP NOPTI
> > CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
> > Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> > RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
> > [...]
> > Call Trace:
> >  <TASK>
> >  amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
> >  amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
> >  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
> >  devm_drm_dev_init_release+0x49/0x70
> >  [...]
> >
> > To prevent that, check if the drm_sched was properly initialized for a
> > given ring before calling its fini counter-part.
> >
> > Notice ideally we'd use sched.ready for that; such field is set as the latest
> > thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
> > field - in the above oops for example, it was a GFX ring causing the crash, and
> > the sched.ready field was set to true in the ring init routine, regardless of
> > the state of the DRM scheduler. Hence, we ended-up using another sched field.
> >> > Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Cc: Guchun Chen <guchun.chen@amd.com>
> > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> > ---
> >
> >
> > Hi folks, first of all thanks in advance for reviews / comments!
> > Notice that I've used the Fixes tag more in the sense to bring it
> > to stable, I didn't find a good patch candidate that added the
> > call to drm_sched_fini(), was reaching way too old commits...so
> > 067f44c8b459 seems a good candidate - or maybe not?
> >
> > Now, with regards sched.ready, spent a bit of time to figure what
> > was happening...would be feasible maybe to stop using that to
> > mark some kind ring status? I think it should be possible to add a
> > flag to the ring structure for that, and free sched.ready from
> > being manipulate by the amdgpu driver, what's your thoughts on that?

It's been a while, but IIRC, we used to have a ring->ready field in
the driver which at some point got migrated out of the driver into the
GPU scheduler and the driver side code never got cleaned up.  I think
we should probably just drop the driver messing with that field and
leave it up to the drm scheduler.

Alex


> >
> > I could try myself, but first of course I'd like to raise the
> > "temperature" on this topic and check if somebody is already working
> > on that.
> >
> > Cheers,
> >
> > Guilherme
> >
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > index 00444203220d..e154eb8241fb 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
> >               if (!ring || !ring->fence_drv.initialized)
> >                       continue;
> >
> > -             if (!ring->no_scheduler)
> > +             /*
> > +              * Notice we check for sched.name since there's some
> > +              * override on the meaning of sched.ready by amdgpu.
> > +              * The natural check would be sched.ready, which is
> > +              * set as drm_sched_init() finishes...
> > +              */
> > +             if (!ring->no_scheduler && ring->sched.name)
> >                       drm_sched_fini(&ring->sched);
> >
> >               for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
