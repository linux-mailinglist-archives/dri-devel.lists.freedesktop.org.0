Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CF569D23
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F48210E3A6;
	Thu,  7 Jul 2022 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A138C10E81C;
 Thu,  7 Jul 2022 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657181685; x=1688717685;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OIbTZ/SM5hyLwbYe8oIjOOTsOusN6t1oa5FFtSMYAjg=;
 b=F3BQdM/OlDNvCLj+pPoa5bLhdEpAb4cNSJ4n+4W4yHFiijGDOR3ZSQQY
 0WhwJ0r3SwOXU5uAZjZqkL3qGTPUF1JAWETViTFNSHofl4ZS10UuBR8DH
 k8at8sjDRKvzEZPmmssLiSVvvZoljN26kbNt+nkHo4/OglKiBbLtl/+9m
 vaD9ytKOvdHNkx17PuMMxnZ8a4nXpGN8fNb293iceqlAx2BP2v1IVyhHP
 76STwrhXEF2fqTXnC598cAN/6gXjS2zQ8+J4HzvbIjxV6mUgSFRki/Poz
 3d9+NDDZiZ6kEX0+O1R06LI9yasHQpdAcGC1EwWvIauS1/tWFQssODKKU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="282715778"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="282715778"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:14:44 -0700
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="568420458"
Received: from mobara-mobl1.ger.corp.intel.com (HELO [10.249.254.62])
 ([10.249.254.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 01:14:41 -0700
Message-ID: <cdb3671475c35b3ee8e847d9af4639b75b9c936c.camel@linux.intel.com>
Subject: Re: [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Thu, 07 Jul 2022 10:14:38 +0200
In-Reply-To: <20220707054307.GM14039@nvishwa1-DESK>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <8a21c7a72aeb74f80bd471496c3dcd7b6dcd1df1.camel@linux.intel.com>
 <20220707054307.GM14039@nvishwa1-DESK>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-07-06 at 22:43 -0700, Niranjana Vishwanathapura wrote:
> On Wed, Jul 06, 2022 at 06:21:03PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2022-07-01 at 15:50 -0700, Niranjana Vishwanathapura wrote:
> > > Bind and unbind the mappings upon VM_BIND and VM_UNBIND calls.
> > >=20
> > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Prathap Kumar Valsan
> > > <prathap.kumar.valsan@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/i915/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > > =C2=A0drivers/gpu/drm/i915/gem/i915_gem_create.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 10 +-
> > > =C2=A0drivers/gpu/drm/i915/gem/i915_gem_object.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> > > =C2=A0drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h=C2=A0=C2=A0 |=C2=A0=
 38 +++
> > > =C2=A0.../drm/i915/gem/i915_gem_vm_bind_object.c=C2=A0=C2=A0=C2=A0 | =
233
> > > ++++++++++++++++++
> > > =C2=A0drivers/gpu/drm/i915/gt/intel_gtt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> > > =C2=A0drivers/gpu/drm/i915/gt/intel_gtt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
> > > =C2=A0drivers/gpu/drm/i915/i915_driver.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> > > =C2=A0drivers/gpu/drm/i915/i915_vma.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> > > =C2=A0drivers/gpu/drm/i915/i915_vma.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -
> > > =C2=A0drivers/gpu/drm/i915/i915_vma_types.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > > =C2=A011 files changed, 318 insertions(+), 10 deletions(-)
> > > =C2=A0create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> > > =C2=A0create mode 100644
> > > drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/Makefile
> > > b/drivers/gpu/drm/i915/Makefile
> > > index 522ef9b4aff3..4e1627e96c6e 100644
> > > --- a/drivers/gpu/drm/i915/Makefile
> > > +++ b/drivers/gpu/drm/i915/Makefile
> > > @@ -165,6 +165,7 @@ gem-y +=3D \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gem_ttm_move=
.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gem_ttm_pm.o=
 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gem_userptr.=
o \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gem_vm_bind_objec=
t.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gem_wait.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem/i915_gemfs.o
> > > =C2=A0i915-y +=3D \
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > index 33673fe7ee0a..927a87e5ec59 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > @@ -15,10 +15,10 @@
> > > =C2=A0#include "i915_trace.h"
> > > =C2=A0#include "i915_user_extensions.h"
> > > =C2=A0
> > > -static u32 object_max_page_size(struct intel_memory_region
> > > **placements,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int n_placements)
> > > +u32 i915_gem_object_max_page_size(struct intel_memory_region
> > > **placements,
> >=20
> > Kerneldoc.
>=20
> This is an existing function that is being modified. As I
> mentioned in other thread, we probably need a prep patch early
> in this series to add missing kernel-docs in i915 which this
> patch series would later update.

Here we make a static function extern, which according to the patch
submission guidelines, mandates a kerneloc comment, so it's not so much
that the function is modified. We should be fine adding kerneldoc in
the patch that makes the function extern.


>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n_placemen=
ts)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 max_page_size =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 max_page_size =3D I915=
_GTT_PAGE_SIZE_4K;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < n_p=
lacements; i++) {
> > > @@ -28,7 +28,6 @@ static u32 object_max_page_size(struct
> > > intel_memory_region **placements,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0max_page_size =3D max_t(u32, max_page_size, mr-
> > > > min_page_size);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GEM_BUG_ON(!max_page_size)=
;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return max_page_size;
> > > =C2=A0}
> >=20
> > Should this change be separated out? It's not immediately clear to
> > a
> > reviewer why it is included.
>=20
> It is being removed as max_page_size now has a non-zero default
> value and hence this check is not valid anymore.

But that in itself deserves an explanation in the patch commit message.
So that's why I wondered whether it wouldn't be better to separate it
out?

>=20
> >=20
> > > =C2=A0
> > > @@ -99,7 +98,8 @@ __i915_gem_object_create_user_ext(struct
> > > drm_i915_private *i915, u64 size,
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_flush_free_o=
bjects(i915);
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size =3D round_up(size, ob=
ject_max_page_size(placements,
> > > n_placements));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0size =3D round_up(size,
> > > i915_gem_object_max_page_size(placements,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > n_placements));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (size =3D=3D 0)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EINVAL);
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > > b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > > index 6f0a3ce35567..650de2224843 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > > @@ -47,6 +47,8 @@ static inline bool
> > > i915_gem_object_size_2big(u64
> > > size)
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void i915_gem_init__objects(struct drm_i915_private *i915);
> > > +u32 i915_gem_object_max_page_size(struct intel_memory_region
> > > **placements,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n_placemen=
ts);
> > > =C2=A0
> > > =C2=A0void i915_objects_module_exit(void);
> > > =C2=A0int i915_objects_module_init(void);
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> > > b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> > > new file mode 100644
> > > index 000000000000..642cdb559f17
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
> > > @@ -0,0 +1,38 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright =C2=A9 2022 Intel Corporation
> > > + */
> > > +
> > > +#ifndef __I915_GEM_VM_BIND_H
> > > +#define __I915_GEM_VM_BIND_H
> > > +
> > > +#include "i915_drv.h"
> > > +
> > > +#define assert_vm_bind_held(vm)=C2=A0=C2=A0 lockdep_assert_held(&(vm=
)-
> > > > vm_bind_lock)
> > > +
> > > +static inline void i915_gem_vm_bind_lock(struct
> > > i915_address_space
> > > *vm)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&vm->vm_bind_lo=
ck);
> > > +}
> > > +
> > > +static inline int
> > > +i915_gem_vm_bind_lock_interruptible(struct i915_address_space
> > > *vm)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mutex_lock_interrup=
tible(&vm->vm_bind_lock);
> > > +}
> > > +
> > > +static inline void i915_gem_vm_bind_unlock(struct
> > > i915_address_space
> > > *vm)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&vm->vm_bind_=
lock);
> > > +}
> > > +
> >=20
> > Kerneldoc for the inlines.
> >=20
> > > +struct i915_vma *
> > > +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64
> > > va);
> > > +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool
> > > release_obj);
> > > +int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_i915_gem_vm_bind *va,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_file *file);
> > > +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_i915_gem_vm_unbind *va);
> > > +
> > > +#endif /* __I915_GEM_VM_BIND_H */
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> > > new file mode 100644
> > > index 000000000000..43ceb4dcca6c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
> > > @@ -0,0 +1,233 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright =C2=A9 2022 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/interval_tree_generic.h>
> > > +
> > > +#include "gem/i915_gem_vm_bind.h"
> > > +#include "gt/gen8_engine_cs.h"
> > > +
> > > +#include "i915_drv.h"
> > > +#include "i915_gem_gtt.h"
> > > +
> > > +#define START(node) ((node)->start)
> > > +#define LAST(node) ((node)->last)
> > > +
> > > +INTERVAL_TREE_DEFINE(struct i915_vma, rb, u64, __subtree_last,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 START, LAST, static inline=
, i915_vm_bind_it)
> > > +
> > > +#undef START
> > > +#undef LAST
> > > +
> > > +/**
> > > + * DOC: VM_BIND/UNBIND ioctls
> > > + *
> > > + * DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind
> > > GEM
> > > buffer
> > > + * objects (BOs) or sections of a BOs at specified GPU virtual
> > > addresses on a
> > > + * specified address space (VM). Multiple mappings can map to
> > > the
> > > same physical
> > > + * pages of an object (aliasing). These mappings (also referred
> > > to
> > > as persistent
> > > + * mappings) will be persistent across multiple GPU submissions
> > > (execbuf calls)
> > > + * issued by the UMD, without user having to provide a list of
> > > all
> > > required
> > > + * mappings during each submission (as required by older execbuf
> > > mode).
> > > + *
> > > + * The VM_BIND/UNBIND calls allow UMDs to request a timeline out
> > > fence for
> > > + * signaling the completion of bind/unbind operation.
> > > + *
> > > + * VM_BIND feature is advertised to user via
> > > I915_PARAM_VM_BIND_VERSION.
> > > + * User has to opt-in for VM_BIND mode of binding for an address
> > > space (VM)
> > > + * during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND
> > > extension.
> > > + *
> > > + * VM_BIND/UNBIND ioctl calls executed on different CPU threads
> > > concurrently
> > > + * are not ordered. Furthermore, parts of the VM_BIND/UNBIND
> > > operations can be
> > > + * done asynchronously, when valid out fence is specified.
> > > + *
> > > + * VM_BIND locking order is as below.
> > > + *
> > > + * 1) Lock-A: A vm_bind mutex will protect vm_bind lists. This
> > > lock
> > > is taken in
> > > + *=C2=A0=C2=A0=C2=A0 vm_bind/vm_unbind ioctl calls, in the execbuf p=
ath and
> > > while
> > > releasing the
> > > + *=C2=A0=C2=A0=C2=A0 mapping.
> > > + *
> > > + *=C2=A0=C2=A0=C2=A0 In future, when GPU page faults are supported, =
we can
> > > potentially use a
> > > + *=C2=A0=C2=A0=C2=A0 rwsem instead, so that multiple page fault hand=
lers can
> > > take
> > > the read
> > > + *=C2=A0=C2=A0=C2=A0 side lock to lookup the mapping and hence can r=
un in
> > > parallel.
> > > + *=C2=A0=C2=A0=C2=A0 The older execbuf mode of binding do not need t=
his lock.
> > > + *
> > > + * 2) Lock-B: The object's dma-resv lock will protect i915_vma
> > > state
> > > and needs
> > > + *=C2=A0=C2=A0=C2=A0 to be held while binding/unbinding a vma in the=
 async
> > > worker
> > > and while
> > > + *=C2=A0=C2=A0=C2=A0 updating dma-resv fence list of an object. Note=
 that
> > > private
> > > BOs of a VM
> > > + *=C2=A0=C2=A0=C2=A0 will all share a dma-resv object.
> > > + *
> > > + *=C2=A0=C2=A0=C2=A0 The future system allocator support will use th=
e HMM
> > > prescribed locking
> > > + *=C2=A0=C2=A0=C2=A0 instead.
> >=20
> > I don't think the last sentence is relevant for this series. Also,
> > are
> > there any other mentions for Locks A, B and C? If not, can we ditch
> > that naming?
>=20
> It is taken from design rfc :). Yah, I think better to remove it and
> probably the lock names and make it more specific to the
> implementation
> in this patch series.

Ah, OK, if it's taken from the RFC and is an established naming in
documentation that will remain, then it's fine with me. Perhaps with a
pointer added to that doc that will help the reader.

>=20
> >=20
> > > + *
> > > + * 3) Lock-C: Spinlock/s to protect some of the VM's lists like
> > > the
> > > list of
> > > + *=C2=A0=C2=A0=C2=A0 invalidated vmas (due to eviction and userptr
> > > invalidation)
> > > etc.
> > > + */
> > > +
> > > +struct i915_vma *
> > > +i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64
> > > va)
> >=20
> > Kerneldoc for the extern functions.
> >=20
> >=20
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *vma, *tem=
p;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assert_vm_bind_held(vm);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma =3D i915_vm_bind_it_it=
er_first(&vm->va, va, va);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Working around compiler=
 error, remove later */
