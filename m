Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E268AC43B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5D31127E2;
	Mon, 22 Apr 2024 06:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l0unPOsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151E1127E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zLaVy7NgnuU2nW/U/SN9cU7zBDTnn0YmXAaZRaHy5Lk=; b=l0unPOslhjpM8jwQd4UMuCQvhh
 hqG3IarfpCAKJvCgkR2rK3SuXJfv+2A3tLz5wSzsgsXfWD/3RuT19/EziuZkXFEdYxQYjT19Cxs8M
 8JlUJ/wtoShrb7oRGpGJgfz6RIPJ27KyzPysYRBlzzAjw2XIW2WQyMGcn/qexDOzZRe+aWFMVhpna
 rhQ1Bl0MN/B6qYHfydTlVnfzr76N7HKIYTgsmLhUVOF+2IH8VZQiLCx6YtHyiPDDKvWL85stJckjy
 QMfSz12+ehlMSZec065MEoCL0UEzMig8kM36Yj7UtcGGfPJUVEK/ywLrY63teCvK4aKBJnisM8Vht
 nlMciBSw==;
Received: from 62.117.230.7.dyn.user.ono.com ([62.117.230.7]
 helo=[192.168.0.101]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rynD9-0079BD-Cw; Mon, 22 Apr 2024 08:31:31 +0200
Message-ID: <543f96c9fe88743f5e5ad7a38d515246f63fe825.camel@igalia.com>
Subject: Re: [PATCH v3 5/8] drm/v3d: Reduce the alignment of the node
 allocation
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Mon, 22 Apr 2024 08:31:30 +0200
In-Reply-To: <20240421215309.660018-6-mcanal@igalia.com>
References: <20240421215309.660018-1-mcanal@igalia.com>
 <20240421215309.660018-6-mcanal@igalia.com>
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

Thanks Ma=C3=ADra, this patch is:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

El dom, 21-04-2024 a las 18:44 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Currently, we are using an alignment of 128 kB to insert a node,
> which
> ends up wasting memory as we perform plenty of small BOs allocations
> (<=3D 4 kB). We require that allocations are aligned to 128Kb so for
> any
> allocation smaller than that, we are wasting the difference.
>=20
> This implies that we cannot effectively use the whole 4 GB address
> space
> available for the GPU in the RPi 4. Currently, we can allocate up to
> 32000 BOs of 4 kB (~140 MB) and 3000 BOs of 400 kB (~1,3 GB). This
> can be
> quite limiting for applications that have a high memory requirement,
> such
> as vkoverhead [1].
>=20
> By reducing the page alignment to 4 kB, we can allocate up to 1000000
> BOs
> of 4 kB (~4 GB) and 10000 BOs of 400 kB (~4 GB). Moreover, by
> performing
> benchmarks, we were able to attest that reducing the page alignment
> to
> 4 kB can provide a general performance improvement in OpenGL
> applications (e.g. glmark2).
>=20
> Therefore, this patch reduces the alignment of the node allocation to
> 4
> kB, which will allow RPi users to explore the whole 4GB virtual
> address space provided by the hardware. Also, this patch allow users
> to
> fully run vkoverhead in the RPi 4/5, solving the issue reported in
> [1].
>=20
> [1] https://github.com/zmike/vkoverhead/issues/14
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h | 2 --
> =C2=A02 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c
> b/drivers/gpu/drm/v3d/v3d_bo.c
> index a07ede668cc1..79e31c5299b1 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -110,7 +110,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
> =C2=A0	 */
> =C2=A0	ret =3D drm_mm_insert_node_generic(&v3d->mm, &bo->node,
> =C2=A0					 obj->size >>
> V3D_MMU_PAGE_SHIFT,
> -					 GMP_GRANULARITY >>
> V3D_MMU_PAGE_SHIFT, 0, 0);
> +					 SZ_4K >>
> V3D_MMU_PAGE_SHIFT, 0, 0);
> =C2=A0	spin_unlock(&v3d->mm_lock);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index d2ce8222771a..17236ee23490 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -17,8 +17,6 @@ struct clk;
> =C2=A0struct platform_device;
> =C2=A0struct reset_control;
> =C2=A0
> -#define GMP_GRANULARITY (128 * 1024)
> -
> =C2=A0#define V3D_MMU_PAGE_SHIFT 12
> =C2=A0
> =C2=A0#define V3D_MAX_QUEUES (V3D_CPU + 1)

