Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLTRG0+kqml6UwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0721E426
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE45410ECCC;
	Fri,  6 Mar 2026 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hMF2ORBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D6C10E165
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:54:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fS1vl6sv9z9tB3;
 Fri,  6 Mar 2026 10:54:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772790852; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYxeAHGCNcB9QifjmP6TyoeBsUiQkxu/tzVxA2fTwWY=;
 b=hMF2ORBVHoOkeBIbUddOjeKOU34bqSoDPAYqVRDOvI/e6EZNZQfxSjVmZKhS0TMmNSz/De
 e02uWJ5zkukiPZfSGHHkH9zKKxWvFG++SKc00kIONJsKiVMwiFuz7S5wCcO5yeIgrd7eK+
 Bfcuy2IZs/g3iq5At2KkZOCD9INMTIBzcieIqhAciLyjXtZvUVlNozfb9mifCjNqkiZhvl
 GZ/0DGhwTe3zhH+8Qx1/DnNn38FitrDy9mtl5+vIIpfQ7ObxMplElfubU305zQi3NEUG/a
 lWl323R1gW97HuyxwtvnsBVQDNopszsdsaHDLUftAx6tcsoHbuM8ThEUMjmlsA==
Message-ID: <1ee2c8a3f8099c619f18f2d08321829642c9ea8e.camel@mailbox.org>
Subject: Re: dma_fence: force users to take the lock manually
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  dri-devel <dri-devel@lists.freedesktop.org>
Date: Fri, 06 Mar 2026 10:54:07 +0100
In-Reply-To: <20260306104646.36319162@fedora>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f3083843a88d72df101
X-MBO-RS-META: uyrng3jk4popir1a839f37j599j7asi5
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
X-Rspamd-Queue-Id: AFE0721E426
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Action: no action

On Fri, 2026-03-06 at 10:46 +0100, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 09:10:52 +0100
> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
>=20
> > On 3/5/26 16:12, Boris Brezillon wrote:
> > > Hi,
> > >=20
> > > On Thu, 5 Mar 2026 14:59:02 +0100
> > > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > > =C2=A0=20
> > > > On 3/5/26 14:54, Philipp Stanner wrote:=C2=A0=20
> > > > > Yo Christian,
> > > > >=20
> > > > > a while ago we were discussing this problem
> > > > >=20
> > > > > dma_fence_set_error(f, -ECANCELED);=C2=A0=20
> > >=20
> > > If you really have two concurrent threads setting the error, this par=
t
> > > is racy, though I can't think of any situation where concurrent
> > > signaling of a set of fences wouldn't be protected by another externa=
l
> > > lock.=C2=A0=20
> >=20
> > This is actually massively problematic and the reason why we have the W=
ARN_ON in dma_fence_set_error().
> >=20
> > What drivers usually do is to disable the normal signaling path, e.g. t=
urn off interrupts for example, and then set and error and signal the fence=
 manually.
> >=20
> > The problem is that this has a *huge* potential for being racy, for exa=
mple when you tell the HW to not give you an interrupt any more it can alwa=
ys been than interrupt processing has already started but wasn't able yet t=
o grab a lock or similar.
> >=20
> > I think we should start enforcing correct handling and have a lockdep c=
heck in dma_fence_set_error() that the dma_fence lock is hold while calling=
 it.
>=20
> Sure, I don't mind you dropping the non-locked variants and forcing
> users to lock around set_error() + signal().
>=20
> >=20
> > > > > dma_fence_signal(f); // racy!=C2=A0=20
> > >=20
> > > This is not racy because dma_fence_signal() takes/releases the
> > > lock internally. Besides, calling dma_fence_signal() on an already
> > > signaled fence is considered an invalid pattern if I trust the -EINVA=
L
> > > returned here[1].=C2=A0=20
> >=20
> > No, that is also something we want to remove. IIRC Philip proposed some=
 patches to clean that up already.
>=20
> What do you mean? You want dma_fence_signal_locked() (or the variants
> of it) to not return an error when the fence is already signaled,
>=20

Yes. That's already implemented:

https://elixir.bootlin.com/linux/v7.0-rc1/source/drivers/dma-buf/dma-fence.=
c#L486


Reason being that
a) no one was ever checking that error code
b) you cannot *prevent* multiple signaling in C anyways
c) it's not even sure AFAICT whether signaling an already signaled
fence is even an error. The function will simply ignore the action.
It's not ideal design, sure, but what's the harm? The most important
fence rule is that fences do get eventually signaled. Firing WARN_ONs
or sth because you try to signal a signaled fence sounds bad to me,
because what's the issue?

>  or
> you want to prevent this double-signal from happening. The plan for the
> rust abstraction is to do the latter.

In Rust we sort of get that for free by having signal() consume the
fence.


>=20
> >=20
> > > > >=20
> > > > >=20
> > > > > I think you mentioned that you are considering to redesign the
> > > > > dma_fence API so that users have to take the lock themselves to t=
ouch
> > > > > the fence:
> > > > >=20
> > > > > dma_fence_lock(f);
> > > > > dma_fence_set_error(f, -ECANCELED);
> > > > > dma_fence_signal(f);=C2=A0=20
> > >=20
> > > I guess you mean dma_fence_signal_locked().
> > > =C2=A0=20
> > > > > dme_fence_unlock(f);
> > > > >=20
> > > > >=20
> > > > > Is that still up to date? Is there work in progress about that?=
=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > It's on my "maybe if I ever have time for that" list, but yeah I th=
ink it would be really nice to have and a great cleanup.
> > > >=20
> > > > We have a bunch of different functions which provide both a _locked=
() and _unlocked() variant just because callers where to lazy to lock the f=
ence.
> > > >=20
> > > > Especially the dma_fence_signal function is overloaded 4 (!) times =
with locked/unlocked and with and without timestamp functions.
> > > > =C2=A0
> > > > > I discovered that I might need / want that for the Rust abstracti=
ons.=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > Well my educated guess is for Rust you only want the locked functio=
n and never allow callers to be lazy.=C2=A0=20
> > >=20
> > > I don't think we have an immediate need for manual locking in rust
> > > drivers (no signaling done under an already dma_fence-locked section
> > > that I can think of), especially after the inline_lock you've
> > > introduced. Now, I don't think it matters if only the _locked() varia=
nt
> > > is exposed and the rust code is expected to acquire/release the lock
> > > manually, all I'm saying is that we probably don't need that in drive=
rs
> > > (might be different if we start implementing fence containers like
> > > arrays and chain in rust, but I don't think we have an immediate need
> > > for that).=C2=A0=20
> >=20
> > Well as I wrote above you either have super reliable locking in your si=
gnaling path or you will need that for error handling.
>=20
> Not really. With rust's ownership model, you can make it so only one
> thread gets to own the DriverFence (the signal-able fence object),
>=20

Not strictly speaking. They can always stuff it into some locked
refcounted container.

>  and
> the DriverFence::signal() method consumes this object. This implies
> that only one path gets to signal the DriverFence, and after that it
> vanishes, so no one else can signal it anymore. Just to clarify, by
> vanishes, I mean that the signal-able view disappears, but the
> observable object (Fence) can stay around, so it can be monitored (and
> only monitored) by others. With this model, it doesn't matter that
> _set_error() is set under a dma_fence locked section or not, because
> the concurrency is addressed at a higher level.
>=20
> Again, I'm not saying the changes Christian and you have been
> discussing are pointless (they might help with the C implementations to
> get things right), I'm just saying it's not strictly needed for the rust
> abstraction, that's all.


Sounds correct to me.


P.

