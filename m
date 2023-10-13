Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE667C864A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48C10E612;
	Fri, 13 Oct 2023 13:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE24110E614;
 Fri, 13 Oct 2023 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202009; x=1728738009;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1+UcqP7GgVIUy8eUbj2zMLwDVB98KqhL6nFZmNvpG34=;
 b=Fiqcj02WTfWcxcT2qov6kDDQMadYLfkZwc4uBnO1zygErHbhD6aQXx2Z
 IauGxkeJCTiiAdl32EwHkb8RgelMIpN1/21+aqpLo3iWuS+KCTICRdkTZ
 1Jc9k1mY1Qh32iehSKy8FiU2j9sDKceaqMRG+bOAvjJFya6YyDKJWsVbY
 waRMSNH92UccTkPjYkn8r+mwVcRCHF7ePKRJCfQRgaYtZ1Cow/L7uF6+S
 yQSfDOjBzFn/aaZJVhoiz0J9bzb7FLD09ycCRTd6K56kOUEwbDdSd8TWj
 DX37J9iKQWyzOCxckeJjw+/FcaguyzlkKK+MKV/5UjMFtw0wgjK8megma g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="451647434"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="451647434"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825044237"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="825044237"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:00:05 -0700
Message-ID: <7e57e077c2a56689a07be7da06d78b049125dfe7.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v6 1/6] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Fri, 13 Oct 2023 15:00:02 +0200
In-Reply-To: <d3409417-444b-4a7a-adde-8d6fab8f1e77@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-2-dakr@redhat.com>
 <65e96c3465a47440ca44b3182e257cb40e745f8b.camel@linux.intel.com>
 <d3409417-444b-4a7a-adde-8d6fab8f1e77@redhat.com>
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

On Fri, 2023-10-13 at 13:51 +0200, Danilo Krummrich wrote:
> On 10/13/23 13:38, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
> > > Provide a common dma-resv for GEM objects not being used outside
> > > of
> > > this
> > > GPU-VM. This is used in a subsequent patch to generalize dma-
> > > resv,
> > > external and evicted object handling and GEM validation.
> > >=20
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 56
> > > +++++++++++++++++++++++++-
> > > =C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 13 +++++-
> > > =C2=A0=C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 ++++++++++++=
+++-
> > > =C2=A0=C2=A03 files changed, 99 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > b/drivers/gpu/drm/drm_gpuvm.c
> > > index 02ecb45a2544..ebda9d594165 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -61,6 +61,15 @@
> > > =C2=A0=C2=A0 * contained within struct drm_gpuva already. Hence, for
> > > inserting
> > > &drm_gpuva
> > > =C2=A0=C2=A0 * entries from within dma-fence signalling critical sect=
ions
> > > it is
> > > enough to
> > > =C2=A0=C2=A0 * pre-allocate the &drm_gpuva structures.
> > > + *
> > > + * &drm_gem_objects which are private to a single VM can share a
> > > common
> > > + * &dma_resv in order to improve locking efficiency (e.g. with
> > > &drm_exec).
> > > + * For this purpose drivers must pass a &drm_gem_object to
> > > drm_gpuvm_init(), in
> > > + * the following called 'root object', which serves as the
> > > container
> >=20
> > Nit: Perhaps resv object altough it might typically be the root
> > page-
> > table object, that doesn't have any meaning to drm_gpuvm, which
> > uses it
> > solely as a container for the resv?
>=20
> With "root" I didn't want to refer to the object representing the
> root
> page-table object, but being *the* object every other (internal)
> object
> needs to keep a reference to.

OK, yes but the reason they need a reference is because of the shared
resv, so IMO resv_object is a good fit. (I later noticed there's even
the function name drm_gpuvm_resv_obj()). And it will probably get
confused with the driver's "root" page table object, but up to you.

