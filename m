Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7395CA9AEEB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFFE10E7E1;
	Thu, 24 Apr 2025 13:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UKBU989q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5704510E7E1;
 Thu, 24 Apr 2025 13:26:06 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZjxYz24PCz9spL;
 Thu, 24 Apr 2025 15:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745501159; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKyBAXY4h0YZsHpQmmZLPNawFEm0LQITaKXAZVu5Xr0=;
 b=UKBU989qA9gUKlvGOsr9ynylYvx1uO/wprmjoclW9BEwCSjjnVmmzjDZUhQBCVaT4QnCnC
 ORbl7bU/cf7Sbv3DdAEusQ/Ji5TVyFKQbR+TgqmM/xb1qzLwCn8wLafBuXtO8L/XSkc1g7
 PYX5tJXmg20m7l40mM7lBqlYnujts51Kit0lxgkYjH34Nx7wiEo2E0RFvF5yfQ7rkH2Iym
 r8LTboTaanJ2Gj816s2yLjyn/1AUgiptWr+FtjdfO6LoxkOfUkTvkh+y2VsBXQrYUayJ0a
 NdKC0HKKnrJFuy9+Q4wMRZwklxvHET0IOGPRE0lxHXItxnVcKVwL6iB3MpwUlQ==
Message-ID: <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 24 Apr 2025 15:25:55 +0200
In-Reply-To: <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
 <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 4sjhmd8518k1j7h9y85ob19dku96umzr
X-MBO-RS-ID: 26ac357924729e237f5
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

On Thu, 2025-04-24 at 15:24 +0200, Danilo Krummrich wrote:
> On 4/24/25 3:02 PM, Philipp Stanner wrote:
> > In nouveau_fence_done(), a fence is checked for being signaled by
> > manually evaluating the base fence's bits. This can be done in a
> > canonical manner through dma_fence_is_signaled().
> >=20
> > Replace the bit-check with dma_fence_is_signaled().
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index fb9811938c82..d5654e26d5bc 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > =C2=A0=C2=A0	struct nouveau_channel *chan;
> > =C2=A0=C2=A0	unsigned long flags;
> > =C2=A0=20
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >base.flags))
> > +	if (dma_fence_is_signaled(&fence->base))
>=20
> This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix
> WARN_ON in
> nouveau_fence_context_kill()") from drm-misc-fixes, correct?

Yup. Otherwise, this series can't be merged anyways, because patch 1
depends on it.

The cover letter says so: "This series is based on this partially
merged series: [1]"

P.
