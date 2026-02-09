Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDHaBy2ZiWmk/QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:22:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38010CDEF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A89410E33C;
	Mon,  9 Feb 2026 08:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tVNzVyTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA910E33A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:21:58 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f8d2q4Wk0z9t14;
 Mon,  9 Feb 2026 09:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770625315; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lh2hDOqMmY3VlX6bcz6dR+je37iAc6ukHMnDnzAz/XI=;
 b=tVNzVyTvbAEqg0gppS54m+KPKqLObTs8+J49s1G9s1GNMuSGNzl/O2CBjtyY6mUzaHrnxk
 YPGtoG/RqknkenlTJL4kB234mTeaMI01gwcyLocrbTIL1cY7ZlCyfZBn/T3ZZuUfS39jil
 YcWhLLI2FtqyF3aQY/XKQzzaguNKakep85yRNJuXglXe1TacKJfDqlRDFgYT6dy2H1g0Bj
 70nAGhYyusUILr9mTdkBKldfETVjGDZuakRJoHKqGf5G+w+UEcwN5VCZJ+ZjJw6zo7iRnm
 p/tDcWUpyIV5sJxHUGWpGuja5HF7JIx+xsHPGpjQBn5e1OdIokw5I84nvk/tDw==
Message-ID: <eca9693146dd9db88a6ea0b8b435d2ef0246ee2e.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin
 <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Mon, 09 Feb 2026 09:21:51 +0100
In-Reply-To: <20260206120442.51c5ca75@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
 <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
 <20260206120442.51c5ca75@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a597269bc5b3dd9e576
X-MBO-RS-META: szqxdtd6c64ssj1yxaxess8he3ar76eq
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:gary@garyguo.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:aliceryhl@google.com,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,ffwll.ch,google.com,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 5A38010CDEF
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 12:04 +0100, Boris Brezillon wrote:
> On Fri, 06 Feb 2026 10:32:38 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20

[=E2=80=A6]

> >=20
> > So I strongly think that we'd either want to drop data: T, or we should
> > think about possibilities to hide it from other drivers.
> >=20
> > I've got currently no idea how that could be addressed in Rust, though=
=20
>=20
> So, as Danilo explained in his reply, there's two kind of users:
>=20
> 1. those that want to wait on fences (that'd be the JobQueue, for
> =C2=A0=C2=A0 instance)
> 2. those that are emitting fences (AKA those implementing the fence_ops
> =C2=A0=C2=A0 in C)
>=20
> And each of them should be given different access to the underlying
> dma_fence, hence the proposal to have different objects to back
> those concepts.


That makes sense and can be implemented. I can pick it up.

P.
