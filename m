Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2416C8617A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 18:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA42710E55A;
	Tue, 25 Nov 2025 17:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711B110E55A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 17:02:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1vNwQa-0005JT-Up; Tue, 25 Nov 2025 18:02:08 +0100
Message-ID: <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Nov 2025 18:02:07 +0100
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
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Dienstag, dem 25.11.2025 um 15:26 +0100 schrieb Christian K=C3=B6nig:
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
>=20
> Something like 2 seconds default (which BTW is the default on Windows as =
well), which can be overridden on a global, per device, per queue name basi=
s.
>=20
> And 10 seconds maximum with only a warning that a not default timeout is =
used and everything above 10 seconds taints the kernel and should really on=
ly be used for testing/debugging.

The question really is what you want to do after you hit the (lowered)
timeout? Users get grumpy if you block things for 10 seconds, but they
get equally if not more grumpy when you kick out a valid workload that
just happens to need a lot of GPU time.

Fences are only defined to signal eventually, with no real concept of a
timeout. IMO all timeouts waiting for fences should be long enough to
only be considered last resort. You may want to give the user some
indication of a failed fence wait instead of stalling indefinitely, but
you really only want to do this after a quite long timeout, not in a
sense of "Sorry, I ran out of patience after 2 seconds".

Sure memory management depends on fences making forward progress, but
mm also depends on scheduled writeback making forward progress. You
don't kick out writeback requests after an arbitrary timeout just
because the backing storage happens to be loaded heavily.

This BTW is also why etnaviv has always had a quite short timeout of
500ms, with the option to extend the timeout when the GPU is still
making progress. We don't ever want to shoot down valid workloads (we
have some that need a few seconds to upload textures, etc on our wimpy
GPU), but you also don't want to wait multiple seconds until you detect
a real GPU hang.
So we use the short scheduler timeout to check in on the GPU and see if
it is still making progress (for graphics workloads by looking at the
frontend position within the command buffer and current primitive ID).
If we can deduce that the GPU is stuck we do the usual reset/recovery
dance within a reasonable reaction time, acceptable to users hitting a
real GPU hang. But if the GPU is making progress we will give an
infinite number of timeout extensions with no global timeout at all,
only fulfilling the eventual signaling guarantee of the fence.

Regards,
Lucas
