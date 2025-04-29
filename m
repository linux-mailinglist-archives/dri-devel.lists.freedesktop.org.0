Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D193BC09CA
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420F10E5A2;
	Tue,  7 Oct 2025 08:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h94yckcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148010E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759825421;
 bh=MajXR+eDQMdIEwqLUWV9WRQsZnhgMUSoAq1t5bSMaXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h94yckcCqavoDlxoyOxLv6t2EuQBAVlYln19rbbJL3vxd3gzo3WYckwrR+GLDXwVH
 GwKPb+AZiOg5PDlB6i+yEZiQ4pr8pDWs38o5FizNRmB/xgBEJVgYn3ECztmStmB4cS
 EJ+N6ef0gZlpk/Dq6rWieTUvt9R2ISU56qO9EeXXBE/NyWFktQTVZHpKj981jpSmIt
 SbTu9YX159OmzzSyQvqlDgEiy2Z8MhEv5m5vBapAZW7JPPYVFuQymU/756VZyv/ehy
 Kz2v8h3L4Fl8R50f8B9Vrm5h2BV0wpz7FGbvImBDI/I1JzEw/TtRnA6GX8n7Rl3xoC
 DF16N9yKm98OA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6706C17E0A28;
 Tue,  7 Oct 2025 10:23:41 +0200 (CEST)
Date: Tue, 29 Apr 2025 18:16:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Message-ID: <20250429181030.6a81a2ea@collabora.com>
In-Reply-To: <20250424022138.709303-2-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
 <20250424022138.709303-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZM-MESSAGEID: 1745943481827134300
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

On Thu, 24 Apr 2025 03:21:30 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Unlike in Panthor, from where this change is based on, there is no need
> to support tagging of BO's other than UM-exposed ones, so all strings
> can be freed with kfree().
>=20
> This commit is done in preparation of a following one that will allow
> UM to set BO labels through a new ioctl().
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 963f04ba2de6..a7a29974d8b1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> =20
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/dma-buf.h>
> @@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_obj=
ect *obj)
>  	 */
>  	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
> =20
> +	kfree(bo->label.str);
> +	mutex_destroy(&bo->label.lock);
> +
>  	if (bo->sgts) {
>  		int i;
>  		int n_sgt =3D bo->base.base.size / SZ_2M;
> @@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(str=
uct drm_device *dev, size_t
>  	mutex_init(&obj->mappings.lock);
>  	obj->base.base.funcs =3D &panfrost_gem_funcs;
>  	obj->base.map_wc =3D !pfdev->coherent;
> +	mutex_init(&obj->label.lock);
> =20
>  	return &obj->base.base;
>  }
> @@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_device=
 *dev,
> =20
>  	return obj;
>  }
> +
> +void
> +panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +	const char *old_label;
> +
> +	scoped_guard(mutex, &bo->label.lock) {
> +		old_label =3D bo->label.str;
> +		bo->label.str =3D label;
> +	}
> +
> +	kfree(old_label);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index 7516b7ecf7fe..c0be2934f229 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -41,6 +41,20 @@ struct panfrost_gem_object {
>  	 */
>  	size_t heap_rss_size;
> =20
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;

Should we have a panfrost_gem_debugfs where we put all the debugfs
fields, like we have in panthor?

> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  };
> @@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panf=
rost_gem_object *bo);
>  int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
> =20
> +void panfrost_gem_set_label(struct drm_gem_object *obj, const char *labe=
l);
> +
>  #endif /* __PANFROST_GEM_H__ */

