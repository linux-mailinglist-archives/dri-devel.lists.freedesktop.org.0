Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B36F4975
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 20:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE210E225;
	Tue,  2 May 2023 18:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3910E18C;
 Tue,  2 May 2023 18:07:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0375161518;
 Tue,  2 May 2023 18:07:03 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 61EC6C433D2;
 Tue,  2 May 2023 18:06:59 +0000 (UTC)
Date: Tue, 2 May 2023 14:06:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH 02/14] drm/xe: Introduce the dev_coredump
 infrastructure.
Message-ID: <ZFFNsemoaxUepnxw@rdvivi-mobl4>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-3-rodrigo.vivi@intel.com>
 <2f09ea83-59f0-f210-797f-40dc13908f7d@linux.intel.com>
 <ZFDCTkAD5M0wdJ0f@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFDCTkAD5M0wdJ0f@DUT025-TGLU.fm.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 07:57:02AM +0000, Matthew Brost wrote:
> On Thu, Apr 27, 2023 at 10:28:13AM +0200, Thomas Hellström wrote:
> > 
> > On 4/26/23 22:57, Rodrigo Vivi wrote:
> > > The goal is to use devcoredump infrastructure to report error states
> > > captured at the crash time.
> > > 
> > > The error state will contain useful information for GPU hang debug, such
> > > as INSTDONE registers and the current buffers getting executed, as well
> > > as any other information that helps user space and allow later replays of
> > > the error.
> > > 
> > > The proposal here is to avoid a Xe only error_state like i915 and use
> > > a standard dev_coredump infrastructure to expose the error state.
> > > 
> > > For our own case, the data is only useful if it is a snapshot of the
> > > time when the GPU crash has happened, since we reset the GPU immediately
> > > after and the registers might have changed. So the proposal here is to
> > > have an internal snapshot to be printed out later.
> > > 
> > > Also, usually a subsequent GPU hang can be only a cause of the initial
> > > one. So we only save the 'first' hang. The dev_coredump has a delayed
> > > work queue where it remove the coredump and free all the data withing a
> > > few moments of the error. When that happens we also reset our capture
> > > state and allow further snapshots.
> > > 
> > > Right now this infra only print out the time of the hang. More information
> > > will be migrated here on subsequent work. Also, in order to organize the
> > > dump better, the goal is to propose dev_coredump changes itself to allow
> > > multiple files and different controls. But for now we start Xe usage of
> > > it without any dependency on dev_coredump core changes.
> > > 
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Kconfig                |   1 +
> > >   drivers/gpu/drm/xe/Makefile               |   1 +
> > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 144 ++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
> > >   drivers/gpu/drm/xe/xe_device_types.h      |   4 +
> > >   drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
> > >   drivers/gpu/drm/xe/xe_pci.c               |   2 +
> > >   8 files changed, 223 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
> > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
> > >   create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index f6f3b491d162..d44794f99338 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -35,6 +35,7 @@ config DRM_XE
> > >   	select DRM_TTM_HELPER
> > >   	select DRM_SCHED
> > >   	select MMU_NOTIFIER
> > > +	select WANT_DEV_COREDUMP
> > >   	help
> > >   	  Experimental driver for Intel Xe series GPUs
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index ee4a95beec20..9d675f7c77aa 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
> > >   	xe_bo.o \
> > >   	xe_bo_evict.o \
> > >   	xe_debugfs.o \
> > > +	xe_devcoredump.o \
> > >   	xe_device.o \
> > >   	xe_dma_buf.o \
> > >   	xe_engine.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > new file mode 100644
> > > index 000000000000..d9531183f03a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -0,0 +1,144 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_devcoredump.h"
> > > +#include "xe_devcoredump_types.h"
> > > +
> > > +#include <linux/devcoredump.h>
> > > +#include <generated/utsrelease.h>
> > > +
> > > +#include "xe_engine.h"
> > > +#include "xe_gt.h"
> > > +
> > > +/**
> > > + * DOC: Xe device coredump
> > > + *
> > > + * Devices overview:
> > > + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> > > + * standardized way.
> > > + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> > > + * which is linked with our card device directly.
> > > + * The core dump can be accessed either from
> > > + * /sys/class/drm/card<n>/device/devcoredump/ or from
> > > + * /sys/class/devcoredump/devcd<m> where
> > > + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> > > + * /sys/class/drm/card<n>/device/.
> > > + *
> > > + * Snapshot at hang:
> > > + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > > + * time. For this reason, we need to take snapshots from when the hang has
> > > + * happened, and not only when the user is reading the file. Otherwise the
> > > + * information is outdated since the resets might have happened in between.
> > > + *
> > > + * 'First' failure snapshot:
> > > + * In general, the first hang is the most critical one since the following hangs
> > > + * can be a consequence of the initial hang. For this reason we only take the
> > > + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > > + * at least while the coredump device is alive. Dev_coredump has a delayed work
> > > + * queue that will eventually delete the device and free all the dump
> > > + * information. At this time we also clear the faulty_engine and allow the next
> > > + * hang capture.
> > > + */
> > > +
> > > +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > +				   size_t count, void *data, size_t datalen)
> > > +{
> > > +	struct xe_devcoredump *coredump = data;
> > > +	struct xe_devcoredump_snapshot *ss;
> > > +	struct drm_printer p;
> > > +	struct drm_print_iterator iter;
> > > +	struct timespec64 ts;
> > > +
> > > +	iter.data = buffer;
> > > +	iter.offset = 0;
> > > +	iter.start = offset;
> > > +	iter.remain = count;
> > > +
> > > +	mutex_lock(&coredump->lock);
> > > +
> > > +	ss = &coredump->snapshot;
> > > +	p = drm_coredump_printer(&iter);
> > > +
> > > +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> > > +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > > +
> > > +	ts = ktime_to_timespec64(ss->snapshot_time);
> > > +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > +	ts = ktime_to_timespec64(ss->boot_time);
> > > +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> > > +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > +
> > > +	mutex_unlock(&coredump->lock);
> > > +
> > > +	return count - iter.remain;
> > > +}
> > > +
> > > +static void xe_devcoredump_free(void *data)
> > > +{
> > > +	struct xe_devcoredump *coredump = data;
> > > +	struct xe_device *xe = container_of(coredump, struct xe_device,
> > > +					    devcoredump);
> > > +	mutex_lock(&coredump->lock);
> > > +
> > > +	coredump->faulty_engine = NULL;
> > > +	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> > > +
> > > +	mutex_unlock(&coredump->lock);
> > > +}
> > > +
> > > +static void devcoredump_snapshot(struct xe_devcoredump *coredump)
> > > +{
> > > +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > > +
> > > +	lockdep_assert_held(&coredump->lock);
> > > +	ss->snapshot_time = ktime_get_real();
> > > +	ss->boot_time = ktime_get_boottime();
> > > +}
> > > +
> > > +/**
> > > + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> > > + * @e: The faulty xe_engine, where the issue was detected.
> > > + *
> > > + * This function should be called at the crash time. It is skipped if we still
> > > + * have the core dump device available with the information of the 'first'
> > > + * snapshot.
> > > + */
> > > +void xe_devcoredump(struct xe_engine *e)
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(e->gt);
> > > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > 
> > For !long running engines, this is the dma-fence signalling critical path,
> > and since the drm_scheduler has not yet been properly annotated, we should
> > probably annotate that here, to avoid seeing strange deadlocks during
> > coredumps....
> > 
> > /Thomas
> >
> 
> +1

