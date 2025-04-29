Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F490BC09BB
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8B810E012;
	Tue,  7 Oct 2025 08:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hhBevQ4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D815410E012
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759825400;
 bh=jZGhVKHkpRai0Y2/EIkeTlYu8tYQjbtzz7neJZoq66Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hhBevQ4FxG0mKuDSwCVH9MUQZUzbI9dc4vsE9e4IxI0SJ7ZQBa3/U4BjqS4QQoIrE
 442WDmAKxaMvnFPlBlIMaVSDDB/CTF7keuQohdSUR9/q3oc+Qa6Uiiea3DL+wasEw4
 3RJeS0nrJQLFqijuxIdhBzrgoiL8vB0Ba5TVbs3lTXBP7aINAkMBWxlAsdu0KhHeC7
 BMIS6TpDQ0RS+nIEiEv9Ffv8IEtU7dazF6F472jdXZX/+W888gFYCswmVbgsi9PTW5
 omc948QAAwAy3p+bc5bCqGyNVV33FnczE8K2rtefkwmB8oYFGOXF5qTP9v8LtQ9jwi
 pl2FIE3Jh1oEw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E56B117E0A28;
 Tue,  7 Oct 2025 10:23:19 +0200 (CEST)
Date: Tue, 29 Apr 2025 18:13:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/panthor: Fix build warning when DEBUG_FS is disabled
Message-ID: <20250429181305.47d65c9a@collabora.com>
In-Reply-To: <20250424184041.356191-1-adrian.larumbe@collabora.com>
References: <20250424184041.356191-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZM-MESSAGEID: 1745943243961134400
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

On Thu, 24 Apr 2025 19:40:34 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM
> objects over DebugFS") causes a build warning and linking error when
> built without support for DebugFS, because of a non-inline non-static
> function declaration in a header file.
>=20
> On top of that, the function is only being used inside a single
> compilation unit, so there is no point in exposing it as a global
> symbol.
>=20
> This is a follow-up from Arnd Bergmann's first fix.
> Also move panthor_gem_debugfs_set_usage_flags() into panthor_gem.c and
> declare it static.
>=20
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objec=
ts over DebugFS")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Closes: https://lore.kernel.org/dri-devel/20250424142419.47b9d457@collabo=
ra.com/T/#t
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 5 +++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 8 --------
>  2 files changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 2dcf308094b2..7c00fd77758b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -42,11 +42,16 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_=
gem_object *bo)
>  	mutex_unlock(&ptdev->gems.lock);
>  }
> =20
> +static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_objec=
t *bo, u32 usage_flags)
> +{
> +	bo->debugfs.flags =3D usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INIT=
IALIZED;
> +}
>  #else
>  static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
>  				       struct panthor_gem_object *bo)
>  {}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_objec=
t *bo, u32 usage_flags) {}
>  #endif
> =20
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 4641994ddd7f..4dd732dcd59f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -212,14 +212,6 @@ void panthor_kernel_bo_destroy(struct panthor_kernel=
_bo *bo);
>  #ifdef CONFIG_DEBUG_FS
>  void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
>  				   struct seq_file *m);
> -static inline void
> -panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 u=
sage_flags)
> -{
> -	bo->debugfs.flags =3D usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INIT=
IALIZED;
> -}
> -
> -#else
> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, =
u32 usage_flags) {};
>  #endif
> =20
>  #endif /* __PANTHOR_GEM_H__ */
>=20
> base-commit: 3a2b7389feea9a7afd18d58cda59b7a989445f38

