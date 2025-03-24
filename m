Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C7A6E57B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859BA10E367;
	Mon, 24 Mar 2025 21:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCvu+rZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB5610E1CD;
 Mon, 24 Mar 2025 21:19:38 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2a01bcd0143so6611855fac.2; 
 Mon, 24 Mar 2025 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742851175; x=1743455975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frDCG2qrAq7ODvL1k7fqgwhPml5YBbAy2fSTyQY76yI=;
 b=gCvu+rZ+4Rls9QFI89dALR8CvHQ3ZdMs7larQJORIDKxdPbKTfeMemaMhxARn0GcbM
 umnaB4QgxdjVXr9ft3bx5K1sFgREdSp8eOsRXcPFWVPfr3PzbqjrulXk9YtcZlAXztyb
 uZ+HeKU9YikVxSMTDdgPqf/00wwKW28h2Gd3E0a3kN9+NcAY75XzH9m6cZg+b1Q6orRG
 Z5vxfrHh98bOYJjeaLZtBtKIZsbGTkDdZyaRD+idBqWzBu+psAogW7C6eVD9FgGuAIHk
 HU0bg2wienCwOOOdeHqYerrXFRL2XvKGlMA2sWVtCBCwgORJYy1r5f8OyVoPo2hC0m+r
 d+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742851175; x=1743455975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frDCG2qrAq7ODvL1k7fqgwhPml5YBbAy2fSTyQY76yI=;
 b=BhJp04pBPLTuvp8Yq5I4dMzn5trMvMCdLjSvm1w3NFgfcmes91e3Ners6qnKYBfDxj
 Zy+03QiRlxnZd90a6yb2V8yC+TkoZbuJIQ2MQmZvaDPWUIj569cK3o3pZ/eWBsdDpb/4
 aqWC3zckgdoxaDtjv8M8ijPo+tg93boeWS4gtoCd45fzXN0sbAtLWbIHK/uNEHONTJUY
 EVu3C2ryrmVNmCB+Htv8ElzPjeZykbAWqkLEYA2/Ib5nUMB23U8MlWbVF48/hMkvhi6K
 rt/SB57p7HZiynoZLsklKK73k9L19EBf/vmoq7nYkoJHfGShO4HAiCIwLdNU3t6VECUW
 rbzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW185lm7OcFKi78/TMzB8ZkOd9NJhg1kfjrD8/iQFJMXFwQr3MN/45Se8OHdt+fvKgaJyc7hiXbiXicSQNY1A==@lists.freedesktop.org,
 AJvYcCXHHy+UcyaZZttW1ou9BczZ/o/q0CI6WE/ctaDf27xZCGAbtjf5zmCK9UBv9Esa4ZAxdK1dpCbFcPCI@lists.freedesktop.org,
 AJvYcCXpl5A+3idlxdMZ/ueAxCKU4vus34KmYNG6pga9dUpm3gyIOPyPghsFu+wHagZDo5DUYILnPo8lvc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaRE6teHn4Xtolt6B6dFKoglIUMOEmoailpH/puSha+9QJL4l+
 oOu+Syc36DrGx5qk7+QIe4SBI0h6KHlTpWaiTiejiv+4unrSh7SVWkJKgJ1Qp8dGMTpo4s81cgd
 jB//Kj3UGfDQHq2/ZH/ce5lwqJ/o=
X-Gm-Gg: ASbGncuzOTIcDSOVSTPSY2aXQqjFLhhoNxcf0tQaFt+2PxPcnIw5+qlVSvPcj5YnvOQ
 k+97p6PRLrQdkK6nCmaBKCBEKHe/iC/hUDNsrq3m1r4hFjP4Yx5LUWCUho7PZ8Z5KO1FRZvpQuY
 aHER4OT6eRLXWFuLi4b7XSUpJ/VGFTmjdEBg==
X-Google-Smtp-Source: AGHT+IHXtKrJ0p9DjxyMM87K1KNBq3hW44MMskPQ5xclT26yyj3ABz8zX1xoS7zKdxsxIX9khnDeIgXPNmjCe06FUzM=
X-Received: by 2002:a05:6870:612c:b0:29e:2594:81e with SMTP id
 586e51a60fabf-2c7802c82d8mr9115623fac.13.1742851174510; Mon, 24 Mar 2025
 14:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250310222355.work.417-kees@kernel.org>
 <01070195c306db7f-9f28efdd-9456-4db3-b6c6-343298bd571b-000000@eu-central-1.amazonses.com>
 <87r02ma8s3.fsf@intel.com>
In-Reply-To: <87r02ma8s3.fsf@intel.com>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Mon, 24 Mar 2025 22:19:23 +0100
X-Gm-Features: AQ5f1Jo-T7_krtutBjAOPDPvTINCXqSyPXcHRxY3XegGinALPdX7qEtm2x02d_k
Message-ID: <CABr+WTkggOTDDzgPFmnJo3Dab4QYxLRt=_g7in3bgr0z6jXf+g@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Add __nonstring annotations for
 unterminated strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Damian Tometzki <damian@riscv-rocks.de>, Kees Cook <kees@kernel.org>, 
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

