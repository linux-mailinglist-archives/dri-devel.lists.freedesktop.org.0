Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38239DFEB1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454BB10E6A3;
	Mon,  2 Dec 2024 10:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnzQuMtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4410E215;
 Mon,  2 Dec 2024 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733134866; x=1764670866;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3p1IfoqboF/SNZVJMlXGFR/c9ZxP+0Y/PRconJxlFIQ=;
 b=MnzQuMtQTdhRgQOqxI6rf46b5ZLy0/Oq1e/jxGk+tII8IACLHu5Zg32M
 VA3/SC7OCwV59BlF08EDH/rzukQV8nBbkcgn2xlBHVtRennCMD71bBIkM
 oJxMwBAVR0XHNeNIRp8K+IJtxTAAWRm7/a3MEKXi0zwQCO7+QsOha5mcG
 ss3fNVbZd+AmtgO0nff0iMrV7zFC0F5wJCEDU5jOygmNfbrOD8rpfZMNj
 3UA/2LWHdC9Px4nndv8dnR4BKhnjGNSvfF6e5semO2Bzd5oBYMY6gAL9l
 HIwLy1rQytC6cYMUXjm6SJSmxUBY1McysvSfbsHesS64ZI+XZ19uaxWyo g==;
X-CSE-ConnectionGUID: vXGJJiMGQxyocJLaIQ8Htg==
X-CSE-MsgGUID: 7a2mjtxBSqy5gd92hFcjfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33354131"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33354131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:21:05 -0800
X-CSE-ConnectionGUID: r9iuN8PaQlqg1llVDJFzkw==
X-CSE-MsgGUID: 5Cw0RPbTQlyd6VCTkuUMpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98098711"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:21:02 -0800
Message-ID: <5b217ed67ca940a853c8e93ce5101cbbdc8d335e.camel@linux.intel.com>
Subject: Re: [PATCH v2 22/29] drm/xe: Add Xe SVM devmem_release vfunc
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 11:21:00 +0100
In-Reply-To: <20241016032518.539495-23-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-23-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Implement with a simple BO put.
>=20
> v2:
> =C2=A0- Use new drm_gpusvm_devmem_ops
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 19fcb8f71791..976b4ce15db4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include "drm_gpusvm.h"
> =C2=A0
> +#include "xe_bo.h"
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pt.h"
> @@ -419,6 +420,11 @@ static struct xe_bo *to_xe_bo(struct
> drm_gpusvm_devmem *devmem_allocation)
> =C2=A0	return container_of(devmem_allocation, struct xe_bo,
> devmem_allocation);
> =C2=A0}
> =C2=A0
> +static void xe_svm_devmem_release(struct drm_gpusvm_devmem
> *devmem_allocation)
> +{
> +	xe_bo_put(to_xe_bo(devmem_allocation));
> +}
> +
> =C2=A0static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset=
)
> =C2=A0{
> =C2=A0	return PHYS_PFN(offset + mr->hpa_base);
> @@ -454,6 +460,7 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_gpusvm_devmem *devmem_allocatio
> =C2=A0
> =C2=A0__maybe_unused
> =C2=A0static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> +	.devmem_release =3D xe_svm_devmem_release,
> =C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> =C2=A0	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> =C2=A0	.copy_to_ram =3D xe_svm_copy_to_ram,

