Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMzXEB7irmmoJgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:07:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5EF23B3F6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC810E18A;
	Mon,  9 Mar 2026 15:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="quG54+Yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE0B10E18A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773068824;
 bh=7v3Zy2Et46utSjLR4FTLj8KdQps3UAcubkOvyh1ax18=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=quG54+YuTUlMSn2CwdnXYswG+uvJ/bRijTvET8zm2ISb4cir3WhqCHbe/nRS1FmL+
 4QELVs8MT+ZSB4dXS4dfdIgTLjkGlfO0Si+Zs9OLhmmz/a71iEmpw99NdF+amUAzmf
 z5XTdEP+2q8CHxWatlEZkzkXTMHMRGnhZkqUrGTxuio/BoXde1n5NHl+2nle1AIevZ
 XU1j+/khtqDzWqJ2ZB/xGkM1mg0AysoApTI8EucMW9YH3nz31xsXPf5zXufg6xEGXK
 vuiuR2LnFOudnle41OadesGDgGrcStWeeq5bav38StDtUsDGkcPTWiZuvd3MLHC9nO
 K5hkYWJWyBN/A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C420717E0FDB;
 Mon,  9 Mar 2026 16:07:03 +0100 (CET)
Date: Mon, 9 Mar 2026 16:06:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260309160658.5b012e4d@fedora>
In-Reply-To: <f5bbdfe4-c9e5-42f7-9849-4c9d57360183@amd.com>
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
 <884567da-e884-425a-b0d0-c9a6211bc2ae@amd.com>
 <20260306155504.5cc6157e@fedora>
 <f5bbdfe4-c9e5-42f7-9849-4c9d57360183@amd.com>
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
X-Rspamd-Queue-Id: 3D5EF23B3F6
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 10:33:10 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/6/26 15:55, Boris Brezillon wrote:
> > On Fri, 6 Mar 2026 13:54:15 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> >> On 3/6/26 13:36, Philipp Stanner wrote: =20
> >>>>>> (which
> >>>>>> is the thing that would be attached to the HW ringbuf. The
> >>>>>> reason is: we don't want to leave unsignalled fences behind,
> >>>>>>   =20
> >>>>>
> >>>>> Not only do we not "want to", we actually *cannot*. We have to
> >>>>> make sure all fences are signaled because only this way the C
> >>>>> backend plus RCU can protect also the Rust code against UAF.
> >>>>>   =20
> >>>>>> =C2=A0and if the HW ring is
> >>>>>> gone, there's nothing that can signal it. Mind explaining why
> >>>>>> you think this shouldn't be done, because I originally
> >>>>>> interpreted your suggestion as exactly the opposite.   =20
> >>>>>
> >>>>> I also don't get it. All fences must always get signaled, that's
> >>>>> one of the most fundamental fence rules. Thus, if the last
> >>>>> accessor to a fence drops, you do want to signal it with
> >>>>> -ECANCELED   =20
> >>>>
> >>>> All fences must always signal because the HW operation must
> >>>> always complete or be terminated by a timeout.
> >>>>
> >>>> If a fence signals only because it runs out of scope than that
> >>>> means that you have a huge potential for data corruption and that
> >>>> is even worse than not signaling a fence.
> >>>>
> >>>> In other words not signaling a fence can leave the system in a
> >>>> deadlock state, but signaling it incorrectly usually results in
> >>>> random data corruption.   =20
> >>>
> >>> It all stands and falls with the question whether a fence can drop
> >>> by accident in Rust, or if it will only ever drop when the hw-ring
> >>> is closed.
> >>>
> >>> What do you believe is the right thing to do when a driver
> >>> unloads?=20
> >>
> >> Do a dma_fence_wait() to make sure that all HW operations have
> >> completed and all fences signaled.
> >> =20
> >>> Ideally we could design it in a way that the driver closes its
> >>> rings, the pending fences drop and get signaled with ECANCELED.
> >>> =20
> >>
> >> No, exactly that is a really bad idea.
> >>
> >> Just do it the other way around, use the dma_fence to wait for the
> >> HW operation to be completed. =20
> >=20
> > But in practice you don't just wait for the HW to finish most of the
> > time. You instruct the HW to stop processing stuff, and then wait
> > for it to acknowledge that it indeed stopped. =20
>=20
> And how does the HW acknowledged that it has indeed stopped? Maybe by
> sending an interrupt which signals a DMA-fence?

Yes, it's likely something like a _STATUS register update reflecting
the new HW state, plus an interrupt to wake the CPU up. The decision to
poll the status register or go the async-way is up to the driver.

>=20
> The point here is that all acknowledgement from the HW that a DMA
> operation was indeed stopped, independent if it's the normal
> operation completed use case or if it's the I have aborted use case,
> *must* always take the same HW and SW path.
>=20
> It is *not* sufficient that you do something like busy waiting for a
> bit in a register to flip in the abortion path and for a DMA memory
> write in the normal completion path.

I'm assuming the DMA_OP_COMPLETE is also a register update of some
sort. But let's assume it's not, then sure, we need to make sure the
operation is either complete (event received through the IRQ handler),
or the DMA engine is fully stopped. Doesn't really matter which path is
doing this check, as long as it's done.

>=20
> That's why MMU/VM inside a device is usually not sufficient to
> prevent freed memory from being written to. You need an IOMMU for
> that, e.g. close to the CPU/memory and without caches behind the HW
> path.

Either that, or you need a way to preempt DMA engine operations and
have them cancelled before they make it to the bus, plus wait for the
non-cancellable ones. And it doesn't really matter how the HW works,
because my point is not that we need to enforce how the SW can ensure
the HW is done processing the stuff (that's very HW specific), just
that there needs to be a way to do this SW <-> HW synchronization, and
it's the driver responsibility to ensure that ultimately. My second
point was that, once the HW block is considered idle, there might be
operations that were never dequeued because they were cancelled before
the HW got to it, and for those, we'll never get HW events. We just have
to walk the list and manually signal fences. That's the step I was
suggesting to automate through the auto-signal-on-drop approach, but we
can automate it through an explicit DriverFenceTimeline::cancel_all()
method, I guess.
