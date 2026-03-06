Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NeXMgTjqmkjYAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:21:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E732228AC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA6C10ED50;
	Fri,  6 Mar 2026 14:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RDJVP7iN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858DF10ED50
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772806912;
 bh=aROk0IP8SW5ou3/slyjCpFPsJdqWzsnLUcfRF0rLhHw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RDJVP7iNi1g1Vka8pO1w67uDajoJCSd3fCYSF0VGzMNWDlVY1f1QEDsDyOUfehQqZ
 Ef9eW65dsuXta6mkyDFHOxaiSnKvIlxrWzDvkZM2l4pnkhGXHFmko6Isos4fbnXiDY
 iPar7sRvz1ulFVQ3pzWEU21AH17GS6CT1fJ5cQK+SWuxaiuESbHl/TBKXLtLdRgjx5
 Kpmowh2PP3O9qs9R+MXKwVt19V7aUnEqniAE/9v2L1VvjrBBgxE1uHqylJFl2hFUVl
 aNHZAfRvT2nyVuuMFbr1jEq2ORRCmiCzhisuYkwpNovJ274OQRuLlSa0pRL3iBTA7z
 qZzCKKYmUz7vQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ED61717E095E;
 Fri,  6 Mar 2026 15:21:51 +0100 (CET)
Date: Fri, 6 Mar 2026 15:21:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel  <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260306152147.61a43ef2@fedora>
In-Reply-To: <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 56E732228AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:christian.koenig@amd.com,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[148.251.105.195:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:email,amd.com:email]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026 13:36:48 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Fri, 2026-03-06 at 13:31 +0100, Christian K=C3=B6nig wrote:
> > On 3/6/26 12:57, Philipp Stanner wrote: =20
> > > On Fri, 2026-03-06 at 12:24 +0100, Boris Brezillon wrote: =20
> > > > On Fri, 6 Mar 2026 12:03:19 +0100
> > > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > > >  =20
> > > > > On 3/6/26 11:37, Boris Brezillon wrote: =20
> > > > > > On Fri, 6 Mar 2026 10:58:07 +0100
> > > > > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > > > > > =C2=A0  =20
> > > > > > > On 3/6/26 10:46, Boris Brezillon wrote:=C2=A0  =20
> > > > > > > > On Fri, 6 Mar 2026 09:10:52 +0100
> > > > > > > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:=C2=
=A0=C2=A0=C2=A0  =20
> > > > > > > > > Well as I wrote above you either have super reliable lock=
ing in
> > > > > > > > > your signaling path or you will need that for error handl=
ing.=C2=A0=C2=A0=C2=A0  =20
> > > > > > > >=20
> > > > > > > > Not really. With rust's ownership model, you can make it so=
 only
> > > > > > > > one thread gets to own the DriverFence (the signal-able fen=
ce
> > > > > > > > object), and the DriverFence::signal() method consumes this
> > > > > > > > object. This implies that only one path gets to signal the
> > > > > > > > DriverFence, and after that it vanishes, so no one else can
> > > > > > > > signal it anymore. Just to clarify, by vanishes, I mean tha=
t the
> > > > > > > > signal-able view disappears, but the observable object (Fen=
ce)
> > > > > > > > can stay around, so it can be monitored (and only monitored=
) by
> > > > > > > > others. With this model, it doesn't matter that _set_error(=
) is
> > > > > > > > set under a dma_fence locked section or not, because the
> > > > > > > > concurrency is addressed at a higher level.=C2=A0=C2=A0=C2=
=A0  =20
> > > > > > >=20
> > > > > > > That whole approach won't work. You have at least the IRQ han=
dler
> > > > > > > which signals completion and the timeout handler which signals
> > > > > > > completion with an error.=C2=A0  =20
> > > > > >=20
> > > > > > From a pure rust standpoint, and assuming both path (IRQ handle=
r and
> > > > > > timeout handler) are written in rust, the compiler won't let you
> > > > > > signal concurrently if we design the thing properly, that's what
> > > > > > I'm trying to say. Just to be clear, it doesn't mean you can't =
have
> > > > > > one worker (in a workqueue context) that can signal a fence and=
 an
