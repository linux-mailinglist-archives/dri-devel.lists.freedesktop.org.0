Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE757092C7
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5610E5F1;
	Fri, 19 May 2023 09:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAF210E10C;
 Fri, 19 May 2023 09:14:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E6A9566066EC;
 Fri, 19 May 2023 10:14:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684487697;
 bh=rfNWjmL86YwQm6pTgAm9tHvkvMaRj2oJyaFyfwzuc1k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kB8sAeMeoNUBu2sHu6y6lRwbG7VelDZdrAPyFa0y1i+e8VdeVvU/z8YprFs2oHlOX
 JNspljK+04CD/EJUKCrICu2wPrt7nuXN4dFteqNKoVX5cpb2kv0RBemVNwKE6c6M1n
 znaawhIJ7fifHTLAPHri4IQTmuhT0MEsjrIVz90keg6g2dbjS8KsXgnkG7GOY9WHLf
 Fg6200Q1cPD19kzhLs/At4K7kmlPkmqYbIZw0RKAcPR2FKr6INdTSAje+1/vHWYhke
 EUSYg/1luDxAgdwxzvIHfgSvDdPrAnFQ8MOsDVtNmfoMD/dv1v7KB+6UM5rd8BL9rL
 PfAH83NBCr5lw==
Date: Fri, 19 May 2023 11:14:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
Message-ID: <20230519111453.1a6aeb95@collabora.com>
In-Reply-To: <20230519090733.489019-1-matthew.auld@intel.com>
References: <20230519090733.489019-1-matthew.auld@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023 10:07:33 +0100
Matthew Auld <matthew.auld@intel.com> wrote:

> In mutex_init() lockdep identifies a lock by defining a special static
> key for each lock class. However if we wrap the macro in a function,
> like in drmm_mutex_init(), we end up generating:
>=20
> int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> {
>       static struct lock_class_key __key;
>=20
>       __mutex_init((lock), "lock", &__key);
>       ....
> }
>=20
> The static __key here is what lockdep uses to identify the lock class,
> however since this is just a normal function the key here will be
> created once, where all callers then use the same key. In effect the
> mutex->depmap.key will be the same pointer for different
> drmm_mutex_init() callers. This then results in impossible lockdep
> splats since lockdep thinks completely unrelated locks are the same lock
> class.
>=20
> To fix this turn drmm_mutex_init() into a macro such that it generates a
> different "static struct lock_class_key __key" for each invocation,
> which looks to be inline with what mutex_init() wants.
>=20
> v2:
>   - Revamp the commit message with clearer explanation of the issue.
>   - Rather export __drmm_mutex_release() than static inline.
>=20
> Reported-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reported-by: Sarah Walker <sarah.walker@imgtec.com>
> Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 22 ++--------------------
>  include/drm/drm_managed.h     | 18 +++++++++++++++++-
>  2 files changed, 19 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4cf214de50c4..c21c3f623033 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -264,28 +264,10 @@ void drmm_kfree(struct drm_device *dev, void *data)
>  }
>  EXPORT_SYMBOL(drmm_kfree);
> =20
> -static void drmm_mutex_release(struct drm_device *dev, void *res)
> +void __drmm_mutex_release(struct drm_device *dev, void *res)
>  {
>  	struct mutex *lock =3D res;
> =20
>  	mutex_destroy(lock);
>  }
> -
> -/**
> - * drmm_mutex_init - &drm_device-managed mutex_init()
> - * @dev: DRM device
> - * @lock: lock to be initialized
> - *
> - * Returns:
> - * 0 on success, or a negative errno code otherwise.
> - *
> - * This is a &drm_device-managed version of mutex_init(). The initialized
> - * lock is automatically destroyed on the final drm_dev_put().
> - */
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> -{
> -	mutex_init(lock);
> -
> -	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
> -}
> -EXPORT_SYMBOL(drmm_mutex_init);
> +EXPORT_SYMBOL(__drmm_mutex_release);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 359883942612..ad08f834af40 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -105,6 +105,22 @@ char *drmm_kstrdup(struct drm_device *dev, const cha=
r *s, gfp_t gfp);
> =20
>  void drmm_kfree(struct drm_device *dev, void *data);
> =20
> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
> +void __drmm_mutex_release(struct drm_device *dev, void *res);
> +
> +/**
> + * drmm_mutex_init - &drm_device-managed mutex_init()
> + * @dev: DRM device
> + * @lock: lock to be initialized
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of mutex_init(). The initialized
> + * lock is automatically destroyed on the final drm_dev_put().
> + */
> +#define drmm_mutex_init(dev, lock) ({					     \
> +	mutex_init(lock);						     \
> +	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
> +})									     \
> =20
>  #endif

