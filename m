Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C377DF85D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3362C10E952;
	Thu,  2 Nov 2023 17:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3439110E952;
 Thu,  2 Nov 2023 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698944989; x=1730480989;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ixv1gqTE6NMEVp9rSy3R/MD7Rj2NhBzFX+brakK1hbk=;
 b=bPUIfkORZvjjsfS/b8zNZtz0gGU9/UYfpNYCaLaRTIEcAnRjMZJGnsPG
 eWF3t0lB7AAP9/oqo6HLIRUqI+shwRsSMoXtbRzl+vNWRDTSl+oifeaAZ
 ihMjb4XEQbIlY+g+zDTOd1P2ChQwn8BpS6zADFL0fDLs/QVGGw4qnLdTN
 W5zwqUCTPh7tmFgpV9jE326fO3fEQe8FwXMHFBKIh5OHDhpwuldpQW+By
 D3ysDZSiNn9T0yBnHbXSaM5YP3CKYdVK4hRdsg/EwZrYigCosSVGYHgJW
 lrc7cy4WMWXBuCHB3acxK/6pGJ57JuZJdCmNknkw0Dq5FZYPjvp4l6E8L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455245406"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="455245406"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="851986291"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="851986291"
Received: from binsumax-mobl.gar.corp.intel.com (HELO [10.249.254.171])
 ([10.249.254.171])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:09:44 -0700
Message-ID: <f95dd975acc6c82e4e6cd0596c14072799eb5a20.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Thu, 02 Nov 2023 18:09:41 +0100
In-Reply-To: <20231101233113.8059-10-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-11-02 at 00:31 +0100, Danilo Krummrich wrote:
> Implement reference counting for struct drm_gpuvm.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 +++++++++++++++++++-----
> --
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
> =C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 +++++++++++++++++-
> =C2=A03 files changed, 78 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c
> b/drivers/gpu/drm/drm_gpuvm.c
> index 53e2c406fb04..6a88eafc5229 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
> char *name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->rb.tree =3D RB_ROO=
T_CACHED;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&gpuvm->rb=
.list);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kref_init(&gpuvm->kref);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->name =3D name ? na=
me : "unknown";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->flags =3D flags;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->ops =3D ops;
> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
> char *name,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> =C2=A0
> -/**
> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> - * @gpuvm: pointer to the &drm_gpuvm to clean up
> - *
> - * Note that it is a bug to call this function on a manager that
> still
> - * holds GPU VA mappings.
> - */
> -void
> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> +static void
> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->name =3D NULL;
> =C2=A0
> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(gpuvm-=
>r_obj);
> =C2=A0}
> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> +
> +static void
> +drm_gpuvm_free(struct kref *kref)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gpuvm *gpuvm =3D co=
ntainer_of(kref, struct
> drm_gpuvm, kref);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (drm_WARN_ON(gpuvm->drm, !g=
puvm->ops->vm_free))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gpuvm_fini(gpuvm);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->ops->vm_free(gpuvm);
> +}
> +
> +/**
> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
copy-paste error in function name.

Also it appears like xe might put a vm from irq context so we should
document the context where this function call is allowable, and if
applicable add a might_sleep().

If this function needs to sleep we can work around that in Xe by
keeping an xe-private refcount for the xe vm container, but I'd like to
avoid that if possible and piggy-back on the refcount introduced here.

> + * @gpuvm: the &drm_gpuvm to release the reference of
> + *
> + * This releases a reference to @gpuvm.
> + */
> +void
> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (gpuvm)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0kref_put(&gpuvm->kref, drm_gpuvm_free);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
> =C2=A0
> =C2=A0static int
> =C2=A0__drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(!drm_gpuvm_r=
ange_valid(gpuvm, addr, range)))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return __drm_gpuva_insert(gpuv=
m, va);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return __drm_gpuva_insert(drm_=
gpuvm_get(gpuvm), va);

Here we leak a reference if __drm_gpuva_insert() fails, and IMO the
reference should be taken where the pointer holding the reference is
assigned (in this case in __drm_gpuva_insert()), or document the
reference transfer from the argument close to the assignment.

But since a va itself is not refcounted it clearly can't outlive the
vm, so is a reference really needed here?

I'd suggest using an accessor that instead of using va->vm uses va-
>vm_bo->vm, to avoid needing to worry about the vm->vm refcount
altoghether.

Thanks,
Thomas

