Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9827C864F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FFC10E60A;
	Fri, 13 Oct 2023 13:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6459710E0AB;
 Fri, 13 Oct 2023 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202157; x=1728738157;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oKkaOCzIB0CF3bHV8yzNLF67aIr+dy+gyj0gRydWsfc=;
 b=PaAevwSa0r8osfnAlFd/HdJ1S+9FH21oO3RUw6nxtaue/cZjym3hIZdD
 m8rLEEMYEUoWTp70J/CTYyweUANo/6prNanPuH+wzl7Xxiq1Bs9gv8d6G
 FNkwSCh2pOg0cOqRVmCG0T6i6qcr6aNV3UEfMi3RBWtUPhvOXpL/KMEQr
 lqvPhD8BwKXWzrZbRk29DFFO4niIn4KwNYOuH26tN1fJIyz2w1pam9bcZ
 1fhW7UE9ssGqeX8Tw/KNiFDMOxmmJhrj4SGzOfR3R11gXcu+G7y3RaQ5a
 FYYKmIG+5Udd4jCaOj9IHa4BPeWQZ7r19qD05L1tK928S9HpOh02iOP7h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370240019"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="370240019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784153438"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="784153438"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:02:32 -0700
Message-ID: <7b96fa4f97e5c7f368a0849bf8629f9fab43bcf2.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v6 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Fri, 13 Oct 2023 15:02:30 +0200
In-Reply-To: <33e7e7cb-0302-4f09-94f5-aaa14ea7e9f5@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-5-dakr@redhat.com>
 <9d2c3eb5-f0e6-23a6-0946-7d63670b4778@linux.intel.com>
 <4e0d545f-b0bb-17fa-73dc-62c652a0cce3@redhat.com>
 <780f4ac6-949f-ebc1-791b-69141add3de2@linux.intel.com>
 <33e7e7cb-0302-4f09-94f5-aaa14ea7e9f5@redhat.com>
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