> >=20
> > Is this still relevant? What compiler error is seen here?
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vma)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0temp =3D i915_vm_bind_it_iter_next(vma, va + vma-
> > > >size,
> > > -1);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return vma;
> > > +}
> > > +
> > > +void i915_gem_vm_bind_remove(struct i915_vma *vma, bool
> > > release_obj)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assert_vm_bind_held(vma->v=
m);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!list_empty(&vma->vm_b=
ind_link)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0list_del_init(&vma->vm_bind_link);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0i915_vm_bind_it_remove(vma, &vma->vm->va);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* Release object */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (release_obj)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i91=
5_vma_put(vma);
> >=20
> > i915_vma_put() here is confusing. Can we use i915_gem_object_put()
> > to
> > further make it clear that the persistent vmas actually take a
> > reference on the object?
> >=20
>=20
> makes sense.
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +}
> > > +
> > > +int i915_gem_vm_unbind_obj(struct i915_address_space *vm,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_i915_gem_vm_unbind *va)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_gem_object=
 *obj;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *vma;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va->start =3D gen8_noncano=
nical_addr(va->start);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_vm_bind_l=
ock_interruptible(vm);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma =3D i915_gem_vm_bind_l=
ookup_vma(vm, va->start);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!vma) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -ENOENT;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out_unlock;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vma->size !=3D va->len=
gth)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_remove(vma, false);
> > > +
> > > +out_unlock:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_unlock(vm=
);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret || !vma)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Destroy vma and then re=
lease object */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj =3D vma->obj;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_object_lo=
ck(obj, NULL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> >=20
> > This call never returns an error and we could GEM_WARN_ON(...), or
> > (void) to annotate that the return value is wilfully ignored.
> >=20
>=20
> makes sense.
>=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_vma_destroy(vma);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_object_unlock(obj=
);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_object_put(obj);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > +}
> > > +
> > > +static struct i915_vma *vm_bind_get_vma(struct
> > > i915_address_space
> > > *vm,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct
> > > drm_i915_gem_object
> > > *obj,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0struct
> > > drm_i915_gem_vm_bind
> > > *va)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_ggtt_view view=
;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *vma;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0va->start =3D gen8_noncano=
nical_addr(va->start);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma =3D i915_gem_vm_bind_l=
ookup_vma(vm, va->start);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (vma)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ERR_PTR(-EEXIST);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0view.type =3D I915_GGTT_VI=
EW_PARTIAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0view.partial.offset =3D va=
->offset >> PAGE_SHIFT;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0view.partial.size =3D va->=
length >> PAGE_SHIFT;
> >=20
> > IIRC, this vma view is not handled correctly in the vma code, that
> > only
> > understands views for ggtt bindings.
> >=20
>=20
> This patch series extends the partial view to ppgtt also.
> Yah, the naming is still i915_ggtt_view, but I am hoping we can fix
> the
> name in a follow up patch later.

