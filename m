Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F04B5A06
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 19:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6309110E29B;
	Mon, 14 Feb 2022 18:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60410E29B;
 Mon, 14 Feb 2022 18:38:59 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id m17so3553641edc.13;
 Mon, 14 Feb 2022 10:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8+Fn9783eKqegehu4eBcQm3svmMt659t44XL8zPNa6c=;
 b=pTji088ALk5Ucm82K8e4nRCN8B/1wuPixOcDkVKg6Q+O0w90RQLU/Ij1LHVbB0piVj
 B4N6tn/dGJiJklRzF7n4MS0y+gFYYZ9/QdTYrtQZKicf0jCLKf5BQaOJ2IRvbna4CH3q
 MtVwWuGDhMyB2/yjJ3da67kWCo0OImZKZlKbhX/SHORQMiXi0TvvOxws05VU1KOBkDvx
 N2PtTAnOhzRNOy01pNQBj5ebXaXXKzXkqcfkKND2dVlD5cXrximKKSE+WY23BFgO1OM4
 WVJrLs1bwhfDKNC9x1mz9XJXMfJ5arQZX/UWon3pJoZGfKhJd6pgDTLInkKaZjM4zL2h
 TozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8+Fn9783eKqegehu4eBcQm3svmMt659t44XL8zPNa6c=;
 b=SyxThlyilEIR3AASuHAyNy9duImNvPKfz+kCMOWHuCLTD8o5w/wDHIZtMUwwWvE+Td
 7MV9id6kkc+uodezv+yLGXQK77yYo+oLirez3QcpWF47KJgRU7PQSsgBUELZBn1ib/zA
 wgg4G9BeHFo1Iisv3yg77eADjxhF2TiLZCFxHmN5IsV/hMOf5psv3cpEte1X9Lppzkuu
 kCk4iqO71+8BW3xs8h6e8BZyeHtdOavtC9PVyfZuldr4DpyyGgHO32Id/romO0E+k7UV
 p6DspsqtzA3LALjN1WeaaETeCuEZ6pRZ0FFQ88MsB6JIfpHF8evfqE0Mp+eolUJjBWiT
 1wYA==
X-Gm-Message-State: AOAM530PGB4ayCsQ8bh6Xb8hu+ipNJxUCrGJ5ORv8UWtRmI0UCp92nvK
 OPn6E/+2IUcVqHPu/2sYzx80J2V3a20IKDVpg/o=
X-Google-Smtp-Source: ABdhPJySLVs7orkjFTx5FpshM12mXb83KN8+b3U76Duq/qcirqCJWwLxAc8dreD+DCYOYNWDa5hnXNqgGb09QBNsO7g=
X-Received: by 2002:aa7:da86:: with SMTP id q6mr96835eds.167.1644863937958;
 Mon, 14 Feb 2022 10:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-5-bigeasy@linutronix.de>
 <CAEsyxygWP50qP9Xj-GmAycb6Ex8DET2c4DbY-i3dnocaXZ=JZA@mail.gmail.com>
 <YgYh4Y119dKY8vaO@linutronix.de>
In-Reply-To: <YgYh4Y119dKY8vaO@linutronix.de>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 14 Feb 2022 19:38:46 +0100
Message-ID: <CAEsyxygUybKawzNNpmw3iT07XbTd+FFs846mJ7OHk9oP7WkU_Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/i915: Use preempt_disable/enable_rt() where
 recommended
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 9:44 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2022-01-27 00:29:37 [+0100], Mario Kleiner wrote:
> > Hi, first thank you for implementing these preempt disables according t=
o
> Hi Mario,
>
> > the markers i left long ago. And sorry for the rather late reply.
> >
> > I had a look at the code, as of Linux 5.16, and did also a little test =
run
> > (of a standard kernel, not with PREEMPT_RT, only
> > CONFIG_PREEMPT_VOLUNTARY=3Dy) on my Intel Kabylake GT2, so some thought=
s:
> >
> > The area covers only register reads and writes. The part that worries m=
e
> > > is:
> > > - __intel_get_crtc_scanline() the worst case is 100us if no match is
> > >   found.
> > >
> >
> > This one can be a problem indeed on (maybe all?) modern Intel gpu's sin=
ce
> > Haswell, ie. the last ~10 years. I was able to reproduce it on my Kabyl=
ake
> > Intel gpu.
> >
> > Most of the time that for-loop with up to 100 repetitions (~ 100
> > udelay(1) + one mmio register read) (cfe.
> > https://elixir.bootlin.com/linux/v5.17-rc1/source/drivers/gpu/drm/i915/=
i915_irq.c#L856)
> > will not execute, because most of the time that function gets called fr=
om
> > the vblank irq handler and then that trigger condition (if
> > (HAS_DDI(dev_priv) && !position)) is not true. However, it also gets ca=
lled
> > as part of power-saving on behalf of userspace context, whenever the
> > desktop graphics goes idle for two video refresh cycles. If the desktop
> > shows graphics activity again, and vblank interrupts need to get reenab=
led,
> > the probability of hitting that case is then ~1-4% depending on video m=
ode.
> > How many loops it runs also varies.
> >
> > On my little Intel(R) Core(TM) i5-8250U CPU machine with a mostly idle
> > desktop, I observed about one hit every couple of seconds of regular us=
e,
> > and each hit took between 125 usecs and almost 250 usecs. I guess udela=
y(1)
> > can take a bit longer than 1 usec?
>
> it should get very close to this. Maybe something else extended the time
> depending on what you observe.
>

Probably all the other stuff in that for-loop adds a microsecond. I
don't have a good feeling how long a typical mmio register read is
expected to take, except for quite a bit less than 1 usec from my
experience.

> > So that's too much for preempt-rt. What one could do is the following:
> >
> > 1. In the for-loop in __intel_get_crtc_scanline(), add a preempt_enable=
()
> > before the udelay(1); and a preempt_disable() again after it. Or
> > potentially around the whole for-loop if the overhead of
> > preempt_en/disable() is significant?
>
> It is very optimized on x86 ;)

