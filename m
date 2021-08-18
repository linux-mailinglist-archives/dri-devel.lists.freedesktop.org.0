Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4FA3F0DC8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2288FFA;
	Wed, 18 Aug 2021 21:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05B6E8EC;
 Wed, 18 Aug 2021 21:56:14 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id r26so5572149oij.2;
 Wed, 18 Aug 2021 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RdmNdCMm6JhUPQCkA/tGLa7SxJbn7LmCF5fH55S5Db8=;
 b=fkCLcGjMhdjaPhrjRCyLDbZmyOEN/LRn4eJ0lFcmweZay62iQ1CBA6vqSCq4MFV9Vm
 OdVs7VFo8n/psxGrG12joViS4t0E/UHxKVFQAljidAl+u5nBEqimZV4hSqjaWg2+bq9J
 Zdep3lm4nEiDS7Dhf5pdYrtCUSpHP5E9XtTLFgYWgAQzDOsFnOhG8ZGdMAKgMuK8CZop
 mBnvSj3mO7L1JD5Wi2HdtLHv7eqJuhGa5lrNWD8hoRpHInbswswm7toVe8Hy9XQy0UV0
 w+2KsM7MtOpT/dWzoH98KiFw1Z806S4yhKWjKqOiF9z7uc+E68azV4l6Hin2Hv8SQ5qT
 T4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RdmNdCMm6JhUPQCkA/tGLa7SxJbn7LmCF5fH55S5Db8=;
 b=hFjA2CmVy522o7RBqx5nnt8Xpj0g5/qd1sh6d47C1rWB/DZm5T8YzQLN2i9GcRBHeQ
 +D/KkTO8QoFnj7pXMUE//F6jWMPh3lY1IDclYW1NszgQOjov88ljDGTscUMiL+z5zILf
 R4hVzQS4Cm9bRHIc6O93WpGCfUucVixUkDDq5Bh4ju6NslgXPRhxB8xSqgd3V4hv824Q
 kvl25NaNpeHQBfNWtNRiP4jOejneoAksMZFTGulNbrW6PEh9JMaRJeC6LtEbKlGSB9L8
 WfqaQKG+kLeCQx1hmgzItX9IGzE3ZAoSRcUBzlz5Ftnr3Iof8e6UbH1qJwNhVL4BER/M
 SJBA==
X-Gm-Message-State: AOAM5336bMVIOwtYBfuMTy1/oxzjH326BaA2y5wkTMHmbSXhbCqGvJwF
 W5ZsIMdXEzLeXMvd/NZDzCl1V/IG0MyNQ0kxKEHCU9R1
X-Google-Smtp-Source: ABdhPJxppIeW0nbPAMY8Ov3LwZPcKqcBcq9vjggH8/2ZNkXRRypcKKDu+XTFxwf+5svXzB9ib1cfup0GHmAzad0YOoY=
X-Received: by 2002:a05:6808:14c:: with SMTP id
 h12mr273986oie.24.1629323773367; 
 Wed, 18 Aug 2021 14:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210816103506.2671-1-michel@daenzer.net>
 <20210817082325.2579-1-michel@daenzer.net>
In-Reply-To: <20210817082325.2579-1-michel@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Aug 2021 17:56:02 -0400
Message-ID: <CADnq5_PrGsBZBn3kmHqH3YRBpwxrNmVi--uuwfGyOfDnRbY96A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
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

Applied.  Let's see how long this one lasts :)

Alex

