Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46116DF9BA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC8F10E873;
	Wed, 12 Apr 2023 15:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414B610E870;
 Wed, 12 Apr 2023 15:20:36 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1841c57c221so16442728fac.3; 
 Wed, 12 Apr 2023 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681312835; x=1683904835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SkQUe1sjVjm42OHiHhks/DOrgWsxVG26S1+y3HVvJk=;
 b=gkhlF4kzoVQ3so1r46S3MCKarEYn8iRvENC4uneOuGL3oeNRHP3y/Dfzskiy/EveNi
 IExZmlF1+CSpGYXUR28ehshK5OODFllNsVWJjJ41+DTQWJ8l4OYmjbIqlmSzAMOZ/M+0
 Mw8cD0yJ3tnnZ9JSJ5UZvahqZu8e3m2z3z/eAebu8svyj2QPgHswjDu9DpcpM6whN5qi
 xb+KFASS84EpvMI/2rVqUohivtr0cujvYtNp+NbVppgfsjIsfv15X8PqDjiGrj3NsqXL
 FAhIVEVHDXGmUhSN6ojiDFIAbb4mEkbhiLVnLgD+Qlo4Y9ZsxnXA9cb2C5ykNtsp4uej
 slAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681312835; x=1683904835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7SkQUe1sjVjm42OHiHhks/DOrgWsxVG26S1+y3HVvJk=;
 b=MYUV1CZysDfO+/Bo8WHJqizhmlJYUw1omopkCQ6PmK9PbkTBcXbiV8YAgkrUw893ig
 5CITP5/6cfSLa6CFDbwqZtH06O2gzjnBr+hZ5Q5i4CCagu2L0ypY6AOSaXDf6pdzQzQ0
 2B76hrMkGNfq4YLXsMWIroAVbu0sSTcLTabCxxF1OmJdA37xw+PCYPEmhRIMkq10lCY/
 P57akuDgF1Dh2lUahUMd56M+dzuO8v+kQEeIThFjFncaGiIoCBALEdY2x+U4pPcxtfRw
 rjNusqhrW7+iGL/dLZGEgpCcIUxpZBVVoNQKpbOwn9BqqYumn4nCy0hfK4JAX6P+6xYC
 uKJg==
X-Gm-Message-State: AAQBX9c6gMUe94c28jYue0H/jHlBT+oHaIPuGDoVRRF3pcRIUP4fdB8Y
 MEn+eMpc3QCC6ce0yQWRAjx9/jT2Spdz5c4fAQcPWt+Su6c=
X-Google-Smtp-Source: AKy350YGghYNh91iovq41s2Uzcr2C1jcbbEj9Nd9XDec0GIcwxWjGH4t3ykPmNDskbpvwkZL9ifIyrCykZ0DRLa8HP4=
X-Received: by 2002:a05:6870:3050:b0:184:56bd:363a with SMTP id
 u16-20020a056870305000b0018456bd363amr3697696oau.3.1681312834820; Wed, 12 Apr
 2023 08:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230403182808.8699-1-n.zhandarovich@fintech.ru>
 <BL1PR12MB51446866BAE5945297315399F79A9@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5d5b0b94-4dd4-2a95-a777-521b65f6f053@fintech.ru>
