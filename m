Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C701B2F0CA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7008610E154;
	Thu, 21 Aug 2025 08:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EnrsX72c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A44110E154
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755764193;
 bh=0C42mOA8a8/fy+R/ielO0GJF//wDr8ePiDFIJm6QXoU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EnrsX72cx386A5lUamIqn6yuL+snFU2aaDH4OYAxmbA9QeVMNoWDJxl43R9lWt3IN
 8+gfp6YNIzBSsnu9WR3GA9frZOXjo6I8N7BZ2IiyzRggRt8ftfFBI8iSTopdkRsxlY
 AnJhnjHVgtlnQJmVnerPnakVb3fzSfKvSOBhWTLZ2wiObc5UNjenZuxLJ6NGN/zmGe
 pSPp4YwqdVO6ACFxcexBKDIkXjGXPX4MLnCkN5m1R+eV4CurxngtNYiBrh0lVIR9pz
 Jgg/RBF4a46CXsq+bOARtQ9rN5ELtYoN0BJnY8sBrlLk9pejYQX1ZxcEb4f/yoPNzM
 24Wt8eoFtRlKA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B71E417E0154;
 Thu, 21 Aug 2025 10:16:32 +0200 (CEST)
Date: Thu, 21 Aug 2025 10:16:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/panthor: add devcoredump support
Message-ID: <20250821101627.7067ee84@fedora>
In-Reply-To: <35246e11-3faf-47c3-9332-9d2ff7036cdc@arm.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
 <20250720000146.1405060-2-olvaffe@gmail.com>
 <35246e11-3faf-47c3-9332-9d2ff7036cdc@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 28 Jul 2025 12:24:02 +0100
Steven Price <steven.price@arm.com> wrote:

