Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429507C849D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 13:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422B410E0BD;
	Fri, 13 Oct 2023 11:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDFE10E067;
 Fri, 13 Oct 2023 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697197111; x=1728733111;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hpyotjG7IxpE5ZY2cRrspdLLsq0EZ5MINn9yN05T6ak=;
 b=OAPoDSGzddQDmdQkSFnGzrTXXCQck9NPXaW0N/F2NaHwJZZr+S2khFTj
 gNJlM64LtEofE1aLBnelgjlAYE07eoCk3rlMYznX7IaDAOPXfu79YfUMd
 6cT6OGSl4Uf+OnqFi3c5sV5uj4+ItCHNcMOHXPV6Iq241LCeTTecPme5i
 MpjeYYpmCQvnN5q4JxqFq4L/k5NyN9olpMFL9YTOzNWQRenncQjPdH9E1
 d5VJarbiMWO+qbouf8PG3iBQxeVZv+5V8jkjnIJlu+B8BTeJXhzTaHKMr
 8zuT4sV6xpoZLQLfqww/9yOKMmYkpz1SpOkv1rjpfPpKRaxADGNd8BolZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451635202"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="451635202"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 04:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845443018"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="845443018"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 04:38:27 -0700
Message-ID: <65e96c3465a47440ca44b3182e257cb40e745f8b.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v6 1/6] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Fri, 13 Oct 2023 13:38:12 +0200
In-Reply-To: <20231008233212.13815-2-dakr@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-2-dakr@redhat.com>
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

On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
> Provide a common dma-resv for GEM objects not being used outside of
> this
> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
> external and evicted object handling and GEM validation.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56
> +++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 +++++-
> =C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 +++++++++++++++-
> =C2=A03 files changed, 99 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c
> b/drivers/gpu/drm/drm_gpuvm.c
> index 02ecb45a2544..ebda9d594165 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -61,6 +61,15 @@
> =C2=A0 * contained within struct drm_gpuva already. Hence, for inserting
> &drm_gpuva
> =C2=A0 * entries from within dma-fence signalling critical sections it is
> enough to
> =C2=A0 * pre-allocate the &drm_gpuva structures.
> + *
> + * &drm_gem_objects which are private to a single VM can share a
> common
> + * &dma_resv in order to improve locking efficiency (e.g. with
> &drm_exec).
> + * For this purpose drivers must pass a &drm_gem_object to
> drm_gpuvm_init(), in
> + * the following called 'root object', which serves as the container

Nit: Perhaps resv object altough it might typically be the root page-
table object, that doesn't have any meaning to drm_gpuvm, which uses it
solely as a container for the resv?

