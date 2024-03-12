Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C42A878FCC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9B010F1C4;
	Tue, 12 Mar 2024 08:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UBdoio+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07E10F1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=npd7PCD0a47NXYHLKFkgWZqgZn2PLoZ+lb16X1BB+zc=; b=UBdoio+aZV1doPUX/tYCknVGTD
 HH2r8DPag4uRSHMowy/aX27Ymlc4SqUvlA+lMf23oE56iq/e1uWmnP4leSA4lszJ5bf1Ls92EwvrK
 zn89lDuLrU9Y41jUnHvJre2Z7VgQVsxBlMXs+Ik7tYeS+dpfbUjM/O8hXpdo088vzg0bqfe4/dTgN
 EmoeDwtzP44ayf7Ec7qEaKB5T8QCTrFC9XRKweYhIXmsaGvScNxDqoL5BYfQmF0LSDXnc4J6+3kwP
 sZCcMoHXWonZbnNUpolIOgdHgcipe9n7jWya8hXzQzUJCYeirRD53mIEtLtQvkNx7sJeGRrryQpdr
 zQ4deauw==;
Received: from cm-81-9-209-58.telecable.es ([81.9.209.58] helo=[192.168.1.135])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjxbP-009Dbw-Qu; Tue, 12 Mar 2024 09:35:15 +0100
Message-ID: <d32f21e8952c904dc73abdf160cf5ed12ad45076.camel@igalia.com>
Subject: Re: [PATCH 1/5] drm/v3d: Fix return if scheduler initialization fails
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 12 Mar 2024 09:35:14 +0100
In-Reply-To: <20240311100959.205545-2-mcanal@igalia.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-2-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
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

This patch is: Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

El lun, 11-03-2024 a las 07:05 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> If the scheduler initialization fails, GEM initialization must fail
> as
> well. Therefore, if `v3d_sched_init()` fails, free the DMA memory
> allocated and return the error value in `v3d_gem_init()`.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index afc565078c78..66f4b78a6b2e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -290,8 +290,9 @@ v3d_gem_init(struct drm_device *dev)
> =C2=A0	ret =3D v3d_sched_init(v3d);
> =C2=A0	if (ret) {
> =C2=A0		drm_mm_takedown(&v3d->mm);
> -		dma_free_coherent(v3d->drm.dev, 4096 * 1024, (void
> *)v3d->pt,
> +		dma_free_coherent(v3d->drm.dev, pt_size, (void
> *)v3d->pt,
> =C2=A0				=C2=A0 v3d->pt_paddr);
> +		return ret;
> =C2=A0	}
>=20
> =C2=A0	return 0;
> --
> 2.43.0
>=20
>=20

