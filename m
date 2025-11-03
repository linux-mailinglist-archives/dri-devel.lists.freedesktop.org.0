Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96245C2BF4D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 14:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077F010E3E3;
	Mon,  3 Nov 2025 13:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="CfKCabFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD7410E3E3;
 Mon,  3 Nov 2025 13:07:11 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0X182f9Cz9t9R;
 Mon,  3 Nov 2025 14:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762175228; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZrgtRXQ5F/QF5D3Aad2k+HisoK3e/7+em+PotJDD6Y=;
 b=CfKCabFWZceRBak15YW6S5/GDQqRk9FaaJUHdU8shGpykzmkOzMbO93d5r/XGCmXlvsSje
 pYrKxGHe6IMT32ZUGP0Oi4SXopDl2Nh0fcXnfWNLe8y6n/bnbaB00a+BIp4+m1MLFsqCn0
 WWudxreSOx/c5QrKL6J958lXlBBggTXfvk6cMl0udruMDBAI4eCUVWnh1H0WiMa68BsA5C
 xqeAAieHhWTgjCdAbP0XiDci1+5wdAjuBxbw3NgA0DxZJCdcsqvMBwTJ5Dkqt1QkK+d27y
 Gi7lnnyDACkH+p1R5wM1gXQqeMaWeZ5xTlxTD4ZmBZ+HQgmeWCxsqQ3bsAfSzw==
Message-ID: <28db478040c23a237e859d288993208aee29cbc8.camel@mailbox.org>
Subject: Re: [PATCH 05/15] dma-buf: inline spinlock for fence protection
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexdeucher@gmail.com,  simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Mon, 03 Nov 2025 14:07:06 +0100
In-Reply-To: <17248bf5-39d6-44df-a2f3-f832abe48fcd@ursulin.net>
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-6-christian.koenig@amd.com>
 <17248bf5-39d6-44df-a2f3-f832abe48fcd@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ktru3utfo8rx711xcbkgf9y93xxf34yy
X-MBO-RS-ID: 781005a68abad6874d2
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

On Thu, 2025-10-16 at 10:26 +0100, Tvrtko Ursulin wrote:
>=20
> Hi Christian,
>=20
> Only some preliminary comments while I am building a complete picture.
>=20
> On 13/10/2025 14:48, Christian K=C3=B6nig wrote:
> > Allow implementations to not give a spinlock to protect the fence
> > internal state, instead a spinlock embedded into the fence structure
> > itself is used in this case.
> >=20
> > Apart from simplifying the handling for containers and the stub fence
> > this has the advantage of allowing implementations to issue fences
> > without caring about theit spinlock lifetime.
> >=20
> > That in turn is necessary for independent fences who outlive the module
> > who originally issued them.

I like the overall idea and think that separate locks will help me with
Rust dma_fence, where I also had begun to investigate the issue of
module unload vs backend_ops.

> >=20
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >=20

[=E2=80=A6]

> > =C2=A0=20
> > =C2=A0 static inline struct sync_timeline *dma_fence_parent(struct dma_=
fence *fence)
> > =C2=A0 {
> > -	return container_of(fence->lock, struct sync_timeline, lock);
> > +	return container_of(fence->extern_lock, struct sync_timeline, lock);
>=20
> These container_ofs are a bit annoying. Maybe even a bit fragile if=20
> someone switches to embedded lock and forgets to update them all.
>=20
> Would prep patch to first replace them with some dma_fence_container_of=
=20
> wrapper make sense?=C2=A0
>=20

+1, would be a nice change.

It's not related to the series, though, so should be done in an
independent patch (IMO).

> Then it could even have a (debug builds only) assert=20
> added to check for correct usage.
>=20
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ring.c
> >=20
> >=20

[=E2=80=A6]

> > =C2=A0=C2=A0 *
> > + * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of ext=
ernal one
> > =C2=A0=C2=A0 * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
> > =C2=A0=C2=A0 * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fe=
nce signaling
> > =C2=A0=C2=A0 * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling migh=
t have been called
> > @@ -65,7 +67,10 @@ struct seq_file;
> > =C2=A0=C2=A0 * been completed, or never called at all.
> > =C2=A0=C2=A0 */
> > =C2=A0 struct dma_fence {
> > -	spinlock_t *lock;
> > +	union {
> > +		spinlock_t *extern_lock;
> > +		spinlock_t inline_lock;
>=20
> This will grow the struct on some architectures so I think, given the
> strong push back to struct past a 64B cacheline in the past, it should=
=20
> be called out in the commit message.

+1

Although: Christian, you told me at XDC that you did some exact
measurements about the new vs old cache line size. Can you help out my
memory here, what were those sizes?


P.