> of the
> + * GPUVM's shared &dma_resv. This root object can be a driver
> specific
> + * &drm_gem_object, such as the &drm_gem_object containing the root
> page table,
> + * but it can also be a 'dummy' object, which can be allocated with
> + * drm_gpuvm_root_object_alloc().
> =C2=A0 */
> =C2=A0
> =C2=A0/**
> @@ -652,9 +661,47 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
> =C2=A0}
> =C2=A0
> +static void
> +drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_release(obj);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(obj);
> +}
> +
> +static const struct drm_gem_object_funcs drm_gpuvm_object_funcs =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.free =3D drm_gpuvm_gem_object=
_free,
> +};
> +
> +/**
> + * drm_gpuvm_root_object_alloc() - allocate a dummy &drm_gem_object
> + * @drm: the drivers &drm_device
> + *
> + * Allocates a dummy &drm_gem_object which can be passed to
> drm_gpuvm_init() in
> + * order to serve as root GEM object providing the &drm_resv shared
> across
> + * &drm_gem_objects local to a single GPUVM.
> + *
> + * Returns: the &drm_gem_object on success, NULL on failure
> + */
> +struct drm_gem_object *
> +drm_gpuvm_root_object_alloc(struct drm_device *drm)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *obj;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj =3D kzalloc(sizeof(*obj), =
GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!obj)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return NULL;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj->funcs =3D &drm_gpuvm_obje=
ct_funcs;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_private_object_init(dr=
m, obj, 0);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return obj;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
> +
> =C2=A0/**
> =C2=A0 * drm_gpuvm_init() - initialize a &drm_gpuvm
> =C2=A0 * @gpuvm: pointer to the &drm_gpuvm to initialize
> + * @r_obj: the root &drm_gem_object providing the GPUVM's common
> &dma_resv
> =C2=A0 * @name: the name of the GPU VA space
> =C2=A0 * @start_offset: the start offset of the GPU VA space
> =C2=A0 * @range: the size of the GPU VA space
> @@ -668,7 +715,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
> =C2=A0 * &name is expected to be managed by the surrounding driver
> structures.
> =C2=A0 */
> =C2=A0void
> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
> *r_obj,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 const char *name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u64 start_offset, u64 range,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 u64 reserve_offset, u64 reserve_range,
> @@ -683,6 +730,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->name =3D name ? na=
me : "unknown";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->ops =3D ops;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->r_obj =3D r_obj;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_get(r_obj);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(&gpuvm->kernel_all=
oc_node, 0, sizeof(struct
> drm_gpuva));
> =C2=A0
> @@ -713,7 +763,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN(!RB_EMPTY_ROOT(&gpuv=
m->rb.tree.rb_root),
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "GPUV=
A tree is not empty, potentially leaking memory.");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "GPUV=
A tree is not empty, potentially leaking
> memory.\n");

Should we cache the drm device in struct drm_gpuvm and use drm_warn()
here instead of WARN?

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(gpuvm->r_ob=
j);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> =C2=A0
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 5cf892c50f43..4dea847ef989 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1808,8 +1808,9 @@ int
> =C2=A0nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli
> *cli,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 kernel_managed_addr, u64 kernel_managed_=
size)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *r_obj;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 kernel_managed_end =
=3D kernel_managed_addr +
> kernel_managed_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&uvmm->mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_init(&uvmm->resv=
);
> @@ -1833,14 +1834,22 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm,
> struct nouveau_cli *cli,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out_unlock;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r_obj =3D drm_gpuvm_root_objec=
t_alloc(cli->drm->dev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!r_obj) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D -ENOMEM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0goto out_unlock;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uvmm->kernel_managed_addr=
 =3D kernel_managed_addr;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uvmm->kernel_managed_size=
 =3D kernel_managed_size;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gpuvm_init(&uvmm->base, cl=
i->name,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gpuvm_init(&uvmm->base, r_=
obj, cli->name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_VA_SPA=
CE_START,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_VA_SPA=
CE_END,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_managed=
_addr, kernel_managed_size,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* GPUVM takes care from here =
on. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(r_obj);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D nvif_vmm_ctor(&cl=
i->mmu, "uvmm",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 cli->vmm.vmm.object.oclass, RAW,
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index c7ed6bf441d4..0aec14d8b259 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -238,9 +238,15 @@ struct drm_gpuvm {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ops: &drm_gpuvm_ops p=
roviding the split/merge steps to
> drivers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct drm_gpuvm_op=
s *ops;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @r_obj: Root GEM object; re=
presenting the GPUVM's common
> &dma_resv.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *r_obj;
> =C2=A0};
> =C2=A0
> -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
> *r_obj,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 start_offset, u64 range,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 reserve_offset, u64 reserve_=
range,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops)=
;
> @@ -248,6 +254,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> =C2=A0
> =C2=A0bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u6=
4
> range);
> =C2=A0
> +struct drm_gem_object *
> +drm_gpuvm_root_object_alloc(struct drm_device *drm);
> +
> +/**
> + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
> + * @gpuvm__: the &drm_gpuvm
> + *
> + * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
> + */
> +#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
> +
> +/**
> + * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding the
> &drm_gpuvm's
> + * &dma_resv
> + * @gpuvm__: the &drm_gpuvm
> + *
> + * Returns: a pointer to the &drm_gem_object holding the
> &drm_gpuvm's shared
> + * &dma_resv
> + */
> +#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
> +
> +#define drm_gpuvm_resv_held(gpuvm__) \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_held(drm_gpuvm_resv(g=
puvm__))
> +
> +#define drm_gpuvm_resv_assert_held(gpuvm__) \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_assert_held(drm_gpuvm=
_resv(gpuvm__))
> +
> =C2=A0static inline struct drm_gpuva *
> =C2=A0__drm_gpuva_next(struct drm_gpuva *va)
> =C2=A0{

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


