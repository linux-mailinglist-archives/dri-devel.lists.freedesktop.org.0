Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B96BE0129
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF5310E8B1;
	Wed, 15 Oct 2025 18:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="f1PeSLWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909E10E8AB;
 Wed, 15 Oct 2025 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760552262;
 bh=7ptcchgLxwIkPXE05LECg/WjIoBNqSmV17ABYHJJQkY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f1PeSLWViiy6lxbY6mDbjfWggl+sS8rbLqvJXDcrtvzph1hKk1BhB+QzIrCa6yeuT
 fXE0WRi9qr1C1SM75AnWVeYxLlsYCj/rxVLmDhYF8BA7TwYpaBgyTmWJg5RPbPcp/r
 wxpE5vmB/QJLrvrmJvKTnyQFMc/vDnm7uETEX1UuPc62pvjquSIhJ0hHCL1pKnupj1
 /0XwcrIohZ/b19Kh3Ft5phd6lAa0acTCj5hnlsr0kFGVExMLJ8PMM5VcV6AB937jPN
 80KENnV6aVcCTM7MjFBIJ66Erqljq4yCO7RQj41W/AfL79LXOMywQoTDzVT8j9yMjh
 iViOcUEBUGKQQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 557FD17E0125;
 Wed, 15 Oct 2025 20:17:41 +0200 (CEST)
Date: Wed, 15 Oct 2025 20:17:37 +0200
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
Subject: Re: [PATCH v4 08/13] drm/v3d: Fix builds with
 CONFIG_TRANSPARENT_HUGEPAGE=n
Message-ID: <20251015201737.3956f801@fedora>
In-Reply-To: <20251015153018.43735-9-loic.molinari@collabora.com>
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-9-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Wed, 15 Oct 2025 17:30:12 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Don't declare "super_pages" on builds with CONFIG_TRANSPARENT_HUGEPAGE
> disabled to prevent build error:
>=20
> ERROR: modpost: "super_pages" [drivers/gpu/drm/v3d/v3d.ko] undefined!

I believe this is a bug introduced by the previous commit: the
compiler probably drops any code between the
IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) check and the err label
because IS_ENABLED() evaluates to false at compile time. So I'd squash
those changes in the previous commit.

>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.h | 2 ++
>  drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 99a39329bb85..481502104391 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -564,7 +564,9 @@ extern const struct dma_fence_ops v3d_fence_ops;
>  struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q=
);
> =20
>  /* v3d_gem.c */
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  extern bool super_pages;
> +#endif
>  int v3d_gem_init(struct drm_device *dev);
>  void v3d_gem_destroy(struct drm_device *dev);
>  void v3d_reset_sms(struct v3d_dev *v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 635ff0fabe7e..0039063eb8b2 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -269,7 +269,9 @@ v3d_huge_mnt_init(struct v3d_dev *v3d)
>  	 * match our usecase.
>  	 */
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	if (super_pages)
> +#endif
>  		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");

Why not

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  	if (super_pages)
  		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");
#endif

I guess

	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
		err =3D drm_gem_huge_mnt_create(&v3d->drm, "within_size");

would also do, since it's likely to rely on the same optimization the
previous v3d_gemfs_init() implementation was relying on, but it's
fragile (not sure what happens when compiled with -O0).

> =20
>  	if (v3d->drm.huge_mnt)

