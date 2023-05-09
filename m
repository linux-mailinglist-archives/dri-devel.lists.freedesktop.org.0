Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EA6FD1B0
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 23:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848F10E3D7;
	Tue,  9 May 2023 21:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F910E3D6;
 Tue,  9 May 2023 21:56:47 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-54f811ad4b2so1433921eaf.1; 
 Tue, 09 May 2023 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683669406; x=1686261406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDBr/Wlzxvvn4NkUlHoClOJSITOcl2+allATnZNrMgE=;
 b=P0XPBp57NEC30hgTT/Kn9F5NGV3VJdivC/Zzg8YNm25OE3X8nk3wzMUZOvw/rGnphA
 mrI88vNJKn2GY39N6Io21jKto4069epQwcVgIPAj3mhpjRSOUlP70SwKiAkptHX4UiZJ
 L1xveae5qE/XSCVxR82oos3/3rJXljXy7nV5ozYcTGl//sxr0EoLzZtFWcMgVkHwaJqu
 +tN3xxfWgYGjRx2TZvDXW09aSCO+pZJaht1ypMHLMtUICbFaRuDKK8IzJZnUAyB71/Nb
 +O9cEQb9YrZbg63ayZtWyjG5Ssp+le/Eg/nu4XdyzONYy1haXHUeNvk7UJ4P5qeckyHe
 kbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683669406; x=1686261406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDBr/Wlzxvvn4NkUlHoClOJSITOcl2+allATnZNrMgE=;
 b=aB0OZxxDCXH2AGghbqNo3jlk0VgTHf9O1MhDHeCKzos46FcOvWOQpxj3IuVbn2Kmhf
 58e+LgPqDXG9m2gwlgiR7mnD0FO2XFdxRdfkmAi5zu7ZhcHpttiQFu38+pEILphmN/UN
 Gxx3asvdMT4+YTMnMhCVC1uuZJPBoBoPw/8TyuAFeABogcGc6nxj1TqN9UGQRG5IqKY+
 lG8GFMAVttrG5ohOhdypPfBrfpUVR7lF/X0YDGs6U+2KIwFFs+LvAP9E+pvKsra71mYy
 YDaTHerdCd9qw/ixG/Z5RSIFOVuo/S1uw7scfQY14hMvlV2Hkjj1hmVrqd0GuMkhQmVS
 Dtzw==
X-Gm-Message-State: AC+VfDyFTe57kWbsT8tM5cIa9BtgHKhnxGnaRSy+4RZ2KXbXwCZQpjB7
 rCLuCkX4OV/8ne09O6QUiwGuF7hOqKoG29kwfHw=
X-Google-Smtp-Source: ACHHUZ5oWQCFn1HINA5bEc1oAocP+VFsA4WFlUYiVAFMK4Uz0vcw5rcLWBiqn5uQLgvsFT9rqCdYZTKI3R1NtNh9jys=
X-Received: by 2002:a05:6808:4cf:b0:389:1e16:7aad with SMTP id
 a15-20020a05680804cf00b003891e167aadmr1948434oie.41.1683669406589; Tue, 09
 May 2023 14:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230509214337.124382-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230509214337.124382-1-vitaly.prosyak@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 May 2023 17:56:35 -0400
Message-ID: <CADnq5_Mo=b8rxYMMxQZccOJbUrY5wRZ_raqbL9CMsAEZWHveog@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Check scheduler work queue before calling
 timeout handling
To: vitaly.prosyak@amd.com, 
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
Cc: alexander.deucher@amd.com, Luben.Tuikov@amd.com, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On Tue, May 9, 2023 at 5:43=E2=80=AFPM <vitaly.prosyak@amd.com> wrote:
>
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> During an IGT GPU reset test we see again oops despite of
> commit 0c8c901aaaebc9bf8bf189ffc116e678f7a2dc16
> drm/sched: Check scheduler ready before calling timeout handling.
>
> It uses ready condition whether to call drm_sched_fault which unwind
> the TDR leads to GPU reset.
> However it looks the ready condition is overloaded with other meanings,
> for example, for the following stack is related GPU reset :
>
> 0  gfx_v9_0_cp_gfx_start
> 1  gfx_v9_0_cp_gfx_resume
> 2  gfx_v9_0_cp_resume
> 3  gfx_v9_0_hw_init
> 4  gfx_v9_0_resume
> 5  amdgpu_device_ip_resume_phase2
>
> does the following:
>         /* start the ring */
>         gfx_v9_0_cp_gfx_start(adev);
>         ring->sched.ready =3D true;
>
> The same approach is for other ASICs as well :
> gfx_v8_0_cp_gfx_resume
> gfx_v10_0_kiq_resume, etc...
>
> As a result, our GPU reset test causes GPU fault which calls unconditiona=
lly gfx_v9_0_fault
> and then drm_sched_fault. However now it depends on whether the interrupt=
 service routine
> drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed whic=
h sets the ready
> field of the scheduler to true even  for not initialized schedulers and c=
auses oops vs
> no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx=
_start and
> NULL pointer dereference does not occur.
>
> Use the field timeout_wq  to prevent oops for uninitialized schedulers.
> The field could be initialized by the work queue of resetting the domain.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 649fac2e1ccb..670b7997f389 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_sc=
heduler *sched)
>   */
>  void drm_sched_fault(struct drm_gpu_scheduler *sched)
>  {
> -       if (sched->ready)
> +       if (sched->timeout_wq)
>                 mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>  }
>  EXPORT_SYMBOL(drm_sched_fault);
> --
> 2.25.1
>
