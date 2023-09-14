Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863F7A0DE8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635610E57B;
	Thu, 14 Sep 2023 19:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742710E563;
 Thu, 14 Sep 2023 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694718895; x=1726254895;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YZkCHIVGw9IK92mpFq46alloAI5CuK+/9NDjKcGgH34=;
 b=fgGmA8gwVdBQAhAG6FTjwEUoVVFmMkV/KQUeNAWNc/UBe10HikDgUW5V
 +T3n1PxnHCVkadoWyUPuno8YSEQYK/TGt9F7R50+XLwX/eB8+nV00pTWi
 cTf12mUqJ+A5fpOD4vNpoAC2toWyvlnz1dVEiZFBAcN3MIC2UZQ3uCmKq
 N+6DAu1V0TGeaNe81kiBA4LAMvAFk2jgBAejENrKNR4tjWch7Wjx+IJvr
 sd14xNqaA1zbmtxCCh0nhI2nZgR6d8Ih4r0jwvbcTzHwzUj3vxhABvm8x
 DM6TIBAYCl/XG1iQGOUzYUDIk2iTvENCgc8wn3tLKok6JWrgbKqgZtS2g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358465526"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="358465526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918344346"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918344346"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.49])
 ([10.249.254.49])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:14:50 -0700
Message-ID: <e9ea8cb0a55a004a0f7d5d5a7469ea4d4ef00bf4.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, 
 faith.ekstrand@collabora.com
Date: Thu, 14 Sep 2023 21:14:48 +0200
In-Reply-To: <803e4aa0-0c46-05ba-e90b-188771227f0a@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <62d9b00a-547a-2106-5ec3-6f6a88023496@linux.intel.com>
 <c620c142-ea38-415d-729e-2561f1f4bae3@redhat.com>
 <476c46cfddaef125108a117b47ea9f76299ea85c.camel@linux.intel.com>
 <803e4aa0-0c46-05ba-e90b-188771227f0a@redhat.com>
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

