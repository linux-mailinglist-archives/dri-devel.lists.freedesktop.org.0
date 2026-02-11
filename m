Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJXYM/M6jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:16:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E9122254
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6750110E208;
	Wed, 11 Feb 2026 08:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rk2JusSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D2510E208
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 08:16:47 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f9rqv0n0jz9tnP;
 Wed, 11 Feb 2026 09:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770797803; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=426ZDZGofBwxHLpEmst7OBBrGakVWAN5i5sXpTY1j9Q=;
 b=rk2JusSxVELkduHAaUz5zTt/ynvy2eBlnuGc/X4AHHc4bl5EjQ2wFbiixK4LXpS7IMPfwc
 Ixu9Ghuk8fd+bTt3R6j6cITlLnvHTPu/zYH+HhkXq1gu0r9yy58r1mbGfnNZQd5wAsPs6O
 h7FUAvh3/HK9NAxdSHGzKft0WNx2FGdvqbibyltpV2ldPoF3IkRbqcWGM8BEOwszncPQof
 UzD16fhh8AFkKfTB0VVyA2N9tkCrg+h4hbwCqVTRdpXBvDTDz2mvkti3eiHICiCnvBbE0x
 ig0V8uZKnkuxNBTjajd0P0uEYWIJ7uX/XhzzBcmS7gV87aTtkeL7fESUFCemrQ==
Message-ID: <18bd737f07773edbf56ee011cd76f953290d1188.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alice
 Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 09:16:37 +0100
In-Reply-To: <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: exstjuh1ygpncwnffutx8y3jectu1355
X-MBO-RS-ID: b0bbf20f2d7ec6e37fe
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 3E6E9122254
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 16:45 +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 16:07, Alice Ryhl wrote:
> > >=20

[=E2=80=A6]

> > > That doesn't happen in practice.
> > >=20
> > > For each fence you only have one signaling path you need to guarantee
> > > forward progress for.
> > >=20
> > > All other signaling paths are just opportunistically optimizations
> > > which *can* signal the fence, but there is no guarantee that they
> > > will.
> > >=20
> > > We used to have some exceptions to that, especially around aborting
> > > submissions, but those turned out to be a really bad idea as well.=C2=
=A0=20
> > >=20
> > > Thinking more about it you should probably enforce that there is only
> > > one signaling path for each fence signaling.
> >=20
> > I'm not really convinced by this.
> >=20
> > First, the timeout path must be a fence signalling path because the
> > reason you have a timeout in the first place is because the hw might
> > never signal the fence. So if the timeout path deadlocks on a
> > kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.
>=20
> Mhm, good point. On the other hand the timeout handling should probably b=
e considered part of the normal signaling path.
>=20
> In other words the timeout handler either disables the normal signaling p=
ath (e.g. by disabling the interrupt) and then reset the HW or it tells the=
 HW to force signal some work and observes the result.
>=20
> So it can be that the timeout handler finishes only after the fence is si=
gnaled from the normal signaling paths.

I would say since we are designing all this (for now) for modern and
future hardware, the timeout handling regarding GPUs can be considered
trivial?

A timeout event as far as JobQueue is concerned is a mere instruction
to drop the entire queue and close the ring. Further signaling should
either not occur at all anymore (because the ring is blocked by a
broken shader) =E2=80=93 or if a racy job still finishes while a timeout is
firing, your problem, then the ring shall still be terminated. It would
then result in that last blocking job being completed for userspace,
and the subsequent once being signalled with -ECANCELED.

In a timeout handler, a driver would just drop its jobqueue, resulting
in all access being revoked, and the JQ deregistering its events from
all fences. Deadlock is being accounted for by RCU.


So no problem here, or am I missing something?

>=20
> > Second, for the reasons I mentioned you also want the signal-from-irq
> > path to be a fence signalling critical path, because if we allow you to
> > kmalloc(GFP_KERNEL) on the path from getting notification from hardware
> > to signalling the fence, then you may deadlock until the timeout
> > triggers ... even if the deadlock is only temporary, we should still
> > avoid such cases IMO. Thus, the hw signal path should also be a fence
> > signalling critical path.
>=20
> As far as I remember we didn't had any of such cases.
>=20
> You can't call kmalloc(GFP_KERNEL) from an interrupt handler, so you woul=
d need something like irq->work item->kmalloc(GFP_KERNEL)->signaling and I =
think that's unlikely to be implemented this way.
>=20
> But yeah, it is still something which should be prevented somehow.

Just as a side note, we want to ask ourselves what kinds of potential
problems we want to make impossible. 100% might get really work
intensive. I'm in general a fan of the 20-80-Rule, so I'd like to know
what the most severe and most common misuses of dma_fences are.


P.
