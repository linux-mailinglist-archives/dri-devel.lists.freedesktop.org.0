Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFN1Ka+YiWmk/QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:19:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6710CDD8
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 09:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C607010E338;
	Mon,  9 Feb 2026 08:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IuRTF/pC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DE910E338
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:19:55 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f8d0R5VL4z9tWy;
 Mon,  9 Feb 2026 09:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770625191; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smzVsyxdwRXKIXKq6sMRkFmH+uR9PMBvUmQtPEwEyDs=;
 b=IuRTF/pCVt+GjI04jKHTG2lGXtrOR70tiEFYdmqWYc3P3jB2Fi1ErXKQQJ+Avy1xRpkJQD
 qa6u0tBzwP+N/B8o3BZsKHNcFMPsQSFVwge01IMTUqxpUHFNeBGmMKaegkhiQSxQzD0b+l
 E01ZgPqQ3yZm2/ZA2jQVna5G7h55xy4yNE+U9mu0HWn8a0pehPGhdLVT7bnPXZWIKs7U+5
 Q4+ZSRYYTQZ7vllcYaEbjvrG7WDWtnfmJfE++Zd4TwJsthWknG5hjwBeK/uaI6tR12OthC
 V0MMsAgKzBHVQMbt+Drf7D91ZC4S7+YZO3oZmC0MYCpoZDmU9dISnSD6fA8eiA==
Message-ID: <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Mon, 09 Feb 2026 09:19:46 +0100
In-Reply-To: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 8tun1zz3swrmw6s7exaf5jqmihwi9zxt
X-MBO-RS-ID: f88b550d4582869a55f
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 04D6710CDD8
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:
> > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> > Unfortunately, I don't know how to translate that in rust, but we
> > need a way to check if any path code path does a DmaFence.signal(),
> > go back to the entry point (for a WorkItem, that would be
> > WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> > Not only that, but we need to know all the deps that make it so
> > this path can be called (if I take the WorkItem example, that would
> > be the path that leads to the WorkItem being scheduled).
>=20
> I think we need a guard object for this that is not Send, just like for a=
ny
> other lock.
>=20
> Internally, those markers rely on lockdep, i.e. they just acquire and rel=
ease a
> "fake" lock.

The guard object would be created through fence.begin_signalling(), wouldn'=
t it?
And when it drops you call dma_fence_end_signalling()?

How would that ensure that the driver actually marks the signalling region =
correctly?


P.
