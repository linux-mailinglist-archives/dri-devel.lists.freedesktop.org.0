Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BECB10D518
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 12:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6666E8E3;
	Fri, 29 Nov 2019 11:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E3C6E8E3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 11:44:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so8817816wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 03:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1ybZKIU+kA2575KMw1e+4ZB3gUgyWTrws2IIF76aQJ4=;
 b=uN31uk5MpfKWdIPJzmqkCPddRdCD21CDdDJpryA6zprix1yD2DXkQ6Vx73xkbjR3VC
 rlhJDYNWPUfkPRd1s07eNIRUPqN47MKSltaS5i6dJfQ/pqy/utyrkWSlb6kxzrd90iqT
 Bi9qdf+CARdwSCWpwme199Ggy9RNNeU4X7OyrnIvyryC6ZEm/TmNjiqtf6wB4VZgAAhW
 ycPBYfG5jo3kURNaBhwtzBBYc67KxQQKlaYjKlVN1+2kf2dN0qZrZzgaFO1Ifr14nCuJ
 +nNa/S+pQvPmWXDle99k39VHGFjWLju44k6zKaIkl8gvFp3Cgcf45dVdVsdWq0bqD9Vw
 s/aA==
X-Gm-Message-State: APjAAAXFp5WhfpQKn+iH2Jea7eu4zBsT4hfKv0EkVj6gSurON5vwGl0O
 yCzb0Qc6oMjKrxF4p0KrD60=
X-Google-Smtp-Source: APXvYqxxa0WxYcomALpGJtrOVhMwIslBR5TlVRiThe2qGMw/ITix+05FIwf29ulXX7aEaZUX8Br4kQ==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr14574401wmd.176.1575027894743; 
 Fri, 29 Nov 2019 03:44:54 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id d20sm28179936wra.4.2019.11.29.03.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 03:44:53 -0800 (PST)
Date: Fri, 29 Nov 2019 12:44:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Message-ID: <20191129114451.GE2771912@ulmo>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
 <20191128163623.GA2382107@ulmo> <2310325.iNVD75376c@kreacher>
 <20191129093357.GA2770902@ulmo>
 <CAJZ5v0j56xrmiO6bvs3W-_pY0HjGhSUEbZYzjZHfm6gA-k605g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0j56xrmiO6bvs3W-_pY0HjGhSUEbZYzjZHfm6gA-k605g@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1ybZKIU+kA2575KMw1e+4ZB3gUgyWTrws2IIF76aQJ4=;
 b=hDrvPSuN7tCuqIX23Duc9KJ9cMRRcIWMVzHhJFkJ39cvKqIHZe6x9j7Czt2Fm5ufoZ
 caadreCP7d05/ouuL+KktUohs2LOBEBFqU+GcniISpfzaenT3Sc7J/IV4x70L7ASlqRA
 NCStNy/QBX8WmjaKp45qPLi6Irsh606Gx4Pe30nsoazkvM3xDMO6S0EISFr8BDVXGa9k
 ciwsVUQKLsLDqogIo/XCDw0NMZ/dMVpD47XLI2p0+CVnHoomxG95MqiU6o/a0gBIIOIU
 6QKq9qrnmIKIcRqFtOhiCyUmRSpx2EKHbS4BiM47AIIu656cRXdj3wbNKzkCtvj0BAeL
 Wf7g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============1954636364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1954636364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 11:09:26AM +0100, Rafael J. Wysocki wrote:
