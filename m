Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8615C5E7CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 18:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698F10EADE;
	Fri, 14 Nov 2025 17:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nU+iuGAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133210EADE;
 Fri, 14 Nov 2025 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763140546;
 bh=ID+wxlGDegTSQQqO+tfv+j3F//xuzjuJ6+40mXVWHgY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nU+iuGATE0QjIxjGhzFYT6AUXWPCOhQdAJu/0W8EeKONVvx28VL4l3LWvT8ti+wnq
 +xbEFjKI3wOXVR0b2FApQZpSaFWkNXCU7xXgw3rWQjBQzC1kj8yel2Tcrq4+ZhXBaK
 uXB/FJPJC8jm5qEJo3pfFqZeRF1n4JxVzKCOBMj+QLff+2m4l/SH5OOUtWHMCXbnof
 CLpAdSxKiln4mzIs+3D25R2MEZzE1f5fI//kmoSMdvmcWKx91cfbmxr/Rd8tsMY58x
 TjHf1gQEWa/3TIK3bfNMqykgd6dcCBsivQWynhnjFE+pQmiAY32ASryZdqairHzF54
 OSmSAnXo9ArXg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EB6C17E12D5;
 Fri, 14 Nov 2025 18:15:45 +0100 (CET)
Date: Fri, 14 Nov 2025 18:15:40 +0100
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
Subject: Re: [PATCH v9 07/11] drm/gem: Get rid of *_with_mnt helpers
Message-ID: <20251114181540.102789b1@fedora>
In-Reply-To: <20251114170303.2800-8-loic.molinari@collabora.com>
References: <20251114170303.2800-1-loic.molinari@collabora.com>
 <20251114170303.2800-8-loic.molinari@collabora.com>
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

On Fri, 14 Nov 2025 18:02:58 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 211578abf9b6..c4316b768b3d 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -153,12 +153,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev,=
 struct drm_file *file_priv,
>  	struct v3d_bo *bo;
>  	int ret;
> =20
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	shmem_obj =3D drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  dev->huge_mnt);
> -#else
>  	shmem_obj =3D drm_gem_shmem_create(dev, unaligned_size);
> -#endif

Hm, okay, the thing I complained about in patch 6 is dropped here. If
there's nothing else to address, don't bother sending a new version
just for that.

>  	if (IS_ERR(shmem_obj))
>  		return ERR_CAST(shmem_obj);
>  	bo =3D to_v3d_bo(&shmem_obj->base);