> On 20/07/2025 01:01, Chia-I Wu wrote:
> > Create a devcoredump on any faulty or fatal event. The coredump data is
> > in YAML format for readability and flexibility.
> > 
> > Only panthor_group state is captured for now.
> > 
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/panthor/Makefile           |   2 +
> >  drivers/gpu/drm/panthor/panthor_coredump.c | 225 +++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_coredump.h |  68 +++++++
> >  drivers/gpu/drm/panthor/panthor_device.h   |   6 +
> >  drivers/gpu/drm/panthor/panthor_sched.c    |  69 +++++++
> >  drivers/gpu/drm/panthor/panthor_sched.h    |   5 +
> >  6 files changed, 375 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_coredump.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_coredump.h
> > 
> > diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> > index 15294719b09c..9fd1e74af1df 100644
> > --- a/drivers/gpu/drm/panthor/Makefile
> > +++ b/drivers/gpu/drm/panthor/Makefile
> > @@ -11,4 +11,6 @@ panthor-y := \
> >  	panthor_mmu.o \
> >  	panthor_sched.o
> >  
> > +panthor-$(CONFIG_DEV_COREDUMP) += panthor_coredump.o
> > +
> >  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> > diff --git a/drivers/gpu/drm/panthor/panthor_coredump.c b/drivers/gpu/drm/panthor/panthor_coredump.c
> > new file mode 100644
> > index 000000000000..767f3327e3e8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_coredump.c
> > @@ -0,0 +1,225 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +/* Copyright 2025 Google LLC */
> > +
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_managed.h>
> > +#include <generated/utsrelease.h>
> > +#include <linux/devcoredump.h>
> > +#include <linux/err.h>
> > +#include <linux/slab.h>
> > +#include <linux/timekeeping.h>
> > +
> > +#include "panthor_coredump.h"
> > +#include "panthor_device.h"
> > +#include "panthor_sched.h"
> > +
> > +/**
> > + * enum panthor_coredump_mask - Coredump state
> > + */
> > +enum panthor_coredump_mask {
> > +	PANTHOR_COREDUMP_GROUP = BIT(0),
> > +};
> > +
> > +/**
> > + * struct panthor_coredump_header - Coredump header
> > + */
> > +struct panthor_coredump_header {
> > +	enum panthor_coredump_reason reason;
> > +	ktime_t timestamp;
> > +};
> > +
> > +/**
> > + * struct panthor_coredump - Coredump
> > + */
> > +struct panthor_coredump {
> > +	/** @ptdev: Device. */
> > +	struct panthor_device *ptdev;
> > +
> > +	/** @work: Bottom half of panthor_coredump_capture. */
> > +	struct work_struct work;
> > +
> > +	/** @header: Header. */
> > +	struct panthor_coredump_header header;
> > +
> > +	/** @mask: Bitmask of captured states. */
> > +	u32 mask;
> > +
> > +	struct panthor_coredump_group_state group;
> > +
> > +	/* @data: Serialized coredump data. */
> > +	void *data;
> > +
> > +	/* @size: Serialized coredump size. */
> > +	size_t size;
> > +};
> > +
> > +static const char *reason_str(enum panthor_coredump_reason reason)
> > +{
> > +	switch (reason) {
> > +	case PANTHOR_COREDUMP_REASON_MMU_FAULT:
> > +		return "MMU_FAULT";
> > +	case PANTHOR_COREDUMP_REASON_CSG_REQ_TIMEOUT:
> > +		return "CSG_REQ_TIMEOUT";
> > +	case PANTHOR_COREDUMP_REASON_CSG_UNKNOWN_STATE:
> > +		return "CSG_UNKNOWN_STATE";
> > +	case PANTHOR_COREDUMP_REASON_CSG_PROGRESS_TIMEOUT:
> > +		return "CSG_PROGRESS_TIMEOUT";
> > +	case PANTHOR_COREDUMP_REASON_CS_FATAL:
> > +		return "CS_FATAL";
> > +	case PANTHOR_COREDUMP_REASON_CS_FAULT:
> > +		return "CS_FAULT";
> > +	case PANTHOR_COREDUMP_REASON_CS_TILER_OOM:
> > +		return "CS_TILER_OOM";
> > +	case PANTHOR_COREDUMP_REASON_JOB_TIMEOUT:
> > +		return "JOB_TIMEOUT";
> > +	default:
> > +		return "UNKNOWN";
> > +	}
> > +}  
> 
> I'd recommend using a macro to reduce the repetition, e.g. take a look
> at PANTHOR_EXCEPTION().
> 
> > +
> > +static void print_group(struct drm_printer *p,
> > +			const struct panthor_coredump_group_state *group)
> > +{
> > +	drm_puts(p, "group:\n");
> > +	drm_printf(p, "  priority: %d\n", group->priority);
> > +	drm_printf(p, "  queue_count: %u\n", group->queue_count);
> > +	drm_printf(p, "  pid: %d\n", group->pid);
> > +	drm_printf(p, "  comm: %s\n", group->comm);  
> 
> I can see the attraction of YAML, but here "comm" might contain
> characters that break the YAML parsing. So either we need to correctly
> quote such characters, or accept this isn't YAML.
> 
> In particular YAML starts to become ugly in the final patch when you are
> dumping buffer objects. Although AFAICT that is quoted successfully.

I honestly have mixed feelings about human-readable coredumps. On one
hand it gives you general GPU state info very quickly, on the other
hand, it becomes a lot bigger when you get to dump the info you need
for an actual post-mortem debugging session (VAs and BOs). And let's be
honest, those dumps will be passed to the GPU-specific coredump analysis
tool 99.99% of the time, so it's not like human-readability is important
in practice.

I know most drivers (Xe, AMD, MSM, ...) are using the drm printer and
generating human readable dumps, which I guess is one more reason to go
for this approach, but I wish we had some kind of ELF-like format for
these dumps, with separate sections and an easy way for the coredump
analysis tools to navigate among these sections easily instead of
having to parse text. Oh well, looks like this ship has long sailed,
and we get to follow others lead here.

> 
> > +	drm_printf(p, "  destroyed: %d\n", group->destroyed);
> > +	drm_printf(p, "  csg_id: %d\n", group->csg_id);
> > +}
> > +
> > +static void print_header(struct drm_printer *p,
> > +			 const struct panthor_coredump_header *header,
> > +			 const struct drm_driver *drv)
> > +{
> > +	drm_puts(p, "header:\n");
> > +	drm_puts(p, "  kernel: " UTS_RELEASE "\n");
> > +	drm_puts(p, "  module: " KBUILD_MODNAME "\n");
> > +	drm_printf(p, "  driver_version: %d.%d\n", drv->major, drv->minor);
> > +
> > +	drm_printf(p, "  reason: %s\n", reason_str(header->reason));
> > +	drm_printf(p, "  timestamp: %lld\n", ktime_to_ns(header->timestamp));
> > +}
> > +
> > +static void print_cd(struct drm_printer *p, const struct panthor_coredump *cd)
> > +{
> > +	/* in YAML format */
> > +	drm_puts(p, "---\n");
> > +	print_header(p, &cd->header, cd->ptdev->base.driver);
> > +
> > +	if (cd->mask & PANTHOR_COREDUMP_GROUP)
> > +		print_group(p, &cd->group);
> > +}
> > +
> > +static void process_cd(struct panthor_device *ptdev,
> > +		       struct panthor_coredump *cd)
> > +{
> > +	struct drm_print_iterator iter = {
> > +		.remain = SSIZE_MAX,
> > +	};
> > +	struct drm_printer p = drm_coredump_printer(&iter);
> > +
> > +	print_cd(&p, cd);
> > +
> > +	iter.remain = SSIZE_MAX - iter.remain;
> > +	iter.data = kvmalloc(iter.remain, GFP_USER);
> > +	if (!iter.data)
> > +		return;
> > +
> > +	cd->data = iter.data;
> > +	cd->size = iter.remain;
> > +
> > +	drm_info(&ptdev->base, "generating coredump of size %zu\n", cd->size);
> > +
> > +	p = drm_coredump_printer(&iter);
> > +	print_cd(&p, cd);
> > +}  
> 
> I think this would be better written in the style suggested in the
> drm_print.h header, moving the iterator into print_cd():
> 
> static ssize_t print_cd(char *buffer, ssize_t count, const struct
> panthor_coredump *cd)
> {
> 	struct drm_print_iterator iter = {
> 		.data = buffer,
> 		.remain = count,
> 	};
> 	struct drm_printer p = drm_coredump_printer(&iter);
> 
> 	/* in YAML format */
> 	drm_puts(p, "---\n");
> 	print_header(p, &cd->header, cd->ptdev->base.driver);
> 
> 	if (cd->mask & PANTHOR_COREDUMP_GROUP)
> 		print_group(p, &cd->group);
> 
> 	return count - iter.remain;
> }
> 
> static void process_cd(struct panthor_device *ptdev,
> 		       struct panthor_coredump *cd)
> {
> 	ssize_t count = print_cd(NULL, SSIZE_MAX, cd);
> 
> 	cd->data = kvmalloc(count, GFP_USER);
> 	if (!cd->data)
> 		return;
> 	cd->size = count;
> 
> 	drm_info(&ptdev->base, "generating coredump of size %zu\n", count);
> 	print_cd(cd->data, cd->size, cd);
> }
> 
> > +
> > +static void capture_cd(struct panthor_device *ptdev,
> > +		       struct panthor_coredump *cd, struct panthor_group *group)
> > +{
> > +	drm_info(&ptdev->base, "capturing coredump states\n");
> > +
> > +	if (group) {
> > +		panthor_group_capture_coredump(group, &cd->group);
> > +		cd->mask |= PANTHOR_COREDUMP_GROUP;
> > +	}
> > +}
> > +
> > +static void panthor_coredump_free(void *data)
> > +{
> > +	struct panthor_coredump *cd = data;
> > +	struct panthor_device *ptdev = cd->ptdev;
> > +
> > +	kvfree(cd->data);
> > +	kfree(cd);
> > +
> > +	atomic_set(&ptdev->coredump.pending, 0);
> > +}
> > +
> > +static ssize_t panthor_coredump_read(char *buffer, loff_t offset, size_t count,
> > +				     void *data, size_t datalen)
> > +{
> > +	const struct panthor_coredump *cd = data;
> > +
> > +	if (offset >= cd->size)
> > +		return 0;
> > +
> > +	if (count > cd->size - offset)
> > +		count = cd->size - offset;
> > +
> > +	memcpy(buffer, cd->data + offset, count);
> > +
> > +	return count;
> > +}
> > +
> > +static void panthor_coredump_process_work(struct work_struct *work)
> > +{
> > +	struct panthor_coredump *cd =
> > +		container_of(work, struct panthor_coredump, work);
> > +	struct panthor_device *ptdev = cd->ptdev;
> > +
> > +	process_cd(ptdev, cd);
> > +
> > +	dev_coredumpm(ptdev->base.dev, THIS_MODULE, cd, 0, GFP_KERNEL,
> > +		      panthor_coredump_read, panthor_coredump_free);  
> 
> Is there a good reason to reinvent the read/free functionality of
> devcoredump? Can we not just use dev_coredumpv() instead? The only
> benefit I can see if the automatic rearming of coredump.pending, but
> panfrost handles this by having a "panfrost_dump_core" flag which is
> re-armed manually from user space.
> 
> Given core dumps might be large and fairly expensive to create, it seems
> sensible to not automatically re-arm.
> 
> > +}
> > +
> > +void panthor_coredump_capture(struct panthor_coredump *cd,
> > +			      struct panthor_group *group)
> > +{
> > +	struct panthor_device *ptdev = cd->ptdev;
> > +
> > +	capture_cd(ptdev, cd, group);
> > +
> > +	queue_work(system_unbound_wq, &cd->work);
> > +}  
> 
> So I can see why you want to move the work onto a workqueue, but I'm a
> little worried about lifetimes.
> 
> It seems slightly odd that you are capturing the data into a binary
> format (struct panthor_coredump_group_state, and later
> panthor_coredump_gpu_state, panthor_coredump_glb_state,
> panthor_coredump_csg_state etc) and then kicking off a separate
> workqueue item to convert it all to YAML.
> 
> > +
> > +struct panthor_coredump *
> > +panthor_coredump_alloc(struct panthor_device *ptdev,
> > +		       enum panthor_coredump_reason reason, gfp_t gfp)
> > +{
> > +	struct panthor_coredump *cd;
> > +
> > +	/* reject all but the first coredump until it is handled */
> > +	if (atomic_cmpxchg(&ptdev->coredump.pending, 0, 1)) {
> > +		drm_dbg(&ptdev->base, "skip subsequent coredump\n");
> > +		return NULL;
> > +	}
> > +
> > +	cd = kzalloc(sizeof(*cd), gfp);
> > +	if (!cd) {
> > +		atomic_set(&ptdev->coredump.pending, 0);
> > +		return NULL;
> > +	}
> > +
> > +	cd->ptdev = ptdev;
> > +	INIT_WORK(&cd->work, panthor_coredump_process_work);
> > +
> > +	cd->header.reason = reason;
> > +	cd->header.timestamp = ktime_get_real();
> > +
> > +	return cd;
> > +}
> > diff --git a/drivers/gpu/drm/panthor/panthor_coredump.h b/drivers/gpu/drm/panthor/panthor_coredump.h
> > new file mode 100644
> > index 000000000000..dd1fe1c2e175
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_coredump.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > +/* Copyright 2019 Collabora ltd. */
> > +
> > +#ifndef __PANTHOR_COREDUMP_H__
> > +#define __PANTHOR_COREDUMP_H__
> > +
> > +#include <drm/panthor_drm.h>
> > +#include <linux/sched.h>
> > +#include <linux/types.h>
> > +
> > +struct panthor_coredump;
> > +struct panthor_device;
> > +struct panthor_group;
> > +
> > +/**
> > + * enum panthor_coredump_reason - Coredump reason
> > + */
> > +enum panthor_coredump_reason {
> > +	PANTHOR_COREDUMP_REASON_MMU_FAULT,
> > +	PANTHOR_COREDUMP_REASON_CSG_REQ_TIMEOUT,
> > +	PANTHOR_COREDUMP_REASON_CSG_UNKNOWN_STATE,
> > +	PANTHOR_COREDUMP_REASON_CSG_PROGRESS_TIMEOUT,
> > +	PANTHOR_COREDUMP_REASON_CS_FATAL,
> > +	PANTHOR_COREDUMP_REASON_CS_FAULT,
> > +	PANTHOR_COREDUMP_REASON_CS_TILER_OOM,
> > +	PANTHOR_COREDUMP_REASON_JOB_TIMEOUT,
> > +};
> > +
> > +/**
> > + * struct panthor_coredump_group_state - Coredump group state
> > + *
> > + * Interesting panthor_group fields.
> > + */
> > +struct panthor_coredump_group_state {
> > +	enum drm_panthor_group_priority priority;
> > +	u32 queue_count;
> > +	pid_t pid;
> > +	char comm[TASK_COMM_LEN];
> > +	bool destroyed;
> > +	int csg_id;
> > +};
> > +
> > +#ifdef CONFIG_DEV_COREDUMP
> > +
> > +struct panthor_coredump *
> > +panthor_coredump_alloc(struct panthor_device *ptdev,
> > +		       enum panthor_coredump_reason reason, gfp_t gfp);
> > +
> > +void panthor_coredump_capture(struct panthor_coredump *cd,
> > +			      struct panthor_group *group);
> > +
> > +#else /* CONFIG_DEV_COREDUMP */
> > +
> > +static inline struct panthor_coredump *
> > +panthor_coredump_alloc(struct panthor_device *ptdev,
> > +		       enum panthor_coredump_reason reason, gfp_t gfp)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline void panthor_coredump_capture(struct panthor_coredump *cd,
> > +					    struct panthor_group *group)
> > +{
> > +}  
> 
> panthor_coredump_alloc() is always called immediately before
> panthor_coredump_capture(). So instead we could just export a wrapper
> than combines both functions. This also avoids the caller having to deal
> with panthor_coredump_alloc() failing.
> 
> Thanks,
> Steve
> 
> > +
> > +#endif /* CONFIG_DEV_COREDUMP */
> > +
> > +#endif /* __PANTHOR_COREDUMP_H__ */
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 4fc7cf2aeed5..766e53c25cfa 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -197,6 +197,12 @@ struct panthor_device {
> >  		atomic_t recovery_needed;
> >  	} pm;
> >  
> > +	/** @coredump: Coredump-related data. */
> > +	struct {
> > +		/** @pending: True if there is a pending coredump. */
> > +		atomic_t pending;
> > +	} coredump;
> > +
> >  	/** @profile_mask: User-set profiling flags for job accounting. */
> >  	u32 profile_mask;
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index a2248f692a03..eb45b5ad9774 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  
> > +#include "panthor_coredump.h"
> >  #include "panthor_devfreq.h"
> >  #include "panthor_device.h"
> >  #include "panthor_fw.h"
> > @@ -1031,6 +1032,10 @@ group_unbind_locked(struct panthor_group *group)
> >  	return 0;
> >  }
> >  
> > +static void panthor_sched_coredump_locked(struct panthor_device *ptdev,
> > +					  enum panthor_coredump_reason reason,
> > +					  struct panthor_group *group);
> > +
> >  /**
> >   * cs_slot_prog_locked() - Program a queue slot
> >   * @ptdev: Device.
> > @@ -1249,6 +1254,10 @@ csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
> >  		drm_err(&ptdev->base, "Invalid state on CSG %d (state=%d)",
> >  			csg_id, csg_state);
> >  		new_state = PANTHOR_CS_GROUP_UNKNOWN_STATE;
> > +
> > +		panthor_sched_coredump_locked(
> > +			ptdev, PANTHOR_COREDUMP_REASON_CSG_UNKNOWN_STATE,
> > +			group);
> >  		break;
> >  	}
> >  
> > @@ -1378,6 +1387,9 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
> >  		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fatal)),
> >  		 (unsigned int)CS_EXCEPTION_DATA(fatal),
> >  		 info);
> > +
> > +	panthor_sched_coredump_locked(ptdev, PANTHOR_COREDUMP_REASON_CS_FATAL,
> > +				      group);
> >  }
> >  
> >  static void
> > @@ -1426,6 +1438,9 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
> >  		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fault)),
> >  		 (unsigned int)CS_EXCEPTION_DATA(fault),
> >  		 info);
> > +
> > +	panthor_sched_coredump_locked(ptdev, PANTHOR_COREDUMP_REASON_CS_FAULT,
> > +				      group);
> >  }
> >  
> >  static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
> > @@ -1480,6 +1495,10 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
> >  		drm_warn(&ptdev->base, "Failed to extend the tiler heap\n");
> >  		group->fatal_queues |= BIT(cs_id);
> >  		sched_queue_delayed_work(sched, tick, 0);
> > +
> > +		panthor_sched_coredump_locked(
> > +			ptdev, PANTHOR_COREDUMP_REASON_CS_TILER_OOM, group);
> > +
> >  		goto out_put_heap_pool;
> >  	}
> >  
> > @@ -1639,6 +1658,9 @@ csg_slot_process_progress_timer_event_locked(struct panthor_device *ptdev, u32 c
> >  		group->timedout = true;
> >  
> >  	sched_queue_delayed_work(sched, tick, 0);
> > +
> > +	panthor_sched_coredump_locked(
> > +		ptdev, PANTHOR_COREDUMP_REASON_CSG_PROGRESS_TIMEOUT, group);
> >  }
> >  
> >  static void sched_process_csg_irq_locked(struct panthor_device *ptdev, u32 csg_id)
> > @@ -1858,8 +1880,16 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
> >  
> >  		if (ret && acked != req_mask &&
> >  		    ((csg_iface->input->req ^ csg_iface->output->ack) & req_mask) != 0) {
> > +			struct panthor_csg_slot *csg_slot =
> > +				&sched->csg_slots[csg_id];
> > +			struct panthor_group *group = csg_slot->group;
> > +
> >  			drm_err(&ptdev->base, "CSG %d update request timedout", csg_id);
> >  			ctx->timedout_mask |= BIT(csg_id);
> > +
> > +			panthor_sched_coredump_locked(
> > +				ptdev, PANTHOR_COREDUMP_REASON_CSG_REQ_TIMEOUT,
> > +				group);
> >  		}
> >  	}
> >  
> > @@ -2027,6 +2057,10 @@ tick_ctx_init(struct panthor_scheduler *sched,
> >  		 * CSG IRQs, so we can flag the faulty queue.
> >  		 */
> >  		if (panthor_vm_has_unhandled_faults(group->vm)) {
> > +			panthor_sched_coredump_locked(
> > +				ptdev, PANTHOR_COREDUMP_REASON_MMU_FAULT,
> > +				group);
> > +
> >  			sched_process_csg_irq_locked(ptdev, i);
> >  
> >  			/* No fatal fault reported, flag all queues as faulty. */
> > @@ -3237,6 +3271,10 @@ queue_timedout_job(struct drm_sched_job *sched_job)
> >  
> >  		group_queue_work(group, term);
> >  	}
> > +
> > +	panthor_sched_coredump_locked(
> > +		ptdev, PANTHOR_COREDUMP_REASON_JOB_TIMEOUT, group);
> > +
> >  	mutex_unlock(&sched->lock);
> >  
> >  	queue_start(queue);
> > @@ -3627,6 +3665,37 @@ int panthor_group_get_state(struct panthor_file *pfile,
> >  	return 0;
> >  }
> >  
> > +static void panthor_sched_coredump_locked(struct panthor_device *ptdev,
> > +					  enum panthor_coredump_reason reason,
> > +					  struct panthor_group *group)
> > +{
> > +	struct panthor_coredump *cd;
> > +
> > +	lockdep_assert_held(&ptdev->scheduler->lock);
> > +
> > +	/* GFP_NOWAIT because this may be called from fence signaling path */
> > +	cd = panthor_coredump_alloc(ptdev, reason, GFP_NOWAIT);
> > +	if (!cd)
> > +		return;
> > +
> > +	panthor_coredump_capture(cd, group);
> > +}
> > +
> > +void panthor_group_capture_coredump(const struct panthor_group *group,
> > +				    struct panthor_coredump_group_state *state)
> > +{
> > +	const struct panthor_device *ptdev = group->ptdev;
> > +
> > +	/* this is called from panthor_coredump_capture */
> > +	lockdep_assert_held(&ptdev->scheduler->lock);
> > +
> > +	state->priority = group->priority;
> > +	state->queue_count = group->queue_count;
> > +	/* TODO state->pid and state->comm */
> > +	state->destroyed = group->destroyed;
> > +	state->csg_id = group->csg_id;
> > +}
> > +
> >  int panthor_group_pool_create(struct panthor_file *pfile)
> >  {
> >  	struct panthor_group_pool *gpool;
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> > index 742b0b4ff3a3..6c564153133e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.h
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> > @@ -14,8 +14,10 @@ struct drm_panthor_group_create;
> >  struct drm_panthor_queue_create;
> >  struct drm_panthor_group_get_state;
> >  struct drm_panthor_queue_submit;
> > +struct panthor_coredump_group_state;
> >  struct panthor_device;
> >  struct panthor_file;
> > +struct panthor_group;
> >  struct panthor_group_pool;
> >  struct panthor_job;
> >  
> > @@ -26,6 +28,9 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
> >  int panthor_group_get_state(struct panthor_file *pfile,
> >  			    struct drm_panthor_group_get_state *get_state);
> >  
> > +void panthor_group_capture_coredump(const struct panthor_group *group,
> > +				    struct panthor_coredump_group_state *state);
> > +
> >  struct drm_sched_job *
> >  panthor_job_create(struct panthor_file *pfile,
> >  		   u16 group_handle,  
> 

