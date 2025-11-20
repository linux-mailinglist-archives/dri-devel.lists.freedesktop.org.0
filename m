Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAAC75497
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F4410E778;
	Thu, 20 Nov 2025 16:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StMadqWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFCD10E778;
 Thu, 20 Nov 2025 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763655471; x=1795191471;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/2fPZfB59KUyz2Lm6t6OUzeT1S0pxU0VW+s/4VKpB3w=;
 b=StMadqWu895iJe053u9fKvCJorJuklve25ifkunhQNx0CCwvOJQuA54q
 7ql/whQFCD2WgMhI0qQqNnCBeTEh/NtCb0LOJ9XR+6dlRbniFS85DNmeu
 41KbAN3PtlQAVDolyVHWfAd2p0FSDd+LtGrDDcay0cNVZL8t+Ppp3dKcT
 g/X5KyRZD6sPP/h+D6Txr1dqZVsfVrrjcJXsVC3RTFeJMsEc164tpWUfm
 booEPRyGi7Nduvy5LQEFUqMFvZyRuHYkk/dg3UlU11YaG6F/oPlA1JKrS
 oUJq6WKi2PUJWSRIIeq9xRpi8ZFQqe1ja/Z3w6jbF8aIlDa76t6Dyr138 Q==;
X-CSE-ConnectionGUID: k+/qZJrvSWqgjUaG14ifQQ==
X-CSE-MsgGUID: a6kfVrNhQ/GcfoE5H/34vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77093104"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="77093104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:17:50 -0800
X-CSE-ConnectionGUID: DfPRgqgtQXurIL07N/mL/g==
X-CSE-MsgGUID: tmc9Dr2xRveyYCoS7r69RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="190650292"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.244.142])
 ([10.245.244.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:17:47 -0800
Message-ID: <0401ba0139881d7d9a060876bdf7924888034265.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix memory leak when handling pagefault vma
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Stuart Summers	
 <stuart.summers@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 20 Nov 2025 17:17:44 +0100
In-Reply-To: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
References: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Thu, 2025-11-20 at 18:14 +0200, Mika Kuoppala wrote:
> When the pagefault handling code was moved to a new file, an extra
> drm_exec_init() was added to the VMA path. This call is unnecessary
> because
> xe_validation_ctx_init() already performs a drm_exec_init(),
> resulting in a
> memory leak reported by kmemleak.
>=20
> Remove the redundant drm_exec_init() from the VMA pagefault handling
> code.
>=20
> Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index fe3e40145012..afb06598b6e1 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -102,7 +102,6 @@ static int xe_pagefault_handle_vma(struct xe_gt
> *gt, struct xe_vma *vma,
> =C2=A0
> =C2=A0	/* Lock VM and BOs dma-resv */
> =C2=A0	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct
> xe_val_flags) {});
> -	drm_exec_init(&exec, 0, 0);
> =C2=A0	drm_exec_until_all_locked(&exec) {
> =C2=A0		err =3D xe_pagefault_begin(&exec, vma, tile->mem.vram,
> =C2=A0					 needs_vram =3D=3D 1);

