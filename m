Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F9ABED26
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6EF10E69D;
	Wed, 21 May 2025 07:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FKikR/vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89A10E69D;
 Wed, 21 May 2025 07:35:09 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b2NVb2z3rz9sl8;
 Wed, 21 May 2025 09:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747812903; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NY0zoUUPANEqEDkUiizEzoJ+FxJPoDDMffZIzxI7P0=;
 b=FKikR/vx4FERbwsA7/A2o2fAGljiiQfaAZ9C6G+CgvBxwZJ8FiIcgK5WJczcbzhF8xgJf4
 YBhCBZsVO85ljSgkP0EkykVZ1PVaEmFXTqNfFmPPhkvxbIEFdKQySEyy0jWa3D+zgkMyDD
 o4UsEzLLVV0FUjBHmH52zVu6AWLe9Dlwhj4AFvqAeyd8W7Pm95HvsaQ0Cq09rGeAirk+kZ
 CiB6foBUSgOFvpcseVU4WTvUdoT0sRAEwjZctxdWIuCbvr3vdItxvBGVKn70559k5vG/Bw
 brfDNg358aQF3FQK88fXnU1ZTm/2XfjHI47+RKajeN5cja1ioAof+41W2UByCw==
Message-ID: <a7b30c595fffd63a5558226a9c372e503fea22d0.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 21 May 2025 09:35:00 +0200
In-Reply-To: <8b975d5f-eafd-4b25-8629-69fd71dcd4d9@ursulin.net>
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
 <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
 <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
 <01cce810-7303-4c92-b138-d8a647f3dcee@ursulin.net>
 <a36fdcf31fa0ca7d9e1a24f60ba4c5bf78c7ae87.camel@mailbox.org>
 <da8cfddf-6cb9-4ddd-9345-16d065663d4b@ursulin.net>
 <25363de0e88f750fe70a7b7629113f93f12f47e7.camel@mailbox.org>
 <8b975d5f-eafd-4b25-8629-69fd71dcd4d9@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 4b2d89cee6a20845148
X-MBO-RS-META: 53fafizi1hz1nxq3nho3js1iur6se3j9
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

On Tue, 2025-05-20 at 17:15 +0100, Tvrtko Ursulin wrote:
>=20
> On 19/05/2025 10:04, Philipp Stanner wrote:
> > On Mon, 2025-05-19 at 09:51 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 16/05/2025 18:16, Philipp Stanner wrote:
> > > > On Fri, 2025-05-16 at 15:30 +0100, Tvrtko Ursulin wrote:
> > > > >=20
> > > > > On 16/05/2025 14:38, Philipp Stanner wrote:
> > > > > > On Fri, 2025-05-16 at 13:10 +0100, Tvrtko Ursulin wrote:
> > > > > > >=20
> > > > > > > On 16/05/2025 12:53, Tvrtko Ursulin wrote:
> > > > > > > >=20
> > > > > > > >=20
> >=20
> > [snip]
> >=20
> > > > > > > > > > > +
> > > > > > > > > > > +/**
> > > > > > > > > > > + * drm_sched_job_add_prealloc_dep - add
> > > > > > > > > > > dependency
> > > > > > > > > > > to
> > > > > > > > > > > preallocated
> > > > > > > > > > > slot
> > > > > > > > > > > + * @job: scheduler job where dependencies will
> > > > > > > > > > > be
> > > > > > > > > > > added
> > > > > > > > > > > + * @id: the preallocated slot index
> > > > > > > > > > > + * @fence: the dependency to add
> > > > > > > > > > > + *
> > > > > > > > > > > + * Consumes @fence and adds it to the
> > > > > > > > > > > preallocated
> > > > > > > > > > > slot
> > > > > > > > > > > dependency.
> > > > > > > > > > > + */
> > > > > > > > > > > +void drm_sched_job_add_prealloc_dep(struct
> > > > > > > > > > > drm_sched_job
> > > > > > > > > > > *job, u32
> > > > > > > > > > > id,
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 struct dma_fence=
 *fence)
