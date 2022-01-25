Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905DD49BB10
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 19:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB12B10E3EA;
	Tue, 25 Jan 2022 18:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C6B10E3EA;
 Tue, 25 Jan 2022 18:16:33 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x11so14347820plg.6;
 Tue, 25 Jan 2022 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qWi/VzmHnEk2/VtWXzNTzI6tNMuksJ3FgOnDItF6gHE=;
 b=Q3tDZoDFFIbhLfDZzBvZ0S5DOiksvrkBEYh7dQDmQIWbV1Q1uB59IguVOIm01TYQG7
 lfRZ0/5SSuDtRD51nesMx9/e3kRtXvjYoVyvYVnJqtPFv9+DPa+oIDrmhswNvrNCe52c
 be+CGWlHDXVoFrFdly3rvZLQsFR6U+jpv1iIrkjPrwWuuc/dDRKZInai4xrwN4qQLyMO
 eLTSQex6ptCXF3kd4l3D19Ncy30vHzGGaoyI/woU97d96+0xsQLSRwf2TkBaD7XXu8mA
 IteB04ettGTZ73ulOY7L/1B7MASI8jOsn+RY9CF6uxmQssHB8kJnVg8bWBoHbZeNR1hY
 NU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qWi/VzmHnEk2/VtWXzNTzI6tNMuksJ3FgOnDItF6gHE=;
 b=Si/Qgxjpeu06v+VmSw3zow6OG0DSky2j3ojbokl0rvnsXxwQjXU3CtL0PusZ6sU6n7
 Ao3SVy1jTqvr07m91IGQf+K6LlAcCY1mg75/ZrELEBLTp/MtYjO26FVSHtcao4IReFbS
 0GKQvUT3Y7+NiuP5ugvOgju6qddVNRj7nKhHysCIwsFqTwJGUuno4CBMfai3CVXWt9em
 NvmpVZgmBn/312KMrZHD699tviZ4ap/b4VTQJLA/HykyzE/lZR0HYo+/o73mlH9OymNk
 afWlVqp5ZgO4SQieDZj20gtbdG+pYb+h6wuhQfcWGv/AdtMEkrtuKnkHrvcK5FNLCLxQ
 2liw==
X-Gm-Message-State: AOAM530hZNGT4yCImXqbymFh1Dp0Y2pIPxpeE8KgAlWymlWFsPORVdiU
 sxUuYR3d7iqCFcfVHqIV5jcHhsPzo/kwEN3C01s=
X-Google-Smtp-Source: ABdhPJwh+xmHmgWWUczLKE9+twP3Ew4lKECg1cszwMOtqaxD+MmnKLr7vIvmnlfRHcTHMZw0tvD2MM6DM+bWzK5rnMY=
X-Received: by 2002:a17:90a:141:: with SMTP id z1mr4768164pje.87.1643134592962; 
 Tue, 25 Jan 2022 10:16:32 -0800 (PST)
MIME-Version: 1.0
References: <20220123183925.1052919-1-yury.norov@gmail.com>
 <20220123183925.1052919-18-yury.norov@gmail.com>
 <bab43c36-a3de-f96a-6530-4ab3a55b8ba0@linux.intel.com>
In-Reply-To: <bab43c36-a3de-f96a-6530-4ab3a55b8ba0@linux.intel.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Tue, 25 Jan 2022 10:16:21 -0800
Message-ID: <CAAH8bW8jcNM--D_cUtWNe7cbBjVAENq_SEapDcPjit=BB705JA@mail.gmail.com>
Subject: Re: [PATCH 17/54] gpu: drm: replace cpumask_weight with cpumask_empty
 where appropriate
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Alexey Klimov <aklimov@redhat.com>, David Laight <David.Laight@aculab.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 1:28 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 23/01/2022 18:38, Yury Norov wrote:
> > i915_pmu_cpu_online() calls cpumask_weight() to check if any bit of a
> > given cpumask is set. We can do it more efficiently with cpumask_empty()
> > because cpumask_empty() stops traversing the cpumask as soon as it finds
> > first set bit, while cpumask_weight() counts all bits unconditionally.
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >   drivers/gpu/drm/i915/i915_pmu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> > index ea655161793e..1894c876b31d 100644
> > --- a/drivers/gpu/drm/i915/i915_pmu.c
> > +++ b/drivers/gpu/drm/i915/i915_pmu.c
> > @@ -1048,7 +1048,7 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> >       GEM_BUG_ON(!pmu->base.event_init);
> >
> >       /* Select the first online CPU as a designated reader. */
> > -     if (!cpumask_weight(&i915_pmu_cpumask))
> > +     if (cpumask_empty(&i915_pmu_cpumask))
> >               cpumask_set_cpu(cpu, &i915_pmu_cpumask);
> >
> >       return 0;
> >
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> I see it's a large series which only partially appeared on our mailing
> lists.

The series is here: https://lkml.org/lkml/2022/1/23/223
The branch: https://github.com/norov/linux/tree/bitmap-20220123

> So for instance it hasn't got tested by our automated CI. (Not
> that I expect any problems in this patch.)

Would be great if you give a test for the whole series, thanks!

> What are the plans in terms of which tree will it get merged through?

For the patches that will not be merged by maintainers of corresponding
subsystems, I'll use my bitmap branch and send it to linux-next.

Thanks,
Yury