Good! So adding a disable/enable pair into each of those loop
iterations won't hurt.

>
> > 2. In intel_get_crtc_scanline() also wrap the call to
> > __intel_get_crtc_scanline() into a preempt_disable() and preempt_enable=
(),
> > so we can be sure that __intel_get_crtc_scanline() always gets called w=
ith
> > preemption disabled.
> >
> > Why should this work ok'ish? The point of the original preempt disable
> > inside i915_get_crtc_scanoutpos
> > <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/i915_get_crtc_scano=
utpos>
> > is that those two *stime =3D ktime_get() and *etime =3D ktime_get() clo=
ck
> > queries happen as close to the scanout position query as possible to ge=
t a
> > small confidence interval for when exactly the scanoutpos was
> > read/determined from the display hardware. error =3D (etime - stime) is=
 the
> > error margin. If that margin becomes greater than 20 usecs, then the
> > higher-level code will consider the measurement invalid and repeat the
> > whole procedure up to 3 times before giving up.
>
> The preempt-disable is needed then? The task is preemptible here on
> PREEMPT_RT but it _may_ not come to this. The difference vs !RT is that
> an interrupt will preempt this code without it.
>

Yes, it is needed, as that chunk of code between the two ktime_get()
requires should ideally not get interrupted by anything.
The "try up to three times" higher level logic in calling code is just
to cover the hopefully rare cases where something still preempts,
e.g., a NMI or such.

I have not ever tested this on a PREEMPT_RT kernel in at least a
decade, but on regular kernels, e.g., Ubuntu generic or Ubuntu
low-latency kernels I haven't observed more than one retry when it
mattered, and usually the code executes in 0-2 usecs on my test
machines, way below the limit of 20 usecs at which a measurement is
considered failed and then retried. So the retries are sufficient as
long as all preventable preemption is prevented. Hence the
preempt_disable() annotations to make sure it continues to work on
PREEMPT_RT.

The exception, as I learned after your mail, is when that for-loop is
hit. Then it can take hundreds of microseconds, and even spoil all
three retries, resulting in a rather inaccurate measurement. But the
"good news" is that that for-loop will very likely only be hit in
cases where the code is not called from (Vblank/Pageflip-completion)
hardware interrupt handlers, but triggered by a userspace ioctl. Those
are the cases where a higher measurement error is imho tolerable in
typical use cases and luckily getting preempted won't make things
worse than they are already. That's why it is acceptable to have those
preempt_enable/disable around each udelay(1) in that one specific up
to 100 iterations for-loop -- It helps RT to reach its goals, but
doesn't hurt the graphics case further. Basically we got lucky.

> > Normally, in my experience with different graphics chips, one would obs=
erve
> > error < 3 usecs, so the measurement almost always succeeds at first try=
,
> > only very rarely takes two attempts. The preempt disable is meant to ma=
ke
> > sure that this stays the case on a PREEMPT_RT kernel.
>
> Was it needed?
>

The point of that code is that in an ideal world, the mmio registers
and ktime_get() host time read should happen all at exactly the same
time. Given that that is impossible, the second best is to try to do
both as close in time together as possible, hence the measures to try
to prevent any preemption as much as possible and have some
mitigations for the hopefully rare cases when it fails.

