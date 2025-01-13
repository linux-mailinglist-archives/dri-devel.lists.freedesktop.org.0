Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DAA0B808
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFC210E043;
	Mon, 13 Jan 2025 13:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H44KFovy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C5C10E043;
 Mon, 13 Jan 2025 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736774502; x=1768310502;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GrvrYVSQwYKlYQw9RJsDqs+fB5MQ/c3zAg2cGTRQzgA=;
 b=H44KFovy6TGsl6GUsk/BbvDW4fzjDW50uAC5NsLK49xA+4K8BWz37wkG
 qeBWHTE22d7kgUEwDu3RvvPaU24FHReVSYI8szJbSi6nERdHu2bv/wbQj
 UpUh83lez72k0Sd2zdC32UbHYJ6Ma28FKmC277gZaRMP+p/fj9l+jXBi/
 LixVqRIhy4JQ0N8bpdPWJ6POHJmABd+5uINzVj41NtM7Kzsh2egRnOGAN
 cAogvcEIz2nPQ0/fLYHC6iVmaViCIkiBHmGNPsML7byvsoerRNEcS22oS
 2FOSz9hbsBIdJbh13hUn6lpBLGp2qk7xuuY4kCZVP5kaLb1kMCNQgCMPp Q==;
X-CSE-ConnectionGUID: EjDIymD8RFWKq9nRq4PVPg==
X-CSE-MsgGUID: mYz8D0SrRSyfZsbOuFXvyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36323832"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36323832"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:21:41 -0800
X-CSE-ConnectionGUID: kzB8uHE9Qq2gL6vHmqUaYw==
X-CSE-MsgGUID: 9wZ/kaOVQYW/hZ1xqY7WAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109506779"
Received: from unknown (HELO localhost) ([10.237.72.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:21:38 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost
 <matthew.brost@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
In-Reply-To: <b3145cc1cb5470e00070136add75159e07bbad3a.camel@linux.intel.com>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
 <b3145cc1cb5470e00070136add75159e07bbad3a.camel@linux.intel.com>
Date: Mon, 13 Jan 2025 15:22:48 +0200
Message-ID: <87wmeylufr.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> writes:

> On Fri, 2024-12-20 at 13:31 +0200, Mika Kuoppala wrote:
>> Implement debugger vm access for userptrs.
>>=20
>> When bind is done, take ref to current task so that
>> we know from which vm the address was bound. Then during
>> debugger pread/pwrite we use this target task as
>> parameter to access the debuggee vm with access_process_vm().
>>=20
>> This is based on suggestions from Thomas, Joonas and Simona.
>>=20
>> v2: need to add offset into vma (Dominik)
>>=20
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>> =C2=A0drivers/gpu/drm/xe/xe_eudebug.c=C2=A0 | 13 +++++++++++++
>> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++++
>> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
8 +++++++++++++++++++++++++++-
>> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 6 ++++++
>> =C2=A04 files changed, 50 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c
>> b/drivers/gpu/drm/xe/xe_eudebug.c
>> index 9d87df75348b..8b29192ab110 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -3074,6 +3074,19 @@ static int xe_eudebug_vma_access(struct xe_vma
>> *vma, u64 offset_in_vma,
>
> AFAICT all across the core mm code, unsigned long is used for mm
> offsets, rather than u64, which we use for gpu- and physical offsets.

Yup, changed these on the patch introducing the pread/pwrite.

>
>
>> =C2=A0		xe_bo_put(bo);
>> =C2=A0
>> =C2=A0		return ret;
>> +	} else if (xe_vma_is_userptr(vma)) {
>> +		struct xe_userptr *userptr =3D &to_userptr_vma(vma)-
>> >userptr;
>> +
>> +		/*
>> +		 * XXX: access_remote_vm() would fit as userptr
>> notifier has
>> +		 * mm ref so we would not need to carry task ref at
>> all.
>> +		 * But access_remote_vm is not exported.
>> access_process_vm()
>> +		 * is exported so use it instead.
>> +		 */
>
> Could we add a follow-up patch that exports access_remote_vm() and
> changes this code to use access_remote_vm() instead?
>

Here is the diff:

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebu=
g.c
index 996fcb4b0e9e..3fdafbf30209 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3763,16 +3763,25 @@ static int xe_eudebug_vma_access(struct xe_vma *vma=
, u64 offset_in_vma,
 		return ret;
 	} else if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr *userptr =3D &to_userptr_vma(vma)->userptr;
+		struct xe_vm *vm =3D xe_vma_vm(vma);
+		struct mm_struct *mm =3D NULL;
+		int ret;
=20
-		/*
-		 * XXX: access_remote_vm() would fit as userptr notifier has
-		 * mm ref so we would not need to carry task ref at all.
-		 * But access_remote_vm is not exported. access_process_vm()
-		 * is exported so use it instead.
-		 */
-		return access_process_vm(userptr->eudebug.task,
-					 xe_vma_userptr(vma), buf, bytes,
-					 write ? FOLL_WRITE : 0);
+		down_read(&vm->userptr.notifier_lock);
+		if (mmget_not_zero(userptr->notifier.mm))
+			mm =3D userptr->notifier.mm;
+		up_read(&vm->userptr.notifier_lock);
+
+		if (!mm)
+			return -EFAULT;
+
+		ret =3D access_remote_vm(mm,
+				       xe_vma_userptr(vma) + offset_in_vma,
+				       buf, bytes,
+				       write ? FOLL_WRITE : 0);
+		mmput(mm);
+
+		return ret;
 	}
=20
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cbc7fdb74166..04157b6b26ea 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1003,14 +1003,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			}
=20
 			userptr->notifier_seq =3D LONG_MAX;
-#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
-			/*
-			 * We could use the mm which is on notifier. But
-			 * the access_remote_vm() is not exported. Thus
-			 * we get reference to task for access_process_vm()
-			 */
-			userptr->eudebug.task =3D get_task_struct(current);
-#endif
 		}
