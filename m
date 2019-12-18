Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8D1125751
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 00:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE1089830;
	Wed, 18 Dec 2019 23:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72B89830;
 Wed, 18 Dec 2019 23:03:07 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 15:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="218296896"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga003.jf.intel.com with ESMTP; 18 Dec 2019 15:03:05 -0800
Date: Wed, 18 Dec 2019 14:51:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191218225156.GC17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <157632101451.7535.15356831606040204033@skylake-alporthouse-com>
 <20191216041524.GU14488@nvishwa1-DESK.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216041524.GU14488@nvishwa1-DESK.sc.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kenneth.w.graunke@intel.com, intel-gfx@lists.freedesktop.org,
 sanjay.k.kumar@intel.com, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com,
 jgg@mellanox.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 08:15:24PM -0800, Niranjan Vishwanathapura wrote:
>On Sat, Dec 14, 2019 at 10:56:54AM +0000, Chris Wilson wrote:
>>Quoting Niranjana Vishwanathapura (2019-12-13 21:56:04)
>>>Shared Virtual Memory (SVM) runtime allocator support allows
>>>binding a shared virtual address to a buffer object (BO) in the
>>>device page table through an ioctl call.
>>>
>>>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>Cc: Daniel Vetter <daniel.vetter@intel.com>
>>>Cc: Sudeep Dutt <sudeep.dutt@intel.com>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>---
>>> drivers/gpu/drm/i915/Kconfig                  | 11 ++++
>>> drivers/gpu/drm/i915/Makefile                 |  3 +
>>> .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 58 ++++++++++++++----
>>> drivers/gpu/drm/i915/gem/i915_gem_svm.c       | 60 +++++++++++++++++++
>>> drivers/gpu/drm/i915/gem/i915_gem_svm.h       | 22 +++++++
>>> drivers/gpu/drm/i915/i915_drv.c               | 21 +++++++
>>> drivers/gpu/drm/i915/i915_drv.h               | 22 +++++++
>>> drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 +
>>> drivers/gpu/drm/i915/i915_gem_gtt.h           | 13 ++++
>>> include/uapi/drm/i915_drm.h                   | 27 +++++++++
>>> 10 files changed, 227 insertions(+), 11 deletions(-)
>>> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.c
>>> create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.h
>>>
>>>diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>>>index ba9595960bbe..c2e48710eec8 100644
>>>--- a/drivers/gpu/drm/i915/Kconfig
>>>+++ b/drivers/gpu/drm/i915/Kconfig
>>>@@ -137,6 +137,16 @@ config DRM_I915_GVT_KVMGT
>>>          Choose this option if you want to enable KVMGT support for
>>>          Intel GVT-g.
>>>
>>>+config DRM_I915_SVM
>>>+       bool "Enable Shared Virtual Memory support in i915"
>>>+       depends on STAGING
>>>+       depends on DRM_I915
>>>+       default n
>>>+       help
>>>+         Choose this option if you want Shared Virtual Memory (SVM)
>>>+         support in i915. With SVM support, one can share the virtual
>>>+         address space between a process and the GPU.
>>>+
>>> menu "drm/i915 Debugging"
>>> depends on DRM_I915
>>> depends on EXPERT
>>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>>index e0fd10c0cfb8..75fe45633779 100644
>>>--- a/drivers/gpu/drm/i915/Makefile
>>>+++ b/drivers/gpu/drm/i915/Makefile
>>>@@ -153,6 +153,9 @@ i915-y += \
>>>          intel_region_lmem.o \
>>>          intel_wopcm.o
>>>
>>>+# SVM code
>>>+i915-$(CONFIG_DRM_I915_SVM) += gem/i915_gem_svm.o
>>>+
>>> # general-purpose microcontroller (GuC) support
>>> obj-y += gt/uc/
>>> i915-y += gt/uc/intel_uc.o \
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>index 5003e616a1ad..af360238a392 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>@@ -2836,10 +2836,14 @@ int
>>> i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>>>                           struct drm_file *file)
>>> {
>>>+       struct drm_i915_gem_exec_object2 *exec2_list, *exec2_list_user;
>>>        struct drm_i915_gem_execbuffer2 *args = data;
>>>-       struct drm_i915_gem_exec_object2 *exec2_list;
>>>-       struct drm_syncobj **fences = NULL;
>>>        const size_t count = args->buffer_count;
>>>+       struct drm_syncobj **fences = NULL;
>>>+       unsigned int i = 0, svm_count = 0;
>>>+       struct i915_address_space *vm;
>>>+       struct i915_gem_context *ctx;
>>>+       struct i915_svm_obj *svm_obj;
>>>        int err;
>>>
>>>        if (!check_buffer_count(count)) {
>>>@@ -2851,15 +2855,46 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>>>        if (err)
>>>                return err;
>>>
>>>+       ctx = i915_gem_context_lookup(file->driver_priv, args->rsvd1);
>>>+       if (!ctx || !rcu_access_pointer(ctx->vm))
>>>+               return -ENOENT;
>>
>>This is just hopelessly wrong.
>>
>>For persistence, the _ce_->vm will have a list of must-be-present
>>vma, with a flag for whether they need prefaulting (!svm everything must
>>be prefaulted obviously). Then during reservation we ensure that all those
>>persistent vma are in place (so we probably use an eviction list to keep
>>track of those we need to instantiate on this execbuf). We don't even
>>want to individually track activity on those vma, preferring to assume
>>they are used by every request and so on change they need serialising
>>[for explicit uAPI unbind, where possible we strive to do it async for
>>endless, or at least sync against iova semaphore] against the last request
>>in the vm (so we need a vm->active). However, we do need an EXT_EXTENSION
>>to mark writes for implicit fencing (e.g.  exported dmabuf) to replace
>>the information lost from execobject[]
>>
>
>I did not understand some points above.
>I am no expert here, and appreciate the feedback.
>My understanding is that [excluding endless batch buffer scenario which
>is not supported in this patch series,] VM_BIND is no different than the
>soft-pinning of objects we have today in the execbuf path. Hence the idea
>here is to add those VM_BIND objects to the execobject[] and let the
>execbuffer path to take care of the rest. Persistence of bindings across
>multiple requests is something not considered. Do we need this flag in
>execobject[] as well in execbuff path (with & without soft-pinning)?
>Other than that, we do have a list of VM_BIND objects in a per 'vm' list
>as you are suggesting above.
>Let me sync with you to better understand this.
>

Ok, we discussed it offline.
I will look into some of the requirement/usecases above to capture change
required to uapi (if any) including around synchronization between
VM_BIND and execbuff paths.

Thanks,
Niranjana

>>>+struct drm_i915_gem_vm_bind {
>>>+       /** VA start to bind **/
>>>+       __u64 start;
>>
>>iova;
>>offset; /* into handle */
>>length; /* from offset */
>>
>
>Here iova is same as 'start' above?
>
>>>+
>>>+       /** Type of memory to [un]bind **/
>>>+       __u32 type;
>>>+#define I915_GEM_VM_BIND_SVM_OBJ      0
>>>+
>>>+       /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type **/
>>>+       __u32 handle;
>>>+
>>>+       /** vm to [un]bind **/
>>>+       __u32 vm_id;
>>>+
>>>+       /** Flags **/
>>>+       __u32 flags;
>>>+#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
>>>+#define I915_GEM_VM_BIND_READONLY    (1 << 1)
>>
>>And don't forget extensions so that we can define the synchronisation
>>controls.
>
>OK.
>
>Niranjana
>>-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
