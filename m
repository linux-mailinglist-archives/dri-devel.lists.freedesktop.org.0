Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C305D8282D5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 10:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1939510E313;
	Tue,  9 Jan 2024 09:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1D310E0AD;
 Tue,  9 Jan 2024 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704791835; x=1736327835;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=UuORAX7I9MxlSVr5DSq/uhcxoKFIHBwxLkIKZamftmI=;
 b=RkrwIH8NVFqpxRLD4J/HWlpgeQI9ijr11D95CKYgPrT0ZTnSeHpTvUtH
 OyseTlJaiWcCNj3gk/1L3/VMWqXRKCYP9UDW8ATCCjoXRyaFtT6hbtmrb
 wCMfNkK/aJo8/s0MV1sRPZDYAlj1L7dbZtUKvGZt1xQPmIFFGMrEWCmPO
 oHUiTB6L8XU96ojrW+CQwX8Wl9MhyS3OSkHRM4Xu+oeyK2XEpcY3FPCkt
 o77hDgcnAgHC46pzPutQGfz7ghVYu/yrVMFNgelgubzHoANDI1WJfMcqj
 NRCUx4vw9WYZu0eRrk+Ngv0aI1YEqSNVQF5clxwIIzUl85g30VNrQ5jBO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4896538"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4896538"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113021567"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="1113021567"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.147])
 ([10.249.254.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 01:17:12 -0800
Message-ID: <1edac68920a5927281c6757d9f78b6045f10602c.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/ttm: return ENOSPC from ttm_bo_mem_space
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 zack.rusin@broadcom.com, lyude@redhat.com, kherbst@redhat.com, 
 jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 09 Jan 2024 10:17:09 +0100
In-Reply-To: <20240109074729.3646-3-christian.koenig@amd.com>
References: <20240109074729.3646-1-christian.koenig@amd.com>
 <20240109074729.3646-3-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Tue, 2024-01-09 at 08:47 +0100, Christian K=C3=B6nig wrote:
> Only convert it to ENOMEM in ttm_bo_validate.
>=20

Could we have a more elaborate commit description here, (why is this
change needed)?

> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b..8c1eaa74fa21 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object
> *bo,
> =C2=A0			goto error;
> =C2=A0	}
> =C2=A0
> -	ret =3D -ENOMEM;
> +	ret =3D -ENOSPC;
> =C2=A0	if (!type_found) {
> =C2=A0		pr_err(TTM_PFX "No compatible memory type found\n");
> =C2=A0		ret =3D -EINVAL;
> @@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> +	/* For backward compatibility with userspace */
> +	if (ret =3D=3D -ENOSPC)
> +		return -ENOMEM;
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0

