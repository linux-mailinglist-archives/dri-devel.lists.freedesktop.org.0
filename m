Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692D5A229D4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 09:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E71610E2C7;
	Thu, 30 Jan 2025 08:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/Fc8G58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE6D10E2C3;
 Thu, 30 Jan 2025 08:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738227000; x=1769763000;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SetrKBz2hWmuMtszJsU4/1PpfA7ZbIM4P0fDaEB1/h4=;
 b=e/Fc8G58UhwgbNKiL7jzgpnH57E1nxsWnd/JWAMDzBhO+ErJ8VxvYYS6
 x0fgTOOCuRwcIb6QOHC1xeGpRJyFHUoosVZRzLEdha6MIUdTM28VsOYSt
 cLtdxrqISw6dLGVrH4yk3cPefVKVcpUC/0aeUMIN4eOzh76GePa3u2GIb
 q3Y31q3wbwyvhs85LDWRecH9JHA+ijZsqv412YWgRjaakdwKBUhwI+oaW
 1u6pZVLO4apgAuFk6mBRsmgC1pIK9nk3Xu1m6Y7GM7Wm7DjBJfssnxWu4
 hvWg+jequ0La890iZRE8USahUN++5N7TwbNbZxc1zW7Df2wGOjMHRzfvk w==;
X-CSE-ConnectionGUID: tscVGJx+SBuhWN0IO8jOaQ==
X-CSE-MsgGUID: jRB2j2+dQhOwgNpRgG12fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56301653"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56301653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:49:59 -0800
X-CSE-ConnectionGUID: DKWU7+KkRcG/N2zNrkCssA==
X-CSE-MsgGUID: ANLH1lcyThyao+sTHoBFFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109712198"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.79])
 ([10.245.246.79])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:49:57 -0800
Message-ID: <bab72822f953bb938efa37f6c3e4e59dbbfc39ac.camel@linux.intel.com>
Subject: Re: [PATCH v4 05/33] drm/xe/bo: Introduce xe_bo_put_async
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Thu, 30 Jan 2025 09:49:54 +0100
In-Reply-To: <20250129195212.745731-6-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-6-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Introduce xe_bo_put_async to put a bo where the context is such that
> the bo destructor can't run due to lockdep problems or atomic
> context.
>=20
> If the put is the final put, freeing will be done from a work item.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 3 +++
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++++++
> =C2=A04 files changed, 49 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index fb1629d9d566..e914a60b8afc 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2544,6 +2544,31 @@ void xe_bo_put_commit(struct llist_head
> *deferred)
> =C2=A0		drm_gem_object_free(&bo->ttm.base.refcount);
> =C2=A0}
> =C2=A0
> +static void xe_bo_dev_work_func(struct work_struct *work)
> +{
> +	struct xe_bo_dev *bo_dev =3D container_of(work,
> typeof(*bo_dev), async_free);
> +
> +	xe_bo_put_commit(&bo_dev->async_list);
> +}
> +
> +/**
> + * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
> +{
> +	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
> +}
> +
> +/**
> + * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
> + * @bo_dev: The BO dev structure
> + */
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
> +{
> +	flush_work(&bo_dev->async_free);
> +}
> +
> =C2=A0void xe_bo_put(struct xe_bo *bo)
> =C2=A0{
> =C2=A0	struct xe_tile *tile;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 04995c5ced32..ce55a2bb13f6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -317,6 +317,19 @@ xe_bo_put_deferred(struct xe_bo *bo, struct
> llist_head *deferred)
> =C2=A0
> =C2=A0void xe_bo_put_commit(struct llist_head *deferred);
> =C2=A0
> +static inline void
> +xe_bo_put_async(struct xe_bo *bo)

Needs kerneldoc. I will rebase my multi-device series on this one, Let
me know if you'll add that or if I should do it when rebasing my multi-
device series on this one.

> +{
> +	struct xe_bo_dev *bo_device =3D &xe_bo_device(bo)->bo_device;
> +
> +	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> +		schedule_work(&bo_device->async_free);
> +}
> +
> +void xe_bo_dev_init(struct xe_bo_dev *bo_device);
> +
> +void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
> +
> =C2=A0struct sg_table *xe_bo_sg(struct xe_bo *bo);
> =C2=A0
> =C2=A0/*
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 8fedc72e9db4..5fac3d40cc8e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -387,6 +387,8 @@ static void xe_device_destroy(struct drm_device
> *dev, void *dummy)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D to_xe_device(dev);
> =C2=A0
> +	xe_bo_dev_fini(&xe->bo_device);
> +
> =C2=A0	if (xe->preempt_fence_wq)
> =C2=A0		destroy_workqueue(xe->preempt_fence_wq);
> =C2=A0
> @@ -424,6 +426,7 @@ struct xe_device *xe_device_create(struct pci_dev
> *pdev,
> =C2=A0	if (WARN_ON(err))
> =C2=A0		goto err;
> =C2=A0
> +	xe_bo_dev_init(&xe->bo_device);
> =C2=A0	err =3D drmm_add_action_or_reset(&xe->drm, xe_device_destroy,
> NULL);
> =C2=A0	if (err)
> =C2=A0		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 89f532b67bc4..71151532e28f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -519,6 +519,14 @@ struct xe_device {
> =C2=A0		int mode;
> =C2=A0	} wedged;
> =C2=A0
> +	/** @bo_device: Struct to control async free of BOs */
> +	struct xe_bo_dev {
> +		/** @async_free: Free worker */
> +		struct work_struct async_free;
> +		/** @async_list: List of BOs to be freed */
> +		struct llist_head async_list;
> +	} bo_device;
> +
> =C2=A0	/** @pmu: performance monitoring unit */
> =C2=A0	struct xe_pmu pmu;
> =C2=A0

