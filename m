Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CD9C83E85
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9110E37C;
	Tue, 25 Nov 2025 08:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VU0Tnnas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA5F10E37C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 08:13:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dFwSY13Y4z9stq;
 Tue, 25 Nov 2025 09:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764058429; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DTyfjOQLlqZtEXU84+xhptlPYxXJdG6pHm5CHYR47I=;
 b=VU0TnnasyfJHZJA0H6JLleUSqwwMw1HIGJ4pp/G0Om8mt7NgooJdnNuHsH1VVoPlpMe7WS
 29EPgd8D5VBAwSrjFMg4qYsjERgS4bSzWVGIEPPLOZJQ6FdAieIDYunWlqjhwRCUQWZRXc
 2gv4zXbgll0iETv30P1pZz9TUCqOrgJ//eFN+vcbQS++S+vafxqc5uVKr7cg/MKLqNACXA
 tRNGWxLDYlf8vR/nWtU9Tw7jh9zNIkjBd9veEAsAr3W6Epu9Hf2mlpF/BEQGSS2wUka1Ee
 hw8CKcCSNHCgW+ylWRL+Ql2tBP+y0oKaJW8AU0AJW+SG8RVud6aHR+E+lUedkA==
Message-ID: <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Nov 2025 09:13:45 +0100
In-Reply-To: <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: uoy7696snxohobny3j5j35jjpiz6apoo
X-MBO-RS-ID: b616c6980f2dea44785
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

On Tue, 2025-11-25 at 09:03 +0100, Christian K=C3=B6nig wrote:
> On 11/25/25 08:55, Philipp Stanner wrote:
> > > =C2=A0
> > > +/**
> > > + * define DMA_FENCE_MAX_REASONABLE_TIMEOUT - max reasonable signalin=
g timeout
> > > + *
> > > + * The dma_fence object has a deep inter dependency with core memory
> > > + * management, for a detailed explanation see section DMA Fences und=
er
> > > + * Documentation/driver-api/dma-buf.rst.
> > > + *
> > > + * Because of this all dma_fence implementations must guarantee that=
 each fence
> > > + * completes in a finite time. This define here now gives a reasonab=
le value for
> > > + * the timeout to use. It is possible to use a longer timeout in an
> > > + * implementation but that should taint the kernel.
> > > + */
> > > +#define DMA_FENCE_MAX_REASONABLE_TIMEOUT (2*HZ)
> >=20
> > HZ can change depending on the config. Is that really a good choice? I
> > could see racy situations arising in some configs vs others
>=20
> 2*HZ is always two seconds expressed in number of jiffies, I can use msec=
s_to_jiffies(2000) to make that more obvious.

On AMD64 maybe. What about the other architectures?

>=20
> The GPU scheduler has a very similar define, MAX_WAIT_SCHED_ENTITY_Q_EMPT=
Y which is currently just 1 second.
>=20
> The real question is what is the maximum amount of time we can wait for t=
he HW before we should trigger a timeout?

That's a question only the drivers can answer, which is why I like to
think that setting global constants constraining all parties is not the
right thing to do.

What is even your motivation? What problem does this solve? Is the OOM
killer currently hanging for anyone? Can you link a bug report?

>=20
> Some AMD internal team is pushing for 10 seconds, but that also means tha=
t for example we wait 10 seconds for the OOM killer to do something. That s=
ounds like way to long.
>=20

Nouveau has timeout =3D 10 seconds. AFAIK we've never seen bugs because
of that. Have you seen some?


P.
