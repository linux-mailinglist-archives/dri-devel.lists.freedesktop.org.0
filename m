Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF37A31D1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 20:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFD610E174;
	Sat, 16 Sep 2023 18:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3516 seconds by postgrey-1.36 at gabe;
 Sat, 16 Sep 2023 18:06:26 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [IPv6:2a02:c207:3002:6234::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8232510E174;
 Sat, 16 Sep 2023 18:06:26 +0000 (UTC)
Message-ID: <89298ba7-71bf-c7d2-abfb-236a17e3e899@dakr.org>
Date: Sat, 16 Sep 2023 20:06:15 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 12/13] drm/sched/doc: Add Entity teardown documentaion
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-13-matthew.brost@intel.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20230912021615.2086698-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/12/23 04:16, Matthew Brost wrote:
> Provide documentation to guide in ways to teardown an entity.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   Documentation/gpu/drm-mm.rst             |  6 ++++++
>   drivers/gpu/drm/scheduler/sched_entity.c | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index c19b34b1c0ed..cb4d6097897e 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -552,6 +552,12 @@ Overview
>   .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>      :doc: Overview
>   
> +Entity teardown
> +---------------

While I think it is good to document this as well, my concern was more about tearing
down the drm_gpu_scheduler. (See also my response to patch 11 of this series.)

How do we ensure that the pending_list is actually empty before calling
drm_sched_fini()? If we don't, we potentially leak memory.

For instance, we could let drm_sched_fini() (or a separate drm_sched_teardown())
cancel run work first and leave free work running until the pending_list is empty.

If we think drivers should take care themselves (e.g. through reference counting jobs
per scheduler), we should document this and explain why we can't have the scheduler do
this for us.

> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_entity.c
> +   :doc: Entity teardown
> +
>   Scheduler Function References
>   -----------------------------
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 37557fbb96d0..76f3e10218bb 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -21,6 +21,25 @@
>    *
>    */
>   
> +/**
> + * DOC: Entity teardown
> + *
> + * Drivers can teardown down an entity for several reasons. Reasons typically
> + * are a user closes the entity via an IOCTL, the FD associated with the entity
> + * is closed, or the entity encounters an error. The GPU scheduler provides the
> + * basic infrastructure to do this in a few different ways.
> + *
> + * 1. Let the entity run dry (both the pending list and job queue) and then call
> + * drm_sched_entity_fini. The backend can accelerate the process of running dry.
> + * For example set a flag so run_job is a NOP and set the TDR to a low value to
> + * signal all jobs in a timely manner (this example works for
> + * DRM_SCHED_POLICY_SINGLE_ENTITY).
> + *
> + * 2. Kill the entity directly via drm_sched_entity_flush /
> + * drm_sched_entity_fini ensuring all pending and queued jobs are off the
> + * hardware and signaled.
> + */
> +
>   #include <linux/kthread.h>
>   #include <linux/slab.h>
>   #include <linux/completion.h>