In-Reply-To: <5d5b0b94-4dd4-2a95-a777-521b65f6f053@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Apr 2023 11:20:23 -0400
Message-ID: <CADnq5_PECupBm9ADGs5DsfM4i7FJCORD_s6=8Ky=416eFX4CTg@mail.gmail.com>
Subject: Re: [PATCH] radeon: avoid double free in ci_dpm_init()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 8:39=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
>
>
> On 4/11/23 14:11, Deucher, Alexander wrote:
> > [Public]
> >
> >> -----Original Message-----
> >> From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> >> Sent: Monday, April 3, 2023 2:28 PM
> >> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> >> Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>; Koenig, Christian
> >> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> >> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; amd-
> >> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> >> kernel@vger.kernel.org; lvc-project@linuxtesting.org
> >> Subject: [PATCH] radeon: avoid double free in ci_dpm_init()
> >>
> >> There are several calls to ci_dpm_fini() in ci_dpm_init() when there o=
ccur
> >> errors in functions like r600_parse_extended_power_table().
> >> This is harmful as it can lead to double free situations: for instance=
,
> >> r600_parse_extended_power_table() will call for
> >> r600_free_extended_power_table() as will ci_dpm_fini(), both of which =
will
> >> try to free resources.
> >> Other drivers do not call *_dpm_fini functions from their respective
> >> *_dpm_init calls - neither should cpm_dpm_init().
> >>
> >> Fix this by removing extra calls to ci_dpm_fini().
> >
> > You can't just drop the calls to fini().  You'll need to properly unwin=
d to avoid leaking memory.
> >
> > Alex
> >>>
> >> Found by Linux Verification Center (linuxtesting.org) with static anal=
ysis tool
> >> SVACE.
> >>
> >> Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
> >> Cc: stable@vger.kernel.org
> >> Co-developed-by: Natalia Petrova <n.petrova@fintech.ru>
> >> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> >>
> >> ---
> >>  drivers/gpu/drm/radeon/ci_dpm.c | 20 +++++---------------
> >>  1 file changed, 5 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c
> >> b/drivers/gpu/drm/radeon/ci_dpm.c index 8ef25ab305ae..7b77d4c93f1d
> >> 100644
> >> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> >> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> >> @@ -5677,28 +5677,20 @@ int ci_dpm_init(struct radeon_device *rdev)
> >>      pi->pcie_lane_powersaving.min =3D 16;
> >>
> >>      ret =3D ci_get_vbios_boot_values(rdev, &pi->vbios_boot_state);
> >> -    if (ret) {
> >> -            ci_dpm_fini(rdev);
> >> +    if (ret)
> >>              return ret;
> >> -    }
> >>
> >>      ret =3D r600_get_platform_caps(rdev);
> >> -    if (ret) {
> >> -            ci_dpm_fini(rdev);
> >> +    if (ret)
> >>              return ret;
> >> -    }
> >>
> >>      ret =3D r600_parse_extended_power_table(rdev);
> >> -    if (ret) {
> >> -            ci_dpm_fini(rdev);
> >> +    if (ret)
> >>              return ret;
> >> -    }
> >>
> >>      ret =3D ci_parse_power_table(rdev);
> >> -    if (ret) {
> >> -            ci_dpm_fini(rdev);
> >> +    if (ret)
> >>              return ret;
> >> -    }
> >>
> >>      pi->dll_default_on =3D false;
> >>      pi->sram_end =3D SMC_RAM_END;
> >> @@ -5749,10 +5741,8 @@ int ci_dpm_init(struct radeon_device *rdev)
> >>              kcalloc(4,
> >>                      sizeof(struct
> >> radeon_clock_voltage_dependency_entry),
> >>                      GFP_KERNEL);
> >> -    if (!rdev-
> >>> pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries) {
> >> -            ci_dpm_fini(rdev);
> >> +    if (!rdev-
> >>> pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries)
> >>              return -ENOMEM;
> >> -    }
> >>      rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.count =3D 4;
> >>      rdev-
> >>> pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].clk =3D 0;
> >>      rdev-
> >>> pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[0].v =3D 0;
>
>
> I think you are correct when it comes to ensuring we deal with memory
> issues in ci_dpm_init().
>
> However, I could use some direction on how to deal with the problem of
> freeing only previously allocated resources. For instance, once
> ci_parse_power_table() fails, it is not clear what we should and should
> not free.

You'll want to free any memory allocated in ci_dpm_init().  Any of the
functions called from that function should clean themselves up if they
allocate any memory, but if not, they should be fixed.

Alex


>
> I wanna point out that in this case I would like to fix both double and
> uninitialized free issues as it can also lead to undefined behavior.
>
> Thanks for your patience,
> Nikita
