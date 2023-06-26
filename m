Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDA73E30D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6466A10E22A;
	Mon, 26 Jun 2023 15:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C7A10E228;
 Mon, 26 Jun 2023 15:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687792730; x=1719328730;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F2g+pWN+PH46QX+4CgNzEGk83Zi05IvEs2wwYLZavzE=;
 b=G3YRQOW/7rzv0U03KpHOc0orNv5UcohEnxaBB4Yx/ltwfimdFFSv1U0W
 Cb17/KewBbxYcQjoEcxyBd930UYO/JGb74VysY+42m5gnCYMFKW5MwLpA
 SLeY4QXIzexrPngQoREqdLxJ9IdKYndrO2mloS2W/djH+V4q2U45pTKGU
 /u2G+rMJUHGZ64jrEHjIkFgh6/SNQvvVpXeNX0kpv22X+2FdPSgE3FDV1
 gWQxylJPGOT2DKA+d4tXkPVO/TSjpC9tDNNYamVivDzDVyAFpNnof6Riy
 ga2gArwGODl04Koe9T0q/DPFzcv0y+PUM7kU8Ihtr5c4SZANBY6M7QD+o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="391630725"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="391630725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 08:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="860725040"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="860725040"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.105])
 ([10.249.254.105])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 08:18:19 -0700
Message-ID: <88cbec2d2ae6329d44426cece4b558b7d83b1ff6.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/4] drm/ttm: Don't shadow the operation context
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 17:18:16 +0200
In-Reply-To: <8b22c855-c84d-4b56-c94b-a3a079ab3037@gmail.com>
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
 <20230626091450.14757-3-thomas.hellstrom@linux.intel.com>
 <8b22c855-c84d-4b56-c94b-a3a079ab3037@gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Roger He <Hongbo.He@amd.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-06-26 at 17:15 +0200, Christian K=C3=B6nig wrote:
> Am 26.06.23 um 11:14 schrieb Thomas Hellstr=C3=B6m:
> > ttm_bo_swapout() shadows the ttm operation context which may cause
> > major confusion in driver callbacks when swapping out
> > !TTM_PL_SYSTEM
> > memory. Fix this by reusing the operation context argument to
> > ttm_bo_swapout().
> >=20
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Roger He <Hongbo.He@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Cc: <intel-gfx@lists.freedesktop.org>
> > Cc: <stable@vger.kernel.org> # v4.16+
> > Fixes: dc947770cf34 ("drm/ttm: enable swapout for reserved BOs
> > during allocation")
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
>=20
> We intentionally didn't used the parameter here, but I absolutely
> can't=20
> figure out why.
>=20
> Feel free to add my rb, but let's give it some time upstream before
> you=20
> base anything on top of this. Just in case we missed something.

Sure. Thanks for reviewing,
/Thomas

>=20
> Regards,
> Christian.
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
> > =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index bd5dae4d1624..615d30c4262d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1154,7 +1154,6 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Move to system cache=
d
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bo->resource->mem_t=
ype !=3D TTM_PL_SYSTEM) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0struct ttm_operation_ctx ctx =3D { false, false };
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ttm_resource *evict_mem;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ttm_place hop;
> > =C2=A0=20
> > @@ -1164,7 +1163,7 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
goto out;
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D ttm_bo_handle_move_mem(bo, evict_mem, true,
> > &ctx, &hop);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D ttm_bo_handle_move_mem(bo, evict_mem, true,
> > ctx, &hop);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(ret !=3D 0)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
WARN(ret =3D=3D -EMULTIHOP, "Unexpected
> > multihop in swaput - likely driver bug.\n");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
goto out;
>=20