>  Maybe I should be more explicit here and say
> that drivers need to make sure every internal object requires a
> reference
> to take a reference to this root object.
>=20
> >=20
> > > of the
> > > + * GPUVM's shared &dma_resv. This root object can be a driver
> > > specific
> > > + * &drm_gem_object, such as the &drm_gem_object containing the
> > > root
> > > page table,
> > > + * but it can also be a 'dummy' object, which can be allocated
> > > with
> > > + * drm_gpuvm_root_object_alloc().
> > > =C2=A0=C2=A0 */
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -652,9 +661,47 @@ drm_gpuvm_range_valid(struct drm_gpuvm
> > > *gpuvm,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void
> > > +drm_gpuvm_gem_object_free(struct drm_gem_object *obj)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_release(obj=
);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(obj);
> > > +}
> > > +
> > > +static const struct drm_gem_object_funcs drm_gpuvm_object_funcs
> > > =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.free =3D drm_gpuvm_gem_ob=
ject_free,
> > > +};
> > > +
> > > +/**
> > > + * drm_gpuvm_root_object_alloc() - allocate a dummy
> > > &drm_gem_object
> > > + * @drm: the drivers &drm_device
> > > + *
> > > + * Allocates a dummy &drm_gem_object which can be passed to
> > > drm_gpuvm_init() in
> > > + * order to serve as root GEM object providing the &drm_resv
> > > shared
> > > across
> > > + * &drm_gem_objects local to a single GPUVM.
> > > + *
> > > + * Returns: the &drm_gem_object on success, NULL on failure
> > > + */
> > > +struct drm_gem_object *
> > > +drm_gpuvm_root_object_alloc(struct drm_device *drm)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *obj=
;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj =3D kzalloc(sizeof(*ob=
j), GFP_KERNEL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!obj)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj->funcs =3D &drm_gpuvm_=
object_funcs;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_private_object_ini=
t(drm, obj, 0);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return obj;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
> > > +
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_gpuvm_init() - initialize a &drm_gpuvm
> > > =C2=A0=C2=A0 * @gpuvm: pointer to the &drm_gpuvm to initialize
> > > + * @r_obj: the root &drm_gem_object providing the GPUVM's common
> > > &dma_resv
> > > =C2=A0=C2=A0 * @name: the name of the GPU VA space
> > > =C2=A0=C2=A0 * @start_offset: the start offset of the GPU VA space
> > > =C2=A0=C2=A0 * @range: the size of the GPU VA space
> > > @@ -668,7 +715,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm
> > > *gpuvm,
> > > =C2=A0=C2=A0 * &name is expected to be managed by the surrounding dri=
ver
> > > structures.
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0void
> > > -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> > > +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object
> > > *r_obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 const char *name,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 u64 start_offset, u64 range,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 u64 reserve_offset, u64 reserve_range,
> > > @@ -683,6 +730,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->name =3D=
 name ? name : "unknown";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->ops =3D =
