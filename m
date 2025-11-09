Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6CC444C1
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 19:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9110E254;
	Sun,  9 Nov 2025 18:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IEtLrUVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B6910E259
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 18:00:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 514A3441AD
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C1AC19423
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762711247;
 bh=ngdJsBUltnXHKi403aGstSmuPBJQqtJoMuxj+Ue+A6Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IEtLrUVtHjEsWm/C8MwdyhFG2iNPErdYRKzlSnY0aHAnuSWvL30RJ8uWSliWKCy66
 kmVOeRm5P53gNocD/3AlaVK4LGuI/bcPlRdwlIoHuE3g8Xaa2p+e9/zA7IybZwuHlA
 dt8PPtdUDmJC5fs/SEvsR/cfKqyN+MfLLPpK9+TK22GzFx6cfENsx2DPpsEC9Hyli1
 iJtrzkI7piY/HfuVhtJcKkoCJCpjNtjY9DO1IUu5UK68f51+vQk3AbZlecPmlD0g5x
 XVbSaJMl0u/OUqVGzC1NuuuG/zSZTIvkAZVfhsbDZ0dE/n7G2C2iCqjGimUdCV7Gkz
 sWypYnNvO6ANw==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37a5d03b53dso22909051fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Nov 2025 10:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAYJC2HI1/e653DatPMfEB4ph/jk9NVPljSl2rTUtp0GmMHXR1HXxkj5gbK1gf9xapWCKj95buGr0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsRsOBZ3rrgy3tPPWunawM2ohZpFVsSoZuY5bY71iGGYtz8dEJ
 0daisNADaqkWSVDxEb6uaWkg4thsLhN51x9imO9kL4yp75QOTyipeegh2q/l/vwkHUhU6c2IKS7
 yN1v4EYuBlTYjVu0MapHmConVlRhmEGA=
X-Google-Smtp-Source: AGHT+IGzG8az736Ek/PKuPSVq9csQ+w8E7LVXJkHwNGCRjuZKzNqUTVu8H4LC4w4CqlfLzKUtK6ospJSS6Nc+qrcLqg=
X-Received: by 2002:a05:6512:3b1e:b0:594:4e5f:a224 with SMTP id
 2adb3069b0e04-5945f1dd5eamr1509661e87.39.1762711245529; Sun, 09 Nov 2025
 10:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20251107164240.2023366-2-ardb+git@google.com>
 <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
In-Reply-To: <14ca1b28-df1d-4065-ad7a-97a3ff81a5a4@ursulin.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 9 Nov 2025 19:00:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
X-Gm-Features: AWmQ_bnvXvdUhRjp81oyBi2v9d3FvXVwwo8Xw1qggdpFOcTX930itimlVJwIpKw
Message-ID: <CAMj1kXEgfykaf9oB4_tuAQqwXDN+NLy_Hb_+RnQmeicVgKt0bA@mail.gmail.com>
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

On Sat, 8 Nov 2025 at 01:27, Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>
>
> On 07/11/2025 16:42, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > GCC notices that the 16-byte uabi_name field could theoretically be too
> > small for the formatted string if the instance number exceeds 100.
> >
> > Given that there are apparently ABI concerns here, this is the minimal
> > fix that shuts up the compiler without changing the output or the
> > maximum length for existing values < 100.
>
> What would be those ABI concerns? I don't immediately see any.
> > drivers/gpu/drm/i915/intel_memory_region.c: In function =E2=80=98intel_=
memory_region_create=E2=80=99:
> > drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: =E2=80=98%u=
=E2=80=99 directive output may be truncated writing between 1 and 5 bytes i=
nto a region of size between 3 and 11 [-Werror=3Dformat-truncation=3D]
> >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u=
",
> >        |                                                             ^~
> > drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argu=
ment in the range [0, 65535]
> >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u=
",
> >        |                                                          ^~~~~=
~
> > drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: =E2=80=98snprin=
tf=E2=80=99 output between 7 and 19 bytes into a destination of size 16
> >    273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u=
",
> >        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> >    274 |                  intel_memory_type_str(type), instance);
> >        |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> >
> > This is unlikely to be the right fix, but sending a wrong patch is
> > usually a better way to elicit a response than just sending a bug
> > report.
> >
> >   drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/d=
rm/i915/intel_memory_region.c
> > index 59bd603e6deb..ad4afcf0c58a 100644
> > --- a/drivers/gpu/drm/i915/intel_memory_region.c
> > +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> > @@ -271,7 +271,7 @@ intel_memory_region_create(struct drm_i915_private =
*i915,
> >       mem->instance =3D instance;
> >
> >       snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
> > -              intel_memory_type_str(type), instance);
> > +              intel_memory_type_str(type), instance % 100);
> It's a theoretical issue only since there is no hardware with a double
> digit number of instances.
>
> But I guess much prettier fix would be to simply grow the buffer.
>

Whatever works for you - I don't really understand this code anyway.

> Also, hm, how come gcc does not find the mem->name vsnprintf from
> intel_memory_region_set_name?
>

The optimizer works in mysterious ways, I guess. I cannot explain why
I am the only one seeing this in the first place, but the warning
seems legit to me.
