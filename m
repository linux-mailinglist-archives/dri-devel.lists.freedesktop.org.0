Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGHRMy72iWl7FAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:58:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806D1114F9
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558C310E415;
	Mon,  9 Feb 2026 14:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GpB2RZAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2310E420
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770649128;
 bh=UhHGbo2o5nhkn2rj/Bhqu3+jXS+MqUHIC2qBNSWcUcE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GpB2RZAi5I+r5P9VmYjqN9c5+tDOwUSmpc3S34r/kS2xrkHsdntQyuD84KkuRRQhv
 LhaCiu7GZSjuD08D5Hhjrw0e4gidJXcB/Y6Lur6EFqrO7vWnPjaM+U/xPge+0rI7iP
 n99pEJUS347UtuqVnPZqwbzT65/yBVpAUZbVEKuZ9mhRUUQD4FAUoMUivNrDw+9BFt
 IOznpeEoSHd9wPOl07Z0+PgKulF9A8OClNf3/50tV3KGlQTwds0rJYSoh7zRjtD0iu
 UtthqJPCNphKARXLIK1mlXioe4zG3kE/dtdIEAvKIFyFVJU0DehNfuBnziQPtqsXe7
 Ojc5clpKf006g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 87D1417E13D5;
 Mon,  9 Feb 2026 15:58:47 +0100 (CET)
Date: Mon, 9 Feb 2026 15:58:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alice Ryhl
 <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260209155843.725dcfe1@fedora>
In-Reply-To: <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org>
 <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 2806D1114F9
X-Rspamd-Action: no action

On Mon, 09 Feb 2026 09:19:46 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> > On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote: =20
> > > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > > Philipp Stanner <phasta@kernel.org> wrote:
> > > Unfortunately, I don't know how to translate that in rust, but we
> > > need a way to check if any path code path does a DmaFence.signal(),
> > > go back to the entry point (for a WorkItem, that would be
> > > WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> > > Not only that, but we need to know all the deps that make it so
> > > this path can be called (if I take the WorkItem example, that would
> > > be the path that leads to the WorkItem being scheduled). =20
> >=20
> > I think we need a guard object for this that is not Send, just like for=
 any
> > other lock.
> >=20
> > Internally, those markers rely on lockdep, i.e. they just acquire and r=
elease a
> > "fake" lock. =20
>=20
> The guard object would be created through fence.begin_signalling(), would=
n't it?

It shouldn't be a (&self)-method, because at the start of a DMA
signaling path, you don't necessarily know which fence you're going to
signal (you might actually signal several of them).

> And when it drops you call dma_fence_end_signalling()?

Yep, dma_fence_end_signalling() should be called when the guard is
dropped.

>=20
> How would that ensure that the driver actually marks the signalling regio=
n correctly?

Nothing, and that's a problem we have in C: you have no way of telling
which code section is going to be a DMA-signaling path. I can't think
of any way to make that safer in rust, unfortunately. The best I can
think of would be to

- Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
  constraints) that's designed for DMA-fence signaling, and that takes
  the DmaSignaling guard around the ::run() call.
- We would then need to ensure that any code path scheduling this work
  item is also in a DMA-signaling path by taking a ref to the
  DmaSignalingGuard. This of course doesn't guarantee that the section
  is wide enough to prevent any non-authorized operations in any path
  leading to this WorkItem scheduling, but it would at least force the
  caller to consider the problem.
