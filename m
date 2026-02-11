Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMoGHEpVjGnblAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:09:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F81232D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 11:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D6710E35F;
	Wed, 11 Feb 2026 10:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tRtKIc0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B8B10E35F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 10:09:06 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9vKV3Yjpz9sQX;
 Wed, 11 Feb 2026 11:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770804542; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEVCh6pKz/bnqK7JQNj4OgLdAcyirEtwdMFUXxgeC/o=;
 b=tRtKIc0Hcxxsd+KjoFbsOzU51z2hp7ajQRuUokDGudMBL97qarHV46d+zB4dAX7vLB0/my
 KCiOSIr0Nt1SyYi72myoR82iFnvqSwz/WTOjsh/ofhCIwn/EJ3EcVSd+rSQ38fFXF6T4WQ
 LY89rlr3SBw6HTwuIlhCh60xwHAJJ81o9Vvo28q5WhzdrhZSNfLCTZks3G2qJOjoCzlf6J
 8CM11lgCwmDroSLsgXHgSiR+N/eB4yNFrD/U6fs6kyRYIgZRkrmibPvSM/3wyLaTH22ATl
 ZM8/+8OV3I42aSh9Z2x6g/HUd2QExL5fYF3MvY4FTcVZ2DBatX6KnJ+dhwslKQ==
Message-ID: <5f777c33469ef5c34467a12609233d72064a9297.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, phasta@kernel.org, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Gary Guo
 <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Date: Wed, 11 Feb 2026 11:08:55 +0100
In-Reply-To: <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ehiawnajzhr1fnkrdkutyo7fb9kaidn4
X-MBO-RS-ID: 96200e600e59c8d4974
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: E96F81232D5
X-Rspamd-Action: no action

On Wed, 2026-02-11 at 10:57 +0100, Danilo Krummrich wrote:
> (Cc: Xe maintainers)
>=20
> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
> > > On 2/10/26 11:36, Danilo Krummrich wrote:
> > > > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
> > > > >=20

[=E2=80=A6]

> > > >=20
> > > > Or in other words, there must be no more than wq->max_active - 1 wo=
rks that
> > > > execute code violating the DMA fence signalling rules.
> >=20
> > Ouch, is that really the best way to do that? Why not two workqueues?
>=20
> Most drivers making use of this re-use the same workqueue for multiple GP=
U
> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship be=
tween
> scheduler and entity). This is equivalent to the JobQ use-case.
>=20
> Note that we will have one JobQ instance per userspace queue, so sharing =
the
> workqueue between JobQ instances can make sense.

Why, what for?

P.