> > The problem here are the relatively rare cases where we hit that up to =
100
> > iterations for-loop. Here even on a regular kernel, due to hardware qui=
rks,
> > we already exceed the 20 usecs tolerance by a huge amount of more than =
100
> > usecs, leading to a retry of the measurement. And my tests showed that
> > often the two succeeding retries also fail, because of hardware quirks =
can
> > apparently create a blackout situation approaching 1 msec, so we lose
> > anyway, regardless if we get preempted on a RT kernel or not. That's wh=
y
> > enabling preemption on RT again during that for-loop should not make th=
e
> > situation worse and at least keep RT as real-time as intended.
> >
> > In practice I would also expect that this failure case is the one least
> > likely to impair userspace applications greatly in practice. The cases =
that
> > mostly matter are the ones executed during vblank hardware irq, where t=
he
> > for-loop never executes and error margin and preempt off time is only a=
bout
> > 1 usec. My own software which depends on very precise timestamps from t=
he
> > mechanism never reported >> 20 usecs errors during startup tests or run=
time
> > tests.
>
> That is without RT I assume?

Yes.

I haven't tested PREEMPT_RT in a decade. But all the same would apply
for RT. And there are interesting use cases at least in my field
(neuroscience/medical science) if one can have graphics applications
running on a RT kernel which are very timing sensitive. Setups which
need to present pictures/animations on a monitor with very reliable
and precise timing and timestamps, but also do some simultaneous
realtime data collection or stimulation via ADC/DAC boards or digital
i/o boards, e.g., realtime virtual dynamic patch-clamp techniques in
electrophysiology (cfe. this link for an idea:
https://vivo.weill.cornell.edu/display/pubid11764320).

And a whole host of other applications, once the RT patch-set is upstreamed=
...

>
> > > - intel_crtc_scanlines_since_frame_timestamp() not sure how long this
> > >   may take in the worst case.
> > >
> > >
> > intel_crtc_scanlines_since_frame_timestamp() should be harmless. That
> > do-while loop just tries to make sure that two register reads that shou=
ld
> > happen within the same video refresh cycle are happening in the same
> > refresh cycle. As such, the while loop will almost always just execute =
only
> > once, and at most two times, so that's at most 6 mmio register reads fo=
r
> > two loop iterations.
> >
> > In the long run one could try to test if
> > __intel_get_crtc_scanline_from_timestamp
> > <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/__intel_get_crtc_sc=
anline_from_timestamp>()
> > wouldn't be the better choice for affected hardware always. Code and
> > register descriptions suggest the feature is supported by all potential=
ly
> > affected hardware, so if it would turn out that that method works as
> > accurate and reliable as the old one, we could save the overhead and ti=
me
> > delays for that 100 for-loop iterations and make the whole timestamping
> > more reliable on modern hw.
> >
> > It was in the RT queue for a while and nobody complained.
> > > Disable preemption on PREEPMPT_RT during timestamping.
> > >
> > >
> > Do other patches exist to implement the preempt_dis/enable() also for A=
MD
> > and NVidia / nouveau / vc4? I left corresponding markers for
>
> No, nobody complained. Most likely the i915 is wider used since it is
> built-in into many chipsets which then run RT and some of them use the
> display in production.
>
> > radeon/amdgpu-kms and RaspberryPi's vc4 driver. Ideally all kms drivers
> > which use scanout position queries should have such code. Always a
> > preempt_disable() before the "if (stime) *stime =3D ktime_get();" state=
ment,
> > and a preempt_enable() after the "if (etime) *etime =3D ktime_get();"
> > statement.
> >
> > Checking Linux 5.16 code, this should be safe - short preempt off inter=
val
> > with only a few mmio register reads - for all kms drivers that support =
it
> > atm. I found the following functions to modify:
> >
> > amdgpu: amdgpu_display_get_crtc_scanoutpos()
> > radeon: radeon_get_crtc_scanoutpos()
> > msm: mdp5_crtc_get_scanout_position() and dpu_crtc_get_scanout_position=
()
> > ltdc: ltdc_crtc_get_scanout_position()
> > vc4: vc4_crtc_get_scanout_position()
>
> I that is "small" with locks and such, then it should work
>

Yes. I looked over all of those functions implementations, so unless i
overlooked something, it should be easy.

> > nouveau: In nvkm_head_mthd_scanoutpos(), one needs to put the
> > preempt_disable() right before
> >
> =E2=80=A6
> >
> > Is the plan to integrate these patches into the mainline kernel soon, a=
s
> > part of ongoing preempt-rt upstreaming?
>
> I want to get the i915 in as part of RT upstreaming. But now I've been
> thinking to not allowing i915 on RT via Kconfig and worry about it
> afterwards.
>

Well, my sketched out approach should be ok, and a start. We may be
able to do without that for-loop in the future for a more elegant
solution on affected hw, but that will require quite a bit of testing
(if it wouldn't exchange one problematic hardware quirk for another),
for which i don't have the time right now or in the next few months,
although i put it on to my todo list for laters, if nobody else does
it beforehand. The Intel gfx people would have a way larger sample of
hw to test though, my sample is n=3D1 atm.

-mario

> > thanks,
> > -mario
>
> Sebastian