> On Fri, Nov 29, 2019 at 10:34 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Thu, Nov 28, 2019 at 11:03:57PM +0100, Rafael J. Wysocki wrote:
> > > On Thursday, November 28, 2019 5:50:26 PM CET Thierry Reding wrote:
> > > >
> > > > --0F1p//8PRICkK4MW
> > > > Content-Type: text/plain; charset=3Dus-ascii
> > > > Content-Disposition: inline
> > > > Content-Transfer-Encoding: quoted-printable
> > > >
> > > > On Thu, Nov 28, 2019 at 05:14:51PM +0100, Rafael J. Wysocki wrote:
> > > > > On Thu, Nov 28, 2019 at 5:03 PM Thierry Reding <thierry.reding@gm=
ail.com>=3D
> > > >  wrote:
> > > > > >
> > > > > > From: Thierry Reding <treding@nvidia.com>
> > > > > >
> > > > > > Currently the driver PM core will automatically acquire a runti=
me PM
> > > > > > reference for devices before system sleep is entered. This is n=
eeded
> > > > > > to avoid potential issues related to devices' parents getting p=
ut to
> > > > > > runtime suspend at the wrong time and causing problems with the=
ir
> > > > > > children.
> > > > >=3D20
> > > > > Not only for that.
> > > > >=3D20
> > > > > > In some cases drivers are carefully written to avoid such issue=
s and
> > > > > > the default behaviour can be changed to allow runtime PM to ope=
rate
> > > > > > regularly during system sleep.
> > > > >=3D20
> > > > > But this change breaks quite a few assumptions in the core too, s=
o no,
> > > > > it can't be made.
> > > >
> > > > Anything in particular that I can look at? I'm not seeing any issues
> > > > when I test this, which could of course mean that I'm just getting
> > > > lucky.
> > >
> > > There are races and such that you may never hit during casual testing.
> > >
> > > > One thing that irritated me is that I think this used to work. I do
> > > > recall testing suspend/resume a few years ago and devices would get
> > > > properly runtime suspended/resumed.
> > >
> > > Not true at all.
> > >
> > > The PM core has always taken PM-runtime references on all devices pre=
tty much
> > > since when PM-runtime was introduced.
> >
> > You're right. I was finally able to find a toolchain that I could build
> > an old version of the kernel with. I tested system suspend/resume on the
> > v4.8 release, which is the first one that had the runtime PM changes as
> > well as the subsystem suspend/resume support wired up, and I can't see
> > the runtime PM callbacks invoked during system suspend/resume.
> >
> > So I must be misremembering, or I'm confusing it with some other tests I
> > was running at the time.
> >
> > > > I did some digging but couldn't
> > > > find anything that would have had an impact on this.
> > > >
> > > > Given that this is completely opt-in feature, why are you categoric=
ally
> > > > NAK'ing this?
> > >
> > > The general problem is that if any device has been touched by system-=
wide
> > > suspend code, it should not be subject to PM-runtime any more until t=
he
> > > subsequent system-wide resume is able to undo whatever the suspend di=
d.
> > >
> > > Moreover, if a device is runtime-suspended, the system-wide suspend c=
ode
> > > may mishandle it, in general.  That's why PM-runtime suspend is not a=
llowed
> > > during system-wide transitions at all.  And it has always been like t=
hat.
> >
> > For this particular use-case the above should all be irrelevant. None of
> > the drivers involved here do anything special at system suspend, because
> > runtime suspend already puts the devices into the lowest possible power
> > state. Basically when these devices are put into runtime suspend, they
> > are completely turned off. The only exception is for things like HDMI
> > where the +5V pin remains powered, so that hotplug detection will work.
> >
> > The runtime PM state of the devices involved is managed by the subsystem
> > system suspend/resume helpers in DRM/KMS. Basically those helpers turn
> > off all the devices in the composite device, which ultimately results in
> > their last runtime PM reference being released. So for system suspend
> > and resume, these devices aren't touched, other than maybe for the PM
> > core's internal book-keeping.
>=20
> OK, so you actually want system-wide PM to work like PM-runtime on the
> platform in question, but there are substantial differences.

That's not exactly what I'm trying to do here. If this was all I wanted
to do I could simply use UNIVERSAL_DEV_PM_OPS.

What I want to do is basically allow the system-wide PM of the subsystem
to control the runtime PM of the devices involved.

