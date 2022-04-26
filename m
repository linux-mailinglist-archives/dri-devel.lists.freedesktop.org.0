Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907750F3AA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A6510E183;
	Tue, 26 Apr 2022 08:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EDC10E021
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:24:13 +0000 (UTC)
Date: Tue, 26 Apr 2022 16:23:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1650961448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IdGDIqYqS8uTN3qBHotmaehDUrqrCAd/ATCDmNWx4J8=;
 b=F5B/akNZx0UWFc1a5zQAxRrrtRqnAQ+rEmouQVvUMOqPXm8YevuVpoikV0FD/OB0lqQMfm
 1OM0kQltfw+/E4mXL7FzYhpRHk0Ur2BalRnHy7cm88OZGzBIu70RoL9cvlUrRse0q2brDg
 M07BkQ9+qnbcASu4CcWq3g4zBvPwmPo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Message-ID: <20220426082341.GA83596@chq-T47>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26 4月 22 08:31:05, Christian König wrote:
> Am 26.04.22 um 08:08 schrieb Cai Huoqing:
> > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > which is integrated into NVIDIA Jetson AGX Xavier,
> > so add UAPI of this driver.
> > 
> > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > ---
> > v1->v2:
> > *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
> >   move it to uapi.
> >   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
> > 
> >   include/uapi/drm/nvdla_drm.h | 99 ++++++++++++++++++++++++++++++++++++
> >   1 file changed, 99 insertions(+)
> >   create mode 100644 include/uapi/drm/nvdla_drm.h
> > 
> > diff --git a/include/uapi/drm/nvdla_drm.h b/include/uapi/drm/nvdla_drm.h
> > new file mode 100644
> > index 000000000000..984635285525
> > --- /dev/null
> > +++ b/include/uapi/drm/nvdla_drm.h
> > @@ -0,0 +1,99 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> > +/*
> > + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
> > + * Copyright (C) 2022 Cai Huoqing
> > + */
> > +
> > +#ifndef __LINUX_NVDLA_IOCTL_H
> > +#define __LINUX_NVDLA_IOCTL_H
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/types.h>
> > +
> > +#if !defined(__KERNEL__)
> > +#define __user
> > +#endif
> > +
> > +/**
> > + * struct nvdla_mem_handle structure for memory handles
> > + *
> > + * @handle		handle to DMA buffer allocated in userspace
> > + * @reserved		Reserved for padding
> > + * @offset		offset in bytes from start address of buffer
> > + *
> > + */
> > +struct nvdla_mem_handle {
> > +	__u32 handle;
> > +	__u32 reserved;
> > +	__u64 offset;
> > +};
> > +
> > +/**
> > + * struct nvdla_ioctl_submit_task structure for single task information
> > + *
> > + * @num_addresses		total number of entries in address_list
> > + * @reserved			Reserved for padding
> > + * @address_list		pointer to array of struct nvdla_mem_handle
> > + *
> > + */
> > +struct nvdla_ioctl_submit_task {
> > +#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
> > +	__u32 num_addresses;
> > +#define NVDLA_NO_TIMEOUT    (0xffffffff)
> > +	__u32 timeout;
> 
> What format does that timeout value have?
> 
> In general it is best practice to have absolute 64bit nanosecond timeouts
> (to be used with ktime inside the kernel) so that restarting interrupted
> IOCTLs works smooth.
> 
> > +	__u64 address_list;
> 
> Maybe make the comments inline, cause I just wanted to write that you should
> note that this is pointing to an nvdla_mem_handle array until I saw the
> comment above.
> 
> > +};
> > +
> > +/**
> > + * struct nvdla_submit_args structure for task submit
> > + *
> > + * @tasks		pointer to array of struct nvdla_ioctl_submit_task
> > + * @num_tasks		number of entries in tasks
> > + * @flags		flags for task submit, no flags defined yet
> > + * @version		version of task structure
> > + *
> > + */
> > +struct nvdla_submit_args {
> > +	__u64 tasks;
> > +	__u16 num_tasks;
> > +#define NVDLA_MAX_TASKS_PER_SUBMIT	24
> > +#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)
> 
> Well that "no flags defined yet" from the comment above is probably outdated
> :)
> 
> A comment what this flag means would also be nice to have.
> 
> Apart from all those nit picks that looks pretty solid to me. Just one core
> functionality we usually have seems to be missing here: How is completion
> signaling implemented?
Hi,thank for your reply.

Do you mean fence signal? In this driver, IOCTL_SUBMIT is a synchronous call
which do task submission & wait for done completion. This accerletor deal
with massive compute operator (Pooling, Conv...), that is different to
GPU. It's unnecessary to expose fence API to UMD for reducing such less time.

Thanks,
Cai
> 
> Regards,
> Christian.
> 
> > +	__u16 flags;
> > +	__u32 version;
> > +};
> > +
> > +/**
> > + * struct nvdla_gem_create_args for allocating DMA buffer through GEM
> > + *
> > + * @handle		handle updated by kernel after allocation
> > + * @flags		implementation specific flags
> > + * @size		size of buffer to allocate
> > + */
> > +struct nvdla_gem_create_args {
> > +	__u32 handle;
> > +	__u32 flags;
> > +	__u64 size;
> > +};
> > +
> > +/**
> > + * struct nvdla_gem_map_offset_args for mapping DMA buffer
> > + *
> > + * @handle		handle of the buffer
> > + * @reserved		reserved for padding
> > + * @offset		offset updated by kernel after mapping
> > + */
> > +struct nvdla_gem_map_offset_args {
> > +	__u32 handle;
> > +	__u32 reserved;
> > +	__u64 offset;
> > +};
> > +
> > +#define DRM_NVDLA_SUBMIT		0x00
> > +#define DRM_NVDLA_GEM_CREATE	0x01
> > +#define DRM_NVDLA_GEM_MMAP		0x02
> > +
> > +#define DRM_IOCTL_NVDLA_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_SUBMIT, struct nvdla_submit_args)
> > +#define DRM_IOCTL_NVDLA_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_CREATE, struct nvdla_gem_create_args)
> > +#define DRM_IOCTL_NVDLA_GEM_MMAP DRM_IOWR(DRM_COMMAND_BASE + DRM_NVDLA_GEM_MMAP, struct nvdla_gem_map_offset_args)
> > +
> > +#endif
> 
