Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEBC85DBE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 17:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A41510E445;
	Tue, 25 Nov 2025 16:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KI3zLOWv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BaAIK6VN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2983610E43A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:03:40 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dG6td0nK0z9sp0;
 Tue, 25 Nov 2025 17:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764086617; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuWwgUjth81uOhn7rCZx8VvaOoeSO1XhSQIqEV3fd5Y=;
 b=KI3zLOWvJMl4nT+ITStoohjRWUAvDjEsLS3AhlVTkg8uADH5eqmSNZKO6f9gDnOkL1VIAz
 YsehdpHtEQZicVvZflMoKxpfR03Q7colEa5NmEmI25Lx+QPCqhL+aApLk2VPmg2zAZxNQB
 WNX1Co/cpMgY+k6XQdIo4Z6j0TjyQwnR0ne3iHn33b/XwU3piG4CyJw2lLCJYHRlJPt5nh
 lasXadTgEbR6g1/QJ5S68jDdn/PZyuLoeAYy7qV8COdTZ/jUcszHToCU70ULBWHxavxoIi
 SkKdz3Bbw9Rf7SNLWn+bOJDkiqwY5a5GLtVmulPvfHR3YA2YQ8bY7zJzrQAAQg==
Message-ID: <fe25a7fe229c0a150c54a80dd83ac83fc0daa3af.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764086613; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuWwgUjth81uOhn7rCZx8VvaOoeSO1XhSQIqEV3fd5Y=;
 b=BaAIK6VNean2TBqarCzND1ApOOx4AOsOH45FoozocDO7vKx08VtSvgz8gG1Ww1fPCiO001
 07ay3WAWRl57IPzYpgzAzJ2YnkmOE6tqj6GOoWZG7EgbBxm+PY6EWC/3t1aZfHPTx4hMVC
 JyWUuTzeZfH0o3oTUa0TdD18QoPwvrIGHaIOzYERjm3758rB5MMufwWwpkqWSND4cpfbLK
 qnuzP5CnoO3ii6FS0jcHq+oPVQzBsqMXG+Qrvu6smFdYDRodPm+2izA9jmlp1QUbmNItl3
 G4rSd2r6/WFo6NyECpLdypSANB7O/xA2/nnX4plIkgjQahnPSu85Hx6EVakqHg==
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org, Michel
 =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Date: Tue, 25 Nov 2025 17:03:29 +0100
In-Reply-To: <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
 <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: xobz763nh974ckm85ey379t35kmq378h
X-MBO-RS-ID: cc866405691828f7a82
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc Michel

On Tue, 2025-11-25 at 15:26 +0100, Christian K=C3=B6nig wrote:
> On 11/25/25 11:56, Philipp Stanner wrote:
> > > > >=20
> > > > > The GPU scheduler has a very similar define, MAX_WAIT_SCHED_ENTIT=
Y_Q_EMPTY which is currently just 1 second.
> > > > >=20
> > > > > The real question is what is the maximum amount of time we can wa=
it for the HW before we should trigger a timeout?
> > > >=20
> > > > That's a question only the drivers can answer, which is why I like =
to
> > > > think that setting global constants constraining all parties is not=
 the
> > > > right thing to do.
> > >=20
> > > Exactly that's the reason why I bring that up. I think that drivers s=
hould be in charge of timeouts is the wrong approach.
> > >=20
> > > See the reason why we have the timeout (and documented that it is a m=
ust have) is because we have both core memory management as well a desktop =
responsiveness depend on it.
> >=20
> > Good and well, but then patch 4 becomes even more problematic:
> >=20
> > So we'd just have drivers fire warnings, and then they would still have
> > the freedom to set timeouts for drm/sched, as long as those timeouts
> > are smaller than your new global constant.
> >=20
> > Why then not remove drm/sched's timeout parameter API completely and
> > always use your maximum value internally in drm/sched? Or maybe
> > truncate it with a warning?
>=20
> I have considered that as well, but then thought that we should at least =
give end users the possibility to override the timeout while still tainting=
 the kernel so that we know about this in bug reports, core dumps etc...
>=20
> > "Maximum timeout parameter exceeded, truncating to %ld.\n"
> >=20
> > I suppose some drivers want even higher responsiveness than those 2
> > seconds.
>=20
> As far as I know some medical use cases for example have timeouts like 10=
0-200ms. But again that is the use case and not the driver.
>=20
> > I do believe that more of the driver folks should be made aware of this
> > intended change.
>=20
> I have no real intention of actually pushing those patches, at least not =
as they are. I just wanted to kick of some discussion.

Can you then please use --rfc when creating such patches in the future?
That way you won't cause my heart rate to increase, searching for
immediate danger :D

>=20
> > >=20
> > > > What is even your motivation? What problem does this solve? Is the =
OOM
> > > > killer currently hanging for anyone? Can you link a bug report?
> > >=20
> > > I'm not sure if we have an external bug report (we have an internal o=
ne), but for amdgpu there were customer complains that 10 seconds is to lon=
g.
> > >=20
> > > So we changed it to 2 seconds for amdgpu, and now there are complains=
 from internal AMD teams that 2 seconds is to short.
> > >=20
> > > While working on that I realized that the timeout is actually not dri=
ver dependent at all.
> > >=20
> > > What can maybe argued is that a desktop system should have a shorter =
timeout than some server, but that one driver needs a different timeout tha=
n another driver doesn't really makes sense to me.
> > >=20
> > > I mean what is actually HW dependent on the requirement that I need a=
 responsive desktop system?
> >=20
> > I suppose some drivers are indeed only used for server hardware. And
> > for compute you might not care about responsiveness as long as your
> > result drops off at some point. But there's cloud gaming, too..
>=20
> Good point with the cloud gaming.
>=20
> > I agree that distinguishing the use case that way is not ideal.
> > However, who has the knowledge of how the hardware is being used by
> > customers / users, if not the driver?
>=20
> Well the end user.
>=20
> Maybe we should move the whole timeout topic into the DRM layer or the sc=
heduler component.

Who's the "user"? The entire system? One process sitting on top of its
ioctl and file descriptor?

That question plays into answering how and where timeouts should be
configured.


One might ask himself if then a kernel parameter would be the right way
to configure it. I'm not very experienced with the desires of
userspace.

I sumond Michel D=C3=A4nzer to share his wisdom!


>=20
> Something like 2 seconds default (which BTW is the default on Windows as =
well), which can be overridden on a global, per device, per queue name basi=
s.

I mean, the drivers can already set it per device. It seems to me that
what you actually want is finer control?

For Nouveau with its firmware scheduler having a timeout at all just
doesn't make much sense anywayys.

 * If a fw ring hangs, it hangs, and a shorter timeout will just have
   your app crash sooner.
 * If it's laggy and slow, it's laggy and slow, but with a high timeout
   at least still usable.
 * And if it's compute and slow, you at least get your results at some
   point.

But having a lower timeout wouldn't really repair anything, or am I
mistaken?

>=20
> And 10 seconds maximum with only a warning that a not default timeout is =
used and everything above 10 seconds taints the kernel and should really on=
ly be used for testing/debugging.
>=20
> Thoughts?


The most important thing for me regarding your RFC is that we don't add
shiny warnings by declaring driver behavior invalid that was
operational for years.

The most conservative way would be to send patches to the respective
drivers, setting their timeouts to the new desired defaults, and then
adding warnings so that future drivers become aware.


P.
