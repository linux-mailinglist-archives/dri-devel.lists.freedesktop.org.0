Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C029CA1B24D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 10:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004B310E924;
	Fri, 24 Jan 2025 09:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HqiLScCz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563DD10E924
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737709575;
 bh=DXHBuCDcA9qEJgCgIqOXyAz0XBN+eGku4n3QLjlmDZs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HqiLScCzjBq0Gdj6+j40nMgSadHyZzql7KkyLS3PThKcdHAmXficTz175VRrN8LUq
 c8DGmkQ5WhXACiW1q4QtWocJNrSeXBt1QlMdUOUcFh8WbtoIiW5W7BesYGMn+H+1BU
 +TOLFl43iyS7z+oz11w4xuYlrKPr1K0RNHfuTA0uxOJyMWQbGwYm7lOMSkbvds56DB
 y/RH1zdbeLQugXlp5sLjhnw9JH+ntmfeS5BTQpAFJq48SjlWq7RInmJ+WhEGAaj9km
 jHUki84H0H+4XhIzGzsdY2N5EhwrFljwyRmIhY28nLkkqAUKfD4WLOECBK2KRlBZfp
 B0hToAaKgdj2w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 74F2B17E0E9D;
 Fri, 24 Jan 2025 10:06:14 +0100 (CET)
Date: Fri, 24 Jan 2025 10:06:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/5] drm/panthor: Fix race condition when gathering
 fdinfo group samples
Message-ID: <20250124100607.473761a9@collabora.com>
In-Reply-To: <20250123225325.3271764-6-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
 <20250123225325.3271764-6-adrian.larumbe@collabora.com>
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

On Thu, 23 Jan 2025 22:53:02 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
> protect access to groups with an xarray lock, which could lead to
> use-after-free errors.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Nice catch!

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index e6c08a694e41..1d283b4bab86 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct pan=
thor_file *pfile)
>  	if (IS_ERR_OR_NULL(gpool))
>  		return;
> =20
> +	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
>  		mutex_lock(&group->fdinfo.lock);
>  		pfile->stats.cycles +=3D group->fdinfo.data.cycles;
> @@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct pan=
thor_file *pfile)
>  		group->fdinfo.data.time =3D 0;
>  		mutex_unlock(&group->fdinfo.lock);
>  	}
> +	xa_unlock(&gpool->xa);
>  }
> =20
>  static void group_sync_upd_work(struct work_struct *work)

