Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116727B54E2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 16:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE9E10E2C9;
	Mon,  2 Oct 2023 14:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7C410E2CE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696256890; x=1727792890;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4u2GIkPC8Lows7A66aUJtgItXyNMtyyFEmXHHDFAewg=;
 b=R79+aQkWFnX/WvZu0iJ3LDseTHmJZLLtSCJusrBjFrHks8W6RlzBR9Mz
 1nuF/1ve7KFd5lNm0k1vy5DYFsLimX1fiXFR6OTW0KGevNMU2fjbpAaIZ
 eMGbkq7t186C4513D+s6uq90EEVno2zO87whzf2iEKjuftr3a9QXvaYP/
 JfC3kk/Om7fG1pYFPP7nu678g2AWtBNGV/0E1ENjiuIww3wAayprAJOvU
 mEW2lZQNsSAUyNRX77SH8ORd7OkxlL9e8UA8l1Ts8BASE6MAMJ758Mb8R
 m9NfFdGIqwt7qAIRwCE3KcV9235rzLzvd6OoprtqBRe+LldcSTWYkFwrr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="382558368"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="382558368"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924288970"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="924288970"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:27:52 -0700
Message-ID: <09fedce26475023fb1089f8b0b77801e1d2363c0.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/ttm: Make sure the mapped tt pages are decrypted
 when needed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Date: Mon, 02 Oct 2023 16:27:49 +0200
