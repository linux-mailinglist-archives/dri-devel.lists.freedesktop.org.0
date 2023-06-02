Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68F720965
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 20:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E0210E61A;
	Fri,  2 Jun 2023 18:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CCF10E611;
 Fri,  2 Jun 2023 18:50:32 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5559cd68b67so1715629eaf.3; 
 Fri, 02 Jun 2023 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685731831; x=1688323831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9IT4dMLc0VJwFJv5MIZvoqgL4JP+fvL51k/lEqt6X8=;
 b=O845rgfJyJbtMEuivJ7pmwbwAJKJa66AhqKS+rz7FhGMCe5FqpHSf2Cw/0HYflwRqd
 3fB3wz59l3Z9naRjBoiQbyJNSUYyp9IraLFuOfIc3phQKd8SzSS5vjE13Igk9Nl6LxPA
 gYlSzmd5z/EoI7ydkmKc4ox1iI4nTJ4+PaqjZEG84OVkzKCVDnpjXQNe9m7lk+hWa1ca
 3F6JPHHM5oRvp/QTxtCBe0iJfzDJZwzdenSKY9d/rj5AUM2GWNLoMHJEpYHRHpZ5Z6iu
 qrvEcWQ8wi8T0XgbbWuMYR0/07DmKU0dFevUoDAiyDNtr8CeXJdchlgTGPCLLBjBD68L
 i30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685731831; x=1688323831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9IT4dMLc0VJwFJv5MIZvoqgL4JP+fvL51k/lEqt6X8=;
 b=g/aoDqq0ituIMmkL201W7g+ry50v2iIkSEXUmik0m1YMMf2apfoFmTf8IerZAcUUK1
 qxAft7LL1x2uS516F6YFc9NtJ/LvtRHJ9EXD/iXrLr3RaV+JWBLdl65SuFJ+ZZiwzRvt
 wkwsSlkFZHM5sMwA6LWT4PjFzMhMgtdjoKqAeu9ptavqcPl/IUR09pOYBJ2KaEO+boLP
 GtE7hmiSXozcbSez+dWVdw49aTAdx+4dqkPOmFc2t2RiR0xtdlRF4qNoZASkDTlE6VR9
 w1v7AesClZ/xNr+YUpkzufMdzF8sxAafkOEh71B+W1bjSni+io64Pz3T3tjkoWw4DVes
 hm6w==
X-Gm-Message-State: AC+VfDxrR25kjoumS6ciotC94wez0ickZd9Dc+D+0PZr5tsNnkKeaS21
 2BxAoT3MnTXUqnOTWNsbhxacthJZDRcsWSSDoEs=
X-Google-Smtp-Source: ACHHUZ6a8a2i7gjugJRdJ7jtjj03LgJWq8kQFfaWhatEWxSvcgJqqgtrkNrJPH7jnG3Q1p7xe2iu6lBfygiJ8SBYUJ0=
X-Received: by 2002:a4a:8c05:0:b0:555:51fd:a760 with SMTP id
 u5-20020a4a8c05000000b0055551fda760mr8048348ooj.4.1685731830965; Fri, 02 Jun
 2023 11:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230601214814.2329224-1-olvaffe@gmail.com>
 <CADnq5_NQ2zgvRDZ8NWUsCm-8JO6PZSEmQ+WrbjYqjv3vTLfinw@mail.gmail.com>
In-Reply-To: <CADnq5_NQ2zgvRDZ8NWUsCm-8JO6PZSEmQ+WrbjYqjv3vTLfinw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 2 Jun 2023 14:50:19 -0400
Message-ID: <CADnq5_OmrnBhRbRZ_0thdKktNsSDG4w7dr8Vn_sbiNT2_t2UQA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix xclk freq on CHIP_STONEY
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nevermind, missing your Signed-off-by.  Please add and I'll apply.

Alex

On Fri, Jun 2, 2023 at 2:19=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> Applied.  Thanks!
>
> Alex
>
> On Thu, Jun 1, 2023 at 5:48=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrot=
e:
> >
> > According to Alex, most APUs from that time seem to have the same issue
> > (vbios says 48Mhz, actual is 100Mhz).  I only have a CHIP_STONEY so I
> > limit the fixup to CHIP_STONEY
> > ---
> >  drivers/gpu/drm/amd/amdgpu/vi.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdg=
pu/vi.c
> > index 770f2d7a371fc..6a8494f98d3ef 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > @@ -542,8 +542,15 @@ static u32 vi_get_xclk(struct amdgpu_device *adev)
> >         u32 reference_clock =3D adev->clock.spll.reference_freq;
> >         u32 tmp;
> >
> > -       if (adev->flags & AMD_IS_APU)
> > -               return reference_clock;
> > +       if (adev->flags & AMD_IS_APU) {
> > +               switch (adev->asic_type) {
> > +               case CHIP_STONEY:
> > +                       /* vbios says 48Mhz, but the actual freq is 100=
Mhz */
> > +                       return 10000;
> > +               default:
> > +                       return reference_clock;
> > +               }
> > +       }
> >
> >         tmp =3D RREG32_SMC(ixCG_CLKPIN_CNTL_2);
> >         if (REG_GET_FIELD(tmp, CG_CLKPIN_CNTL_2, MUX_TCLK_TO_XCLK))
> > --
> > 2.41.0.rc0.172.g3f132b7071-goog
> >