On Thu, 2023-09-14 at 19:25 +0200, Danilo Krummrich wrote:
> On 9/14/23 19:21, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2023-09-14 at 18:36 +0200, Danilo Krummrich wrote:
> > > On 9/14/23 15:48, Thomas Hellstr=C3=B6m wrote:
> > > > Hi, Danilo
> > > >=20
> > > > Some additional minor comments as xe conversion progresses.
> > > >=20
> > > > On 9/9/23 17:31, Danilo Krummrich wrote:
> > > > > So far the DRM GPUVA manager offers common infrastructure to
> > > > > track GPU VA
> > > > > allocations and mappings, generically connect GPU VA mappings
> > > > > to
> > > > > their
> > > > > backing buffers and perform more complex mapping operations
> > > > > on
> > > > > the GPU VA
> > > > > space.
> > > > >=20
> > > > > However, there are more design patterns commonly used by
> > > > > drivers,
> > > > > which
> > > > > can potentially be generalized in order to make the DRM GPUVA
> > > > > manager
> > > > > represent a basic GPU-VM implementation. In this context,
> > > > > this
> > > > > patch aims
> > > > > at generalizing the following elements.
> > > > >=20
> > > > > 1) Provide a common dma-resv for GEM objects not being used
> > > > > outside of
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 this GPU-VM.
> > > > >=20
> > > > > 2) Provide tracking of external GEM objects (GEM objects
> > > > > which
> > > > > are
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 shared with other GPU-VMs).
> > > > >=20
> > > > > 3) Provide functions to efficiently lock all GEM objects dma-
> > > > > resv
> > > > > the
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 GPU-VM contains mappings of.
> > > > >=20
> > > > > 4) Provide tracking of evicted GEM objects the GPU-VM
> > > > > contains
> > > > > mappings
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 of, such that validation of evicted GEM =
objects is
> > > > > accelerated.
> > > > >=20
> > > > > 5) Provide some convinience functions for common patterns.
> > > > >=20
> > > > > Rather than being designed as a "framework", the target is to
> > > > > make all
> > > > > features appear as a collection of optional helper functions,
> > > > > such that
> > > > > drivers are free to make use of the DRM GPUVA managers basic
> > > > > functionality and opt-in for other features without setting
> > > > > any
> > > > > feature
> > > > > flags, just by making use of the corresponding functions.
> > > > >=20
> > > > > Big kudos to Boris Brezillon for his help to figure out
> > > > > locking
> > > > > for drivers
> > > > > updating the GPU VA space within the fence signalling path.
> > > > >=20
> > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > ---
> > > > >=20
> > > > > +/**
> > > > > + * drm_gpuvm_bo_evict() - add / remove a &drm_gem_object to
> > > > > /
> > > > > from a
> > > > > + * &drm_gpuvms evicted list
> > > > > + * @obj: the &drm_gem_object to add or remove
> > > > > + * @evict: indicates whether the object is evicted
> > > > > + *
> > > > > + * Adds a &drm_gem_object to or removes it from all
> > > > > &drm_gpuvms
> > > > > evicted
> > > > > + * list containing a mapping of this &drm_gem_object.
> > > > > + */
> > > > > +void
> > > > > +drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool evict)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm_bo *vm_bo;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (evict)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_gpuvm_bo_list_add(vm_bo, evict);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drm_gpuvm_bo_list_del(vm_bo, evict);
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_evict);
> > > > > +
> > > >=20
> > > > We need a drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, ...)
> > > > that
> > > > puts a single gpuvm_bo on the list, the above function could
> > > > perhaps be renamed as drm_gpuvm_gem_obj_evict(obj, ....).
> > >=20
> > > Makes sense - gonna change that.
> > >=20
> > > >=20
> > > > Reason is some vm's are faulting vms which don't have an evict
> > > > list, but validate from the pagefault handler. Also evict =3D=3D
> > > > false
> > > > is dangerous because if called from within an exec, it might
> > > > remove
> > > > the obj from other vm's evict list before they've had a chance
> > > > to
> > > > rebind their VMAs.
> > > >=20
> > > > > =C2=A0=C2=A0 static int
> > > > > =C2=A0=C2=A0 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_gpuva *va)
> > > > > diff --git a/include/drm/drm_gpuvm.h
> > > > > b/include/drm/drm_gpuvm.h
> > > > > index afa50b9059a2..834bb6d6617e 100644
> > > > > --- a/include/drm/drm_gpuvm.h
> > > > > +++ b/include/drm/drm_gpuvm.h
> > > > > @@ -26,10 +26,12 @@
> > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0 #include <linux/list.h>
> > > > > +#include <linux/dma-resv.h>
> > > > > =C2=A0=C2=A0 #include <linux/rbtree.h>
> > > > > =C2=A0=C2=A0 #include <linux/types.h>
> > > > > =C2=A0=C2=A0 #include <drm/drm_gem.h>
> > > > > +#include <drm/drm_exec.h>
> > > > > =C2=A0=C2=A0 struct drm_gpuvm;
> > > > > =C2=A0=C2=A0 struct drm_gpuvm_bo;
> > > > > @@ -259,6 +261,38 @@ struct drm_gpuvm {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * space
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_resv *resv;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @extobj: structure holding the extobj=
 list
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 struct {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @list: &list_=
head storing &drm_gpuvm_bos serving
> > > > > as
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * external obje=
ct
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head list=
;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @lock: spinlo=
ck to protect the extobj list
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t lock;
> > > > > +=C2=A0=C2=A0=C2=A0 } extobj;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @evict: structure holding the evict l=
ist and evict
> > > > > list
> > > > > lock
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 struct {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @list: &list_=
head storing &drm_gpuvm_bos
> > > > > currently
> > > > > being
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * evicted
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head list=
;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @lock: spinlo=
ck to protect the evict list
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spinlock_t lock;
> > > > > +=C2=A0=C2=A0=C2=A0 } evict;
> > > > > =C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct
> > > > > drm_device
> > > > > *drm,
> > > > > @@ -268,6 +302,21 @@ void drm_gpuvm_init(struct drm_gpuvm
> > > > > *gpuvm,
> > > > > struct drm_device *drm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops);
> > > > > =C2=A0=C2=A0 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> > > > > +/**
> > > > > + * drm_gpuvm_is_extobj() - indicates whether the given
> > > > > &drm_gem_object is an
> > > > > + * external object
> > > > > + * @gpuvm: the &drm_gpuvm to check
> > > > > + * @obj: the &drm_gem_object to check
> > > > > + *
> > > > > + * Returns: true if the &drm_gem_object &dma_resv differs
> > > > > from
> > > > > the
> > > > > + * &drm_gpuvms &dma_resv, false otherwise
> > > > > + */
> > > > > +static inline bool drm_gpuvm_is_extobj(struct drm_gpuvm
> > > > > *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struc=
t drm_gem_object *obj)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 return obj && obj->resv !=3D gpuvm->resv;
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0 static inline struct drm_gpuva *
> > > > > =C2=A0=C2=A0 __drm_gpuva_next(struct drm_gpuva *va)
> > > > > =C2=A0=C2=A0 {
> > > > > @@ -346,6 +395,128 @@ __drm_gpuva_next(struct drm_gpuva *va)
> > > > > =C2=A0=C2=A0 #define drm_gpuvm_for_each_va_safe(va__, next__, gpu=
vm__)
> > > > > \
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(va_=
_, next__, &(gpuvm__)-
> > > > > >rb.list,
> > > > > rb.entry)
> > > > > +/**
> > > > > + * struct drm_gpuvm_exec - &drm_gpuvm abstraction of
> > > > > &drm_exec
> > > > > + *
> > > > > + * This structure should be created on the stack as
> > > > > &drm_exec
> > > > > should be.
> > > > > + *
> > > > > + * Optionally, @extra can be set in order to lock additional
> > > > > &drm_gem_objects.
> > > > > + */
> > > > > +struct drm_gpuvm_exec {
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @exec: the &drm_exec structure
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_exec exec;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @vm: the &drm_gpuvm to lock its DMA r=
eservations
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 struct drm_gpuvm *vm;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @extra: Callback and corresponding pr=
ivate data for
> > > > > the
> > > > > driver to
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * lock arbitrary additional &drm_gem_ob=
jects.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 struct {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @fn: The driv=
er callback to lock additional
> > > > > &drm_gem_objects.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*fn)(struct drm_=
gpuvm_exec *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned int num_fences);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @priv: driver=
 private data for the @fn callback
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *priv;
> > > > > +=C2=A0=C2=A0=C2=A0 } extra;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-
> > > > > resv
> > > > > + * @gpuvm: the &drm_gpuvm
> > > > > + * @exec: the &drm_exec context
> > > > > + * @num_fences: the amount of &dma_fences to reserve
> > > > > + *
> > > > > + * Calls drm_exec_prepare_obj() for the GPUVMs dummy
> > > > > &drm_gem_object.
> > > > > + *
> > > > > + * Using this function directly, it is the drivers
> > > > > responsibility to call
> > > > > + * drm_exec_init() and drm_exec_fini() accordingly.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static inline int
> > > > > +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int num_fences)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 return drm_exec_prepare_obj(exec, &gpuvm->d_o=
bj,
> > > > > num_fences);
> > > > > +}
> > > > > +
> > > > > +int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences);
> > > > > +
> > > > > +int drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 addr, u64 range,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences);
> > > > > +
> > > > > +int drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bool interruptible);
> > > > > +
> > > > > +int drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec
> > > > > *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object **objs,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_objs,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool interruptible);
> > > > > +
> > > > > +int drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec
> > > > > *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 addr, u64 range,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_fences,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool interruptible);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_lock() - lock all dma-resv of all assoiciated
> > > > > BOs
> > > > > + * @gpuvm: the &drm_gpuvm
> > > > > + *
> > > > > + * Releases all dma-resv locks of all &drm_gem_objects
> > > > > previously acquired
> > > > > + * through drm_gpuvm_lock() or its variants.
> > > > > + *
> > > > > + * Returns: 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static inline void
> > > > > +drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 drm_exec_fini(&vm_exec->exec);
> > > > > +}
> > > > > +
> > > > > +int drm_gpuvm_validate(struct drm_gpuvm *gpuvm);
> > > > > +void drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_exec *exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_resv_usage private_usage,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_resv_usage extobj_usage);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpuvm_exec_resv_add_fence()
> > > > > + * @vm_exec: the &drm_gpuvm_exec abstraction
> > > > > + * @fence: fence to add
> > > > > + * @private_usage: private dma-resv usage
> > > > > + * @extobj_usage: extobj dma-resv usage
> > > > > + *
> > > > > + * See drm_gpuvm_resv_add_fence().
> > > > > + */
> > > > > +static inline void
> > > > > +drm_gpuvm_exec_resv_add_fence(struct drm_gpuvm_exec
> > > > > *vm_exec,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_resv_usage private_usage,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum dma_resv_usage extobj_usage)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 drm_gpuvm_resv_add_fence(vm_exec->vm, &vm_exe=
c->exec,
> > > > > fence,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 private_usage, extobj_usage);
> > > > > +}
> > > > > +
> > > > > =C2=A0=C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0 * struct drm_gpuvm_bo - structure representing=
 a
