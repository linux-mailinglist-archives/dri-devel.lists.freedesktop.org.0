Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F0CA73F0
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385010EAB4;
	Fri,  5 Dec 2025 10:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kygavMHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6F410EAB3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:48:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 052F06020F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6617C19423
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764931701;
 bh=QrVPt4Rxcp5PJlz/4VQYZo3jOoVJw3nhAYdeqrRCFCo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kygavMHdGYcnNJwm7lC5NjROC5pP0NUKpXqK7Biz8BNaDHF+0CPygieWyfbS3q7DN
 oKTTSOV9634ZYMVY54gz3iRLFGDllRsrK1PeT2OhLcnl/0tCi8Kd5446OtixdIr6Dn
 Y7dhhTkaJvUJ/TzPdrubJcM/RHUXJ6diHiNGqw/V9KcDC6L2NUUTOvN0E8Trgrg6Sh
 z+qPqgHVWbXK1et/HCZ4B/ZEvNwVH6d3CW7IEzQPPbuNqYKMsAt42n4ThED9T1DbnU
 CXyllON5ve7thGsh7B4peZZ477Sf6uv17HRHrj+D6Mhz7f0g4pMFs1G9CVTQoCCz3x
 5INTrFB6KUIIA==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-594330147efso2012824e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 02:48:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVfhXvMI6pa+gV0LKjLReQGXIzm1NqMy9fxGmjz8tD8DSatHJ/hN5eJqcXMkyYIRzWCrZBV+QfYwvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb+EmrUyIcth10NSI29aM2T6rYvcKaQ1IJK7ZL7b0H9BVVxQFD
 Hk1ONIhVnTfQqT4wsZNcPCEsghz9oG33K3mc1fd0mVRf3Jafrq9Xm1rHccn1LW7ZKcHLqABGgJu
 Y5MSPvOErradLj25m8pWddHnTJNojaIg=
X-Google-Smtp-Source: AGHT+IEvHnCA+35+G6qlMWnRT7CH/vPSRAST3MqD//tEb30hADZ6yX50ERhnDFtFtQnWsYNiQfDyt1oAgXxg3Q1ZC9k=
X-Received: by 2002:a05:6512:110a:b0:595:83f5:c33e with SMTP id
 2adb3069b0e04-597d3f0a173mr3538191e87.11.1764931699972; Fri, 05 Dec 2025
 02:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
 <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
In-Reply-To: <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 5 Dec 2025 11:48:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
X-Gm-Features: AWmQ_bk_CANQh0NNSJOV7Yugs37HbMZjFdhS2AogpPPGzBgRa7uP_idIjjwmhaA
Message-ID: <CAMj1kXFLaOZMXsUsvrshkwhvJSWm3V_iZB3n1rga=Q6zwrVY_g@mail.gmail.com>
Subject: Re: [PATCH] drm/i195: Fix format string truncation warning
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Sun, 9 Nov 2025 at 19:00, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 8 Nov 2025 at 01:27, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> >
> >
> > On 07/11/2025 16:42, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > GCC notices that the 16-byte uabi_name field could theoretically be t=
oo
> > > small for the formatted string if the instance number exceeds 100.
> > >
> > > Given that there are apparently ABI concerns here, this is the minima=
l
> > > fix that shuts up the compiler without changing the output or the
> > > maximum length for existing values < 100.
> >
> > What would be those ABI concerns? I don't immediately see any.
> > > drivers/gpu/drm/i915/intel_memory_region.c: In function =E2=80=98inte=
l_memory_region_create=E2=80=99:
> > > drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: =E2=80=98%u=
=E2=80=99 directive output may be truncated writing between 1 and 5 bytes i=
nto a region of size between 3 and 11 [-Werror=3Dformat-truncation=3D]
> > >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s=
%u",
> > >        |                                                             =
^~
> > > drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive ar=
gument in the range [0, 65535]
> > >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s=
%u",
> > >        |                                                          ^~~=
~~~
> > > drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: =E2=80=98snpr=
intf=E2=80=99 output between 7 and 19 bytes into a destination of size 16
> > >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s=
%u",
> > >        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> > >    274 |                  intel_memory_type_str(type), instance);
> > >        |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > >
> > > This is unlikely to be the right fix, but sending a wrong patch is
> > > usually a better way to elicit a response than just sending a bug
> > > report.
> > >
> > >   drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu=
/drm/i915/intel_memory_region.c
> > > index 59bd603e6deb..ad4afcf0c58a 100644
> > > --- a/drivers/gpu/drm/i915/intel_memory_region.c
> > > +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> > > @@ -271,7 +271,7 @@ intel_memory_region_create(struct drm_i915_privat=
e *i915,
> > >       mem->instance =3D instance;
> > >
> > >       snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
> > > -              intel_memory_type_str(type), instance);
> > > +              intel_memory_type_str(type), instance % 100);
> > It's a theoretical issue only since there is no hardware with a double
> > digit number of instances.
> >
> > But I guess much prettier fix would be to simply grow the buffer.
> >
>

OK, so something like

--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -72,7 +72,7 @@ struct intel_memory_region {
        u16 instance;
        enum intel_region_id id;
        char name[16];
-       char uabi_name[16];
+       char uabi_name[20];
        bool private; /* not for userspace */

        struct {



> > Also, hm, how come gcc does not find the mem->name vsnprintf from
> > intel_memory_region_set_name?
> >
>

AFAICT, intel_memory_region_set_name() is never called with a format
string that could produce more than 15/16 bytes of output.
