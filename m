Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8283C83D06
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 08:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D51C10E079;
	Tue, 25 Nov 2025 07:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="c0DTH5VG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D73110E079
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 07:55:28 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dFw3J1g9vz9v7B;
 Tue, 25 Nov 2025 08:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764057324; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uride6hQTmtBCmUx9aPr6ajGn2UY2lSh9OjhTJsJtWE=;
 b=c0DTH5VGZAq/SNZ20rUqWUeGes5xr7zz9g2jaKUTcCxiI89JK8AfuQqqCr5G8verGt3p1s
 jzjfEFT8NeFCaS1s51V9u4oqM6z1GTUKSdS7obZLFuiUC21c/X1szFe9OD0CNFH3CgXEDX
 vrEZ2szR3dKwKGBCLhthgpyYwMb7E3rjFQwprRE13OglstI7g3SUGY4uZYTbkcn3cf9bVo
 KyT9YMNxmVx0HA0uE4v1Mrj4B6xChLtBYIGQ7ohwTsPj2fUbtB3zO+ALKKfnXg7D5fddXq
 aLghD/jY4tDslQf6wzz53ovBditVyK7QYaJ5yT2NsWqAZK3iMobKghRv3oGZ0w==
Message-ID: <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Tue, 25 Nov 2025 08:55:19 +0100
In-Reply-To: <20251120150018.27385-2-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: znb9essb3eemgwznn88z6is3ryspinme
X-MBO-RS-ID: 34c87f095cb9a943dbe
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

On Thu, 2025-11-20 at 15:41 +0100, Christian K=C3=B6nig wrote:
> Add a define implementations can use as reasonable maximum signaling
> timeout. Document that if this timeout is exceeded by config options
> implementations should taint the kernel.
>=20
> Tainting the kernel is important for bug reports to detect that end
> users might be using a problematic configuration.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0include/linux/dma-fence.h | 14 ++++++++++++++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..b31dfa501c84 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -28,6 +28,20 @@ struct dma_fence_ops;
> =C2=A0struct dma_fence_cb;
> =C2=A0struct seq_file;
> =C2=A0
> +/**
> + * define DMA_FENCE_MAX_REASONABLE_TIMEOUT - max reasonable signaling ti=
meout
> + *
> + * The dma_fence object has a deep inter dependency with core memory
> + * management, for a detailed explanation see section DMA Fences under
> + * Documentation/driver-api/dma-buf.rst.
> + *
> + * Because of this all dma_fence implementations must guarantee that eac=
h fence
> + * completes in a finite time. This define here now gives a reasonable v=
alue for
> + * the timeout to use. It is possible to use a longer timeout in an
> + * implementation but that should taint the kernel.
> + */
> +#define DMA_FENCE_MAX_REASONABLE_TIMEOUT (2*HZ)

HZ can change depending on the config. Is that really a good choice? I
could see racy situations arising in some configs vs others

P.
