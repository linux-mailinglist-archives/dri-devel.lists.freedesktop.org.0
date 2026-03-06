Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG3mGhfBqmlXWQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:57:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BE21FF58
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465410E119;
	Fri,  6 Mar 2026 11:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="m7GUQK/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9CD10ED0B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:57:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fS4dX5MJ6z9sx3;
 Fri,  6 Mar 2026 12:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772798224; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7BejXuDs+JEy1r28QUaWD+K7DfWswQO081rFatEiQ7U=;
 b=m7GUQK/ccAQ6fyj16nHA4+gvo2QwVN7i1Tn8n823n6n4Rp8q8NYZdW3eZuw2lG5nYGrhq7
 1ThXLtiwo/ZQornRdj78c6PKmn9tAFWtcImdcj3ngUgq5wiMmphpJf3u1I6OipL+O1g52V
 VDIe2paKG0G0qyqVt7ujAhyGvLtFkg2DWTNcQAHUkL21SEjCgKMMhVk7jZNB+Evalldw9E
 6v/xQlQFjWg0rTeRgxJNDh+OYBdFGxJFtWpktpltcW0l9/KfmWPxeOVqHWwCvWvaIx8w9t
 0KK0ykRZyvsLoDKL//miSYe0szOLryOnd7EOEbzFNMLO/pu1pYs/tbUxDGr/iw==
Message-ID: <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
Subject: Re: dma_fence: force users to take the lock manually
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  dri-devel <dri-devel@lists.freedesktop.org>
Date: Fri, 06 Mar 2026 12:57:00 +0100
In-Reply-To: <20260306122417.6febebf4@fedora>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: i7bc3eeaoc94ieqc968m79mzfybpcwt7
X-MBO-RS-ID: 919e8d0841f23942b6a
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
X-Rspamd-Queue-Id: 7B1BE21FF58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Action: no action

On Fri, 2026-03-06 at 12:24 +0100, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 12:03:19 +0100
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > On 3/6/26 11:37, Boris Brezillon wrote:
> > > On Fri, 6 Mar 2026 10:58:07 +0100
> > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > > =C2=A0=20
> > > > On 3/6/26 10:46, Boris Brezillon wrote:=C2=A0=20
> > > > > On Fri, 6 Mar 2026 09:10:52 +0100
> > > > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:=C2=A0=C2=
=A0=C2=A0=20
> > > > > > Well as I wrote above you either have super reliable locking in
> > > > > > your signaling path or you will need that for error handling.=
=C2=A0=C2=A0=C2=A0=20
> > > > >=20
> > > > > Not really. With rust's ownership model, you can make it so only
> > > > > one thread gets to own the DriverFence (the signal-able fence
> > > > > object), and the DriverFence::signal() method consumes this
> > > > > object. This implies that only one path gets to signal the
> > > > > DriverFence, and after that it vanishes, so no one else can
> > > > > signal it anymore. Just to clarify, by vanishes, I mean that the
> > > > > signal-able view disappears, but the observable object (Fence)
> > > > > can stay around, so it can be monitored (and only monitored) by
> > > > > others. With this model, it doesn't matter that _set_error() is
> > > > > set under a dma_fence locked section or not, because the
> > > > > concurrency is addressed at a higher level.=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > That whole approach won't work. You have at least the IRQ handler
> > > > which signals completion and the timeout handler which signals
> > > > completion with an error.=C2=A0=20
> > >=20
> > > From a pure rust standpoint, and assuming both path (IRQ handler and
> > > timeout handler) are written in rust, the compiler won't let you
> > > signal concurrently if we design the thing properly, that's what
> > > I'm trying to say. Just to be clear, it doesn't mean you can't have
> > > one worker (in a workqueue context) that can signal a fence and an
> > > IRQ handler that can signal the same fence. It just means that rust
> > > won't let you do that unless you have proper locking in place, and
> > > rust will also guarantee you won't be able to signal a fence that
> > > has already been signaled, because as soon as it's signaled, the
> > > signal-able fence should be consumed.=C2=A0=20
> >=20
> > Ah got it! I've worked a lot with OCaml in the past which has some
> > similarities, but doesn't push things that far.
> >=20
> > > >=20
> > > > We have documented that this handling is mandatory for DMA-fences
> > > > since so many driver implementations got it wrong.=C2=A0=20
> > >=20
> > > Again, I'm just talking about the rust implementation we're aiming
> > > for. If you start mixing C and rust in the same driver, you're back
> > > to the original problem you described.=C2=A0=20
> >=20
> > The key point is the Rust implementation should not repeat the
> > mistakes we made in the C implementation.
> >=20
> > For example blocking that multiple threads can't signal a DMA-fence
> > is completely irrelevant.
>=20
> From a correctness standpoint, I think it's important to ensure no more
> than one thread gets to signal the object.

If you have two paths that can signal a fence, that will result
effectively in you in Rust having to use yet another lock for a fence,
and likely some mechanism for revoking the access.

I would at least consider whether it isn't much easier to have the
signalling-function ignore multiple signal attempts.

AFAIU in Rust we originaly ended up at signal() consuming the fence
because of the code UAF problem with data: T.

>=20
> >=20
> > What we need to guarantee is correct timeout handling and that
> > DMA-fence can only signal from something delivered from a HW event,
> > e.g. a HW interrupt or interrupt worker or similar.
>=20
> We've mostly focused on coming up with a solution that would annotate
> signaling paths in an automated way, and making sure dma_fence_signal()
> is never called outside of a non-annotated path:
> - creation of DmaFenceWorkqueue/DmaFence[Delayed]Work that guarantees
> =C2=A0 all works are executed in a dma_fence_signalling_{begin,end}()
> =C2=A0 section, so we can properly detect deadlocks (through lockdep)
> - creation of a DmaFenceIrqHandler for the same reason
> - we'll need variants for each new deferred mechanism drivers might
> =C2=A0 want to use (kthread_worker?)
>=20
> But there's currently no restriction on calling dma_fence_signal() in a
> user thread context (IOCTL()). I guess that shouldn't be too hard to
> add (is_user_task() to the rescue).
>=20
> >=20
> > A DMA-fence should *never* signal because of an IOCTL
>=20
> Okay, that's understandable.
>=20
> > or because some
> > object runs out of scope. E.g. when you cleanup a HW ring buffer, FW
> > queue, etc...
>=20
> We were actually going in the opposite direction:
> auto-signal(ECANCELED) on DriverFenceTimeline object destruction (which
> is the thing that would be attached to the HW ringbuf. The reason is:
> we don't want to leave unsignalled fences behind,
>=20

Not only do we not "want to", we actually *cannot*. We have to make
sure all fences are signaled because only this way the C backend plus
RCU can protect also the Rust code against UAF.

>  and if the HW ring is
> gone, there's nothing that can signal it. Mind explaining why you think
> this shouldn't be done, because I originally interpreted your
> suggestion as exactly the opposite.

I also don't get it. All fences must always get signaled, that's one of
the most fundamental fence rules. Thus, if the last accessor to a fence
drops, you do want to signal it with -ECANCELED


P.
