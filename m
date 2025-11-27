Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9847C8DD67
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE88D10E805;
	Thu, 27 Nov 2025 10:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DQ6kBOsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A0E10E805;
 Thu, 27 Nov 2025 10:50:17 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHCr556Cfz9vNH;
 Thu, 27 Nov 2025 11:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764240613; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qM+78PD5ekMZeH4ikhncpDCQPAp+WRknC7tChSXz9fg=;
 b=DQ6kBOsJulob0CVuVj+yCd+NTrZTMIHY51ditA6zR2FsJXFRQ2NkoloiQNSx0A9wI4ai+e
 UUmj6mKbRRs4tT39U+PE2aeofzHjN5SqO3dTyZLFw7vvbZYUfSgCSl1By5sFZqrQxpC8d/
 7x6neostWGwcX6UxpcovVhcD/A9jnr21IAh8Mn2Vs0VoBAS56fj+3GsTyWiCd/54BMI+b8
 1upVqWBnSueSAvtayytVWY6vBk0gBFXsotO7uQAX6sBYdVU/Xh4PzV2k+k3mFaVJ3G/OOa
 8qi+qKNAdE4+wqZPrk1OztyrznjJJDcO+BbTskz36sQlz1Ey+e5DXVGq/k15tw==
Message-ID: <f5d3be540586a471a008a730b56da26f0966f159.camel@mailbox.org>
Subject: Re: [PATCH 05/18] dma-buf: use inline lock for the stub fence
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:50:02 +0100
In-Reply-To: <20251113145332.16805-6-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-6-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: hxdahhgw5jrxrd879i3ey6x3nb3qfwef
X-MBO-RS-ID: 13c171c04d28eccd72f
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> Using the inline lock is now the recommended way for dma_fence implementa=
tions.
>=20
> So use this approach for the framework internal fences as well.

nit:
s/framework/framework's

>=20
> Also saves about 4 bytes for the external spinlock.

On all platforms or just AMD64?

>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 20 ++++----------------
> =C2=A01 file changed, 4 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 9a5aa9e44e13..e6d26c2e0391 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> =C2=A0
> -static DEFINE_SPINLOCK(dma_fence_stub_lock);
> =C2=A0static struct dma_fence dma_fence_stub;
> =C2=A0
> =C2=A0/*
> @@ -123,12 +122,8 @@ static const struct dma_fence_ops dma_fence_stub_ops=
 =3D {
> =C2=A0
> =C2=A0static int __init dma_fence_init_stub(void)
> =C2=A0{
> -	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_lock, 0, 0);
> -
> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -		&dma_fence_stub.flags);

That change is unrelated, isn't it? Enlarges the diff and breaks git-
blame.

> -
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &dma_fence_stub.flags);
> =C2=A0	dma_fence_signal(&dma_fence_stub);
> =C2=A0	return 0;
> =C2=A0}
> @@ -160,16 +155,9 @@ struct dma_fence *dma_fence_allocate_private_stub(kt=
ime_t timestamp)
> =C2=A0	if (fence =3D=3D NULL)
> =C2=A0		return NULL;
> =C2=A0
> -	dma_fence_init(fence,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_ops,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_lock,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0);
> -
> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -		&fence->flags);

Same.

> -
> +	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags);
> =C2=A0	dma_fence_signal_timestamp(fence, timestamp);
> -

I wouldn't remove that empty line (nit).

> =C2=A0	return fence;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(dma_fence_allocate_private_stub);

