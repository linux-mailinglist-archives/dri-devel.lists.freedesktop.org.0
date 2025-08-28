Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EFB3A4BD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 17:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3511410EA37;
	Thu, 28 Aug 2025 15:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F0B210EA37;
 Thu, 28 Aug 2025 15:39:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03FCD1A32;
 Thu, 28 Aug 2025 08:39:25 -0700 (PDT)
Received: from [10.1.37.42] (e122027.cambridge.arm.com [10.1.37.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0B293F738;
 Thu, 28 Aug 2025 08:39:29 -0700 (PDT)
Message-ID: <78226027-7daf-4b4b-8c7f-9d9b3141fe7c@arm.com>
Date: Thu, 28 Aug 2025 16:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/panthor: add panthor tests
To: Daniel Almeida <daniel.almeida@collabora.com>, adrinael@adrinael.net,
 arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
 <20250828130402.2549948-5-daniel.almeida@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250828130402.2549948-5-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Daniel,

A couple of errors that I hit when I tested this are below.

On 28/08/2025 14:04, Daniel Almeida wrote:
> Add an initial test suit covering query device properties, allocating
> memory, binding and unbinding VA ranges through VM_BIND and submitting a
> simple piece of work through GROUP_SUBMIT.
> ---
>  lib/igt_panthor.c             | 136 ++++++++++++++++++
>  lib/igt_panthor.h             |  20 +++
>  tests/panthor/meson.build     |   4 +
>  tests/panthor/panthor_gem.c   |  59 ++++++++
>  tests/panthor/panthor_group.c | 264 ++++++++++++++++++++++++++++++++++
>  tests/panthor/panthor_query.c |  25 ++++
>  tests/panthor/panthor_vm.c    |  73 ++++++++++
>  7 files changed, 581 insertions(+)
>  create mode 100644 tests/panthor/panthor_gem.c
>  create mode 100644 tests/panthor/panthor_group.c
>  create mode 100644 tests/panthor/panthor_query.c
>  create mode 100644 tests/panthor/panthor_vm.c
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 3e2c29b17..c422320c5 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -2,6 +2,9 @@
>  // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
>  
>  #include "igt_panthor.h"
> +#include "drmtest.h"
> +#include "ioctl_wrappers.h"
> +#include "panthor_drm.h"
>  
>  /**
>   * SECTION:igt_panthor
> @@ -12,3 +15,136 @@
>   * This library provides various auxiliary helper functions for writing Panthor
>   * tests.
>   */
> +
> +void igt_panthor_query(int fd, int32_t type, void* data, size_t size, int err)
> +{
> +    struct drm_panthor_dev_query query = {
> +        .type = type,
> +        .pointer = (uintptr_t)data,
> +        .size = size,
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_DEV_QUERY, &query);
> +    }
> +}
> +
> +void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
> +{
> +    struct drm_panthor_vm_create vm_create = {};
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
> +        *vm_id = vm_create.id;
> +    }
> +}
> +
> +void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err)
> +{
> +    struct drm_panthor_vm_destroy vm_destroy = {
> +        .id = vm_id,
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy);
> +    }
> +}
> +
> +void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
> +                         uint64_t va, uint64_t size, uint32_t flags, int err)
> +{
> +    struct drm_panthor_vm_bind_op bind_op = {
> +        .flags = flags,
> +        .bo_handle = bo_handle,
> +        .va = va,
> +        .size = size,
> +    };
> +
> +    struct drm_panthor_vm_bind vm_bind = {
> +        .vm_id = vm_id,
> +        .flags = 0,
> +        .ops = DRM_PANTHOR_OBJ_ARRAY(1, &bind_op),
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind);
> +    }
> +}
> +
> +void igt_panthor_bo_create(int fd, struct panthor_bo *bo,
> +                           uint64_t size, uint32_t flags, int err)
> +{
> +    struct drm_panthor_bo_create bo_create = {
> +        .size = size,
> +        .flags = flags,
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create);
> +    }
> +
> +    bo->handle = bo_create.handle;
> +    bo->size = bo_create.size;
> +    bo->offset = 0;
> +    bo->map = NULL;
> +}
> +
> +uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err)
> +{
> +    struct drm_panthor_bo_mmap_offset bo_mmap_offset = {
> +        .handle = handle,
> +    };
> +
> +    if (err) {
> +        do_ioctl_err(fd, DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET, &bo_mmap_offset, err);
> +    } else {
> +        do_ioctl(fd, DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET, &bo_mmap_offset);
> +    }
> +    return bo_mmap_offset.offset;
> +}
> +
> +void *igt_panthor_mmap_bo(int fd, uint32_t handle, uint64_t size, unsigned prot)
> +{
> +    struct drm_panthor_bo_mmap_offset mmap_bo = {
> +        .handle = handle,
> +    };
> +    void *ptr;
> +
> +    do_ioctl(fd, DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET, &mmap_bo);
> +
> +    ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_bo.offset);
> +    if (ptr == MAP_FAILED)
> +        return NULL;
> +    else
> +        return ptr;
> +}
> +
> +void igt_panthor_bo_create_mapped(int fd, struct panthor_bo *bo, uint64_t size,
> +                                  uint32_t flags, int err) {
> +  igt_panthor_bo_create(fd, bo, size, flags, err);
> +  bo->offset = igt_panthor_bo_mmap_offset(fd, bo->handle, err);
> +  bo->map = igt_panthor_mmap_bo(fd, bo->handle, bo->size,
> +                           PROT_READ | PROT_WRITE);
> +}
> +
> +void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
> +{
> +    if (!bo)
> +        return;
> +
> +    if (bo->map) {
> +        munmap(bo->map, bo->size);
> +    }
> +
> +    gem_close(fd, bo->handle);
> +}
> \ No newline at end of file
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index c4bee1838..421f44a33 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -4,5 +4,25 @@
>  #ifndef IGT_PANTHOR_H
>  #define IGT_PANTHOR_H
>  
> +#include <stdint.h>
> +#include <stddef.h>
> +
> +struct panthor_bo {
> +    int handle;
> +    uint64_t offset;
> +    uint64_t size;
> +    void *map;
> +};
> +
> +void igt_panthor_query(int fd, int32_t type, void* data, size_t size, int err);
> +void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
> +void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
> +void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va, uint64_t size, uint32_t flags, int err);
> +void igt_panthor_bo_create(int fd, struct panthor_bo *bo, uint64_t size, uint32_t flags, int err);
> +uint64_t igt_panthor_bo_mmap_offset(int fd, uint32_t handle, int err);
> +void igt_panthor_free_bo(int fd, struct panthor_bo *bo);
> +void igt_panthor_bo_create_mapped(int fd, struct panthor_bo *bo, uint64_t size,
> +                                  uint32_t flags, int err);
> +void *igt_panthor_mmap_bo(int fd, uint32_t handle, uint64_t size, unsigned prot);
>  
>  #endif /* IGT_PANTHOR_H */
> diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
> index 979ae91e0..89edcc844 100644
> --- a/tests/panthor/meson.build
> +++ b/tests/panthor/meson.build
> @@ -1,4 +1,8 @@
>  panthor_progs = [
> +	'panthor_gem',
> +	'panthor_query',
> +	'panthor_vm',
> +	'panthor_group',
>  ]
>  
>  foreach prog : panthor_progs
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> new file mode 100644
> index 000000000..0bdaa3495
> --- /dev/null
> +++ b/tests/panthor/panthor_gem.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +
> +igt_main {
> +  int fd;
> +
> +  igt_fixture { fd = drm_open_driver(DRIVER_PANTHOR); }
> +
> +  igt_subtest("bo_create") {
> +    struct panthor_bo bo;
> +    igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +    igt_assert(bo.handle != 0);
> +
> +    igt_panthor_free_bo(fd, &bo);
> +  }
> +
> +  igt_subtest("bo_mmap_offset") {
> +    struct panthor_bo bo;
> +    uint64_t mmap_offset;
> +
> +    igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +    igt_assert(bo.handle != 0);
> +
> +    mmap_offset = igt_panthor_bo_mmap_offset(fd, bo.handle, 0);
> +    igt_assert(mmap_offset != 0);
> +
> +    igt_panthor_free_bo(fd, &bo);
> +  }
> +
> +  igt_subtest("bo_mmap_offset_invalid_handle") {
> +    struct panthor_bo bo;
> +    uint64_t mmap_offset;
> +
> +    igt_panthor_bo_create(fd, &bo, 4096, 0, 0);
> +    igt_assert(bo.handle != 0);
> +
> +    mmap_offset = igt_panthor_bo_mmap_offset(fd, 0xdeadbeef, ENOENT);
> +    igt_assert(mmap_offset == 0);
> +
> +    igt_panthor_free_bo(fd, &bo);
> +  }
> +
> +  igt_subtest("bo_create_round_size") {
> +    struct panthor_bo bo;
> +    uint64_t expected_size = 8192;
> +
> +    igt_panthor_bo_create(fd, &bo, 5000, 0, 0);
> +    igt_assert(bo.handle != 0);
> +    igt_assert(bo.size == expected_size);
> +
> +    igt_panthor_free_bo(fd, &bo);
> +  }
> +
> +  igt_fixture { drm_close_driver(fd); }
> +}
> diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
> new file mode 100644
> index 000000000..b7e3cf9c3
> --- /dev/null
> +++ b/tests/panthor/panthor_group.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include <stdint.h>
> +#include <sys/mman.h>
> +#include <endian.h> // For htole64
> +#include <unistd.h>
> +
> +#include "drm.h"
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +static void
> +issue_store_multiple(u8 *command_stream, uint64_t kernel_va, uint32_t constant)
> +{
> +    uint64_t opcode, reg_num, mov48, store_multiple, flush;
> +    uint64_t sr, src0, register_bitmap, offset;
> +
> +    // MOV48: Load the source register ([r68; r69]) with the kernel address
> +    opcode = 0x1;
> +    reg_num = 68;
> +    mov48 = (opcode << 56) | (reg_num << 48) | kernel_va;
> +    mov48 = htole64(mov48);
> +    memcpy(&command_stream[0], &mov48, sizeof(mov48));
> +
> +    // MOV48: Load a known constant into r70
> +    opcode = 0x1;
> +    reg_num = 70;
> +    mov48 = (opcode << 56) | (reg_num << 48) | constant;
> +    mov48 = htole64(mov48);
> +    memcpy(&command_stream[8], &mov48, sizeof(mov48));
> +
> +    // STORE_MULTIPLE: Store the first register to the address pointed to by [r68; r69]
> +    opcode = 0x15; // STORE_MULTIPLE
> +    sr = 70; // Starting from register r70
> +    src0 = 68; // Address pointed to by [r68; r69]
> +    register_bitmap = 1; // Store the first register
> +    offset = 0; // Offset
> +    store_multiple = (opcode << 56) | (sr << 48) | (src0 << 40) | (register_bitmap << 16) | offset;
> +    store_multiple = htole64(store_multiple);
> +    memcpy(&command_stream[16], &store_multiple, sizeof(store_multiple));
> +
> +    opcode = 0x1;
> +    reg_num = 68;
> +    mov48 = (opcode << 56) | (reg_num << 48) | 0;
> +    mov48 = htole64(mov48);
> +    memcpy(&command_stream[24], &mov48, sizeof(mov48));
> +
> +    opcode = 36;
> +    flush = opcode << 56 | 0ull << 48 | reg_num << 40 | 0ull << 16 | 0x233;
> +    flush = htole64(flush);
> +    memcpy(&command_stream[32], &flush, sizeof(flush));
> +}
> +
> +igt_main {
> +  int fd;
> +
> +  igt_fixture { fd = drm_open_driver(DRIVER_PANTHOR); }
> +
> +  igt_subtest("group_create") {
> +    struct drm_panthor_gpu_info gpu_info = {};
> +    struct drm_panthor_vm_create vm_create = {};
> +    struct drm_panthor_group_create group_create = {};
> +    struct drm_panthor_queue_create queue = {};
> +    struct drm_panthor_obj_array queues;
> +    struct drm_panthor_group_destroy group_destroy;
> +    struct drm_panthor_vm_destroy vm_destroy;

Both group_destroy and vm_destroy need their padding fields initialised.

> +
> +    igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu_info, sizeof(gpu_info), 0);
> +    igt_assert(gpu_info.gpu_id != 0);
> +
> +    vm_create.flags = 0;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create), 0);
> +    igt_assert(vm_create.id != 0);
> +
> +    queue.priority = 0; // Low priority
> +    queue.ringbuf_size = 4096; // Example size
> +    queues = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue);
> +
> +    group_create.queues = queues;
> +    group_create.max_compute_cores = 1;
> +    group_create.max_fragment_cores = 1;
> +    group_create.max_tiler_cores = 1;
> +    group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
> +    group_create.compute_core_mask = gpu_info.shader_present & 0x1; // Use first core
> +    group_create.fragment_core_mask = gpu_info.shader_present & 0x1; // Use first core
> +    group_create.tiler_core_mask = gpu_info.tiler_present & 0x1; // Use first tiler
> +    group_create.vm_id = vm_create.id;
> +
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &group_create), 0);
> +    igt_assert(group_create.group_handle != 0);
> +
> +    // Cleanup: Destroy the group and VM
> +    group_destroy = (struct drm_panthor_group_destroy){ .group_handle = group_create.group_handle };
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy), 0);
> +
> +    vm_destroy = (struct drm_panthor_vm_destroy) { .id = vm_create.id };
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy), 0);
> +  }
> +
> +  igt_subtest("group_submit") {
> +    struct drm_panthor_gpu_info gpu_info = {};
> +    struct drm_panthor_vm_create vm_create = {};
> +    struct drm_panthor_group_create group_create = {};
> +    struct drm_panthor_queue_create queue = {};
> +    struct drm_panthor_obj_array queues;
> +    struct drm_panthor_group_submit group_submit = {};
> +    struct drm_panthor_queue_submit queue_submit = {};
> +    struct drm_panthor_group_destroy group_destroy;
> +    struct drm_panthor_obj_array queue_submits;
> +    struct drm_panthor_vm_destroy vm_destroy;

Again both group_destroy and vm_destroy need their padding fields
initialised.

> +    struct drm_panthor_bo_create bo_create = {};
> +    struct drm_panthor_vm_bind vm_bind = {};
> +    struct drm_panthor_vm_bind_op vm_bind_op = {};
> +    struct drm_syncobj_wait wait = {};
> +    struct drm_syncobj_create syncobj_create = {};
> +    struct drm_panthor_sync_op sync_op = {};
> +    struct drm_gem_close gem_close = {};
> +    struct drm_syncobj_destroy syncobj_destroy = {};
> +    uint64_t command_stream_gpu_addr;
> +    uint32_t command_stream_size;
> +    uint64_t result_gpu_addr;
> +    uint32_t cmd_buf_bo_handle;
> +    uint32_t result_bo_handle;
> +    uint32_t syncobj_handle;
> +    uint8_t command_stream[64] = {0};
> +    uint8_t *bo_cpu_addr;
> +    uint8_t *result_cpu_addr;
> +    const int INITIAL_VA = 0x1000000;
> +
> +
> +    igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu_info, sizeof(gpu_info), 0);
> +    igt_assert(gpu_info.gpu_id != 0);
> +
> +    vm_create.flags = 0;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create), 0);
> +    igt_assert(vm_create.id != 0);
> +
> +    bo_create.size = 4096;
> +    bo_create.flags = 0;
> +    bo_create.exclusive_vm_id = vm_create.id;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create), 0);
> +    igt_assert(bo_create.handle != 0);
> +    cmd_buf_bo_handle = bo_create.handle;
> +
> +    vm_bind_op.flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP;
> +    vm_bind_op.bo_handle = cmd_buf_bo_handle;
> +    vm_bind_op.bo_offset = 0;
> +    vm_bind_op.va = INITIAL_VA;
> +    vm_bind_op.size = bo_create.size;
> +    vm_bind.ops = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &vm_bind_op);
> +    vm_bind.vm_id = vm_create.id;
> +    vm_bind.flags = 0;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind), 0);
> +
> +    command_stream_gpu_addr = vm_bind_op.va;
> +    command_stream_size = sizeof(command_stream);
> +
> +    bo_cpu_addr = igt_panthor_mmap_bo(fd, bo_create.handle, bo_create.size, PROT_READ | PROT_WRITE);
> +    igt_assert(bo_cpu_addr != MAP_FAILED);
> +
> +    // Create the BO to receive the result of the store.
> +    memset(&bo_create, 0, sizeof(bo_create));
> +    bo_create.size = 4096;
> +    bo_create.flags = 0;
> +    bo_create.exclusive_vm_id = vm_create.id;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_BO_CREATE, &bo_create), 0);
> +    igt_assert(bo_create.handle != 0);
> +    result_bo_handle = bo_create.handle;
> +
> +    // Also bind the result BO.
> +    vm_bind_op.flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP;
> +    vm_bind_op.bo_handle = result_bo_handle;
> +    vm_bind_op.bo_offset = 0;
> +    vm_bind_op.va = INITIAL_VA + 4096;
> +    vm_bind_op.size = bo_create.size;
> +    vm_bind.ops = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &vm_bind_op);
> +    vm_bind.vm_id = vm_create.id;
> +    vm_bind.flags = 0;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_BIND, &vm_bind), 0);
> +    result_gpu_addr = vm_bind_op.va;
> +
> +    issue_store_multiple(command_stream, result_gpu_addr, 0xdeadbeef);
> +    memcpy(bo_cpu_addr, command_stream, command_stream_size);
> +    munmap(bo_cpu_addr, bo_create.size);
> +
> +    queue.priority = 0;
> +    queue.ringbuf_size = 4096;
> +    queues = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue);
> +
> +    group_create.queues = queues;
> +    group_create.max_compute_cores = 1;
> +    group_create.max_fragment_cores = 1;
> +    group_create.max_tiler_cores = 1;
> +    group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
> +    group_create.compute_core_mask = gpu_info.shader_present & 0x1;
> +    group_create.fragment_core_mask = gpu_info.shader_present & 0x1;
> +    group_create.tiler_core_mask = gpu_info.tiler_present & 0x1;
> +    group_create.vm_id = vm_create.id;
> +
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &group_create), 0);
> +    igt_assert(group_create.group_handle != 0);
> +
> +    syncobj_create = (struct drm_syncobj_create){
> +        .flags = 0,
> +    };
> +
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &syncobj_create), 0);
> +    syncobj_handle = syncobj_create.handle;
> +
> +    sync_op = (struct drm_panthor_sync_op) {
> +        .handle = syncobj_handle,
> +        .flags = DRM_PANTHOR_SYNC_OP_SIGNAL,
> +    };
> +
> +    queue_submit.syncs = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &sync_op);
> +
> +    queue_submit.queue_index = 0;
> +    queue_submit.stream_size = command_stream_size;
> +    queue_submit.stream_addr = command_stream_gpu_addr;
> +    queue_submit.latest_flush = 0;
> +    queue_submits = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue_submit);
> +
> +    group_submit.group_handle = group_create.group_handle;
> +    group_submit.queue_submits = queue_submits;
> +
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, &group_submit), 0);
> +
> +    wait = (struct drm_syncobj_wait) {
> +      .handles = (uint64_t)&syncobj_handle,
> +      .count_handles = 1,
> +      .timeout_nsec = INT64_MAX,
> +      .flags = 0,
> +    };
> +
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, &wait), 0);
> +
> +    result_cpu_addr = igt_panthor_mmap_bo(fd, bo_create.handle, bo_create.size, PROT_READ | PROT_WRITE);
> +
> +    igt_assert(*(uint32_t *)result_cpu_addr == 0xdeadbeef);
> +    munmap(result_cpu_addr, bo_create.size);
> +
> +    syncobj_destroy.handle = syncobj_handle;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_DESTROY, &syncobj_destroy), 0);
> +
> +
> +    group_destroy.group_handle = group_create.group_handle;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_DESTROY, &group_destroy), 0);
> +
> +    vm_destroy.id = vm_create.id;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_PANTHOR_VM_DESTROY, &vm_destroy), 0);
> +
> +    gem_close.handle = cmd_buf_bo_handle;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &gem_close), 0);
> +
> +    gem_close.handle = result_bo_handle;
> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &gem_close), 0);
> +
> +}
> +
> +  igt_fixture { drm_close_driver(fd); }
> +}
> diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
> new file mode 100644
> index 000000000..3bbecf3a6
> --- /dev/null
> +++ b/tests/panthor/panthor_query.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +#include <stdint.h>
> +
> +igt_main {
> +  int fd;
> +
> +  igt_fixture { fd = drm_open_driver(DRIVER_PANTHOR); }
> +
> +  igt_subtest("query") {
> +    struct drm_panthor_gpu_info gpu = {};
> +
> +    igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
> +
> +    igt_assert(gpu.gpu_id != 0);
> +    igt_assert(gpu.gpu_rev != 0);

It's perfectly valid for gpu_rev to read as 0.

Thanks,
Steve

> +  }
> +
> +  igt_fixture { drm_close_driver(fd); }
> +}
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> new file mode 100644
> index 000000000..484602de3
> --- /dev/null
> +++ b/tests/panthor/panthor_vm.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +// SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_panthor.h"
> +#include "panthor_drm.h"
> +
> +igt_main {
> +  int fd;
> +
> +  igt_fixture { fd = drm_open_driver(DRIVER_PANTHOR); }
> +
> +  igt_subtest("vm_create_destroy") {
> +    uint32_t vm_id;
> +
> +    igt_panthor_vm_create(fd, &vm_id, 0);
> +    igt_assert(vm_id != 0);
> +
> +    igt_panthor_vm_destroy(fd, vm_id, 0);
> +  }
> +
> +  igt_subtest("vm_destroy_invalid") {
> +    igt_panthor_vm_destroy(fd, 0xdeadbeef, EINVAL);
> +  }
> +
> +  igt_subtest("vm_bind") {
> +    uint32_t vm_id;
> +    struct panthor_bo bo;
> +    uint64_t bo_size = 0x1000;
> +
> +    igt_panthor_vm_create(fd, &vm_id, 0);
> +    igt_assert(vm_id != 0);
> +
> +    igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +    igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +
> +    igt_panthor_vm_destroy(fd, vm_id, 0);
> +  }
> +
> +  igt_subtest("vm_unbind") {
> +    uint32_t vm_id;
> +    struct panthor_bo bo;
> +    uint64_t bo_size = 0x1000;
> +
> +    igt_panthor_vm_create(fd, &vm_id, 0);
> +    igt_assert(vm_id != 0);
> +
> +    igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +    igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +    igt_panthor_vm_bind(fd, vm_id, 0, 0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, 0);
> +
> +    igt_panthor_vm_destroy(fd, vm_id, 0);
> +  }
> +
> +  igt_subtest("vm_unbind_invalid_address") {
> +    uint32_t vm_id;
> +    struct panthor_bo bo;
> +    uint64_t bo_size = 0x1000;
> +
> +    igt_panthor_vm_create(fd, &vm_id, 0);
> +    igt_assert(vm_id != 0);
> +
> +    igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +
> +    /* This was not bound previously*/
> +    igt_panthor_vm_bind(fd, vm_id, bo.handle, 0x1000, 0x1000, DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP, EINVAL);
> +    igt_panthor_vm_destroy(fd, vm_id, 0);
> +  }
> +
> +
> +  igt_fixture { drm_close_driver(fd); }
> +}

