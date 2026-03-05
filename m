Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ88LklRqWkj4wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:47:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3B20EE1A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3856610EBE7;
	Thu,  5 Mar 2026 09:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="W4zuc5D5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421B10EBE7;
 Thu,  5 Mar 2026 09:47:49 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fRPpj3CQMz9tkb;
 Thu,  5 Mar 2026 10:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772704061; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgcI+DsjIo+X5y77Bh+h4cJr9LBB4NMoAn0ElwmoKvQ=;
 b=W4zuc5D5cNI3RCI35WR/DXP9IUv2XaX8Ab2O/HrMO0aOhvzuofrdP1DOb4/81attKHBMjP
 ZGLmUEApEDfn9P5whAkOTad7g5ZBUfe+70dcdHfNqRBDKtgCvVrMowQN9nGozZtGq18Uum
 qhgw3NuIXtb6/aGCA9T2KqILQGq8OjRmPCvuWRwoqlJmDwgVQkH6y9XswdIx1XQLtoo9IX
 FhTt+KEOdlfpKIBHkxlgdeZyU6hp09Owb7raxuU0dWoLN1ioT5uvOO4spOrSOCrq+c1/Db
 BvyI0uree9AALizyd3EWWxyzc/xZD4uI9C+Pn0ejQ751vcASx1C7Qs9Ky56krw==
Message-ID: <9949a2c27b2a1dc1cde10dbb89edec53411614b1.camel@mailbox.org>
Subject: Re: drm_sched run_job and scheduling latency
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Chia-I Wu
 <olvaffe@gmail.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, 
 intel-xe@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,  open list
 <linux-kernel@vger.kernel.org>, tj@kernel.org
Date: Thu, 05 Mar 2026 10:47:32 +0100
In-Reply-To: <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
 <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
 <aalIbgi71svPQs3Z@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: e63af98d95a1cb7dea4
X-MBO-RS-META: 9hoe9nn3g1rfjpzptturo9ewmq4u4aa1
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
X-Rspamd-Queue-Id: 2CA3B20EE1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, 2026-03-05 at 01:10 -0800, Matthew Brost wrote:
> On Thu, Mar 05, 2026 at 09:38:16AM +0100, Philipp Stanner wrote:
> > On Thu, 2026-03-05 at 09:27 +0100, Boris Brezillon wrote:
> >=20
> > >=20

[=E2=80=A6]

> > > Honestly, I'm not thrilled by this fast-path/call-run_job-directly id=
ea
> > > you're describing. There's just so many things we can forget that wou=
ld
> > > lead to races/ordering issues that will end up being hard to trigger =
and
> > > debug.
> > >=20
> >=20
> > +1
> >=20
> > I'm not thrilled either. More like the opposite of thrilled actually.
> >=20
> > Even if we could get that to work. This is more of a maintainability
> > issue.
> >=20
> > The scheduler is full of insane performance hacks for this or that
> > driver. Lockless accesses, a special lockless queue only used by that
> > one party in the kernel (a lockless queue which is nowadays, after N
> > reworks, being used with a lock. Ah well).
> >=20
>=20
> This is not relevant to this discussion=E2=80=94see below. In general, I =
agree
> that the lockless tricks in the scheduler are not great, nor is the fact
> that the scheduler became a dumping ground for driver-specific features.
> But again, that is not what we=E2=80=99re talking about here=E2=80=94see =
below.
>=20
> > In the past discussions Danilo and I made it clear that more major
> > features in _new_ patch series aimed at getting merged into drm/sched
> > must be preceded by cleanup work to address some of the scheduler's
> > major problems.
>=20
> Ah, we've moved to dictatorship quickly. Noted.

I prefer the term "benevolent presidency" /s

Or even better: s/dictatorship/accountability enforcement.

How does it come that everyone is here and ready so quickly when it
comes to new use cases and features, yet I never saw anyone except for
Tvrtko and Ma=C3=ADra investing even 15 minutes to write a simple patch to
address some of the *various* significant issues in that code base?

You were on CC on all discussions we've had here for the last years
afair, but I rarely saw you participate. And you know what it's like:
who doesn't speak up silently agrees in open source.

But tell me one thing, if you can be so kind:

What is your theory why drm/sched came to be in such horrible shape?
What circumstances, what human behavioral patterns have caused this?

The DRM subsystem has a bad reputation regarding stability among Linux
users, as far as I have sensed. How can we do better?

>=20
> >=20
>=20
> I can't say I agree with either of you here.
>=20
> In about an hour, I seemingly have a bypass path working in DRM sched +
> Xe, and my diff is:
>=20
> 108 insertions(+), 31 deletions(-)

LOC is a bad metric for complexity.

>=20
> About 40 lines of the insertions are kernel-doc, so I'm not buying that
> this is a maintenance issue or a major feature - it is literally a
> single new function.
>=20
> I understand a bypass path can create issues=E2=80=94for example, on cert=
ain
> queues in Xe I definitely can't use the bypass path, so Xe simply
> wouldn=E2=80=99t use it in those cases. This is the driver's choice to us=
e or
> not. If a driver doesn't know how to use the scheduler, well, that=E2=80=
=99s on
> the driver. Providing a simple, documented function as a fast path
> really isn't some crazy idea.

We're effectively talking about a deviation from the default submission
mechanism, and all that seems to be desired for a luxury feature.

Then you end up with two submission mechanisms, whose correctness in
the future relies on someone remembering what the background was, why
it was added, and what the rules are..

The current scheduler rules are / were often not even documented, and
sometimes even Christian took a few weeks to remember again why
something had been added =E2=80=93 and whether it can now be removed again =
or
not.

>=20
> The alternative=E2=80=94asking for RT workqueues or changing the design t=
o use
> kthread_worker=E2=80=94actually is.
>=20
> > That's especially true if it's features aimed at performance buffs.
> >=20
>=20
> With the above mindset, I'm actually very confused why this series [1]
> would even be considered as this order of magnitude greater in
> complexity than my suggestion here.
>=20
> Matt
>=20
> [1] https://patchwork.freedesktop.org/series/159025/=C2=A0

The discussions about Tvrtko's CFS series were precisely the point
where Danilo brought up that after this can be merged, future rework of
the scheduler must focus on addressing some of the pending fundamental
issues.

The background is that Tvrtko has worked on that series already for
well over a year, it actually simplifies some things in the sense of
removing unused code (obviously it's a complex series, no argument
about that), and we agreed on XDC that this can be merged. So this is a
question of fairness to the contributor.

But at one point you have to finally draw a line. No one will ever
address major scheduler issues unless we demand it. Even very
experienced devs usually prefer to hack around the central design
issues in their drivers instead of fixing the shared infrastructure.


P.