> First, PM-runtime suspend can be effectively disabled by user space
> and system-wide suspend is always expected to work.
>=20
> Second, if system wakeup devices are involved, their handling during
> system-wide suspend depends on the return value of device_may_wakeup()
> which depends on what user space does, whereas PM-runtime assumes
> device wakeup to be always enabled.
>=20
> > > For a specific platform you may be able to overcome these limitations=
 if
> > > you are careful enough, but certainly they are there in general and s=
urely
> > > you cannot prevent people from using your opt-in just because they th=
ink
> > > that they know what they are doing.
> >
> > That's true. But the same thing is true for pretty much all other APIs.
> > People obviously have to make sure they know what they're doing, just
> > like they have to with any other API.
> >
> > I suppose the documentation for this new function is currently lacking a
> > bit. Perhaps adding a big warning to this and listing the common
> > pitfalls would help people make the right call about whether or not they
> > can use this.
>=20
> And then *somebody* would have to chase a ton of subtle issues
> resulting from that.  No, thanks, but no thanks.

If the kerneldoc makes it clear that they're only supposed to use this
when they exactly know that it's safe to do, I don't think anybody is
going to put the blame on you to fix their bugs. If using this breaks,
it's clearly wrong to use it.

> > > > Is there some other alternative that I can look into?
> > >
> > > First of all, ensure that the dpm_list ordering is what it should be =
on the
> > > system/platform in question.  That can be done with the help of devic=
e links.
> >
> > I don't think we have device links for everything, but the deferred
> > probe code should take care of ordering the dpm_list correctly because
> > we do handle deferred probe properly in all cases.
> >
> > Also, the dpm_list ordering isn't very critical in this case. If the
> > devices are allowed to runtime suspend during system sleep, the
> > subsystem sleep helper will put them into runtime suspend at the correct
> > time. This is propagated all the way through the display pipeline and
> > that order is ensured by the subsystem helpers.
>=20
> You are still not saying what happens if user space doesn't allow
> PM-runtime to suspend the devices (by writing "on" to their "control"
> files).

I was suggesting that we prohibit that, which you clearly didn't like.
You didn't give any reasons for why you think this is a bad idea, but
the alternative would be to implement some driver-specific equivalent of
that.

At that point, does it really matter whether the user is prevented from
prohibiting suspend via runtime PM or some non-standard mechanism with a
different name but equivalent functionality?

The fact is that in order to properly use the device we need to be able
to suspend it. We need to do this to switch video modes anyway. There's
simply no way to make the display work reliably without it going into
suspend and resuming. Whether we call this runtime suspend/resume or
something driver-specific is really just an implementation detail. The
consequences for userspace are exactly the same.

So if you think that allowing userspace to prohibit runtime suspend is
imperative always, then I don't have much choice but to do it without
runtime PM.

> > > In addition, make sure that the devices needed to suspend other devic=
es are
> > > suspended in the noirq phase of system-wide suspend and resumed in the
> > > noirq phase of system-wide resume.  Or at least all of the other devi=
ces
> > > need to be suspended before them and resumed after them.
> >
> > We're fine on this front as well. We have run into such issues in the
> > past, but I don't think there are any such issue left at the moment. I
> > do have one pending fix for I2C suspend/resume which fixes an issue
> > where some pinmuxing changes needed to get the HDMI DDC channel to work
> > were not getting applied during resume.
> >
> > That I2C issue is related to this, I think. What I'm seeing is that when
> > the system goes to sleep, the pinmux looses its programming at a
> > hardware level, but the I2C driver doesn't know about it because it does
> > not get runtime suspended.
>=20
> Well, no, that's not the reason.  The real reason is that the handling
> of that device during system-wide suspend does not follow the rules
> followed by PM-runtime for it.
>=20
> Switching system-wide PM over to PM-runtime to address that is not
> going to work, because PM-runtime is not mandatory and system-wide PM
> is.
>=20
> > At runtime suspend it would switch the pinmux
> > state to "idle" which would then match the system suspend state. Upon
> > runtime resume it sets the "default" pinmux state, which will then
> > restore the register programming.
>=20
> So this logic needs to be implemented in the system-wide suspend flow as =
well.

