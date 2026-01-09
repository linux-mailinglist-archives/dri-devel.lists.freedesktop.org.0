Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83891D0ABA8
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30BD10E8DE;
	Fri,  9 Jan 2026 14:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OjxjMdDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68F310E8DE;
 Fri,  9 Jan 2026 14:48:15 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dnl4r2wLjz9sqF;
 Fri,  9 Jan 2026 15:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1767970092; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cOwueWwqzLGZhKMqnGgs7joEzCoE5Dn7xFXNpt8w5U=;
 b=OjxjMdDzCgDeRqfzmw3XEINJTYgPGQU+FYmqXiScrevoSKR+T+XLcpBjTiR/LpwnbYCsLH
 2UK0hiJXMNR4kfaooYM+pOpf65IKy/b2F80GDrYnBey2i8KDMn1eO63K7tJne8PDBTBjzO
 sdf96DVCOuGcsVONiCQ1eJ6JPpl+Rm9egUox9kDstzZgAT20Aocilh9PNfkzRafOGOgG0o
 GIb7PyDm3JMy1Mh1aDsMI8N6FnRAM/pIu4w+KAn5kFrcu/V4HzPYmYdM5nEE4q6MySBX3+
 zh/rILeSt+qcGfr0MvPUiycr3Cs+eAr9ZvGvDPnZJ+eh6AvCQaUSPmycqHh0eQ==
Message-ID: <a51103108eaa84134591c8321c6a70a484daed2b.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 09 Jan 2026 15:48:09 +0100
In-Reply-To: <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
 <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: cd1535eef2a43c0a2ac
X-MBO-RS-META: 48bqr63htzhb4gxux7foomqgnnjk5wjw
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

On Fri, 2026-01-09 at 14:06 +0000, Tvrtko Ursulin wrote:
> \
> On 07/01/2026 14:11, Philipp Stanner wrote:
> > Happy 2026, Tvrtko!
> >=20
> >=20

[=E2=80=A6]

> > Not to long ago we discussed that the spsc_queue should be removed and
> > replaced by some sort of list, with proper locks. Christian has agreed
> > that this should fly.
> >=20
> > The spsc queue has only 1 user in the kernel and it's super hard to
> > understand how it's supposed to work and when any why barriers and
> > READ_ONCE's are necessary (that's, of course, also not documented in
> > the queue).
> >=20
> > Until that is done I don't really want to touch any of those memory
> > barriers..
>=20
> (I had a branch with spsc gone more than a year ago but I abandoned it=
=20
> for now since it contained some other too ambitious changes. So no=20
> complaints from me. Who is doing it BTW?)

No one is working on it.

But I think the discussion has succeeded. The only objector was
Christian because he was worried about some cache-line performance
regression. I can't remember for sure, but I think Christian realized
that cache lines are not an issue (with a hlist?).

If you want to pick up removing SPSC-queue, be my guest, but make sure
to discuss it with Christian before investing too much of your time.

>=20
> Back to the point - this patch can wait, no problem. To explain the=20
> context though.
>=20
> I wanted to get rid of looking at the list_empty here because I have a=
=20
> branch which improves the flow for the 1:1 sched:entity drivers.
>=20
> Why are the two related? If you remember in the fair scheduler series
> all the run-queue stuff is nicely grouped in sched_rq.c and encapsulated=
=20
> in the rq API, which made it possible to follow up with virtualizing the=
=20
> rq operations.
>=20
> The yet another relevant thing is the patch I sent this week which=20
> removes the special case where entity can be initialized with no schedule=
rs.
>=20
> If we combined all these three pre-requisites, my branch allows the=20
> fully invariant sched:entity and 1:1:1 sched:rq:entity. Run-queue vfuncs=
=20

Hm, wouldn't the CFS series annihilate multiple RQs anyways? This
sounds as if there are several series' floating around, cleaning up
similar things.


P.
