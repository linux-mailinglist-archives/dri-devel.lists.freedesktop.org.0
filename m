Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAGBHpVPi2nwTwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:32:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C076F11C7BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67D410E5AB;
	Tue, 10 Feb 2026 15:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OphNlpF1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5B10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 15:32:31 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f9QY85d9Sz9ts8;
 Tue, 10 Feb 2026 16:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770737548; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=staZQIfH/ASxhFTdkjcOU2OzLr3jbARaFOTjsFyEe10=;
 b=OphNlpF1Vzw2uzwegJhIGyqayp1W02AwExy56kUgniVrsh8zHVXR5ZcG2bTLKv+7lLbvYe
 nKPdpc1hnNTRsaYHpEi+8s7S/ORwGxrjK8zKE28gGV0A1yKLaqqf4FJLMnTkIw98UJUlva
 mVgp/ouf2QtFTkCo9af+nR13CfU+hpMKNSJsNGF0FJzsVZOt+MBlfVoGqm6ggBIn5EZkpC
 It3T/xIvfkwyMxqhy37QhVC8tTlI1hcnmPxMcAJ6+iYc0vwLR7lGZjG4srbX2c6IcEzMEF
 FS++PS7RdO6oWrcZ7VIk6SX3pZIUTKdJIQqoE07bo+KZ76r3bc3PacRvbHCLQQ==
Message-ID: <a8cf272158df69dbb3c856d8be248d525dc0a4c6.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Tue, 10 Feb 2026 16:32:24 +0100
In-Reply-To: <c1d4ad2a-44a0-4c04-b0b4-94d6242d4ae8@amd.com>
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <fe2f97ae271116e7544be778a1d1aaace529dfec.camel@mailbox.org>
 <c1d4ad2a-44a0-4c04-b0b4-94d6242d4ae8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 19ac6d7de926b2b2b1b
X-MBO-RS-META: o8uiqnehunrewa5d93dwtxp3e63r1mgo
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: C076F11C7BB
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 15:06 +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 15:00, Philipp Stanner wrote:
> > On Tue, 2026-02-10 at 14:56 +0100, Christian K=C3=B6nig wrote:
> > > On 2/10/26 14:49, Alice Ryhl wrote:
> > > > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> > > > > On Tue, 10 Feb 2026 13:15:31 +0000
> > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > >=20
> > > > >=20
> > > > >=20
> >=20
> > [=E2=80=A6]
> >=20
> > > > > I mean, the timeout handler should also be considered a DMA-signa=
lling
> > > > > path, and the same rules should apply to it.
> > > >=20
> > > > I guess that's fair. Even with a timeout you want both to be signal=
ling
> > > > path.
> > > >=20
> > > > I guess more generally, if a fence is signalled by mechanism A or B=
,
> > > > whichever happens first, you have the choice between:
> > >=20
> > > That doesn't happen in practice.
> > >=20
> > > For each fence you only have one signaling path you need to guarantee=
 forward progress for.
> > >=20
> > > All other signaling paths are just opportunistically optimizations wh=
ich *can* signal the fence, but there is no guarantee that they will.
> >=20
> > Are you now referring to the fast-path callbacks like fence->ops-
> > > is_signaled()? Or are you talking about different reference holders
> > which might want to signal?
>=20
> Yes, I'm referring to the is_signaled() callback.
>=20
> When you have multiple reference holders which can all signal the fence b=
y calling dma_fence_signal then there is clearly something going wrong.

From our previous discussions it always seemed to me that there is
already something wrong when is_signaled() fastpaths are being
utilized. Remember the mess we have in Nouveau because of that?

I agree that it sounds very sane to just have 1 party that can signal a
fence.

However, that also implies that the fastpath is wrong because

a) a consumer of a fence can use that to poll on the fence and
b) because it breaks good naming pattern, where a check whether a fence
is signaled can result in the fence being signaled.

So I would kill that fast path for good.

In the past you mentioned that you had users who were wondering why
there fences are not signalling (like yeah, if you don't call
dma_fence_signal(), then your fence will not signal). What ever the
confusion was, this time we have the chance to set it straight.

P.
