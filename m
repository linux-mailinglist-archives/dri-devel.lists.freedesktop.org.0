Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAX+LCWZlWk1SgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 11:49:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EE0155A4B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 11:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8113C10E59E;
	Wed, 18 Feb 2026 10:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mn8l8tOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97FE10E5AA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771411742;
 bh=MJa7KX2wOLW1sM9GdtH5QoykicqRBqkifQkrADTpJE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mn8l8tOyUr3BV0oaIHGLl//w32metpSd36lWtKZh0Q1Vh9H07qyV2bO1UgnRL42Wl
 0XDuPVIZMjjqAuYaSObGugE2f4D790bczGuqg7J+Vq6GYxvzFtPnfhFtm94PX4O9V5
 Zg9ZdItxJx2SlgK3M8BKBehX7hOP8/0lBwXQXkfxqistygRHLhx6EWvW4oISCXLdre
 ar4qzHHvnssf5FTmzR8SVWo7kp3CL5KMf5AREe6+GqbcryKn7Fki12fxrlVMp3FBjx
 s6zxzaCLOiKM8+/9oq75ropwb3NJROUcYmPOq6v8uI5aop1VE6197atCJq+NPpOoi/
 YrM/GHft2LDHw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E1E5A17E1553;
 Wed, 18 Feb 2026 11:49:01 +0100 (CET)
Date: Wed, 18 Feb 2026 11:48:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: phasta@kernel.org, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gary Guo
 <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260218114857.65f9dd84@fedora>
In-Reply-To: <aZWLgObIwWVaCPkv@google.com>
References: <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
 <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
 <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
 <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
 <aZWLgObIwWVaCPkv@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:christian.koenig@amd.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,gmail.com,ffwll.ch,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 05EE0155A4B
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 09:50:56 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 17, 2026 at 03:28:06PM +0100, Philipp Stanner wrote:
> > On Tue, 2026-02-17 at 15:22 +0100, Christian K=C3=B6nig wrote: =20
> > > On 2/17/26 15:09, Alice Ryhl wrote: =20
> > > > On Tue, Feb 17, 2026 at 3:04=E2=80=AFPM Philipp Stanner <phasta@mai=
lbox.org> wrote: =20
> > > > > > > >=20
> > > > > > > >  =20
> >=20
> > [=E2=80=A6]
> >  =20
> > > > > > > > Thinking more about it you should probably enforce that the=
re is only
> > > > > > > > one signaling path for each fence signaling. =20
> > > > > > >=20
> > > > > > > I'm not really convinced by this.
> > > > > > >=20
> > > > > > > First, the timeout path must be a fence signalling path becau=
se the
> > > > > > > reason you have a timeout in the first place is because the h=
w might
> > > > > > > never signal the fence. So if the timeout path deadlocks on a
> > > > > > > kmalloc(GFP_KERNEL) and the hw never comes around to wake you=
 up, boom. =20
> > > > > >=20
> > > > > > Mhm, good point. On the other hand the timeout handling should =
probably be considered part of the normal signaling path. =20
> > > > >=20
> > > > >=20
> > > > > Why would anyone want to allocate in a timeout path in the first =
place =E2=80=93 especially for jobqueue?
> > > > >=20
> > > > > Timeout -> close the associated ring. Done.
> > > > > JobQueue will signal the done_fences with -ECANCELED.
> > > > >=20
> > > > > What would the driver want to allocate in its timeout path, i.e.:=
 timeout callback. =20
> > > >=20
> > > > Maybe you need an allocation to hold the struct delayed_work_struct
> > > > field that you use to enqueue the timeout? =20
> > >=20
> > > And the workqueue were you schedule the delayed_work on must have the=
 reclaim bit set.
> > >=20
> > > Otherwise it can be that the workqueue finds all kthreads busy and tr=
ies to start a new one, e.g. allocating task structure...... =20
> >=20
> > OK, maybe I'm lost, but what delayed_work?
> >=20
> > The jobqueue's delayed work item gets either created on JQ::new() or in
> > jq.submit_job(). Why would anyone =E2=80=93 that is: any driver =E2=80=
=93 implement a
> > delayed work in its timeout callback?
> >=20
> > That doesn't make sense.
> >=20
> > JQ notifies the driver from its delayed_work through
> > timeout_callback(), and in that callback the driver closes the
> > associated firmware ring.
> >=20
> > And it drops the JQ. So it is gone. A new JQ will get a new timeout
> > work item.
> >=20
> > That's basically all the driver must ever do. Maybe some logging and
> > stuff.
> >=20
> > With firmware scheduling it should really be that simple.
> >=20
> > And signalling / notifying userspace gets done by jobqueue.
> >=20
> > Right? =20
>=20
> What I'm getting at is that a driver author might attempt to implement
> their own timeout logic instead of using the job queue, and if they do,
> they might get it wrong in the way I described.
>=20
> You're correct that they shouldn't do this. But you asked how a driver
> author might get the timeout wrong, and doing it the wrong way is one
> such way they might do it in the wrong way.

Are we back to discussing "how to ensure nothing prohibited happens in
the DMA signalling path?" or is this something else? I mean, I'm
convinced timeout handling should be part of the DMA-signalling path,
no matter if it's in common/well-audited code like JobQueue, or some
custom driver timeout handling (which I'm not advocating for, just to
be clear). As such, I believe we should ensure XxxDmaFence::signal()
(I'm using Xxx because the name of this Signal-able object is still
undecided AFAIK :-)) is called inside a DMA-signalling section. Note
that dma_fence_signal() declares a signalling section before signaling,
so this check would have to be done before calling dma_fence_signal() in
the XxxDmaFence::signal() implementation.

If we go this way, with

- DmaFenceWorkqueue+DmaFenceWork: generic abstractions for DMA-fence
  constrained works
- DmaFenceThreadedHandler: generic abstraction for a DMA-fence
  constrained threaded IRQ handler (raw IRQ handlers are already more
  constrained than the DMA-fence signalling path, so we don't care)
- and potentially other helpers for other kind of deferred signalling

we should be covered.

I believe that covers the case Alice was describing where the driver
allocates a DelayedWork with GFP_KERNEL in a DMA-signalling path, which
is prohibited. So yeah, if a driver decides to go for its own watchdog
implementation signalling all fences manually, it will just be
constrained by the same rules. XxxDmaFence::signal() will yell at you
if you're not in an annotated DMA-fence signalling section, and if you
are and you're doing something prohibited it will also yell at you. The
only way to abuse this is if rust code decides to manually annotate a
section, which we can flag as unsafe to make it clear this is not
something you should play with unless you're well aware of the risks.

Am I missing something?
