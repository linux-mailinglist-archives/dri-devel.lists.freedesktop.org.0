Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KvrDledqWnGAwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:12:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B153D2143FA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A34A10EC43;
	Thu,  5 Mar 2026 15:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EGQHb4pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5838210E29B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772723536;
 bh=TuSmxigncRi5Aie6x80c86pV/pzV2RaUHjdWxPQeWgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EGQHb4pvyaZo7VjGMSSGlT26eleAFfnSROyxZqpJoeIv/w2CqfJ1psani9VWKjaM+
 LwXTuyfCLGphK8DU5cU0b8LyODs1UgZaa6nWT4+xetRio0Il+gwjM4o3K8W75bSjmm
 uBN75hTSxPZKwjFT1lgAuSO2VDBMG6O6m092SYn8v+ioSSlY+PU6ovttK9A2VTFOhc
 r8YyUGgLjwfZavsbutauwcbR82Yaz09X1ZaefoOsalUrMazm4yD5RPcOz5ZqEsBeEB
 sHl0IEvPJFsFBiQN69DtBrcwPkShyByHIvMGnAI8z3ZxQNibO703TQ8xc+C3CwNB48
 zveufxc/iPsjg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C32917E0DC0;
 Thu,  5 Mar 2026 16:12:16 +0100 (CET)
Date: Thu, 5 Mar 2026 16:12:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, dakr@kernel.org, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: dma_fence: force users to take the lock manually
Message-ID: <20260305161212.7dfbadbd@fedora>
In-Reply-To: <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
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
X-Rspamd-Queue-Id: B153D2143FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:url,collabora.com:dkim]
X-Rspamd-Action: no action

Hi,

On Thu, 5 Mar 2026 14:59:02 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/5/26 14:54, Philipp Stanner wrote:
> > Yo Christian,
> >=20
> > a while ago we were discussing this problem
> >=20
> > dma_fence_set_error(f, -ECANCELED);

If you really have two concurrent threads setting the error, this part
is racy, though I can't think of any situation where concurrent
signaling of a set of fences wouldn't be protected by another external
lock.

> > dma_fence_signal(f); // racy!

This is not racy because dma_fence_signal() takes/releases the
lock internally. Besides, calling dma_fence_signal() on an already
signaled fence is considered an invalid pattern if I trust the -EINVAL
returned here[1].

> >=20
> >=20
> > I think you mentioned that you are considering to redesign the
> > dma_fence API so that users have to take the lock themselves to touch
> > the fence:
> >=20
> > dma_fence_lock(f);
> > dma_fence_set_error(f, -ECANCELED);
> > dma_fence_signal(f);

I guess you mean dma_fence_signal_locked().

> > dme_fence_unlock(f);
> >=20
> >=20
> > Is that still up to date? Is there work in progress about that? =20
>=20
> It's on my "maybe if I ever have time for that" list, but yeah I think it=
 would be really nice to have and a great cleanup.
>=20
> We have a bunch of different functions which provide both a _locked() and=
 _unlocked() variant just because callers where to lazy to lock the fence.
>=20
> Especially the dma_fence_signal function is overloaded 4 (!) times with l=
ocked/unlocked and with and without timestamp functions.
>=20
> > I discovered that I might need / want that for the Rust abstractions. =
=20
>=20
> Well my educated guess is for Rust you only want the locked function and =
never allow callers to be lazy.

I don't think we have an immediate need for manual locking in rust
drivers (no signaling done under an already dma_fence-locked section
that I can think of), especially after the inline_lock you've
introduced. Now, I don't think it matters if only the _locked() variant
is exposed and the rust code is expected to acquire/release the lock
manually, all I'm saying is that we probably don't need that in drivers
(might be different if we start implementing fence containers like
arrays and chain in rust, but I don't think we have an immediate need
for that).

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma-buf/dma-fenc=
e.c#L375
