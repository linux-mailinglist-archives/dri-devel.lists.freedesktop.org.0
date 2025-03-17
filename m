Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F41A64592
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA20810E3CC;
	Mon, 17 Mar 2025 08:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KIoCnE4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2827010E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742200380;
 bh=qvvs0wifU/1wb25vxgMG0iQ4QdxzyHRg0TbZGXsWkYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KIoCnE4JQgpk3J05ZVHoC/1bY4G3mEkDsXV13OpRY+cu4Ohqpba1yGSEHTJNC1oXe
 oIoL0K9JGVfUuS32vY/RIuHDcfljHmJDUBH4fpzB+iK3C3+clADquYoZavR1zANv98
 j2Ir6Ls0WAG0sy0dwGIznIv+Arq21l+1n7zZtuIdVRHZyAZAG53b0j2tPlbIs/Bse1
 ykCBR1CCtYP+wzuEeg9jqI+OlElv0HsGP1PHmvGjmfpsJvMS9HOR3u40DsIQZifOjN
 vSZZVcLt3sMZVjHNziKD7bUEqSQDwLwvoR77CtEBBkRh1fDaULr6iEHiekTLJ7tJNk
 DWJJW491HmM9Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 37B1317E0848;
 Mon, 17 Mar 2025 09:33:00 +0100 (CET)
Date: Mon, 17 Mar 2025 09:31:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/panthor: Display heap chunk entries in DebugFS
 GEMS file
Message-ID: <20250317093101.1784499d@collabora.com>
In-Reply-To: <20250316215139.3940623-5-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
 <20250316215139.3940623-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 16 Mar 2025 21:51:35 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Expand the driver's DebugFS GEMS file to display entries for the heap
> chunks' GEM objects, both those allocated at heap creation time through an
> ioctl(), or in response to a tiler OOM event.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index db0285ce5812..520d1fcf5c36 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -139,6 +139,10 @@ static int panthor_alloc_heap_chunk(struct panthor_d=
evice *ptdev,
>  	struct panthor_heap_chunk *chunk;
>  	struct panthor_heap_chunk_header *hdr;
>  	int ret;
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_gem_object *obj;
> +	const char *label;
> +#endif
> =20
>  	chunk =3D kmalloc(sizeof(*chunk), GFP_KERNEL);
>  	if (!chunk)
> @@ -180,6 +184,17 @@ static int panthor_alloc_heap_chunk(struct panthor_d=
evice *ptdev,
>  	heap->chunk_count++;
>  	mutex_unlock(&heap->lock);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	obj =3D to_panthor_bo(chunk->bo->obj);
> +
> +	mutex_lock(&ptdev->gems_lock);
> +	list_add_tail(&obj->gems_node, &ptdev->gems);
> +	mutex_unlock(&ptdev->gems_lock);
> +
> +	label =3D kstrdup_const("\"Tiler heap chunk\"", GFP_KERNEL);

Do we really need the extra quotes around 'Tiler heap chunk'?

> +	panthor_gem_label_bo(chunk->bo->obj, label);
> +#endif

Let's define a helper to assign a label to a kernel BO instead of
open-coding it here. BTW, I suspect we'll want to assign labels to
other kernel BOs too (FW buffers).

> +
>  	return 0;
> =20
>  err_destroy_bo:

