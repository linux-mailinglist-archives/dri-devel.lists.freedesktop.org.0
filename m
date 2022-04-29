Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31755514120
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 05:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DCE10F9E8;
	Fri, 29 Apr 2022 03:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FDA10F9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:58:59 +0000 (UTC)
Date: Fri, 29 Apr 2022 11:58:30 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1651204735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGbVJ2oBgQd9WBhBVcYIZ91yYFFi5lls4Cqv+m8iT0Y=;
 b=G3wXv49vKJ30/lKminB+CrcC5Q6qT5Pwjp6Z3SJ7dAQvIGT46/aCRlKluDdq10B0+3LHKF
 czPEjwExecGkZ0rdli93xZsN07GHkkdOtoWnyXxlNRLladQOoJCQ8NZypSB4guh0wI1YLE
 CpgN5e9NdYxatNMmEOoSCOZMiuiPpgQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Message-ID: <20220429035830.GB15753@chq-T47>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <20220426060808.78225-5-cai.huoqing@linux.dev>
 <618a4f53-0998-1e6b-e32b-8bf2d3057cec@amd.com>
 <20220426082341.GA83596@chq-T47> <YmqocpCdc7cuYJm7@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmqocpCdc7cuYJm7@orome>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28 4月 22 16:45:06, Thierry Reding wrote:
> On Tue, Apr 26, 2022 at 04:23:41PM +0800, Cai Huoqing wrote:
> > On 26 4月 22 08:31:05, Christian König wrote:
> > > Am 26.04.22 um 08:08 schrieb Cai Huoqing:
> > > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > > so add UAPI of this driver.
> > > > 
> > > > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > > > ---
> > > > v1->v2:
> > > > *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
> > > >   move it to uapi.
> > > >   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
> > > > 
> > > >   include/uapi/drm/nvdla_drm.h | 99 ++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 99 insertions(+)
> > > >   create mode 100644 include/uapi/drm/nvdla_drm.h
> > > > 
> > > > diff --git a/include/uapi/drm/nvdla_drm.h b/include/uapi/drm/nvdla_drm.h
> > > > new file mode 100644
> > > > index 000000000000..984635285525
> > > > --- /dev/null
> > > > +++ b/include/uapi/drm/nvdla_drm.h
> > > > @@ -0,0 +1,99 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> > > > +/*
> > > > + * Copyright (C) 2017-2018 NVIDIA CORPORATION.
> > > > + * Copyright (C) 2022 Cai Huoqing
> > > > + */
> > > > +
> > > > +#ifndef __LINUX_NVDLA_IOCTL_H
> > > > +#define __LINUX_NVDLA_IOCTL_H
> > > > +
> > > > +#include <linux/ioctl.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#if !defined(__KERNEL__)
> > > > +#define __user
> > > > +#endif
> > > > +
> > > > +/**
> > > > + * struct nvdla_mem_handle structure for memory handles
> > > > + *
> > > > + * @handle		handle to DMA buffer allocated in userspace
> > > > + * @reserved		Reserved for padding
> > > > + * @offset		offset in bytes from start address of buffer
> > > > + *
> > > > + */
> > > > +struct nvdla_mem_handle {
> > > > +	__u32 handle;
> > > > +	__u32 reserved;
> > > > +	__u64 offset;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct nvdla_ioctl_submit_task structure for single task information
> > > > + *
> > > > + * @num_addresses		total number of entries in address_list
> > > > + * @reserved			Reserved for padding
> > > > + * @address_list		pointer to array of struct nvdla_mem_handle
> > > > + *
> > > > + */
> > > > +struct nvdla_ioctl_submit_task {
> > > > +#define NVDLA_MAX_BUFFERS_PER_TASK (6144)
> > > > +	__u32 num_addresses;
> > > > +#define NVDLA_NO_TIMEOUT    (0xffffffff)
> > > > +	__u32 timeout;
> > > 
> > > What format does that timeout value have?
> > > 
> > > In general it is best practice to have absolute 64bit nanosecond timeouts
> > > (to be used with ktime inside the kernel) so that restarting interrupted
> > > IOCTLs works smooth.
> > > 
> > > > +	__u64 address_list;
> > > 
> > > Maybe make the comments inline, cause I just wanted to write that you should
> > > note that this is pointing to an nvdla_mem_handle array until I saw the
> > > comment above.
> > > 
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct nvdla_submit_args structure for task submit
> > > > + *
> > > > + * @tasks		pointer to array of struct nvdla_ioctl_submit_task
> > > > + * @num_tasks		number of entries in tasks
> > > > + * @flags		flags for task submit, no flags defined yet
> > > > + * @version		version of task structure
> > > > + *
> > > > + */
> > > > +struct nvdla_submit_args {
> > > > +	__u64 tasks;
> > > > +	__u16 num_tasks;
> > > > +#define NVDLA_MAX_TASKS_PER_SUBMIT	24
> > > > +#define NVDLA_SUBMIT_FLAGS_ATOMIC	(1 << 0)
> > > 
> > > Well that "no flags defined yet" from the comment above is probably outdated
> > > :)
> > > 
> > > A comment what this flag means would also be nice to have.
> > > 
> > > Apart from all those nit picks that looks pretty solid to me. Just one core
> > > functionality we usually have seems to be missing here: How is completion
> > > signaling implemented?
> > Hi,thank for your reply.
> > 
> > Do you mean fence signal? In this driver, IOCTL_SUBMIT is a synchronous call
> > which do task submission & wait for done completion. This accerletor deal
> > with massive compute operator (Pooling, Conv...), that is different to
> > GPU. It's unnecessary to expose fence API to UMD for reducing such less time.
> 
> Are you saying that using fences won't be a big benefit because the DLA
> can't effectively process tasks from multiple sources in parallel? That
> is only part of where some sort of signalling would be useful. Another
> reason why it would be good to have is to make it easier to write user-
> space that can hand off a set of tasks to the DLA, then go off and do
> something else and get notified about the completion somehow. If not a
> full-blown fence API, then perhaps FD polling would be a simple
> mechanism to allow some degree of asynchronicity.
Agree, I will add fence IOCTL if resend patch

Thanks
Cai
> 
> Thierry


