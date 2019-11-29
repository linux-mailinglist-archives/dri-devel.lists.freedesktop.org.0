Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2910D34D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 10:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA086E899;
	Fri, 29 Nov 2019 09:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B106E89B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 09:34:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u18so13441539wmc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 01:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oViwe1aVVVLO/6jIe+XTpPVoiXQzTYCPXEQ2/XzYUMo=;
 b=Ke1OxzNTI6kHYVlyf0RIWGfaZGwlHRidPeMG5FKhIceRB6Eq1NwpkJUZpUd3oX9JsI
 TfDVp/Vjt7IuxAIFYCBvjwOg90aTrYsZEuNjlydOKz5YsmFh8HgeINkHzgGQszMwHHMZ
 UaLhOOh8BFzT/O7IyChl7nIfAKa5R6RxdOynAyZ34f6yK2fBGGS8HLaNaiASR/312fFp
 YsfehsFHsjjpRMeCmwNUvNWHPhXuS8LZau2sJ0Qx2mIvniEpcfVQTIifMHdAqt802xgE
 DGMtTfC5/KAHqJ0KP4dKDS4pGTk5IYjVAvWnM1o7QnzCgcbi7316WnjbobuQ/ox2qkrv
 52FQ==
X-Gm-Message-State: APjAAAUr415oVFpnTVOT+EWel0Gu3uVMNtHS+oOkuEsyR3Ob2djWilpO
 hcuZxHiV6Hgq5u60GB9n2c6lrdciSKI=
X-Google-Smtp-Source: APXvYqzDcxLt+mjYvuGnJvkCYjpqq9fZxIIoV6l3+hhWEfmXpE9DYqvGlfnFvmB8STHbYK2SG4zcXQ==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr1355322wml.74.1575020039664; 
 Fri, 29 Nov 2019 01:33:59 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id j12sm13206054wrw.54.2019.11.29.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 01:33:58 -0800 (PST)
Date: Fri, 29 Nov 2019 10:33:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Message-ID: <20191129093357.GA2770902@ulmo>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
 <20191128163623.GA2382107@ulmo> <2310325.iNVD75376c@kreacher>
MIME-Version: 1.0
In-Reply-To: <2310325.iNVD75376c@kreacher>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oViwe1aVVVLO/6jIe+XTpPVoiXQzTYCPXEQ2/XzYUMo=;
 b=YAr+zoezDdPvUxEQPIyk7HkGigkOevl3eXA/BhufZuM5fXvktQOo82ymtQjrUDPrYi
 +jpFZEb6exiD/ITNouoBL9QwBQHSb7eMGdEaNM5ykPn2pxetsK9EfHCEsH8Z2zPHgomT
 UihZy6eNa35VjFz0ySvV4Gs5KuSS4UPYbZmJVuWOGktp3y1K0q0SCqxVJ+Sk7pQ7HWP4
 GJODQ3yxxNbgdoMiX2BD0SKfaZbPT8WjxGnB1WrGKcWyGnA/1x8oTgewgCwHpl0NnoPR
 wSqiBSc2WJ8HfrpsFK+giGL+C5cpNyI+V/K7Q/2AVrOke+q03Fh350bM7pS4RZzmyzxe
 CsEg==
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: multipart/mixed; boundary="===============1545334149=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1545334149==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 11:03:57PM +0100, Rafael J. Wysocki wrote:
> On Thursday, November 28, 2019 5:50:26 PM CET Thierry Reding wrote:
> >=20
> > --0F1p//8PRICkK4MW
> > Content-Type: text/plain; charset=3Dus-ascii
> > Content-Disposition: inline
> > Content-Transfer-Encoding: quoted-printable
> >=20
> > On Thu, Nov 28, 2019 at 05:14:51PM +0100, Rafael J. Wysocki wrote:
> > > On Thu, Nov 28, 2019 at 5:03 PM Thierry Reding <thierry.reding@gmail.=
com>=3D
> >  wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Currently the driver PM core will automatically acquire a runtime PM
> > > > reference for devices before system sleep is entered. This is needed
> > > > to avoid potential issues related to devices' parents getting put to
> > > > runtime suspend at the wrong time and causing problems with their
> > > > children.
> > >=3D20
> > > Not only for that.
> > >=3D20
> > > > In some cases drivers are carefully written to avoid such issues and
> > > > the default behaviour can be changed to allow runtime PM to operate
> > > > regularly during system sleep.
> > >=3D20
> > > But this change breaks quite a few assumptions in the core too, so no,
> > > it can't be made.
> >=20
> > Anything in particular that I can look at? I'm not seeing any issues
> > when I test this, which could of course mean that I'm just getting
> > lucky.
>=20
> There are races and such that you may never hit during casual testing.
>=20
> > One thing that irritated me is that I think this used to work. I do
> > recall testing suspend/resume a few years ago and devices would get
> > properly runtime suspended/resumed.
>=20
> Not true at all.
>=20
> The PM core has always taken PM-runtime references on all devices pretty =
much
> since when PM-runtime was introduced.

