Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1A9FAD28
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 11:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D69D10E4BD;
	Mon, 23 Dec 2024 10:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9rjyaW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0BF10E4BD;
 Mon, 23 Dec 2024 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734949888; x=1766485888;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yuQIyji4edMNjkCnc36ai5gC3HyCrvCxQ6zuLgaS9xA=;
 b=J9rjyaW7dmbyTHbSzYPhN78d01zqq2qOHHXUfLgw9AysClMvbccELmrh
 /Y2B6BrJNzTZ6KZRvomxEqj4tN19B9SeG5rDKRPZesth1lgJpmsJWAp9d
 gRC+mVuc/9baa8XQsvd2bcm5FkRFVI67CLm9TeE4yuGjF8tdL/d7SUtdK
 YMGzZFenD/TfP1Q/DjM5SEQcnuDLoGBqik5ldJqUETf0Z5Lv9A9fu8mZ/
 rXrPM6mtoEwyxzlWIGxDk0zXcDkM1CyK9YlWMX9g5gCO4WADx1jdI9+wN
 QkCxPP1NLeOyqH4zz4ZYXlDLZ4pDRERiAUJxstkn14N1qxjL9YP4mthKX A==;
X-CSE-ConnectionGUID: akjaMYAWSG+ba2nLXhG7Nw==
X-CSE-MsgGUID: mbi3UR7EQdWazhSxRMcDVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35549739"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="35549739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 02:31:28 -0800
X-CSE-ConnectionGUID: Jag1zyvASHizmHnqF0ja4A==
X-CSE-MsgGUID: f+hNblITSDeE0JY3OOX5aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; d="scan'208";a="99693878"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.74])
 ([10.245.246.74])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 02:31:25 -0800
Message-ID: <b3145cc1cb5470e00070136add75159e07bbad3a.camel@linux.intel.com>
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost
 <matthew.brost@intel.com>,  Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Simona Vetter <simona@ffwll.ch>
Date: Mon, 23 Dec 2024 11:31:23 +0100
In-Reply-To: <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
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

On Fri, 2024-12-20 at 13:31 +0200, Mika Kuoppala wrote:
> Implement debugger vm access for userptrs.
>=20
> When bind is done, take ref to current task so that
> we know from which vm the address was bound. Then during
> debugger pread/pwrite we use this target task as
> parameter to access the debuggee vm with access_process_vm().
>=20
> This is based on suggestions from Thomas, Joonas and Simona.
>=20
> v2: need to add offset into vma (Dominik)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_eudebug.c=C2=A0 | 13 +++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28=
 +++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 6 ++++++
> =C2=A04 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c
> b/drivers/gpu/drm/xe/xe_eudebug.c
> index 9d87df75348b..8b29192ab110 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3074,6 +3074,19 @@ static int xe_eudebug_vma_access(struct xe_vma
> *vma, u64 offset_in_vma,

AFAICT all across the core mm code, unsigned long is used for mm
offsets, rather than u64, which we use for gpu- and physical offsets.


> =C2=A0		xe_bo_put(bo);
> =C2=A0
> =C2=A0		return ret;
> +	} else if (xe_vma_is_userptr(vma)) {
> +		struct xe_userptr *userptr =3D &to_userptr_vma(vma)-
> >userptr;
> +
> +		/*
> +		 * XXX: access_remote_vm() would fit as userptr
> notifier has
> +		 * mm ref so we would not need to carry task ref at
> all.
> +		 * But access_remote_vm is not exported.
> access_process_vm()
> +		 * is exported so use it instead.
> +		 */

Could we add a follow-up patch that exports access_remote_vm() and
changes this code to use access_remote_vm() instead?



> +		return access_process_vm(userptr->eudebug.task,
> +					 xe_vma_userptr(vma) +
> offset_in_vma,
> +					 buf, bytes,
> +					 write ? FOLL_WRITE : 0);
> =C2=A0	}
> =C2=A0
> =C2=A0	return -EINVAL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1cb21325d8dd..235ae2db5188 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -999,6 +999,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0			}
> =C2=A0
> =C2=A0			userptr->notifier_seq =3D LONG_MAX;
> +
> +			xe_eudebug_track_userptr_task(userptr);
> =C2=A0		}
> =C2=A0
> =C2=A0		xe_vm_get(vm);
> @@ -1023,6 +1025,8 @@ static void xe_vma_destroy_late(struct xe_vma
> *vma)
> =C2=A0		if (userptr->sg)
> =C2=A0			xe_hmm_userptr_free_sg(uvma);
> =C2=A0
> +		xe_eudebug_untrack_userptr_task(userptr);
> +
> =C2=A0		/*
> =C2=A0		 * Since userptr pages are not pinned, we can't
> remove
> =C2=A0		 * the notifer until we're sure the GPU is not
> accessing
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 23adb7442881..4334cf2b0d9d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -274,9 +274,35 @@ static inline void vm_dbg(const struct
> drm_device *dev,
> =C2=A0			=C2=A0 const char *format, ...)
> =C2=A0{ /* noop */ }
> =C2=A0#endif
> -#endif
> =C2=A0
> =C2=A0struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> =C2=A0void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> =C2=A0void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> drm_printer *p);
> =C2=A0void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr
> *userptr)
> +{
> +	/*
> +	 * We could use the mm which is on notifier. But
> +	 * the access_remote_vm() is not exported. Thus
> +	 * we get reference to task for access_process_vm()
> +	 */
> +	userptr->eudebug.task =3D get_task_struct(current);
> +}
> +
> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr
> *userptr)
> +{
> +	put_task_struct(userptr->eudebug.task);
> +}
> +#else
> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr
> *userptr)
> +{
> +}
> +
> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr
> *userptr)
> +{
> +}
> +#endif /* CONFIG_DRM_XE_EUDEBUG */
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 557b047ebdd7..26176ccbcbbc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -68,6 +68,12 @@ struct xe_userptr {
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> =C2=A0	u32 divisor;
> =C2=A0#endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +	struct {
> +		struct task_struct *task;
> +	} eudebug;
> +#endif
> =C2=A0};
> =C2=A0
> =C2=A0struct xe_vma {

Otherwise LGTM.
Thanks,
Thomas


