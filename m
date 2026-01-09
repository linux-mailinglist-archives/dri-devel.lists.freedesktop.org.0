Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4FD0B343
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9925310E904;
	Fri,  9 Jan 2026 16:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0AD710E904
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:23:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88A5D497;
 Fri,  9 Jan 2026 08:23:30 -0800 (PST)
Received: from [10.1.36.18] (e122027.cambridge.arm.com [10.1.36.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0AD53F5A1;
 Fri,  9 Jan 2026 08:23:34 -0800 (PST)
Message-ID: <0772b791-85ad-4eb0-8c71-daeae74f0b79@arm.com>
Date: Fri, 9 Jan 2026 16:23:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] drm/panthor: Add gpu_job_irq tracepoint
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
 <20260108-panthor-tracepoints-v7-4-afeae181f74a@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260108-panthor-tracepoints-v7-4-afeae181f74a@collabora.com>
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

On 08/01/2026 14:19, Nicolas Frattaroli wrote:
> Mali's CSF firmware triggers the job IRQ whenever there's new firmware
> events for processing. While this can be a global event (BIT(31) of the
> status register), it's usually an event relating to a command stream
> group (the other bit indices).
> 
> Panthor throws these events onto a workqueue for processing outside the
> IRQ handler. It's therefore useful to have an instrumented tracepoint
> that goes beyond the generic IRQ tracepoint for this specific case, as
> it can be augmented with additional data, namely the events bit mask.
> 
> This can then be used to debug problems relating to GPU jobs events not
> being processed quickly enough. The duration_ns field can be used to
> work backwards from when the tracepoint fires (at the end of the IRQ
> handler) to figure out when the interrupt itself landed, providing not
> just information on how long the work queueing took, but also when the
> actual interrupt itself arrived.
> 
> With this information in hand, the IRQ handler itself being slow can be
> excluded as a possible source of problems, and attention can be directed
> to the workqueue processing instead.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 13 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_trace.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0e46625f7621..b3b48c1b049c 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -26,6 +26,7 @@
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> +#include "panthor_trace.h"
>  
>  #define CSF_FW_NAME "mali_csffw.bin"
>  
> @@ -1060,6 +1061,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  
>  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
> +	u32 duration;
> +	u64 start;
> +
> +	if (tracepoint_enabled(gpu_job_irq))
> +		start = ktime_get_ns();
> +
>  	gpu_write(ptdev, JOB_INT_CLEAR, status);
>  
>  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
> @@ -1072,6 +1079,12 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  		return;
>  
>  	panthor_sched_report_fw_events(ptdev, status);
> +
> +	if (tracepoint_enabled(gpu_job_irq)) {
> +		if (check_sub_overflow(ktime_get_ns(), start, &duration))

It's minor but if the tracepoint was enabled during the handler, the
duration will use start uninitialised. It's probably best to initialise
start just to avoid a potential stack leak.

Thanks,
Steve

> +			duration = U32_MAX;
> +		trace_gpu_job_irq(ptdev->base.dev, status, duration);
> +	}
>  }
>  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> index 5bd420894745..6ffeb4fe6599 100644
> --- a/drivers/gpu/drm/panthor/panthor_trace.h
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -48,6 +48,34 @@ TRACE_EVENT_FN(gpu_power_status,
>  	panthor_hw_power_status_register, panthor_hw_power_status_unregister
>  );
>  
> +/**
> + * gpu_job_irq - called after a job interrupt from firmware completes
> + * @dev: pointer to the &struct device, for printing the device name
> + * @events: bitmask of BIT(CSG id) | BIT(31) for a global event
> + * @duration_ns: Nanoseconds between job IRQ handler entry and exit
> + *
> + * The panthor_job_irq_handler() function instrumented by this tracepoint exits
> + * once it has queued the firmware interrupts for processing, not when the
> + * firmware interrupts are fully processed. This tracepoint allows for debugging
> + * issues with delays in the workqueue's processing of events.
> + */
> +TRACE_EVENT(gpu_job_irq,
> +	TP_PROTO(const struct device *dev, u32 events, u32 duration_ns),
> +	TP_ARGS(dev, events, duration_ns),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__field(u32, events)
> +		__field(u32, duration_ns)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__entry->events		= events;
> +		__entry->duration_ns	= duration_ns;
> +	),
> +	TP_printk("%s: events=0x%x duration_ns=%d", __get_str(dev_name),
> +		  __entry->events, __entry->duration_ns)
> +);
> +
>  #endif /* __PANTHOR_TRACE_H__ */
>  
>  #undef TRACE_INCLUDE_PATH
> 

