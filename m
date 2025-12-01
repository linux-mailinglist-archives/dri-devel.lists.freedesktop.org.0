Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD00C9610B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34BF10E0EF;
	Mon,  1 Dec 2025 08:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l8LYok3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1E210E0E1;
 Mon,  1 Dec 2025 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764576312;
 bh=AOGaPCVrzkgZmmb9BtWGyYN/DIDoq1iWanmV0V1M44s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l8LYok3jpLm4g5fxltRSyH6uFrGONRIfd8dZNss7W921eaCZVbddag1SUJJ9+x7Wd
 v4jor1LAPe/fKVE9AcxvzBGC2VwaE8g/VpjBxLKiQi5W0r8vZcWESYAYIHXKVIaGV4
 FOCBkOSXwNk6ZibxuXsqbQ/F4eYg5pHmIjf3i9p6r5WX4iPhwO5WprDZEtBEtLU/OP
 ZDyOt/iNXXvL9teGdKTw8GJpWlCD1NnRePubQyLZJGvi7o8aa4MgYkPthTMYqmD4uL
 BTg5xy7sU5rxtxk6+cG3PqB7WTOB7An6zJT//b4QsD4O37HcF2ZtRPpKKOyhgMIysK
 VvT6wnLQQemZg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A3C517E0020;
 Mon,  1 Dec 2025 09:05:11 +0100 (CET)
Date: Mon, 1 Dec 2025 09:05:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v10 01/10] drm/shmem-helper: Simplify page offset
 calculation in fault handler
Message-ID: <20251201090507.1ee10c65@fedora>
In-Reply-To: <20251128185252.3092-2-loic.molinari@collabora.com>
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-2-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Fri, 28 Nov 2025 19:52:43 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> For a fault at address addr, the page offset is
>   page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT
>               =3D ((addr & PAGE_MASK) - vma->vm_start) >> PAGE_SHIFT
> 	      =3D (addr - vma->vm_start) >> PAGE_SHIFT
>=20
> Since the faulty logical page offset based on VMA is
>   vmf->pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT)
>=20
> We can slightly simplify the calculation using
>   page_offset =3D vmf->pgoff - vma->vm_pgoff
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

One nit below

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index dc94a27710e5..be89be1c804c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -577,8 +577,8 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault=
 *vmf)
>  	struct page *page;
>  	pgoff_t page_offset;
> =20
> -	/* We don't use vmf->pgoff since that has the fake offset */
> -	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> +	/* Offset to faulty address in the VMA (without the fake offset). */

It's weird to say "without the fake offset" here, because IIUC, both
vmf->pgoff and vma->vm_pgoff contain the fake offset. And that's fine,
the problem really is when one of the subtraction operand is not
relative to the fake offset.

> +	page_offset =3D vmf->pgoff - vma->vm_pgoff;
> =20
>  	dma_resv_lock(shmem->base.resv, NULL);
> =20