=20
 		xe_vm_get(vm);
@@ -1035,9 +1027,6 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		if (userptr->sg)
 			xe_hmm_userptr_free_sg(uvma);
=20
-#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
-		put_task_struct(userptr->eudebug.task);
-#endif
 		/*
 		 * Since userptr pages are not pinned, we can't remove
 		 * the notifer until we're sure the GPU is not accessing
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_ty=
pes.h
index 0be999dd513f..1c5776194e54 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -68,12 +68,6 @@ struct xe_userptr {
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
-
-#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
-	struct {
-		struct task_struct *task;
-	} eudebug;
-#endif
 };
=20
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)

I will reply also with the export patch and
the complete patch. for reference, they can be found here also:

https://gitlab.freedesktop.org/miku/kernel/-/commit/3ffbc66fb6dd2ff0a9f5f28=
2266a97e073f10deb
https://gitlab.freedesktop.org/miku/kernel/-/commit/ee2ebe9a5debabf984b2cfa=
b34bf0996ace63ab7

Thanks,
-Mika

>
>
>> +		return access_process_vm(userptr->eudebug.task,
>> +					 xe_vma_userptr(vma) +
>> offset_in_vma,
>> +					 buf, bytes,
>> +					 write ? FOLL_WRITE : 0);
>> =C2=A0	}
>> =C2=A0
>> =C2=A0	return -EINVAL;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 1cb21325d8dd..235ae2db5188 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -999,6 +999,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>> =C2=A0			}
>> =C2=A0
>> =C2=A0			userptr->notifier_seq =3D LONG_MAX;
>> +
>> +			xe_eudebug_track_userptr_task(userptr);
>> =C2=A0		}
>> =C2=A0
>> =C2=A0		xe_vm_get(vm);
>> @@ -1023,6 +1025,8 @@ static void xe_vma_destroy_late(struct xe_vma
>> *vma)
>> =C2=A0		if (userptr->sg)
>> =C2=A0			xe_hmm_userptr_free_sg(uvma);
>> =C2=A0
>> +		xe_eudebug_untrack_userptr_task(userptr);
>> +
>> =C2=A0		/*
>> =C2=A0		 * Since userptr pages are not pinned, we can't
>> remove
>> =C2=A0		 * the notifer until we're sure the GPU is not
>> accessing
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 23adb7442881..4334cf2b0d9d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -274,9 +274,35 @@ static inline void vm_dbg(const struct
>> drm_device *dev,
>> =C2=A0			=C2=A0 const char *format, ...)
>> =C2=A0{ /* noop */ }
>> =C2=A0#endif
>> -#endif
>> =C2=A0
>> =C2=A0struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>> =C2=A0void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>> =C2=A0void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
>> drm_printer *p);
>> =C2=A0void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr
>> *userptr)
>> +{
>> +	/*
>> +	 * We could use the mm which is on notifier. But
>> +	 * the access_remote_vm() is not exported. Thus
>> +	 * we get reference to task for access_process_vm()
>> +	 */
>> +	userptr->eudebug.task =3D get_task_struct(current);
>> +}
>> +
>> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr
>> *userptr)
>> +{
>> +	put_task_struct(userptr->eudebug.task);
>> +}
>> +#else
>> +static inline void xe_eudebug_track_userptr_task(struct xe_userptr
>> *userptr)
>> +{
>> +}
>> +
>> +static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr
>> *userptr)
>> +{
>> +}
>> +#endif /* CONFIG_DRM_XE_EUDEBUG */
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 557b047ebdd7..26176ccbcbbc 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -68,6 +68,12 @@ struct xe_userptr {
>> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>> =C2=A0	u32 divisor;
>> =C2=A0#endif
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>> +	struct {
>> +		struct task_struct *task;
>> +	} eudebug;
>> +#endif
>> =C2=A0};
>> =C2=A0
>> =C2=A0struct xe_vma {
>
> Otherwise LGTM.
> Thanks,
> Thomas
