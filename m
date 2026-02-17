Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOrdBwZ7lGkfFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:28:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F514D256
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B0510E268;
	Tue, 17 Feb 2026 14:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bh70sLz5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C6610E268
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 14:28:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fFhnl2XwTz9tbt;
 Tue, 17 Feb 2026 15:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771338491; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SiSfaai5dqaHVvhyXUsMfwv/vemO9ESJyWnheNucudM=;
 b=bh70sLz5KEtCmmh+t2y9XDwbQnmAbbGSdWHB9FqqgGpx7BeXS7/r41o8fsLBEolmQudoNv
 4XMzQLTrs1MRLxr9ulm4BjGAip9UIRL1gxkaDcP1tCHgejea11Nm38eAqQOGIW8GY+vsKi
 BUhUPZs8c50OCgjZ0i6mo8rD61hVA58zSVo6gYTWIWtt9h5t68swMWIxHO1MzygywBSeWr
 DNwntQL6zDR2h2au2fHVa275RVND/sNZ9z0b6+HW7xHwfCg7irWjcK5L2rsjVpE0lI0329
 FXNvB7n8V1Ooap3QQxQJx7wwn8jrTncxQ4pFCVmKKNhIVXycTolObu7Y6CZy3A==
Message-ID: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alice
 Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Tue, 17 Feb 2026 15:28:06 +0100
In-Reply-To: <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: insqg7msr1pqifbtx1fxfiofomnfrcjw
X-MBO-RS-ID: 5ba47365cb9498a8e0a
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:aliceryhl@google.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E1F514D256
X-Rspamd-Action: no action

On Tue, 2026-02-17 at 15:22 +0100, Christian K=C3=B6nig wrote:
> On 2/17/26 15:09, Alice Ryhl wrote:
> > On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mailbox=
.org> wrote:
> > > > > >=20
> > > > > >=20

[=E2=80=A6]

> > > > > > Thinking more about it you should probably enforce that there i=
s only
> > > > > > one signaling path for each fence signaling.
> > > > >=20
> > > > > I'm not really convinced by this.
> > > > >=20
> > > > > First, the timeout path must be a fence signalling path because t=
he
> > > > > reason you have a timeout in the first place is because the hw mi=
ght
> > > > > never signal the fence. So if the timeout path deadlocks on a
> > > > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you up,=
 boom.
> > > >=20
> > > > Mhm, good point. On the other hand the timeout handling should prob=
ably be considered part of the normal signaling path.
> > >=20
> > >=20
> > > Why would anyone want to allocate in a timeout path in the first plac=
e =E2=80=93 especially for jobqueue?
> > >=20
> > > Timeout -> close the associated ring. Done.
> > > JobQueue will signal the done_fences with -ECANCELED.
> > >=20
> > > What would the driver want to allocate in its timeout path, i.e.: tim=
eout callback.
> >=20
> > Maybe you need an allocation to hold the struct delayed_work_struct
> > field that you use to enqueue the timeout?
>=20
> And the workqueue were you schedule the delayed_work on must have the rec=
laim bit set.
>=20
> Otherwise it can be that the workqueue finds all kthreads busy and tries =
to start a new one, e.g. allocating task structure......

OK, maybe I'm lost, but what delayed_work?

The jobqueue's delayed work item gets either created on JQ::new() or in
jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=93 i=
mplement a
delayed work in its timeout callback?

That doesn't make sense.

JQ notifies the driver from its delayed_work through
timeout_callback(), and in that callback the driver closes the
associated firmware ring.

And it drops the JQ. So it is gone. A new JQ will get a new timeout
work item.

That's basically all the driver must ever do. Maybe some logging and
stuff.

With firmware scheduling it should really be that simple.

And signalling / notifying userspace gets done by jobqueue.

Right?

>=20
> You also potentially want device core dumps. Those usually use GFP_NOWAIT=
 so that they can't cycle back and wait for some fence. The down side is th=
at they can trivially fail under even light memory pressure.

Simply logging into dmesg should do the trick, shouldn't it?


P.
