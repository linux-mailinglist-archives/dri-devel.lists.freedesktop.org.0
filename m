Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5394B2067
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 09:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D38310EA25;
	Fri, 11 Feb 2022 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BB710EA24;
 Fri, 11 Feb 2022 08:44:23 +0000 (UTC)
Date: Fri, 11 Feb 2022 09:44:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644569059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeYU8c+lRvkFWBYmpHo0677lmpDC8/OXyuCRrJWusUc=;
 b=HTCeSCici3BGao97l2RjKc8m6UqBACaDeSvRlBTRlH2UKU5jiBv+lTKdn+n0ecvYAkYRoD
 WFh30SRzfkwMBXX5be4C13kQmKD+UiUjAow1sPGRhnimk6AkK0UFt2c/xVbSVEKtH7UzKA
 JG/GmCi1b3LwsgCJnRrP6mdato9XW/wWlujwtDaWIiESvRO9eOfBmc+LDNAxL/jnq3YHfJ
 QKHyUg/c1ls+vSiq4gRI0LEcur6G4r3l9SeOZZr1fZwhrpUNK5BHn3WUoUIBVQfb6DIbb6
 UErWxVuQSWDY/AvSqomVKXHy4KvDmANh8YTN6Uco8brcUnh/z4cUCu/TTiLFzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644569059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XeYU8c+lRvkFWBYmpHo0677lmpDC8/OXyuCRrJWusUc=;
 b=EnmOBc2ZzwPMl8L9mQyoTZX14j9JBbJcDbIGukJWXqQYI6OUdqDtux+UaY3VynQecLkIml
 zNHXWQ4JAI+pEyCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Subject: Re: [PATCH 4/8] drm/i915: Use preempt_disable/enable_rt() where
 recommended
Message-ID: <YgYh4Y119dKY8vaO@linutronix.de>
References: <20211214140301.520464-1-bigeasy@linutronix.de>
 <20211214140301.520464-5-bigeasy@linutronix.de>
 <CAEsyxygWP50qP9Xj-GmAycb6Ex8DET2c4DbY-i3dnocaXZ=JZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAEsyxygWP50qP9Xj-GmAycb6Ex8DET2c4DbY-i3dnocaXZ=JZA@mail.gmail.com>
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

On 2022-01-27 00:29:37 [+0100], Mario Kleiner wrote:
> Hi, first thank you for implementing these preempt disables according to
Hi Mario,

> the markers i left long ago. And sorry for the rather late reply.
>=20
> I had a look at the code, as of Linux 5.16, and did also a little test run
> (of a standard kernel, not with PREEMPT_RT, only
> CONFIG_PREEMPT_VOLUNTARY=3Dy) on my Intel Kabylake GT2, so some thoughts:
>=20
> The area covers only register reads and writes. The part that worries me
> > is:
> > - __intel_get_crtc_scanline() the worst case is 100us if no match is
> >   found.
> >
>=20
> This one can be a problem indeed on (maybe all?) modern Intel gpu's since
> Haswell, ie. the last ~10 years. I was able to reproduce it on my Kabylake
> Intel gpu.
>=20
> Most of the time that for-loop with up to 100 repetitions (~ 100
> udelay(1) + one mmio register read) (cfe.
> https://elixir.bootlin.com/linux/v5.17-rc1/source/drivers/gpu/drm/i915/i9=
15_irq.c#L856)
> will not execute, because most of the time that function gets called from
> the vblank irq handler and then that trigger condition (if
> (HAS_DDI(dev_priv) && !position)) is not true. However, it also gets call=
ed
> as part of power-saving on behalf of userspace context, whenever the
> desktop graphics goes idle for two video refresh cycles. If the desktop
> shows graphics activity again, and vblank interrupts need to get reenable=
d,
> the probability of hitting that case is then ~1-4% depending on video mod=
e.
> How many loops it runs also varies.
>=20
> On my little Intel(R) Core(TM) i5-8250U CPU machine with a mostly idle
> desktop, I observed about one hit every couple of seconds of regular use,
> and each hit took between 125 usecs and almost 250 usecs. I guess udelay(=
1)
> can take a bit longer than 1 usec?

it should get very close to this. Maybe something else extended the time
depending on what you observe.

> So that's too much for preempt-rt. What one could do is the following:
>=20
> 1. In the for-loop in __intel_get_crtc_scanline(), add a preempt_enable()
> before the udelay(1); and a preempt_disable() again after it. Or
> potentially around the whole for-loop if the overhead of
> preempt_en/disable() is significant?

It is very optimized on x86 ;)

