Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE9ADB0B2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6329910E2D0;
	Mon, 16 Jun 2025 12:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q6Y9idkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64B10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 12:56:21 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bLVPG38zCz9sdG;
 Mon, 16 Jun 2025 14:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1750078578; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0McVc7X6YbwKGJstVkFtBBrm4Pgr9VGcIDoTIXEPD8=;
 b=q6Y9idkPzqdf1g5JQSD+kZLBywbaWRW1Ekcgjg6In5N0eCQXWBFWvzPFBUr6yeG9zbuZyg
 YxXeJkJht7K8b2n1Jtjx/NcnrRDTY6p448zlr64aEZKnYcn2Exlzvt1WVchdV+8ZFYE6ly
 QOgCxWBLjkFiz2RHqUe07D4Ed+FXDXSC+mGje31ma4obT1JQja1iBdcv52SNe89sEMnjhF
 R5/PeLFG86XduCOfDoxaCqjT+aFvHgYHmLAZ+cTO66bNjLaDGWmAyjdwbEmrUpVUlO2wvK
 I15mbJhw5J/CU5QY2di+cQT2mwTo/8+AgO7ptIlhHy/a168b4eQhPb6DPHPPpA==
Message-ID: <e7c3a8a33d00409935f4d43b40aa19c2c146e996.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Danilo Krummrich
 <dakr@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 14:56:13 +0200
In-Reply-To: <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com> <aE_8lDuMFFhJBeUY@pollux>
 <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 4q3k3hist7scuj7ju4oeyyef6cyo9etf
X-MBO-RS-ID: 05c311bc11569575a33
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

On Mon, 2025-06-16 at 09:49 -0300, Ma=C3=ADra Canal wrote:
> Hi Danilo,
>=20
> On 16/06/25 08:14, Danilo Krummrich wrote:
> > On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
> > > Code looks fine, but currently nothing is broken and I disagree
> > > with the
> > > goal that the _mock_^1 components should be role models. The idea
> > > is to
> > > implement as little in the mock components as it is required to
> > > exercise the
> > > tested functionality.
> >=20
> > No, please consider the following.
> >=20
> > =C2=A0=C2=A0 1) When we write tests for common infrastructure we should=
 be
> > testing things
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as close as possible to how we intend re=
al code to use this
> > infrastructure.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Relying on internals in creative ways is=
 likely to underrun
> > this testing.
>=20
> Regarding unit testing (and KUnit is a unit testing framework), the
> core
> principle is that individual components of the code should be tested
> in
> isolation to validate that they perform as expected.
>=20
> The "units" should be tested independently and we use those mocks to
> simulate dependencies, ensuring that the test focuses solely on the
> unit
> under scrutiny.
>=20
> If we introduce more things into the mock, we end up losing the
> isolation.

That depends on what those "things" are.

In the presented case, the unit tests are just as isolated as before.
The particular test case itself is not even modified and it will still
do exactly one thing: See if the job actually timed out as expected.

The added overhead in the mock component is merely the guarantee that
the fence gets signaled and that the job is removed from the mock
component's list at the appropriate place.

0 downside, documentation upside.

Each unit test still tests exactly 1 functionality.


> The mock scheduler, from what I understand, is not suppose to
> be a reference design or even something close to a driver.=C2=A0

We here in DRM define what it is supposed to be.

And since the scheduler has been infinitely abused and misused, at
least having one official, simple example "this is how you're supposed
to do it" is desirable, wouldn't you say so?


P.

>  It should
> remain just a mock, a minimal interface to test the scheduler's
> internals.
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > =C2=A0=C2=A0 2) Being close to a reference design is a good thing, why
> > wouldn't we want
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that? The reality is that people *will* =
look at this code for
> > reference.
> >=20
> > > Also, there are various ways drivers use the scheduler API.
> > > Trying to make
> > > the mock scheduler a reference driver implementation would only
> > > be able to
> > > make it a reference for one possible use.
> >=20
> > Why? Nothing prevents us from covering all of them eventually.
> >=20
> > If for now, we just implement one of them, that's better than none,
> > so why not?
>=20

