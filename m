Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFFC89CCD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A303E10E5C0;
	Wed, 26 Nov 2025 12:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UTsTz0LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6247010E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:37:29 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dGfGG15tlz9sxb;
 Wed, 26 Nov 2025 13:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764160646; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTqvEmDLXDWaVJsy42dF2/13XtKO/BqCr4Q3wJ/2+zk=;
 b=UTsTz0LB3fPPb1pdo0H+ZA2PtJmWwrixoKEk4LQLRGjjib7ugHXCNcywF2px2sJ2wStBu4
 iJbUCEIaBCYXvD/QeZKzjpIHvGWvDCkY+83LOu2V1Ilq6fqAYqW2JCttj8Jf/NlGxzRkfr
 32HDGc0VyCIvdz/Uldhme7bN7S4qBnPn3Sz98ZkmG8L+dRr3QZA4qw3GuOUA2CIS0CBJlH
 Oc/3Iin171AmfePQJ9Gz/yFbGFwhBiibDW381Wy92iPafOTiEO/gdlFDXFIMU2h6cM36u3
 qvS2U3/L3DvInWM9Dfk9DcCi0xr0IOvK2ZZLigzfYk7rzQiQKd6kY/esoenc0A==
Message-ID: <54d6e863fc606d22f245e30012bb5120d5bee7ee.camel@mailbox.org>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lucas
 Stach <l.stach@pengutronix.de>, phasta@kernel.org, alexdeucher@gmail.com, 
 simona.vetter@ffwll.ch, faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Wed, 26 Nov 2025 13:37:19 +0100
In-Reply-To: <207d50fe-eef3-4baa-97a7-567598e56b55@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
 <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
 <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
 <207d50fe-eef3-4baa-97a7-567598e56b55@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5b026a59b27b9369507
X-MBO-RS-META: 1wt699yqo3ojb57bdc5grummqbbk5w5w
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

On Wed, 2025-11-26 at 13:31 +0100, Christian K=C3=B6nig wrote:
> On 11/25/25 18:02, Lucas Stach wrote:
> > > > I agree that distinguishing the use case that way is not ideal.
> > > > However, who has the knowledge of how the hardware is being used by
> > > > customers / users, if not the driver?
> > >=20
> > > Well the end user.
> > >=20
> > > Maybe we should move the whole timeout topic into the DRM layer or th=
e scheduler component.
> > >=20
> > > Something like 2 seconds default (which BTW is the default on Windows=
 as well), which can be overridden on a global, per device, per queue name =
basis.
> > >=20
> > > And 10 seconds maximum with only a warning that a not default timeout=
 is used and everything above 10 seconds taints the kernel and should reall=
y only be used for testing/debugging.
> >=20
> > The question really is what you want to do after you hit the (lowered)
> > timeout? Users get grumpy if you block things for 10 seconds, but they
> > get equally if not more grumpy when you kick out a valid workload that
> > just happens to need a lot of GPU time.
>=20
> Yeah, exactly that summarizes the problem pretty well.
>=20
> > Fences are only defined to signal eventually, with no real concept of a
> > timeout. IMO all timeouts waiting for fences should be long enough to
> > only be considered last resort. You may want to give the user some
> > indication of a failed fence wait instead of stalling indefinitely, but
> > you really only want to do this after a quite long timeout, not in a
> > sense of "Sorry, I ran out of patience after 2 seconds".
> >=20
> > Sure memory management depends on fences making forward progress, but
> > mm also depends on scheduled writeback making forward progress. You
> > don't kick out writeback requests after an arbitrary timeout just
> > because the backing storage happens to be loaded heavily.
> >=20
> > This BTW is also why etnaviv has always had a quite short timeout of
> > 500ms, with the option to extend the timeout when the GPU is still
> > making progress. We don't ever want to shoot down valid workloads (we
> > have some that need a few seconds to upload textures, etc on our wimpy
> > GPU), but you also don't want to wait multiple seconds until you detect
> > a real GPU hang.
>=20
> That is a really good point. We considered that as well, but then abandon=
ed the idea, see below for the background.
>=20
> What we could also do is setting a flag on the fence when a process is ki=
lled and then waiting for that fence to signal so that it can clean up. Goi=
ng to prototype that.
>=20
> > So we use the short scheduler timeout to check in on the GPU and see if
> > it is still making progress (for graphics workloads by looking at the
> > frontend position within the command buffer and current primitive ID).
> > If we can deduce that the GPU is stuck we do the usual reset/recovery
> > dance within a reasonable reaction time, acceptable to users hitting a
> > real GPU hang. But if the GPU is making progress we will give an
> > infinite number of timeout extensions with no global timeout at all,
> > only fulfilling the eventual signaling guarantee of the fence.
>=20
> Well the question is how do you detect *reliable* that there is still for=
ward progress?

My understanding is that that's impossible since the internals of
command submissions are only really understood by userspace, who
submits them.

I think the long-term solution can only be fully fledged GPU scheduling
with preemption. That's why we don't need such a timeout mechanism for
userspace processes: the scheduler simply interrupts and lets someone
else run.

My hope would be that in the mid-term future we'd get firmware rings
that can be preempted through a firmware call for all major hardware.
Then a huge share of our problems would disappear.


With the current situation, IDK either. My impression so far is that
letting the drivers and driver programmers decide is the least bad
choice.


P.
