Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11828758C0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94B10EED1;
	Thu,  7 Mar 2024 20:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="acLNApL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F131C10EED1;
 Thu,  7 Mar 2024 20:45:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1dcd6a3da83so9736795ad.3; 
 Thu, 07 Mar 2024 12:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709844343; x=1710449143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+3FhdmrXd3GVtm7VM7YbcxkD8Ujzz7d6MpBmECMceE=;
 b=acLNApL1Iz8fhwXdSsddlUxu80QeNc4ZQfC5j2W1ClNbvu7yp6riEHZn/BzUd4LKB7
 MdVqqahLC8ahcKVMTvFegcosx85b3pKoarkInlwdSxquPgecADlbCidIoarjJMa84puF
 arxjbAnHyUE57j38WvSeDgCDj3zVgK/80EA3g+E/v7I/hnlMRH5qEjoS3saepgP+TSfr
 nfcHfloWetjx6RyOFOlxExt0ASnHUJvgH1rjFd/VwoUxlIVkQfUrbtTQyBryj2Vq9eR/
 2KmDcUXXCgwfZ4iCDCGX80tyYciUNVn4rdxKcLiAY/0KpPnQv4/jA4GvmqyTp1o4X1NC
 Nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709844343; x=1710449143;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+3FhdmrXd3GVtm7VM7YbcxkD8Ujzz7d6MpBmECMceE=;
 b=ernoox2FPR8H6khRpXhD1YTDb1bAT8/oWpJzljZUe+cM2J3d5O0s4MRgm8+0wbM4ox
 CfTfZXYVe58JNnnP+BaIHbo9sOYqlJwidlEXDeEdLAhUXZABrL6H6aqmrkjmr4043Zqj
 gC4gbw9PBpTweGWvzEWjwoK6aLe1fyyrqhwEPWuCNe4/TI7idZd5E6kok0r3WyxnyZx8
 iRVPNUI/XD/80xx4X4s+yCFMrJmIygeUoe7Uku4DEHeMv0i2nlqM6hEH1h/uNNo97GU6
 +SwKOtU0AZ8TlIJBrBdLLVNmxKXzof45wZi9Vtz3fvJ9THScqXuV9b7emYNMjlTiGzWt
 Dc6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFNswMV7XGfpzGc6RajNnZr4CS41rcqjWjzelZgng39ZfIuTElIPi0/HK0HifcZTdrqZhoB3E8Ngl4fqR+yNzw4sjmAw1GoMij3IVbRfS77DQnSgvohN3rj2ZIVIJGiMLeQZnuLaGiEYygQEWauA==
X-Gm-Message-State: AOJu0Yy3EmP4xJjoX/JrPQbUBQEjGxUeHwmNreyPjNtVd9aZr9TtpWsb
 jawyljmpM0HAdePq7PblLhUZYaYMLOfMkBB5QEa8r3CVw1vDithueMOOElIM5j53G1lHbIBCi/Y
 TNE5byDTWDw6bygwh05jRnru9bPM=
X-Google-Smtp-Source: AGHT+IFdvxrAlUjPzWK3dLgAyn1B+EzTBvk4oL8SOwi1urs+btyPwqeGrxBQ9IvKUCGqQcdRRrs3CaiIyxgPjEY4ndQ=
X-Received: by 2002:a17:902:eccc:b0:1dc:b3bc:b7e1 with SMTP id
 a12-20020a170902eccc00b001dcb3bcb7e1mr11971789plh.1.1709844343172; Thu, 07
 Mar 2024 12:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20240307165932.3856952-1-sunil.khatri@amd.com>
 <20240307165932.3856952-3-sunil.khatri@amd.com>
 <CADnq5_OaCRAjCZGOEpd1gTFSUHdNkVbDqDgx_LQKw_JR1Qtv3Q@mail.gmail.com>
 <c33f5ede-19de-491b-8f97-c78db47fdf30@amd.com>
In-Reply-To: <c33f5ede-19de-491b-8f97-c78db47fdf30@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Mar 2024 15:45:30 -0500
Message-ID: <CADnq5_M1ti9A0t8HgBX9o_DytyHCbH=qhOKJZXkCM=C99Z7ptw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: add vm fault information to devcoredump
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mukul Joshi <mukul.joshi@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
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

On Thu, Mar 7, 2024 at 3:42=E2=80=AFPM Khatri, Sunil <sukhatri@amd.com> wro=
te:
>
>
> On 3/8/2024 12:44 AM, Alex Deucher wrote:
> > On Thu, Mar 7, 2024 at 12:00=E2=80=AFPM Sunil Khatri <sunil.khatri@amd.=
com> wrote:
> >> Add page fault information to the devcoredump.
> >>
> >> Output of devcoredump:
> >> **** AMDGPU Device Coredump ****
> >> version: 1
> >> kernel: 6.7.0-amd-staging-drm-next
> >> module: amdgpu
> >> time: 29.725011811
> >> process_name: soft_recovery_p PID: 1720
> >>
> >> Ring timed out details
> >> IP Type: 0 Ring Name: gfx_0.0.0
> >>
> >> [gfxhub] Page fault observed
> >> Faulty page starting at address 0x0000000000000000
> > Do you want a : before the address for consistency?
> sure.
> >
> >> Protection fault status register:0x301031
> > How about a space after the : for consistency?
> >
> > For parsability, it may make more sense to just have a list of key valu=
e pairs:
> > [GPU page fault]
> > hub:
> > addr:
> > status:
> > [Ring timeout details]
> > IP:
> > ring:
> > name:
> >
> > etc.
>
> Sure i agree but till now i was capturing information like we shared in
> dmesg which is user readable. But surely one we have enough data i could
> arrange all in key: value pairs like you suggest in a patch later if
> that works ?

Sure.

Alex

>
> >
> >> VRAM is lost due to GPU reset!
> >>
> >> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 +++++++++++++-
> >>   1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_reset.c
> >> index 147100c27c2d..dd39e614d907 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> >> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t offs=
et, size_t count,
> >>                             coredump->ring->name);
> >>          }
> >>
> >> +       if (coredump->adev) {
> >> +               struct amdgpu_vm_fault_info *fault_info =3D
> >> +                       &coredump->adev->vm_manager.fault_info;
> >> +
> >> +               drm_printf(&p, "\n[%s] Page fault observed\n",
> >> +                          fault_info->vmhub ? "mmhub" : "gfxhub");
> >> +               drm_printf(&p, "Faulty page starting at address 0x%016=
llx\n",
> >> +                          fault_info->addr);
> >> +               drm_printf(&p, "Protection fault status register:0x%x\=
n",
> >> +                          fault_info->status);
> >> +       }
> >> +
> >>          if (coredump->reset_vram_lost)
> >> -               drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> >> +               drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
> >>          if (coredump->adev->reset_info.num_regs) {
> >>                  drm_printf(&p, "AMDGPU register dumps:\nOffset:     V=
alue:\n");
> >>
> >> --
> >> 2.34.1
> >>