In-Reply-To: <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
References: <20230926040359.3040017-1-zack@kde.org>
 <20230926175113.679880-1-zack@kde.org>
 <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
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
Cc: Huang Rui <ray.huang@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2023-10-02 at 10:16 +0200, Thomas Hellstr=C3=B6m wrote:
> Hi, Zack
>=20
> On 9/26/23 19:51, Zack Rusin wrote:
> > From: Zack Rusin <zackr@vmware.com>
> >=20
> > Some drivers require the mapped tt pages to be decrypted. In an
> > ideal
> > world this would have been handled by the dma layer, but the TTM
> > page
> > fault handling would have to be rewritten to able to do that.
> >=20
> > A side-effect of the TTM page fault handling is using a dma
> > allocation
> > per order (via ttm_pool_alloc_page) which makes it impossible to
> > just
> > trivially use dma_mmap_attrs. As a result ttm has to be very
> > careful
> > about trying to make its pgprot for the mapped tt pages match what
> > the dma layer thinks it is. At the ttm layer it's possible to
> > deduce the requirement to have tt pages decrypted by checking
> > whether coherent dma allocations have been requested and the system
> > is running with confidential computing technologies.
> >=20
> > This approach isn't ideal but keeping TTM matching DMAs
> > expectations
> > for the page properties is in general fragile, unfortunately proper
> > fix would require a rewrite of TTM's page fault handling.
> >=20
> > Fixes vmwgfx with SEV enabled.
> >=20
> > v2: Explicitly include cc_platform.h
> >=20
> > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for
> > page-based iomem")
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: <stable@vger.kernel.org> # v5.14+
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++++++--
> > =C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 ++++++++
> > =C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 ++++++++-
> > =C2=A0 3 files changed, 27 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index fd9fd3d15101..0b3f4267130c 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -294,7 +294,13 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object
> > *bo, struct ttm_resource *res,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum ttm_caching cachin=
g;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0man =3D ttm_manager_typ=
e(bo->bdev, res->mem_type);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0caching =3D man->use_tt ? bo=
->ttm->caching : res-
> > >bus.caching;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (man->use_tt) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0caching =3D bo->ttm->caching;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (bo->ttm->page_flags & TTM_TT_FLAG_DECRYPTED)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tmp =
=3D pgprot_decrypted(tmp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0caching =3D res->bus.caching;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ttm_prot_from_ca=
ching(caching, tmp);
> > =C2=A0 }
> > @@ -337,6 +343,8 @@ static int ttm_bo_kmap_ttm(struct
> > ttm_buffer_object *bo,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.no_wait_gpu =3D false
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ttm_tt *ttm =3D =
bo->ttm;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ttm_resource_manager =
*man =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm_ma=
nager_type(bo->bdev, bo->resource-
> > >mem_type);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pgprot_t prot;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > =C2=A0=20
> > @@ -346,7 +354,8 @@ static int ttm_bo_kmap_ttm(struct
> > ttm_buffer_object *bo,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (num_pages =3D=3D 1 && tt=
m->caching =3D=3D ttm_cached) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (num_pages =3D=3D 1 && tt=
m->caching =3D=3D ttm_cached &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(man->us=
e_tt && (ttm->page_flags &
> > TTM_TT_FLAG_DECRYPTED))) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We're mapping a single page, and the desired
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page protection is consistent with the bo.
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > b/drivers/gpu/drm/ttm/ttm_tt.c
> > index e0a77671edd6..e4966e2c988d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -31,6 +31,7 @@
> > =C2=A0=20
> > =C2=A0 #define pr_fmt(fmt) "[TTM] " fmt
> > =C2=A0=20
> > +#include <linux/cc_platform.h>
> > =C2=A0 #include <linux/sched.h>
> > =C2=A0 #include <linux/shmem_fs.h>
> > =C2=A0 #include <linux/file.h>
> > @@ -81,6 +82,13 @@ int ttm_tt_create(struct ttm_buffer_object *bo,
> > bool zero_alloc)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("Illegal buffer object type\n");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * When using dma_alloc_cohe=
rent with memory encryption the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mapped TT pages need to b=
e decrypted or otherwise the
> > drivers
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * will end up sending encry=
pted mem to the gpu.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bdev->pool.use_dma_alloc=
 &&
> > cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>=20
> You need to use CC_ATTR_GUEST_MEM_ENCRYPT here rather than=20
> CC_ATTR_MEM_ENCRYPT to avoid touching and breaking the SME case and
> only=20
> fix the SEV / SEV-ES case. I'd also hold off the stable inclusion
> until=20
> it's completely verified that this doesn't break anything because if
> it=20
> does, I suspect all hell will break loose.
>=20
> With that said, for the functionality
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> But I think this needs a wider Ack at the ttm / drm level for the=20
> approach taken.
>=20
> /Thomas.

FWIW, I think that if TTM_TT_FLAG_DECRYPTED is set, it should be
possible to add a debug WARN_ON_ONCE() if the first PTE of the dma
page's kernel virtual address does not use a decrypted pgprot_t. One
way of accessing the PTEs in a platform-generic fashion is
apply_to_page_range().

/Thomas




>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0page_flags |=3D TTM_TT_FLAG_DECRYPTED;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bo->ttm =3D bdev->funcs=
->ttm_tt_create(bo, page_flags);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(bo->ttm =
=3D=3D NULL))
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index a4eff85b1f44..2b9d856ff388 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -79,6 +79,12 @@ struct ttm_tt {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 page_fla=
gs =3D TTM_TT_FLAG_EXTERNAL |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_T=
T_FLAG_EXTERNAL_MAPPABLE;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TTM_TT_FLAG_DECRYPTED: Th=
e mapped ttm pages should be
> > marked as
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * not encrypted. The framew=
ork will try to match what the
> > dma layer
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is doing, but note that i=
t is a little fragile because
> > ttm page
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * fault handling abuses the=
 DMA api a bit and
> > dma_map_attrs can't be
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * used to assure pgprot alw=
ays matches.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TTM_TT_FLAG_PRIV_POP=
ULATED: TTM internal only. DO NOT
> > USE. This is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * set by TTM after ttm=
_tt_populate() has successfully
> > returned, and is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * then unset when TTM =
calls ttm_tt_unpopulate().
> > @@ -87,8 +93,9 @@ struct ttm_tt {
> > =C2=A0 #define TTM_TT_FLAG_ZERO_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(1)
> > =C2=A0 #define TTM_TT_FLAG_EXTERNAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0BIT(2)
> > =C2=A0 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE=C2=A0BIT(3)
> > +#define TTM_TT_FLAG_DECRYPTED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0BIT(4)
> > =C2=A0=20
> > -#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(4)
> > +#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BIT(5)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t page_flags;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** @num_pages: Number =
of pages in the page array. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint32_t num_pages;

