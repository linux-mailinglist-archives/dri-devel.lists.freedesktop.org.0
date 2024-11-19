Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC99D2BB0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D54810E68F;
	Tue, 19 Nov 2024 16:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SStCsmit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B7810E68F;
 Tue, 19 Nov 2024 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732035116; x=1763571116;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5FO0Dc3mn/S8AcyhOMg9ag6KPq8Bd2iZ3FlzWGj/EDo=;
 b=SStCsmitKuVztM0lv8Xn2GsmqoW/1raq0ludLv+3XuDgIFtgIjdxz5UB
 RJEgWr0A6332a+wH370NI5If1bNbgM3ZptL+otba8aL7s7wUgxljHWIHY
 yZG7u9MiijEMUhNf95biIFQnvZ0M19UKWbNSwlls3d8WJLCv9O5xR8G9Q
 ftD84CZDY0acPzb37p1/v8oeIXOEab4aeZe4VXr3GQHfUUOE/6s2q2Unu
 1u4pRSSBAl3X8H8wReDUhAyrvn08Hi6oJZtv/iQ3OonZnVUs0Tp/JwCt9
 nFAxRnt6HF2kzH65cb+L2HZ9NRlRgN2O80we7aew+81/hXwWHVgUo1iG+ Q==;
X-CSE-ConnectionGUID: /SpWCJYDSHqQXZ9zGnXVEQ==
X-CSE-MsgGUID: lK5PB+5GSTObtuJFuWBhfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49586815"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="49586815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:51:56 -0800
X-CSE-ConnectionGUID: wQYrOxaCSfiLTlwjy2sx6w==
X-CSE-MsgGUID: xHLdUCQZRIivx2tQRXP7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89554604"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:51:54 -0800
Message-ID: <9852474d609ce6527283b4dd2391b507322d2dfe.camel@linux.intel.com>
Subject: Re: [PATCH v2 18/29] drm/xe: Add drm_gpusvm_devmem to xe_bo
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 17:51:50 +0100
In-Reply-To: <20241016032518.539495-19-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-19-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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
> Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 13c6d8a69e91..54d337004621 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -8,6 +8,8 @@
> =C2=A0
> =C2=A0#include <linux/iosys-map.h>
> =C2=A0
> +#include "drm_gpusvm.h"
> +
> =C2=A0#include <drm/ttm/ttm_bo.h>
> =C2=A0#include <drm/ttm/ttm_device.h>
> =C2=A0#include <drm/ttm/ttm_execbuf_util.h>
> @@ -74,6 +76,9 @@ struct xe_bo {
> =C2=A0	 */
> =C2=A0	u16 cpu_caching;
> =C2=A0
> +	/** @devmem_allocation: SVM device memory allocation */
> +	struct drm_gpusvm_devmem devmem_allocation;
> +

I think this can go away with follow-up multi-device patches, but for
now
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> =C2=A0	/** @vram_userfault_link: Link into
> @mem_access.vram_userfault.list */
> =C2=A0		struct list_head vram_userfault_link;
> =C2=A0

