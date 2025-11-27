Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7BC8DD73
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:52:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274AA10E80E;
	Thu, 27 Nov 2025 10:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nXbUqHPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4F10E80E;
 Thu, 27 Nov 2025 10:52:51 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHCv36pwRz9tJ6;
 Thu, 27 Nov 2025 11:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764240768; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XGSX2e1Nz7vHsv7TnxdnhGmJ4ZE340y6yc74kWi6z8=;
 b=nXbUqHPP38bMxJNJbhIGOZTxlci0IReElINJDz7DnGvdZdQpsIELCW/tD7KwkpJH+veZnI
 Ta+COzwyEcQ693AShnUccV1gTOlaKdPW/AIfmCQaog6PxAZFO6LDMqHUSqHdAVR7UJxjlU
 dgbne9SUaVL8xVMc22ytHJuwEh6HZJhyWxlsGxGFEGP651z5rSEpEdjsu7WOIcQwj3X9kh
 xfa5P9/l/29r9SpnxE2+D8j28rSSrPM1B2RYA5gdNwF3he6o5YL5M2QY6+gskaUKZ8Ey7W
 nssw+HowYYjBtzLSYQopbETqud4pyRKK6Q2kOf2OVjXqP1gRPNCaKle+z3W//A==
Message-ID: <1f8dccacf01ac4722756a0345dba28afef320439.camel@mailbox.org>
Subject: Re: [PATCH 07/18] dma-buf: use inline lock for the dma-fence-chain
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:52:44 +0100
In-Reply-To: <20251113145332.16805-8-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-8-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 4705baeed2dfedf495a
X-MBO-RS-META: 6f5nbxsyzy9g4ts31gftitg6cmrsbmyt
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
>=20
> Also saves about 4 bytes for the external spinlock.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/dma-buf/dma-fence-chain.c | 3 +--
> =C2=A0include/linux/dma-fence-chain.h=C2=A0=C2=A0 | 1 -
> =C2=A02 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fenc=
e-chain.c
> index a8a90acf4f34..a707792b6025 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -245,7 +245,6 @@ void dma_fence_chain_init(struct dma_fence_chain *cha=
in,
> =C2=A0	struct dma_fence_chain *prev_chain =3D to_dma_fence_chain(prev);
> =C2=A0	uint64_t context;
> =C2=A0
> -	spin_lock_init(&chain->lock);
> =C2=A0	rcu_assign_pointer(chain->prev, prev);
> =C2=A0	chain->fence =3D fence;
> =C2=A0	chain->prev_seqno =3D 0;
> @@ -261,7 +260,7 @@ void dma_fence_chain_init(struct dma_fence_chain *cha=
in,
> =C2=A0			seqno =3D max(prev->seqno, seqno);
> =C2=A0	}
> =C2=A0
> -	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
> =C2=A0			 context, seqno);
> =C2=A0
> =C2=A0	/*
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-ch=
ain.h
> index 68c3c1e41014..d39ce7a2e599 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -46,7 +46,6 @@ struct dma_fence_chain {
> =C2=A0		 */
> =C2=A0		struct irq_work work;
> =C2=A0	};
> -	spinlock_t lock;
> =C2=A0};
> =C2=A0
> =C2=A0

