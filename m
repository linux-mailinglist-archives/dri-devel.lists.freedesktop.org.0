Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF7C3F9FC
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A27F10EA7E;
	Fri,  7 Nov 2025 11:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TgCVgYIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F75C10EA7E;
 Fri,  7 Nov 2025 11:04:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d2x5W5S6Mz9tlN;
 Fri,  7 Nov 2025 12:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762513456; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJuXYko6wm4OGpjXMub0mKpCnekGhJXH5H/6a7o4rCo=;
 b=TgCVgYIvX6juz4Yosq2y1DybB3EwACsBrntTBFoWJW7vj6yVvxIk4TWFnWgAK9BkiRXqGQ
 bhvDSDF5APvMDcr8PVFfsUHV1SHThRkIaCXdAE520FqNXeuiDgcCpLma3RJn+xj5vcuzEb
 CwRdmu8rBJ7uY8OuVB1htbKZcLpOrx6fmJNTmjNpi+we6Jv0HT7s+s+/NcHAVZ1UztXgAL
 l/pLfk4ArjWlpnEfp3w6q/tCObBRNl8o7MlOgk0+nUl5AP4aYieSZOA1h+ThtzTUbOdh2k
 nMKD0rS6BO6CZ/hBsKp+cY8cnXch9rFn8B3eBrwB1tvM9PLKmSgVxm0ZZF6Lkg==
Message-ID: <7e4ce1fbc736fab77d8c1ee80f1e1d30d2e3f89c.camel@mailbox.org>
Subject: Re: [PATCH 04/20] dma-buf: detach fence ops on signal
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Date: Fri, 07 Nov 2025 12:04:11 +0100
In-Reply-To: <20251031134442.113648-5-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-5-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 22d357565791cdd8b75
X-MBO-RS-META: kjb6f5jyhpuiknamriy8k46mtfhu1cso
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
> When neither a release nor a wait operation is specified it is possible

Maybe call it "backend ops" instead of "operation"?

> to let the dma_fence live on independent of the module who issued it.

s/independent/independently

>=20
> This makes it possible to unload drivers and only wait for all their
> fences to signal.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
> =C2=A0include/linux/dma-fence.h=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A02 files changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ed82e8361096..cd222984e2e1 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fen=
ce *fence,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &fence->flags)))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	/*
> +	 * When neither a release nor a wait operation is specified set the ops
> +	 * pointer to NULL to allow the fence structure to become independent

missing "from"