I suppose one other alternative would be to use universal PM ops for
this case. In this case we actually do want the same behaviour at system
sleep than we do for runtime PM.

> > In the current case where runtime suspend/resume is prohibited during
>=20
> Runtime suspend is, runtime resume isn't until the "late" suspend phase.
>=20
> > system sleep, upon resume the I2C driver will assume that the pinmux
> > state is still "default" and it won't reapply the state (it's actually
> > the pinmux subsystem that makes this decision) and causes HDMI DDC
> > transactions to time out.
>=20
> So this is a bug in the system-wide suspend/resume flow that needs to
> be addressed, but not by switching it over to PM-runtime.
>=20
> > One simple fix for that is to use pm_runtime_force_suspend() and
> > pm_runtime_force_resume() as system suspend/resume callbacks to make
> > sure the I2C controller is runtime suspended/resumed during system
> > sleep.
> >
> > Note that forcing runtime suspend/resume this way is suboptimal in the
> > DRM/KMS case because the suspend/resume happens disconnected from the
> > subsystem suspend/resume callbacks, which is not desired as that breaks
> > some of the assumptions in those callbacks.
>=20
> So there needs to be another way.
>=20
> Have you looked at DPM_FLAG_SMART_SUSPEND?

I'll look at that. It seems like it could do the trick for the I2C
problem I'm seeing.

Generally, though, what I keep noticing here is that for many devices
there is some commonality between runtime PM and system sleep. Actually
for some devices they are exactly the same, which I guess is one of the
reasons why I had hoped we could somehow simplify things by having
runtime PM on one hand and then if system sleep doesn't need anything
other than what runtime PM already does, we could just do runtime PM all
the time. That way we could avoid all the duplication. I guess that's
mostly what universal PM ops are about. I'm not exactly sure how that
would work during system resume, though. Would the PM core not invoke
the same callback twice, once for system resume and then again (after
allowing runtime PM again) for resume runtime?

> > > These two things should allow you to cover the vast majority of cases=
 if
> > > not all of them without messing up with the rules.
> >
> > One alternative that I had thought about was to just ditch the runtime
> > PM callbacks for this. However, there's one corner case where this may
> > break. On early Tegra generations, the two display controllers are
> > "coupled" in that the second one doesn't work if the first one is
> > disabled. We describe that using a device link from the second to the
> > first controller. This causes the first controller to be automatically
> > be runtime resumed when the second controller is used. This only works
> > via runtime PM, so if I don't use runtime PM I'd have to add special
> > handling for that case.
>=20
> Runtime resume during system-wide suspend and resume is basically fine
> unless you try to do it in the "late" suspend phase or later, but that
> limitation is kind of artificial.  [I was talking about that at the
> LPC this year.]  It basically cannot be carried out in the part of
> system-wide suspend after the core regards the device and its parent
> etc as "suspended", but the definition of that may be adjusted IMO.
>=20
> And using PM-runtime resume during system-wide resume may be fine too,
> basically (as long as the ordering of that is not lead to any kind of
> loop dependencies).
>=20
> On the other hand, there is *zero* need for runtime suspend during
> system-wide transitions and it is known problematic.

I don't quite understand this. I don't see a need to runtime resume
during suspend, because you're actually trying to suspend devices. Most
of the time at least. I get that in some cases you may need to resume
devices in order to help put other devices (that depend on them) into
suspend, but most of the time the goal is to set devices into some low
power state so that when the system is asleep you consume less power
than in the active state. This is more or less the same thing that you
want with runtime PM as well, isn't it?

