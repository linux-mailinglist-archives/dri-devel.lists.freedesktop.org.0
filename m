Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B911F176
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 11:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81C6E32D;
	Sat, 14 Dec 2019 10:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9E6E32D;
 Sat, 14 Dec 2019 10:57:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19577184-1500050 for multiple; Sat, 14 Dec 2019 10:56:56 +0000
MIME-Version: 1.0
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
Message-ID: <157632101451.7535.15356831606040204033@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator
 support
Date: Sat, 14 Dec 2019 10:56:54 +0000
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 dave.hansen@intel.com, jglisse@redhat.com, jgg@mellanox.com,
 daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Niranjana Vishwanathapura (2019-12-13 21:56:04)
> Shared Virtual Memory (SVM) runtime allocator support allows
> binding a shared virtual address to a buffer object (BO) in the
> device page table through an ioctl call.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sudeep Dutt <sudeep.dutt@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig                  | 11 ++++
>  drivers/gpu/drm/i915/Makefile                 |  3 +
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 58 ++++++++++++++----
>  drivers/gpu/drm/i915/gem/i915_gem_svm.c       | 60 +++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_svm.h       | 22 +++++++
>  drivers/gpu/drm/i915/i915_drv.c               | 21 +++++++
>  drivers/gpu/drm/i915/i915_drv.h               | 22 +++++++
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  1 +
>  drivers/gpu/drm/i915/i915_gem_gtt.h           | 13 ++++
>  include/uapi/drm/i915_drm.h                   | 27 +++++++++
>  10 files changed, 227 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.c
>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_svm.h
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index ba9595960bbe..c2e48710eec8 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -137,6 +137,16 @@ config DRM_I915_GVT_KVMGT
>           Choose this option if you want to enable KVMGT support for
>           Intel GVT-g.
>  
> +config DRM_I915_SVM
> +       bool "Enable Shared Virtual Memory support in i915"
> +       depends on STAGING
> +       depends on DRM_I915
> +       default n
> +       help
> +         Choose this option if you want Shared Virtual Memory (SVM)
> +         support in i915. With SVM support, one can share the virtual
> +         address space between a process and the GPU.
> +
>  menu "drm/i915 Debugging"
>  depends on DRM_I915
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e0fd10c0cfb8..75fe45633779 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -153,6 +153,9 @@ i915-y += \
>           intel_region_lmem.o \
>           intel_wopcm.o
>  
> +# SVM code
> +i915-$(CONFIG_DRM_I915_SVM) += gem/i915_gem_svm.o
> +
>  # general-purpose microcontroller (GuC) support
>  obj-y += gt/uc/
>  i915-y += gt/uc/intel_uc.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 5003e616a1ad..af360238a392 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2836,10 +2836,14 @@ int
>  i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>                            struct drm_file *file)
>  {
> +       struct drm_i915_gem_exec_object2 *exec2_list, *exec2_list_user;
>         struct drm_i915_gem_execbuffer2 *args = data;
> -       struct drm_i915_gem_exec_object2 *exec2_list;
> -       struct drm_syncobj **fences = NULL;
>         const size_t count = args->buffer_count;
> +       struct drm_syncobj **fences = NULL;
> +       unsigned int i = 0, svm_count = 0;
> +       struct i915_address_space *vm;
> +       struct i915_gem_context *ctx;
> +       struct i915_svm_obj *svm_obj;
>         int err;
>  
>         if (!check_buffer_count(count)) {
> @@ -2851,15 +2855,46 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>         if (err)
>                 return err;
>  
> +       ctx = i915_gem_context_lookup(file->driver_priv, args->rsvd1);
> +       if (!ctx || !rcu_access_pointer(ctx->vm))
> +               return -ENOENT;

This is just hopelessly wrong.

For persistence, the _ce_->vm will have a list of must-be-present
vma, with a flag for whether they need prefaulting (!svm everything must
be prefaulted obviously). Then during reservation we ensure that all those
persistent vma are in place (so we probably use an eviction list to keep
track of those we need to instantiate on this execbuf). We don't even
want to individually track activity on those vma, preferring to assume
they are used by every request and so on change they need serialising
[for explicit uAPI unbind, where possible we strive to do it async for
endless, or at least sync against iova semaphore] against the last request
in the vm (so we need a vm->active). However, we do need an EXT_EXTENSION
to mark writes for implicit fencing (e.g.  exported dmabuf) to replace
the information lost from execobject[]

> +struct drm_i915_gem_vm_bind {
> +       /** VA start to bind **/
> +       __u64 start;

iova;
offset; /* into handle */
length; /* from offset */

> +
> +       /** Type of memory to [un]bind **/
> +       __u32 type;
> +#define I915_GEM_VM_BIND_SVM_OBJ      0
> +
> +       /** Object handle to [un]bind for I915_GEM_VM_BIND_SVM_OBJ type **/
> +       __u32 handle;
> +
> +       /** vm to [un]bind **/
> +       __u32 vm_id;
> +
> +       /** Flags **/
> +       __u32 flags;
> +#define I915_GEM_VM_BIND_UNBIND      (1 << 0)
> +#define I915_GEM_VM_BIND_READONLY    (1 << 1)

And don't forget extensions so that we can define the synchronisation
controls.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
