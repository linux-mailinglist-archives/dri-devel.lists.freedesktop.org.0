Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207CB8CD1F1
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0310E334;
	Thu, 23 May 2024 12:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A8b03q1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154F10E334
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716466412;
 bh=aeQ1eCV/OYFIzW5W9o7Rm16kTK0XBOoJtW9zhuyRyP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A8b03q1KO14uSrOcZ3mHzaAeHTBDeHvQe/MMVymQnmpdB95Ft2Pj4Tz7l2+gV5Efa
 hwXMCx3zq5IE0i+Cf2J5tA1PvtcLmHIubxjeU1yJSUMD9c5GrFnxBFh4FDHb4TNrw0
 VFuBaMLSYtRoR2NeC41NFRYW3nagRYP+CK0Riv/kHmIJIspDl0x6QQS9uNI3wotrL1
 esMzAHieAWHFvjebc6Fcb2EmEqCyB0Uu2yXTW4IzvS4YOdPKFvajZchcOtx4i0WFGW
 t8V6t3igizvZrC+3MpLYH6iitiMa0jieFmilN78VSdQ4FVO3l9z1RmEnvHqNedxCNR
 v9qAbRFXIsYlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A6E13782039;
 Thu, 23 May 2024 12:13:31 +0000 (UTC)
Date: Thu, 23 May 2024 14:13:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 3/3] drm/gem-shmem: Add import attachment warning to
 locked pin function
Message-ID: <20240523141330.374fb505@collabora.com>
In-Reply-To: <20240523113236.432585-4-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
 <20240523113236.432585-4-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Thu, 23 May 2024 12:32:19 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit ec144244a43f ("drm/gem-shmem: Acquire reservation lock in GEM
> pin/unpin callbacks") moved locking DRM object's dma reservation to
> drm_gem_shmem_object_pin, and made drm_gem_shmem_pin_locked public, so we
> need to make sure the non-NULL check warning is also added to the latter.
>=20
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Fixes: a78027847226 ("drm/gem: Acquire reservation lock in drm_gem_{pin/u=
npin}()")
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 177773bcdbfd..ad5d9f704e15 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -233,6 +233,8 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_obj=
ect *shmem)
> =20
>  	dma_resv_assert_held(shmem->base.resv);
> =20
> +	drm_WARN_ON(shmem->base.dev, shmem->base.import_attach);
> +
>  	ret =3D drm_gem_shmem_get_pages(shmem);
> =20
>  	return ret;

