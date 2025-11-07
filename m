Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C566C3FD46
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384A10E09B;
	Fri,  7 Nov 2025 11:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RKVsLVwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AC310E09B;
 Fri,  7 Nov 2025 11:59:51 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d2yKb0cHhz9tRW;
 Fri,  7 Nov 2025 12:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762516787; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KTxCIu+64AN+6WYhjPTERLiBeZXPHOZfhRXNGpsmbs=;
 b=RKVsLVwtpIijziFxh1InDdanFafnkWOJvq7vfCc4jeRKwZnkc5Os/vASHU4S2v0ikUTavD
 gvH0zC8vQiQg2fvvWw6wKf7qin7eFz5utLf8YopGyKCStdDWegJqnyTJDbAnAIB+DEPkSW
 6SOVwh8n9HOyQ9zhmhPUAxxUhlBX0SPMfnSKQFKSlQc0LoPtkDcf+XVAvLAbVn6ymxKLRo
 wZmFAtRjjp8mffZ4oQx4T73a/Tc1pIWc3WUdCOvpnUrZPZSGqZN45K1+ai5r8f6zb9iTW8
 GtKsa53WNzEPaF5mYPpmuABBOjQ9wHtjETugbTKg0HlCo+zdalfbG/WWxR4noQ==
Message-ID: <d2dc56f73ac723f1273e71335b00261335db838d.camel@mailbox.org>
Subject: Re: [PATCH 05/20] dma-buf: inline spinlock for fence protection
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 07 Nov 2025 12:59:43 +0100
In-Reply-To: <20251031134442.113648-6-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-6-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5437c07880670df560e
X-MBO-RS-META: xqpj693wtt141o3fnkix4r7d78b6hpaq
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

On Fri, 2025-10-31 at 14:16 +0100, Christian K=C3=B6nig wrote:
> Allow implementations to not give a spinlock to protect the fence
> internal state, instead a spinlock embedded into the fence structure
> itself is used in this case.

I'd rather say sth like "Implement per-fence spinlocks. Shared
spinlocks have the problem that [=E2=80=A6]"

>=20
> Apart from simplifying the handling for containers and the stub fence
> this has the advantage of allowing implementations to issue fences
> without caring about theit spinlock lifetime.

s/theit/their.

But rather "it allows for completely decoupling spinlock producer and
consumer life times"

>=20
> That in turn is necessary for independent fences who outlive the module
> who originally issued them.

s/who/which

>=20
>=20

[=E2=80=A6]

> =C2=A0
> =C2=A0enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
> =C2=A0	DMA_FENCE_FLAG_SEQNO64_BIT,
> =C2=A0	DMA_FENCE_FLAG_SIGNALED_BIT,
> =C2=A0	DMA_FENCE_FLAG_TIMESTAMP_BIT,
> @@ -351,6 +357,38 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fenc=
ep)
> =C2=A0	} while (1);
> =C2=A0}
> =C2=A0
> +/**
> + * dma_fence_spinlock - return pointer to the spinlock protecting the fe=
nce
> + * @fence: the fence to get the lock from
> + *
> + * Return either the pointer to the embedded or the external spin lock.
> + */
> +static inline spinlock_t *dma_fence_spinlock(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_INLINE_LOCK_BIT, &fence->flags) ?
> +		&fence->inline_lock : fence->extern_lock;

Wouldn't you agree that an 'if' is much more readable? I prefer using
the ternary operator only for tiny operations.

if test_bit(=E2=80=A6)
	return &fence->inline_lock;

return fence->extern_lock;



Besides, I agree with the idea and I think I actually need a feature like t=
hat in dma_fence.


P.
