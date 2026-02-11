Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGIAGyZkjGkFmgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:12:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F0123C3F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6510E56F;
	Wed, 11 Feb 2026 11:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XjGo25O2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2188A10E3AB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770808348;
 bh=AL4gXBUKDvNloYgmDirGwFSPJo0Qc0RUfRg4B9FbWOo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjGo25O2Y7E9uOZRXTw4Sj50pdVL+POGMF5jgV1HpevBvjl5oY/BZ4ec4l95EI3LT
 vlVRbkRR3POk8l9Td4QdSoHcSRwuLu7VcKqwC7f/4YJqdMv8fIYG9spZql770H/0DG
 oyPfThXPCrqgsyxuD1l/GfbRDMCgbUI5DlMahKUt4SOs9YYheOK0K0LEaNX3CwZYe0
 f1/LC8/K7QM73AVLkVoiFMsh3s+og2qnMKln93u/9AYkKqSlLV4HDpTcg2etj3CDU7
 V5BLGVBJVBhn86wcnUYKN/bJMw1TUDm35UZD6DgcAljC5yEQWG9vhFWXDbIToKpd+a
 YIanVP6t6ztMA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 323AA17E1301;
 Wed, 11 Feb 2026 12:12:28 +0100 (CET)
Date: Wed, 11 Feb 2026 12:12:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211121223.78674f22@fedora>
In-Reply-To: <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com>
 <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com>
 <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora>
 <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:aliceryhl@google.com,m:christian.koenig@amd.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,intel.com,linux.intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url]
X-Rspamd-Queue-Id: 2A5F0123C3F
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 12:00:30 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Feb 11, 2026 at 11:20 AM CET, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 10:57:27 +0100
> > "Danilo Krummrich" <dakr@kernel.org> wrote:
> > =20
> >> (Cc: Xe maintainers)
> >>=20
> >> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote: =20
> >> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote=
:   =20
> >> >> On 2/10/26 11:36, Danilo Krummrich wrote:   =20
> >> >> > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:   =20
> >> >> >> One way you can see this is by looking at what we require of the
> >> >> >> workqueue. For all this to work, it's pretty important that we n=
ever
> >> >> >> schedule anything on the workqueue that's not signalling safe, s=
ince
> >> >> >> otherwise you could have a deadlock where the workqueue is execu=
tes some
> >> >> >> random job calling kmalloc(GFP_KERNEL) and then blocks on our fe=
nce,
> >> >> >> meaning that the VM_BIND job never gets scheduled since the work=
queue
> >> >> >> is never freed up. Deadlock.   =20
> >> >> >=20
> >> >> > Yes, I also pointed this out multiple times in the past in the co=
ntext of C GPU
> >> >> > scheduler discussions. It really depends on the workqueue and how=
 it is used.
> >> >> >=20
> >> >> > In the C GPU scheduler the driver can pass its own workqueue to t=
he scheduler,
> >> >> > which means that the driver has to ensure that at least one out o=
f the
> >> >> > wq->max_active works is free for the scheduler to make progress o=
n the
> >> >> > scheduler's run and free job work.
> >> >> >=20
> >> >> > Or in other words, there must be no more than wq->max_active - 1 =
works that
> >> >> > execute code violating the DMA fence signalling rules.   =20
> >> >
> >> > Ouch, is that really the best way to do that? Why not two workqueues=
?   =20
> >>=20
> >> Most drivers making use of this re-use the same workqueue for multiple=
 GPU
> >> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship=
 between
> >> scheduler and entity). This is equivalent to the JobQ use-case.
> >>=20
> >> Note that we will have one JobQ instance per userspace queue, so shari=
ng the
> >> workqueue between JobQ instances can make sense. =20
> >
> > Definitely, but I think that's orthogonal to allowing this common
> > workqueue to be used for work items that don't comply with the
> > dma-fence signalling rules, isn't it? =20
>=20
> Yes and no. If we allow passing around shared WQs without a corresponding=
 type
> abstraction we open the door for drivers to abuse it the schedule their o=
wn
> work.
>=20
> I.e. sharing a workqueue between JobQs is fine, but we have to ensure the=
y can't
> be used for anything else.

Totally agree with that, and that's where I was going with this special
DmaFenceWorkqueue wrapper/abstract, that would only accept
scheduling MaySignalDmaFencesWorkItem objects.

>=20
> >> Besides that, IIRC Xe was re-using the workqueue for something else, b=
ut that
> >> doesn't seem to be the case anymore. I can only find [1], which more s=
eems like
> >> some custom GPU scheduler extention [2] to me... =20
> >
> > Yep, I think it can be the problematic case. It doesn't mean we can't
> > schedule work items that don't signal fences, but I think it'd be
> > simpler if we were forcing those to follow the same rules (no blocking
> > alloc, no locks taken that are also taken in other paths were blocking
> > allocs happen, etc) regardless of this wq->max_active value.
> > =20
> >>=20
> >> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe=
/xe_gpu_scheduler.c#L40
> >> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/xe=
/xe_gpu_scheduler_types.h#L28 =20
>=20

