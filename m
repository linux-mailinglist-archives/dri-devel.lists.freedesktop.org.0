Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909FDC8DD6D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB88510E801;
	Thu, 27 Nov 2025 10:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ea2FEuya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3F10E801;
 Thu, 27 Nov 2025 10:51:40 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHCsj6FcWz9sdm;
 Thu, 27 Nov 2025 11:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764240697; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a+/CnqgOsofBTV7/YbaZDyPU7rGK0NtsOQxJO8FEjuo=;
 b=ea2FEuya3D1m3jJ5FCsL5HytgwaL8Egv8xxGAMDUofMrbEVTQHtj0zaP4KtKp3TPlxokh/
 NWlsGGEBsgWHCkN/qDVxN8p3vXq7IgZuENjzWfugy/9R0rMaPv20rHEtwvR9lH5fLKPJI9
 CL1LPUeHWzQ4/hcXfPAe1FaW4r067FBY59CBT+ac9R4HkYyr6C3A6zzk3oUGm8bNMtkQMq
 Pa29ZJSK9jqbVLMDiErLUqyfqcYso+FVvqvxWW3/BHr4jSfd6PI46WLYOw8LW5zw9gnN90
 kLdqJqdCzcOh/9oIkSC6WNKU7sdf88bARaMpzy5L7gKTm9BXgtydDIiorLXjbQ==
Message-ID: <b1a3e4482fbd42477fc80882baebbfd9d9512b41.camel@mailbox.org>
Subject: Re: [PATCH 06/18] dma-buf: use inline lock for the dma-fence-array
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:51:34 +0100
In-Reply-To: <20251113145332.16805-7-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-7-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 46ef2ca0481663aa79c
X-MBO-RS-META: 4id8eth43kbt5gbt8cjgi17cd1gwc7yg
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

Reviewed-by: Philipp Stanner <phasta@kernel.or>

> ---
> =C2=A0drivers/dma-buf/dma-fence-array.c | 5 ++---
> =C2=A0include/linux/dma-fence-array.h=C2=A0=C2=A0 | 1 -
> =C2=A02 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fenc=
e-array.c
> index 6657d4b30af9..c2119a8049fe 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *arr=
ay,
> =C2=A0
> =C2=A0	array->num_fences =3D num_fences;
> =C2=A0
> -	spin_lock_init(&array->lock);
> -	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context, seqno);
> +	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 seqno);
> =C2=A0	init_irq_work(&array->work, irq_dma_fence_array_work);
> =C2=A0
> =C2=A0	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-ar=
ray.h
> index 079b3dec0a16..370b3d2bba37 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -38,7 +38,6 @@ struct dma_fence_array_cb {
> =C2=A0struct dma_fence_array {
> =C2=A0	struct dma_fence base;
> =C2=A0
> -	spinlock_t lock;
> =C2=A0	unsigned num_fences;
> =C2=A0	atomic_t num_pending;
> =C2=A0	struct dma_fence **fences;