Hmm, I somehow thought that the vma page adjustment was a NOP on ppgtt
and only done on ggtt. But that's indeed not the case. Yes, then this
is ok. We need to remember, though, that if we're going to use the
existing vma async unbinding functionality, we'd need to attach the vma
pages to the vma resource.


>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma =3D i915_vma_instance(=
obj, vm, &view);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(vma))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return vma;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma->start =3D va->start;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma->last =3D va->start + =
va->length - 1;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return vma;
> > > +}
> > > +
> > > +int i915_gem_vm_bind_obj(struct i915_address_space *vm,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_i915_gem_vm_bind *va,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct drm_file *file)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_gem_object=
 *obj;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *vma =3D N=
ULL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_gem_ww_ctx ww;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 pin_flags;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!vm->vm_bind_mode)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EOPNOTSUPP;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0obj =3D i915_gem_object_lo=
okup(file, va->handle);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!obj)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENOENT;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!va->length ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !IS_ALI=
GNED(va->offset | va->length,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i91=
5_gem_object_max_page_size(obj-
> > > > mm.placements,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 obj-
> > > > mm.n_placements)) ||
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range_o=
verflows_t(u64, va->offset, va->length, obj-
> > > > base.size)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto put_obj;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_vm_bind_l=
ock_interruptible(vm);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto put_obj;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vma =3D vm_bind_get_vma(vm=
, obj, va);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(vma)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D PTR_ERR(vma);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto unlock_vm;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_ww_ctx_init(&ww, =
true);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pin_flags =3D va->start | =
PIN_OFFSET_FIXED | PIN_USER;
> > > +retry:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_object_lo=
ck(vma->obj, &ww);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out_ww;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_vma_pin_ww(vm=
a, &ww, 0, 0, pin_flags);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out_ww;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Make it evictable */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__i915_vma_unpin(vma);
> >=20
> > A considerable effort has been put into avoiding short term vma
> > pins in
> > i915. We should add an interface like i915_vma_bind_ww() that
> > avoids
> > the pin altoghether.
>=20
> Currently in i915 driver VA managment and device page table bindings
> are tightly coupled. i915_vma_pin_ww() does the both VA allocation
> and
> biding. And we also interpret VA being allocated (drm_mm node
> allocated)
> also as vma is bound.
>=20
> Decoupling it would be ideal but I think it needs to be carefully
> done
> in a separate patch series to not cause any regression.

