Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E646FC47B4B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AFB10E41A;
	Mon, 10 Nov 2025 15:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OeOErnBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958B110E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:55:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d4vPk1GXqz9tKJ;
 Mon, 10 Nov 2025 16:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762790106; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSx9MBu8gjn4oE9VzLVRyN+WHpggTZuPNrEcukKkUn4=;
 b=OeOErnBoYp88WzbiTOzrWCmskeaH93Xv429Um4Wxcuq+I+CiQTMlCSARoiyxXMnhV45WQs
 Y6zWy2+jD8xmLORNLsq98NcjWg9KfV/iOrspAm3QP/joWlQxmoezIJ827Guxi4RRBqe23S
 unbS7ik3p2ytnT6hBrjWu1vG3idocJnyPwZ2a8ZumVNCc9fDGWwG/Jw1d+MRSL9w5wC/WZ
 VicEe1grW160S+of2vTD366OpK7X+Pu9EbMfpFPNz6J2rGq8wxW2g2uFVmL2kJ23i61jC1
 yNJY32Gihuo2d03NEzmKLsEPVfIGaCs4Yaf2e53ORI0roleRTl4lZX5Ytop4Ug==
Message-ID: <589a1be140f3c8623a2647b107a1130289eb00ba.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrey
 Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org, Matthew Brost
 <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Mon, 10 Nov 2025 16:55:01 +0100
In-Reply-To: <05603d39-0aeb-493e-a1ed-8051a99dfc41@amd.com>
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
 <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
 <2c72eb6e-7792-4212-b06f-5300bc9a42f9@amd.com>
 <987527ead1fe93877139a9ee8b6d2ee55eefa1ee.camel@mailbox.org>
 <05603d39-0aeb-493e-a1ed-8051a99dfc41@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 09f38a7b37e36746f60
X-MBO-RS-META: wyff56gqh5tm8fspikhhsbztuksxd1kw
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

On Mon, 2025-11-10 at 16:14 +0100, Christian K=C3=B6nig wrote:
> On 11/10/25 15:20, Philipp Stanner wrote:
> > On Mon, 2025-11-10 at 15:07 +0100, Christian K=C3=B6nig wrote:
> > > On 11/10/25 13:27, Philipp Stanner wrote:
> > > The problem isn't the burned CPU cycles, but rather the cache lines m=
oved between CPUs.
> >=20
> > Which cache lines? The spinlock's?
> >=20
> > The queue data needs to move from one CPU to the other in either case.
> > It's the same data that is being moved with spinlock protection.
> >=20
> > A spinlock doesn't lead to more cache line moves as long as there's
> > still just a single consumer / producer.
>=20
> Looking at a couple of examples:
>=20
> 1. spinlock + double linked list (which is what the scheduler used initia=
lly).
>=20
> =C2=A0=C2=A0 You have to touch 3-4 different cache lines, the lock, the p=
revious, the current and the next element (next and prev are usually the sa=
me with the lock).

list when pushing:

Lock + head (same cache line) + head->next
head->next->next

when popping:

Lock + head + head->previous
head->previous->previous

I don't see why you need a "current" element when you're always only
touching head or tail.


>=20
> 2. kfifo (attempt #2):
>=20
> =C2=A0=C2=A0 3 cache lines, one for the array, one for the rptr/wptr and =
one for the element.
> =C2=A0=C2=A0 Plus the problem that you need to come up with some upper bo=
und for it.
>=20
> 3. spsc (attempt #3)
>=20
> =C2=A0=C2=A0 2-3 cache lines, one for the queue (head/tail), one for the =
element and one for the previous element (but it is quite likely that this =
is pre-fetched).
>=20
> Saying this I just realized we could potentially trivially replace the sp=
sc with an single linked list+pointer to the end+spinlock and have the same=
 efficiency. We don't need all the lockless stuff for that at all.
>=20

Now we're speaking mostly the same language :]

If you could RB my DRM TODO patches we'd have a section for drm/sched,
and there we could then soonish add an item for getting rid of spsc.

https://lore.kernel.org/dri-devel/20251107135701.244659-2-phasta@kernel.org=
/

> > >=20

[=E2=80=A6]

> > > The problem is really to separate the push from the pop side so that =
as few cache lines as possible are transferred from one CPU to another.=20
> >=20
> > With a doubly linked list you can attach at the front and pull from the
> > tail. How is that transferring many cache lines?
>=20
> See above.
>=20
> We have some tests for old and trivial use cases (e.g. GLmark2) which on =
todays standards pretty much only depend on how fast you can push things to=
 the HW.
>=20
> We could just extend the scheduler test cases to see how many submissions=
 per second we can pump through a dummy implementation where both producer =
and consumer are nailed to separate CPUs.
>=20

I disagree. That would be a microbenchmark for a very narrow use case.
It would only tell us that a specific patch slows things done for the
microbenchmark, and we could only detect that if a developer runs the
unit tests with and without his patches.

The few major reworks that touch such essentials have good realistic
tests anyways, see Tvrtko's CFS series.


Lockless magic should always be justified by real world use cases.

By the way, back when spsc_queue was implemented, how large were the
real world performance gains you meassured by saving that 1 cache line?


P.