> > > > > > IRQ handler that can signal the same fence. It just means that =
rust
> > > > > > won't let you do that unless you have proper locking in place, =
and
> > > > > > rust will also guarantee you won't be able to signal a fence th=
at
> > > > > > has already been signaled, because as soon as it's signaled, the
> > > > > > signal-able fence should be consumed.=C2=A0  =20
> > > > >=20
> > > > > Ah got it! I've worked a lot with OCaml in the past which has some
> > > > > similarities, but doesn't push things that far.
> > > > >  =20
> > > > > > >=20
> > > > > > > We have documented that this handling is mandatory for DMA-fe=
nces
> > > > > > > since so many driver implementations got it wrong.=C2=A0  =20
> > > > > >=20
> > > > > > Again, I'm just talking about the rust implementation we're aim=
ing
> > > > > > for. If you start mixing C and rust in the same driver, you're =
back
> > > > > > to the original problem you described.=C2=A0  =20
> > > > >=20
> > > > > The key point is the Rust implementation should not repeat the
> > > > > mistakes we made in the C implementation.
> > > > >=20
> > > > > For example blocking that multiple threads can't signal a DMA-fen=
ce
> > > > > is completely irrelevant. =20
> > > >=20
> > > > From a correctness standpoint, I think it's important to ensure no =
more
> > > > than one thread gets to signal the object. =20
> > >=20
> > > If you have two paths that can signal a fence, that will result
> > > effectively in you in Rust having to use yet another lock for a fence,
> > > and likely some mechanism for revoking the access.
> > >=20
> > > I would at least consider whether it isn't much easier to have the
> > > signalling-function ignore multiple signal attempts.
> > >=20
> > > AFAIU in Rust we originaly ended up at signal() consuming the fence
> > > because of the code UAF problem with data: T. =20
> >=20
> > +1
> >  =20
> > > > >=20
> > > > > What we need to guarantee is correct timeout handling and that
> > > > > DMA-fence can only signal from something delivered from a HW even=
t,
> > > > > e.g. a HW interrupt or interrupt worker or similar. =20
> > > >=20
> > > > We've mostly focused on coming up with a solution that would annota=
te
> > > > signaling paths in an automated way, and making sure dma_fence_sign=
al()
> > > > is never called outside of a non-annotated path:
> > > > - creation of DmaFenceWorkqueue/DmaFence[Delayed]Work that guarante=
es
> > > > =C2=A0 all works are executed in a dma_fence_signalling_{begin,end}=
()
> > > > =C2=A0 section, so we can properly detect deadlocks (through lockde=
p)
> > > > - creation of a DmaFenceIrqHandler for the same reason
> > > > - we'll need variants for each new deferred mechanism drivers might
> > > > =C2=A0 want to use (kthread_worker?)
> > > >=20
> > > > But there's currently no restriction on calling dma_fence_signal() =
in a
> > > > user thread context (IOCTL()). I guess that shouldn't be too hard to
> > > > add (is_user_task() to the rescue).
> > > >  =20
> > > > >=20
> > > > > A DMA-fence should *never* signal because of an IOCTL =20
> > > >=20
> > > > Okay, that's understandable.
> > > >  =20
> > > > > or because some
> > > > > object runs out of scope. E.g. when you cleanup a HW ring buffer,=
 FW
> > > > > queue, etc... =20
> > > >=20
> > > > We were actually going in the opposite direction:
> > > > auto-signal(ECANCELED) on DriverFenceTimeline object destruction =20
> >=20
> > Absolutely clear NAK to that, we have iterated that many times before o=
n the C side as well.
> >=20
> > See below for the explanation of the background.
> >  =20
> > > > (which
> > > > is the thing that would be attached to the HW ringbuf. The reason i=
s:
> > > > we don't want to leave unsignalled fences behind,
> > > >  =20
> > >=20
> > > Not only do we not "want to", we actually *cannot*. We have to make
> > > sure all fences are signaled because only this way the C backend plus
> > > RCU can protect also the Rust code against UAF.
> > >  =20
> > > > =C2=A0and if the HW ring is
> > > > gone, there's nothing that can signal it. Mind explaining why you t=
hink
> > > > this shouldn't be done, because I originally interpreted your
> > > > suggestion as exactly the opposite. =20
> > >=20
> > > I also don't get it. All fences must always get signaled, that's one =
of
> > > the most fundamental fence rules. Thus, if the last accessor to a fen=
ce
> > > drops, you do want to signal it with -ECANCELED =20
> >=20
> > All fences must always signal because the HW operation must always comp=
lete or be terminated by a timeout.
> >=20
> > If a fence signals only because it runs out of scope than that means th=
at you have a huge potential for data corruption and that is even worse tha=
n not signaling a fence.
> >=20
> > In other words not signaling a fence can leave the system in a deadlock=
 state, but signaling it incorrectly usually results in random data corrupt=
ion.

Forcing a manual signal doesn't really solve the problem, does it? I
mean, you can hand-roll your "signal(ECANCELED) all fences on this HW
ring on HW ring desctruction" (you'll have to if it's not managed by
something else), but how safer is it than providing a
DriverDmaFenceTimeline (or DriverDmaFenceContext, call it what you
want) that manages that for you, and then have this object attached to
your HW ring, and on HW ring drop, you get DriverDmaFenceContext
dropped too, and the associated auto-signal(ECANCELED) called.

Ultimately, the UAF you're referring to still exists, and I agree it's
worse than a deadlock, but it's also not something we're magically
immune to just because we don't signal on ::drop().

If you think that's preferable, we can have that done in some
::signal_all() method that has to be explicitly called when the HW
ring is destroyed, but that's basically the same problem: you have no
guarantee that no other paths will call that while the HW is still
active...

>=20
> It all stands and falls with the question whether a fence can drop by
> accident in Rust, or if it will only ever drop when the hw-ring is
> closed.

Let's say it's less likely to happen, not impossible. And if it does
happen, it means the user really wanted that to happen (thinking of
ManuallyDrop for instance).