> > > > > &drm_gpuvm
> > > > > and
> > > > > =C2=A0=C2=A0=C2=A0 * &drm_gem_object combination
> > > > > @@ -398,6 +569,18 @@ struct drm_gpuvm_bo {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * gpuva list.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct list_head gem;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * @evict: List entry to attach to the
> > > > > &drm_gpuvms
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * extobj list.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct list_head extobj;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * @evict: List entry to attach to the
> > > > > &drm_gpuvms
> > > > > evict
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * list.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct list_head evict;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } en=
try;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } list;
> > > > > =C2=A0=C2=A0 };
> > > > > @@ -432,6 +615,9 @@ struct drm_gpuvm_bo *
> > > > > =C2=A0=C2=A0 drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct drm_gem_object *obj);
> > > > > +void drm_gpuvm_bo_evict(struct drm_gem_object *obj, bool
> > > > > evict);
> > > > > +void drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo);
> > > > > +
> > > > > =C2=A0=C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0 * drm_gpuvm_bo_for_each_va() - iterator to wal=
k over a
> > > > > list of
> > > > > &drm_gpuva
> > > > > =C2=A0=C2=A0=C2=A0 * @va__: &drm_gpuva structure to assign to in =
each
> > > > > iteration
> > > > > step
> > > > > @@ -837,6 +1023,17 @@ struct drm_gpuvm_ops {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * used.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*sm_step_unmap)(struct =
drm_gpuva_op *op, void
> > > > > *priv);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @bo_validate: called from drm_gpuvm_v=
alidate()
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Drivers receive this callback for eve=
ry evicted
> > > > > &drm_gem_object being
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * mapped in the corresponding &drm_gpuv=
m.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Typically, drivers would call their d=
river specific
> > > > > variant of
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * ttm_bo_validate() from within this ca=
llback.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0 int (*bo_validate)(struct drm_gem_object *obj=
);
> > > >=20
> > > > Same here. Could we have a vm_bo as an argument instead, so
> > > > that
> > > > the callback knows what gpuvm we're targeting and can mark all
> > > > its
> > > > gpu_vas for revalidation? Or is that intended to be done
> > > > elsewhere?
> > >=20
> > > Makes sense as well. I'll change that too.
> >=20
> > I forgot, drm_gpuvm_validate() would preferably take an
> > drm_gpuvm_exec
> > argument because we need it in the validate callback. It's also
> > easy
> > for the driver to subclass further if needed, to pass even more
> > arguments to its validate callback.
>=20
> Hm.. that implies that a driver open coding the drm_exec loop, still
> needs
> to use a struct drm_gpuvm_exec rather than just a struct drm_exec.
> What is
> this needed for in Xe? Do we expect other drivers needing it? Might a
> priv
> void pointer maybe make more sense?

It's for sleeping locks during eviction rather than trylocks. TTM
currently fishes out the struct ww_acquire_context used for locking
from the lock itself, but I'd expect that to be more explicit in the
near future with a variant of ttm_bo_validate() that actually
explicitly takes a drm_exec as argument.

So we would probably also like to try to find a way to encourage
drivers to include the validate() in the until_all_locked() loop,
because if TTM resorts to a sleeping lock *after* that loop, the
following warning will be hit:

https://elixir.bootlin.com/linux/latest/source/kernel/locking/ww_mutex.h#L1=
95

So not sure what's best, but perhaps then a struct drm_exec * or a=C2=A0
(void *)

/Thomas


>=20
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > >=20
> > > > > =C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0 int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *=
priv,
> > > >=20
> > > > Thanks,
> > > >=20
> > > > Thomas
> > > >=20
> > > >=20
> > >=20
> >=20
>=20

