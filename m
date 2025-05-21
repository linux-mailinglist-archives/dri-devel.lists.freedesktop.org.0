Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBAABEBBD
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1875E10E10A;
	Wed, 21 May 2025 06:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gh5hGvmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4010E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747807793;
 bh=lsoNQydVBe6kyb2yf9EKCr711zBK69XTFkmPXqoOOGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gh5hGvmqHACRwikgRWx0e7RR5z8SkiGFX7Q8bj+XVZUby8zWmIZnugenLArIdtiqk
 GxB2PwHSPkQXpvZAKYu1byfL8zC6RHovb2NaSz+FLLUWZ0Rtr/t5jFSWGA7DQfdPOo
 ijKEhuonB5G4bXuvh6pxIG/z6OkVqU6Md7zVUikkLUyy0vmAFUepmRuqanQ9UWlNZH
 Kg6a6Xo+jiTnM9cd+xuvB6xktGsE1l2Rbgry1wsGEinAtjuhxVSVFGomyRMRIdCxaM
 S57zQPLIrFmLKrUdq977kSYE5P7cuDoGbrLBTG3M/AAGPQhxjDU5ROGdMWXGUTvwHv
 IQdEH5+gXAUIQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BEF8317E0FBA;
 Wed, 21 May 2025 08:09:52 +0200 (CEST)
Date: Wed, 21 May 2025 08:09:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 2/5] drm/panfrost: Internally label some BOs
Message-ID: <20250521080948.1b68a6a1@collabora.com>
In-Reply-To: <20250520174634.353267-3-adrian.larumbe@collabora.com>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-3-adrian.larumbe@collabora.com>
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

On Tue, 20 May 2025 18:43:59 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Perfcnt samples buffer is not exposed to UM, but we would like to keep
> a tag on it as a potential debug aid.
>=20
> PRIME imported GEM buffers are UM exposed, but since the usual Panfrost
> UM driver code path is not followed in their creation, they might remain
> unlabelled for their entire lifetime, so a generic tag was deemed
> preferable. The tag is assigned before a UM handle is created so it
> doesn't contradict the logic about labelling internal BOs.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c     | 10 ++++++++++
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  2 ++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index 4c5be7ccc9cc..04483d5fb45d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -305,6 +305,16 @@ panfrost_gem_prime_import_sg_table(struct drm_device=
 *dev,
>  	bo =3D to_panfrost_bo(obj);
>  	bo->noexec =3D true;
> =20
> +	/*
> +	 * We assign this generic label because this function cannot
> +	 * be reached through any of the Panfrost UM driver-specific
> +	 * code paths, unless one is given by explicitly calling the
> +	 * SET_LABEL_BO ioctl. It is therefore preferable to have a
> +	 * blanket BO tag that tells us the object was imported from
> +	 * another driver than nothing at all.
> +	 */
> +	panfrost_gem_internal_set_label(obj, "GEM PRIME buffer");
> +
>  	return obj;
>  }
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index 52befead08c6..563f16bae543 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -111,6 +111,8 @@ static int panfrost_perfcnt_enable_locked(struct panf=
rost_device *pfdev,
>  		goto err_put_mapping;
>  	perfcnt->buf =3D map.vaddr;
> =20
> +	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
> +
>  	/*
>  	 * Invalidate the cache and clear the counters to start from a fresh
>  	 * state.