So the idea would be not to decouple these, but to just avoid pinning
the vma in the process.


>=20
> >=20
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&vma->vm_bin=
d_link, &vm->vm_bound_list);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_vm_bind_it_insert(vma=
, &vm->va);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Hold object reference u=
ntil vm_unbind */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_object_get(vma->o=
bj);
> > > +out_ww:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret =3D=3D -EDEADLK) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_ww_ctx_backoff(&ww);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (!ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0got=
o retry;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0i915_vma_destroy(vma);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_ww_ctx_fini(&ww);
> >=20
> > Could use for_i915_gem_ww()?
> >=20
>=20
> Yah, I think it is a better idea to use it.
>=20
> > > +unlock_vm:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_unlock(vm=
);
> > > +put_obj:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_object_put(obj);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > index b67831833c9a..135dc4a76724 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> > > @@ -176,6 +176,8 @@ int i915_vm_lock_objects(struct
> > > i915_address_space *vm,
> > > =C2=A0void i915_address_space_fini(struct i915_address_space *vm)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_mm_takedown(&vm->=
mm);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GEM_BUG_ON(!RB_EMPTY_ROOT(=
&vm->va.rb_root));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_destroy(&vm->vm_bind=
_lock);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0/**
> > > @@ -282,6 +284,11 @@ void i915_address_space_init(struct
> > > i915_address_space *vm, int subclass)
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&vm->b=
ound_list);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&vm->u=
nbound_list);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vm->va =3D RB_ROOT_CACHED;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&vm->vm_bin=
d_list);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&vm->vm_bou=
nd_list);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&vm->vm_bind_lo=
ck);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0void *__px_vaddr(struct drm_i915_gem_object *p)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > index c812aa9708ae..d4a6ce65251d 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> > > @@ -259,6 +259,15 @@ struct i915_address_space {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head unbo=
und_list;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * List of VM_BIND objects=
.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >=20
> > Proper kerneldoc + intel locking guidelines comments, please.
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct mutex vm_bind_lock;=
=C2=A0 /* Protects vm_bind lists */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head vm_bind_l=
ist;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head vm_bound_=
list;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* va tree of persistent v=
mas */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rb_root_cached va;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Global GTT */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool is_ggtt:1;
> > > =C2=A0
> > > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> > > b/drivers/gpu/drm/i915/i915_driver.c
> > > index ccf990dfd99b..776ab7844f60 100644
> > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > @@ -68,6 +68,7 @@
> > > =C2=A0#include "gem/i915_gem_ioctls.h"
> > > =C2=A0#include "gem/i915_gem_mman.h"
> > > =C2=A0#include "gem/i915_gem_pm.h"
> > > +#include "gem/i915_gem_vm_bind.h"
> > > =C2=A0#include "gt/intel_gt.h"
> > > =C2=A0#include "gt/intel_gt_pm.h"
> > > =C2=A0#include "gt/intel_rc6.h"
> > > @@ -1783,13 +1784,16 @@ static int i915_gem_vm_bind_ioctl(struct
> > > drm_device *dev, void *data,
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_gem_v=
m_bind *args =3D data;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_address_s=
pace *vm;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vm =3D i915_gem_vm_lo=
okup(file->driver_priv, args->vm_id);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(!vm))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOENT;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_vm_bind_o=
bj(vm, args, file);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_vm_put(vm);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static int i915_gem_vm_unbind_ioctl(struct drm_device *dev, voi=
d
> > > *data,
> > > @@ -1797,13 +1801,16 @@ static int
> > > i915_gem_vm_unbind_ioctl(struct
> > > drm_device *dev, void *data,
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_gem_v=
m_unbind *args =3D data;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_address_s=
pace *vm;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vm =3D i915_gem_vm_lo=
okup(file->driver_priv, args->vm_id);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(!vm))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOENT;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i915_gem_vm_unbind=
_obj(vm, args);
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_vm_put(vm);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static const struct drm_ioctl_desc i915_ioctls[] =3D {
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.c
> > > b/drivers/gpu/drm/i915/i915_vma.c
> > > index 43339ecabd73..d324e29cef0a 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.c
> > > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > > @@ -29,6 +29,7 @@
> > > =C2=A0#include "display/intel_frontbuffer.h"
> > > =C2=A0#include "gem/i915_gem_lmem.h"
> > > =C2=A0#include "gem/i915_gem_tiling.h"
> > > +#include "gem/i915_gem_vm_bind.h"
> > > =C2=A0#include "gt/intel_engine.h"
> > > =C2=A0#include "gt/intel_engine_heartbeat.h"
> > > =C2=A0#include "gt/intel_gt.h"
> > > @@ -234,6 +235,7 @@ vma_create(struct drm_i915_gem_object *obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock(&obj->vma=
.lock);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&vm->mut=
ex);
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_LIST_HEAD(&vma->vm_bi=
nd_link);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return vma;
> > > =C2=A0
> > > =C2=A0err_unlock:
> > > @@ -290,7 +292,6 @@ i915_vma_instance(struct drm_i915_gem_object
> > > *obj,
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vma *vma;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GEM_BUG_ON(view && !i915_i=
s_ggtt_or_dpt(vm));
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GEM_BUG_ON(!kref_read=
(&vm->ref));
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock(&obj->vma.l=
ock);
> > > @@ -1660,6 +1661,10 @@ static void release_references(struct
> > > i915_vma
> > > *vma, bool vm_ddestroy)
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock(&obj->vma=
.lock);
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_lock(vma-=
>vm);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_remove(vm=
a, true);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915_gem_vm_bind_unlock(vm=
a->vm);
> > > +
> >=20
> > The vm might be destroyed at this point already.
> >=20
>=20
> Ah, due to async vma resource release...
>=20
> > From what I understand we can destroy the vma from three call
> > sites:
> > 1) VM_UNBIND -> The vma has already been removed from the vm_bind
> > address space,
> > 2) object destruction -> since the vma has an object reference
> > while in
> > the vm_bind address space, it must also have been removed from the
> > address space if called from object destruction.
> > 3) vm destruction. Suggestion is to call VM_UNBIND from under the
> > vm_bind lock early in vm destruction.
> >=20
> > Then the above added code can be removed and replaced with an
> > assert
> > that the vm_bind address space RB_NODE is indeed empty.
> >=20
>=20
> ...yah, makes sense to move this code to early in VM destruction than
> here.
>=20
> Niranjana
>=20
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irq(&gt->cl=
osed_lock);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__i915_vma_remove_clo=
sed(vma);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irq(&gt->=
closed_lock);
> > > diff --git a/drivers/gpu/drm/i915/i915_vma.h
> > > b/drivers/gpu/drm/i915/i915_vma.h
> > > index 88ca0bd9c900..dcb49f79ff7e 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma.h
> > > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > > @@ -164,8 +164,6 @@ i915_vma_compare(struct i915_vma *vma,
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ptrdiff_t cmp;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GEM_BUG_ON(view && !i915_i=
s_ggtt_or_dpt(vm));
> > > -
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmp =3D ptrdiff(vma->=
vm, vm);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (cmp)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return cmp;
> > > diff --git a/drivers/gpu/drm/i915/i915_vma_types.h
> > > b/drivers/gpu/drm/i915/i915_vma_types.h
> > > index be6e028c3b57..b6d179bdbfa0 100644
> > > --- a/drivers/gpu/drm/i915/i915_vma_types.h
> > > +++ b/drivers/gpu/drm/i915/i915_vma_types.h
> > > @@ -289,6 +289,14 @@ struct i915_vma {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** This object's pla=
ce on the active/inactive lists */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head vm_l=
ink;
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head vm_bind_l=
ink; /* Link in persistent VMA
> > > list
> > > */
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/** Interval tree structur=
es for persistent vma */
> >=20
> > Proper kerneldoc.
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rb_node rb;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 start;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 last;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 __subtree_last;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct list_head obj_=
link; /* Link in the object's VMA
> > > list
> > > */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct rb_node obj_no=
de;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct hlist_node obj=
_hash;
> >=20
> > Thanks,
> > Thomas
> >=20