> 2. In intel_get_crtc_scanline() also wrap the call to
> __intel_get_crtc_scanline() into a preempt_disable() and preempt_enable(),
> so we can be sure that __intel_get_crtc_scanline() always gets called with
> preemption disabled.
>=20
> Why should this work ok'ish? The point of the original preempt disable
> inside i915_get_crtc_scanoutpos
> <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/i915_get_crtc_scanout=
pos>
> is that those two *stime =3D ktime_get() and *etime =3D ktime_get() clock
> queries happen as close to the scanout position query as possible to get a
> small confidence interval for when exactly the scanoutpos was
> read/determined from the display hardware. error =3D (etime - stime) is t=
he
> error margin. If that margin becomes greater than 20 usecs, then the
> higher-level code will consider the measurement invalid and repeat the
> whole procedure up to 3 times before giving up.

The preempt-disable is needed then? The task is preemptible here on
PREEMPT_RT but it _may_ not come to this. The difference vs !RT is that
an interrupt will preempt this code without it.

> Normally, in my experience with different graphics chips, one would obser=
ve
> error < 3 usecs, so the measurement almost always succeeds at first try,
> only very rarely takes two attempts. The preempt disable is meant to make
> sure that this stays the case on a PREEMPT_RT kernel.

Was it needed?

> The problem here are the relatively rare cases where we hit that up to 100
> iterations for-loop. Here even on a regular kernel, due to hardware quirk=
s,
> we already exceed the 20 usecs tolerance by a huge amount of more than 100
> usecs, leading to a retry of the measurement. And my tests showed that
> often the two succeeding retries also fail, because of hardware quirks can
> apparently create a blackout situation approaching 1 msec, so we lose
> anyway, regardless if we get preempted on a RT kernel or not. That's why
> enabling preemption on RT again during that for-loop should not make the
> situation worse and at least keep RT as real-time as intended.
>=20
> In practice I would also expect that this failure case is the one least
> likely to impair userspace applications greatly in practice. The cases th=
at
> mostly matter are the ones executed during vblank hardware irq, where the
> for-loop never executes and error margin and preempt off time is only abo=
ut
> 1 usec. My own software which depends on very precise timestamps from the
> mechanism never reported >> 20 usecs errors during startup tests or runti=
me
> tests.

That is without RT I assume?

> > - intel_crtc_scanlines_since_frame_timestamp() not sure how long this
> >   may take in the worst case.
> >
> >
> intel_crtc_scanlines_since_frame_timestamp() should be harmless. That
> do-while loop just tries to make sure that two register reads that should
> happen within the same video refresh cycle are happening in the same
> refresh cycle. As such, the while loop will almost always just execute on=
ly
> once, and at most two times, so that's at most 6 mmio register reads for
> two loop iterations.
>=20
> In the long run one could try to test if
> __intel_get_crtc_scanline_from_timestamp
> <https://elixir.bootlin.com/linux/v5.17-rc1/C/ident/__intel_get_crtc_scan=
line_from_timestamp>()
> wouldn't be the better choice for affected hardware always. Code and
> register descriptions suggest the feature is supported by all potentially
> affected hardware, so if it would turn out that that method works as
> accurate and reliable as the old one, we could save the overhead and time
> delays for that 100 for-loop iterations and make the whole timestamping
> more reliable on modern hw.
>=20
> It was in the RT queue for a while and nobody complained.
> > Disable preemption on PREEPMPT_RT during timestamping.
> >
> >
> Do other patches exist to implement the preempt_dis/enable() also for AMD
> and NVidia / nouveau / vc4? I left corresponding markers for

No, nobody complained. Most likely the i915 is wider used since it is
built-in into many chipsets which then run RT and some of them use the
display in production.

> radeon/amdgpu-kms and RaspberryPi's vc4 driver. Ideally all kms drivers
> which use scanout position queries should have such code. Always a
> preempt_disable() before the "if (stime) *stime =3D ktime_get();" stateme=
nt,
> and a preempt_enable() after the "if (etime) *etime =3D ktime_get();"
> statement.
>=20
> Checking Linux 5.16 code, this should be safe - short preempt off interval
> with only a few mmio register reads - for all kms drivers that support it
> atm. I found the following functions to modify:
>=20
> amdgpu: amdgpu_display_get_crtc_scanoutpos()
> radeon: radeon_get_crtc_scanoutpos()
> msm: mdp5_crtc_get_scanout_position() and dpu_crtc_get_scanout_position()
> ltdc: ltdc_crtc_get_scanout_position()
> vc4: vc4_crtc_get_scanout_position()

I that is "small" with locks and such, then it should work

> nouveau: In nvkm_head_mthd_scanoutpos(), one needs to put the
> preempt_disable() right before
>=20
=E2=80=A6
>=20
> Is the plan to integrate these patches into the mainline kernel soon, as
> part of ongoing preempt-rt upstreaming?

I want to get the i915 in as part of RT upstreaming. But now I've been
thinking to not allowing i915 on RT via Kconfig and worry about it
afterwards.

> thanks,
> -mario

Sebastian