You're right. I was finally able to find a toolchain that I could build
an old version of the kernel with. I tested system suspend/resume on the
v4.8 release, which is the first one that had the runtime PM changes as
well as the subsystem suspend/resume support wired up, and I can't see
the runtime PM callbacks invoked during system suspend/resume.

So I must be misremembering, or I'm confusing it with some other tests I
was running at the time.

> > I did some digging but couldn't
> > find anything that would have had an impact on this.
> >=20
> > Given that this is completely opt-in feature, why are you categorically
> > NAK'ing this?
>=20
> The general problem is that if any device has been touched by system-wide
> suspend code, it should not be subject to PM-runtime any more until the
> subsequent system-wide resume is able to undo whatever the suspend did.
>=20
> Moreover, if a device is runtime-suspended, the system-wide suspend code
> may mishandle it, in general.  That's why PM-runtime suspend is not allow=
ed
> during system-wide transitions at all.  And it has always been like that.

For this particular use-case the above should all be irrelevant. None of
the drivers involved here do anything special at system suspend, because
runtime suspend already puts the devices into the lowest possible power
state. Basically when these devices are put into runtime suspend, they
are completely turned off. The only exception is for things like HDMI
where the +5V pin remains powered, so that hotplug detection will work.

The runtime PM state of the devices involved is managed by the subsystem
system suspend/resume helpers in DRM/KMS. Basically those helpers turn
off all the devices in the composite device, which ultimately results in
their last runtime PM reference being released. So for system suspend
and resume, these devices aren't touched, other than maybe for the PM
core's internal book-keeping.

> For a specific platform you may be able to overcome these limitations if
> you are careful enough, but certainly they are there in general and surely
> you cannot prevent people from using your opt-in just because they think
> that they know what they are doing.

That's true. But the same thing is true for pretty much all other APIs.
People obviously have to make sure they know what they're doing, just
like they have to with any other API.

I suppose the documentation for this new function is currently lacking a
bit. Perhaps adding a big warning to this and listing the common
pitfalls would help people make the right call about whether or not they
can use this.

> > Is there some other alternative that I can look into?
>=20
> First of all, ensure that the dpm_list ordering is what it should be on t=
he
> system/platform in question.  That can be done with the help of device li=
nks.

I don't think we have device links for everything, but the deferred
probe code should take care of ordering the dpm_list correctly because
we do handle deferred probe properly in all cases.

Also, the dpm_list ordering isn't very critical in this case. If the
devices are allowed to runtime suspend during system sleep, the
subsystem sleep helper will put them into runtime suspend at the correct
time. This is propagated all the way through the display pipeline and
that order is ensured by the subsystem helpers.

> In addition, make sure that the devices needed to suspend other devices a=
re
> suspended in the noirq phase of system-wide suspend and resumed in the
> noirq phase of system-wide resume.  Or at least all of the other devices
> need to be suspended before them and resumed after them.

We're fine on this front as well. We have run into such issues in the
past, but I don't think there are any such issue left at the moment. I
do have one pending fix for I2C suspend/resume which fixes an issue
where some pinmuxing changes needed to get the HDMI DDC channel to work
were not getting applied during resume.

