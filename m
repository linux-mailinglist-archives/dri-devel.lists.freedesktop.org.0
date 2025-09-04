Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271CB433E9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7522310E98D;
	Thu,  4 Sep 2025 07:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKcr6dlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EF310E98D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 07:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756970798; x=1788506798;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i0F5lNteMALrTYDGoDG8/FgXqYsXm7BEOL81RXy5tyg=;
 b=oKcr6dlCHqyGQcxSC+8KhhM3mmGWsbqDheeG+GkD9zumjcUbiuPi1CoM
 177lypMFbfDcKBDaEEJ8zZGDkCv9SY+hk3bp5LvLUkylAUgeMGBR6iPaQ
 pVnlDkMC4/95VdlM+kpbvIO9f3xzpS4x/mIaaCnnMdVg5K9k10MkAZ65j
 EiqY13MNlXn8/hnQm7quhsMjfubuo3Z/YccYfbKO0yt+Pq6BswTad6mVZ
 hcwQhgJfFToBSBzjlspK84S2eFsWyMLVHyl9kPaWWEiopPb2BOjT2/x9I
 3jYIhcrndC0XE4wmm8qriUsBTslA8tED/5S7PnZT2rTxTJWm9drD/mDyr g==;
X-CSE-ConnectionGUID: GObnwnGnTgmcKoeU2C1uFg==
X-CSE-MsgGUID: avMuOf+uRou1YgQ0t9Astg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76904004"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76904004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:26:37 -0700
X-CSE-ConnectionGUID: ugqPuJjGQ0KJvAHfL8p7Sw==
X-CSE-MsgGUID: hr5BWuCgRvyxd20soLbZ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="177082159"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.98])
 ([10.245.244.98])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:26:35 -0700
Message-ID: <4a929eba67199b3fbf92bf3232c64fec444fc3cf.camel@linux.intel.com>
Subject: Re: [PATCH 4/4] xe: populate buffers before exporting them.
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
Date: Thu, 04 Sep 2025 09:26:30 +0200
In-Reply-To: <20250904021643.2050497-4-airlied@gmail.com>
References: <20250904021643.2050497-1-airlied@gmail.com>
 <20250904021643.2050497-4-airlied@gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-09-04 at 12:16 +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Before exporting a buffer, make sure it has been populated with
> pages at least once.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 346f857f3837..71b70e17bddd 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -191,10 +191,22 @@ struct dma_buf *xe_gem_prime_export(struct
> drm_gem_object *obj, int flags)
> =C2=A0{
> =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> =C2=A0	struct dma_buf *buf;
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D true,
> +		.no_wait_gpu =3D true,
> +		/* We opt to avoid OOM on system pages allocations
> */
> +		.gfp_retry_mayfail =3D true,
> +		.allow_res_evict =3D false,
> +	};
> +	int ret;
> =C2=A0
> =C2=A0	if (bo->vm)
> =C2=A0		return ERR_PTR(-EPERM);
> =C2=A0
> +	ret =3D ttm_bo_setup_export(&bo->ttm, &ctx);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> =C2=A0	buf =3D drm_gem_prime_export(obj, flags);
> =C2=A0	if (!IS_ERR(buf))
> =C2=A0		buf->ops =3D &xe_dmabuf_ops;

