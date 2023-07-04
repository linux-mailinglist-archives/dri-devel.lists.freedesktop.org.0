Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF68746BA2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2064310E2B0;
	Tue,  4 Jul 2023 08:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048F210E095;
 Tue,  4 Jul 2023 08:05:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51e00695e21so2598386a12.1; 
 Tue, 04 Jul 2023 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688457958; x=1691049958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVWPGfFaZM7RIjrMZBy1U4ap/sNPrOgYsjGHVnmKQSk=;
 b=b2Q098KQfFtpS7gTPdbmgBLG6y6WnS0W4y9w15Mk6VXLKw1YWBD+7g/Z+VmdPH+PFz
 3RwrbMdE1TcSlKbe6kOsVFP6L5hMYedQEPgAyv2qwi59D6ErYxrSAXczjgxk42JyUsGN
 OH8OCWfJoTTLzDjWMHKGs7LZY384TmGEUV8rVE+9vnK3fWFQz/4D2IojDuU8v/TmbF0D
 L0UgKj0lwWON50ppAOvCvY/hKOHZur9fxXgK78td25ykVYgtgewaB0iX7rmLmOsDVCiA
 yI2zx+Hsn9r8i2GgKggPNsc4ThKwcz0CrfNMLXhYsjqqfJcxI1UoidEFs9zQIcqvF/lD
 t+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457958; x=1691049958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CVWPGfFaZM7RIjrMZBy1U4ap/sNPrOgYsjGHVnmKQSk=;
 b=hh9MFFri+op1NPCRnR8hw1bXqwo5KclNIh92iSuvbu1GcV60MHqMOQM8uRvjN5wLw7
 IRW1YlB1eOxZMeXdNDZEKWDrRPaj5RtkWsAx03jnO9BNO1LRzGyXYDiz3mGCl3kXyZXR
 E4gKQjG1L0C5IbKgdqElveM0QB8NtYiRNr8sfPjQyDVJpAjP2vH021tp5yvEFHQn+snI
 hapvqG0hOf7smYV7cJdjwwauj55+sAvXA/J5EmUs5cuP46cLDfGWE6FtTmyMoQ7sLhjn
 Yj/ux5U6JcT8IFNe53G0xtR/w+gxPeiHrdXL74mUTUB4fCI2uxTXLtZZ19X4c6j2PNE9
 +qXQ==
X-Gm-Message-State: ABy/qLbiyAX+sl4rGTxB8L5zXODVs9+I4ifQ3oInUYRztpl6Kcv5YZP2
 5OtgXD7dU3Qn5ObsqIPg1+4q4q0Uo78o7ZUgvc8=
X-Google-Smtp-Source: APBJJlFvdD4JojFZIfYCBIl8X+D9YLlLXiIOYn4I/eCNYZMtwhyTmPAnUPUixcI/mqslOeYez4T8nXjkJA+VMLhcPc4=
X-Received: by 2002:a05:6402:4496:b0:51d:d41b:26a5 with SMTP id
 er22-20020a056402449600b0051dd41b26a5mr9120655edb.14.1688457957804; Tue, 04
 Jul 2023 01:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230703150859.6176-1-ubizjak@gmail.com>
 <87o7ks16gh.fsf@intel.com>
In-Reply-To: <87o7ks16gh.fsf@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 4 Jul 2023 10:05:46 +0200
Message-ID: <CAFULd4YDHqUud94Q1mbKyKqGHh==Gv7+FpNhgm5s1p=0ZwcAXg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/pmu: Use local64_try_cmpxchg in
 i915_pmu_event_read
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 04 Jul 2023 08:15:14 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 9:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Mon, 03 Jul 2023, Uros Bizjak <ubizjak@gmail.com> wrote:
> > Use local64_try_cmpxchg instead of local64_cmpxchg (*ptr, old, new) =3D=
=3D old
> > in i915_pmu_event_read.  x86 CMPXCHG instruction returns success in ZF =
flag,
> > so this change saves a compare after cmpxchg (and related move instruct=
ion
> > in front of cmpxchg).
> >
> > Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxc=
hg
> > fails. There is no need to re-read the value in the loop.
> >
> > No functional change intended.
> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/i915_pmu.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i91=
5_pmu.c
> > index d35973b41186..108b675088ba 100644
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -696,12 +696,11 @@ static void i915_pmu_event_read(struct perf_event=
 *event)
> >               event->hw.state =3D PERF_HES_STOPPED;
> >               return;
> >       }
> > -again:
> > -     prev =3D local64_read(&hwc->prev_count);
> > -     new =3D __i915_pmu_event_read(event);
> >
> > -     if (local64_cmpxchg(&hwc->prev_count, prev, new) !=3D prev)
> > -             goto again;
> > +     prev =3D local64_read(&hwc->prev_count);
> > +     do {
> > +             new =3D __i915_pmu_event_read(event);
> > +     } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>
> You could save everyone a lot of time by actually documenting what these
> functions do. Assume you don't know what local64_try_cmpxchg() does, and
> see how many calls you have to go through to figure it out.

These functions are documented in Documentation/atomic_t.txt (under
"RMW ops:" section), and the difference is explained in a separate
section "CMPXCHG vs TRY_CMPXCGS" in the same file.

Uros.

> Because the next time I encounter this code or a patch like this, I'm
> probably going to have to do that again.
>
> To me, the old one was more readable. The optimization is meaningless to
> me if it's not quantified but reduces readability.
>
>
> BR,
> Jani.
>
>
> >
> >       local64_add(new - prev, &event->count);
> >  }
>
> --
> Jani Nikula, Intel Open Source Graphics Center