So why do you say that there's no need for runtime suspend during system
suspend? I always figured that runtime suspend was sort of a soft system
suspend in that system suspend may be more aggressive, and mostly a
superset of runtime suspend. So in pseudocode it would be roughly:

	runtime_suspend(device)
	{
		set_low_power_mode(device);
	}

	system_suspend(device)
	{
		save_context(device);
		runtime_suspend(device);
		power_off(device);
	}

And for resume you could basically just call these in reverse order:

	runtime_resume(device)
	{
		set_normal_mode(device);
	}

	system_resume(device)
	{
		power_on(device);
		runtime_resume(device);
		restore_context(device);
	}

I understand that this may not be true for all devices. However, in some
cases we may even want to go further and do at runtime_suspend() what
we do in system_suspend() because the impact may be low enough and the
power savings worth it.

> > Actually, there's another problem as well. Most of these devices use
> > generic PM domains to power on/off the SoC partitions that they're in.
> > If I side-step runtime PM, then I'd have to somehow find a way to
> > explicitly control the PM domains.
>=20
> That's a problem with genpd, I'd say.

Fair enough. So far we've tried to implement things such that they work
within the existing infrastructure, but if runtime PM turns out not to
be what we actually need, maybe we need to just move to something
different.

> > Another alternative would be to have a kind of hybrid approach where I
> > leave runtime PM calls in the drivers, but disconnect the runtime PM
> > callback implementations from that. That would at least fix the issue
> > with the generic PM domains.
> >
> > However, it would not fix the problem with coupled display controllers
> > because empty runtime PM callbacks wouldn't actually power up the first
> > display controller when it is needed by the second controller. I would
> > have to add infrastructure that basically duplicates some of runtime PM
> > to fix that.
> >
> > So the bottom line is that runtime PM is still the best solution for
> > this problem. It works really nice and is very consistent.
> >
> > Do you think adding better documentation to this new flag and the
> > accessors would help remove your concerns about this?
>=20
> No, it wouldn't.
>=20
> Also your arguments are mostly about PM-runtime resume, which is a
> different story.

What makes you say that? I'm equally concerned about runtime suspend
because runtime resume alone is not good enough to resume a device that
was never suspended. Runtime suspend will typically assert a reset for
these devices and runtime resume will then deassert the reset. This is
necessary to get the devices into a proper working state.

Thierry

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3hBLEACgkQ3SOs138+
s6FSMxAAvYOyopKcvC3xHOb8GesxTxwkRbVSfuwfgRXLX07KiiGswVaHmt9Fv6L1
UCIO0E9NLM4IAWQCVvjefZUj5/2SZvLgsC5anKVfZ6ZueSoGrkOLxBdR0195eIJd
6LptsqkQ8jH3fMsn/8q/EmreKJiGRI0ME/BeEVIkfrtTFaSkynr9RncvLGele4EW
SJWYQqT9feOpqHsO8gQdGcjB5Zh2JFOgeAfNa0WFM96isqoOnqLRQeriLNCyzJJt
mP0IBLSoRiaBJOG91dGtrZGMWta/Z5JWtXcbF7CGgIwdTIUEemYOAWau/0bD3+2O
sYbugWIy7XpbRSm7zcaqv5LiA2eFiQL6PE5XXVl8wi4L00Ft+qksI9HqxcJPwZou
nRt4a39GChDwUAzH8yA4CtiyHH4EPnyOVRj7ejikxffhC2dfN+he/dQcxtQwUMnW
gEoONIGeO+53VUUBil4nr7RldZECDK8vATHjlj4e7Uvlkj7lvKGM0z49sdSK/Ln5
MKiHyPvWLqDrQ/xJWcUC/WdQTClkRZ/dwPTn2+Mix+/FWaVDF4jsT+CKA5+p2bc4
MqK92SJPjqL4VzzwK1fNmchdaWRlXjlc1Bh1j6nwl6juVA93M+H1QcqI5zonllR+
b3HwkOqr95QHao40L63KkOW23MX7isUOX3mt+s3gIhI1hyoWi8E=
=ywG1
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--

--===============1954636364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1954636364==--