> > > > > > > > > > > +{
> > > > > > > > > > > +=C2=A0=C2=A0=C2=A0 fence =3D xa_store(&job->dependen=
cies, id,
> > > > > > > > > > > fence,
> > > > > > > > > > > GFP_ATOMIC);
> > > > > > > > > >=20
> > > > > > > > > > Add assert that the passed id exists (was
> > > > > > > > > > preallocated)
> > > > > > > > > > and
> > > > > > > > > > is
> > > > > > > > > > NULL?
> > > > > > > > >=20
> > > > > > > > > You
> > > > > > > >=20
> > > > > > > > Hm?
> > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > Also, if someone preallocates and does not consume
> > > > > > > > > > the
> > > > > > > > > > slot
> > > > > > > > > > will that
> > > > > > > > > > confuse the iteration in
> > > > > > > > > > drm_sched_job_dependency()?
> > > > > > > > >=20
> > > > > > > > > drm_sched_job_add_dependency() you mean.
> > > > > > > >=20
> > > > > > > > I was actually thinking of drm_sched_job_dependency()
> > > > > > > > because
> > > > > > > > that
> > > > > > > > looked it would skip dependencies upon encountering an
> > > > > > > > unconsumed
> > > > > > > > preallocated slot, but yes,
> > > > > > > > drm_sched_job_add_dependency()
> > > > > > > > could
> > > > > > > > explode
> > > > > > > > even earlier if adding a normal dependency after
> > > > > > > > preallocating
> > > > > > > > a
> > > > > > > > slot.
> > > > > > > >=20
> > > > > > > > > Yes, it would. All operations simply give you NULL
> > > > > > > > > for
> > > > > > > > > those
> > > > > > > > > slots. So
> > > > > > > > > seems to me you have to check for NULL wherever a
> > > > > > > > > preallocated
> > > > > > > > > slot
> > > > > > > > > might drop out. That would then be a bug.
> > > > > > > > >=20
> > > > > > > > > It's kind of tricky, all that. It's a pity that
> > > > > > > > > Wilcox
> > > > > > > > > didn't
> > > > > > > > > answer
> > > > > > > > > our questions about the idiomatic way to do it.
> > > > > > > > >=20
> > > > > > > > > Maybe reserving slots with already signaled fences
> > > > > > > > > wasn't
> > > > > > > > > such a
> > > > > > > > > bad
> > > > > > > > > idea after all?
> > > > > > > > >=20
> > > > > > > > > If we go for the NULL approach, it's probably the
> > > > > > > > > only
> > > > > > > > > sane
> > > > > > > > > way
> > > > > > > > > to then
> > > > > > > > > check for NULL wherever dependencies are accessed :(
> > > > > > > > >=20
> > > > > > > > > Opinions?
> > > > > > > >=20
> > > > > > > > Well if the xarray API returns the NULL consistently
> > > > > > > > the
> > > > > > > > approach
> > > > > > > > from
> > > > > > > > this patch is fine I think.
> > > > > > > >=20
> > > > > > > > We just need to add two more checks to the above
> > > > > > > > mentioned
> > > > > > > > functions,
> > > > > > >=20
> > > > > > > I need to correct myself, drm_sched_job_dependency()
> > > > > > > wouldn't
> > > > > > > be
> > > > > > > able
> > > > > > > to
> > > > > > > just skip NULLs since it relies on NULL for "no more
> > > > > > > dependencies".
> > > > > > > We
> > > > > > > would need to track something like job->max_dependency
> > > > > > > and
> > > > > > > terminate
> > > > > > > on
> > > > > > > job->last_dependency > job->max_dependency or so.
> > > > > >=20
> > > > > > Agreed, that would have to be fixed.
> > > > > >=20
> > > > > > I believe we should reconsider Christian's first idea [1].
> > > > > >=20
> > > > > > Thinking about it some more:
> > > > > > =C2=A0=C2=A0=C2=A0 * With the NULL version, suddenly the xarray=
 containing
> > > > > > only
> > > > > > valid
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies can sometimes conta=
in NULL entries.
> > > > > > =C2=A0=C2=A0=C2=A0 * If we could create our own tag, entries co=
uld be
> > > > > > returned
> > > > > > that
> > > > > > were
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 neither NULL nor valid fences, a=
lso requiring checks
> > > > > > 'everywhere'.
> > > > > > =C2=A0=C2=A0=C2=A0 * Only the "signaled fence as prealloc reser=
vation"
> > > > > > approach
> > > > > > is
> > > > > > fully
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 backwards compatible and will ne=
ver cause anyone to
> > > > > > block
> > > > > > after
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 later reworks.
> > > > > >=20
> > > > > > So maybe it's actually the best idea?
> > > > > >=20
> > > > > > Sorry for the zigg-zagg. No hard requirements intended from
> > > > > > my
> > > > > > side,
> > > > > > I'm willing to go with what you guys think.
> > > > > >=20
> > > > > > Just saying, at least now I think that the already-signaled
> > > > > > fence
> > > > > > seems
> > > > > > the most elegant solution. And since there's a function
> > > > > > (dma_fence_get_stub()) for that, it seems to be in
> > > > > > alignment
> > > > > > with
> > > > > > official dma_fence rules.
> > > > >=20
> > > > > Potential problem there was dma_fence_is_signaled() and fence
> > > > > signaling
> > > > > annotations. In case some driver is holding a lock over the
> > > > > arm+push
> > > > > pair. I wish we had a non-signaling is_signaled helper..
> > > > >=20
> > > >=20
> > > > Yes! +1!
> > > >=20
> > > > But Christian doesn't like that direction:
> > > >=20
> > > > https://lore.kernel.org/all/20250409120640.106408-2-phasta@kernel.o=
rg/
> > >=20
> > > Thanks, I read this but ended up uncertain on the conclusion.
> > >=20
> > > For instance Christian at the end comments like this:
> > >=20
> > > """
> > > You can test the flag if you know what the fence means to you,
> > > that
> > > is
> > > not a problem at all.
> > > """
> > >=20
> > > That was in the context of testing the signaled bit without
> > > opportunistic signaling.
> > >=20
> > > For me, from the scheduler dependencies side, that should exactly
> > > apply.
> > > Scheduler knows it does not need to add a signaled fence to the
> > > dep
> > > array so AFAICS it is fine to skip it. And it may easily be
> > > opportunistic signaling ends up a problem for the scheduler.
> > >=20
> > > So maybe such helper would be okay after all.
> >=20
> > The thing is that, if I understand him correctly, Christian doesn't
> > want a helper. He wants "us" to just use test_bit().
>=20
> I suspected it may be only about not renaming into some variant of=20
> check_and_signal etc. With which I agree with, that the name should
> be=20
> left alone, because...
>=20
> > My point is just that dma_fence_is_signaled() is a horrible name.
>=20
> ... as dodgy as it is, and despite me also failing to really
> understand=20
> the reason why it _has_ to be have opportunistic signaling, I think=20
> those semantics are by now pretty much ingrained into people dealing=20
> with this API so I would leave it as is.
>=20
> What I was thinking was the double underscore version of the helper
> and=20
> some kerneldoc to say when it is safe to use. For me a helper is
> better=20
> than poking directly.
>=20
> > The function pci_is_enabled() tells you whether the PCI device is
> > enabled. What it doesn't do is
> >=20
> > bool pci_is_enabled(pdev)
> > {
> > =C2=A0=C2=A0=C2=A0 if (crazy_callback_is_implemented()) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_enable_device();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0 ...
> > }
> >=20
> > It's not intuitive that a function called
> > "{something}_is_signaled()"
> > does signal that thing. Although I get that the syntactical idea
> > probably is that from the GPUs POV the fence is already signaled
> > when
> > this or that seqno has been reached.
> >=20
> > Anyways, judging aside, if a wrapper for test_bit(dma_fence) were
> > acceptable, then it would need to steal dma_fence_is_signaled()'s
> > name,
> > and dma_fence_is_signaled() would have to get a new name. Which is
> > precisely what was rejected, as I see it.
>=20
> __dma_fence_is_signaled() is what I would do and leave the existing
> one=20
> as is.

Fine by me. If you provide a patch for dma_fence, I can do a review.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > Or if the concern is helper might encourage some potentially
> > > unsafe
> > > usage, in that case it should come with kerneldoc describing. It
> > > is
> > > not
> > > like review is guaranteed to catch someone using test_bit
> > > directly
> > > anyway so for me, on balance, helper is always better.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > >=20
> > >=20
> > >=20
> > > >=20
> > > > P.
> > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > > Anyway, I think both options are passable. I even like the
> > > > > NULL
> > > > > entry
> > > > > slightly more since it is simpler in a way and I don't mind
> > > > > some
> > > > > extra
> > > > > checks completely hidden in scheduler internals.
> > > > >=20
> > > > > Regards,
> > > > >=20
> > > > > Tvrtko
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Philipp
> > > > > >=20
> > > > > >=20
> > > > > > [1]
> > > > > > https://lore.kernel.org/all/20250318120313.19099-2-christian.ko=
enig@amd.com
> > > > > > /
> > > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > Regards,
> > > > > > >=20
> > > > > > > Tvrtko
> > > > > > >=20
> > > > > > > > some more unit tests probably to make sure, and that
> > > > > > > > should
> > > > > > > > be
> > > > > > > > fine
> > > > > > > > for
> > > > > > > > now.
> > > > > > > >=20
> > > > > > > > On the bikeshedding front I would perhaps suggest:
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- drm_sched_job_preallocate_d=
ependency()
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- drm_sched_job_replace_depen=
dency()
> > > > > > > >=20
> > > > > > > > Reads a little bit more aligned with the rest of the
> > > > > > > > API
> > > > > > > > and a
> > > > > > > > bit
> > > > > > > > easier on the eyes, to my eyes at least.
> > > > > > > >=20
> > > > > > > > Regards,
> > > > > > > >=20
> > > > > > > > Tvrtko
> > > > > > > >=20
> > > > > > >=20
> > > > > >=20
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20

