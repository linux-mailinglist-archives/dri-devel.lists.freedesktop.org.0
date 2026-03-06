Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB0CMJGiqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:46:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E721E2EA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2710ECBD;
	Fri,  6 Mar 2026 09:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c/FyP1V4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059FA10ECBD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772790410;
 bh=QAtCE/pL0pMwhtTUOJrkHeO63UhEHHEDrhMZhGQWJwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c/FyP1V4jwhUDAxvZTkDNgu0NNCdC2cjzF43eS2JfNjuI7zfw6a5VNt9sbEh6pSr4
 8b97xZMbGlxWySHKFzaUDzhftFvjUmXTHHCnY48nqEjWGQwxhcy+gBtWYZYcEty2pt
 jVD1B8+ZwuMIbmQ/ytxGhb1A6LuoTvy34nQu+V31DtmOT9bXll9MXrIL4GEhjtjY45
 v5g/Gmu7C3eNY6kfp+7+mFBLmBIRqftyHTIszmMABARFwraXaY35EXJbsQVGu0cKnx
 lqETETSptAceGMR41oHeRLmmu0c5EV9KgvN962G/SRPJO3KksT82dMyCv40k/8vFpG
 YLg4G5xGFe2TQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A71B217E04DC;
 Fri,  6 Mar 2026 10:46:50 +0100 (CET)
Date: Fri, 6 Mar 2026 10:46:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260306104646.36319162@fedora>
In-Reply-To: <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
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
X-Rspamd-Queue-Id: 214E721E2EA
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

On Fri, 6 Mar 2026 09:10:52 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/5/26 16:12, Boris Brezillon wrote:
> > Hi,
> >=20
> > On Thu, 5 Mar 2026 14:59:02 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >  =20
> >> On 3/5/26 14:54, Philipp Stanner wrote: =20
> >>> Yo Christian,
> >>>
> >>> a while ago we were discussing this problem
> >>>
> >>> dma_fence_set_error(f, -ECANCELED); =20
> >=20
> > If you really have two concurrent threads setting the error, this part
> > is racy, though I can't think of any situation where concurrent
> > signaling of a set of fences wouldn't be protected by another external
> > lock. =20
>=20
> This is actually massively problematic and the reason why we have the WAR=
N_ON in dma_fence_set_error().
>=20
> What drivers usually do is to disable the normal signaling path, e.g. tur=
n off interrupts for example, and then set and error and signal the fence m=
anually.
>=20
> The problem is that this has a *huge* potential for being racy, for examp=
le when you tell the HW to not give you an interrupt any more it can always=
 been than interrupt processing has already started but wasn't able yet to =
grab a lock or similar.
>=20
> I think we should start enforcing correct handling and have a lockdep che=
ck in dma_fence_set_error() that the dma_fence lock is hold while calling i=
t.

Sure, I don't mind you dropping the non-locked variants and forcing
users to lock around set_error() + signal().

>=20
> >>> dma_fence_signal(f); // racy! =20
> >=20
> > This is not racy because dma_fence_signal() takes/releases the
> > lock internally. Besides, calling dma_fence_signal() on an already
> > signaled fence is considered an invalid pattern if I trust the -EINVAL
> > returned here[1]. =20
>=20
> No, that is also something we want to remove. IIRC Philip proposed some p=
atches to clean that up already.

What do you mean? You want dma_fence_signal_locked() (or the variants
of it) to not return an error when the fence is already signaled, or
you want to prevent this double-signal from happening. The plan for the
rust abstraction is to do the latter.

>=20
> >>>
> >>>
> >>> I think you mentioned that you are considering to redesign the
> >>> dma_fence API so that users have to take the lock themselves to touch
> >>> the fence:
> >>>
> >>> dma_fence_lock(f);
> >>> dma_fence_set_error(f, -ECANCELED);
> >>> dma_fence_signal(f); =20
> >=20
> > I guess you mean dma_fence_signal_locked().
> >  =20
> >>> dme_fence_unlock(f);
> >>>
> >>>
> >>> Is that still up to date? Is there work in progress about that?   =20
> >>
> >> It's on my "maybe if I ever have time for that" list, but yeah I think=
 it would be really nice to have and a great cleanup.
> >>
> >> We have a bunch of different functions which provide both a _locked() =
and _unlocked() variant just because callers where to lazy to lock the fenc=
e.
> >>
> >> Especially the dma_fence_signal function is overloaded 4 (!) times wit=
h locked/unlocked and with and without timestamp functions.
> >> =20
> >>> I discovered that I might need / want that for the Rust abstractions.=
   =20
> >>
> >> Well my educated guess is for Rust you only want the locked function a=
nd never allow callers to be lazy. =20
> >=20
> > I don't think we have an immediate need for manual locking in rust
> > drivers (no signaling done under an already dma_fence-locked section
> > that I can think of), especially after the inline_lock you've
> > introduced. Now, I don't think it matters if only the _locked() variant
> > is exposed and the rust code is expected to acquire/release the lock
> > manually, all I'm saying is that we probably don't need that in drivers
> > (might be different if we start implementing fence containers like
> > arrays and chain in rust, but I don't think we have an immediate need
> > for that). =20
>=20
> Well as I wrote above you either have super reliable locking in your sign=
aling path or you will need that for error handling.

Not really. With rust's ownership model, you can make it so only one
thread gets to own the DriverFence (the signal-able fence object), and
the DriverFence::signal() method consumes this object. This implies
that only one path gets to signal the DriverFence, and after that it
vanishes, so no one else can signal it anymore. Just to clarify, by
vanishes, I mean that the signal-able view disappears, but the
observable object (Fence) can stay around, so it can be monitored (and
only monitored) by others. With this model, it doesn't matter that
_set_error() is set under a dma_fence locked section or not, because
the concurrency is addressed at a higher level.

Again, I'm not saying the changes Christian and you have been
discussing are pointless (they might help with the C implementations to
get things right), I'm just saying it's not strictly needed for the rust
abstraction, that's all.
