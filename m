Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E7BEFDF2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C210E26E;
	Mon, 20 Oct 2025 08:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hJhEqsul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DB710E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:16:35 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cqpDG2hBnz9vCS;
 Mon, 20 Oct 2025 10:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760948190; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHkUF9I8XPrkEDAfHoooluy54np847b+w31rMFkELbM=;
 b=hJhEqsuldMq9F4+1DoaoG5GwLSPM/6KpRsZBoOv5/BBP96tFIoYNuNosrajwkVuD/GMhFn
 N7aPlAnMJBYdyoCLgOwT4l70TjzQ9ZYbUFxdaGzftZeCIQeASja27Z3zrpka0GsSYzQl0U
 C4Lz9qEeguC07xDScQ/tQBb1f+w1lW9R9A3VhUzCmQ0WyJQj0++H6M51AumQlWM5xuwgfd
 +xLD+wdrMR/+LqNIPP9p8nrt6njleGJVGyX7fBkOlHJJASLYVKvHjZe4s3MFOqq6gWKnXw
 mdT4bHtLgU7ZJGDkfJTzFP7UQBvfHqilLvEyH0gxxWpBUKp0ls06NNJZrKRk8g==
Message-ID: <7b53f502aa0eaee4ffe4350621ddbcbfaafcad06.camel@mailbox.org>
Subject: Re: [RFC PATCH] dma-fence: Remove 64-bit flag
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, tursulin@ursulin.net,
 linux-media@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,  linux-kernel@vger.kernel.org
Date: Mon, 20 Oct 2025 10:16:23 +0200
In-Reply-To: <aPK04r1E7IbAZ9QY@lstrano-desk.jf.intel.com>
References: <20251017093146.169996-2-phasta@kernel.org>
 <aPK04r1E7IbAZ9QY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ckzj76w7pqjppcm86u6bngsnw17nh93a
X-MBO-RS-ID: 9e37c173e6de09cda77
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

On Fri, 2025-10-17 at 14:28 -0700, Matthew Brost wrote:
> On Fri, Oct 17, 2025 at 11:31:47AM +0200, Philipp Stanner wrote:
> > It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
> > since seqno is a u64 everywhere.
> >=20
> > Remove the unneeded flag.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Seems to me that this flag doesn't really do anything anymore?
> >=20
> > I *suspect* that it could be that some drivers pass a u32 to
> > dma_fence_init()? I guess they could be ported, couldn't they.
> >=20
>=20
> Xe uses 32-bit hardware fence sequence numbers=E2=80=94see [1] and [2]. W=
e could
> switch to 64-bit hardware fence sequence numbers, but that would require
> changes on the driver side. If you sent this to our CI, I=E2=80=99m fairl=
y
> certain we=E2=80=99d see a bunch of failures. I suspect this would also b=
reak
> several other drivers.

What exactly breaks? Help me out here; if you pass a u32 for a u64,
doesn't the C standard guarantee that the higher, unused 32 bits will
be 0?

Because the only thing the flag still does is do this lower_32 check in
fence_is_later.

P.

>=20
> As I mentioned, all Xe-supported platforms could be updated since their
> rings support 64-bit store instructions. However, I suspect that very
> old i915 platforms don=E2=80=99t support such instructions in the ring. I=
 agree
> this is a legacy issue, and we should probably use 64-bit sequence
> numbers in Xe. But again, platforms and drivers that are decades old
> might break as a result.
>=20
> Matt
>=20
> [1] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe=
_hw_fence.c#L264
> [2] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe=
_hw_fence_types.h#L51
>=20
> > P.
> > ---
> > =C2=A0drivers/dma-buf/dma-fence.c |=C2=A0 3 +--
> > =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 | 10 +---------
> > =C2=A02 files changed, 2 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 3f78c56b58dc..24794c027813 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -1078,8 +1078,7 @@ void
> > =C2=A0dma_fence_init64(struct dma_fence *fence, const struct dma_fence_=
ops *ops,
> > =C2=A0		 spinlock_t *lock, u64 context, u64 seqno)
> > =C2=A0{
> > -	__dma_fence_init(fence, ops, lock, context, seqno,
> > -			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
> > +	__dma_fence_init(fence, ops, lock, context, seqno, 0);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(dma_fence_init64);
> > =C2=A0
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 64639e104110..4eca2db28625 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -98,7 +98,6 @@ struct dma_fence {
> > =C2=A0};
> > =C2=A0
> > =C2=A0enum dma_fence_flag_bits {
> > -	DMA_FENCE_FLAG_SEQNO64_BIT,
> > =C2=A0	DMA_FENCE_FLAG_SIGNALED_BIT,
> > =C2=A0	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> > =C2=A0	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> > @@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
> > =C2=A0 */
> > =C2=A0static inline bool __dma_fence_is_later(struct dma_fence *fence, =
u64 f1, u64 f2)
> > =C2=A0{
> > -	/* This is for backward compatibility with drivers which can only han=
dle
> > -	 * 32bit sequence numbers. Use a 64bit compare when the driver says t=
o
> > -	 * do so.
> > -	 */
> > -	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
> > -		return f1 > f2;
> > -
> > -	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> > +	return f1 > f2;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > --=20
> > 2.49.0
> >=20

