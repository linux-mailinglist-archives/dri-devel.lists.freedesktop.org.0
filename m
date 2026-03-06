Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKGUJ26uqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A421EE55
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A3910ECD2;
	Fri,  6 Mar 2026 10:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hWxC7BmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562A510ECD2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772793448;
 bh=tcG+Y0rfPZJ4UxocYOMSW+zzK1qrJuMXukCBMaNnV5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hWxC7BmGcWg2k2qfbzQqpfvygQxqyNnh1VXqPzyTPAtS9UKQaPvUNRgSyXjTZqSkl
 3jRZcApDmw2Y1234jY9pr8O+vG8a2eHqSYkxwIpLQBCVT+bKA0d/wLY4XCx4iFWoXC
 l4NfmMBYi+RO+2v+RUgOfwxvK1CNyfOmFN1myuxtYGVfmaWkr8CPvCbzajupeqMczF
 IQcSB/O+c+OgwgOcuCUDowHtn9i48OOjwJC8GW4U3dbrzEkwBagpobGDyOfnZnpJwK
 fgXRQbus45Di2qFDgEfQT7wIB42rJJ7ThwO3Ml3O92MNXclMXSSbNq8jecQBg/qiSe
 5iBfoKYBzwNmQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5767117E01B1;
 Fri,  6 Mar 2026 11:37:28 +0100 (CET)
Date: Fri, 6 Mar 2026 11:37:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260306113723.1f13010c@fedora>
In-Reply-To: <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
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
X-Rspamd-Queue-Id: 130A421EE55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Fri, 6 Mar 2026 10:58:07 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/6/26 10:46, Boris Brezillon wrote:
> > On Fri, 6 Mar 2026 09:10:52 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote: =20
> >> Well as I wrote above you either have super reliable locking in your s=
ignaling path or you will need that for error handling. =20
> >=20
> > Not really. With rust's ownership model, you can make it so only one
> > thread gets to own the DriverFence (the signal-able fence object), and
> > the DriverFence::signal() method consumes this object. This implies
> > that only one path gets to signal the DriverFence, and after that it
> > vanishes, so no one else can signal it anymore. Just to clarify, by
> > vanishes, I mean that the signal-able view disappears, but the
> > observable object (Fence) can stay around, so it can be monitored (and
> > only monitored) by others. With this model, it doesn't matter that
> > _set_error() is set under a dma_fence locked section or not, because
> > the concurrency is addressed at a higher level. =20
>=20
> That whole approach won't work. You have at least the IRQ handler which s=
ignals completion and the timeout handler which signals completion with an =
error.

=46rom a pure rust standpoint, and assuming both path (IRQ handler and
timeout handler) are written in rust, the compiler won't let you signal
concurrently if we design the thing properly, that's what I'm trying to
say. Just to be clear, it doesn't mean you can't have one worker (in a
workqueue context) that can signal a fence and an IRQ handler that can
signal the same fence. It just means that rust won't let you do that
unless you have proper locking in place, and rust will also guarantee
you won't be able to signal a fence that has already been signaled,
because as soon as it's signaled, the signal-able fence should be
consumed.


>=20
> We have documented that this handling is mandatory for DMA-fences since s=
o many driver implementations got it wrong.

Again, I'm just talking about the rust implementation we're aiming for.
If you start mixing C and rust in the same driver, you're back to the
original problem you described.

>=20
> That's why Philips patch set removed the return value from dma_fence_sign=
al().

I don't mind that. Just saying that's hopefully a non-issue in the rust
abstraction.
