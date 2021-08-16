Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FF3EDD80
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 21:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842136E03F;
	Mon, 16 Aug 2021 19:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F10589F92;
 Mon, 16 Aug 2021 19:02:36 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so22144624oth.7; 
 Mon, 16 Aug 2021 12:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZUHNw0DOVxWzQe7bCw+x6OqCo+4IaDKh7apT5XyDVA=;
 b=V6G6JTaqT2Bdx2H8EUjvpY7rfnY6UuynhcGc4O2P7gWL+iPQFCXPgIejxosY3Gd0PY
 fwLMN8dJT4+bcZLau/wMhOraOvJE4htZfpYJSRnRXgWHOdj0RPv7Cp/Y2TwxLDQj5nNp
 GZKNy2F1M4+LuCs4BFkrRZtVDP2VRyRBQTb3pnLPfd/a2epx0LK7aXZDEaOVFiZqtrnk
 YkfLJTWECvl+/yv41HvXgTfKKiLmtPb1VHaMgyaSOWbS6H3tf41M2T7PrjXjZG2dxB/G
 1drN/ox6tJV/TUNnWGAlQPN+ukpcXljF0Y54YYV3T+YqkQWmwHtFU8uXAmswWUn4qCsc
 Q6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZUHNw0DOVxWzQe7bCw+x6OqCo+4IaDKh7apT5XyDVA=;
 b=QG+dISFTDinXsVHCCMHDQRGYXANfL9kswIETNSJ6jTFGoAfN9PLFe0tLV7P4X5ln2n
 Ru+xdRk6VwsYRbdD6aMOipPEqtmLRl9i/fj1cSRQiTPAZl0d14Pxb+ApQo1EvHo2ph3T
 X21jXByBuggT8ke2BwF8i8BYb6btw6GPEorLGH1ENwhzkS8+UkpYo5RRwOOvIQir1J1g
 bHY/4TOmtZjn9tadjP2v+78VV0akgZGT4jsR2ztPjmU0Cn88LMBRNL7nQo0b1tmxBCas
 tsAHuTIdu6qq/2/rKRuX/SNulcE7qPR8UT1K30OwZ/zDjZttZwMQxkq7LbUdBhFXtWEM
 PSyA==
X-Gm-Message-State: AOAM5315D5keluPDue8Ww/g8xjYvqzmUQITyFwVbjfZrE5jsIwXKWG3e
 N/qFgEqLlewJWEIrFOL8bswa5dV60IQ374f5hM8=
X-Google-Smtp-Source: ABdhPJw7EMtZkOn4Ny4B+IAX6sh9zVcXRuqW6U1SCtCNQ3scIOZIx1sxXG7HlCiApBxqbMBLJrsM3MgPVOqzdP50uuI=
X-Received: by 2002:a9d:5a15:: with SMTP id v21mr190961oth.132.1629140555578; 
 Mon, 16 Aug 2021 12:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
 <cc08735b-df2f-e8a6-a1b0-22e1dba02757@amd.com>
 <ec4d551f-f1ca-3ccf-9b36-6522d529d128@gmail.com>
 <d69ae1de-c47d-3831-7bf0-1e2606445f68@daenzer.net>
In-Reply-To: <d69ae1de-c47d-3831-7bf0-1e2606445f68@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Aug 2021 15:02:24 -0400
Message-ID: <CADnq5_OfY9N6vx+9DQ7EXKO=KnxNSO3dHuAmzZ6xen0HMvECow@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 "Lazar, Lijo" <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 16, 2021 at 11:07 AM Michel D=C3=A4nzer <michel@daenzer.net> wr=
ote:
>
> On 2021-08-16 2:06 p.m., Christian K=C3=B6nig wrote:
> > Am 16.08.21 um 13:33 schrieb Lazar, Lijo:
> >> On 8/16/2021 4:05 PM, Michel D=C3=A4nzer wrote:
> >>> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>>
> >>> schedule_delayed_work does not push back the work if it was already
> >>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> >>> after the first time GFXOFF was disabled and re-enabled, even if GFXO=
FF
> >>> was disabled and re-enabled again during those 100 ms.
> >>>
> >>> This resulted in frame drops / stutter with the upcoming mutter 41
> >>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> >>> disabling it again (for getting the GPU clock counter).
> >>>
> >>> To fix this, call cancel_delayed_work_sync when the disable count
> >>> transitions from 0 to 1, and only schedule the delayed work on the
> >>> reverse transition, not if the disable count was already 0. This make=
s
> >>> sure the delayed work doesn't run at unexpected times, and allows it =
to
> >>> be lock-free.
> >>>
> >>> v2:
> >>> * Use cancel_delayed_work_sync & mutex_trylock instead of
> >>>    mod_delayed_work.
> >>> v3:
> >>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian K=C3=
=B6nig)
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++------
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++--=
---
> >>>   2 files changed, 22 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_device.c
> >>> index f3fd5ec710b6..f944ed858f3e 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_of=
f(struct work_struct *work)
> >>>       struct amdgpu_device *adev =3D
> >>>           container_of(work, struct amdgpu_device, gfx.gfx_off_delay_=
work.work);
> >>>   -    mutex_lock(&adev->gfx.gfx_off_mutex);
> >>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> >>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TY=
PE_GFX, true))
> >>> -            adev->gfx.gfx_off_state =3D true;
> >>> -    }
> >>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
> >>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
> >>
> >> Don't see any case for this. It's not expected to be scheduled in this=
 case, right?
> >>
> >>> + WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
> >>> +
> >>
> >> Thinking about ON_ONCE here - this may happen more than once if it's c=
ompleted as part of cancel_ call. Is the warning needed?
> >
> > WARN_ON_ONCE() is usually used to prevent spamming the system log with =
warnings. E.g. the warning is only printed once indicating a driver bug and=
 that's it.
>
> Right, these WARN_ONs are like assert()s in user-space code, documenting =
the pre-conditions and checking them at runtime. And I use _ONCE so that if=
 a pre-condition is ever violated for some reason, dmesg isn't spammed with=
 multiple warnings.
>
>
> >> Anyway,
> >>     Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> >
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Thanks guys!
>
>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
