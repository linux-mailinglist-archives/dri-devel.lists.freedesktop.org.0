Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D61452A0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 11:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1D6F48C;
	Wed, 22 Jan 2020 10:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0699F6F48C;
 Wed, 22 Jan 2020 10:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 94D68FB03;
 Wed, 22 Jan 2020 11:30:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6ubGSDKZvw2; Wed, 22 Jan 2020 11:30:35 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4AA0B404A9; Wed, 22 Jan 2020 11:30:34 +0100 (CET)
Date: Wed, 22 Jan 2020 11:30:34 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/etnaviv: only reject timeouts with tv_nsec >= 2
 seconds
Message-ID: <20200122103034.GA67385@bogon.m.sigxcpu.org>
References: <20200121114553.2667556-1-arnd@arndb.de>
 <20200121125546.GA71415@bogon.m.sigxcpu.org>
 <1971902c68ff805ee0b4a66f558afe06e6edf0c5.camel@pengutronix.de>
 <CAK8P3a2E__zHPPEL37JwK=uHb_v-=C+-+zGaL3XoW5PZ+BUN5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2E__zHPPEL37JwK=uHb_v-=C+-+zGaL3XoW5PZ+BUN5g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Jan 21, 2020 at 08:05:27PM +0100, Arnd Bergmann wrote:
> On Tue, Jan 21, 2020 at 5:10 PM Lucas Stach <l.stach@pengutronix.de> wrot=
e:
> >
> > Hi Guido,
> >
> > On Di, 2020-01-21 at 13:55 +0100, Guido G=FCnther wrote:
> > > Hi,
> > > On Tue, Jan 21, 2020 at 12:45:25PM +0100, Arnd Bergmann wrote:
> > > > As Guido G=FCnther reported, get_abs_timeout() in the etnaviv user =
space
> > > > sometimes passes timeouts with nanosecond values larger than 100000=
0000,
> > > > which gets rejected after my first patch.
> > > >
> > > > To avoid breaking this, while also not allowing completely arbitrary
> > > > values, set the limit to 1999999999 and use set_normalized_timespec=
64()
> > > > to get the correct format before comparing it.
> > >
> > > I'm seeing values up to 5 seconds so I need
> > >
> > >      if (args->timeout.tv_nsec > (5 * NSEC_PER_SEC))
> > >
> > > to unbreak rendering. Which seems to match what mesa's get_abs_timeou=
t()
> > > does and how it's invoked.
> >
> > I have not tested this myself yet, only looked at the code. From the
> > code I quoted earlier, I don't see how we end up with 5 * NSEC_PER_SEC
> > in the tv_nsec member, even if the timeout passed to get_abs_timeout()
> > is 5 seconds.
> =

> I can think of two different ways you'd end up with around five seconds h=
ere:
> =

> a) you have a completely arbitrary 32-bit number through truncation,
>     which is up to 4.2 seconds
> b) you have the same kind of 32-bit number, but add up to another 9999999=
99
>     nanoseconds, so you get up to 5.2 seconds in the 64-bit field.

I've dumped out some values tv_nsec values with current mesa git on arm64:

[   33.699652] etnaviv_ioctl_gem_cpu_prep: 4990449401
[   33.813081] etnaviv_ioctl_gem_cpu_prep: 5103872445
[   33.822936] etnaviv_ioctl_gem_cpu_prep: 5113731286
[   33.840963] etnaviv_ioctl_gem_cpu_prep: 5131762726
[   33.854120] etnaviv_ioctl_gem_cpu_prep: 5144920127
[   33.861426] etnaviv_ioctl_gem_cpu_prep: 5152227527
[   33.872666] etnaviv_ioctl_gem_cpu_prep: 5163466968
[   33.879485] etnaviv_ioctl_gem_cpu_prep: 5170286808

The problem is that in mesa/libdrm

static inline void get_abs_timeout(struct drm_etnaviv_timespec *tv, uint64_=
t ns)
{
        struct timespec t;
        uint32_t s =3D ns / 1000000000;
        clock_gettime(CLOCK_MONOTONIC, &t);
        tv->tv_sec =3D t.tv_sec + s;
        tv->tv_nsec =3D t.tv_nsec + ns - (s * 1000000000);
                                        ^^^^^^^^^^^^^^^
   this overflows (since `s` is `uint_32t` and hence we substract a way
   too small value with ns =3D 5000000000 which mesa uses in
   etna_bo_cpu_prep.
}

So with current mesa/libdrm (which needs to be fixed) we'd have a maximum

      t.tv_nsec + ns         - (s_max * 1000000000)

      999999999 + 5000000000 - 705032704            =3D 5294967295

Does that make sense? If so that'd be the possible upper bound for the
kernel. Note that this only applies to etnaviv_ioctl_gem_cpu_prep. While
etnaviv_ioctl_wait_fence and etnaviv_ioctl_gem_wait are affected too
i've not yet seen user space passing in larger values.

Cheers,
 -- Guido

> =

> It could of course be something completely different. If this works corre=
ctly
> today, we may need to allow any 64-bit input for the nanoseconds and do
> an expensive 64-bit div/mod in the kernel for normalization rather than t=
he
> cheaper set_normalized_timespec64() from my patch.
> =

>         Arnd
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
