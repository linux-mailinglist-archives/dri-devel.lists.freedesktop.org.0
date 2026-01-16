Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60AD32416
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46D710E8A2;
	Fri, 16 Jan 2026 14:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lI2DWG8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344610E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768572051;
 bh=3eDS3faub+zjDq/eSImYA3ZVGr6/NBgQJtbARkEasVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lI2DWG8bL7/uWn3TsM4wW+0HzKSZa3TF08OXHJbrE90TkVBiiE0tnt2nKZ84jTUPC
 fSbxj44p8gYy4JaMFKMpW+GsnA9AMM6/yjQADLuwrpm/dTud/fhXy37fSGK7LB2slT
 /Up6mGmAgzDNPhXkg9ZU/j+KTdQrKf5c7XA/v+KB8GYva4yg+BmF0oPdp9DfOS4Uq3
 4CwpaLQz465mrE8HXxd9S896LwpoEK5fzZqGmxpHnuze53Bht2NTR2T6/omiuRVW2e
 a/JLK1EDPPYCWnzIoQp/n/m8DpV9qRO0EfgjXIKo7CxGENo5gNOM3LMKO+i75fI3MI
 TAvkNFk7KYxfg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DB5B517E0B8E;
 Fri, 16 Jan 2026 15:00:50 +0100 (CET)
Date: Fri, 16 Jan 2026 15:00:44 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 4/4] drm/panthor: Add gpu_job_irq tracepoint
Message-ID: <20260116150044.0e45c232@fedora>
In-Reply-To: <20260116-panthor-tracepoints-v10-4-d925986e3d1b@collabora.com>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-4-d925986e3d1b@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Fri, 16 Jan 2026 13:57:33 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 13 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_trace.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0e46625f7621..5a904ca64525 100644
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
> +	u64 start = 0;
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
> +	if (tracepoint_enabled(gpu_job_irq) && start) {
> +		if (check_sub_overflow(ktime_get_ns(), start, &duration))
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