Just to confirm we are in the same page here, do you guys mean move
dma_fence_begin_signalling() annotation here?

or which annotation am I missing?

> 
> Matt
>  
> > 
> > 
> > > +
> > > +	mutex_lock(&coredump->lock);
> > > +	if (coredump->faulty_engine) {
> > > +		drm_dbg(&xe->drm, "Multiple hangs are occuring, but only the first snapshot was taken\n");
> > > +		mutex_unlock(&coredump->lock);
> > > +		return;
> > > +	}
> > > +	coredump->faulty_engine = e;
> > > +	devcoredump_snapshot(coredump);
> > > +	mutex_unlock(&coredump->lock);
> > > +
> > > +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > > +	drm_info(&xe->drm, "Check your /sys/class/drm/card<n>/device/devcoredump/data\n");
> > > +
> > > +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > > +		      xe_devcoredump_read, xe_devcoredump_free);
> > > +}
> > > +
> > > +/**
> > > + * xe_devcoredump_init - Initialize xe_devcoredump.
> > > + * @xe: Xe device.
> > > + *
> > > + * This function should be called at the probe so the mutex lock can be
> > > + * initialized.
> > > + */
> > > +void xe_devcoredump_init(struct xe_device *xe)
> > > +{
> > > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > > +
> > > +	mutex_init(&coredump->lock);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > new file mode 100644
> > > index 000000000000..30941d2e554b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > @@ -0,0 +1,22 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_DEVCOREDUMP_H_
> > > +#define _XE_DEVCOREDUMP_H_
> > > +
> > > +struct xe_device;
> > > +struct xe_engine;
> > > +
> > > +void xe_devcoredump_init(struct xe_device *xe);
> > > +
> > > +#ifdef CONFIG_DEV_COREDUMP
> > > +void xe_devcoredump(struct xe_engine *e);
> > > +#else
> > > +static inline void xe_devcoredump(struct xe_engine *e)
> > > +{
> > > +}
> > > +#endif
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > new file mode 100644
> > > index 000000000000..3f395fa9104e
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -0,0 +1,47 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> > > +#define _XE_DEVCOREDUMP_TYPES_H_
> > > +
> > > +#include <linux/ktime.h>
> > > +#include <linux/mutex.h>
> > > +
> > > +struct xe_device;
> > > +
> > > +/**
> > > + * struct xe_devcoredump_snapshot - Crash snapshot
> > > + *
> > > + * This struct contains all the useful information quickly captured at the time
> > > + * of the crash. So, any subsequent reads of the coredump points to a data that
> > > + * shows the state of the GPU of when the issue has happened.
> > > + */
> > > +struct xe_devcoredump_snapshot {
> > > +	/** @snapshot_time:  Time of this capture. */
> > > +	ktime_t snapshot_time;
> > > +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> > > +	ktime_t boot_time;
> > > +};
> > > +
> > > +/**
> > > + * struct xe_devcoredump - Xe devcoredump main structure
> > > + *
> > > + * This struct represents the live and active dev_coredump node.
> > > + * It is created/populated at the time of a crash/error. Then it
> > > + * is read later when user access the device coredump data file
> > > + * for reading the information.
> > > + */
> > > +struct xe_devcoredump {
> > > +	/** @xe: Xe device. */
> > > +	struct xe_device *xe;
> > > +	/** @falty_engine: Engine where the crash/error happened. */
> > > +	struct xe_engine *faulty_engine;
> > > +	/** @lock: Protects data from races between capture and read out. */
> > > +	struct mutex lock;
> > > +	/** @snapshot: Snapshot is captured at time of the first crash */
> > > +	struct xe_devcoredump_snapshot snapshot;
> > > +};
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 1cb404e48aaa..2a0995824692 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -12,6 +12,7 @@
> > >   #include <drm/drm_file.h>
> > >   #include <drm/ttm/ttm_device.h>
> > > +#include "xe_devcoredump_types.h"
> > >   #include "xe_gt_types.h"
> > >   #include "xe_platform_types.h"
> > >   #include "xe_step_types.h"
> > > @@ -55,6 +56,9 @@ struct xe_device {
> > >   	/** @drm: drm device */
> > >   	struct drm_device drm;
> > > +	/** @devcoredump: device coredump */
> > > +	struct xe_devcoredump devcoredump;
> > > +
> > >   	/** @info: device info */
> > >   	struct intel_device_info {
> > >   		/** @graphics_name: graphics IP name */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index e857013070b9..231fb4145297 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -14,6 +14,7 @@
> > >   #include <drm/drm_managed.h>
> > >   #include "regs/xe_lrc_layout.h"
> > > +#include "xe_devcoredump.h"
> > >   #include "xe_device.h"
> > >   #include "xe_engine.h"
> > >   #include "xe_force_wake.h"
> > > @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> > >   		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> > >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > >   		simple_error_capture(e);
> > > +		xe_devcoredump(e);
> > >   	} else {
> > >   		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
> > >   			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index e512e8b69831..1d496210b580 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -16,6 +16,7 @@
> > >   #include "regs/xe_regs.h"
> > >   #include "regs/xe_gt_regs.h"
> > > +#include "xe_devcoredump.h"
> > >   #include "xe_device.h"
> > >   #include "xe_display.h"
> > >   #include "xe_drv.h"
> > > @@ -657,6 +658,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > >   		return err;
> > >   	}
> > > +	xe_devcoredump_init(xe);
> > >   	xe_pm_runtime_init(xe);
> > >   	return 0;