That I2C issue is related to this, I think. What I'm seeing is that when
the system goes to sleep, the pinmux looses its programming at a
hardware level, but the I2C driver doesn't know about it because it does
not get runtime suspended. At runtime suspend it would switch the pinmux
state to "idle" which would then match the system suspend state. Upon
runtime resume it sets the "default" pinmux state, which will then
restore the register programming.

In the current case where runtime suspend/resume is prohibited during
system sleep, upon resume the I2C driver will assume that the pinmux
state is still "default" and it won't reapply the state (it's actually
the pinmux subsystem that makes this decision) and causes HDMI DDC
transactions to time out.

One simple fix for that is to use pm_runtime_force_suspend() and
pm_runtime_force_resume() as system suspend/resume callbacks to make
sure the I2C controller is runtime suspended/resumed during system
sleep.

Note that forcing runtime suspend/resume this way is suboptimal in the
DRM/KMS case because the suspend/resume happens disconnected from the
subsystem suspend/resume callbacks, which is not desired as that breaks
some of the assumptions in those callbacks.

> These two things should allow you to cover the vast majority of cases if
> not all of them without messing up with the rules.

One alternative that I had thought about was to just ditch the runtime
PM callbacks for this. However, there's one corner case where this may
break. On early Tegra generations, the two display controllers are
"coupled" in that the second one doesn't work if the first one is
disabled. We describe that using a device link from the second to the
first controller. This causes the first controller to be automatically
be runtime resumed when the second controller is used. This only works
via runtime PM, so if I don't use runtime PM I'd have to add special
handling for that case.

Actually, there's another problem as well. Most of these devices use
generic PM domains to power on/off the SoC partitions that they're in.
If I side-step runtime PM, then I'd have to somehow find a way to
explicitly control the PM domains.

Another alternative would be to have a kind of hybrid approach where I
leave runtime PM calls in the drivers, but disconnect the runtime PM
callback implementations from that. That would at least fix the issue
with the generic PM domains.

However, it would not fix the problem with coupled display controllers
because empty runtime PM callbacks wouldn't actually power up the first
display controller when it is needed by the second controller. I would
have to add infrastructure that basically duplicates some of runtime PM
to fix that.

So the bottom line is that runtime PM is still the best solution for
this problem. It works really nice and is very consistent.

Do you think adding better documentation to this new flag and the
accessors would help remove your concerns about this?

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g5gEACgkQ3SOs138+
s6FDwhAAtBOKJf/YKNCWUbK79IS2Q/H416mKyuYDhsCvzeO82jt8vyuDQkCceLpT
JWiBSs1oOt0lYeCyPZzKbqW+8iGzww+IFqKcXMoQ/PBWphJnEVQGNonSkLsu41Af
RQUETPRQdx1GdDQc0aCpmcWSkvf2949dnDDfAZCbUpAVAfnK9dQpUTIu/g8Hqzte
llZsi0S33RJV3yruBgTYTzuYdnHOEbSPtp6hrgBLVMwTg/keZVN4LuKyPcfmmgS9
gnd1flMHNa/4yZ/Wa1purk9qiWb4zjoojSRdmSlDxWkiQfIL+yn1UKk3AQ8oXNi3
Ynic6Csw66rok2JnK9E6fYmBFEvLfoEyeIrjyGbhXL5k0v9eZJ2UrzWgfGTuzHhL
x3c99pPNSwEEGN6KpRR0K9MdOl/71HeNoAyDacbqDuEVMMGEFjq/OqRYbDlVLxQv
ItL9BuC5mwyZGErkQVHxCQTp1xDKuEpm7Id/EHTD9PkyyNcL8T0c4BMJHywQzy0Y
6kQzdPESrk5Mpn928s5SS6SPq9pZZs5pK/hfKJGTSc+Q4voaUQmi2s9/xZFUZtcS
/1V4xEaDmvL3UT/QKO+yrn7u0ktKBY6fvv2uJHa6l4kHpyybf1M27H7Kd/4WtgYh
/3PC8xzZff0vv1kRSGDV10ICCRY3+kftsRlcAShmgljatCqYnOI=
=CtFM
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--===============1545334149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1545334149==--
