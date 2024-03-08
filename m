Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2D8765A6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 14:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F921135E9;
	Fri,  8 Mar 2024 13:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 187661135E9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 13:52:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60FAD1474
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 05:53:11 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B7863F762
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 05:52:34 -0800 (PST)
Date: Fri, 8 Mar 2024 13:52:18 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/panthor: Add support for performance counters
Message-ID: <ZesYErFVdqLyjblW@e110455-lin.cambridge.arm.com>
References: <20240305165820.585245-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305165820.585245-1-adrian.larumbe@collabora.com>
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

Hi Adrián,

Thanks for the patch and appologies for taking a bit longer to respond,
I was trying to gather some internal Arm feedback before replying.

On Tue, Mar 05, 2024 at 04:58:16PM +0000, Adrián Larumbe wrote:
> This brings in support for Panthor's HW performance counters and querying
> them from UM through a specific ioctl(). The code is inspired by existing
> functionality for the Panfrost driver, with some noteworthy differences:
> 
>  - Sample size is now reported by the firmware rather than having to reckon
>  it by hand
>  - Counter samples are chained in a ring buffer that can be accessed
>  concurrently, but only from threads within a single context (this is
>  because of a HW limitation).
>  - List of enabled counters must be explicitly told from UM
>  - Rather than allocating the BO that will contain the perfcounter values
>  in the render context's address space, the samples ring buffer is mapped
>  onto the MCU's VM.
>  - If more than one thread within the same context tries to dump a sample,
>  then the kernel will copy the same frame to every single thread that was
>  able to join the dump queue right before the FW finished processing the
>  sample request.
>  - UM must provide a BO handle for retrieval of perfcnt values rather
>  than passing a user virtual address.
> 
> The reason multicontext access to the driver's perfcnt ioctl interface
> isn't tolerated is because toggling a different set of counters than the
> current one implies a counter reset, which also messes up with the ring
> buffer's extraction and insertion pointers. This is an unfortunate
> hardware limitation.

There are a few issues that we would like to improve with this patch.

I'm not sure what user space app has been used for testing this (I'm guessing
gputop from igt?) but whatever is used it needs to understand the counters
being exposed. In your patch there is no information given to the user space
about the layout of the counters and / or their order. Where is this being
planned to be defined? Long term, I think it would be good to have details
about the counters available.

The other issue we can see is with the perfcnt_process_sample() and its
handling of threshold event and overflows. If the userspace doesn't sample
quick enough and we cross the threshold we are going to lose samples and
there is no mechanism to communicate to user space that the values they
are getting have gaps. I believe the default mode for the firmware is to
give you counter values relative to the last read value, so if you drop
samples you're not going to make any sense of the data.

The third topic that is worth discussing is the runtime PM. Currently your
patch will increment the runtime PM usage count when the performance
counter dump is enabled, which means you will not be able to instrument
your power saving modes. It might not be a concern for the current users
of the driver, but it is worth discussing how to enable that workflow
for future.

Otherwise, from a quick look over the code it looks good to me.

