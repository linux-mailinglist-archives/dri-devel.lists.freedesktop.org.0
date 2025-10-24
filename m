Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24FC05BAB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8015910EA6E;
	Fri, 24 Oct 2025 10:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MjbWpVxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C0C10EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:59:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ctKf13kBdz9v4c;
 Fri, 24 Oct 2025 12:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761303545; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJxxsUJGuCcgcdrm2dasSwOhBxRtwebMXYYxFSWgXo8=;
 b=MjbWpVxs789w96QavL+l2YEQIau5qBTpXOlJ46Y53ihauIlQm2cAgzG8Ia7q+72SG5XWc5
 SbKBJu6nDcaIgeRLMX1vE4qY0r9+Zs5nhQau8+ttM5CAbOBC5FZuTHp//1jGKFy4sCTLMY
 y57q7RHMpmT/Tv5095iW5WBI+F/Tt2JEAVByE2u07G34fiO2hjV1YAlcPhP0rz7my+RZJL
 7GPnI1yMxgqOMmDe3FnOLZnipjO9H3ecnLzMRJLOzipKLmdbqnY3c90uwLUNWWOjxRx48J
 Uvc+6+QkKPuMBYgaxs+CccNookE1d8m3+UXjHk6XaSSvWLJMjOE00xihjhm3FA==
Message-ID: <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Gustavo
 Padovan <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Date: Fri, 24 Oct 2025 12:59:01 +0200
In-Reply-To: <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 38af43315007ac39358
X-MBO-RS-META: 4u1ufhoobt3yb771wkq7iq5z6jdtbn3d
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

On Fri, 2025-10-24 at 09:31 +0100, Tvrtko Ursulin wrote:
>=20
> On 24/10/2025 08:50, Philipp Stanner wrote:
> > To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
> > support was added to said function, coupled with using the signaled bit
> > to detect whether the fence_ops might be gone already.
> >=20
> > When implementing that a wrong string was set as a default return
> > parameter, indicating that every driver whose fence is already signalle=
d
> > must be detached, which is frankly wrong.
>=20
> Depends on how you look at it. After being signaled fence has to be=20
> detached from the driver. Ie. nothing belonging to this driver must be=
=20
> accessed via the fence.

Is that even documented btw? Many of the mysterious "dma fence rules"
are often only obtainable by asking Christian & Co

>=20
> I started with names and Christian has recently continued with ops.
>=20
> > Reported-by: Danilo Krummrich <dakr@kernel.org>
> > Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document t=
he rules")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > When this was merged, it sadly slipped by me. I think this entire RCU
> > mechanism was / is an overengineered idea.
> >=20
> > If we look at who actually uses dma_fence_driver_name() and
> > dma_fence_timeline_name() =E2=80=93 functions from which the largest sh=
are of
> > the fence_ops vs. fence lifetime issue stems from =E2=80=93 we discover=
 that
> > there is a single user:
> >=20
> > i915.
>=20

[=E2=80=A6]

>=20
>=20
> That would be nice, I also do not see much value in exporting names to=
=20
> userspace. But first more conversation around breaking the sync file ABI=
=20
> needs to happen. I think we had a little bit of it when changing the=20
> names of signalled fences and thinking was existing tools which look at=
=20
> the names will mostly survive it. Not sure if they would if unsignalled=
=20
> names would change.

I mean, what you and Christian are addressing in recent weeks are real
problems, and I was / am about to write similar solutions for our Rust
dma_fence.

In the case of those names, however, I'll likely just not support that
in Rust, saving me from adding those RCU guards and delivering output
of questionable use to users.
(could ofc be added later by someone who really needs it=E2=80=A6)

>=20
> >=20
> > P.
> > ---
> > =C2=A0 drivers/dma-buf/dma-fence.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 3f78c56b58dc..1875a0abebd3 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dm=
a_fence *fence)
> > =C2=A0=C2=A0	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> > =C2=A0=C2=A0		return fence->ops->get_driver_name(fence);
> > =C2=A0=C2=A0	else
> > -		return "detached-driver";
> > +		return "driver-whose-fence-is-already-signalled";
>=20
> IMHO unnecessarily verbose and whether or not changing it to anything
> different warrants a Fixes: tag is debatable.

IMO the output is just wrong and confusing. It's easy to imagine that
some user starts wondering and searching why his driver has been
unloaded, opening support tickets and so on.

Could be less verbose, though. Dunno. I let the maintainer decide.

P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(dma_fence_driver_name);
> > =C2=A0=20
>=20

