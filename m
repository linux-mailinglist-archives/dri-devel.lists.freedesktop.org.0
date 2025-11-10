Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5EC46952
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4D10E355;
	Mon, 10 Nov 2025 12:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q7U64OrC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AFE10E355
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:27:30 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d4pp62ZP6z9sZK;
 Mon, 10 Nov 2025 13:27:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762777646; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkOaaHIMGk9UXd9PysO+xnD+1NY6zxXdnR5dibctYK4=;
 b=q7U64OrCQ6SP5GwztZr7As/sutzLMcncZTj2+p8GQzPUZ0fz0rfKeofItHDiGWI10b2GK9
 eet+WPxxdKVvRKy6d5MxnZSIfOg7blYv4dAyaDJloQ5kc3S7omboj/qHCyi2sNkKdj9s5h
 vpi5HdW7mwTWGy0JoP8eJRQZaJfjhqQ+Q5quF3GXoXXvYuHEIWxlyAu6iboLTRKtn3Mxwk
 KWHC8ye9DO2WSDDAL5NsOF8mIzbxaDOk+I2fhqp4gYE90sM10ZnlHK7kRKXoMmL/f5Hohj
 3SjjRGD2zZCfsxLtPoZ2KIYrTWnUslxdc/W2I8j05jBAKE6XMIvCgTdmnmP68w==
Message-ID: <ee9fe54f3764bc0ee4ebafe5c10ad4afe748ef19.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Fix UB in spsc_queue
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,  Alex Deucher <alexander.deucher@amd.com>, Andrey
 Grodzovsky <Andrey.Grodzovsky@amd.com>, dakr@kernel.org,  Matthew Brost
 <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Mon, 10 Nov 2025 13:27:22 +0100
In-Reply-To: <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
References: <20251110081903.11539-2-phasta@kernel.org>
 <ee63ca7d-77d2-44d8-973b-7276f8c4d4a5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: yym999e4w6zw6ids5baho78ff6dxdnyi
X-MBO-RS-ID: 6901f3429aa461d8c9a
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

Please don't top-post :(
FDFY:


> On 11/10/25 09:19, Philipp Stanner wrote:
> > The spsc_queue is an unlocked, highly asynchronous piece of
> > infrastructure. Its inline function spsc_queue_peek() obtains the head
> > entry of the queue.
> >=20
> > This access is performed without READ_ONCE() and is, therefore,
> > undefined behavior. In order to prevent the compiler from ever
> > reordering that access, or even optimizing it away, a READ_ONCE() is
> > strictly necessary. This is easily proven by the fact that
> > spsc_queue_pop() uses this very pattern to access the head.
> >=20
> > Add READ_ONCE() to spsc_queue_peek().
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v4.16+
> > Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > I think this makes it less broken, but I'm not even sure if it's enough
> > or more memory barriers or an rcu_dereference() would be correct. The
> > spsc_queue is, of course, not documented and the existing barrier
> > comments are either false or not telling.
> >=20
> > If someone has an idea, shoot us the info. Otherwise I think this is th=
e
> > right thing to do for now.
> >=20
> > P.
> > ---
> > =C2=A0include/drm/spsc_queue.h | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> > index ee9df8cc67b7..39bada748ffc 100644
> > --- a/include/drm/spsc_queue.h
> > +++ b/include/drm/spsc_queue.h
> > @@ -54,7 +54,7 @@ static inline void spsc_queue_init(struct spsc_queue =
*queue)
> > =C2=A0
> > =C2=A0static inline struct spsc_node *spsc_queue_peek(struct spsc_queue=
 *queue)
> > =C2=A0{
> > - return queue->head;
> > + return READ_ONCE(queue->head);
> > =C2=A0}

On Mon, 2025-11-10 at 12:24 +0100, Christian K=C3=B6nig wrote:
> As far as I can see that is not correct or rather not complete.

It cannot be incorrect by definition, because it simply ensures that
the load will actually take place there.

Incomplete it can be.

>=20
> The peek function should only be used to opportunistically look at the to=
p of the queue. It would only be problematic if it returns a non NULL value=
 once and then a NULL value later.
>=20
> The whole idea of the SPSC is that it is barrier-free and the signaling o=
f new entries to the consumer side is providing the barrier.
>=20
> So basically on the provider side you have
> spsc_push(entry)
> wake_up(consumer)
>=20
> And on the consumer side you have:
>=20
> woken_up_by_provider() {
>  entry =3D spsc_peek();
>  ...
>  spsc_pop();
> }

Well no, the scheduler can pick up the next job whenever it feels like
it. Restarting it for example will have it peek into your queue,
regardless of wake events.

In any case this is a highly fragile design. See below, too.


>=20
> The problem we are facing here is that the spsc only provides the guarant=
ee that you see the entry pointer, but not the content of entry itself.
>=20
> So use cases like:
>=20
> woken_up_by_provider() {
>  while (entry =3D spsc_peek()) {
>  ...
>  spsc_pop();
>  }
> }
>=20
> Are illegal since you don't have the correct memory barriers any more.

I can't follow. Are you saying that spsc_queue_peek() is correct
because you know for sure that when it's used no one else might be
changing that pointer?

Even if that were true this design is highly fragile.

>=20
> Took me an eternity to understand that as well, so bear with me that I di=
dn't previously explained that.

s/explain/document :)

As discussed few weeks ago with Sima and Tvrtko, what we really need to
move to in all of DRM is this development pattern:

   1. For parallel code, at first by default use a boring, horribly
      slow (sarcasm) spinlock. BTW I'm not even convinced that a
      spinlock is slower than lockless tricks. Paul's book states that
      a CAS atomic instruction takes about 60 cycles, and taking a lock
      takes 100.
   2. If you want to do parallelism without locks, you need to justify
      it really well. "rmb() so list_empty() works without a lock"
      doesn't qualify, but real use case speedups.
   3. If you write lockless infrastructure, you need to document it
      really well. In particular you need to state:
         1. How it works
         2. What the rules are

See llist.h as an example. It clearly states when you need a lock and
when you don't. Or RCU. No one could use it without such good
documentation.

I have no idea whether spsc_queue is correctly implemented (I doubt
it), and if even a highly experienced dev like you takes "an eternity"
(quote) to understand it, one is really tempted to dream of spinlock_t,
which has very clear semantics and is easily understood even by
beginners.

>=20
> Question is what should we do?

Easy!

Mid-term, we should replace spsc_queue with a boring, locked, super-
slow linked list ^_^

The spsc_queue was designed and =E2=80=93 perhaps =E2=80=93 perf-measured w=
hen RR was
the only scheduling policy.

Since the FIFO rework, where FIFO became the default policy, we now
access our super efficient super fast lockless queue most of the time
with the spinlock being taken immediately afterwards anyways. So we
almost have a locked lockless queue now.

https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/scheduler=
/sched_entity.c#L502


Only push_job() often (?) still runs locklessly, but I'm not at all
convinced that this is worth it. Not even performance-wise.

If you look at spsc_queue_push() you see that it
   1. disables preemption,
   2. uses atomic instructions and
   3. has a ton of memory barries

=E2=80=93 in other words, this is almost literally a manual re-implementati=
on
of a spinlock, just without mutual exclusion=E2=80=A6


And even if something like spsc_queue would make sense and be actually
worth it, then it should be provided to the entire kernel as common
infrastructure, like llist.h, not hidden somewhere in DRM.

P.