Best regards,
Liviu

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Makefile          |   3 +-
>  drivers/gpu/drm/panthor/panthor_device.c  |   6 +
>  drivers/gpu/drm/panthor/panthor_device.h  |   6 +
>  drivers/gpu/drm/panthor/panthor_drv.c     |  61 +++
>  drivers/gpu/drm/panthor/panthor_fw.c      |  27 ++
>  drivers/gpu/drm/panthor/panthor_fw.h      |  12 +
>  drivers/gpu/drm/panthor/panthor_perfcnt.c | 551 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perfcnt.h |  31 ++
>  drivers/gpu/drm/panthor/panthor_sched.c   |   1 +
>  include/uapi/drm/panthor_drm.h            |  72 +++
>  10 files changed, 769 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perfcnt.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perfcnt.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..7f841fd053d4 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -9,6 +9,7 @@ panthor-y := \
>  	panthor_gpu.o \
>  	panthor_heap.o \
>  	panthor_mmu.o \
> -	panthor_sched.o
> +	panthor_sched.o \
> +	panthor_perfcnt.o
>  
>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index bfe8da4a6e4c..5dfd82891063 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -20,6 +20,7 @@
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>  
>  static int panthor_clk_init(struct panthor_device *ptdev)
>  {
> @@ -78,6 +79,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perfcnt_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -233,6 +235,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_fw;
>  
> +	ret = panthor_perfcnt_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 51c9d61b6796..adf0bd29deb0 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -100,6 +100,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>  
> +	/** @perfcnt_info: Performance counters interface information. */
> +	struct drm_panthor_perfcnt_info perfcnt_info;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>  
> @@ -127,6 +130,9 @@ struct panthor_device {
>  		struct completion done;
>  	} unplug;
>  
> +	/** @perfcnt: Device performance counters data. */
> +	struct panthor_perfcnt *perfcnt;
> +
>  	/** @reset: Reset related fields. */
>  	struct {
>  		/** @wq: Ordered worqueud used to schedule reset operations. */
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ff484506229f..6cb9ea0aa553 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -27,6 +27,7 @@
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>  
>  /**
>   * DOC: user <-> kernel object copy helpers.
> @@ -164,6 +165,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  	_Generic(_obj_name, \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perfcnt_info, fw_size),	\
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> @@ -765,6 +767,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(ptdev->csif_info);
>  			return 0;
>  
> +		case DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO:
> +			args->size = sizeof(ptdev->perfcnt_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -777,6 +783,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
>  
> +	case DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perfcnt_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1245,6 +1254,55 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>  
> +static bool perf_masks_zero(struct drm_panthor_perfcnt_config *req)
> +{
> +
> +	u32 counters_mask = req->csg_select | req->fw_enable |
> +		req->csg_enable | req->csf_enable | req->shader_enable |
> +		req->tiler_enable | req->mmu_l2_enable;
> +
> +	return (!counters_mask) ? true : false;
> +}
> +
> +static int panthor_ioctl_perfcnt_config(struct drm_device *dev, void *data,
> +				  struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct drm_panthor_perfcnt_config *req = data;
> +
> +	/*
> +	 * GLB_PRFCNT_CONFIG.SET_SELECT: This flag allows selection of different
> +	 * sets of counter events. For those counter blocks that support it, this
> +	 * effectively selects between up to four sets of the event count inputs to
> +	 * the same counter block. All counter blocks support counter set 0.
> +	 */
> +	if (req->counterset > 3)
> +		return -EINVAL;
> +
> +	return panthor_perfcnt_config(ptdev, req, pfile, perf_masks_zero(req));
> +}
> +
> +static int panthor_ioctl_perfcnt_dump(struct drm_device *dev, void *data,
> +				      struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct drm_panthor_perfcnt_dump *req = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, req->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	ret = panthor_perfcnt_dump(ptdev, obj, file_priv->driver_priv);
> +
> +	drm_gem_object_put(obj);
> +
> +	return ret;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1290,6 +1348,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  {
>  	struct panthor_file *pfile = file->driver_priv;
>  
> +	panthor_perfcnt_close(file);
>  	panthor_group_pool_destroy(pfile);
>  	panthor_vm_pool_destroy(pfile);
>  
> @@ -1314,6 +1373,8 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERFCNT_CONFIG, perfcnt_config, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(PERFCNT_DUMP, perfcnt_dump, DRM_RENDER_ALLOW),
>  };
>  
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 33c87a59834e..7b31bb6c21b9 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -23,6 +23,7 @@
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>  
>  #define CSF_FW_NAME "mali_csffw.bin"
>  
> @@ -947,6 +948,7 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  					 GLB_PING |
>  					 GLB_CFG_PROGRESS_TIMER |
>  					 GLB_CFG_POWEROFF_TIMER |
> +					 GLB_PERFCNT_SAMPLE |
>  					 GLB_IDLE_EN |
>  					 GLB_IDLE;
>  
> @@ -975,6 +977,10 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  		return;
>  
>  	panthor_sched_report_fw_events(ptdev, status);
> +
> +	/* Let the perfcnt layer figure out if there are PERFCNT events to process. */
> +	if (status & JOB_INT_GLOBAL_IF)
> +		panthor_perfcnt_report_fw_events(ptdev, status);
>  }
>  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>  
> @@ -1213,6 +1219,26 @@ int panthor_fw_glb_wait_acks(struct panthor_device *ptdev,
>  				    req_mask, acked, timeout_ms);
>  }
>  
> +/**
> + * panthor_fw_glb_state_change() - Notify change of state in a global request register flags
> + * @ptdev: Device.
> + * @req_mask: Mask of requests to check change of state for.
> + * @flipped: Pointer to field that's updated with the flipped requests.
> + * If the function returns false, *flipped == 0.
> + *
> + * Return: true on change, false otherwise.
> + */
> +bool panthor_fw_glb_state_change(struct panthor_device *ptdev,
> +				 u32 req_mask, u32 *flipped)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 req = READ_ONCE(glb_iface->input->req) & req_mask;
> +	u32 ack = READ_ONCE(glb_iface->output->ack) & req_mask;
> +
> +	*flipped = (req ^ ack);
> +	return (*flipped != 0);
> +}
> +
>  /**
>   * panthor_fw_csg_wait_acks() - Wait for command stream group requests to be acknowledged.
>   * @ptdev: Device.
> @@ -1352,6 +1378,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  		goto err_unplug_fw;
>  
>  	panthor_fw_init_global_iface(ptdev);
> +
>  	return 0;
>  
>  err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 22448abde992..682a02118077 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -11,6 +11,7 @@ struct panthor_kernel_bo;
>  
>  #define MAX_CSGS				31
>  #define MAX_CS_PER_CSG                          32
> +#define MAX_PERFCNT_BUF_SLOTS                   128
>  
>  struct panthor_fw_ringbuf_input_iface {
>  	u64 insert;
> @@ -197,6 +198,8 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x)                 ((((x) >> 16) << 8))
> +#define GLB_PERFCNT_HW_SIZE(x)                 (((x) & GENMASK(15, 0)) << 8)
>  	u32 perfcnt_size;
>  	u32 instr_features;
>  };
> @@ -240,6 +243,8 @@ struct panthor_fw_global_input_iface {
>  	u64 perfcnt_base;
>  	u32 perfcnt_extract;
>  	u32 reserved3[3];
> +#define GLB_PERFCNT_CFG_SIZE(x)			((x) & GENMASK(7, 0))
> +#define GLB_PERFCNT_CFG_SET(x)			((GENMASK(1, 0) & (x)) << 8)
>  	u32 perfcnt_config;
>  	u32 perfcnt_csg_select;
>  	u32 perfcnt_fw_enable;
> @@ -264,6 +269,11 @@ struct panthor_fw_global_output_iface {
>  	u32 doorbell_ack;
>  	u32 reserved2;
>  	u32 halt_status;
> +
> +#define GLB_PERFCNT_STATUS_FAILED            BIT(0)
> +#define GLB_PERFCNT_STATUS_POWERON           BIT(1)
> +#define GLB_PERFCNT_STATUS_POWEROFF          BIT(2)
> +#define GLB_PERFCNT_STATUS_PROTSESSION       BIT(3)
>  	u32 perfcnt_status;
>  	u32 perfcnt_insert;
>  };
> @@ -472,6 +482,8 @@ int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_m
>  int panthor_fw_glb_wait_acks(struct panthor_device *ptdev, u32 req_mask, u32 *acked,
>  			     u32 timeout_ms);
>  
> +bool panthor_fw_glb_state_change(struct panthor_device *ptdev, u32 req_mask, u32 *flipped);
> +
>  void panthor_fw_ring_csg_doorbells(struct panthor_device *ptdev, u32 csg_slot);
>  
>  struct panthor_kernel_bo *
> diff --git a/drivers/gpu/drm/panthor/panthor_perfcnt.c b/drivers/gpu/drm/panthor/panthor_perfcnt.c
> new file mode 100644
> index 000000000000..e223e44e3f35
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perfcnt.c
> @@ -0,0 +1,551 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2023 Collabora Ltd */
> +
> +#include "linux/mutex.h"
> +#include <linux/completion.h>
> +#include <linux/iopoll.h>
> +#include <linux/iosys-map.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/panthor_drm.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_gem.h"
> +#include "panthor_mmu.h"
> +#include "panthor_perfcnt.h"
> +#include "panthor_regs.h"
> +#include "panthor_gpu.h"
> +#include "panthor_fw.h"
> +
> +#define SAMPLE_TIMEOUT_MS		1000
> +#define SAMPLE_HDR_SIZE                 12
> +#define SAMPLE_BLOCK_SIZE		0x100
> +
> +#define PERFCNT_OP_AFFECTED \
> +	(GLB_PERFCNT_STATUS_POWEROFF | \
> +	 GLB_PERFCNT_STATUS_POWERON | \
> +	 GLB_PERFCNT_STATUS_PROTSESSION)
> +
> +enum perfcnt_status {
> +	PERFCNT_STATUS_STARTED,
> +	PERFCNT_STATUS_SUCCEEDED,
> +	PERFCNT_STATUS_FAILED,
> +	PERFCNT_STATUS_OVERFLOW,
> +};
> +
> +struct panthor_perfcnt {
> +	struct panthor_device *ptdev;
> +	struct panthor_file *user;
> +	struct mutex lock;
> +
> +	struct panthor_kernel_bo *bo;
> +	size_t sample_size;
> +	u32 ringslots;
> +
> +	struct workqueue_struct *dumper_wkq;
> +	struct work_struct work;
> +	atomic_t dump_requested;
> +
> +	struct list_head dumper_list;
> +	wait_queue_head_t wq;
> +};
> +
> +struct panthor_perfcnt_dumper {
> +	struct list_head list;
> +	struct completion comp;
> +	void *user_bo;
> +	int last_status;
> +};
> +
> +struct perfcnt_counters {
> +	u32 counterset;
> +	u32 csg_select;
> +	u32 fw_enable;
> +	u32 csg_enable;
> +	u32 csf_enable;
> +	u32 shader_enable;
> +	u32 tiler_enable;
> +	u32 mmu_l2_enable;
> +};
> +
> +static int panthor_perfcnt_enable_counters(struct panthor_device *ptdev,
> +					   struct perfcnt_counters *counters)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +
> +	if (glb_iface->input->req & GLB_PERFCNT_EN) {
> +		drm_info(&ptdev->base, "Performance counters aren't disabled!\n");
> +		return -EBUSY;
> +	}
> +
> +	glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SET(counters->counterset);
> +	glb_iface->input->perfcnt_csg_select = counters->csg_select;
> +	glb_iface->input->perfcnt_mmu_l2_enable = counters->mmu_l2_enable;
> +	glb_iface->input->perfcnt_tiler_enable = counters->tiler_enable;
> +	glb_iface->input->perfcnt_shader_enable = counters->shader_enable;
> +	glb_iface->input->perfcnt_csf_enable = counters->csf_enable;
> +	glb_iface->input->perfcnt_csg_enable = counters->csg_enable;
> +	glb_iface->input->perfcnt_fw_enable = counters->fw_enable;
> +
> +	/* Enable/Disabled status is value-based, rather than change-of-value */
> +	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_EN, GLB_PERFCNT_EN);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	return panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_EN, &acked, 100);
> +}
> +
> +static int
> +panthor_perfcnt_disable_counters(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked;
> +	int ret;
> +
> +	if (!(glb_iface->input->req & GLB_PERFCNT_EN)) {
> +		drm_info(&ptdev->base, "Performance counters were already disabled\n");
> +		return 0;
> +	}
> +
> +	/* Enable/Disabled status is value-based, rather than change-of-value */
> +	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_EN);
> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_EN, &acked, 100);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Could not disable performance counters\n");
> +		return ret;
> +	}
> +
> +	glb_iface->input->perfcnt_csg_select = 0;
> +	glb_iface->input->perfcnt_mmu_l2_enable = 0;
> +	glb_iface->input->perfcnt_tiler_enable = 0;
> +	glb_iface->input->perfcnt_shader_enable = 0;
> +	glb_iface->input->perfcnt_csf_enable = 0;
> +	glb_iface->input->perfcnt_csg_enable = 0;
> +	glb_iface->input->perfcnt_fw_enable = 0;
> +
> +	return 0;
> +}
> +
> +static void perfcnt_copy_sample(struct panthor_device *ptdev,
> +				struct panthor_perfcnt *perfcnt,
> +				void *bo_va, unsigned int idx)
> +{
> +	/*
> +	 * Ring buffer index calculation can be done in this way because it
> +	 * is always guaranteed to be a power of 2
> +	 */
> +	memcpy(bo_va, perfcnt->bo->kmap +
> +	       ((idx & (perfcnt->ringslots - 1)) * perfcnt->sample_size),
> +	       perfcnt->sample_size);
> +}
> +
> +static void clear_slot_headers(struct panthor_device *ptdev, u32 ext_idx, u32 ins_idx)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	unsigned int offset;
> +	unsigned int i;
> +
> +	if (WARN_ON(ext_idx >= ins_idx))  {
> +		drm_warn(&ptdev->base, "Extraction index is greater or equal than insertion index %u-%u\n",
> +			 ext_idx, ins_idx);
> +		return;
> +	}
> +
> +	drm_dbg(&ptdev->base, "Cleaning perfcnt ring buffer slots %u-%u\n", ext_idx, ins_idx);
> +
> +	for (i = ext_idx; i < ins_idx; i++) {
> +		void *slot = perfcnt->bo->kmap +
> +			((i & (ptdev->perfcnt->ringslots - 1)) * perfcnt->sample_size);
> +
> +		for (offset = 0; offset < perfcnt->sample_size; offset += SAMPLE_BLOCK_SIZE)
> +			memset(slot + offset, 0, SAMPLE_HDR_SIZE);
> +	}
> +}
> +
> +static void clean_dumper_list(struct panthor_device *ptdev, unsigned int status)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt_dumper *dumper, *dumper_tmp;
> +
> +	mutex_lock(&perfcnt->lock);
> +	list_for_each_entry_safe(dumper, dumper_tmp, &perfcnt->dumper_list, list) {
> +		if (status == PERFCNT_STATUS_SUCCEEDED)
> +			perfcnt_copy_sample(ptdev, perfcnt, dumper->user_bo,
> +					    glb_iface->output->perfcnt_insert - 1);
> +		list_del(&dumper->list);
> +		INIT_LIST_HEAD(&dumper->list);
> +		dumper->last_status = status;
> +		complete(&dumper->comp);
> +	}
> +	mutex_unlock(&perfcnt->lock);
> +}
> +
> +static void perfcnt_process_sample(struct work_struct *work)
> +{
> +	struct panthor_perfcnt *perfcnt =
> +		container_of(work, struct panthor_perfcnt, work);
> +	struct panthor_device *ptdev = perfcnt->ptdev;
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	u32 acked, flipped;
> +	int ret;
> +
> +	if (panthor_fw_glb_state_change(ptdev, GLB_PERFCNT_THRESHOLD, &flipped)) {
> +		drm_dbg(&ptdev->base, "Performance counter buffer has reached 50%% capacity\n");
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, flipped);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +		ret = panthor_fw_glb_wait_acks(ptdev, flipped, &acked, 100);
> +		if (ret)
> +			drm_warn(&ptdev->base, "Resetting Threshold flags failed\n");
> +	}
> +
> +	if (glb_iface->output->perfcnt_status & GLB_PERFCNT_STATUS_FAILED) {
> +		drm_err(&ptdev->base, "Perfcounter sampling failed\n");
> +		clean_dumper_list(ptdev, PERFCNT_STATUS_FAILED);
> +		goto worker_exit;
> +	}
> +
> +	if (panthor_fw_glb_state_change(ptdev, GLB_PERFCNT_OVERFLOW, &flipped)) {
> +		drm_info(&ptdev->base, "The performance counter buffer has overflowed. Some samples may have been lost\n");
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, flipped);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +		ret = panthor_fw_glb_wait_acks(ptdev, flipped, &acked, 100);
> +		if (ret)
> +			drm_err(&ptdev->base, "Resetting Overflow flags failed\n");
> +		clean_dumper_list(ptdev, PERFCNT_STATUS_OVERFLOW);
> +		goto clear_inc_idx;
> +	}
> +
> +	if (glb_iface->output->perfcnt_status & PERFCNT_OP_AFFECTED)
> +		drm_warn(&ptdev->base, "Perfcnt sample operation might have been impacted by a power transition or protected session exec\n");
> +
> +	clean_dumper_list(ptdev, PERFCNT_STATUS_SUCCEEDED);
> +
> +clear_inc_idx:
> +	clear_slot_headers(ptdev, glb_iface->input->perfcnt_extract,
> +			   glb_iface->output->perfcnt_insert);
> +	/*
> +	 * TRM recommends increasing the extract pointer by one after every sample
> +	 * operation, but because sample requests are processed sequentially and we
> +	 * discard samples triggered by the HW automatically, it's best if we simply
> +	 * set it to the next insert slot index.
> +	 */
> +	WRITE_ONCE(glb_iface->input->perfcnt_extract,
> +		   READ_ONCE(glb_iface->output->perfcnt_insert));
> +worker_exit:
> +	wake_up_all(&perfcnt->wq);
> +}
> +
> +int panthor_perfcnt_dump(struct panthor_device *ptdev,
> +			 struct drm_gem_object *obj,
> +			 struct panthor_file *pfile)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_perfcnt_dumper dumper;
> +	struct iosys_map map;
> +
> +	int ret;
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (perfcnt->user != pfile) {
> +		ret = -EINVAL;
> +		goto err_dump;
> +	}
> +
> +	ret = drm_gem_vmap_unlocked(obj, &map);
> +	if (ret) {
> +		drm_err(&ptdev->base, "Could not map the target BO\n");
> +		goto err_dump;
> +	}
> +
> +	dumper.user_bo = map.vaddr;
> +	dumper.last_status = PERFCNT_STATUS_STARTED;
> +	init_completion(&dumper.comp);
> +	list_add_tail(&dumper.list, &perfcnt->dumper_list);
> +
> +	/* Start the sampling if list were empty */
> +	if (list_is_first(&dumper.list, &perfcnt->dumper_list)) {
> +		panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
> +		atomic_set(&ptdev->perfcnt->dump_requested, 1);
> +		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> +	}
> +	mutex_unlock(&perfcnt->lock);
> +
> +	ret = wait_for_completion_interruptible_timeout(&dumper.comp,
> +							msecs_to_jiffies(SAMPLE_TIMEOUT_MS));
> +	if (!ret)
> +		/* Let's give the worker thread a chance to finish */
> +		ret = flush_work(&perfcnt->work);
> +
> +	if (!ret && !try_wait_for_completion(&dumper.comp)) {
> +		mutex_lock(&perfcnt->lock);
> +		if (!list_empty(&dumper.list)) {
> +			list_del(&dumper.list);
> +			if (list_empty(&perfcnt->dumper_list)) {
> +				atomic_set(&ptdev->perfcnt->dump_requested, 0);
> +				wake_up_all(&perfcnt->wq);
> +			}
> +		}
> +		mutex_unlock(&perfcnt->lock);
> +
> +		ret = -ETIMEDOUT;
> +	} else {
> +		WARN_ON(dumper.last_status == PERFCNT_STATUS_STARTED);
> +		ret = (dumper.last_status >= PERFCNT_STATUS_FAILED) ? -EIO : 0;
> +	}
> +
> +	drm_gem_vunmap_unlocked(obj, &map);
> +
> +	return ret;
> +
> +err_dump:
> +	mutex_unlock(&perfcnt->lock);
> +	return ret;
> +}
> +
> +
> +static int panthor_perfcnt_enable_locked(struct panthor_device *ptdev,
> +				  struct panthor_file *pfile,
> +				  struct drm_panthor_perfcnt_config *req)
> +
> +{
> +	unsigned int perfcnt_ringbuf_slots = req->ringslots;
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	struct panthor_kernel_bo *bo;
> +	int ret;
> +
> +	if (pfile == perfcnt->user)
> +		return 0;
> +	else if (perfcnt->user)
> +		return -EBUSY;
> +
> +	if (perfcnt_ringbuf_slots != perfcnt->ringslots) {
> +		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +
> +		if (perfcnt->bo) {
> +			panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), perfcnt->bo);
> +			perfcnt->bo = NULL;
> +		}
> +
> +		if (perfcnt_ringbuf_slots > MAX_PERFCNT_BUF_SLOTS)
> +			perfcnt_ringbuf_slots = MAX_PERFCNT_BUF_SLOTS;
> +		if (!is_power_of_2(perfcnt_ringbuf_slots))
> +			perfcnt_ringbuf_slots = rounddown_pow_of_two(perfcnt_ringbuf_slots);
> +
> +		/*
> +		 * Create the perfcnt dump BO. We need to use the FW's VM because GLB_PRFCNT_JASID's
> +		 * maximum implementation defined value is 7. The way AS are assigned to a VM
> +		 * in panthor_vm_active means we cannot guarantee an AS between 1 and 7 would be
> +		 * available. An alternative would be implementing some sort of AS eviction
> +		 * mechanism, or perhaps setting one AS bit aside for perfcnt. However, given that
> +		 * the counters are global, it's simpler to bind the perfcount ringbuf to the FW AS.
> +		 */
> +		bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> +					      perfcnt->sample_size * perfcnt_ringbuf_slots,
> +					      DRM_PANTHOR_BO_NO_MMAP,
> +					      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
> +					      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
> +					      PANTHOR_VM_KERNEL_AUTO_VA);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		ret = panthor_kernel_bo_vmap(bo);
> +		if (ret)
> +			goto err_put_bo;
> +
> +		perfcnt->bo = bo;
> +		perfcnt->ringslots = perfcnt_ringbuf_slots;
> +		glb_iface->input->perfcnt_base = perfcnt->bo->va_node.start;
> +		glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SIZE(perfcnt->ringslots);
> +	}
> +
> +	ret = pm_runtime_get_sync(ptdev->base.dev);
> +	if (ret < 0)
> +		goto enable_err;
> +
> +	ret = panthor_perfcnt_disable_counters(ptdev);
> +	if (ret)
> +		goto enable_err;
> +
> +	ret = panthor_perfcnt_enable_counters(ptdev,
> +					      (struct perfcnt_counters *) &req->counterset);
> +	if (ret)
> +		goto enable_err;
> +
> +	perfcnt->user =	pfile;
> +
> +	return 0;
> +
> +enable_err:
> +	pm_runtime_put(ptdev->base.dev);
> +	panthor_kernel_bo_vunmap(bo);
> +err_put_bo:
> +	panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), bo);
> +	perfcnt->bo = NULL;
> +	return ret;
> +}
> +
> +static int panthor_perfcnt_disable_locked(struct panthor_device *ptdev,
> +					  struct panthor_file *pfile)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	int ret;
> +
> +	if (perfcnt->user != pfile)
> +		return -EINVAL;
> +
> +	if (!list_empty(&perfcnt->dumper_list)) {
> +		drm_warn(&ptdev->base, "A perfcnt dump is still running, let it finnish\n");
> +		mutex_unlock(&perfcnt->lock);
> +		ret  = wait_event_timeout(perfcnt->wq,
> +				   list_empty(&perfcnt->dumper_list),
> +				   msecs_to_jiffies(SAMPLE_TIMEOUT_MS));
> +		mutex_lock(&perfcnt->lock);
> +		if (!ret)
> +			drm_warn(&ptdev->base, "Dump didn't finish, results will be undefined\n");
> +	}
> +
> +	panthor_perfcnt_disable_counters(ptdev);
> +	glb_iface->input->perfcnt_extract = 0;
> +	perfcnt->user = NULL;
> +
> +	pm_runtime_mark_last_busy(ptdev->base.dev);
> +	pm_runtime_put_autosuspend(ptdev->base.dev);
> +
> +	return 0;
> +}
> +
> +int panthor_perfcnt_config(struct panthor_device *ptdev,
> +			   struct drm_panthor_perfcnt_config *req,
> +			   struct panthor_file *pfile,
> +			   bool disable)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	int ret;
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (disable)
> +		ret = panthor_perfcnt_disable_locked(ptdev, pfile);
> +	else
> +		ret = panthor_perfcnt_enable_locked(ptdev, pfile, req);
> +	mutex_unlock(&perfcnt->lock);
> +
> +	return ret;
> +}
> +
> +void panthor_perfcnt_close(struct drm_file *file_priv)
> +{
> +	struct panthor_file *pfile = file_priv->driver_priv;
> +	struct panthor_device *ptdev = pfile->ptdev;
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +
> +	pm_runtime_get_sync(ptdev->base.dev);
> +
> +	mutex_lock(&perfcnt->lock);
> +	if (perfcnt->user == pfile)
> +		panthor_perfcnt_disable_locked(ptdev, file_priv->driver_priv);
> +	mutex_unlock(&perfcnt->lock);
> +
> +	pm_runtime_mark_last_busy(ptdev->base.dev);
> +	pm_runtime_put_autosuspend(ptdev->base.dev);
> +}
> +
> +void panthor_perfcnt_report_fw_events(struct panthor_device *ptdev, u32 status)
> +{
> +
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +	u32 req, ack;
> +
> +	if (!perfcnt)
> +		return;
> +
> +	req = READ_ONCE(glb_iface->input->req);
> +	ack = READ_ONCE(glb_iface->output->ack);
> +
> +	if ((~(req ^ ack) & GLB_PERFCNT_SAMPLE) &&
> +	    !panthor_device_reset_is_pending(ptdev)) {
> +		if (atomic_cmpxchg(&ptdev->perfcnt->dump_requested, 1, 0))
> +			queue_work(perfcnt->dumper_wkq, &perfcnt->work);
> +	}
> +}
> +
> +int panthor_perfcnt_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct panthor_perfcnt *perfcnt;
> +	int ret;
> +
> +	perfcnt = devm_kzalloc(ptdev->base.dev, sizeof(*perfcnt), GFP_KERNEL);
> +	if (!perfcnt)
> +		return -ENOMEM;
> +
> +	ptdev->perfcnt_info.fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
> +	ptdev->perfcnt_info.hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
> +
> +	perfcnt->sample_size = ptdev->perfcnt_info.fw_size + ptdev->perfcnt_info.hw_size;
> +	perfcnt->ringslots = 0;
> +	perfcnt->bo = NULL;
> +
> +	perfcnt->dumper_wkq = alloc_workqueue("perfcnt-dumper", WQ_UNBOUND, 0);
> +	if (!perfcnt->dumper_wkq) {
> +		drm_err(&ptdev->base, "Failed to allocate perfcnt workqueue");
> +		return -ENOMEM;
> +	}
> +	INIT_WORK(&perfcnt->work, perfcnt_process_sample);
> +
> +	/* Perfcnt configuration */
> +	glb_iface->input->perfcnt_config |= GLB_PERFCNT_CFG_SIZE(perfcnt->ringslots);
> +	glb_iface->input->perfcnt_as = panthor_vm_as(panthor_fw_vm(ptdev));
> +	glb_iface->input->perfcnt_extract = 0;
> +
> +	/* Start with everything disabled. */
> +	ret = panthor_perfcnt_disable_counters(ptdev);
> +	if (ret)
> +		goto err_dealloc_workqueue;
> +
> +	INIT_LIST_HEAD(&perfcnt->dumper_list);
> +	init_waitqueue_head(&perfcnt->wq);
> +	mutex_init(&perfcnt->lock);
> +
> +	perfcnt->ptdev = ptdev;
> +	ptdev->perfcnt = perfcnt;
> +
> +	drm_info(&ptdev->base,
> +		 "Perfcnt params: Sample size: %#zx Slots: %u\n",
> +		 perfcnt->sample_size, perfcnt->ringslots);
> +
> +	return 0;
> +
> +err_dealloc_workqueue:
> +	destroy_workqueue(perfcnt->dumper_wkq);
> +
> +	return ret;
> +}
> +
> +void panthor_perfcnt_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perfcnt *perfcnt = ptdev->perfcnt;
> +
> +	WARN_ON(perfcnt->user);
> +
> +	panthor_perfcnt_disable_counters(ptdev);
> +
> +	cancel_work_sync(&perfcnt->work);
> +	destroy_workqueue(perfcnt->dumper_wkq);
> +
> +	mutex_destroy(&perfcnt->lock);
> +
> +	if (perfcnt->bo) {
> +		panthor_kernel_bo_vunmap(perfcnt->bo);
> +		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), perfcnt->bo);
> +	}
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perfcnt.h b/drivers/gpu/drm/panthor/panthor_perfcnt.h
> new file mode 100644
> index 000000000000..6edcbe256f4a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perfcnt.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2023 Collabora Ltd */
> +#ifndef __PANTHOR_PERFCNT_H__
> +#define __PANTHOR_PERFCNT_H__
> +
> +#include <linux/types.h>
> +
> +struct panthor_device;
> +struct panthor_file;
> +struct drm_device;
> +struct drm_file;
> +struct drm_gem_object;
> +struct drm_panthor_perfcnt_config;
> +
> +int panthor_perfcnt_init(struct panthor_device *ptdev);
> +void panthor_perfcnt_unplug(struct panthor_device *ptdev);
> +void panthor_perfcnt_close(struct drm_file *file_priv);
> +
> +int panthor_perfcnt_config(struct panthor_device *ptdev,
> +			   struct drm_panthor_perfcnt_config *req,
> +			   struct panthor_file *pfile,
> +			   bool disable);
> +int panthor_perfcnt_dump(struct panthor_device *ptdev,
> +			 struct drm_gem_object *obj,
> +			 struct panthor_file *pfile);
> +
> +void panthor_perfcnt_report_fw_events(struct panthor_device *ptdev,
> +				      u32 status);
> +
> +
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..cbd0ab77a3cd 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -31,6 +31,7 @@
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> +#include "panthor_perfcnt.h"
>  
>  /**
>   * DOC: Scheduler
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 373df80f41ed..0ca940529be4 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,12 @@ enum drm_panthor_ioctl_id {
>  
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/** @DRM_PANTHOR_PERFCNT_CONFIG: Enable or disable performance counters. */
> +	DRM_PANTHOR_PERFCNT_CONFIG,
> +
> +	/** @DRM_PANTHOR_PERFCNT_DUMP: Sample and retrieve performance counters. */
> +	DRM_PANTHOR_PERFCNT_DUMP,
>  };
>  
>  /**
> @@ -170,6 +176,10 @@ enum drm_panthor_ioctl_id {
>  	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
>  #define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
>  	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
> +#define DRM_IOCTL_PANTHOR_PERFCNT_CONFIG \
> +	DRM_IOCTL_PANTHOR(WR, PERFCNT_CONFIG, perfcnt_config)
> +#define DRM_IOCTL_PANTHOR_PERFCNT_DUMP \
> +	DRM_IOCTL_PANTHOR(WR, PERFCNT_DUMP, perfcnt_dump)
>  
>  /**
>   * DOC: IOCTL arguments
> @@ -260,6 +270,9 @@ enum drm_panthor_dev_query_type {
>  
>  	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
>  	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
> +
> +	/** @DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO: Query perf counters interface information. */
> +	DRM_PANTHOR_DEV_QUERY_PERFCNT_INFO,
>  };
>  
>  /**
> @@ -377,6 +390,19 @@ struct drm_panthor_csif_info {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_panthor_perfcnt_info - Performance counters interface information
> + *
> + * Structure grouping all queryable information relating to the perfcnt interface.
> + */
> +struct drm_panthor_perfcnt_info {
> +	/** @hw_size: Size of HW related performance counters. */
> +	__u32 hw_size;
> +
> +	/** @fw_size: Size of FW related performance counters. */
> +	__u32 fw_size;
> +};
> +
>  /**
>   * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
>   */
> @@ -938,6 +964,52 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_panthor_perfcnt_config - Arguments passed to DRM_IOCTL_PANTHOR_PERFCNT_CONFIG
> + */
> +struct drm_panthor_perfcnt_config {
> +	/** @ringslots: Size of the perfcnt ring buffer in slot count. */
> +	__u32 ringslots;
> +
> +	/** @counterset: Counter set to enable in Panthor. */
> +	__u32 counterset;
> +
> +	/** @csg_enable: List of CSG intances enabled for perf counting */
> +	__u32 csg_select;
> +
> +	/** @fw_enable  FW counters to be enabled */
> +	__u32 fw_enable;
> +
> +	/** @csg_enable  CSG counters to be enabled */
> +	__u32 csg_enable;
> +
> +	/** @csf_enable  CSF counters to be enabled */
> +	__u32 csf_enable;
> +
> +	/** @shader_enable  Shader unit counters to be enabled */
> +	__u32 shader_enable;
> +
> +	/** @tiler_enable  Tiler unit counters to be enabled */
> +	__u32 tiler_enable;
> +
> +	/** @mmu_l2_enable  L2 cache MMU counters to be enabled */
> +	__u32 mmu_l2_enable;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};
> +
> +/**
> + * struct drm_panthor_perfcnt_dump - Arguments passed to DRM_IOCTL_PANTHOR_PERFCNT_DUMP
> + */
> +struct drm_panthor_perfcnt_dump {
> +	/** @handle: Handle of the BO to write perfcnt dump into */
> +	__u32 handle;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> base-commit: e635b7eb7062b464bbd9795308b1a80eac0b01f5
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
