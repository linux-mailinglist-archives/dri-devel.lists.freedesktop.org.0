Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5CC527B9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BE310E739;
	Wed, 12 Nov 2025 13:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mYYssi56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9E510E739
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:31:27 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d646z3CjBz9tkC;
 Wed, 12 Nov 2025 14:31:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762954283; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qU96Uk29tMCvl+xNqOQ5rqiKaI0GWmBHNuklgI3ecKk=;
 b=mYYssi56jZyd7Bh6anocChcfEw9AjUJY7XGwzKhRLm/GIN2UpHUmYWuuhU5UaW7Z3I0dpU
 ZuVQFFclbZIWD8niUd001bOxQIeBtKb2nEtBIlCspHfMA2fToo1gZfDIlZm7+0qWlhuPeT
 VU8IiM83YNRTq7zA77PmISWnLd0woBBdPPQurztPYYp2HArIhLuRRdRGNdQWtw0tHGT+y5
 28Mze1LNAgoFYfWHW/A6NafGUV2q/oZfghOCWDCQlm5C5qRMfPUnDn6WA5u7hRJVgAu6l9
 d4sNsCi9to4DDRIWDq9QwAoKL4DnD+IUAB60TswZgKKZlb44gewsWCL68lFYtw==
Message-ID: <cd7f6684f1d8bfca606c4a6ba75c130d07e3a7fe.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Document racy behavior of
 drm_sched_entity_push_job()
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@kernel.org, Matthew Brost
 <matthew.brost@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Nov 2025 14:31:19 +0100
In-Reply-To: <babc3eae-42c2-4927-95db-7c529a282d6d@ursulin.net>
References: <20251112073138.93355-2-phasta@kernel.org>
 <e9c02871-fa80-46c7-8b96-bad3a6a2c5b9@ursulin.net>
 <38bce31a7cdea31738c161bb06af272d5f68af1a.camel@mailbox.org>
 <babc3eae-42c2-4927-95db-7c529a282d6d@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 6yztzec7q8snpddwiqn1twg5jkcioe6t
X-MBO-RS-ID: 9e51a9854326efa0a78
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

On Wed, 2025-11-12 at 13:13 +0000, Tvrtko Ursulin wrote:
>=20
> On 12/11/2025 12:15, Philipp Stanner wrote:
> > On Wed, 2025-11-12 at 09:42 +0000, Tvrtko Ursulin wrote:
> > >=20
> > > On 12/11/2025 07:31, Philipp Stanner wrote:
> > > > drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes =
a
> > > > reference to that queue's tip at the start, and some time later rem=
oves
> > > > that entry from that list, without locking or protection against
> > > > preemption.
> > >=20
> > > I couldn't figure out what you refer to by tip reference at the start=
,
> > > and later removes it. Are you talking about the top level view from
> > > drm_sched_entity_push_job() or where exactly?
> > > > This is by design, since the spsc_queue demands single producer and
> > > > single consumer. It was, however, never documented.
> > > >=20
> > > > Document that you must not call drm_sched_entity_push_job() in para=
llel
> > > > for the same entity.
> > > >=20
> > > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
> > > > =C2=A0=C2=A0 1 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu=
/drm/scheduler/sched_entity.c
> > > > index 5a4697f636f2..b31e8d14aa20 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > @@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sche=
d_entity *entity)
> > > > =C2=A0=C2=A0=C2=A0 * drm_sched_entity_push_job - Submit a job to th=
e entity's job queue
> > > > =C2=A0=C2=A0=C2=A0 * @sched_job: job to submit
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > + * It is illegal to call this function in parallel, at least for j=
obs belonging
> > > > + * to the same entity. Doing so leads to undefined behavior.
> > >=20
> > > One thing that is documented in the very next paragraph is that the
> > > design implies a lock held between arm and push. At least to ensure
> > > seqno order matches the queue order.
> > >=20
> > > I did not get what other breakage you found, but I also previously di=
d
> > > find something other than that. Hm.. if I could only remember what it
> > > was. Probably mine was something involving drm_sched_entity_select_rq=
(),
> > > drm_sched_entity_modify_sched() and (theoretical) multi-threaded
> > > userspace submit on the same entity. Luckily it seems no one does tha=
t.
> > >=20
> > > The issue you found is separate and not theoretically fixed by this
> > > hypothetical common lock held over arm and push?
> >=20
> > Well, if 2 CPUs should ever run in parallel in
> > drm_sched_entity_push_job() the spsc_queue will just explode. Most
> > notably, one CPU could get the job at the tip (the oldest job), then be
> > preempted, and then another CPU takes the same job and pops it.
>=20
> Ah, you are talking about the dequeue/pop side. First paragraph of the=
=20
> commit message can be clarified in that case.
>=20
> Pop is serialised by the worker so I don't think two simultaneous=20
> dequeues on the same scheduler are possible. How did you trigger it?
> > The API contract should be that the user doesn't have to know whether
> > there's a linked list or the magic spsc_queue.Luckily we moved the peek=
/pop helpers to sched_internal.h.
>=20
> Btw I thought you gave up on the scheduler and are working on the simple=
=20
> rust queue for firmware schedulers so how come you are finding subtle
> bugs in this code?

I'm a maintainer still, for a variety of reasons. That we work on
something for FW with a clean locking design doesn't mean we don't care
about existing infrastructure anymore. And I firmly believe in
documentation. People should know the rules from the API documentation,
not from looking into the implementation.

It's kind of a crucial design info that you must only push into
entities sequentially, no?

This doesn't fix a bug, obviously, since it's just a line of docu.
Regardless, pushing into the spsc queue in parallel would explode.
Emphasizing that costs as nothing.



P.
