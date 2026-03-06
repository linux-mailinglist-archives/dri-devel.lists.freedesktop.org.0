Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJOaEWy5qmlpVwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:24:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82E21F9D6
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 12:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B595110E12C;
	Fri,  6 Mar 2026 11:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bmA3Dhod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4D10E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772796262;
 bh=nJ6SNNfSr056/FhNzWFxgq6fu1LaB02F6/uIt1PeWro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bmA3Dhod5pROUA/ETj9efE931eaSdYqvHZ5YvHevqNbR1s0PNBpZmH4kPyfKKyepZ
 2Qe6IBijnGY5gMVQMKP+0vnQ11riMQaAJFu2Pc2yAW1Z6RrpfviQFnqDYJExzcuV78
 1UqOflX/ezNrZUMXdXoc39BnWTjVOsrLnplRHkvpFu/oidVUoAdgrhht2XaDmMkQED
 /nsU/KBZ+ClOpaWKRB5KbecNSMqpy/cp4kLlApkHu0V2uv5FJLTMtQddBapb3myJ1U
 K357+ksLVTEooYGb0jaBaEVbfAY7PIJsxRPkbn2GYnh3dQEvzsBgLdPcdIuN5UrKN4
 /fKfh2erovNAA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FE3F17E0DC0;
 Fri,  6 Mar 2026 12:24:22 +0100 (CET)
Date: Fri, 6 Mar 2026 12:24:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260306122417.6febebf4@fedora>
In-Reply-To: <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
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
X-Rspamd-Queue-Id: AB82E21F9D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 12:03:19 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/6/26 11:37, Boris Brezillon wrote:
> > On Fri, 6 Mar 2026 10:58:07 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> >> On 3/6/26 10:46, Boris Brezillon wrote: =20
> >>> On Fri, 6 Mar 2026 09:10:52 +0100
> >>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:   =20
> >>>> Well as I wrote above you either have super reliable locking in
> >>>> your signaling path or you will need that for error handling.   =20
> >>>
> >>> Not really. With rust's ownership model, you can make it so only
> >>> one thread gets to own the DriverFence (the signal-able fence
> >>> object), and the DriverFence::signal() method consumes this
> >>> object. This implies that only one path gets to signal the
> >>> DriverFence, and after that it vanishes, so no one else can
> >>> signal it anymore. Just to clarify, by vanishes, I mean that the
> >>> signal-able view disappears, but the observable object (Fence)
> >>> can stay around, so it can be monitored (and only monitored) by
> >>> others. With this model, it doesn't matter that _set_error() is
> >>> set under a dma_fence locked section or not, because the
> >>> concurrency is addressed at a higher level.   =20
> >>
> >> That whole approach won't work. You have at least the IRQ handler
> >> which signals completion and the timeout handler which signals
> >> completion with an error. =20
> >=20
> > From a pure rust standpoint, and assuming both path (IRQ handler and
> > timeout handler) are written in rust, the compiler won't let you
> > signal concurrently if we design the thing properly, that's what
> > I'm trying to say. Just to be clear, it doesn't mean you can't have
> > one worker (in a workqueue context) that can signal a fence and an
> > IRQ handler that can signal the same fence. It just means that rust
> > won't let you do that unless you have proper locking in place, and
> > rust will also guarantee you won't be able to signal a fence that
> > has already been signaled, because as soon as it's signaled, the
> > signal-able fence should be consumed. =20
>=20
> Ah got it! I've worked a lot with OCaml in the past which has some
> similarities, but doesn't push things that far.
>=20
> >>
> >> We have documented that this handling is mandatory for DMA-fences
> >> since so many driver implementations got it wrong. =20
> >=20
> > Again, I'm just talking about the rust implementation we're aiming
> > for. If you start mixing C and rust in the same driver, you're back
> > to the original problem you described. =20
>=20
> The key point is the Rust implementation should not repeat the
> mistakes we made in the C implementation.
>=20
> For example blocking that multiple threads can't signal a DMA-fence
> is completely irrelevant.

=46rom a correctness standpoint, I think it's important to ensure no more
than one thread gets to signal the object.

>=20
> What we need to guarantee is correct timeout handling and that
> DMA-fence can only signal from something delivered from a HW event,
> e.g. a HW interrupt or interrupt worker or similar.

We've mostly focused on coming up with a solution that would annotate
signaling paths in an automated way, and making sure dma_fence_signal()
is never called outside of a non-annotated path:
- creation of DmaFenceWorkqueue/DmaFence[Delayed]Work that guarantees
  all works are executed in a dma_fence_signalling_{begin,end}()
  section, so we can properly detect deadlocks (through lockdep)
- creation of a DmaFenceIrqHandler for the same reason
- we'll need variants for each new deferred mechanism drivers might
  want to use (kthread_worker?)

But there's currently no restriction on calling dma_fence_signal() in a
user thread context (IOCTL()). I guess that shouldn't be too hard to
add (is_user_task() to the rescue).

>=20
> A DMA-fence should *never* signal because of an IOCTL

Okay, that's understandable.

> or because some
> object runs out of scope. E.g. when you cleanup a HW ring buffer, FW
> queue, etc...

We were actually going in the opposite direction:
auto-signal(ECANCELED) on DriverFenceTimeline object destruction (which
is the thing that would be attached to the HW ringbuf. The reason is:
we don't want to leave unsignalled fences behind, and if the HW ring is
gone, there's nothing that can signal it. Mind explaining why you think
this shouldn't be done, because I originally interpreted your
suggestion as exactly the opposite.