ops;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpuvm->r_obj =3D r_obj;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_get(r_obj);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(&gpuvm->=
kernel_alloc_node, 0, sizeof(struct
> > > drm_gpuva));
> > > =C2=A0=20
> > > @@ -713,7 +763,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__drm_gpuva_remove(&gpuvm->kernel_alloc_no=
de);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN(!RB_EMPTY_=
ROOT(&gpuvm->rb.tree.rb_root),
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
GPUVA tree is not empty, potentially leaking
> > > memory.");
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
GPUVA tree is not empty, potentially leaking
> > > memory.\n");
> >=20
> > Should we cache the drm device in struct drm_gpuvm and use
> > drm_warn()
> > here instead of WARN?
>=20
> I'd guess the additional backtrace of WARN() isn't overly useful in
> this
> case. However, it might be a bit more obvious in dmesg due to its
> verboseness. Not a strong opinion on that, though.

My bad. I meant drm_WARN(). In a multi-gpu environment it's nice to
have the extra device info.

/Thomas


>=20
> >=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(gpuvm->=
r_obj);
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > index 5cf892c50f43..4dea847ef989 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > > @@ -1808,8 +1808,9 @@ int
> > > =C2=A0=C2=A0nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouve=
au_cli
> > > *cli,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 kernel_managed_addr, u64
> > > kernel_managed_size)
> > > =C2=A0=C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *r_o=
bj;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 kernel_mana=
ged_end =3D kernel_managed_addr +
> > > kernel_managed_size;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&uvm=
m->mutex);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_init(&=
uvmm->resv);
> > > @@ -1833,14 +1834,22 @@ nouveau_uvmm_init(struct nouveau_uvmm
> > > *uvmm,
> > > struct nouveau_cli *cli,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto out_unlock;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r_obj =3D drm_gpuvm_root_o=
bject_alloc(cli->drm->dev);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!r_obj) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -ENOMEM;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out_unlock;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uvmm->kernel_ma=
naged_addr =3D kernel_managed_addr;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uvmm->kernel_ma=
naged_size =3D kernel_managed_size;
> > > =C2=A0=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gpuvm_init(&uvmm->base=
, cli->name,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gpuvm_init(&uvmm->base=
, r_obj, cli->name,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVE=
AU_VA_SPACE_START,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVE=
AU_VA_SPACE_END,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kerne=
l_managed_addr, kernel_managed_size,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL)=
;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* GPUVM takes care from h=
ere on. */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_gem_object_put(r_obj);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D nvif_vm=
m_ctor(&cli->mmu, "uvmm",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cli->vmm.vmm.object.oclass, RAW,
> > > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > > index c7ed6bf441d4..0aec14d8b259 100644
> > > --- a/include/drm/drm_gpuvm.h
> > > +++ b/include/drm/drm_gpuvm.h
> > > @@ -238,9 +238,15 @@ struct drm_gpuvm {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ops: &drm_g=
puvm_ops providing the split/merge steps
> > > to
> > > drivers
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct dr=
m_gpuvm_ops *ops;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @r_obj: Root GEM object=
; representing the GPUVM's
> > > common
> > > &dma_resv.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_gem_object *r_o=
bj;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > -void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> > > +void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct
> > > drm_gem_object
> > > *r_obj,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 start_offset, u64 r=
ange,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 reserve_offset, u64=
 reserve_range,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_=
ops *ops);
> > > @@ -248,6 +254,33 @@ void drm_gpuvm_destroy(struct drm_gpuvm
> > > *gpuvm);
> > > =C2=A0=20
> > > =C2=A0=C2=A0bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u6=
4
> > > addr, u64
> > > range);
> > > =C2=A0=20
> > > +struct drm_gem_object *
> > > +drm_gpuvm_root_object_alloc(struct drm_device *drm);
> > > +
> > > +/**
> > > + * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
> > > + * @gpuvm__: the &drm_gpuvm
> > > + *
> > > + * Returns: a pointer to the &drm_gpuvm's shared &dma_resv
> > > + */
> > > +#define drm_gpuvm_resv(gpuvm__) ((gpuvm__)->r_obj->resv)
> > > +
> > > +/**
> > > + * drm_gpuvm_resv_obj() - returns the &drm_gem_object holding
> > > the
> > > &drm_gpuvm's
> > > + * &dma_resv
> > > + * @gpuvm__: the &drm_gpuvm
> > > + *
> > > + * Returns: a pointer to the &drm_gem_object holding the
> > > &drm_gpuvm's shared
> > > + * &dma_resv
> > > + */
> > > +#define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
> > > +
> > > +#define drm_gpuvm_resv_held(gpuvm__) \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_held(drm_gpuvm_re=
sv(gpuvm__))
> > > +
> > > +#define drm_gpuvm_resv_assert_held(gpuvm__) \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_assert_held(drm_g=
puvm_resv(gpuvm__))
> > > +
> > > =C2=A0=C2=A0static inline struct drm_gpuva *
> > > =C2=A0=C2=A0__drm_gpuva_next(struct drm_gpuva *va)
> > > =C2=A0=C2=A0{
> >=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> >=20
>=20

