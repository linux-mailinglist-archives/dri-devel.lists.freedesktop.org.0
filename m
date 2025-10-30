Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD0C209E0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E010E9B7;
	Thu, 30 Oct 2025 14:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K+zr7UEo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0554E10E272;
 Thu, 30 Oct 2025 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761834932;
 bh=XsFKQJcZnJq+uVlimqD2hH4Nr2x6cyzczLSyOoOVMuw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K+zr7UEo7Wmw/Aoy4KfKJPjv63v6cGvsD2lVmsY36nxMHj5zDLdKq7zLA1O1PfmIM
 ZC9IR5GHfadpUAb7sy4g9PVuNb5W1GWsvLkNYvWduNnPzwDwt4kEiRxdUDg4xpadiu
 Y67XOk0UH5wbdCmykHAaWaHusxW6Epihna8JKbLEUWK+iWZG2NrqFUa8uGwUxrkhv3
 XqtvUIERm1++tiyWUfgDad0UtHVBQLGl/qJAeTDy0UlquIHiEmtqQgkah2BH210YQ7
 JRkNDmVmxFssAlRCKAnkrLSCjqfM3Y7E5t6fjJrIfJENWxJ4HvzqmzrndT5mz6MuMC
 KxewZKvSmqADA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 758C817E00A6;
 Thu, 30 Oct 2025 15:35:31 +0100 (CET)
Date: Thu, 30 Oct 2025 15:35:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v5 01/16] drm/prime: Simplify life of drivers needing
 custom dma_buf_ops
Message-ID: <20251030153503.59a8717b@fedora>
In-Reply-To: <ebe1c1d0-3d76-4468-b85d-5c4aa23e3cc6@amd.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-2-boris.brezillon@collabora.com>
 <ebe1c1d0-3d76-4468-b85d-5c4aa23e3cc6@amd.com>
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

On Thu, 30 Oct 2025 15:25:50 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 10/30/25 15:05, Boris Brezillon wrote:
> > drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
> > drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
> > driver implements custom dma_buf_ops. Instead of duplicating a bunch
> > of helpers to work around it, let's provide a way for drivers to
> > expose their custom dma_buf_ops so the core prime helpers can rely on
> > that instead of hardcoding &drm_gem_prime_dmabuf_ops. =20
>=20
> That's generally nice to have, I've re-implemented quite a number of func=
tions in amdgpu because of this as well.
>=20
> >=20
> > v5:
> > - New patch
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_prime.c | 14 +++++++++++---
> >  include/drm/drm_drv.h       |  8 ++++++++
> >  2 files changed, 19 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > index 43a10b4af43a..3796844af418 100644
> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -903,6 +903,15 @@ unsigned long drm_prime_get_contiguous_size(struct=
 sg_table *sgt)
> >  }
> >  EXPORT_SYMBOL(drm_prime_get_contiguous_size);
> > =20
> > +static const struct dma_buf_ops *
> > +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> > +{
> > +	if (dev->driver->gem_prime_get_dma_buf_ops)
> > +		return dev->driver->gem_prime_get_dma_buf_ops(dev); =20
>=20
> I have strong doubts that a driver changes their dma_buf ops during their=
 runtime, so instead of a callback could we just have it as pointer in drm_=
driver?

Sure thing, I considered doing that too actually.