On Fri, 2023-10-13 at 14:04 +0200, Danilo Krummrich wrote:
> On 10/10/23 08:26, Thomas Hellstr=C3=B6m wrote:
> >=20
> > On 10/9/23 16:45, Danilo Krummrich wrote:
> > > On 10/9/23 15:36, Thomas Hellstr=C3=B6m wrote:
> > > >=20
> > > > On 10/9/23 01:32, Danilo Krummrich wrote:
> > > > > Currently the DRM GPUVM offers common infrastructure to track
> > > > > GPU VA
> > > > > allocations and mappings, generically connect GPU VA mappings
> > > > > to their
> > > > > backing buffers and perform more complex mapping operations
> > > > > on the GPU VA
> > > > > space.
> > > > >=20
> > > > > However, there are more design patterns commonly used by
> > > > > drivers, which
> > > > > can potentially be generalized in order to make the DRM GPUVM
> > > > > represent
> > > > > a basis for GPU-VM implementations. In this context, this
> > > > > patch aims
> > > > > at generalizing the following elements.
> > > > >=20
> > > > > 1) Provide a common dma-resv for GEM objects not being used
> > > > > outside of
> > > > > =C2=A0=C2=A0=C2=A0 this GPU-VM.
> > > > >=20
> > > > > 2) Provide tracking of external GEM objects (GEM objects
> > > > > which are
> > > > > =C2=A0=C2=A0=C2=A0 shared with other GPU-VMs).
> > > > >=20
> > > > > 3) Provide functions to efficiently lock all GEM objects dma-
> > > > > resv the
> > > > > =C2=A0=C2=A0=C2=A0 GPU-VM contains mappings of.
> > > > >=20
> > > > > 4) Provide tracking of evicted GEM objects the GPU-VM
> > > > > contains mappings
> > > > > =C2=A0=C2=A0=C2=A0 of, such that validation of evicted GEM object=
s is
> > > > > accelerated.
> > > > >=20
> > > > > 5) Provide some convinience functions for common patterns.
> > > > >=20
> > > > > Big thanks to Boris Brezillon for his help to figure out
> > > > > locking for
> > > > > drivers updating the GPU VA space within the fence signalling
> > > > > path.
> > > > >=20
> > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > ---
> > > > > =C2=A0 drivers/gpu/drm/drm_gpuvm.c | 646
> > > > > ++++++++++++++++++++++++++++++++++++
> > > > > =C2=A0 include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0 | 246 ++++=
++++++++++
> > > > > =C2=A0 2 files changed, 892 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > > index 28282283ddaf..6977bd30eca5 100644
> > > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > > @@ -82,6 +82,21 @@
> > > > > =C2=A0=C2=A0 * &drm_gem_object list of &drm_gpuvm_bos for an exis=
ting
> > > > > instance of this
> > > > > =C2=A0=C2=A0 * particular combination. If not existent a new inst=
ance
> > > > > is created and linked
> > > > > =C2=A0=C2=A0 * to the &drm_gem_object.
> > > > > + *
> > > > > + * &drm_gpuvm_bo structures, since unique for a given
> > > > > &drm_gpuvm, are also used
> > > > > + * as entry for the &drm_gpuvm's lists of external and
> > > > > evicted objects. Those
> > > > > + * list are maintained in order to accelerate locking of
> > > > > dma-resv locks and
> > > > > + * validation of evicted objects bound in a &drm_gpuvm. For
> > > > > instance, all
> > > > > + * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be
> > > > > locked by calling
> > > > > + * drm_gpuvm_exec_lock(). Once locked drivers can call
> > > > > drm_gpuvm_validate() in
> > > > > + * order to validate all evicted &drm_gem_objects. It is
> > > > > also possible to lock
> > > > > + * additional &drm_gem_objects by providing the
> > > > > corresponding parameters to
> > > > > + * drm_gpuvm_exec_lock() as well as open code the &drm_exec
> > > > > loop while making
> > > > > + * use of helper functions such as drm_gpuvm_prepare_range()
> > > > > or
> > > > > + * drm_gpuvm_prepare_objects().
> > > > > + *
> > > > > + * Every bound &drm_gem_object is treated as external object
> > > > > when its &dma_resv
> > > > > + * structure is different than the &drm_gpuvm's common
> > > > > &dma_resv structure.
> > > > > =C2=A0=C2=A0 */
> > > > > =C2=A0 /**
> > > > > @@ -429,6 +444,20 @@
> > > > > =C2=A0=C2=A0 * Subsequent calls to drm_gpuvm_bo_obtain() for the =
same
> > > > > &drm_gpuvm and
> > > > > =C2=A0=C2=A0 * &drm_gem_object must be able to observe previous
> > > > > creations and destructions
> > > > > =C2=A0=C2=A0 * of &drm_gpuvm_bos in order to keep instances uniqu=
e.
> > > > > + *
> > > > > + * The &drm_gpuvm's lists for keeping track of external and
> > > > > evicted objects are
> > > > > + * protected against concurrent insertion / removal and
> > > > > iteration internally.
> > > > > + *
> > > > > + * However, drivers still need ensure to protect concurrent
> > > > > calls to functions
> > > > > + * iterating those lists, namely drm_gpuvm_prepare_objects()
> > > > > and
> > > > > + * drm_gpuvm_validate().
> > > > > + *
> > > > > + * Alternatively, drivers can set the
> > > > > &DRM_GPUVM_RESV_PROTECTED flag to indicate
> > > > > + * that the corresponding &dma_resv locks are held in order
> > > > > to protect the
> > > > > + * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal
> > > > > locking is disabled and
> > > > > + * the corresponding lockdep checks are enabled. This is an
> > > > > optimization for
> > > > > + * drivers which are capable of taking the corresponding
> > > > > &dma_resv locks and
> > > > > + * hence do not require internal locking.
> > > > > =C2=A0=C2=A0 */
> > > > > =C2=A0 /**
> > > > > @@ -641,6 +670,195 @@
> > > > > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0 */
> > > > > +/**
> > > > > + * get_next_vm_bo_from_list() - get the next vm_bo element
> > > > > + * @__gpuvm: The GPU VM
> > > > > + * @__list_name: The name of the list we're iterating on
> > > > > + * @__local_list: A pointer to the local list used to store
> > > > > already iterated items
> > > > > + * @__prev_vm_bo: The previous element we got from
> > > > > drm_gpuvm_get_next_cached_vm_bo()
> > > > > + *
> > > > > + * This helper is here to provide lockless list iteration.
> > > > > Lockless as in, the
> > > > > + * iterator releases the lock immediately after picking the
> > > > > first element from
> > > > > + * the list, so list insertion deletion can happen
> > > > > concurrently.
> > > > > + *
> > > > > + * Elements popped from the original list are kept in a
> > > > > local list, so removal
> > > > > + * and is_empty checks can still happen while we're
> > > > > iterating the list.
> > > > > + */
> > > > > +#define get_next_vm_bo_from_list(__gpuvm, __list_name,
> > > > > __local_list, __prev_vm_bo)=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *=
__vm_bo =3D
> > > > > NULL;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + drm_gpuvm_bo_put(__prev_vm_bo);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + spin_lock(&(__gpuvm)->__list_name.lock); \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(__gpuvm)-
> > > > > >__list_name.local_list)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (__gpuvm)->__list_name.local_list =3D
> > > > > __local_list;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 WARN_ON((__gpuvm)->__list_name.local_list !=3D
> > > > > __local_list);=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (!list_empty(&(=
__gpuvm)->__list_name.list))
> > > > > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __vm_bo =3D list_first_entry(&(__gpuvm)-
> > > > > >__list_name.list,=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list.entry.__list_name);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (kref_get_unless_zero(&__vm_bo->kref))
> > > > > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > > > > + list_move_tail(&(__vm_bo)->list.entry.__list_name,=C2=A0=C2=A0=
=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 __local_list);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 } else {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + list_del_init(&(__vm_bo)->list.entry.__list_name);=C2=A0=C2=A0=
=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 __vm_bo =3D NULL;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + spin_unlock(&(__gpuvm)->__list_name.lock); \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __vm_bo;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 })
> > > > > +
> > > > > +/**
> > > > > + * for_each_vm_bo_in_list() - internal vm_bo list iterator
> > > > > + *
> > > > > + * This helper is here to provide lockless list iteration.
> > > > > Lockless as in, the
> > > > > + * iterator releases the lock immediately after picking the
> > > > > first element from the
> > > > > + * list, hence list insertion and deletion can happen
> > > > > concurrently.
> > > > > + *
> > > > > + * It is not allowed to re-assign the vm_bo pointer from
> > > > > inside this loop.
> > > > > + *
> > > > > + * Typical use:
> > > > > + *
> > > > > + *=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo;
> > > > > + *=C2=A0=C2=A0=C2=A0 LIST_HEAD(my_local_list);
> > > > > + *
> > > > > + *=C2=A0=C2=A0=C2=A0 ret =3D 0;
> > > > > + *=C2=A0=C2=A0=C2=A0 for_each_vm_bo_in_list(gpuvm, <list_name>,
> > > > > &my_local_list, vm_bo) {
> > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D do_somethin=
g_with_vm_bo(..., vm_bo);
> > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > > + *=C2=A0=C2=A0=C2=A0 }
> > > > > + *=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_put(vm_bo);
> > > > > + *=C2=A0=C2=A0=C2=A0 restore_vm_bo_list(gpuvm, <list_name>,
> > > > > &my_local_list);
> > > > > + *
> > > > > + *
> > > > > + * Only used for internal list iterations, not meant to be
> > > > > exposed to the outside
> > > > > + * world.
> > > > > + */
> > > > > +#define for_each_vm_bo_in_list(__gpuvm, __list_name,
> > > > > __local_list, __vm_bo)=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 for (__vm_bo =3D get_next_vm_bo_from_list(__g=
puvm,
> > > > > __list_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 __local_list, NULL);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __vm_bo;=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __vm_bo =3D get=
_next_vm_bo_from_list(__gpuvm,
> > > > > __list_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 __local_list, __vm_bo))
> > > > > +
> > > > > +static void
> > > > > +__restore_vm_bo_list(struct drm_gpuvm *gpuvm, spinlock_t
> > > > > *lock,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct list_head *list, struct list_head
> > > > > **local_list)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 /* Merge back the two lists, moving local lis=
t elements
> > > > > to the
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * head to preserve previous ordering, i=
n case it
> > > > > matters.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 spin_lock(lock);
> > > > > +=C2=A0=C2=A0=C2=A0 if (*local_list) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_splice(*local_li=
st, list);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *local_list =3D NULL;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 spin_unlock(lock);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * restore_vm_bo_list() - move vm_bo elements back to their
> > > > > original list
> > > > > + * @__gpuvm: The GPU VM
> > > > > + * @__list_name: The name of the list we're iterating on
> > > > > + *
> > > > > + * When we're done iterating a vm_bo list, we should call
> > > > > restore_vm_bo_list()
> > > > > + * to restore the original state and let new iterations take
> > > > > place.
> > > > > + */
> > > > > +#define restore_vm_bo_list(__gpuvm, __list_name)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > \
> > > > > +=C2=A0=C2=A0=C2=A0 __restore_vm_bo_list((__gpuvm), &(__gpuvm)-
> > > > > >__list_name.lock,=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &(__gpuvm)->__list_name.list, \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &(__gpuvm)->__list_name.local_list)
> > > > > +
> > > > > +static void
> > > > > +cond_spin_lock(spinlock_t *lock, bool cond)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 if (cond)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(lock);
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +cond_spin_unlock(spinlock_t *lock, bool cond)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 if (cond)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(lock);
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +__drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t
> > > > > *lock,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct list_head *entry, struct list_head *list)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 cond_spin_lock(lock, !!lock);
> > > > > +=C2=A0=C2=A0=C2=A0 if (list_empty(entry))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_add_tail(entry, =
list);
> > > > > +=C2=A0=C2=A0=C2=A0 cond_spin_unlock(lock, !!lock);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_bo_list_add() - insert a vm_bo into the given
> > > > > list
> > > > > + * @__vm_bo: the &drm_gpuvm_bo
> > > > > + * @__list_name: the name of the list to insert into
> > > > > + * @__lock: whether to lock with the internal spinlock
> > > > > + *
> > > > > + * Inserts the given @__vm_bo into the list specified by
> > > > > @__list_name.
> > > > > + */
> > > > > +#define drm_gpuvm_bo_list_add(__vm_bo, __list_name,
> > > > > __lock)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > > > > + __drm_gpuvm_bo_list_add((__vm_bo)->vm,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lock ? &(__vm_bo)->vm->__list_name.lock
> > > > > :=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + &(__vm_bo)->list.entry.__list_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &(__vm_bo)->vm->__list_name.list)
> > > > > +
> > > > > +static void
> > > > > +__drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t
> > > > > *lock,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct list_head *entry, bool init)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 cond_spin_lock(lock, !!lock);
> > > > > +=C2=A0=C2=A0=C2=A0 if (init) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!list_empty(entry=
))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 list_del_init(entry);
> > > > > +=C2=A0=C2=A0=C2=A0 } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(entry);
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 cond_spin_unlock(lock, !!lock);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_bo_list_del_init() - remove a vm_bo from the
> > > > > given list
> > > > > + * @__vm_bo: the &drm_gpuvm_bo
> > > > > + * @__list_name: the name of the list to insert into
> > > > > + * @__lock: whether to lock with the internal spinlock
> > > > > + *
> > > > > + * Removes the given @__vm_bo from the list specified by
> > > > > @__list_name.
> > > > > + */
> > > > > +#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name,
> > > > > __lock)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + __drm_gpuvm_bo_list_del((__vm_bo)->vm,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lock ? &(__vm_bo)->vm->__list_name.lock
> > > > > :=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + &(__vm_bo)->list.entry.__list_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 true)
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_bo_list_del() - remove a vm_bo from the given
> > > > > list
> > > > > + * @__vm_bo: the &drm_gpuvm_bo
> > > > > + * @__list_name: the name of the list to insert into
> > > > > + * @__lock: whether to lock with the internal spinlock
> > > > > + *
> > > > > + * Removes the given @__vm_bo from the list specified by
> > > > > @__list_name.
> > > > > + */
> > > > > +#define drm_gpuvm_bo_list_del(__vm_bo, __list_name,
> > > > > __lock)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > > > > + __drm_gpuvm_bo_list_del((__vm_bo)->vm,=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 __lock ? &(__vm_bo)->vm->__list_name.lock
> > > > > :=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > + &(__vm_bo)->list.entry.__list_name,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 false)
> > > > > +
> > > > > =C2=A0 #define to_drm_gpuva(__node)=C2=A0=C2=A0=C2=A0 container_o=
f((__node),
> > > > > struct drm_gpuva, rb.node)
> > > > > =C2=A0 #define GPUVA_START(node) ((node)->va.addr)
> > > > > @@ -760,6 +978,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> > > > > struct drm_gem_object *r_obj,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuvm->rb.tree =3D RB_ROOT_CACHED;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&gpuvm->rb.list);
> > > > > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&gpuvm->extobj.list);
> > > > > +=C2=A0=C2=A0=C2=A0 spin_lock_init(&gpuvm->extobj.lock);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&gpuvm->evict.list);
> > > > > +=C2=A0=C2=A0=C2=A0 spin_lock_init(&gpuvm->evict.lock);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm_check_overflow(start_off=
set, range);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuvm->mm_start =3D start_offset;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuvm->mm_range =3D range;
> > > > > @@ -802,10 +1026,372 @@ drm_gpuvm_destroy(struct drm_gpuvm
> > > > > *gpuvm)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tre=
e.rb_root),
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "GPU=
VA tree is not empty, potentially leaking
> > > > > memory.\n");
> > > > > +=C2=A0=C2=A0=C2=A0 WARN(!list_empty(&gpuvm->extobj.list), "Extob=
j list
> > > > > should be empty.\n");
> > > > > +=C2=A0=C2=A0=C2=A0 WARN(!list_empty(&gpuvm->evict.list), "Evict =
list should
> > > > > be empty.\n");
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_put(gpuvm->r_obj);
> > > > > =C2=A0 }
> > > > > =C2=A0 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> > > > > +static int
> > > > > +__drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo;
> > > > > +=C2=A0=C2=A0=C2=A0 LIST_HEAD(extobjs);
> > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 for_each_vm_bo_in_list(gpuvm, extobj, &extobj=
s, vm_bo) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_exec_prep=
are_obj(exec, vm_bo->obj,
> > > > > num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 /* Drop ref in case we break out of the loop.=
 */
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_put(vm_bo);
> > > > > +=C2=A0=C2=A0=C2=A0 restore_vm_bo_list(gpuvm, extobj);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo;
> > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_resv_assert_held(gpuvm);
> > > > > +=C2=A0=C2=A0=C2=A0 list_for_each_entry(vm_bo, &gpuvm->extobj.lis=
t,
> > > > > list.entry.extobj) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_exec_prep=
are_obj(exec, vm_bo->obj,
> > > > > num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vm_bo->evicted)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_gpuvm_bo_list_add(vm_bo, evict, false);
> > > >=20
> > > > Clear vm_bo->evicted here?
> > >=20
> > > Why? It's still evicted, hence why not indicate it? It could be
> > > useful for a
> > > validate_range() use case.
> >=20
> > I guess that boils down to what vm_bo->evicted is supposed to mean.
> > I have been using it as "This bo needs to be put on the evicted
> > list", but if we instead mean "This bo was once evicted and might
> > need revalidation and needs rebinding to this VM" then it's OK not
> > to clear it, I guess. But note that another VM might have already
> > re-validated the gem BO, and also if the locking loop or validate
> > loop restarts due to -EINTR or -EDEADLK, then the
> > drm_gpuvm_bo_list_add() will be called multiple times, which is OK
> > but unnecessary. So I'd vote for "This bo needs to be put on the
> > eviced list".
>=20
> In case of a drm_exec loop restart, the additional
> drm_gpuvm_bo_list_add() is rather negligible. As mentioned, keeping
> drm_gpuvm_bo::evicted in an up to date state could be a useful
> addition to drivers. Besides that, I'd rather make this field safe to
> use by drivers than document that it's *not* safe to look up for
> drivers and should only be used with care internally.
>=20
> >=20
> > >=20
> > > >=20
> > > >=20
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
> > > > > + * @gpuvm: the &drm_gpuvm
> > > > > + * @exec: the &drm_exec locking context
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + *
> > > > > + * Calls drm_exec_prepare_obj() for all &drm_gem_objects the
> > > > > given
> > > > > + * &drm_gpuvm contains mappings of.
> > > > > + *
> > > > > + * Using this function directly, it is the drivers
> > > > > responsibility to call
> > > > > + * drm_exec_init() and drm_exec_fini() accordingly.
> > > > > + *
> > > > > + * Note: This function is safe against concurrent insertion
> > > > > and removal of
> > > > > + * external objects, however it is not safe against
> > > > > concurrent usage itself.
> > > > > + *
> > > > > + * Drivers need to make sure to protect this case with
> > > > > either an outer VM lock
> > > > > + * or by calling drm_gpuvm_prepare_vm() before this function
> > > > > within the
> > > > > + * drm_exec_until_all_locked() loop, such that the GPUVM's
> > > > > dma-resv lock ensures
> > > > > + * mutual exclusion.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 if (drm_gpuvm_resv_protected(gpuvm))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return drm_gpuvm_prep=
are_objects_locked(gpuvm, exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __drm_gpuvm_pr=
epare_objects(gpuvm, exec,
> > > > > num_fences);
> > > > > +
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_prepare_range() - prepare all BOs mapped within
> > > > > a given range
> > > > > + * @gpuvm: the &drm_gpuvm
> > > > > + * @exec: the &drm_exec locking context
> > > > > + * @addr: the start address within the VA space
> > > > > + * @range: the range to iterate within the VA space
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + *
> > > > > + * Calls drm_exec_prepare_obj() for all &drm_gem_objects
> > > > > mapped between @addr
> > > > > + * and @addr + @range.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct
> > > > > drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 u64 addr, u64 range, unsigned int num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuva *va;
> > > > > +=C2=A0=C2=A0=C2=A0 u64 end =3D addr + range;
> > > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_for_each_va_range(va, gpuvm, addr, =
end) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object=
 *obj =3D va->gem.obj;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_exec_prep=
are_obj(exec, obj, num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_exec_lock() - lock all dma-resv of all
> > > > > assoiciated BOs
> > > > > + * @vm_exec: the &drm_gpuvm_exec wrapper
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + * @interruptible: sleep interruptible if waiting
> > > > > + *
> > > > > + * Acquires all dma-resv locks of all &drm_gem_objects the
> > > > > given
> > > > > + * &drm_gpuvm contains mappings of.
> > > > > + *
> > > > > + * Addionally, when calling this function with struct
> > > > > drm_gpuvm_exec::extra
> > > > > + * being set the driver receives the given @fn callback to
> > > > > lock additional
> > > > > + * dma-resv in the context of the &drm_gpuvm_exec instance.
> > > > > Typically, drivers
> > > > > + * would call drm_exec_prepare_obj() from within this
> > > > > callback.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bool interruptible)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm *gpuvm =3D vm_exec->vm;
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_exec *exec =3D &vm_exec->exec;
> > > > > +=C2=A0=C2=A0=C2=A0 uint32_t flags;
> > > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 flags =3D interruptible ? DRM_EXEC_INTERRUPTI=
BLE_WAIT : 0
> > > > > |
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_EXEC_IGNORE_DUPLI=
CATES;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_init(exec, flags);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_until_all_locked(exec) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_gpuvm_pre=
pare_vm(gpuvm, exec, num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_retry_on_con=
tention(exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto err;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_gpuvm_pre=
pare_objects(gpuvm, exec,
> > > > > num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_retry_on_con=
tention(exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto err;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vm_exec->extra.fn=
) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D vm_exec->extra.fn(vm_exec, num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_exec_retry_on_contention(exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > > > +
> > > > > +err:
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_fini(exec);
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
> > > > > +
> > > > > +static int
> > > > > +fn_lock_array(struct drm_gpuvm_exec *vm_exec, unsigned int
> > > > > num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object=
 **objs;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_objs=
;
> > > > > +=C2=A0=C2=A0=C2=A0 } *args =3D vm_exec->extra.priv;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return drm_exec_prepare_array(&vm_exec->exec,=
 args-
> > > > > >objs,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->num_o=
bjs, num_fences);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_exec_lock_array() - lock all dma-resv of all
> > > > > assoiciated BOs
> > > > > + * @vm_exec: the &drm_gpuvm_exec wrapper
> > > > > + * @objs: additional &drm_gem_objects to lock
> > > > > + * @num_objs: the number of additional &drm_gem_objects to
> > > > > lock
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + * @interruptible: sleep interruptible if waiting
> > > > > + *
> > > > > + * Acquires all dma-resv locks of all &drm_gem_objects the
> > > > > given &drm_gpuvm
> > > > > + * contains mappings of, plus the ones given through @objs.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_gem_object **objs,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int num_objs,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bool interruptible)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object=
 **objs;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_objs=
;
> > > > > +=C2=A0=C2=A0=C2=A0 } args;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 args.objs =3D objs;
> > > > > +=C2=A0=C2=A0=C2=A0 args.num_objs =3D num_objs;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 vm_exec->extra.fn =3D fn_lock_array;
> > > > > +=C2=A0=C2=A0=C2=A0 vm_exec->extra.priv =3D &args;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return drm_gpuvm_exec_lock(vm_exec, num_fence=
s,
> > > > > interruptible);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_exec_lock_range() - prepare all BOs mapped
> > > > > within a given range
> > > > > + * @vm_exec: the &drm_gpuvm_exec wrapper
> > > > > + * @addr: the start address within the VA space
> > > > > + * @range: the range to iterate within the VA space
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + * @interruptible: sleep interruptible if waiting
> > > > > + *
> > > > > + * Acquires all dma-resv locks of all &drm_gem_objects
> > > > > mapped between @addr and
> > > > > + * @addr + @range.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 u64 addr, u64 range,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 bool interruptible)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm *gpuvm =3D vm_exec->vm;
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_exec *exec =3D &vm_exec->exec;
> > > > > +=C2=A0=C2=A0=C2=A0 uint32_t flags;
> > > > > +=C2=A0=C2=A0=C2=A0 int ret;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 flags =3D interruptible ? DRM_EXEC_INTERRUPTI=
BLE_WAIT : 0
> > > > > |
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_EXEC_IGNORE_DUPLI=
CATES;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_init(exec, flags);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_until_all_locked(exec) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D drm_gpuvm_pre=
pare_range(gpuvm, exec, addr,
> > > > > range,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 num_fences);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_retry_on_con=
tention(exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto err;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +
> > > > > +err:
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_fini(exec);
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
> > > > > +
> > > > > +static int
> > > > > +__drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct
> > > > > drm_exec *exec)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops =3D gpuvm->op=
s;
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo;
> > > > > +=C2=A0=C2=A0=C2=A0 LIST_HEAD(evict);
> > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 for_each_vm_bo_in_list(gpuvm, evict, &evict, =
vm_bo) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ops->vm_bo_va=
lidate(vm_bo, exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 /* Drop ref in case we break out of the loop.=
 */
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_put(vm_bo);
> > > > > +=C2=A0=C2=A0=C2=A0 restore_vm_bo_list(gpuvm, evict);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct
> > > > > drm_exec *exec)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops =3D gpuvm->op=
s;
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo, *next;
> > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_resv_assert_held(gpuvm);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /* Iterate list safely, drivers typically rem=
ove the
> > > > > current entry from
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * their drm_gpuvm_ops::vm_bo_validate c=
allback. Drivers
> > > > > might also
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * re-add the entry on failure; this is =
safe since on
> > > > > failure we break
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * out of the loop.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(vm_bo, next, &gpuvm-
> > > > > >evict.list,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list.entry.evict) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ops->vm_bo_va=
lidate(vm_bo, exec);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_validate() - validate all BOs marked as evicted
> > > > > + * @gpuvm: the &drm_gpuvm to validate evicted BOs
> > > > > + * @exec: the &drm_exec instance used for locking the GPUVM
> > > > > + *
> > > > > + * Calls the &drm_gpuvm_ops::vm_bo_validate callback for all
> > > > > evicted buffer
> > > > > + * objects being mapped in the given &drm_gpuvm.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int
> > > > > +drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec
> > > > > *exec)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops =3D gpuvm->op=
s;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (unlikely(!ops || !ops->vm_bo_validate))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOTSUPP;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (drm_gpuvm_resv_protected(gpuvm))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return drm_gpuvm_vali=
date_locked(gpuvm, exec);
> > > > > +=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __drm_gpuvm_va=
lidate(gpuvm, exec);
> > > > > +
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_resv_add_fence - add fence to private and all
> > > > > extobj
> > > > > + * dma-resv
> > > > > + * @gpuvm: the &drm_gpuvm to add a fence to
> > > > > + * @exec: the &drm_exec locking context
> > > > > + * @fence: fence to add
> > > > > + * @private_usage: private dma-resv usage
> > > > > + * @extobj_usage: extobj dma-resv usage
> > > > > + */
> > > > > +void
> > > > > +drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct dma_fence *fence,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enum dma_resv_usage private_usage,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enum dma_resv_usage extobj_usage)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long index;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_for_each_locked_object(exec, index, =
obj) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_assert_held(=
obj->resv);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_add_fence(ob=
j->resv, fence,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm_is_extobj(gpuvm, ob=
j) ?
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 private_usage : extobj_usage)=
;
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
> > > > > +
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0 * drm_gpuvm_bo_create() - create a new instance of s=
truct
> > > > > drm_gpuvm_bo
> > > > > =C2=A0=C2=A0 * @gpuvm: The &drm_gpuvm the @obj is mapped in.
> > > > > @@ -838,6 +1424,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm
> > > > > *gpuvm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&vm_bo->list.gpuva)=
;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&vm_bo->list.entry.=
gem);
> > > > > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
> > > > > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&vm_bo->list.entry.evict);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_get(obj);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return vm_bo;
> > > > > @@ -858,6 +1447,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm_=
resv_assert_held(gpuvm);
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_list_del(vm_bo, evict, lock);
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&vm_bo->list.entry.gem);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_object_put(obj);
> > > > > @@ -994,6 +1586,60 @@ drm_gpuvm_bo_obtain_prealloc(struct
> > > > > drm_gpuvm_bo *__vm_bo)
> > > > > =C2=A0 }
> > > > > =C2=A0 EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
> > > > > +/**
> > > > > + * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo to its
> > > > > &drm_gpuvm's
> > > > > + * extobj list
> > > > > + * @vm_bo: The &drm_gpuvm_bo to add to its &drm_gpuvm's the
> > > > > extobj list.
> > > > > + *
> > > > > + * Adds the given @vm_bo to its &drm_gpuvm's extobj list if
> > > > > not on the list
> > > > > + * already and if the corresponding &drm_gem_object is an
> > > > > external object,
> > > > > + * actually.
> > > > > + */
> > > > > +void
> > > > > +drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +=C2=A0=C2=A0=C2=A0 bool lock =3D !drm_gpuvm_resv_protected(gpuvm=
);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (!lock)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm_resv_assert=
_held(gpuvm);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm_bo_list_add=
(vm_bo, extobj, lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to /
> > > > > from the &drm_gpuvms
> > > > > + * evicted list
> > > > > + * @vm_bo: the &drm_gpuvm_bo to add or remove
> > > > > + * @evict: indicates whether the object is evicted
> > > > > + *
> > > > > + * Adds a &drm_gpuvm_bo to or removes it from the
> > > > > &drm_gpuvms evicted list.
> > > > > + */
> > > > > +void
> > > > > +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj =3D vm_bo->obj;
> > > > > +=C2=A0=C2=A0=C2=A0 bool lock =3D !drm_gpuvm_resv_protected(gpuvm=
);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 dma_resv_assert_held(obj->resv);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if (drm_gpuvm_is_extobj(gpuvm, obj)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_bo->evicted =3D ev=
ict;
> > > > Does the lock case also need this?
> > >=20
> > > It doesn't need it by itself, but since we have
> > > drm_gpuvm_bo::evicted now, I want it to
> > > consistently indicate whether the BO is evicted or not.
> >=20
> > OK, I guess that ties to the meaning of bo->evicted, as discussed
> > above.
> >=20
> > >=20
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!lock)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
> > > >=20
> > > > Here the !lock case can not remove the gpuvm_bo from the list?
> > >=20
> > > You mean because we'd expect that drm_gpuvm_bo_evict(vm_bo,
> > > false) can only be called from
> > > within gpuvm_validate(), which requires the VM's resv lock? What
> > > if there is a ttm_validate()
> > > call for only this GEM obj?
> > >=20
> > > My idea was to remove VM_BOs from the evicted list in
> > > gpuvm_validate() directly, but I'm afraid
> > > I forgot that.
> >=20
> > Yes, I think the helper could do it if validate() is successful.
> > But what I meant above was that if the *driver* is responsible for
> > removing object from the evicted list, then if it's a
> > RESV_PROTECTED vm, it can't do that because
> > drm_gpuvm_bo_evict(gpuvm, false) will never get to removing it from
> > the list because it returns early.
>=20
> Well, with a RESV_PROTECTED VM we can't expect the evicted list to be
> up to date until we called drm_gpuvm_prepare_objects() by definition.
> In drm_gpuvm_prepare_objects() we'd need to
>=20
> if (vm_bo->evicted)
> =C2=A0=C2=A0 add_to_list()
> else
> =C2=A0=C2=A0 remove_from_list()
>=20
> though, because a driver could lock and unlock those objects without
> validation.

OK. Makes sense. No strong opinion from my side here.

/Thomas



>=20
> >=20
> > Thanks,
> >=20
> > Thomas
> >=20
> >=20
> > >=20
> > > >=20
> > > > Small patch here that I've been using for xe:
> > > >=20
> > > > https://patchwork.freedesktop.org/patch/561545/?series=3D124817&rev=
=3D1
> > > >=20
> > > > Thanks,
> > > >=20
> > > > Thomas
> > > >=20
> > > >=20
> > >=20
> >=20
>=20