Le lun. 24 mars 2025 =C3=A0 13:54, Jani Nikula
<jani.nikula@linux.intel.com> a =C3=A9crit :
>
> On Sun, 23 Mar 2025, Damian Tometzki <damian@riscv-rocks.de> wrote:
> > On Mon, 10. Mar 15:23, Kees Cook wrote:
> >> When a character array without a terminating NUL character has a stati=
c
> >> initializer, GCC 15's -Wunterminated-string-initialization will only
> >> warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
> >> with __nonstring to and correctly identify the char array as "not a C
> >> string" and thereby eliminate the warning.
> >>
> >> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D117178 [1]
> >> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> >> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Simona Vetter <simona@ffwll.ch>
> >> Cc: intel-gvt-dev@lists.freedesktop.org
> >> Cc: intel-gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Kees Cook <kees@kernel.org>
> >> ---
> >>  drivers/gpu/drm/i915/gvt/opregion.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i91=
5/gvt/opregion.c
> >> index 509f9ccae3a9..f701638d3145 100644
> >> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> >> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> >> @@ -43,7 +43,7 @@
> >>  #define DEVICE_TYPE_EFP4   0x10
> >>
> >>  struct opregion_header {
> >> -    u8 signature[16];
> >> +    u8 signature[16] __nonstring;
>
> Why would this annotation be needed? It's not treated as a string
> anywhere, and it's u8 not char.
>
> >>      u32 size;
> >>      u32 opregion_ver;
> >>      u8 bios_ver[32];
> >> @@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vg=
pu)
> >>      u8 *buf;
> >>      struct opregion_header *header;
> >>      struct vbt v;
> >> -    const char opregion_signature[16] =3D OPREGION_SIGNATURE;
> >> +    const char opregion_signature[16] __nonstring =3D OPREGION_SIGNAT=
URE;
> >>
> >>      gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
> >>      vgpu_opregion(vgpu)->va =3D (void *)__get_free_pages(GFP_KERNEL |
> >> --
> >> 2.34.1
> >>
> > Hello together,
> >
> > it doesnt resolve the build issue with gcc15 gcc (GCC) 15.0.1 20250228
> >
> > CC [M]  drivers/gpu/drm/i915/gvt/scheduler.o
> > /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c: In funct=
ion =E2=80=98intel_vgpu_init_opregion=E2=80=99:
> > /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c:35:28: er=
ror: initializer-string for array of =E2=80=98char=E2=80=99 is too long [-W=
error=3Dunterminated-string-initialization]
> >    35 | #define OPREGION_SIGNATURE "IntelGraphicsMem"
> >       |                            ^~~~~~~~~~~~~~~~~~
> > /home/damian/kernel/linux/drivers/gpu/drm/i915/gvt/opregion.c:225:57: n=
ote: in expansion of macro =E2=80=98OPREGION_SIGNATURE=E2=80=99
> >   225 |         const char opregion_signature[16] __nonstring =3D OPREG=
ION_SIGNATURE;
> >       |                                                         ^~~~~~~=
~~~~~~~~~~~
> >   CC [M]  drivers/gpu/drm/i915/gvt/trace_points.o
> > cc1: all warnings being treated as errors
> > make[7]: *** [/home/damian/kernel/linux/scripts/Makefile.build:207: dri=
vers/gpu/drm/i915/gvt/opregion.o] Error 1
> > make[7]: *** Waiting for unfinished jobs....
> >   CC [M]  drivers/gpu/drm/i915/gvt/vgpu.o
> > make[6]: *** [/home/damian/kernel/linux/scripts/Makefile.build:465: dri=
vers/gpu/drm/i915] Error 2
> > make[5]: *** [/home/damian/kernel/linux/s
>
> What about this?
>
> IMO it's anyway good practice to use sizeof(dest) rather than
> sizeof(src) for memcpy.
>
>
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/g=
vt/opregion.c
> index 509f9ccae3a9..dbad4d853d3a 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -222,7 +222,6 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
>         u8 *buf;
>         struct opregion_header *header;
>         struct vbt v;
> -       const char opregion_signature[16] =3D OPREGION_SIGNATURE;
>
>         gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
>         vgpu_opregion(vgpu)->va =3D (void *)__get_free_pages(GFP_KERNEL |
> @@ -236,8 +235,10 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu=
)
>         /* emulated opregion with VBT mailbox only */
>         buf =3D (u8 *)vgpu_opregion(vgpu)->va;
>         header =3D (struct opregion_header *)buf;
> -       memcpy(header->signature, opregion_signature,
> -              sizeof(opregion_signature));
> +
> +       static_assert(sizeof(header->signature) =3D=3D sizeof(OPREGION_SI=
GNATURE) - 1);
> +       memcpy(header->signature, OPREGION_SIGNATURE, sizeof(header->sign=
ature));
> +
>         header->size =3D 0x8;
>         header->opregion_ver =3D 0x02000000;
>         header->mboxes =3D MBOX_VBT;
>
>
>
> --
> Jani Nikula, Intel

This patch does solve the build issue with gcc-15 on Fedora-42
(gcc-15.0.1-0.9.fc42.x86_64).
https://copr.fedorainfracloud.org/coprs/kwizart/kernel-longterm-6.12/build/=
8812754/

Thanks.
