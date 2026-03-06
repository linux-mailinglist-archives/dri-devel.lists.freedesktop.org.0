Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN2gDNPqqmmOYAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:55:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019822326E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258210E151;
	Fri,  6 Mar 2026 14:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k87pXtrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F2510E3D6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772808909;
 bh=tNpHM9iFh+o8uKh4HulWR/D1pu7B6uTT0vQ8nLpAheg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k87pXtrdNDEX4VAzeyf6tnrpzlc6Btb3OpOYqPx0LCVnSXPVEKsuWSAz9gc6oqDLo
 FRxr7hoyqvwXzEJp0jP8SnGZhmTEDzH71ERqFT9Rsdpkz0DrJzLICatk2h5+37Gtyo
 VXmrNNXnP0pu7tmy51ARqNTfA4DDo4RaeyFaG7CpNRF3V6oyL2e7tn1lFT/PiRPffw
 gE/MxiK1AntgNtyZeJi0SAJIEIMhRRUQAo7AOkOVlrtChR79+qhcb/+qircXXV77Kg
 ULX4cRNagjqsUXkjPjIYDcCAhbjGtRmCcKOMA2Z9CLlsxsOaP/lRAm6d2WzeYvovqE
 TEvBpED35+SCg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 38CF617E05B5;
 Fri,  6 Mar 2026 15:55:09 +0100 (CET)
Date: Fri, 6 Mar 2026 15:55:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260306155504.5cc6157e@fedora>
In-Reply-To: <884567da-e884-425a-b0d0-c9a6211bc2ae@amd.com>
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
X-Rspamd-Queue-Id: 9019822326E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 13:54:15 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/6/26 13:36, Philipp Stanner wrote:
> >>>> (which
> >>>> is the thing that would be attached to the HW ringbuf. The
> >>>> reason is: we don't want to leave unsignalled fences behind,
> >>>> =20
> >>>
> >>> Not only do we not "want to", we actually *cannot*. We have to
> >>> make sure all fences are signaled because only this way the C
> >>> backend plus RCU can protect also the Rust code against UAF.
> >>> =20
> >>>> =C2=A0and if the HW ring is
> >>>> gone, there's nothing that can signal it. Mind explaining why
> >>>> you think this shouldn't be done, because I originally
> >>>> interpreted your suggestion as exactly the opposite. =20
> >>>
> >>> I also don't get it. All fences must always get signaled, that's
> >>> one of the most fundamental fence rules. Thus, if the last
> >>> accessor to a fence drops, you do want to signal it with
> >>> -ECANCELED =20
> >>
> >> All fences must always signal because the HW operation must always
> >> complete or be terminated by a timeout.
> >>
> >> If a fence signals only because it runs out of scope than that
> >> means that you have a huge potential for data corruption and that
> >> is even worse than not signaling a fence.
> >>
> >> In other words not signaling a fence can leave the system in a
> >> deadlock state, but signaling it incorrectly usually results in
> >> random data corruption. =20
> >=20
> > It all stands and falls with the question whether a fence can drop
> > by accident in Rust, or if it will only ever drop when the hw-ring
> > is closed.
> >=20
> > What do you believe is the right thing to do when a driver unloads?
> > =20
>=20
> Do a dma_fence_wait() to make sure that all HW operations have
> completed and all fences signaled.
>=20
> > Ideally we could design it in a way that the driver closes its
> > rings, the pending fences drop and get signaled with ECANCELED. =20
>=20
> No, exactly that is a really bad idea.
>=20
> Just do it the other way around, use the dma_fence to wait for the HW
> operation to be completed.

But in practice you don't just wait for the HW to finish most of the
time. You instruct the HW to stop processing stuff, and then wait for it
to acknowledge that it indeed stopped. And the HWRing object will only
be dropped when that happens. There's of course a fallback for the case
where the STOP operation fails (with reset, etc), which would just
delay the drop of the HWRing. But the point is, when the HWRing is
dropped, you should be guaranteed that the HW is no longer executing
any of the possibly pending jobs. Now, of course you can decide that
it's the driver responsibility to walk the list of jobs that were
pending after a STOP has been acked and manually signal all fences, or
you can assume that the HWRing being dropped is what provides this
guarantee. And because the HWRing embeds you DmaFenceCtx that
auto-signal on drops, you don't have to do anything.

>=20
> Then wait for an RCU grace period to make sure that nobody is still
> inside your DMA fence ops.
>=20
> And then you can continue with unloading the module.
>=20
> > Your concern seems to be a driver by accident droping a fence while
> > the hardware is still processing the associated job.
> >=20
> > (how's that dangerous, though? Shouldn't parties waiting for the
> > fence detect the error? ECANCELED =E2=87=92 you must not access the
> > associated memory) =20
>=20
> The dma_fence is the SW object which represents the HW operation.
>=20
> And that HW operation is doing DMA, e.g. accessing and potentially
> writing into memory. That's where the name Direct Memory Access comes
> from.
>=20
> So when that is messed up the memory which gets written to is
> potentially re-used with the absolutely dire consequences we have
> seen so many times.

But then, I'd argue that the HWRing (and the underlying FenceCtx
keeping track of emitted fences on this ring) should live at least as
long as the HW is assumed to be running commands. That's IMHO the
guarantee we need to provide: don't drop your HWRing object until
you're sure the HW has stopped pulling stuff from there. I can think
of the following two cases:

1. The HW has a way to prematurely stop stuff that are currently
executing. First thing we do is ensure the HW can't pull anything new,
then we issue a STOP and wait for an ACK. When this ACK is received, we
proceed with the rest of the cleanup. If the ACK doesn't come in time,
we flag the HWRing unusable, schedule a reset, and wait for this reset
to be effective before dropping the HWRing.

2. The HW can't stop what it started doing. We make sure nothing new
can be pushed to the HWRing, we wait for the in-flight ops to land. If
it's taking too long, the timeout handler will take over, schedule a
reset, and drop the faulty HWRing only after the reset is effective.

>=20
> Keep in mind that this framework is not only used by GPU where at
> least modern ones have VM protection, but also old ones and stuff
> like V4L were such things is just not present in any way.

I'm not questioning the fact signaling fences prematurely can lead to
terrible security holes which are worse than deadlocks, I'm questioning
the fact this "dont-signal-before-HW-is-done" guarantee needs to happen
at the fence level, rather than at the fence emitter level.