On Tue, Aug 17, 2021 at 4:23 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>
> schedule_delayed_work does not push back the work if it was already
> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
> was disabled and re-enabled again during those 100 ms.
>
> This resulted in frame drops / stutter with the upcoming mutter 41
> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> disabling it again (for getting the GPU clock counter).
>
> To fix this, call cancel_delayed_work_sync when the disable count
> transitions from 0 to 1, and only schedule the delayed work on the
> reverse transition, not if the disable count was already 0. This makes
> sure the delayed work doesn't run at unexpected times, and allows it to
> be lock-free.
>
> v2:
> * Use cancel_delayed_work_sync & mutex_trylock instead of
>   mod_delayed_work.
> v3:
> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian K=C3=B6nig=
)
> v4:
> * Fix race condition between amdgpu_gfx_off_ctrl incrementing
>   adev->gfx.gfx_off_req_count and amdgpu_device_delay_enable_gfx_off
>   checking for it to be 0 (Evan Quan)
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com> # v3
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> # v3
> Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> ---
>
> Alex, probably best to wait a bit longer before picking this up. :)
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 36 +++++++++++++++-------
>  2 files changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index f3fd5ec710b6..f944ed858f3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2777,12 +2777,11 @@ static void amdgpu_device_delay_enable_gfx_off(st=
ruct work_struct *work)
>         struct amdgpu_device *adev =3D
>                 container_of(work, struct amdgpu_device, gfx.gfx_off_dela=
y_work.work);
>
> -       mutex_lock(&adev->gfx.gfx_off_mutex);
> -       if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -               if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK=
_TYPE_GFX, true))
> -                       adev->gfx.gfx_off_state =3D true;
> -       }
> -       mutex_unlock(&adev->gfx.gfx_off_mutex);
> +       WARN_ON_ONCE(adev->gfx.gfx_off_state);
> +       WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
> +
> +       if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GF=
X, true))
> +               adev->gfx.gfx_off_state =3D true;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index a0be0772c8b3..b4ced45301be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -563,24 +563,38 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev=
, bool enable)
>
>         mutex_lock(&adev->gfx.gfx_off_mutex);
>
> -       if (!enable)
> -               adev->gfx.gfx_off_req_count++;
> -       else if (adev->gfx.gfx_off_req_count > 0)
> +       if (enable) {
> +               /* If the count is already 0, it means there's an imbalan=
ce bug somewhere.
> +                * Note that the bug may be in a different caller than th=
e one which triggers the
> +                * WARN_ON_ONCE.
> +                */
> +               if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count =3D=3D 0))
> +                       goto unlock;
> +
>                 adev->gfx.gfx_off_req_count--;
>
> -       if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_=
count) {
> -               schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_=
OFF_DELAY_ENABLE);
> -       } else if (!enable && adev->gfx.gfx_off_state) {
> -               if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK=
_TYPE_GFX, false)) {
> -                       adev->gfx.gfx_off_state =3D false;
> +               if (adev->gfx.gfx_off_req_count =3D=3D 0 && !adev->gfx.gf=
x_off_state)
> +                       schedule_delayed_work(&adev->gfx.gfx_off_delay_wo=
rk, GFX_OFF_DELAY_ENABLE);
> +       } else {
> +               if (adev->gfx.gfx_off_req_count =3D=3D 0) {
> +                       cancel_delayed_work_sync(&adev->gfx.gfx_off_delay=
_work);
> +
> +                       if (adev->gfx.gfx_off_state &&
> +                           !amdgpu_dpm_set_powergating_by_smu(adev, AMD_=
IP_BLOCK_TYPE_GFX, false)) {
> +                               adev->gfx.gfx_off_state =3D false;
>
> -                       if (adev->gfx.funcs->init_spm_golden) {
> -                               dev_dbg(adev->dev, "GFXOFF is disabled, r=
e-init SPM golden settings\n");
> -                               amdgpu_gfx_init_spm_golden(adev);
> +                               if (adev->gfx.funcs->init_spm_golden) {
> +                                       dev_dbg(adev->dev,
> +                                               "GFXOFF is disabled, re-i=
nit SPM golden settings\n");
> +                                       amdgpu_gfx_init_spm_golden(adev);
> +                               }
>                         }
>                 }
> +
> +               adev->gfx.gfx_off_req_count++;
>         }
>
> +unlock:
>         mutex_unlock(&adev->gfx.gfx_off_mutex);
>  }
>
> --
> 2.32.0
>
